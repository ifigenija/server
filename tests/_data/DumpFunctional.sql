--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-14 15:43:26 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 257 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 36405608)
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
-- TOC entry 241 (class 1259 OID 36406234)
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
-- TOC entry 240 (class 1259 OID 36406218)
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
-- TOC entry 183 (class 1259 OID 36405601)
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
-- TOC entry 182 (class 1259 OID 36405599)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3230 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 36406095)
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
-- TOC entry 234 (class 1259 OID 36406125)
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
-- TOC entry 255 (class 1259 OID 36406538)
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
-- TOC entry 212 (class 1259 OID 36405931)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 204 (class 1259 OID 36405850)
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
-- TOC entry 206 (class 1259 OID 36405882)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 36405887)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 36406459)
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
-- TOC entry 195 (class 1259 OID 36405753)
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
-- TOC entry 242 (class 1259 OID 36406247)
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
-- TOC entry 227 (class 1259 OID 36406053)
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
-- TOC entry 201 (class 1259 OID 36405824)
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
-- TOC entry 198 (class 1259 OID 36405793)
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
-- TOC entry 3231 (class 0 OID 0)
-- Dependencies: 198
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 196 (class 1259 OID 36405770)
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
-- TOC entry 216 (class 1259 OID 36405967)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 36406518)
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
-- TOC entry 254 (class 1259 OID 36406531)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 36406553)
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
-- TOC entry 220 (class 1259 OID 36405992)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 193 (class 1259 OID 36405727)
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
-- TOC entry 186 (class 1259 OID 36405627)
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
-- TOC entry 190 (class 1259 OID 36405694)
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
-- TOC entry 187 (class 1259 OID 36405638)
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
-- TOC entry 179 (class 1259 OID 36405573)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 181 (class 1259 OID 36405592)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 36405999)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 36406033)
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
-- TOC entry 237 (class 1259 OID 36406166)
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
-- TOC entry 189 (class 1259 OID 36405674)
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
-- TOC entry 192 (class 1259 OID 36405719)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 36406403)
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
-- TOC entry 217 (class 1259 OID 36405973)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 191 (class 1259 OID 36405704)
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
-- TOC entry 203 (class 1259 OID 36405842)
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
-- TOC entry 199 (class 1259 OID 36405808)
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
-- TOC entry 200 (class 1259 OID 36405817)
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
-- TOC entry 219 (class 1259 OID 36405985)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 36406417)
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
-- TOC entry 246 (class 1259 OID 36406427)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 36406316)
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
-- TOC entry 247 (class 1259 OID 36406435)
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
-- TOC entry 223 (class 1259 OID 36406014)
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
-- TOC entry 215 (class 1259 OID 36405958)
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
-- TOC entry 214 (class 1259 OID 36405948)
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
-- TOC entry 236 (class 1259 OID 36406155)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 36406085)
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
-- TOC entry 197 (class 1259 OID 36405782)
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
-- TOC entry 176 (class 1259 OID 36405544)
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
-- TOC entry 175 (class 1259 OID 36405542)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3232 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 36406027)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 180 (class 1259 OID 36405582)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 178 (class 1259 OID 36405566)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 36406041)
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
-- TOC entry 218 (class 1259 OID 36405979)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 36405902)
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
-- TOC entry 174 (class 1259 OID 36405531)
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
-- TOC entry 173 (class 1259 OID 36405523)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 172 (class 1259 OID 36405518)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 36406102)
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
-- TOC entry 188 (class 1259 OID 36405666)
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
-- TOC entry 211 (class 1259 OID 36405921)
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
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 36405938)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 36406143)
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
-- TOC entry 185 (class 1259 OID 36405617)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 36406447)
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
-- TOC entry 208 (class 1259 OID 36405892)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 194 (class 1259 OID 36405739)
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
-- TOC entry 177 (class 1259 OID 36405553)
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
-- TOC entry 239 (class 1259 OID 36406193)
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
-- TOC entry 210 (class 1259 OID 36405912)
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
-- TOC entry 202 (class 1259 OID 36405835)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 36406006)
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
-- TOC entry 233 (class 1259 OID 36406116)
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
-- TOC entry 251 (class 1259 OID 36406497)
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
-- TOC entry 250 (class 1259 OID 36406466)
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
-- TOC entry 252 (class 1259 OID 36406510)
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
-- TOC entry 229 (class 1259 OID 36406078)
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
-- TOC entry 205 (class 1259 OID 36405876)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 36406183)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 36406068)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 36405604)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 36405547)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3150 (class 0 OID 36405608)
-- Dependencies: 184
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5697-b40a-6f33-cd89debbba69	10	30	Otroci	Abonma za otroke	200
000a0000-5697-b40a-765a-65035d8465c1	20	60	Mladina	Abonma za mladino	400
000a0000-5697-b40a-0db4-62ba2fb2e5fa	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3207 (class 0 OID 36406234)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-5697-b40b-cbba-f5825712d21f	000d0000-5697-b40b-3b0a-b0902094e1f1	\N	00090000-5697-b40b-9aed-643bc5f626ed	000b0000-5697-b40b-03ec-387bb2c48d66	0001	f	\N	\N	\N	3	t	t	t
000c0000-5697-b40b-7632-faf4ae7067a3	000d0000-5697-b40b-7af3-ef0923bc132d	00100000-5697-b40b-d54a-bbe5428567fb	00090000-5697-b40b-c15e-f627b6bf624c	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-5697-b40b-8d28-0314dbe1e43f	000d0000-5697-b40b-d14f-a59589392c62	00100000-5697-b40b-3b9b-80b7cb74602c	00090000-5697-b40b-0f50-9d24a6f4fb2c	\N	0003	t	\N	2016-01-14	\N	2	t	f	f
000c0000-5697-b40b-cb98-16937e0545a2	000d0000-5697-b40b-b090-6a7b506b17ad	\N	00090000-5697-b40b-7ab2-5a63b4ea47b4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-5697-b40b-51d9-cfd62910a27b	000d0000-5697-b40b-90ca-f5554d9d58c5	\N	00090000-5697-b40b-6b59-e7ffae0a7c58	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-5697-b40b-0880-0d6f7af1918d	000d0000-5697-b40b-9f4e-e939c0636205	\N	00090000-5697-b40b-967f-580e0013af77	000b0000-5697-b40b-cacb-efb393bf49d1	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-5697-b40b-ad2c-20fd01d9a262	000d0000-5697-b40b-6d88-400f6b789a3e	00100000-5697-b40b-f50f-bc80ccdb0acb	00090000-5697-b40b-813b-e500fa4a6269	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-5697-b40b-5b62-c54a65454ef9	000d0000-5697-b40b-4e34-2c14804d9789	\N	00090000-5697-b40b-d8b8-6ae465a426fb	000b0000-5697-b40b-f0e0-7e2eeb6b14f9	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-5697-b40b-5be3-ff626b2e31a7	000d0000-5697-b40b-6d88-400f6b789a3e	00100000-5697-b40b-e795-88702d9c75c6	00090000-5697-b40b-e339-1fd9e2457169	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-5697-b40b-9e83-daba1be87cc4	000d0000-5697-b40b-6d88-400f6b789a3e	00100000-5697-b40b-7059-02671db68094	00090000-5697-b40b-53e6-5949a670cc72	\N	0010	t	\N	2016-01-14	\N	16	f	f	t
000c0000-5697-b40b-a3b3-af9fca8f0bc3	000d0000-5697-b40b-6d88-400f6b789a3e	00100000-5697-b40b-c9b1-9a9487f4f959	00090000-5697-b40b-277b-0649b9cfef76	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-5697-b40b-5051-608b19a4ab06	000d0000-5697-b40b-4606-c8d9055a21ec	00100000-5697-b40b-d54a-bbe5428567fb	00090000-5697-b40b-c15e-f627b6bf624c	000b0000-5697-b40b-1d2f-91ba3932379b	0012	t	\N	\N	\N	2	t	t	t
000c0000-5697-b40b-3af5-17e0551ae7a4	000d0000-5697-b40b-7e1a-5122e4773b64	\N	00090000-5697-b40b-d8b8-6ae465a426fb	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-518f-fca724d35003	000d0000-5697-b40b-7e1a-5122e4773b64	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-d463-10cf4b40892c	000d0000-5697-b40b-74f3-6bc476fc0efe	00100000-5697-b40b-3b9b-80b7cb74602c	00090000-5697-b40b-0f50-9d24a6f4fb2c	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-c8eb-68ed031ce518	000d0000-5697-b40b-74f3-6bc476fc0efe	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-a328-700fa6bbdfda	000d0000-5697-b40b-700b-3d6bf16ccc27	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-ab17-b926af391ee7	000d0000-5697-b40b-700b-3d6bf16ccc27	\N	00090000-5697-b40b-d8b8-6ae465a426fb	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-4358-ba35a867ae63	000d0000-5697-b40b-faae-9c5dfe1435d2	00100000-5697-b40b-f50f-bc80ccdb0acb	00090000-5697-b40b-813b-e500fa4a6269	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-d37e-edc979160086	000d0000-5697-b40b-faae-9c5dfe1435d2	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-52bd-33a225517795	000d0000-5697-b40b-37e9-c3ec10b7b4b2	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-7688-64f08f0d5676	000d0000-5697-b40b-37e9-c3ec10b7b4b2	00100000-5697-b40b-f50f-bc80ccdb0acb	00090000-5697-b40b-813b-e500fa4a6269	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-aeeb-3db4be1abf53	000d0000-5697-b40b-d7b1-3c3195747fbd	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-138a-ed27da6a9ee3	000d0000-5697-b40b-2ad4-fd73048d200f	\N	00090000-5697-b40b-d8b8-6ae465a426fb	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-3fd2-4465e787a45f	000d0000-5697-b40b-fb2e-36646684c88e	\N	00090000-5697-b40b-d8b8-6ae465a426fb	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-d413-45633b7f4777	000d0000-5697-b40b-fb2e-36646684c88e	00100000-5697-b40b-3b9b-80b7cb74602c	00090000-5697-b40b-0f50-9d24a6f4fb2c	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-2345-064518b9d63b	000d0000-5697-b40b-1d09-34809089cd2a	\N	00090000-5697-b40b-b39d-914dc3d54c27	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-5697-b40b-0115-1415c91235b3	000d0000-5697-b40b-1d09-34809089cd2a	\N	00090000-5697-b40b-0ee9-f96b84000af8	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-3ce7-73cb5c92415b	000d0000-5697-b40b-db85-1e0a375230ee	\N	00090000-5697-b40b-d8b8-6ae465a426fb	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-5697-b40b-32d5-92985b463127	000d0000-5697-b40b-db85-1e0a375230ee	00100000-5697-b40b-3b9b-80b7cb74602c	00090000-5697-b40b-0f50-9d24a6f4fb2c	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-5697-b40b-a8b1-e138d13a1d5d	000d0000-5697-b40b-db85-1e0a375230ee	\N	00090000-5697-b40b-0ee9-f96b84000af8	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-5697-b40b-d833-c5d38801ab20	000d0000-5697-b40b-db85-1e0a375230ee	\N	00090000-5697-b40b-b39d-914dc3d54c27	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-5697-b40b-e45d-6eeca6caf680	000d0000-5697-b40b-170d-5b1ade80ff07	\N	00090000-5697-b40b-d8b8-6ae465a426fb	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-5697-b40b-2383-6a79ab79b2a9	000d0000-5697-b40b-be00-8ae323e520fc	00100000-5697-b40b-3b9b-80b7cb74602c	00090000-5697-b40b-0f50-9d24a6f4fb2c	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-5697-b40b-350c-0934eb5fc389	000d0000-5697-b40b-be00-8ae323e520fc	\N	00090000-5697-b40b-7706-85cf625f84df	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3206 (class 0 OID 36406218)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 36405601)
-- Dependencies: 183
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3233 (class 0 OID 0)
-- Dependencies: 182
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3197 (class 0 OID 36406095)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5697-b40b-b55a-a566b9dd6a58	00160000-5697-b40a-f100-9da3b0d94cbf	00090000-5697-b40b-0ee9-f96b84000af8	aizv	10	t
003d0000-5697-b40b-d96b-b29e14b70aa2	00160000-5697-b40a-f100-9da3b0d94cbf	00090000-5697-b40b-b235-95c87091b4b5	apri	14	t
003d0000-5697-b40b-7f69-8947f556658f	00160000-5697-b40a-4ecb-56a057798de1	00090000-5697-b40b-b39d-914dc3d54c27	aizv	11	t
003d0000-5697-b40b-066d-9e50f1b16264	00160000-5697-b40a-63c1-814f62158594	00090000-5697-b40b-d351-04734078b053	aizv	12	t
003d0000-5697-b40b-ae41-121bf49400d9	00160000-5697-b40a-f100-9da3b0d94cbf	00090000-5697-b40b-7706-85cf625f84df	apri	18	f
\.


--
-- TOC entry 3200 (class 0 OID 36406125)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5697-b40a-f100-9da3b0d94cbf	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5697-b40a-4ecb-56a057798de1	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5697-b40a-63c1-814f62158594	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3221 (class 0 OID 36406538)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 36405931)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 36405850)
-- Dependencies: 204
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5697-b40b-e59f-a45b9f21058d	\N	\N	00200000-5697-b40b-e444-45aa7e6fdc82	\N	\N	\N	00220000-5697-b40a-21c9-3d314831a0e1	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5697-b40b-49b7-744d01e8c316	\N	\N	00200000-5697-b40b-8d0d-618dbbd2c264	\N	\N	\N	00220000-5697-b40a-21c9-3d314831a0e1	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-5697-b40b-fc3e-36b72626e546	\N	\N	00200000-5697-b40b-c359-86bddda6378a	\N	\N	\N	00220000-5697-b40a-b09c-ff1199eb1fb1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5697-b40b-4b4e-2bb1d8609b0b	\N	\N	00200000-5697-b40b-88f6-3cfe8562943f	\N	\N	\N	00220000-5697-b40a-a859-53bc94c89286	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-5697-b40b-ec44-9f57c5562dc0	\N	\N	00200000-5697-b40b-3e94-25994322f3a8	\N	\N	\N	00220000-5697-b40a-0cef-5b7322cb0d88	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3172 (class 0 OID 36405882)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 36405887)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3215 (class 0 OID 36406459)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 36405753)
-- Dependencies: 195
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5697-b407-a930-a3cded129832	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5697-b407-1faf-374f592a9c37	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5697-b407-c182-b00b94b3c24c	AL	ALB	008	Albania 	Albanija	\N
00040000-5697-b407-e349-f2022651ef6e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5697-b407-1f3d-6174a8a72afb	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5697-b407-b088-65221cdfb37a	AD	AND	020	Andorra 	Andora	\N
00040000-5697-b407-30a2-8c7b40e93f0c	AO	AGO	024	Angola 	Angola	\N
00040000-5697-b407-55e2-21d55f584f59	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5697-b407-dd9a-f8fbed7716c8	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5697-b407-b5c5-748c90395ff5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-b407-a247-c2cefd8abd52	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5697-b407-7729-2d88d3d8c328	AM	ARM	051	Armenia 	Armenija	\N
00040000-5697-b407-1d3b-15cb60396b34	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5697-b407-e89a-c64e16293b3f	AU	AUS	036	Australia 	Avstralija	\N
00040000-5697-b407-45ab-0e5cc029c811	AT	AUT	040	Austria 	Avstrija	\N
00040000-5697-b407-90a3-7d975b53f7c3	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5697-b407-1fb7-bb91fabaa3e4	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5697-b407-d9a9-df3d128dba4e	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5697-b407-eb80-094822135495	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5697-b407-3e3c-4f6bc684c3f7	BB	BRB	052	Barbados 	Barbados	\N
00040000-5697-b407-3c93-b8f5c065c4b9	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5697-b407-6be0-ae3ae9b1c963	BE	BEL	056	Belgium 	Belgija	\N
00040000-5697-b407-e543-32d8abac916b	BZ	BLZ	084	Belize 	Belize	\N
00040000-5697-b407-51d6-d45116df0e85	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5697-b407-f9d0-cc5c4d5ccd59	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5697-b407-ced1-e3b0e0b18d5c	BT	BTN	064	Bhutan 	Butan	\N
00040000-5697-b407-6c8a-5f9e2c7421bc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5697-b407-fdfa-5656c7ec31e9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5697-b407-eb7c-2114ade101e8	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5697-b407-604a-db5fb0022e89	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5697-b407-9803-2a7885f02e49	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5697-b407-3b32-f14e05541146	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5697-b407-d9e8-2c80551521b4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5697-b407-fe56-d45fdfa66476	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5697-b407-0ee6-0ee9b14c737f	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5697-b407-dbb4-0eebb12b4a3e	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5697-b407-1090-6fe091a5f034	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5697-b407-ee59-b7784e6e573d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5697-b407-554a-a33db91a2f0e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5697-b407-6ae5-1c3105bc5bf9	CA	CAN	124	Canada 	Kanada	\N
00040000-5697-b407-6774-5f2366466f1a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5697-b407-525d-256329ddc2ca	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5697-b407-e08d-c04561ff3d0e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5697-b407-262e-3149498936ed	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5697-b407-038d-d15c4d023adb	CL	CHL	152	Chile 	Čile	\N
00040000-5697-b407-3b7a-14f94b9ec447	CN	CHN	156	China 	Kitajska	\N
00040000-5697-b407-3ae1-06a89db52a41	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5697-b407-aa81-fde818578ba7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5697-b407-64d2-97aa410963c4	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5697-b407-981e-32b3edc2f008	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5697-b407-f0fe-0950f12fc023	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5697-b407-6c22-824824d4d07e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5697-b407-0d00-2df80e820e74	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5697-b407-bbb8-3ab71e27f6a5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5697-b407-0321-213246389738	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5697-b407-46ad-3d0d2bd6a443	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5697-b407-ab66-9650342fd66f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5697-b407-b190-251b7f70dde1	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5697-b407-befb-c9e5b7d8ed7a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5697-b407-8a49-f972f26de265	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5697-b407-f410-a2a2ae5f860c	DK	DNK	208	Denmark 	Danska	\N
00040000-5697-b407-d014-111a5407ddcb	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5697-b407-ae53-40b3ce13bcbb	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5697-b407-538b-3a5e1ae820af	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5697-b407-c891-2c62b2bb0d8c	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5697-b407-acbe-7eda5095a8e9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5697-b407-80a9-896df6eb96a6	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5697-b407-92e5-69de5d2e3810	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5697-b407-fd73-9f45511f7ad4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5697-b407-2be5-0887e439dcd9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5697-b407-98ae-371792273cad	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5697-b407-7d51-9f8d1f5ddcbc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5697-b407-2513-9ed51ebc02aa	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5697-b407-6faa-fcc33786904a	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5697-b407-d1d5-f0ef50207ae5	FI	FIN	246	Finland 	Finska	\N
00040000-5697-b407-fa47-fe2811fa16d7	FR	FRA	250	France 	Francija	\N
00040000-5697-b407-8c09-445b3abaa61f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5697-b407-6d57-ff450175aafb	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5697-b407-786c-8132de8550e5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5697-b407-1f1d-d5aff4cf6d09	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5697-b407-4424-af82ed3ce296	GA	GAB	266	Gabon 	Gabon	\N
00040000-5697-b407-116b-6bf31eeba671	GM	GMB	270	Gambia 	Gambija	\N
00040000-5697-b407-5e76-d55c959136c1	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5697-b407-cc0a-2d007a2db296	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5697-b407-473f-c1e09841652f	GH	GHA	288	Ghana 	Gana	\N
00040000-5697-b407-a8d2-149660faaab5	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5697-b407-ae06-768eb4d9e09d	GR	GRC	300	Greece 	Grčija	\N
00040000-5697-b407-cb71-16bbb0ee5c3a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5697-b407-fb63-1e52d3d736d6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5697-b407-5a6e-eb46dfe39b41	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5697-b407-ee01-2966adb1b9d1	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5697-b407-c95b-554a15107cdf	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5697-b407-121e-90ba1c5bb82c	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5697-b407-38d2-53eb516789d7	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5697-b407-e5f1-5284140e0e53	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5697-b407-9b1a-8a6587659b3b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5697-b407-e4b9-e5c01077ed7e	HT	HTI	332	Haiti 	Haiti	\N
00040000-5697-b407-b5a9-7e0d0f88dacd	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5697-b407-eb64-f74e0748a720	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5697-b407-6360-af43cd769681	HN	HND	340	Honduras 	Honduras	\N
00040000-5697-b407-2db3-5c187d1d45b6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5697-b407-cc73-3c880acd6882	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5697-b407-61ab-4dd1d40adf94	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5697-b407-6da3-c099af5e697d	IN	IND	356	India 	Indija	\N
00040000-5697-b407-78f8-151a5f8961a2	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5697-b407-7b1b-0790beb0519f	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5697-b407-f7ae-1fa719d56ca4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5697-b407-8baa-4f7f7020103b	IE	IRL	372	Ireland 	Irska	\N
00040000-5697-b407-6374-b027f2438457	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5697-b407-5a51-2f63c287790c	IL	ISR	376	Israel 	Izrael	\N
00040000-5697-b407-4908-27ca003df08a	IT	ITA	380	Italy 	Italija	\N
00040000-5697-b407-46e5-b0f21733c4f6	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5697-b407-d154-db32429d2c40	JP	JPN	392	Japan 	Japonska	\N
00040000-5697-b407-bf16-fbe802f9b4b0	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5697-b407-7aa6-fed68fc5f4b6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5697-b407-b07f-c4287da0a2bc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5697-b407-33d4-32aa2f35a678	KE	KEN	404	Kenya 	Kenija	\N
00040000-5697-b407-4adb-b196b7b227ba	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5697-b407-e2c1-9d85469ec208	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5697-b407-c0df-62f37f0ad093	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5697-b407-0dee-3d316654a5ed	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5697-b407-71a9-c34c0c68f132	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5697-b407-d285-6bfc55439a3f	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5697-b407-ffd4-70a38c0c96cd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5697-b407-532d-11071a5b0d6b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5697-b407-777f-26efccac9bd6	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5697-b407-c763-a51626ef811a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5697-b407-d8a7-916164a4ffc1	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5697-b407-56e3-6aec4fada291	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5697-b407-5758-27d32adf217a	LT	LTU	440	Lithuania 	Litva	\N
00040000-5697-b407-a93e-7c8c0ce30a2d	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5697-b407-9171-31538d067cd1	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5697-b407-8851-a2841f841fd2	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5697-b407-5d57-5ac491b0e16c	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5697-b407-05f0-add6a3413aa4	MW	MWI	454	Malawi 	Malavi	\N
00040000-5697-b407-cb88-9fae33869237	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5697-b407-5f84-3d20dcd7c653	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5697-b407-3447-0a49d6d0430e	ML	MLI	466	Mali 	Mali	\N
00040000-5697-b407-c26c-543723780458	MT	MLT	470	Malta 	Malta	\N
00040000-5697-b407-9a1b-1e25b0f72714	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5697-b407-5e3e-ff2f7154c72e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5697-b407-c99b-d4d7dec93cff	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5697-b407-78e7-4d651b0757a0	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5697-b407-ebad-4571baaed370	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5697-b407-c0de-95abf7b73137	MX	MEX	484	Mexico 	Mehika	\N
00040000-5697-b407-b028-45f436928dc9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5697-b407-225a-b336e49c38d0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5697-b407-5722-9ba3f64ba019	MC	MCO	492	Monaco 	Monako	\N
00040000-5697-b407-dcd6-ea24254b7b27	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5697-b407-67ef-0368d19ac521	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5697-b407-c645-f501c7ea2762	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5697-b407-79fa-beabd25089d9	MA	MAR	504	Morocco 	Maroko	\N
00040000-5697-b407-d93f-0f71c4dba5bd	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5697-b407-fe81-077fb910e87f	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5697-b407-7b9a-12ce855ef755	NA	NAM	516	Namibia 	Namibija	\N
00040000-5697-b407-587d-b3d317598dd0	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5697-b407-42e2-4a06460d2c43	NP	NPL	524	Nepal 	Nepal	\N
00040000-5697-b407-6b11-659e804ba93b	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5697-b407-0f5e-1e43ab194ef2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5697-b407-f59f-bd0901fc08d4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5697-b407-a9f7-4439e513e950	NE	NER	562	Niger 	Niger 	\N
00040000-5697-b407-18d1-6404e405fc60	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5697-b407-7246-800b7973fda8	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5697-b407-4992-92d06b2d40d9	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5697-b407-8535-d18a3c12bb50	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5697-b407-f07e-b3652896edf1	NO	NOR	578	Norway 	Norveška	\N
00040000-5697-b407-369f-a37d6b8b9f3f	OM	OMN	512	Oman 	Oman	\N
00040000-5697-b407-e539-0d41ea386ad3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5697-b407-c5fe-5a3082ff331a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5697-b407-1e96-476fe0a8b830	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5697-b407-939b-883872df6251	PA	PAN	591	Panama 	Panama	\N
00040000-5697-b407-d570-cab53bb9d257	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5697-b407-731b-883b6fd1f8a4	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5697-b407-c8a7-1ba33489832b	PE	PER	604	Peru 	Peru	\N
00040000-5697-b407-d0c5-21cc8721d5f1	PH	PHL	608	Philippines 	Filipini	\N
00040000-5697-b407-82a4-0169ca50dd7e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5697-b407-be0d-3dc37978a4fb	PL	POL	616	Poland 	Poljska	\N
00040000-5697-b407-1721-ab25e4a19628	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5697-b407-b6cb-e343189b2ea2	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5697-b407-e7cf-1641a00cb985	QA	QAT	634	Qatar 	Katar	\N
00040000-5697-b407-c929-4833b4cdd66d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5697-b407-6d8a-8f8dbb8a1c95	RO	ROU	642	Romania 	Romunija	\N
00040000-5697-b407-850a-30d80e1a6d15	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5697-b407-98e1-897ee4627b50	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5697-b407-7942-118e91b7321a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5697-b407-f550-d3e75babf8d3	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5697-b407-085d-c52b07adee40	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5697-b407-df26-dd2da6490ed0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5697-b407-ec2e-ce1ff45a7472	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5697-b407-bd1b-2f027b50f932	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5697-b407-0374-31d288070032	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5697-b407-ced1-d562ac8b47ce	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5697-b407-5292-b6709e85957f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5697-b407-3d80-5491a82aa98f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5697-b407-9c45-0f528235af70	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5697-b407-5c66-72091ea6ef73	SN	SEN	686	Senegal 	Senegal	\N
00040000-5697-b407-b9d6-9f7b5ddb9c95	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5697-b407-a16f-9b01f5fb2886	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5697-b407-1457-d7cba42c7990	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5697-b407-ea4b-3695c403039b	SG	SGP	702	Singapore 	Singapur	\N
00040000-5697-b407-d258-5e96d94caf41	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5697-b407-dc34-005e98768692	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5697-b407-ba00-bd2d09135d06	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5697-b407-d9ca-53588bc74e15	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5697-b407-7f93-bcd9ee647008	SO	SOM	706	Somalia 	Somalija	\N
00040000-5697-b407-502c-2766ab3e7e0a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5697-b407-c593-d5a7b9d87d2a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5697-b407-d548-5ef2f6728870	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5697-b407-8c28-9f4badcc1140	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5697-b407-ce39-1cf710e3055b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5697-b407-f85e-123fc9fa9c08	SD	SDN	729	Sudan 	Sudan	\N
00040000-5697-b407-ce3f-b2da3d4703d6	SR	SUR	740	Suriname 	Surinam	\N
00040000-5697-b407-45dd-38aa87d13e69	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5697-b407-6cec-aa23efec509c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5697-b407-5ebe-237ad6fd412b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5697-b407-109f-6c9582e6a9d2	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5697-b407-ac94-5d8777906487	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5697-b407-d0d6-df14f88ed15b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5697-b407-578e-db967c6cfb49	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5697-b407-383a-192c0607ba99	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5697-b407-66de-02c89e584a22	TH	THA	764	Thailand 	Tajska	\N
00040000-5697-b407-02bd-74c925cd1a3f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5697-b407-facb-fb0a4dfcad41	TG	TGO	768	Togo 	Togo	\N
00040000-5697-b407-f4a5-a703e2dc1f8e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5697-b407-d0de-925e1b0b3bf8	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5697-b407-75d9-e9bf6c9ff30b	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5697-b407-95f0-429e3b8dea04	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5697-b407-da8f-efe5cf329fc4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5697-b407-3a65-e0ade3e7b553	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5697-b407-4029-4828e8afb995	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-b407-881b-95cb79e5c4a3	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5697-b407-e8e4-ab61e5a9981b	UG	UGA	800	Uganda 	Uganda	\N
00040000-5697-b407-a799-5a83cfdfc451	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5697-b407-2b41-51cc0330aa7c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5697-b407-34f7-851214227fd9	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5697-b407-45ee-fca871f8da9e	US	USA	840	United States 	Združene države Amerike	\N
00040000-5697-b407-10bd-0540ecb90879	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5697-b407-9288-90eb0f13ff47	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5697-b407-f861-8b363d779188	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5697-b407-c3af-e15ecb30a012	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5697-b407-d734-e09e4382e954	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5697-b407-c73d-2930ed65c058	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5697-b407-3e84-5be19b248ca0	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5697-b407-144f-1be6abec635b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5697-b407-6c6c-8f0dc6cee2de	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5697-b407-ff39-c682e5ce2ea9	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5697-b407-cbb7-904f6e45c72d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5697-b407-bac5-92b025866919	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5697-b407-1e9c-4069ef444a7a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3208 (class 0 OID 36406247)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5697-b40b-c7b7-c6e7d62f8b65	000e0000-5697-b40b-8db5-8b5b993d7c9c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-b407-cd27-cd4453752470	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-b40b-bb42-ca68e9e35d41	000e0000-5697-b40b-ee4f-bc0131948d6f	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-b407-a912-b23c12c11c7e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5697-b40b-dff2-ca7cd258c9f9	000e0000-5697-b40b-acd8-41fe44e7e700	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5697-b407-cd27-cd4453752470	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-b40b-751c-63fec0d8ebb0	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5697-b40b-3d96-fe9e6d027551	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3193 (class 0 OID 36406053)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5697-b40b-ee41-a433cf265b41	000e0000-5697-b40b-ee4f-bc0131948d6f	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-5697-b407-8a14-4601c44c59d2
000d0000-5697-b40b-533b-4894bf00d6e4	000e0000-5697-b40b-112b-a2c5c956d064	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-b407-851a-afd85f167150
000d0000-5697-b40b-7b96-8e3b8a64ef2f	000e0000-5697-b40b-112b-a2c5c956d064	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-3b0a-b0902094e1f1	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-cbba-f5825712d21f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-b407-851a-afd85f167150
000d0000-5697-b40b-7af3-ef0923bc132d	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-7632-faf4ae7067a3	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-d14f-a59589392c62	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-8d28-0314dbe1e43f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5697-b407-0af3-4b3fdb3729b8
000d0000-5697-b40b-b090-6a7b506b17ad	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-cb98-16937e0545a2	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5697-b407-8a14-4601c44c59d2
000d0000-5697-b40b-90ca-f5554d9d58c5	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-51d9-cfd62910a27b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5697-b407-8a14-4601c44c59d2
000d0000-5697-b40b-9f4e-e939c0636205	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-0880-0d6f7af1918d	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5697-b407-851a-afd85f167150
000d0000-5697-b40b-6d88-400f6b789a3e	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-5be3-ff626b2e31a7	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5697-b407-851a-afd85f167150
000d0000-5697-b40b-4e34-2c14804d9789	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-5b62-c54a65454ef9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5697-b407-d211-f62e50f1a9ba
000d0000-5697-b40b-4606-c8d9055a21ec	000e0000-5697-b40b-ee4f-bc0131948d6f	000c0000-5697-b40b-5051-608b19a4ab06	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5697-b407-3ae1-399bb14ca65c
000d0000-5697-b40b-7e1a-5122e4773b64	000e0000-5697-b40b-f1d7-199a78fbcf5e	000c0000-5697-b40b-3af5-17e0551ae7a4	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-74f3-6bc476fc0efe	000e0000-5697-b40b-46c8-1b25411e8738	000c0000-5697-b40b-d463-10cf4b40892c	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-700b-3d6bf16ccc27	000e0000-5697-b40b-46c8-1b25411e8738	000c0000-5697-b40b-a328-700fa6bbdfda	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-faae-9c5dfe1435d2	000e0000-5697-b40b-d2db-8abde99254eb	000c0000-5697-b40b-4358-ba35a867ae63	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-37e9-c3ec10b7b4b2	000e0000-5697-b40b-f749-252cacc47a0f	000c0000-5697-b40b-52bd-33a225517795	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-d7b1-3c3195747fbd	000e0000-5697-b40b-118a-4d47e78b50df	000c0000-5697-b40b-aeeb-3db4be1abf53	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-2ad4-fd73048d200f	000e0000-5697-b40b-3900-7f09b07d6720	000c0000-5697-b40b-138a-ed27da6a9ee3	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-fb2e-36646684c88e	000e0000-5697-b40b-bb90-74ef765b4e91	000c0000-5697-b40b-3fd2-4465e787a45f	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-1d09-34809089cd2a	000e0000-5697-b40b-25e8-f2799d7926ed	000c0000-5697-b40b-2345-064518b9d63b	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-db85-1e0a375230ee	000e0000-5697-b40b-25e8-f2799d7926ed	000c0000-5697-b40b-3ce7-73cb5c92415b	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-170d-5b1ade80ff07	000e0000-5697-b40b-8f93-6d5298c1b6b2	000c0000-5697-b40b-e45d-6eeca6caf680	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
000d0000-5697-b40b-be00-8ae323e520fc	000e0000-5697-b40b-8f93-6d5298c1b6b2	000c0000-5697-b40b-2383-6a79ab79b2a9	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-5697-b407-ca58-e83a35a14562
\.


--
-- TOC entry 3167 (class 0 OID 36405824)
-- Dependencies: 201
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 36405793)
-- Dependencies: 198
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 36405770)
-- Dependencies: 196
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5697-b40b-99e4-3a9bc6736e3f	00080000-5697-b40b-0243-0640830b8d08	00090000-5697-b40b-53e6-5949a670cc72	AK		igralka
\.


--
-- TOC entry 3182 (class 0 OID 36405967)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3219 (class 0 OID 36406518)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5697-b40b-494c-43ffddce15c7	00010000-5697-b409-ecab-ed457e29329f	\N	Prva mapa	Root mapa	2016-01-14 15:43:23	2016-01-14 15:43:23	R	\N	\N
\.


--
-- TOC entry 3220 (class 0 OID 36406531)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3222 (class 0 OID 36406553)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 34548309)
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
-- TOC entry 3186 (class 0 OID 36405992)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 36405727)
-- Dependencies: 193
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5697-b409-24a6-4321c1ff4b64	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5697-b409-3adf-33b13c2d3773	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5697-b409-e1aa-9fdee21ece09	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5697-b409-c3e9-53fd88fe8b84	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5697-b409-5538-1481be6d92d5	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5697-b409-7763-137bbbb2a126	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5697-b409-5a7d-b2fd6432306a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5697-b409-dc7a-126060683a54	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-b409-7947-4be2988f2c82	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-5697-b409-37c8-b1e6270c979a	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5697-b409-d746-cfc879e73b16	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5697-b409-c105-4e2b334cf430	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5697-b409-e939-a681cd31a97c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5697-b409-66e7-a59b2cdba505	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5697-b40a-9141-0572d069dd6f	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5697-b40a-c692-959c29f453e5	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5697-b40a-18be-8b5c7fcb50e4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5697-b40a-5fda-fcc2b59f841e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5697-b40a-4400-24202ac60481	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5697-b40d-d837-2f61de004d2d	application.tenant.maticnopodjetje	string	s:36:"00080000-5697-b40d-97b4-6f2b54ea898d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3152 (class 0 OID 36405627)
-- Dependencies: 186
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5697-b40a-9303-b923ef579b37	00000000-5697-b40a-9141-0572d069dd6f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5697-b40a-7431-7dacebb2f26b	00000000-5697-b40a-9141-0572d069dd6f	00010000-5697-b409-ecab-ed457e29329f	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5697-b40a-c9ef-01babe70105d	00000000-5697-b40a-c692-959c29f453e5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3156 (class 0 OID 36405694)
-- Dependencies: 190
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5697-b40b-ff6f-ea418ad2ddc7	\N	00100000-5697-b40b-d54a-bbe5428567fb	00100000-5697-b40b-3b9b-80b7cb74602c	01	Gledališče Nimbis
00410000-5697-b40b-03af-0cab3a2a8246	00410000-5697-b40b-ff6f-ea418ad2ddc7	00100000-5697-b40b-d54a-bbe5428567fb	00100000-5697-b40b-3b9b-80b7cb74602c	02	Tehnika
\.


--
-- TOC entry 3153 (class 0 OID 36405638)
-- Dependencies: 187
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5697-b40b-9aed-643bc5f626ed	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5697-b40b-7ab2-5a63b4ea47b4	00010000-5697-b40a-d8a3-2deb8ae171fe	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5697-b40b-0f50-9d24a6f4fb2c	00010000-5697-b40a-6ec1-ca9c58b95af3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5697-b40b-e339-1fd9e2457169	00010000-5697-b40a-970e-b9a9d712e5ed	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5697-b40b-7806-8537e8c4c098	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5697-b40b-967f-580e0013af77	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5697-b40b-277b-0649b9cfef76	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5697-b40b-813b-e500fa4a6269	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5697-b40b-53e6-5949a670cc72	00010000-5697-b40a-3002-18071caa09ed	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5697-b40b-c15e-f627b6bf624c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5697-b40b-f0e8-e2f2d87bc802	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b40b-6b59-e7ffae0a7c58	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5697-b40b-d8b8-6ae465a426fb	00010000-5697-b40a-0046-5fc1c3f00933	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b40b-0ee9-f96b84000af8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b40b-b235-95c87091b4b5	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b40b-b39d-914dc3d54c27	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b40b-d351-04734078b053	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b40b-7706-85cf625f84df	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5697-b40b-cb2e-94789d6595b0	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b40b-bc6e-734545f250bc	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5697-b40b-acbf-574ed0c347aa	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 36405573)
-- Dependencies: 179
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5697-b408-63c7-f2955b3cd486	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5697-b408-f0e5-a214a66fc5cd	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5697-b408-7810-2a46f50480fc	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5697-b408-2f8e-db3f2d8c89c5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5697-b408-0814-13e0321c183a	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5697-b408-75bb-0b597d9e927a	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5697-b408-feee-6e6c9423841c	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5697-b408-da55-6e2a641ea6b8	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5697-b408-20d2-dd7c0d84be93	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5697-b408-39f0-4e7b86577cf9	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5697-b408-4188-06f76bc76083	Abonma-read	Abonma - branje	t
00030000-5697-b408-1b80-897fda229437	Abonma-write	Abonma - spreminjanje	t
00030000-5697-b408-7bc2-0defe8c00b94	Alternacija-read	Alternacija - branje	t
00030000-5697-b408-5268-ce0b8afa56a5	Alternacija-write	Alternacija - spreminjanje	t
00030000-5697-b408-a1bf-423343245894	Arhivalija-read	Arhivalija - branje	t
00030000-5697-b408-36fd-5e00e24c749b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5697-b408-137c-e43b5269aae9	AuthStorage-read	AuthStorage - branje	t
00030000-5697-b408-e2d8-368ba094165d	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5697-b408-9a20-a3c715d9257c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5697-b408-6796-a98308d3523f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5697-b408-9f51-ea1c3432849f	Besedilo-read	Besedilo - branje	t
00030000-5697-b408-4182-bb49cc6b7d74	Besedilo-write	Besedilo - spreminjanje	t
00030000-5697-b408-8b0c-75bf8a8a7bbc	Dodatek-read	Dodatek - branje	t
00030000-5697-b408-8d6c-55d37c619481	Dodatek-write	Dodatek - spreminjanje	t
00030000-5697-b408-79dd-7af436b47b6c	Dogodek-read	Dogodek - branje	t
00030000-5697-b408-5ed5-246106224a84	Dogodek-write	Dogodek - spreminjanje	t
00030000-5697-b408-74a0-b86fbf6e21f0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5697-b408-f4c3-3fc68ab4ff3a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5697-b408-8406-279abb942c8d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5697-b408-2c1c-44d58a63347a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5697-b408-0224-744f85ddb060	DogodekTrait-read	DogodekTrait - branje	t
00030000-5697-b408-602c-dc6201367b64	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5697-b408-9ba2-ac5e8ad7623c	DrugiVir-read	DrugiVir - branje	t
00030000-5697-b408-2202-a96c2c519f24	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5697-b408-6680-e5f24de35256	Drzava-read	Drzava - branje	t
00030000-5697-b408-402a-e3a4a1eb349e	Drzava-write	Drzava - spreminjanje	t
00030000-5697-b408-0e88-d9e0d2be4c3f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5697-b408-762b-0958cf9333f6	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5697-b408-93a7-6dd6a5aed051	Funkcija-read	Funkcija - branje	t
00030000-5697-b408-1138-df75649968f2	Funkcija-write	Funkcija - spreminjanje	t
00030000-5697-b408-fd9f-3791bc8d6845	Gostovanje-read	Gostovanje - branje	t
00030000-5697-b408-97c9-3bbaeb06a3b8	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5697-b408-ea35-4ffd0c9da106	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5697-b408-52da-697ea599f7bc	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5697-b408-43a6-6c238498214b	Kupec-read	Kupec - branje	t
00030000-5697-b408-d8ca-eca84b4089fa	Kupec-write	Kupec - spreminjanje	t
00030000-5697-b408-5fb8-3c12537c1bb8	NacinPlacina-read	NacinPlacina - branje	t
00030000-5697-b408-bfd1-46f85b4fa2e4	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5697-b408-7d85-334cf6600eab	Option-read	Option - branje	t
00030000-5697-b408-0d3e-df8e8f8c9e6e	Option-write	Option - spreminjanje	t
00030000-5697-b408-616a-33d6142fb209	OptionValue-read	OptionValue - branje	t
00030000-5697-b408-af8b-088ea3cdc149	OptionValue-write	OptionValue - spreminjanje	t
00030000-5697-b408-745c-f793543133c9	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5697-b408-2227-12f5da2d0bc8	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5697-b408-ff6e-01869dff4a36	Oseba-read	Oseba - branje	t
00030000-5697-b408-5f39-3e4187316582	Oseba-write	Oseba - spreminjanje	t
00030000-5697-b408-c331-8389d0416267	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5697-b408-8f11-8c567b885f84	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5697-b408-101e-68847acf0aa8	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5697-b408-5f3a-e9e051137540	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5697-b408-d224-d780fb9c5b00	Pogodba-read	Pogodba - branje	t
00030000-5697-b408-bfa9-d02cc42f4bfe	Pogodba-write	Pogodba - spreminjanje	t
00030000-5697-b408-1e21-36f8bcc4ba1b	Popa-read	Popa - branje	t
00030000-5697-b408-e8a0-a1908c870bf5	Popa-write	Popa - spreminjanje	t
00030000-5697-b408-04b3-432375bb8cf8	Posta-read	Posta - branje	t
00030000-5697-b408-6447-ae98ba0a98b0	Posta-write	Posta - spreminjanje	t
00030000-5697-b408-9689-96a9f1695b82	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5697-b408-5598-d73ad99a6440	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5697-b408-c88c-df28797da699	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5697-b408-fd3d-e9b287cb710a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5697-b408-1e53-991dfd0cc099	PostniNaslov-read	PostniNaslov - branje	t
00030000-5697-b408-47de-59f63ef0e976	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5697-b408-ceb0-de389d869236	Praznik-read	Praznik - branje	t
00030000-5697-b408-b641-79473b3ef00d	Praznik-write	Praznik - spreminjanje	t
00030000-5697-b408-b38c-94faa82c6c0d	Predstava-read	Predstava - branje	t
00030000-5697-b408-ab21-73a0596562d0	Predstava-write	Predstava - spreminjanje	t
00030000-5697-b408-c9f8-2fee8bb01322	Ura-read	Ura - branje	t
00030000-5697-b408-0614-98893b476d8c	Ura-write	Ura - spreminjanje	t
00030000-5697-b408-a976-70444f7e6a6f	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5697-b408-6322-f65a528672c2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5697-b408-caf2-29b191994f71	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5697-b408-0592-702304afedb7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5697-b408-44b4-7c1108cfa0cd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5697-b408-287a-ca70112d84ea	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5697-b408-cf3a-11f8f1045da4	ProgramDela-read	ProgramDela - branje	t
00030000-5697-b408-b953-a1a9f70f61b0	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5697-b408-318e-5207738e2fd8	ProgramFestival-read	ProgramFestival - branje	t
00030000-5697-b408-a02a-291d1f52eed2	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5697-b408-bf18-cdc11824887b	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5697-b408-95b6-07c1367d50f0	Datoteka-write	Datoteka - spreminjanje	t
00030000-5697-b408-9463-db97e4b4b449	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5697-b408-10ab-61135ff93bf0	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5697-b408-abc2-7cf086966f4b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5697-b408-cf8d-bb10dd2486c8	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5697-b408-6cf5-b5998b985e61	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5697-b408-96e5-738b2f337951	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5697-b408-8210-5d266ab802ef	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5697-b408-111c-b53c97f933c6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5697-b408-f208-3e65341a102b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5697-b408-2e49-9906a6ccd387	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5697-b408-59e0-127d86d8bcd2	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5697-b408-e02e-6a1ad69eb7d6	ProgramRazno-read	ProgramRazno - branje	t
00030000-5697-b408-afe6-dc72cb8c6db6	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5697-b408-f6a4-a13b454b08cb	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5697-b408-d54d-99dc97c379be	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5697-b408-09a2-f0fe1c923f99	Prostor-read	Prostor - branje	t
00030000-5697-b408-8ae4-bb45e8bcc991	Prostor-write	Prostor - spreminjanje	t
00030000-5697-b408-9ed2-49ed3f00f744	Racun-read	Racun - branje	t
00030000-5697-b408-3549-0ab399cd5d21	Racun-write	Racun - spreminjanje	t
00030000-5697-b408-d7af-78d5165c055d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5697-b408-4ff6-d94925805594	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5697-b408-fda6-b02bb8fb808b	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5697-b408-1a47-894c7eb05ce0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5697-b408-ddc8-3e19dcb5ba39	Rekvizit-read	Rekvizit - branje	t
00030000-5697-b408-c4bc-32d20b191476	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5697-b408-9665-4fefb4f888a1	Revizija-read	Revizija - branje	t
00030000-5697-b408-e1ca-d6c7d3b60736	Revizija-write	Revizija - spreminjanje	t
00030000-5697-b408-7773-3d881f68c501	Rezervacija-read	Rezervacija - branje	t
00030000-5697-b408-3a75-824666f5176f	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5697-b408-27e8-4b9f4d10c9e0	SedezniRed-read	SedezniRed - branje	t
00030000-5697-b408-282b-13c903f5367d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5697-b408-2196-5f7da7ead262	Sedez-read	Sedez - branje	t
00030000-5697-b408-cd16-8cbddabbced0	Sedez-write	Sedez - spreminjanje	t
00030000-5697-b408-8984-834ff8b1c036	Sezona-read	Sezona - branje	t
00030000-5697-b408-f888-a4565e6b2366	Sezona-write	Sezona - spreminjanje	t
00030000-5697-b408-f5f6-cc1ba53c3b54	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5697-b408-75d9-50ef1004867d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5697-b408-e209-0be3167bbe06	Telefonska-read	Telefonska - branje	t
00030000-5697-b408-416f-3c2681b4154e	Telefonska-write	Telefonska - spreminjanje	t
00030000-5697-b408-7dbc-19b35fa1beee	TerminStoritve-read	TerminStoritve - branje	t
00030000-5697-b408-3ad1-d16e3a1c1db3	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5697-b408-e1e9-dff8bc987fed	TipDodatka-read	TipDodatka - branje	t
00030000-5697-b408-e2ff-8a5a1c247837	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-5697-b408-3269-06fda3c44954	TipFunkcije-read	TipFunkcije - branje	t
00030000-5697-b408-7bfa-0cc08e44a061	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5697-b408-8525-ae3b7b1b0c9f	TipPopa-read	TipPopa - branje	t
00030000-5697-b408-7bd5-3e4368739d22	TipPopa-write	TipPopa - spreminjanje	t
00030000-5697-b408-9664-e01a37faace7	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5697-b408-430f-e5cc2b399ed2	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5697-b408-6469-0784e9eb5fab	TipVaje-read	TipVaje - branje	t
00030000-5697-b408-01ba-846a16777023	TipVaje-write	TipVaje - spreminjanje	t
00030000-5697-b408-9ff9-7d4f7da52885	Trr-read	Trr - branje	t
00030000-5697-b408-4b87-10f0fd5c0fe8	Trr-write	Trr - spreminjanje	t
00030000-5697-b408-5a70-e89312c86f6b	Uprizoritev-read	Uprizoritev - branje	t
00030000-5697-b408-d365-b8f362654a34	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5697-b408-d022-186eb8bf41d8	Vaja-read	Vaja - branje	t
00030000-5697-b408-da90-763587486c30	Vaja-write	Vaja - spreminjanje	t
00030000-5697-b408-9070-5f56deba73d3	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5697-b408-ffc4-53d38ff26e38	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5697-b408-4ac8-74988fde4cbb	VrstaStroska-read	VrstaStroska - branje	t
00030000-5697-b408-9246-f0976568b46a	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5697-b408-4020-3c83374b83f8	Zaposlitev-read	Zaposlitev - branje	t
00030000-5697-b408-7ec7-cf8bbc2e51b5	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5697-b408-4cde-8abdcf5850ea	Zasedenost-read	Zasedenost - branje	t
00030000-5697-b408-cf32-0dec5c9517f5	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5697-b408-14c0-cba88359de13	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5697-b408-9402-6acb8c1b3bcb	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5697-b408-2b11-30f39b88f933	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5697-b408-bddd-b16e0be1c139	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5697-b408-5d63-1e4fb384af2b	Job-read	Branje opravil - samo zase - branje	t
00030000-5697-b408-a3d4-95dfbe59536a	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5697-b408-96d6-7c0624e4b1d2	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5697-b408-5d3e-3502be59b877	Report-read	Report - branje	t
00030000-5697-b408-2f46-1814e457ac1c	Report-write	Report - spreminjanje	t
00030000-5697-b408-f122-88d7ac92d977	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5697-b408-4954-4c5320b3b072	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5697-b408-0036-73a6ee20fa17	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5697-b408-00fc-8c78457c082b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5697-b408-d6e4-3e10a945d1a3	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5697-b408-972c-47d812a4197b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5697-b408-f6f2-d619a18a8ef5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5697-b408-81e1-5c91a79198b8	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-b408-a0a5-05ab1d0424b2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5697-b408-75c8-a12d0ac798f5	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-b408-ed6c-b5e826e9610e	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5697-b408-aafa-0c149de4cd7b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5697-b408-2dd7-1819ce5a8e74	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5697-b408-5213-f953954332ba	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3147 (class 0 OID 36405592)
-- Dependencies: 181
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5697-b408-466f-a8a5722ebead	00030000-5697-b408-f0e5-a214a66fc5cd
00020000-5697-b408-466f-a8a5722ebead	00030000-5697-b408-63c7-f2955b3cd486
00020000-5697-b408-df7d-37b70af05f97	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-5773-523de5c9cc18	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-9f3c-c7cee27e406a	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-9f3c-c7cee27e406a	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-9f3c-c7cee27e406a	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-9f3c-c7cee27e406a	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-9f3c-c7cee27e406a	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-9f3c-c7cee27e406a	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-7ec7-cf8bbc2e51b5
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-6553-92ddf6baa37c	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-9ca0-360ec32500f0	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-9ca0-360ec32500f0	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-9ca0-360ec32500f0	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-453a-8c3cb9215061	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-40ff-f54aa109556d	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-40ff-f54aa109556d	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-40ff-f54aa109556d	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-40ff-f54aa109556d	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-59a1-5accbbe7409b	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-e2f4-9389784d91be	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-e8a0-a1908c870bf5
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-52da-697ea599f7bc
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-287a-ca70112d84ea
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-8795-9fc8f01d2458	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-20c4-ffeff143daf7	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-e7b7-e5e7f9a17131	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-e7b7-e5e7f9a17131	00030000-5697-b408-7bd5-3e4368739d22
00020000-5697-b408-b646-5699dae9f2e9	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-db0e-b3c85fcb8ea0	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-db0e-b3c85fcb8ea0	00030000-5697-b408-6447-ae98ba0a98b0
00020000-5697-b408-6635-d4adc704e982	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-7c2a-1c6e4b8f8dcc	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-7c2a-1c6e4b8f8dcc	00030000-5697-b408-402a-e3a4a1eb349e
00020000-5697-b408-ec47-dcf1987a547a	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-3f7d-f30da0d43a85	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-3f7d-f30da0d43a85	00030000-5697-b408-bddd-b16e0be1c139
00020000-5697-b408-bc28-62484ab045ea	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-6c22-33f6cf301f28	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-6c22-33f6cf301f28	00030000-5697-b408-9402-6acb8c1b3bcb
00020000-5697-b408-740d-0b16c570d1cb	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-51e0-741bf872a2aa	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-51e0-741bf872a2aa	00030000-5697-b408-1b80-897fda229437
00020000-5697-b408-a02f-b90cbd18b135	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-7dcf-e6c08b19b152	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-7dcf-e6c08b19b152	00030000-5697-b408-8ae4-bb45e8bcc991
00020000-5697-b408-7dcf-e6c08b19b152	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-7dcf-e6c08b19b152	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-7dcf-e6c08b19b152	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b408-7dcf-e6c08b19b152	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-976b-9c8214c32d10	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-976b-9c8214c32d10	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-976b-9c8214c32d10	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-d889-da148c6dd4f1	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-d889-da148c6dd4f1	00030000-5697-b408-9246-f0976568b46a
00020000-5697-b408-787c-bd95b512daf0	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-2227-12f5da2d0bc8
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-f7ea-65917f661c1b	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-43b1-62649a26cea2	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-43b1-62649a26cea2	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-43b1-62649a26cea2	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-43b1-62649a26cea2	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-43b1-62649a26cea2	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-0ab8-65e9ba94d61f	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-0ab8-65e9ba94d61f	00030000-5697-b408-01ba-846a16777023
00020000-5697-b408-0ae4-5375c485af44	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-feee-6e6c9423841c
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-da55-6e2a641ea6b8
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-cf3a-11f8f1045da4
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-b953-a1a9f70f61b0
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-318e-5207738e2fd8
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-a02a-291d1f52eed2
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-bf18-cdc11824887b
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-9463-db97e4b4b449
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-10ab-61135ff93bf0
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-abc2-7cf086966f4b
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-cf8d-bb10dd2486c8
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-6cf5-b5998b985e61
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-96e5-738b2f337951
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-8210-5d266ab802ef
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-111c-b53c97f933c6
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-f208-3e65341a102b
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-2e49-9906a6ccd387
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-59e0-127d86d8bcd2
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-e02e-6a1ad69eb7d6
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-afe6-dc72cb8c6db6
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-f6a4-a13b454b08cb
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-d54d-99dc97c379be
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-0592-702304afedb7
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-2202-a96c2c519f24
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-5598-d73ad99a6440
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-a3d4-95dfbe59536a
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-9ba2-ac5e8ad7623c
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-caf2-29b191994f71
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-9689-96a9f1695b82
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-5d63-1e4fb384af2b
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-acad-e405680d8622	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-cf3a-11f8f1045da4
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-318e-5207738e2fd8
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-bf18-cdc11824887b
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-10ab-61135ff93bf0
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-cf8d-bb10dd2486c8
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-96e5-738b2f337951
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-111c-b53c97f933c6
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-2e49-9906a6ccd387
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-e02e-6a1ad69eb7d6
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-f6a4-a13b454b08cb
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-caf2-29b191994f71
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-9ba2-ac5e8ad7623c
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-9689-96a9f1695b82
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-5d63-1e4fb384af2b
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-0038-0d6b0938ef22	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-39f0-4e7b86577cf9
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-8493-250b0f04d98e	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-4f5d-17c6c69f071e	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-d8be-551c5cfd614e	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-bfa9-d02cc42f4bfe
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-9c89-f3b352eaee0d	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-c99f-87b54bff1350	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-5a0d-99c4b4a01e20	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-e9f4-41ce11770268	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-e9f4-41ce11770268	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b408-e9f4-41ce11770268	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-e9f4-41ce11770268	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-578b-90210dbaa3cb	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-578b-90210dbaa3cb	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-9ba2-ac5e8ad7623c
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-2202-a96c2c519f24
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-39f0-4e7b86577cf9
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-5d63-1e4fb384af2b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-a3d4-95dfbe59536a
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-bfa9-d02cc42f4bfe
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-9689-96a9f1695b82
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-5598-d73ad99a6440
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-caf2-29b191994f71
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-0592-702304afedb7
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-feee-6e6c9423841c
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-cf3a-11f8f1045da4
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-da55-6e2a641ea6b8
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-b953-a1a9f70f61b0
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-318e-5207738e2fd8
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-a02a-291d1f52eed2
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-bf18-cdc11824887b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-9463-db97e4b4b449
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-10ab-61135ff93bf0
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-abc2-7cf086966f4b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-cf8d-bb10dd2486c8
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-6cf5-b5998b985e61
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-96e5-738b2f337951
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-8210-5d266ab802ef
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-111c-b53c97f933c6
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-f208-3e65341a102b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-2e49-9906a6ccd387
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-59e0-127d86d8bcd2
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-e02e-6a1ad69eb7d6
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-afe6-dc72cb8c6db6
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-f6a4-a13b454b08cb
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-d54d-99dc97c379be
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-4cb7-b8e599951f0e	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-db8d-b00a6b938af1	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-39f0-4e7b86577cf9
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-6f1d-dc50c1865344	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-9ba2-ac5e8ad7623c
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-2202-a96c2c519f24
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-39f0-4e7b86577cf9
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-5d63-1e4fb384af2b
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-a3d4-95dfbe59536a
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-52da-697ea599f7bc
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-bfa9-d02cc42f4bfe
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-e8a0-a1908c870bf5
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-9689-96a9f1695b82
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-5598-d73ad99a6440
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-caf2-29b191994f71
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-0592-702304afedb7
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-287a-ca70112d84ea
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-feee-6e6c9423841c
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-cf3a-11f8f1045da4
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-da55-6e2a641ea6b8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-b953-a1a9f70f61b0
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-318e-5207738e2fd8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-a02a-291d1f52eed2
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-bf18-cdc11824887b
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-9463-db97e4b4b449
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-10ab-61135ff93bf0
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-abc2-7cf086966f4b
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-cf8d-bb10dd2486c8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-6cf5-b5998b985e61
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-96e5-738b2f337951
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-8210-5d266ab802ef
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-111c-b53c97f933c6
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-f208-3e65341a102b
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-2e49-9906a6ccd387
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-59e0-127d86d8bcd2
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-e02e-6a1ad69eb7d6
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-afe6-dc72cb8c6db6
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-f6a4-a13b454b08cb
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-d54d-99dc97c379be
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-7ec7-cf8bbc2e51b5
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-e382-cad7b4e9f166	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-39f0-4e7b86577cf9
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-52da-697ea599f7bc
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-e8a0-a1908c870bf5
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-287a-ca70112d84ea
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-7ec7-cf8bbc2e51b5
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-3cd9-e8c2b22678dc	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-1138-df75649968f2
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-e886-8ff8b4ca9210	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-5213-f953954332ba
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-9ba2-ac5e8ad7623c
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-2202-a96c2c519f24
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-5d63-1e4fb384af2b
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-a3d4-95dfbe59536a
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-52da-697ea599f7bc
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-745c-f793543133c9
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-2227-12f5da2d0bc8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-bfa9-d02cc42f4bfe
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-e8a0-a1908c870bf5
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-9689-96a9f1695b82
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-5598-d73ad99a6440
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-caf2-29b191994f71
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-0592-702304afedb7
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-287a-ca70112d84ea
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-feee-6e6c9423841c
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-cf3a-11f8f1045da4
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-da55-6e2a641ea6b8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-b953-a1a9f70f61b0
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-318e-5207738e2fd8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-a02a-291d1f52eed2
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-bf18-cdc11824887b
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-9463-db97e4b4b449
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-10ab-61135ff93bf0
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-abc2-7cf086966f4b
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-cf8d-bb10dd2486c8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-6cf5-b5998b985e61
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-96e5-738b2f337951
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-8210-5d266ab802ef
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-111c-b53c97f933c6
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-f208-3e65341a102b
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-2e49-9906a6ccd387
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-59e0-127d86d8bcd2
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-e02e-6a1ad69eb7d6
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-afe6-dc72cb8c6db6
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-f6a4-a13b454b08cb
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-d54d-99dc97c379be
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-9246-f0976568b46a
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-7ec7-cf8bbc2e51b5
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b408-3f90-d05f04cbf7eb	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-63c7-f2955b3cd486
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f0e5-a214a66fc5cd
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4188-06f76bc76083
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-1b80-897fda229437
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-a1bf-423343245894
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-36fd-5e00e24c749b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-137c-e43b5269aae9
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-e2d8-368ba094165d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9a20-a3c715d9257c
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-6796-a98308d3523f
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9f51-ea1c3432849f
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4182-bb49cc6b7d74
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5213-f953954332ba
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-79dd-7af436b47b6c
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2f8e-db3f2d8c89c5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-74a0-b86fbf6e21f0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f4c3-3fc68ab4ff3a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-8406-279abb942c8d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2c1c-44d58a63347a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-0224-744f85ddb060
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-602c-dc6201367b64
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5ed5-246106224a84
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9ba2-ac5e8ad7623c
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2202-a96c2c519f24
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-6680-e5f24de35256
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-402a-e3a4a1eb349e
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-0e88-d9e0d2be4c3f
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-762b-0958cf9333f6
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-39f0-4e7b86577cf9
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-1138-df75649968f2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-fd9f-3791bc8d6845
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-97c9-3bbaeb06a3b8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-96d6-7c0624e4b1d2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5d63-1e4fb384af2b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-a3d4-95dfbe59536a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ea35-4ffd0c9da106
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-52da-697ea599f7bc
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-43a6-6c238498214b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d8ca-eca84b4089fa
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f6f2-d619a18a8ef5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-972c-47d812a4197b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4954-4c5320b3b072
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-0036-73a6ee20fa17
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-00fc-8c78457c082b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d6e4-3e10a945d1a3
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5fb8-3c12537c1bb8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-bfd1-46f85b4fa2e4
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7d85-334cf6600eab
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-616a-33d6142fb209
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-af8b-088ea3cdc149
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-0d3e-df8e8f8c9e6e
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-745c-f793543133c9
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2227-12f5da2d0bc8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-c331-8389d0416267
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-8f11-8c567b885f84
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-101e-68847acf0aa8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5f3a-e9e051137540
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-bfa9-d02cc42f4bfe
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-e8a0-a1908c870bf5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-04b3-432375bb8cf8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9689-96a9f1695b82
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5598-d73ad99a6440
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-c88c-df28797da699
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-fd3d-e9b287cb710a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-6447-ae98ba0a98b0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ceb0-de389d869236
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-b641-79473b3ef00d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-b38c-94faa82c6c0d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ab21-73a0596562d0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-a976-70444f7e6a6f
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-6322-f65a528672c2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-caf2-29b191994f71
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-0592-702304afedb7
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-44b4-7c1108cfa0cd
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-287a-ca70112d84ea
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-feee-6e6c9423841c
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-cf3a-11f8f1045da4
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-da55-6e2a641ea6b8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-b953-a1a9f70f61b0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-318e-5207738e2fd8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-a02a-291d1f52eed2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-bf18-cdc11824887b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9463-db97e4b4b449
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-10ab-61135ff93bf0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-abc2-7cf086966f4b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-cf8d-bb10dd2486c8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-6cf5-b5998b985e61
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-96e5-738b2f337951
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-8210-5d266ab802ef
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-111c-b53c97f933c6
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f208-3e65341a102b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2e49-9906a6ccd387
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-59e0-127d86d8bcd2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-e02e-6a1ad69eb7d6
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-afe6-dc72cb8c6db6
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f6a4-a13b454b08cb
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d54d-99dc97c379be
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-09a2-f0fe1c923f99
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-8ae4-bb45e8bcc991
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9ed2-49ed3f00f744
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-3549-0ab399cd5d21
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d7af-78d5165c055d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4ff6-d94925805594
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-fda6-b02bb8fb808b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-1a47-894c7eb05ce0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ddc8-3e19dcb5ba39
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-c4bc-32d20b191476
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5d3e-3502be59b877
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2f46-1814e457ac1c
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9665-4fefb4f888a1
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-e1ca-d6c7d3b60736
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7773-3d881f68c501
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-3a75-824666f5176f
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-27e8-4b9f4d10c9e0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-282b-13c903f5367d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2196-5f7da7ead262
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-cd16-8cbddabbced0
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-8984-834ff8b1c036
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f888-a4565e6b2366
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f122-88d7ac92d977
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7dbc-19b35fa1beee
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7810-2a46f50480fc
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-3ad1-d16e3a1c1db3
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-3269-06fda3c44954
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7bfa-0cc08e44a061
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-8525-ae3b7b1b0c9f
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7bd5-3e4368739d22
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9664-e01a37faace7
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-430f-e5cc2b399ed2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-6469-0784e9eb5fab
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-01ba-846a16777023
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-d022-186eb8bf41d8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-da90-763587486c30
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9070-5f56deba73d3
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ffc4-53d38ff26e38
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4ac8-74988fde4cbb
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9246-f0976568b46a
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2dd7-1819ce5a8e74
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-aafa-0c149de4cd7b
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-7ec7-cf8bbc2e51b5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-4cde-8abdcf5850ea
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-cf32-0dec5c9517f5
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-14c0-cba88359de13
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-9402-6acb8c1b3bcb
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-2b11-30f39b88f933
00020000-5697-b40a-3ae0-0f2e86038253	00030000-5697-b408-bddd-b16e0be1c139
00020000-5697-b40a-91ec-ef5236723049	00030000-5697-b408-ed6c-b5e826e9610e
00020000-5697-b40a-af32-d18ff1e1b230	00030000-5697-b408-75c8-a12d0ac798f5
00020000-5697-b40a-1bed-4de14a24daa4	00030000-5697-b408-d365-b8f362654a34
00020000-5697-b40a-89b7-34ddf0a73298	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b40a-3600-7fe378f3fed0	00030000-5697-b408-0036-73a6ee20fa17
00020000-5697-b40a-4b69-a0e80cae2513	00030000-5697-b408-00fc-8c78457c082b
00020000-5697-b40a-60c0-f865c7a67064	00030000-5697-b408-d6e4-3e10a945d1a3
00020000-5697-b40a-90f9-eb66de6251b5	00030000-5697-b408-4954-4c5320b3b072
00020000-5697-b40a-96a5-3b7344c6332b	00030000-5697-b408-f6f2-d619a18a8ef5
00020000-5697-b40a-aa54-16f1af8188a0	00030000-5697-b408-972c-47d812a4197b
00020000-5697-b40a-0390-fe95e9280261	00030000-5697-b408-a0a5-05ab1d0424b2
00020000-5697-b40a-2966-bdde7148f469	00030000-5697-b408-81e1-5c91a79198b8
00020000-5697-b40a-cccf-4f118f96cb15	00030000-5697-b408-ff6e-01869dff4a36
00020000-5697-b40a-f416-eef9c0e4c5a6	00030000-5697-b408-5f39-3e4187316582
00020000-5697-b40a-f953-711e6440f9b6	00030000-5697-b408-0814-13e0321c183a
00020000-5697-b40a-3d2f-7166ee543301	00030000-5697-b408-75bb-0b597d9e927a
00020000-5697-b40a-513e-dce37519f4a5	00030000-5697-b408-95b6-07c1367d50f0
00020000-5697-b40a-76fa-2a5a00079c31	00030000-5697-b408-5213-f953954332ba
00020000-5697-b40a-1a37-9dd27bfa4ef7	00030000-5697-b408-1e21-36f8bcc4ba1b
00020000-5697-b40a-1a37-9dd27bfa4ef7	00030000-5697-b408-e8a0-a1908c870bf5
00020000-5697-b40a-1a37-9dd27bfa4ef7	00030000-5697-b408-5a70-e89312c86f6b
00020000-5697-b40a-e707-935bc014be36	00030000-5697-b408-9ff9-7d4f7da52885
00020000-5697-b40a-fbf8-3379a477b08f	00030000-5697-b408-4b87-10f0fd5c0fe8
00020000-5697-b40a-0dff-15fd8c0a0a47	00030000-5697-b408-f122-88d7ac92d977
00020000-5697-b40a-4e7e-3cdebd92ec16	00030000-5697-b408-e209-0be3167bbe06
00020000-5697-b40a-28b1-c409837af44c	00030000-5697-b408-416f-3c2681b4154e
00020000-5697-b40a-b0ea-16069e183afa	00030000-5697-b408-1e53-991dfd0cc099
00020000-5697-b40a-7edd-227ea554a73b	00030000-5697-b408-47de-59f63ef0e976
00020000-5697-b40a-3d72-a3cc7ba7b658	00030000-5697-b408-4020-3c83374b83f8
00020000-5697-b40a-66db-9c474c9b8903	00030000-5697-b408-7ec7-cf8bbc2e51b5
00020000-5697-b40a-9b88-d699e421e75b	00030000-5697-b408-d224-d780fb9c5b00
00020000-5697-b40a-a3d2-a8b40da6f267	00030000-5697-b408-bfa9-d02cc42f4bfe
00020000-5697-b40a-8176-6d189e574096	00030000-5697-b408-f5f6-cc1ba53c3b54
00020000-5697-b40a-f79c-982f190b083e	00030000-5697-b408-75d9-50ef1004867d
00020000-5697-b40a-2f15-777f1f076a2a	00030000-5697-b408-7bc2-0defe8c00b94
00020000-5697-b40a-dd38-f9f7b3b94a13	00030000-5697-b408-5268-ce0b8afa56a5
00020000-5697-b40a-0af6-893bd1aa4e93	00030000-5697-b408-20d2-dd7c0d84be93
00020000-5697-b40a-4f78-60433429d158	00030000-5697-b408-93a7-6dd6a5aed051
00020000-5697-b40a-e671-ff1aaddcd64a	00030000-5697-b408-1138-df75649968f2
00020000-5697-b40a-f287-c41cb9890b09	00030000-5697-b408-39f0-4e7b86577cf9
\.


--
-- TOC entry 3187 (class 0 OID 36405999)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 36406033)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3203 (class 0 OID 36406166)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5697-b40b-03ec-387bb2c48d66	00090000-5697-b40b-9aed-643bc5f626ed	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5697-b40b-cacb-efb393bf49d1	00090000-5697-b40b-967f-580e0013af77	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5697-b40b-f0e0-7e2eeb6b14f9	00090000-5697-b40b-d8b8-6ae465a426fb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5697-b40b-1d2f-91ba3932379b	00090000-5697-b40b-c15e-f627b6bf624c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3155 (class 0 OID 36405674)
-- Dependencies: 189
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5697-b40b-0243-0640830b8d08	\N	00040000-5697-b407-ba00-bd2d09135d06	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-218c-ccd867e11404	\N	00040000-5697-b407-ba00-bd2d09135d06	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5697-b40b-6ec7-2e6fbfcec758	\N	00040000-5697-b407-ba00-bd2d09135d06	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-d4d0-0332fe90a670	\N	00040000-5697-b407-ba00-bd2d09135d06	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-345f-8d4b290c0394	\N	00040000-5697-b407-ba00-bd2d09135d06	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-9447-b79f33eae9ae	\N	00040000-5697-b407-a247-c2cefd8abd52	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-bce3-2496df59bb05	\N	00040000-5697-b407-46ad-3d0d2bd6a443	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-2440-10926ea2d339	\N	00040000-5697-b407-45ab-0e5cc029c811	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40b-007c-464f2b6dddeb	\N	00040000-5697-b407-cc0a-2d007a2db296	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5697-b40d-97b4-6f2b54ea898d	\N	00040000-5697-b407-ba00-bd2d09135d06	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3158 (class 0 OID 36405719)
-- Dependencies: 192
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5697-b407-e9cf-834b60f53347	8341	Adlešiči
00050000-5697-b407-614c-ee2e6a6131d3	5270	Ajdovščina
00050000-5697-b407-e2c3-8b45a21b45bf	6280	Ankaran/Ancarano
00050000-5697-b407-f3b3-3b2300b338b5	9253	Apače
00050000-5697-b407-602a-8508b9700bd1	8253	Artiče
00050000-5697-b407-c1db-805d831ed88a	4275	Begunje na Gorenjskem
00050000-5697-b407-ba63-7c81355d4308	1382	Begunje pri Cerknici
00050000-5697-b407-3c54-7b1e7d321d00	9231	Beltinci
00050000-5697-b407-2ae7-c207adb74647	2234	Benedikt
00050000-5697-b407-8fe7-632ea56a1359	2345	Bistrica ob Dravi
00050000-5697-b407-301f-32681cc8b284	3256	Bistrica ob Sotli
00050000-5697-b407-2837-6b7c03f407bf	8259	Bizeljsko
00050000-5697-b407-0d2f-a1765c4b472e	1223	Blagovica
00050000-5697-b407-2165-7d06b06b4075	8283	Blanca
00050000-5697-b407-3dbf-6ebac19e4338	4260	Bled
00050000-5697-b407-9d66-dd60f36ba1b0	4273	Blejska Dobrava
00050000-5697-b407-3d41-fbb6dcbfd332	9265	Bodonci
00050000-5697-b407-9ea3-40d165d756e3	9222	Bogojina
00050000-5697-b407-800b-c0d0fda4f12a	4263	Bohinjska Bela
00050000-5697-b407-5ef8-05b6b14414c3	4264	Bohinjska Bistrica
00050000-5697-b407-853b-5fc0ef83aafe	4265	Bohinjsko jezero
00050000-5697-b407-fd92-e3354b639efe	1353	Borovnica
00050000-5697-b407-d1fd-e14ff4ef979b	8294	Boštanj
00050000-5697-b407-f1fc-b35b1b578a90	5230	Bovec
00050000-5697-b407-b15b-3e10ee207d65	5295	Branik
00050000-5697-b407-037a-04f49606f88e	3314	Braslovče
00050000-5697-b407-73ac-9bf2ddf0f21b	5223	Breginj
00050000-5697-b407-829d-9a13d1c622f7	8280	Brestanica
00050000-5697-b407-8a97-e8860da380c8	2354	Bresternica
00050000-5697-b407-55a7-df7cf9097b0b	4243	Brezje
00050000-5697-b407-7e77-72b68e3d0d75	1351	Brezovica pri Ljubljani
00050000-5697-b407-e391-c86d64df75fd	8250	Brežice
00050000-5697-b407-e8a2-078ab27be0ad	4210	Brnik - Aerodrom
00050000-5697-b407-b690-f14f9ce53b68	8321	Brusnice
00050000-5697-b407-8751-7de55ff336d1	3255	Buče
00050000-5697-b407-e8f8-90c4f6590b2d	8276	Bučka 
00050000-5697-b407-5e1a-58f931a7b827	9261	Cankova
00050000-5697-b407-f640-abf3a885fe2a	3000	Celje 
00050000-5697-b407-88e2-1b15919142da	3001	Celje - poštni predali
00050000-5697-b407-bc0f-df2f97cf0643	4207	Cerklje na Gorenjskem
00050000-5697-b407-69cd-33a9141aaaf2	8263	Cerklje ob Krki
00050000-5697-b407-7042-10df62f00c77	1380	Cerknica
00050000-5697-b407-9804-1c924d7be9d0	5282	Cerkno
00050000-5697-b407-7d22-e8717ea03365	2236	Cerkvenjak
00050000-5697-b407-e55a-631f02b964fb	2215	Ceršak
00050000-5697-b407-51ac-38cfa6e1f9d6	2326	Cirkovce
00050000-5697-b407-868d-53defc9463d8	2282	Cirkulane
00050000-5697-b407-f463-b809ec9597cb	5273	Col
00050000-5697-b407-6314-374fb5ea7d65	8251	Čatež ob Savi
00050000-5697-b407-35f7-d214437c7c07	1413	Čemšenik
00050000-5697-b407-ae68-b5c42738b0ca	5253	Čepovan
00050000-5697-b407-7079-715b58f75020	9232	Črenšovci
00050000-5697-b407-05c6-a1e967828ebe	2393	Črna na Koroškem
00050000-5697-b407-62fe-80417c993a94	6275	Črni Kal
00050000-5697-b407-9400-6b08380d695c	5274	Črni Vrh nad Idrijo
00050000-5697-b407-d0a1-805450c60d01	5262	Črniče
00050000-5697-b407-ac86-8cf70e999ffa	8340	Črnomelj
00050000-5697-b407-301b-9fad3919175e	6271	Dekani
00050000-5697-b407-f4e7-33fa181f631d	5210	Deskle
00050000-5697-b407-a527-5917e11b396e	2253	Destrnik
00050000-5697-b407-e9ea-8bf30ab4b0e9	6215	Divača
00050000-5697-b407-dba2-9691876def3a	1233	Dob
00050000-5697-b407-bba2-899db7a7ce80	3224	Dobje pri Planini
00050000-5697-b407-bc0f-71a95eb816f2	8257	Dobova
00050000-5697-b407-98c0-3a097246921b	1423	Dobovec
00050000-5697-b407-4940-1e5ca0a9ea8e	5263	Dobravlje
00050000-5697-b407-1b01-03a08a8d7ce6	3204	Dobrna
00050000-5697-b407-1e94-81ba20bbb3f4	8211	Dobrnič
00050000-5697-b407-e4fd-76cfe7d94b59	1356	Dobrova
00050000-5697-b407-31bc-ff106fc4665e	9223	Dobrovnik/Dobronak 
00050000-5697-b407-6d9d-32f48314b766	5212	Dobrovo v Brdih
00050000-5697-b407-73ae-12923f5f5a71	1431	Dol pri Hrastniku
00050000-5697-b407-c540-ae08adeceec9	1262	Dol pri Ljubljani
00050000-5697-b407-2ac1-2ac5120781c2	1273	Dole pri Litiji
00050000-5697-b407-dc55-7f5b5aec3b8b	1331	Dolenja vas
00050000-5697-b407-df4c-9ea91a24034a	8350	Dolenjske Toplice
00050000-5697-b407-5ec9-0f07881ac7e2	1230	Domžale
00050000-5697-b407-5793-6a1463772552	2252	Dornava
00050000-5697-b407-58f5-28dc90160c46	5294	Dornberk
00050000-5697-b407-e39b-7eb7507fb089	1319	Draga
00050000-5697-b407-f50e-c29865bcc09c	8343	Dragatuš
00050000-5697-b407-50ac-1c48961bb391	3222	Dramlje
00050000-5697-b407-24d5-2883a37f85c7	2370	Dravograd
00050000-5697-b407-49ff-dc8c897f8b73	4203	Duplje
00050000-5697-b407-b5ae-1d94fa6fa129	6221	Dutovlje
00050000-5697-b407-8b48-285c1dfd5875	8361	Dvor
00050000-5697-b407-3bad-5bb576f473d9	2343	Fala
00050000-5697-b407-864d-1141637e6cb0	9208	Fokovci
00050000-5697-b407-1770-6d4c2d9362e2	2313	Fram
00050000-5697-b407-c027-ac07bafadf0e	3213	Frankolovo
00050000-5697-b407-5451-7e2ec71c6777	1274	Gabrovka
00050000-5697-b407-57b8-46e84240bbfd	8254	Globoko
00050000-5697-b407-8738-3885198d7254	5275	Godovič
00050000-5697-b407-d69b-ab5f69434380	4204	Golnik
00050000-5697-b407-2b13-b37392f36b66	3303	Gomilsko
00050000-5697-b407-e35a-68408acca3ef	4224	Gorenja vas
00050000-5697-b407-da0f-854afac327ee	3263	Gorica pri Slivnici
00050000-5697-b407-b17a-2329ec8739c0	2272	Gorišnica
00050000-5697-b407-b742-fb8e111ebf5c	9250	Gornja Radgona
00050000-5697-b407-9835-b5cf8894ed29	3342	Gornji Grad
00050000-5697-b407-e799-eda1021c977a	4282	Gozd Martuljek
00050000-5697-b407-8a89-37ddc74b0a78	6272	Gračišče
00050000-5697-b407-429b-c609fdf7b9af	9264	Grad
00050000-5697-b407-8743-3ec4698b2b5d	8332	Gradac
00050000-5697-b407-03b9-8a5bb205c392	1384	Grahovo
00050000-5697-b407-17fa-44a6ba54494d	5242	Grahovo ob Bači
00050000-5697-b407-e3ca-608ee8066956	5251	Grgar
00050000-5697-b407-19a3-4bfbc3e23613	3302	Griže
00050000-5697-b407-3d0d-acbcc2bfc370	3231	Grobelno
00050000-5697-b407-9713-fa1830a3021a	1290	Grosuplje
00050000-5697-b407-a8df-7a7ce0d0f11e	2288	Hajdina
00050000-5697-b407-7363-ae6758d67439	8362	Hinje
00050000-5697-b407-793e-70a988e56d94	2311	Hoče
00050000-5697-b407-273c-87676c77e657	9205	Hodoš/Hodos
00050000-5697-b407-2e96-91cc4b083e8e	1354	Horjul
00050000-5697-b407-4c81-7faeba838fb8	1372	Hotedršica
00050000-5697-b407-1328-591413fd22f1	1430	Hrastnik
00050000-5697-b407-8e7c-3bfb17d74169	6225	Hruševje
00050000-5697-b407-ca14-5517bb9aa05d	4276	Hrušica
00050000-5697-b407-5070-5aa58ffe45c7	5280	Idrija
00050000-5697-b407-b137-df3ad2cce665	1292	Ig
00050000-5697-b407-8507-faeff3530084	6250	Ilirska Bistrica
00050000-5697-b407-1fc1-a0821f601e21	6251	Ilirska Bistrica-Trnovo
00050000-5697-b407-8e5b-f5b222e51dd3	1295	Ivančna Gorica
00050000-5697-b407-48fc-80f67be42f78	2259	Ivanjkovci
00050000-5697-b407-8041-6c7081531137	1411	Izlake
00050000-5697-b407-4d17-cc49dcf5bc18	6310	Izola/Isola
00050000-5697-b407-896b-9ce141f2a7e5	2222	Jakobski Dol
00050000-5697-b407-9527-ddc2adb1767f	2221	Jarenina
00050000-5697-b407-fe90-3166baf84407	6254	Jelšane
00050000-5697-b407-73da-2640422cdabb	4270	Jesenice
00050000-5697-b407-eb8f-1c910e7ff247	8261	Jesenice na Dolenjskem
00050000-5697-b407-e012-426869070d20	3273	Jurklošter
00050000-5697-b407-8562-37059e0eea9f	2223	Jurovski Dol
00050000-5697-b407-2fb1-0bcc6174f936	2256	Juršinci
00050000-5697-b407-d828-77656f5c8c3d	5214	Kal nad Kanalom
00050000-5697-b407-e61f-3c4f539ecd18	3233	Kalobje
00050000-5697-b407-82b8-8b80ae9d7b6a	4246	Kamna Gorica
00050000-5697-b407-318b-107a8f68ad8e	2351	Kamnica
00050000-5697-b407-d39d-873ce67959ad	1241	Kamnik
00050000-5697-b407-32b2-949d32795d84	5213	Kanal
00050000-5697-b407-74fa-3d16f117241e	8258	Kapele
00050000-5697-b407-c02f-4dc4470cbe4e	2362	Kapla
00050000-5697-b407-ce22-b8ea23cffe92	2325	Kidričevo
00050000-5697-b407-5293-8d57ba2819ef	1412	Kisovec
00050000-5697-b407-4b67-af2e13e76933	6253	Knežak
00050000-5697-b407-e68a-4885706a77be	5222	Kobarid
00050000-5697-b407-de69-e713d610b5e9	9227	Kobilje
00050000-5697-b407-4478-059fb376b761	1330	Kočevje
00050000-5697-b407-d74e-311b38ab2645	1338	Kočevska Reka
00050000-5697-b407-8d18-758a7108ee5b	2276	Kog
00050000-5697-b407-d368-d588ae71481e	5211	Kojsko
00050000-5697-b407-b924-51f9a17509e8	6223	Komen
00050000-5697-b407-e89f-d328631604fd	1218	Komenda
00050000-5697-b407-2779-548b32bf8041	6000	Koper/Capodistria 
00050000-5697-b407-579e-4fab7b6860a5	6001	Koper/Capodistria - poštni predali
00050000-5697-b407-ed91-71e5070e6d6a	8282	Koprivnica
00050000-5697-b407-6800-f07e86ff7262	5296	Kostanjevica na Krasu
00050000-5697-b407-9df7-386c43154348	8311	Kostanjevica na Krki
00050000-5697-b407-dcb3-f1e06bee80a7	1336	Kostel
00050000-5697-b407-72ee-a75c48f01210	6256	Košana
00050000-5697-b407-99a5-1a43907504ce	2394	Kotlje
00050000-5697-b407-fd05-97f7832ebf92	6240	Kozina
00050000-5697-b407-2dc8-4b2b2b1edb26	3260	Kozje
00050000-5697-b407-d30d-8f2e3797e6f7	4000	Kranj 
00050000-5697-b407-6eae-4960c2256f69	4001	Kranj - poštni predali
00050000-5697-b407-1a0b-7f040eb0ea4f	4280	Kranjska Gora
00050000-5697-b407-72ea-8a26db524461	1281	Kresnice
00050000-5697-b407-977c-c735a40b2a60	4294	Križe
00050000-5697-b407-6c1c-8579884164c2	9206	Križevci
00050000-5697-b407-f8b3-47190f4f6206	9242	Križevci pri Ljutomeru
00050000-5697-b407-d6f6-b3f82c843779	1301	Krka
00050000-5697-b407-a77e-9e8101716f62	8296	Krmelj
00050000-5697-b407-185a-585d3bdc52c2	4245	Kropa
00050000-5697-b407-c6af-051120f7e620	8262	Krška vas
00050000-5697-b407-85ea-97880de02cdb	8270	Krško
00050000-5697-b407-b0fa-a66a7a5b4d1d	9263	Kuzma
00050000-5697-b407-ad78-2679ad456fac	2318	Laporje
00050000-5697-b407-4a9d-aaeb3b5a47f7	3270	Laško
00050000-5697-b407-d355-a83dbb3f65ce	1219	Laze v Tuhinju
00050000-5697-b407-4951-c126593050de	2230	Lenart v Slovenskih goricah
00050000-5697-b407-a341-649af06a577b	9220	Lendava/Lendva
00050000-5697-b407-5fa5-a1c341c6b8cb	4248	Lesce
00050000-5697-b407-0e00-b14dbc417d32	3261	Lesično
00050000-5697-b407-7e50-8161f6a2d635	8273	Leskovec pri Krškem
00050000-5697-b407-7bfe-9c1af40bd4b6	2372	Libeliče
00050000-5697-b407-cfae-8042dd64a8cb	2341	Limbuš
00050000-5697-b407-25f0-61a3b367996b	1270	Litija
00050000-5697-b407-af53-a86742a27208	3202	Ljubečna
00050000-5697-b407-04fb-4e1eda8fb8c3	1000	Ljubljana 
00050000-5697-b407-4fb4-06b3e8666e40	1001	Ljubljana - poštni predali
00050000-5697-b407-02d8-0309e7461d41	1231	Ljubljana - Črnuče
00050000-5697-b407-7572-31ba2fbe3dc2	1261	Ljubljana - Dobrunje
00050000-5697-b407-d83b-93b54ef8f8e6	1260	Ljubljana - Polje
00050000-5697-b407-0ad5-81c797838f3d	1210	Ljubljana - Šentvid
00050000-5697-b407-85b2-1f47a51d25a2	1211	Ljubljana - Šmartno
00050000-5697-b407-fdf6-8df57914431f	3333	Ljubno ob Savinji
00050000-5697-b407-6be7-33893326397c	9240	Ljutomer
00050000-5697-b407-eb49-7929516df159	3215	Loče
00050000-5697-b407-de10-b1d45b799ced	5231	Log pod Mangartom
00050000-5697-b407-677a-7411c7d46cea	1358	Log pri Brezovici
00050000-5697-b407-6895-a141fbbb8fde	1370	Logatec
00050000-5697-b407-28c9-570077f269cc	1371	Logatec
00050000-5697-b407-1103-e8f257d496da	1434	Loka pri Zidanem Mostu
00050000-5697-b407-fed2-ba2c39bfbb8e	3223	Loka pri Žusmu
00050000-5697-b407-b4b3-d0403531e6b4	6219	Lokev
00050000-5697-b407-cae1-66b7ee86ba3d	1318	Loški Potok
00050000-5697-b407-2728-04d78c122582	2324	Lovrenc na Dravskem polju
00050000-5697-b407-294b-92bf0af34f2f	2344	Lovrenc na Pohorju
00050000-5697-b407-a38f-714e14d94ba4	3334	Luče
00050000-5697-b407-a4c8-6bb455a568be	1225	Lukovica
00050000-5697-b407-8266-031afba50355	9202	Mačkovci
00050000-5697-b407-d6c5-e59cadb0d7c4	2322	Majšperk
00050000-5697-b407-aad4-350bb08e7a5f	2321	Makole
00050000-5697-b407-c37e-a975aac1bbf6	9243	Mala Nedelja
00050000-5697-b407-df0f-88985665c1c0	2229	Malečnik
00050000-5697-b407-a9cf-e6c5f2eaa887	6273	Marezige
00050000-5697-b407-ff45-fd9cf9a8d239	2000	Maribor 
00050000-5697-b407-a356-83cdb01f010a	2001	Maribor - poštni predali
00050000-5697-b407-853d-9c63a86ebd73	2206	Marjeta na Dravskem polju
00050000-5697-b407-f5fe-cd84ca22de27	2281	Markovci
00050000-5697-b407-0891-4a16f43c2084	9221	Martjanci
00050000-5697-b407-9e01-724f46f23664	6242	Materija
00050000-5697-b407-84ef-df7ab64fb1d1	4211	Mavčiče
00050000-5697-b407-a465-61b315c3c484	1215	Medvode
00050000-5697-b407-5ae2-d3270392990e	1234	Mengeš
00050000-5697-b407-587f-dc873a35a9c6	8330	Metlika
00050000-5697-b407-f8c1-9edd81b7913b	2392	Mežica
00050000-5697-b407-eed6-db963f709285	2204	Miklavž na Dravskem polju
00050000-5697-b407-f85d-0247c018b01d	2275	Miklavž pri Ormožu
00050000-5697-b407-1fd4-77026aeaa3b6	5291	Miren
00050000-5697-b407-84d9-be03890c0dd3	8233	Mirna
00050000-5697-b407-aced-4500cebe33e4	8216	Mirna Peč
00050000-5697-b407-5c98-174324802d69	2382	Mislinja
00050000-5697-b407-0e48-adc2a651fab4	4281	Mojstrana
00050000-5697-b407-e28d-00dc6b608acb	8230	Mokronog
00050000-5697-b407-56db-9d378fac2819	1251	Moravče
00050000-5697-b407-764e-9429861a004f	9226	Moravske Toplice
00050000-5697-b407-e862-8369d3d1ee56	5216	Most na Soči
00050000-5697-b407-5650-63ae91ee0f6b	1221	Motnik
00050000-5697-b407-e991-e547478519d6	3330	Mozirje
00050000-5697-b407-b469-09d3104d36fa	9000	Murska Sobota 
00050000-5697-b407-5a11-bc9013e5699d	9001	Murska Sobota - poštni predali
00050000-5697-b407-7799-0eb0e7e4d2a4	2366	Muta
00050000-5697-b407-023a-1c9add6659b8	4202	Naklo
00050000-5697-b407-7152-398ea2bd83df	3331	Nazarje
00050000-5697-b407-70c1-cbfc198f48c5	1357	Notranje Gorice
00050000-5697-b407-ca18-284426acfeaa	3203	Nova Cerkev
00050000-5697-b407-158d-4034afef8d85	5000	Nova Gorica 
00050000-5697-b407-b80b-d85bb735156d	5001	Nova Gorica - poštni predali
00050000-5697-b407-3494-95e0277c91dc	1385	Nova vas
00050000-5697-b407-e9f1-28c036061f7f	8000	Novo mesto
00050000-5697-b407-54fa-7fc88c8686c8	8001	Novo mesto - poštni predali
00050000-5697-b407-1a4a-378fec2c7be6	6243	Obrov
00050000-5697-b407-e2e3-0e7d9a53ee2f	9233	Odranci
00050000-5697-b407-505a-a1e08829803f	2317	Oplotnica
00050000-5697-b407-47bc-b1b1087def9a	2312	Orehova vas
00050000-5697-b407-ba4b-4aad531e9766	2270	Ormož
00050000-5697-b407-46d1-0382543b385e	1316	Ortnek
00050000-5697-b407-3eee-39b4bd3cc12c	1337	Osilnica
00050000-5697-b407-fc37-282f6b434067	8222	Otočec
00050000-5697-b407-a639-d909a780b312	2361	Ožbalt
00050000-5697-b407-c5de-950b855bf575	2231	Pernica
00050000-5697-b407-afb3-75b0122e3a75	2211	Pesnica pri Mariboru
00050000-5697-b407-c2b6-5f5c07161dd1	9203	Petrovci
00050000-5697-b407-4e3c-ad9ab1a9cabd	3301	Petrovče
00050000-5697-b407-12de-338798fce915	6330	Piran/Pirano
00050000-5697-b407-597c-725eb83885e4	8255	Pišece
00050000-5697-b407-156c-3c44ef4a394b	6257	Pivka
00050000-5697-b407-a31a-e89b2b75fce4	6232	Planina
00050000-5697-b407-d017-592ebcbfe40c	3225	Planina pri Sevnici
00050000-5697-b407-b69e-72c540956146	6276	Pobegi
00050000-5697-b407-30ad-75b86a3ce616	8312	Podbočje
00050000-5697-b407-65df-c645b4c5900d	5243	Podbrdo
00050000-5697-b407-86f1-6c0ffcb8ff45	3254	Podčetrtek
00050000-5697-b407-40ed-88e529b05ec4	2273	Podgorci
00050000-5697-b407-45c6-d00053692eba	6216	Podgorje
00050000-5697-b407-b629-7992516bb4f7	2381	Podgorje pri Slovenj Gradcu
00050000-5697-b407-8e04-abefa64532d8	6244	Podgrad
00050000-5697-b407-2c11-bbf71010ee2c	1414	Podkum
00050000-5697-b407-394f-d2efa1280112	2286	Podlehnik
00050000-5697-b407-2812-b8d1d8678e5f	5272	Podnanos
00050000-5697-b407-6766-0326c8411bf3	4244	Podnart
00050000-5697-b407-60ff-9e50c56a6a3e	3241	Podplat
00050000-5697-b407-6709-b202bf6b6c1b	3257	Podsreda
00050000-5697-b407-afb5-6ba24fecefdd	2363	Podvelka
00050000-5697-b407-95e7-8d6a4582b53f	2208	Pohorje
00050000-5697-b407-4686-2e22b282bd1e	2257	Polenšak
00050000-5697-b407-e637-e65fc7b70e69	1355	Polhov Gradec
00050000-5697-b407-1860-d917b3e00b32	4223	Poljane nad Škofjo Loko
00050000-5697-b407-f23f-82214525d8b2	2319	Poljčane
00050000-5697-b407-59c5-eaf13e3e797d	1272	Polšnik
00050000-5697-b407-745d-5dd1042c0117	3313	Polzela
00050000-5697-b407-9a18-672af517c9b9	3232	Ponikva
00050000-5697-b407-b1f0-9176692e52bb	6320	Portorož/Portorose
00050000-5697-b407-3946-fb55897aaa59	6230	Postojna
00050000-5697-b407-46b7-4b6808550748	2331	Pragersko
00050000-5697-b407-6227-713f9db95662	3312	Prebold
00050000-5697-b407-8289-9104c2facace	4205	Preddvor
00050000-5697-b407-b424-b5f0bff416f8	6255	Prem
00050000-5697-b407-d6ba-cdbb3d319d11	1352	Preserje
00050000-5697-b407-aa2d-09b4924d9e47	6258	Prestranek
00050000-5697-b407-2c09-8eff967be110	2391	Prevalje
00050000-5697-b407-db54-0db26d917504	3262	Prevorje
00050000-5697-b407-21b2-79ed9a434e40	1276	Primskovo 
00050000-5697-b407-b1f2-70900b1d0f94	3253	Pristava pri Mestinju
00050000-5697-b407-99e1-241f1fb221bc	9207	Prosenjakovci/Partosfalva
00050000-5697-b407-cc3c-52e5a19ff1ef	5297	Prvačina
00050000-5697-b407-a068-459eb42c3867	2250	Ptuj
00050000-5697-b407-89e5-b23c56d72f13	2323	Ptujska Gora
00050000-5697-b407-5db3-fe6e4e560ca8	9201	Puconci
00050000-5697-b407-1575-a21df40c19c4	2327	Rače
00050000-5697-b407-0fa4-c24d41350db9	1433	Radeče
00050000-5697-b407-d1d6-d7699930a054	9252	Radenci
00050000-5697-b407-f99b-8dca82b877b7	2360	Radlje ob Dravi
00050000-5697-b407-26ed-6d0f087677c3	1235	Radomlje
00050000-5697-b407-38f3-e6f99c34704f	4240	Radovljica
00050000-5697-b407-7fae-921ee9699562	8274	Raka
00050000-5697-b407-d533-fe2c9b3ae434	1381	Rakek
00050000-5697-b407-1f3f-b3762f356f26	4283	Rateče - Planica
00050000-5697-b407-385a-383076e237a3	2390	Ravne na Koroškem
00050000-5697-b407-4d0e-372bd2c22f5a	9246	Razkrižje
00050000-5697-b407-0704-6910cba90730	3332	Rečica ob Savinji
00050000-5697-b407-bb02-c8c9ec12531a	5292	Renče
00050000-5697-b407-c563-7855271cefb2	1310	Ribnica
00050000-5697-b407-d183-3a2a8f812838	2364	Ribnica na Pohorju
00050000-5697-b407-87c7-8a9a599328f8	3272	Rimske Toplice
00050000-5697-b407-2f6d-f63f4a30992d	1314	Rob
00050000-5697-b407-4252-6f57523e9d36	5215	Ročinj
00050000-5697-b407-0b02-8bb4bbe403e3	3250	Rogaška Slatina
00050000-5697-b407-ec26-6648d4f18bb3	9262	Rogašovci
00050000-5697-b407-4fd6-0055135aad71	3252	Rogatec
00050000-5697-b407-56c4-6988c64c740a	1373	Rovte
00050000-5697-b407-9b4e-9745c27cbef7	2342	Ruše
00050000-5697-b407-a40a-f15694d76419	1282	Sava
00050000-5697-b407-41b6-3d94ec97ad22	6333	Sečovlje/Sicciole
00050000-5697-b407-9724-eb61d1a50126	4227	Selca
00050000-5697-b407-d646-62cffd266824	2352	Selnica ob Dravi
00050000-5697-b407-48b5-4556f05719da	8333	Semič
00050000-5697-b407-7f6e-8b5ab280c2e9	8281	Senovo
00050000-5697-b407-0729-5f2cd1bced12	6224	Senožeče
00050000-5697-b407-e819-b368727af336	8290	Sevnica
00050000-5697-b407-97ec-f1244ee659d1	6210	Sežana
00050000-5697-b407-cb51-5d51fa6d3dd4	2214	Sladki Vrh
00050000-5697-b407-a1ec-17e34360c380	5283	Slap ob Idrijci
00050000-5697-b407-2ee9-915acf6fa21e	2380	Slovenj Gradec
00050000-5697-b407-6407-ce2b83dffefa	2310	Slovenska Bistrica
00050000-5697-b407-b572-0e0792b75fa3	3210	Slovenske Konjice
00050000-5697-b407-450d-2270827c872a	1216	Smlednik
00050000-5697-b407-e327-8c77d944a89e	5232	Soča
00050000-5697-b407-61d6-f9f7235d82e6	1317	Sodražica
00050000-5697-b407-dd02-61acc462ca8a	3335	Solčava
00050000-5697-b407-3ee7-121bc102220f	5250	Solkan
00050000-5697-b407-09e8-f6fb20029f3d	4229	Sorica
00050000-5697-b407-ae53-ab6580b952de	4225	Sovodenj
00050000-5697-b407-6b69-556841bc99cc	5281	Spodnja Idrija
00050000-5697-b407-71e6-d018103d419d	2241	Spodnji Duplek
00050000-5697-b407-0a28-9d4508eb4812	9245	Spodnji Ivanjci
00050000-5697-b407-61a9-e2b7b7c98125	2277	Središče ob Dravi
00050000-5697-b407-8d11-77304ce355d8	4267	Srednja vas v Bohinju
00050000-5697-b407-58d9-2c99207cad4f	8256	Sromlje 
00050000-5697-b407-7664-b9b777badffa	5224	Srpenica
00050000-5697-b407-a8b7-72ea14636f88	1242	Stahovica
00050000-5697-b407-b274-e127a941bc40	1332	Stara Cerkev
00050000-5697-b407-bb9a-d63e0a0f33dd	8342	Stari trg ob Kolpi
00050000-5697-b407-7ae4-d79f919b9689	1386	Stari trg pri Ložu
00050000-5697-b407-1b37-47301f2c90c0	2205	Starše
00050000-5697-b407-bb42-1ba07f860663	2289	Stoperce
00050000-5697-b407-09dc-ff8986091765	8322	Stopiče
00050000-5697-b407-2422-a173b5ca24e0	3206	Stranice
00050000-5697-b407-997e-b41f01c4c80d	8351	Straža
00050000-5697-b407-0d98-6f64534fe20b	1313	Struge
00050000-5697-b407-f2d0-f43478e12874	8293	Studenec
00050000-5697-b407-d664-a5f98bc02097	8331	Suhor
00050000-5697-b407-2a96-f709b1e2fe7c	2233	Sv. Ana v Slovenskih goricah
00050000-5697-b407-8cdb-5739133fbb41	2235	Sv. Trojica v Slovenskih goricah
00050000-5697-b407-ddd4-2553334c0a6e	2353	Sveti Duh na Ostrem Vrhu
00050000-5697-b407-f55d-633da2d7297c	9244	Sveti Jurij ob Ščavnici
00050000-5697-b407-48ab-f6bafc7cce90	3264	Sveti Štefan
00050000-5697-b407-a82b-3e42a4ab0dc4	2258	Sveti Tomaž
00050000-5697-b407-c076-1ed2b410226c	9204	Šalovci
00050000-5697-b407-0ec9-b57d292a1df7	5261	Šempas
00050000-5697-b407-321c-f1c7178ea89e	5290	Šempeter pri Gorici
00050000-5697-b407-6985-9690b6393cbb	3311	Šempeter v Savinjski dolini
00050000-5697-b407-02f7-1ce444eb0deb	4208	Šenčur
00050000-5697-b407-21ba-ad193edcf3aa	2212	Šentilj v Slovenskih goricah
00050000-5697-b407-762f-7bfcc1dbe241	8297	Šentjanž
00050000-5697-b407-efd3-b6603a05ae8b	2373	Šentjanž pri Dravogradu
00050000-5697-b407-972b-f1fbea9d9467	8310	Šentjernej
00050000-5697-b407-f750-30620b3173d3	3230	Šentjur
00050000-5697-b407-4a3a-3efe2bab5928	3271	Šentrupert
00050000-5697-b407-034c-50066b7e93d6	8232	Šentrupert
00050000-5697-b407-a6b7-417289b8fbd1	1296	Šentvid pri Stični
00050000-5697-b407-e2f3-ebf04dfdd8ef	8275	Škocjan
00050000-5697-b407-38a5-2cc5d785c83e	6281	Škofije
00050000-5697-b407-2535-b1402b4d3744	4220	Škofja Loka
00050000-5697-b407-30cf-0f61a80ec576	3211	Škofja vas
00050000-5697-b407-7f55-062c2f435023	1291	Škofljica
00050000-5697-b407-10ad-db20d1eb7d26	6274	Šmarje
00050000-5697-b407-9380-c79c8b1a7560	1293	Šmarje - Sap
00050000-5697-b407-8d22-62ecfa70c0c4	3240	Šmarje pri Jelšah
00050000-5697-b407-7a05-44a7f239a186	8220	Šmarješke Toplice
00050000-5697-b407-1980-b608b07a6dd5	2315	Šmartno na Pohorju
00050000-5697-b407-c34d-e1fc64d5afa9	3341	Šmartno ob Dreti
00050000-5697-b407-9a5f-d9ab4e0e5dc3	3327	Šmartno ob Paki
00050000-5697-b407-8594-a2614529b75f	1275	Šmartno pri Litiji
00050000-5697-b407-a6a3-25e389a248aa	2383	Šmartno pri Slovenj Gradcu
00050000-5697-b407-4cc6-d212b130ece6	3201	Šmartno v Rožni dolini
00050000-5697-b407-0cd6-ef7569be45fc	3325	Šoštanj
00050000-5697-b407-6a8a-86dcd3a83abb	6222	Štanjel
00050000-5697-b407-6360-c27d0f162918	3220	Štore
00050000-5697-b407-366f-088005356651	3304	Tabor
00050000-5697-b407-4753-661f19bfa1ab	3221	Teharje
00050000-5697-b407-e9f9-40d441f0c91e	9251	Tišina
00050000-5697-b407-b827-b908e014dfab	5220	Tolmin
00050000-5697-b407-cca7-0722a016e811	3326	Topolšica
00050000-5697-b407-5228-0d2edc540df5	2371	Trbonje
00050000-5697-b407-f6be-23c9202da5e0	1420	Trbovlje
00050000-5697-b407-a0c2-d34e9c83dee3	8231	Trebelno 
00050000-5697-b407-aa57-82d59a5f72e8	8210	Trebnje
00050000-5697-b407-5f1a-f2fff3eaf719	5252	Trnovo pri Gorici
00050000-5697-b407-4ffa-e5c76fcb768a	2254	Trnovska vas
00050000-5697-b407-0194-f107b6efabbe	1222	Trojane
00050000-5697-b407-1ea4-b49c6652b6c8	1236	Trzin
00050000-5697-b407-808c-8c17f20512f5	4290	Tržič
00050000-5697-b407-83dd-12ab4c17b285	8295	Tržišče
00050000-5697-b407-a6f9-2398a4506be7	1311	Turjak
00050000-5697-b407-f63c-e2d65cbd4654	9224	Turnišče
00050000-5697-b407-629d-7c1cae386ede	8323	Uršna sela
00050000-5697-b407-b047-c08170699c48	1252	Vače
00050000-5697-b407-5805-0197c55e5633	3320	Velenje 
00050000-5697-b407-eda3-0e3abd12e79b	3322	Velenje - poštni predali
00050000-5697-b407-b504-d99d3fdee9bc	8212	Velika Loka
00050000-5697-b407-8dc2-c01a783bd09d	2274	Velika Nedelja
00050000-5697-b407-71e6-ba5ca7d64b60	9225	Velika Polana
00050000-5697-b407-59ad-032eac78d647	1315	Velike Lašče
00050000-5697-b407-6b5b-432f7e43dfb0	8213	Veliki Gaber
00050000-5697-b407-ba5b-cb203fff0cbc	9241	Veržej
00050000-5697-b407-2b23-386e01ea6908	1312	Videm - Dobrepolje
00050000-5697-b407-a63a-ac4301e9dc74	2284	Videm pri Ptuju
00050000-5697-b407-03b5-3ec479b63c18	8344	Vinica
00050000-5697-b407-390f-4674eb1ea2de	5271	Vipava
00050000-5697-b407-a31e-416a0203df1e	4212	Visoko
00050000-5697-b407-a154-0e664b7bd265	1294	Višnja Gora
00050000-5697-b407-96c2-95ee2bb3cdba	3205	Vitanje
00050000-5697-b407-9d86-b9412390cf49	2255	Vitomarci
00050000-5697-b407-36d9-93d11ce15960	1217	Vodice
00050000-5697-b407-3a17-0e5ca411b300	3212	Vojnik\t
00050000-5697-b407-f3f1-8b26398a4838	5293	Volčja Draga
00050000-5697-b407-153d-b9d54316fc84	2232	Voličina
00050000-5697-b407-566c-bfa96fd61563	3305	Vransko
00050000-5697-b407-2a14-aae2d6f5013a	6217	Vremski Britof
00050000-5697-b407-72e9-ef92710af41c	1360	Vrhnika
00050000-5697-b407-cee4-0ba1e04dc2f7	2365	Vuhred
00050000-5697-b407-dd03-c1bb6afa9940	2367	Vuzenica
00050000-5697-b407-78de-74e58d356a59	8292	Zabukovje 
00050000-5697-b407-768e-976fa7c026fd	1410	Zagorje ob Savi
00050000-5697-b407-3aad-76d53c05d20c	1303	Zagradec
00050000-5697-b407-2ae1-c6d062bd9897	2283	Zavrč
00050000-5697-b407-e514-d9732b9683fe	8272	Zdole 
00050000-5697-b407-6fda-37f10650a6cc	4201	Zgornja Besnica
00050000-5697-b407-ee76-6008d0208626	2242	Zgornja Korena
00050000-5697-b407-ef16-12f39c5dbf3f	2201	Zgornja Kungota
00050000-5697-b407-a89f-11475894c000	2316	Zgornja Ložnica
00050000-5697-b407-7b11-cdf8afd9eb31	2314	Zgornja Polskava
00050000-5697-b407-bea8-3bcbe87c3591	2213	Zgornja Velka
00050000-5697-b407-c803-f28375d60694	4247	Zgornje Gorje
00050000-5697-b407-f459-2fcb3630d4ad	4206	Zgornje Jezersko
00050000-5697-b407-b377-dcb5040bcd26	2285	Zgornji Leskovec
00050000-5697-b407-023d-93c8dffd38b0	1432	Zidani Most
00050000-5697-b407-d1fd-fded48a1d2e2	3214	Zreče
00050000-5697-b407-ce1f-2abc07fbddbc	4209	Žabnica
00050000-5697-b407-ec98-ffb91f582b4d	3310	Žalec
00050000-5697-b407-61bd-22598d6615c9	4228	Železniki
00050000-5697-b407-7a22-b283f433716b	2287	Žetale
00050000-5697-b407-7d1e-bb160a31f0a5	4226	Žiri
00050000-5697-b407-fa8a-29778b1897c4	4274	Žirovnica
00050000-5697-b407-eea3-a0ca9300ce70	8360	Žužemberk
\.


--
-- TOC entry 3210 (class 0 OID 36406403)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 36405973)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 36405704)
-- Dependencies: 191
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5697-b40b-05b9-874e87680d03	00080000-5697-b40b-0243-0640830b8d08	\N	00040000-5697-b407-ba00-bd2d09135d06	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5697-b40b-978b-4c51398d25a5	00080000-5697-b40b-0243-0640830b8d08	\N	00040000-5697-b407-ba00-bd2d09135d06	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5697-b40b-280f-7fc7eb1fe231	00080000-5697-b40b-218c-ccd867e11404	\N	00040000-5697-b407-ba00-bd2d09135d06	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3169 (class 0 OID 36405842)
-- Dependencies: 203
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5697-b408-7795-e1dda2b00669	novo leto	1	1	\N	t
00430000-5697-b408-092b-92a290ddff24	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5697-b408-1040-8209a34d94c8	dan upora proti okupatorju	27	4	\N	t
00430000-5697-b408-82d2-09e4278a2316	praznik dela	1	5	\N	t
00430000-5697-b408-c68b-6741be19f96e	praznik dela	2	5	\N	t
00430000-5697-b408-59db-f82198990ebf	dan Primoža Trubarja	8	6	\N	f
00430000-5697-b408-2445-8661425a391c	dan državnosti	25	6	\N	t
00430000-5697-b408-6dee-5323e112a856	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5697-b408-9094-7d08f397fe8e	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5697-b408-9263-d1765e68679f	dan suverenosti	25	10	\N	f
00430000-5697-b408-354f-d17a61c89045	dan spomina na mrtve	1	11	\N	t
00430000-5697-b408-5752-1afe269b7e4f	dan Rudolfa Maistra	23	11	\N	f
00430000-5697-b408-1c64-f40949bb52b7	božič	25	12	\N	t
00430000-5697-b408-ee91-764ce26c38d7	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5697-b408-5888-803286526530	Marijino vnebovzetje	15	8	\N	t
00430000-5697-b408-948b-fbdfde0008e2	dan reformacije	31	10	\N	t
00430000-5697-b408-d511-c06dbff44920	velikonočna nedelja	27	3	2016	t
00430000-5697-b408-66be-7b8871a84c53	velikonočna nedelja	16	4	2017	t
00430000-5697-b408-c6ac-36c994746199	velikonočna nedelja	1	4	2018	t
00430000-5697-b408-3949-3255c4ade87c	velikonočna nedelja	21	4	2019	t
00430000-5697-b408-8f53-1b853a25457e	velikonočna nedelja	12	4	2020	t
00430000-5697-b408-c14a-2a0246c68f33	velikonočna nedelja	4	4	2021	t
00430000-5697-b408-2cb8-80f4e63ffa72	velikonočna nedelja	17	4	2022	t
00430000-5697-b408-0d1b-b31d551c45ea	velikonočna nedelja	9	4	2023	t
00430000-5697-b408-e716-e2c265da82a2	velikonočna nedelja	31	3	2024	t
00430000-5697-b408-c9fb-4330b638322f	velikonočna nedelja	20	4	2025	t
00430000-5697-b408-e7b6-15d21724238d	velikonočna nedelja	5	4	2026	t
00430000-5697-b408-ec79-6af363db9937	velikonočna nedelja	28	3	2027	t
00430000-5697-b408-48f7-6c2e7bdfbc5c	velikonočna nedelja	16	4	2028	t
00430000-5697-b408-991e-3a0bfd265dc8	velikonočna nedelja	1	4	2029	t
00430000-5697-b408-dee8-0c0ad0e6461f	velikonočna nedelja	21	4	2030	t
00430000-5697-b408-dad9-81fb904fb15c	velikonočni ponedeljek	28	3	2016	t
00430000-5697-b408-fb76-4d87b8fcb807	velikonočni ponedeljek	17	4	2017	t
00430000-5697-b408-02f0-c3e86b73d75d	velikonočni ponedeljek	2	4	2018	t
00430000-5697-b408-80d7-a379889a757d	velikonočni ponedeljek	22	4	2019	t
00430000-5697-b408-93d7-a14806b454af	velikonočni ponedeljek	13	4	2020	t
00430000-5697-b408-eb14-cec10c8a90fb	velikonočni ponedeljek	5	4	2021	t
00430000-5697-b408-2211-698a13184957	velikonočni ponedeljek	18	4	2022	t
00430000-5697-b408-480c-489c11d550ae	velikonočni ponedeljek	10	4	2023	t
00430000-5697-b408-9b8c-eadc383c02e5	velikonočni ponedeljek	1	4	2024	t
00430000-5697-b408-96d7-a3fbe4331e95	velikonočni ponedeljek	21	4	2025	t
00430000-5697-b408-14db-9981ab57d474	velikonočni ponedeljek	6	4	2026	t
00430000-5697-b408-edfc-a5fc3eacf634	velikonočni ponedeljek	29	3	2027	t
00430000-5697-b408-0c6c-3ee288eedb2b	velikonočni ponedeljek	17	4	2028	t
00430000-5697-b408-617a-dd16d879639a	velikonočni ponedeljek	2	4	2029	t
00430000-5697-b408-a1a6-9e42da631c47	velikonočni ponedeljek	22	4	2030	t
00430000-5697-b408-3f31-331fdfd1d772	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5697-b408-c7bb-158bfa2ac7d1	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5697-b408-36f7-eeb744309150	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5697-b408-df0b-923703f0f3c8	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5697-b408-58c9-ac3ed50613e2	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5697-b408-cad6-f59b76149eb1	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5697-b408-e50c-0016b47facc0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5697-b408-c708-81ebd5c8a8bf	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5697-b408-53f8-4962e803088a	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5697-b408-8d22-1aa928e88c7e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5697-b408-6512-4e1e28567233	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5697-b408-5f85-96515de400cb	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5697-b408-240a-b14722a1082b	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5697-b408-370a-f43e75a71e0b	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5697-b408-f42b-9ee91bd769aa	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3165 (class 0 OID 36405808)
-- Dependencies: 199
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 36405817)
-- Dependencies: 200
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 36405985)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 36406417)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 36406427)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5697-b40b-a681-57ea2c46cd16	00080000-5697-b40b-6ec7-2e6fbfcec758	0987	AK
00190000-5697-b40b-c564-f261759a7728	00080000-5697-b40b-218c-ccd867e11404	0989	AK
00190000-5697-b40b-64d7-a12cb9636d14	00080000-5697-b40b-d4d0-0332fe90a670	0986	AK
00190000-5697-b40b-8806-8d75586ec55c	00080000-5697-b40b-9447-b79f33eae9ae	0984	AK
00190000-5697-b40b-04c2-08eb10a08928	00080000-5697-b40b-bce3-2496df59bb05	0983	AK
00190000-5697-b40b-990f-e169beb5c6b7	00080000-5697-b40b-2440-10926ea2d339	0982	AK
00190000-5697-b40d-1798-a012724157e0	00080000-5697-b40d-97b4-6f2b54ea898d	1001	AK
\.


--
-- TOC entry 3209 (class 0 OID 36406316)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5697-b40b-aecb-fc79a281b664	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3213 (class 0 OID 36406435)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 36406014)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5697-b40a-afa3-7aa1a43b35f3	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5697-b40a-b09c-ff1199eb1fb1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5697-b40a-a859-53bc94c89286	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5697-b40a-d1c8-184835d444ab	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5697-b40a-21c9-3d314831a0e1	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5697-b40a-0cef-5b7322cb0d88	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5697-b40a-38dc-979c3a17d71b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3181 (class 0 OID 36405958)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 36405948)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3202 (class 0 OID 36406155)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 36406085)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 36405782)
-- Dependencies: 197
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 36405544)
-- Dependencies: 176
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5697-b40d-97b4-6f2b54ea898d	00010000-5697-b409-6415-0cac50a46d21	2016-01-14 15:43:25	INS	a:0:{}
2	App\\Entity\\Option	00000000-5697-b40d-d837-2f61de004d2d	00010000-5697-b409-6415-0cac50a46d21	2016-01-14 15:43:25	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5697-b40d-1798-a012724157e0	00010000-5697-b409-6415-0cac50a46d21	2016-01-14 15:43:25	INS	a:0:{}
\.


--
-- TOC entry 3234 (class 0 OID 0)
-- Dependencies: 175
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3190 (class 0 OID 36406027)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 36405582)
-- Dependencies: 180
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5697-b408-466f-a8a5722ebead	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5697-b408-df7d-37b70af05f97	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5697-b408-8ec2-31e3a151f51e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5697-b408-6572-9856879e9379	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5697-b408-5773-523de5c9cc18	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5697-b408-9f3c-c7cee27e406a	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5697-b408-6553-92ddf6baa37c	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5697-b408-9ca0-360ec32500f0	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5697-b408-453a-8c3cb9215061	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b408-40ff-f54aa109556d	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b408-59a1-5accbbe7409b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b408-e2f4-9389784d91be	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5697-b408-8795-9fc8f01d2458	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-b408-20c4-ffeff143daf7	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5697-b408-e7b7-e5e7f9a17131	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-b408-b646-5699dae9f2e9	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5697-b408-db0e-b3c85fcb8ea0	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5697-b408-6635-d4adc704e982	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5697-b408-7c2a-1c6e4b8f8dcc	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5697-b408-ec47-dcf1987a547a	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5697-b408-3f7d-f30da0d43a85	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-b408-bc28-62484ab045ea	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5697-b408-6c22-33f6cf301f28	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-b408-740d-0b16c570d1cb	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5697-b408-51e0-741bf872a2aa	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5697-b408-a02f-b90cbd18b135	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5697-b408-7dcf-e6c08b19b152	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5697-b408-976b-9c8214c32d10	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5697-b408-d889-da148c6dd4f1	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5697-b408-787c-bd95b512daf0	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5697-b408-f7ea-65917f661c1b	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-b408-43b1-62649a26cea2	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5697-b408-0ab8-65e9ba94d61f	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5697-b408-0ae4-5375c485af44	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5697-b408-acad-e405680d8622	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5697-b408-0038-0d6b0938ef22	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5697-b408-8493-250b0f04d98e	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-b408-4f5d-17c6c69f071e	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5697-b408-d8be-551c5cfd614e	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5697-b408-9c89-f3b352eaee0d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-b408-c99f-87b54bff1350	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5697-b408-5a0d-99c4b4a01e20	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5697-b408-e9f4-41ce11770268	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-b408-578b-90210dbaa3cb	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5697-b408-4cb7-b8e599951f0e	direktor	minimalne pravice za direktorja	t
00020000-5697-b408-db8d-b00a6b938af1	arhivar	arhivar	t
00020000-5697-b408-6f1d-dc50c1865344	dramaturg	dramaturg	t
00020000-5697-b408-e382-cad7b4e9f166	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5697-b408-3cd9-e8c2b22678dc	poslovni-sekretar	poslovni sekretar	t
00020000-5697-b408-e886-8ff8b4ca9210	vodja-tehnike	vodja tehnike	t
00020000-5697-b408-3f90-d05f04cbf7eb	racunovodja	računovodja	t
00020000-5697-b40a-3ae0-0f2e86038253	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5697-b40a-91ec-ef5236723049	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-af32-d18ff1e1b230	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-1bed-4de14a24daa4	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-89b7-34ddf0a73298	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-3600-7fe378f3fed0	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-4b69-a0e80cae2513	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-60c0-f865c7a67064	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-90f9-eb66de6251b5	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-96a5-3b7344c6332b	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-aa54-16f1af8188a0	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-0390-fe95e9280261	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-2966-bdde7148f469	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-cccf-4f118f96cb15	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-f416-eef9c0e4c5a6	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-f953-711e6440f9b6	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-3d2f-7166ee543301	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-513e-dce37519f4a5	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-76fa-2a5a00079c31	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-1a37-9dd27bfa4ef7	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5697-b40a-e707-935bc014be36	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-fbf8-3379a477b08f	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-0dff-15fd8c0a0a47	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-4e7e-3cdebd92ec16	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-28b1-c409837af44c	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-b0ea-16069e183afa	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-7edd-227ea554a73b	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-3d72-a3cc7ba7b658	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-66db-9c474c9b8903	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-9b88-d699e421e75b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-a3d2-a8b40da6f267	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-8176-6d189e574096	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-f79c-982f190b083e	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-2f15-777f1f076a2a	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-dd38-f9f7b3b94a13	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-0af6-893bd1aa4e93	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-4f78-60433429d158	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-e671-ff1aaddcd64a	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5697-b40a-f287-c41cb9890b09	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3144 (class 0 OID 36405566)
-- Dependencies: 178
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5697-b409-ecab-ed457e29329f	00020000-5697-b408-8ec2-31e3a151f51e
00010000-5697-b409-6415-0cac50a46d21	00020000-5697-b408-8ec2-31e3a151f51e
00010000-5697-b40a-1203-eaf81a2a53a2	00020000-5697-b40a-3ae0-0f2e86038253
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-91ec-ef5236723049
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-3600-7fe378f3fed0
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-96a5-3b7344c6332b
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-0390-fe95e9280261
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-cccf-4f118f96cb15
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-76fa-2a5a00079c31
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-1bed-4de14a24daa4
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-e707-935bc014be36
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-4e7e-3cdebd92ec16
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-b0ea-16069e183afa
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-3d72-a3cc7ba7b658
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-9b88-d699e421e75b
00010000-5697-b40a-49d0-68224d2dab8b	00020000-5697-b40a-2f15-777f1f076a2a
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-91ec-ef5236723049
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-af32-d18ff1e1b230
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-1bed-4de14a24daa4
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-89b7-34ddf0a73298
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-cccf-4f118f96cb15
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-3d2f-7166ee543301
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-e707-935bc014be36
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-4e7e-3cdebd92ec16
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-b0ea-16069e183afa
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-3d72-a3cc7ba7b658
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-9b88-d699e421e75b
00010000-5697-b40a-0aa7-564194181284	00020000-5697-b40a-2f15-777f1f076a2a
00010000-5697-b40a-3216-bf2372ce9c3e	00020000-5697-b40a-91ec-ef5236723049
00010000-5697-b40a-3216-bf2372ce9c3e	00020000-5697-b40a-af32-d18ff1e1b230
00010000-5697-b40a-3216-bf2372ce9c3e	00020000-5697-b40a-1bed-4de14a24daa4
00010000-5697-b40a-3216-bf2372ce9c3e	00020000-5697-b40a-89b7-34ddf0a73298
00010000-5697-b40a-3216-bf2372ce9c3e	00020000-5697-b40a-0390-fe95e9280261
00010000-5697-b40a-3216-bf2372ce9c3e	00020000-5697-b40a-cccf-4f118f96cb15
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-af32-d18ff1e1b230
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-4b69-a0e80cae2513
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-aa54-16f1af8188a0
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-2966-bdde7148f469
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-0390-fe95e9280261
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-513e-dce37519f4a5
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-cccf-4f118f96cb15
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-f416-eef9c0e4c5a6
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-e707-935bc014be36
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-fbf8-3379a477b08f
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-4e7e-3cdebd92ec16
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-28b1-c409837af44c
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-b0ea-16069e183afa
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-7edd-227ea554a73b
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-3d72-a3cc7ba7b658
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-66db-9c474c9b8903
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-9b88-d699e421e75b
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-a3d2-a8b40da6f267
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-2f15-777f1f076a2a
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-dd38-f9f7b3b94a13
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-4f78-60433429d158
00010000-5697-b40a-06f6-7e68eaa78af5	00020000-5697-b40a-e671-ff1aaddcd64a
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-af32-d18ff1e1b230
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-4b69-a0e80cae2513
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-90f9-eb66de6251b5
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-aa54-16f1af8188a0
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-2966-bdde7148f469
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-0390-fe95e9280261
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-513e-dce37519f4a5
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-cccf-4f118f96cb15
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-f416-eef9c0e4c5a6
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-f953-711e6440f9b6
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-e707-935bc014be36
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-fbf8-3379a477b08f
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-0dff-15fd8c0a0a47
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-4e7e-3cdebd92ec16
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-28b1-c409837af44c
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-b0ea-16069e183afa
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-7edd-227ea554a73b
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-3d72-a3cc7ba7b658
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-66db-9c474c9b8903
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-9b88-d699e421e75b
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-a3d2-a8b40da6f267
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-2f15-777f1f076a2a
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-dd38-f9f7b3b94a13
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-0af6-893bd1aa4e93
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-4f78-60433429d158
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-e671-ff1aaddcd64a
00010000-5697-b40a-613a-abae541ab179	00020000-5697-b40a-f287-c41cb9890b09
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-af32-d18ff1e1b230
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-1bed-4de14a24daa4
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-4b69-a0e80cae2513
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-60c0-f865c7a67064
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-90f9-eb66de6251b5
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-3600-7fe378f3fed0
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-aa54-16f1af8188a0
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-2966-bdde7148f469
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-0390-fe95e9280261
00010000-5697-b40a-0d04-a56b47429119	00020000-5697-b40a-513e-dce37519f4a5
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-91ec-ef5236723049
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-89b7-34ddf0a73298
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-3600-7fe378f3fed0
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-96a5-3b7344c6332b
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-0390-fe95e9280261
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-cccf-4f118f96cb15
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-76fa-2a5a00079c31
00010000-5697-b40a-9ceb-94579e58e3b3	00020000-5697-b40a-8176-6d189e574096
00010000-5697-b40a-244f-48ea6bdb58c0	00020000-5697-b40a-1a37-9dd27bfa4ef7
00010000-5697-b40a-b81e-85911e33c61d	00020000-5697-b408-4cb7-b8e599951f0e
00010000-5697-b40a-c966-e15c13c44cfe	00020000-5697-b408-db8d-b00a6b938af1
00010000-5697-b40a-610b-d7e326f4a94c	00020000-5697-b408-6f1d-dc50c1865344
00010000-5697-b40b-31d3-2a7f1e02034c	00020000-5697-b408-e382-cad7b4e9f166
00010000-5697-b40b-2104-7c96d382131d	00020000-5697-b408-3cd9-e8c2b22678dc
00010000-5697-b40b-f214-61e81b51b0be	00020000-5697-b408-e886-8ff8b4ca9210
00010000-5697-b40b-9e5b-69671f546b21	00020000-5697-b408-3f90-d05f04cbf7eb
\.


--
-- TOC entry 3192 (class 0 OID 36406041)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 36405979)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 36405902)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5697-b40a-e8b5-53b20ec50fa2	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5697-b40a-0af9-a655c992a45a	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5697-b40a-7378-81170d6ae812	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3140 (class 0 OID 36405531)
-- Dependencies: 174
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5697-b407-e3d3-e65796ce234d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5697-b407-d750-798105738f48	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5697-b407-518d-0915b4580a87	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5697-b407-9e43-ef7fd1cb8cdc	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5697-b407-2d2c-230b988ce38f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3139 (class 0 OID 36405523)
-- Dependencies: 173
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5697-b407-ff37-993ac390dd37	00230000-5697-b407-9e43-ef7fd1cb8cdc	popa
00240000-5697-b407-22d3-25766c150d6c	00230000-5697-b407-9e43-ef7fd1cb8cdc	oseba
00240000-5697-b407-83dc-5bf558719165	00230000-5697-b407-9e43-ef7fd1cb8cdc	tippopa
00240000-5697-b407-df33-5b3604ab3497	00230000-5697-b407-9e43-ef7fd1cb8cdc	organizacijskaenota
00240000-5697-b407-4ebb-8e7a74b252d8	00230000-5697-b407-9e43-ef7fd1cb8cdc	sezona
00240000-5697-b407-95f4-ec980f295f9a	00230000-5697-b407-9e43-ef7fd1cb8cdc	tipvaje
00240000-5697-b407-0577-04f545bba629	00230000-5697-b407-9e43-ef7fd1cb8cdc	tipdodatka
00240000-5697-b407-9f29-017139fa21b7	00230000-5697-b407-d750-798105738f48	prostor
00240000-5697-b407-e3ba-bf4578998dda	00230000-5697-b407-9e43-ef7fd1cb8cdc	besedilo
00240000-5697-b407-ae53-8b1d84e2b5e9	00230000-5697-b407-9e43-ef7fd1cb8cdc	uprizoritev
00240000-5697-b407-9b9d-7a2e291d3435	00230000-5697-b407-9e43-ef7fd1cb8cdc	funkcija
00240000-5697-b407-7f92-f683d1dbedee	00230000-5697-b407-9e43-ef7fd1cb8cdc	tipfunkcije
00240000-5697-b407-6479-218fbe1aa02b	00230000-5697-b407-9e43-ef7fd1cb8cdc	alternacija
00240000-5697-b407-f515-a1a36f91f7cb	00230000-5697-b407-e3d3-e65796ce234d	pogodba
00240000-5697-b407-3a18-2729e6e5d57b	00230000-5697-b407-9e43-ef7fd1cb8cdc	zaposlitev
00240000-5697-b407-b686-d6f6e3e2f7b9	00230000-5697-b407-9e43-ef7fd1cb8cdc	zvrstuprizoritve
00240000-5697-b407-7879-dd52c945b51b	00230000-5697-b407-e3d3-e65796ce234d	programdela
00240000-5697-b407-07bf-7e2e291413f3	00230000-5697-b407-9e43-ef7fd1cb8cdc	zapis
\.


--
-- TOC entry 3138 (class 0 OID 36405518)
-- Dependencies: 172
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
ed53e13e-a711-4245-9c90-51969ed43810	00240000-5697-b407-ff37-993ac390dd37	0	1001
\.


--
-- TOC entry 3198 (class 0 OID 36406102)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5697-b40b-357f-c7458748ddb1	000e0000-5697-b40b-ee4f-bc0131948d6f	00080000-5697-b40b-0243-0640830b8d08	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5697-b408-80a8-a1c0629186ea
00270000-5697-b40b-b9d1-00d5148228fb	000e0000-5697-b40b-ee4f-bc0131948d6f	00080000-5697-b40b-0243-0640830b8d08	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5697-b408-80a8-a1c0629186ea
\.


--
-- TOC entry 3154 (class 0 OID 36405666)
-- Dependencies: 188
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 36405921)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, zasedenost, virtzasedenost) FROM stdin;
001a0000-5697-b40b-8df0-2c0bc94d8596	00180000-5697-b40b-e59f-a45b9f21058d	000c0000-5697-b40b-cbba-f5825712d21f	00090000-5697-b40b-9aed-643bc5f626ed	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b40b-de9f-e8a283e94573	00180000-5697-b40b-e59f-a45b9f21058d	000c0000-5697-b40b-7632-faf4ae7067a3	00090000-5697-b40b-c15e-f627b6bf624c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b40b-8521-ea4daaa564c7	00180000-5697-b40b-e59f-a45b9f21058d	000c0000-5697-b40b-8d28-0314dbe1e43f	00090000-5697-b40b-0f50-9d24a6f4fb2c	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b40b-dba3-d89120ea9f78	00180000-5697-b40b-e59f-a45b9f21058d	000c0000-5697-b40b-cb98-16937e0545a2	00090000-5697-b40b-7ab2-5a63b4ea47b4	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b40b-08e2-d80322dc5a52	00180000-5697-b40b-e59f-a45b9f21058d	000c0000-5697-b40b-51d9-cfd62910a27b	00090000-5697-b40b-6b59-e7ffae0a7c58	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N
001a0000-5697-b40b-f364-f720c1cf4bbb	00180000-5697-b40b-fc3e-36b72626e546	\N	00090000-5697-b40b-6b59-e7ffae0a7c58	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	t	f	\N	\N
001a0000-5697-b40b-cec9-5991735dc602	00180000-5697-b40b-fc3e-36b72626e546	\N	00090000-5697-b40b-c15e-f627b6bf624c	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N
\.


--
-- TOC entry 3179 (class 0 OID 36405938)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-5697-b407-61cc-003aa97525f3	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-5697-b407-2bac-c3cddbe581c5	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-5697-b407-9b0d-bd97f4e98d25	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-5697-b407-d2df-8828ee55db8c	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-5697-b407-ae06-a6de614dab7d	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-5697-b407-6c4c-66e5b2617583	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3201 (class 0 OID 36406143)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5697-b407-3ae1-399bb14ca65c	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5697-b407-68c8-2496492cb16d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5697-b407-10de-df61565deaa3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5697-b407-ca58-e83a35a14562	04	Režija	Režija	Režija	umetnik	30
000f0000-5697-b407-a3a5-3b98771d56ba	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5697-b407-9e75-3a943a2d4187	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5697-b407-3d88-cf51bed6c982	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5697-b407-e5b4-05830f79480b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5697-b407-7020-38a19d2161a3	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5697-b407-e078-c8774521f53b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5697-b407-d211-f62e50f1a9ba	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5697-b407-9998-ba7a8470d528	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5697-b407-cdc0-e1078fd8e469	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5697-b407-a982-0ea9a15755bc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5697-b407-851a-afd85f167150	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5697-b407-ef30-4631f3906f8d	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5697-b407-8a14-4601c44c59d2	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5697-b407-0af3-4b3fdb3729b8	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-5697-b407-b3c6-57682e68a109	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3151 (class 0 OID 36405617)
-- Dependencies: 185
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5697-b40a-0303-c9df7ab95356	0001	šola	osnovna ali srednja šola
00400000-5697-b40a-7f33-06e1228fa781	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5697-b40a-ba9b-c4bdc6b2499d	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3214 (class 0 OID 36406447)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5697-b407-3de6-0bd38ef4ce41	01	Velika predstava	f	1.00	1.00
002b0000-5697-b407-0639-56c6c268f591	02	Mala predstava	f	0.50	0.50
002b0000-5697-b407-f0c0-1075885810b7	03	Mala koprodukcija	t	0.40	1.00
002b0000-5697-b407-cd27-cd4453752470	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5697-b407-a912-b23c12c11c7e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3174 (class 0 OID 36405892)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5697-b407-0474-7ba0875bdc66	0001	prva vaja	prva vaja
00420000-5697-b407-3100-a142226e8450	0002	tehnična vaja	tehnična vaja
00420000-5697-b407-dc00-a0884bc8392e	0003	lučna vaja	lučna vaja
00420000-5697-b407-c7a7-045a3a13d969	0004	kostumska vaja	kostumska vaja
00420000-5697-b407-7dce-c16422941b45	0005	foto vaja	foto vaja
00420000-5697-b407-d8ee-40a515306001	0006	1. glavna vaja	1. glavna vaja
00420000-5697-b407-1d5c-68b6a3e71850	0007	2. glavna vaja	2. glavna vaja
00420000-5697-b407-c379-1d2568ecc66f	0008	1. generalka	1. generalka
00420000-5697-b407-81ef-94f0ee2808a8	0009	2. generalka	2. generalka
00420000-5697-b407-3669-ed7b8abcac1c	0010	odprta generalka	odprta generalka
00420000-5697-b407-5cc4-b2bfca88053d	0011	obnovitvena vaja	obnovitvena vaja
00420000-5697-b407-3616-fbccf8e5c424	0012	italijanka	krajša "obnovitvena" vaja
00420000-5697-b407-8643-54f83289effc	0013	pevska vaja	pevska vaja
00420000-5697-b407-8599-a93ce8165a45	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5697-b407-8af6-17ee24715d49	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-5697-b407-f528-3c18a5cebdab	0016	orientacijska vaja	orientacijska vaja
00420000-5697-b407-c270-6e5e777ff4d3	0017	situacijska vaja	situacijska vaja
00420000-5697-b407-5fa5-d05d662bc144	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3160 (class 0 OID 36405739)
-- Dependencies: 194
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 36405553)
-- Dependencies: 177
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5697-b409-6415-0cac50a46d21	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROPeT88vk45iTkg.HBrm0U.K76Hga23wK	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5697-b40a-6ec1-ca9c58b95af3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5697-b40a-d8a3-2deb8ae171fe	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5697-b40a-3002-18071caa09ed	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5697-b40a-0046-5fc1c3f00933	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5697-b40a-970e-b9a9d712e5ed	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5697-b40a-d2b4-7100bc7b0138	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5697-b40a-b55a-5b8a769f9461	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5697-b40a-db11-748fe8eecadd	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5697-b40a-b780-e7c69c5d7e12	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5697-b40a-1203-eaf81a2a53a2	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5697-b40a-62bc-5817c6586b6d	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5697-b40a-49d0-68224d2dab8b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5697-b40a-0aa7-564194181284	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5697-b40a-3216-bf2372ce9c3e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5697-b40a-06f6-7e68eaa78af5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5697-b40a-613a-abae541ab179	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5697-b40a-0d04-a56b47429119	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5697-b40a-9ceb-94579e58e3b3	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5697-b40a-244f-48ea6bdb58c0	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5697-b40a-b81e-85911e33c61d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5697-b40a-c966-e15c13c44cfe	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5697-b40a-610b-d7e326f4a94c	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5697-b40b-31d3-2a7f1e02034c	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5697-b40b-2104-7c96d382131d	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5697-b40b-f214-61e81b51b0be	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5697-b40b-9e5b-69671f546b21	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5697-b409-ecab-ed457e29329f	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3205 (class 0 OID 36406193)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5697-b40b-8db5-8b5b993d7c9c	00160000-5697-b40a-f100-9da3b0d94cbf	\N	00140000-5697-b407-6d97-89386fa67ad1	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5697-b40a-21c9-3d314831a0e1
000e0000-5697-b40b-ee4f-bc0131948d6f	00160000-5697-b40a-63c1-814f62158594	\N	00140000-5697-b407-d744-2c06f14d00ff	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5697-b40a-0cef-5b7322cb0d88
000e0000-5697-b40b-acd8-41fe44e7e700	\N	\N	00140000-5697-b407-d744-2c06f14d00ff	00190000-5697-b40b-a681-57ea2c46cd16	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-b40a-21c9-3d314831a0e1
000e0000-5697-b40b-e36a-08a675abd48e	\N	\N	00140000-5697-b407-d744-2c06f14d00ff	00190000-5697-b40b-a681-57ea2c46cd16	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5697-b40a-21c9-3d314831a0e1
000e0000-5697-b40b-112b-a2c5c956d064	\N	\N	00140000-5697-b407-d744-2c06f14d00ff	00190000-5697-b40b-a681-57ea2c46cd16	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-07e9-d463a97fb300	\N	\N	00140000-5697-b407-d744-2c06f14d00ff	00190000-5697-b40b-a681-57ea2c46cd16	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-f1d7-199a78fbcf5e	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-46c8-1b25411e8738	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-d2db-8abde99254eb	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-f749-252cacc47a0f	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-118a-4d47e78b50df	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-3900-7f09b07d6720	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-bb90-74ef765b4e91	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-25e8-f2799d7926ed	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
000e0000-5697-b40b-8f93-6d5298c1b6b2	\N	\N	00140000-5697-b407-304f-b093bd8bfa10	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5697-b40a-afa3-7aa1a43b35f3
\.


--
-- TOC entry 3176 (class 0 OID 36405912)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 36405835)
-- Dependencies: 202
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-5697-b40b-e444-45aa7e6fdc82	\N	000e0000-5697-b40b-ee4f-bc0131948d6f	1
00200000-5697-b40b-8d0d-618dbbd2c264	\N	000e0000-5697-b40b-ee4f-bc0131948d6f	2
00200000-5697-b40b-c359-86bddda6378a	\N	000e0000-5697-b40b-ee4f-bc0131948d6f	3
00200000-5697-b40b-88f6-3cfe8562943f	\N	000e0000-5697-b40b-ee4f-bc0131948d6f	4
00200000-5697-b40b-3e94-25994322f3a8	\N	000e0000-5697-b40b-ee4f-bc0131948d6f	5
\.


--
-- TOC entry 3188 (class 0 OID 36406006)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 36406116)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5697-b408-1d9e-5098e3f97db1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5697-b408-2ab7-00a7599fc924	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5697-b408-eef4-6e7e5681a3c8	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5697-b408-a6a3-8fc296e2f823	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5697-b408-e2eb-234e6809be98	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5697-b408-4f38-99ac69634463	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5697-b408-9abf-1acc947d4654	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5697-b408-4a55-ddaa57acbb8d	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5697-b408-80a8-a1c0629186ea	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5697-b408-e637-7edcc8e5905e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5697-b408-99c1-b0d778d7624d	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5697-b408-50d5-7016817be8fb	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5697-b408-4692-b55faa7993b0	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5697-b408-c957-e3ca57d45d75	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5697-b408-f0d2-2f9b2fc57536	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5697-b408-59eb-000cbea0c3df	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5697-b408-2719-c3083f3d1bc2	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5697-b408-6bb3-c311e8d5ef4c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5697-b408-15fc-d16a2ef0ee1d	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5697-b408-a35c-15086cb71560	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5697-b408-da34-7ede823e0258	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5697-b408-4525-1a57d08f4f19	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5697-b408-2bb6-941baa4c4b21	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5697-b408-9d03-cb4755987251	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5697-b408-677f-2a9a9662e8ac	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5697-b408-76f2-26d15a048b30	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5697-b408-1635-4641b3161cc8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5697-b408-1a56-21296c178bd5	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3217 (class 0 OID 36406497)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 36406466)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3218 (class 0 OID 36406510)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3195 (class 0 OID 36406078)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5697-b40b-d54a-bbe5428567fb	00090000-5697-b40b-c15e-f627b6bf624c	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b40b-3b9b-80b7cb74602c	00090000-5697-b40b-0f50-9d24a6f4fb2c	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b40b-f50f-bc80ccdb0acb	00090000-5697-b40b-813b-e500fa4a6269	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b40b-e795-88702d9c75c6	00090000-5697-b40b-e339-1fd9e2457169	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b40b-7059-02671db68094	00090000-5697-b40b-53e6-5949a670cc72	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-5697-b40b-c9b1-9a9487f4f959	00090000-5697-b40b-277b-0649b9cfef76	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3171 (class 0 OID 36405876)
-- Dependencies: 205
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3204 (class 0 OID 36406183)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5697-b407-6d97-89386fa67ad1	01	Drama	drama (SURS 01)
00140000-5697-b407-e07b-ae64f5a9d681	02	Opera	opera (SURS 02)
00140000-5697-b407-1145-0db7d3cace51	03	Balet	balet (SURS 03)
00140000-5697-b407-76e7-288bb7cae473	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5697-b407-304f-b093bd8bfa10	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5697-b407-d744-2c06f14d00ff	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5697-b407-9659-5c8fd2ff4995	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3194 (class 0 OID 36406068)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2618 (class 2606 OID 36405616)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 36406241)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2845 (class 2606 OID 36406232)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2616 (class 2606 OID 36405607)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2808 (class 2606 OID 36406099)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2819 (class 2606 OID 36406141)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2905 (class 2606 OID 36406551)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 36405935)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 36405864)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 36405886)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 36405891)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 36406464)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 36405765)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2855 (class 2606 OID 36406310)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 36406064)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 36405833)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 36405803)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 36405779)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 36405971)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2899 (class 2606 OID 36406528)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 36406535)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2910 (class 2606 OID 36406559)
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
-- TOC entry 2768 (class 2606 OID 36405998)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 36405737)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 36405635)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2645 (class 2606 OID 36405699)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 36405662)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 36405596)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2607 (class 2606 OID 36405581)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 36406004)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 36406040)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 36406178)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 36405690)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 36405725)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 36406415)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 36405977)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2651 (class 2606 OID 36405715)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 36405849)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 36405821)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2685 (class 2606 OID 36405813)
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
-- TOC entry 2766 (class 2606 OID 36405989)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 36406424)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 36406432)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 36406402)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 36406445)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 36406022)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 36405962)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 36405953)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 36406165)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 36406092)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 36405791)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 36405552)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 36406031)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 36405570)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2609 (class 2606 OID 36405590)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 36406049)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 36405984)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 36405910)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 36405540)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 36405528)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 36405522)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 36406112)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 36405671)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 36405927)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 36405945)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2822 (class 2606 OID 36406152)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 36405624)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2878 (class 2606 OID 36406457)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 36405899)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 36405750)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 36405565)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 36406211)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 36405918)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 36405839)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 36406012)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 36406124)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2892 (class 2606 OID 36406507)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 36406491)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 36406516)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 36406082)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 36405880)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 36406191)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2798 (class 2606 OID 36406076)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 1259 OID 36405874)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2702 (class 1259 OID 36405875)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2703 (class 1259 OID 36405873)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2704 (class 1259 OID 36405872)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2705 (class 1259 OID 36405871)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2811 (class 1259 OID 36406113)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2812 (class 1259 OID 36406114)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2813 (class 1259 OID 36406115)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2896 (class 1259 OID 36406530)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2897 (class 1259 OID 36406529)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2636 (class 1259 OID 36405692)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2637 (class 1259 OID 36405693)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2769 (class 1259 OID 36406005)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2883 (class 1259 OID 36406495)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2884 (class 1259 OID 36406494)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2885 (class 1259 OID 36406496)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2886 (class 1259 OID 36406493)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2887 (class 1259 OID 36406492)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2763 (class 1259 OID 36405991)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2764 (class 1259 OID 36405990)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2693 (class 1259 OID 36405840)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2694 (class 1259 OID 36405841)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2793 (class 1259 OID 36406065)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2794 (class 1259 OID 36406067)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2795 (class 1259 OID 36406066)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2668 (class 1259 OID 36405781)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2669 (class 1259 OID 36405780)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2874 (class 1259 OID 36406446)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2827 (class 1259 OID 36406180)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2828 (class 1259 OID 36406181)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 36406182)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2893 (class 1259 OID 36406517)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2836 (class 1259 OID 36406216)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2837 (class 1259 OID 36406213)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2838 (class 1259 OID 36406217)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2839 (class 1259 OID 36406215)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2840 (class 1259 OID 36406214)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2658 (class 1259 OID 36405752)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2659 (class 1259 OID 36405751)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2627 (class 1259 OID 36405665)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2781 (class 1259 OID 36406032)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2611 (class 1259 OID 36405597)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2612 (class 1259 OID 36405598)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2786 (class 1259 OID 36406052)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2787 (class 1259 OID 36406051)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2788 (class 1259 OID 36406050)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2641 (class 1259 OID 36405702)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2642 (class 1259 OID 36405701)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2643 (class 1259 OID 36405703)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2681 (class 1259 OID 36405816)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2682 (class 1259 OID 36405814)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2683 (class 1259 OID 36405815)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2591 (class 1259 OID 36405530)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2743 (class 1259 OID 36405957)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2744 (class 1259 OID 36405955)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2745 (class 1259 OID 36405954)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2746 (class 1259 OID 36405956)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2602 (class 1259 OID 36405571)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2603 (class 1259 OID 36405572)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2772 (class 1259 OID 36406013)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2906 (class 1259 OID 36406552)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2809 (class 1259 OID 36406101)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2810 (class 1259 OID 36406100)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2907 (class 1259 OID 36406560)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2908 (class 1259 OID 36406561)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2758 (class 1259 OID 36405978)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2803 (class 1259 OID 36406093)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2804 (class 1259 OID 36406094)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2856 (class 1259 OID 36406315)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2857 (class 1259 OID 36406314)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2858 (class 1259 OID 36406311)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2859 (class 1259 OID 36406312)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2860 (class 1259 OID 36406313)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2647 (class 1259 OID 36405717)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 36405716)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2649 (class 1259 OID 36405718)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2775 (class 1259 OID 36406026)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2776 (class 1259 OID 36406025)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2866 (class 1259 OID 36406425)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2867 (class 1259 OID 36406426)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2849 (class 1259 OID 36406245)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2850 (class 1259 OID 36406246)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2851 (class 1259 OID 36406243)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2852 (class 1259 OID 36406244)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2737 (class 1259 OID 36405936)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2738 (class 1259 OID 36405937)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2799 (class 1259 OID 36406083)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2800 (class 1259 OID 36406084)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2726 (class 1259 OID 36405919)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2749 (class 1259 OID 36405966)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2750 (class 1259 OID 36405965)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2751 (class 1259 OID 36405963)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2752 (class 1259 OID 36405964)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2846 (class 1259 OID 36406233)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2672 (class 1259 OID 36405792)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2675 (class 1259 OID 36405806)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2676 (class 1259 OID 36405805)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2677 (class 1259 OID 36405804)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2678 (class 1259 OID 36405807)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2692 (class 1259 OID 36405834)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2686 (class 1259 OID 36405822)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2687 (class 1259 OID 36405823)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2863 (class 1259 OID 36406416)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2882 (class 1259 OID 36406465)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2900 (class 1259 OID 36406536)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2901 (class 1259 OID 36406537)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2623 (class 1259 OID 36405637)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2624 (class 1259 OID 36405636)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2632 (class 1259 OID 36405672)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2633 (class 1259 OID 36405673)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2712 (class 1259 OID 36405881)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 36405930)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2731 (class 1259 OID 36405929)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2732 (class 1259 OID 36405928)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2706 (class 1259 OID 36405866)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2707 (class 1259 OID 36405867)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2708 (class 1259 OID 36405870)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2709 (class 1259 OID 36405865)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2710 (class 1259 OID 36405869)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2711 (class 1259 OID 36405868)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2640 (class 1259 OID 36405691)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2621 (class 1259 OID 36405625)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 36405626)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2664 (class 1259 OID 36405766)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 36405768)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2666 (class 1259 OID 36405767)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2667 (class 1259 OID 36405769)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2757 (class 1259 OID 36405972)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 36406179)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2841 (class 1259 OID 36406212)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2823 (class 1259 OID 36406153)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2824 (class 1259 OID 36406154)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 36405663)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 36405664)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2741 (class 1259 OID 36405946)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2742 (class 1259 OID 36405947)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2796 (class 1259 OID 36406077)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 36405541)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2657 (class 1259 OID 36405738)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2646 (class 1259 OID 36405700)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 36405529)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2879 (class 1259 OID 36406458)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2779 (class 1259 OID 36406024)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2780 (class 1259 OID 36406023)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 36405900)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2722 (class 1259 OID 36405901)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2853 (class 1259 OID 36406242)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2727 (class 1259 OID 36405920)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2654 (class 1259 OID 36405726)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2833 (class 1259 OID 36406192)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2890 (class 1259 OID 36406509)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2872 (class 1259 OID 36406433)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2873 (class 1259 OID 36406434)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2820 (class 1259 OID 36406142)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2725 (class 1259 OID 36405911)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2610 (class 1259 OID 36405591)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2950 (class 2606 OID 36406732)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2949 (class 2606 OID 36406737)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2944 (class 2606 OID 36406762)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2946 (class 2606 OID 36406752)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2951 (class 2606 OID 36406727)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2947 (class 2606 OID 36406747)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2945 (class 2606 OID 36406757)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2948 (class 2606 OID 36406742)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2991 (class 2606 OID 36406953)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2990 (class 2606 OID 36406958)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2989 (class 2606 OID 36406963)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3022 (class 2606 OID 36407123)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 36407118)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2923 (class 2606 OID 36406617)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2922 (class 2606 OID 36406622)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2972 (class 2606 OID 36406868)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3017 (class 2606 OID 36407103)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3018 (class 2606 OID 36407098)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3016 (class 2606 OID 36407108)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3019 (class 2606 OID 36407093)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3020 (class 2606 OID 36407088)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2970 (class 2606 OID 36406863)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2971 (class 2606 OID 36406858)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2943 (class 2606 OID 36406717)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2942 (class 2606 OID 36406722)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2982 (class 2606 OID 36406908)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2980 (class 2606 OID 36406918)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2981 (class 2606 OID 36406913)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2932 (class 2606 OID 36406672)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2933 (class 2606 OID 36406667)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 36406848)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3014 (class 2606 OID 36407078)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 36406968)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2993 (class 2606 OID 36406973)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 36406978)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3021 (class 2606 OID 36407113)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2996 (class 2606 OID 36406998)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2999 (class 2606 OID 36406983)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2995 (class 2606 OID 36407003)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2997 (class 2606 OID 36406993)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2998 (class 2606 OID 36406988)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2930 (class 2606 OID 36406662)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 36406657)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2918 (class 2606 OID 36406602)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2919 (class 2606 OID 36406597)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 36406888)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2915 (class 2606 OID 36406577)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2914 (class 2606 OID 36406582)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2977 (class 2606 OID 36406903)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 36406898)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2979 (class 2606 OID 36406893)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2925 (class 2606 OID 36406632)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2926 (class 2606 OID 36406627)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 36406637)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2936 (class 2606 OID 36406697)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 36406687)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 36406692)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2911 (class 2606 OID 36406562)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2960 (class 2606 OID 36406823)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2962 (class 2606 OID 36406812)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2963 (class 2606 OID 36406807)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2961 (class 2606 OID 36406817)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 36406567)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2912 (class 2606 OID 36406572)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2973 (class 2606 OID 36406873)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3026 (class 2606 OID 36407138)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 36406948)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 36406943)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3028 (class 2606 OID 36407143)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3027 (class 2606 OID 36407148)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2969 (class 2606 OID 36406853)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2986 (class 2606 OID 36406933)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2985 (class 2606 OID 36406938)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3005 (class 2606 OID 36407053)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 36407048)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3009 (class 2606 OID 36407033)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3008 (class 2606 OID 36407038)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3007 (class 2606 OID 36407043)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2928 (class 2606 OID 36406647)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 36406642)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 36406652)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 36406883)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2975 (class 2606 OID 36406878)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3012 (class 2606 OID 36407063)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3011 (class 2606 OID 36407068)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 3002 (class 2606 OID 36407023)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 3001 (class 2606 OID 36407028)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 3004 (class 2606 OID 36407013)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 3003 (class 2606 OID 36407018)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2959 (class 2606 OID 36406797)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2958 (class 2606 OID 36406802)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2984 (class 2606 OID 36406923)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2983 (class 2606 OID 36406928)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2954 (class 2606 OID 36406772)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 36406777)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2964 (class 2606 OID 36406843)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2965 (class 2606 OID 36406838)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2967 (class 2606 OID 36406828)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2966 (class 2606 OID 36406833)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 3000 (class 2606 OID 36407008)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 36406677)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2935 (class 2606 OID 36406682)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 36406712)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 36406702)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2939 (class 2606 OID 36406707)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3010 (class 2606 OID 36407058)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3013 (class 2606 OID 36407073)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3015 (class 2606 OID 36407083)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3025 (class 2606 OID 36407128)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3024 (class 2606 OID 36407133)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2916 (class 2606 OID 36406592)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2917 (class 2606 OID 36406587)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2921 (class 2606 OID 36406607)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2920 (class 2606 OID 36406612)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 36406767)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 36406792)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 36406787)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2957 (class 2606 OID 36406782)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-14 15:43:27 CET

--
-- PostgreSQL database dump complete
--

