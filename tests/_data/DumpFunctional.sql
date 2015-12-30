--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-30 11:54:09 CET

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
-- TOC entry 3194 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 33558410)
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
-- TOC entry 237 (class 1259 OID 33559025)
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
-- TOC entry 236 (class 1259 OID 33559008)
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
-- TOC entry 182 (class 1259 OID 33558403)
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
-- TOC entry 181 (class 1259 OID 33558401)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3195 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 33558885)
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
-- TOC entry 230 (class 1259 OID 33558915)
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
-- TOC entry 251 (class 1259 OID 33559328)
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
-- TOC entry 203 (class 1259 OID 33558658)
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
-- TOC entry 205 (class 1259 OID 33558690)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33558695)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33559250)
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
-- TOC entry 194 (class 1259 OID 33558555)
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
-- TOC entry 238 (class 1259 OID 33559038)
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
-- TOC entry 223 (class 1259 OID 33558838)
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
    altercount integer DEFAULT 0 NOT NULL,
    tipfunkcije_id uuid
);


--
-- TOC entry 200 (class 1259 OID 33558629)
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
-- TOC entry 197 (class 1259 OID 33558595)
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
-- TOC entry 3196 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 33558572)
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
-- TOC entry 212 (class 1259 OID 33558752)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33559308)
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
-- TOC entry 250 (class 1259 OID 33559321)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33559343)
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
-- TOC entry 170 (class 1259 OID 33138684)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 33558777)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33558529)
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
-- TOC entry 185 (class 1259 OID 33558429)
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
-- TOC entry 189 (class 1259 OID 33558496)
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
-- TOC entry 186 (class 1259 OID 33558440)
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
-- TOC entry 178 (class 1259 OID 33558375)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33558394)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33558784)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33558818)
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
-- TOC entry 233 (class 1259 OID 33558956)
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
-- TOC entry 188 (class 1259 OID 33558476)
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
-- TOC entry 191 (class 1259 OID 33558521)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33559194)
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
-- TOC entry 213 (class 1259 OID 33558758)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33558506)
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
-- TOC entry 202 (class 1259 OID 33558650)
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
-- TOC entry 198 (class 1259 OID 33558610)
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
-- TOC entry 199 (class 1259 OID 33558622)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33558770)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33559208)
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
-- TOC entry 242 (class 1259 OID 33559218)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33559107)
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
-- TOC entry 243 (class 1259 OID 33559226)
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
-- TOC entry 219 (class 1259 OID 33558799)
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
-- TOC entry 211 (class 1259 OID 33558743)
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
-- TOC entry 210 (class 1259 OID 33558733)
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
-- TOC entry 232 (class 1259 OID 33558945)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33558875)
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
-- TOC entry 196 (class 1259 OID 33558584)
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
-- TOC entry 175 (class 1259 OID 33558346)
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
-- TOC entry 174 (class 1259 OID 33558344)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3197 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 33558812)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33558384)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33558368)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33558826)
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
-- TOC entry 214 (class 1259 OID 33558764)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33558710)
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
-- TOC entry 173 (class 1259 OID 33558333)
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
-- TOC entry 172 (class 1259 OID 33558325)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33558320)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33558892)
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
-- TOC entry 187 (class 1259 OID 33558468)
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
-- TOC entry 209 (class 1259 OID 33558720)
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
-- TOC entry 231 (class 1259 OID 33558933)
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
-- TOC entry 184 (class 1259 OID 33558419)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33559238)
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
-- TOC entry 207 (class 1259 OID 33558700)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33558541)
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
-- TOC entry 176 (class 1259 OID 33558355)
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
-- TOC entry 235 (class 1259 OID 33558983)
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
-- TOC entry 201 (class 1259 OID 33558640)
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
-- TOC entry 218 (class 1259 OID 33558791)
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
-- TOC entry 229 (class 1259 OID 33558906)
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
-- TOC entry 247 (class 1259 OID 33559288)
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
-- TOC entry 246 (class 1259 OID 33559257)
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
-- TOC entry 248 (class 1259 OID 33559300)
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
-- TOC entry 225 (class 1259 OID 33558864)
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
-- TOC entry 204 (class 1259 OID 33558684)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33558973)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33558854)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33558406)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33558349)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33558410)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5683-b7cc-7121-1baa8007a5cc	10	30	Otroci	Abonma za otroke	200
000a0000-5683-b7cc-cf4e-68a3099d71de	20	60	Mladina	Abonma za mladino	400
000a0000-5683-b7cc-3299-0743b5a1d573	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33559025)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5683-b7cd-6a07-39efdb3928f8	000d0000-5683-b7cd-cc24-bb26625e7e6a	\N	00090000-5683-b7cd-3704-0157438f9c05	000b0000-5683-b7cd-4af0-de7833db337a	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5683-b7cd-b6a0-4b2fe6a8e5a0	000d0000-5683-b7cd-0e52-2bd95530ab27	00100000-5683-b7cd-bdea-f7f2fd0c05f4	00090000-5683-b7cd-8e66-310dbadc850c	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5683-b7cd-5a68-9166f125b0c5	000d0000-5683-b7cd-da82-9980c18b1e03	00100000-5683-b7cd-351e-d17aec1747a8	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	\N	0003	t	\N	2015-12-30	\N	2	t	\N	f	f
000c0000-5683-b7cd-1407-1f3593d6a9ca	000d0000-5683-b7cd-4b6f-ef5ea30e07b5	\N	00090000-5683-b7cd-6490-37ab3fc790fe	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5683-b7cd-89db-b3cd33b5a01e	000d0000-5683-b7cd-12af-479fe0731050	\N	00090000-5683-b7cd-b940-df334d447dcb	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5683-b7cd-a723-d9f01c3847fa	000d0000-5683-b7cd-78e0-47f12a3ba437	\N	00090000-5683-b7cd-73c4-68811c46f2ce	000b0000-5683-b7cd-d726-3d193f5bf68b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5683-b7cd-afc5-7b1842ec272b	000d0000-5683-b7cd-cfaa-f462019e1cf1	00100000-5683-b7cd-5752-ab954d54e427	00090000-5683-b7cd-e245-d0695557a133	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5683-b7cd-fe83-ac2200ecc1fc	000d0000-5683-b7cd-d29a-f9b1e63a94cb	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	000b0000-5683-b7cd-95be-bcaf4f99b37c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5683-b7cd-447d-ce1fe71a4764	000d0000-5683-b7cd-cfaa-f462019e1cf1	00100000-5683-b7cd-107d-089644a673a8	00090000-5683-b7cd-710e-6b30d2acf72b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5683-b7cd-df0c-52b3f9437be7	000d0000-5683-b7cd-cfaa-f462019e1cf1	00100000-5683-b7cd-077b-b9f41cf69d18	00090000-5683-b7cd-f68f-52738ea92b9e	\N	0010	t	\N	2015-12-30	\N	16	f	\N	f	t
000c0000-5683-b7cd-7b61-a9be1144a8a9	000d0000-5683-b7cd-cfaa-f462019e1cf1	00100000-5683-b7cd-a6d1-47dcb481eb38	00090000-5683-b7cd-7cc7-70dfd43a391f	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5683-b7cd-59b1-549e51cde4c3	000d0000-5683-b7cd-9dd1-ca931ed66893	00100000-5683-b7cd-bdea-f7f2fd0c05f4	00090000-5683-b7cd-8e66-310dbadc850c	000b0000-5683-b7cd-82ae-6bd4f5081dc4	0012	t	\N	\N	\N	2	t	\N	t	t
000c0000-5683-b7cd-b234-f34fbe211543	000d0000-5683-b7cd-116f-408f33994db6	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	0013	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7cd-e0c2-c88310e72ac9	000d0000-5683-b7cd-116f-408f33994db6	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0014	f	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7cd-c611-1a1c51db168e	000d0000-5683-b7cd-82d9-54eb32468d87	00100000-5683-b7cd-351e-d17aec1747a8	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	\N	0015	t	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7cd-8c7a-512d209a7962	000d0000-5683-b7cd-82d9-54eb32468d87	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0016	f	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7cd-2c9b-4f37d54b55df	000d0000-5683-b7cd-aadf-0e1cbd896b1a	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0017	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7cd-61f9-86d3b8fa013f	000d0000-5683-b7cd-aadf-0e1cbd896b1a	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	0018	f	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7cd-8a65-408b67e276a4	000d0000-5683-b7cd-19ee-529ab0f02317	00100000-5683-b7cd-5752-ab954d54e427	00090000-5683-b7cd-e245-d0695557a133	\N	0019	t	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7cd-62d2-fd7e1b463f85	000d0000-5683-b7cd-19ee-529ab0f02317	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0020	f	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7cd-412f-8882d699b572	000d0000-5683-b7cd-8074-b6e62d3721fb	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0021	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7cd-8509-86d3618c2777	000d0000-5683-b7cd-8074-b6e62d3721fb	00100000-5683-b7cd-5752-ab954d54e427	00090000-5683-b7cd-e245-d0695557a133	\N	0022	t	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7ce-8c08-31a71df8512f	000d0000-5683-b7cd-74f3-85c65dc53d54	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0023	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7ce-0728-0c4b233353c2	000d0000-5683-b7cd-80fe-d0702e420103	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	0024	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7ce-bcc3-46faeb39ddea	000d0000-5683-b7cd-d754-3e11b36b6753	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	0025	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7ce-9d5c-4f8f0ee470ac	000d0000-5683-b7cd-d754-3e11b36b6753	00100000-5683-b7cd-351e-d17aec1747a8	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	\N	0026	t	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7ce-96ad-7ab762ab9740	000d0000-5683-b7cd-6055-3e6116560459	\N	00090000-5683-b7cd-a393-57adde99e326	\N	0027	f	\N	\N	\N	2	t	\N	f	t
000c0000-5683-b7ce-2a94-d39f425e363c	000d0000-5683-b7cd-6055-3e6116560459	\N	00090000-5683-b7cd-5d9b-b5d8a4c1e674	\N	0028	f	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7ce-8d52-265fbcc1c24f	000d0000-5683-b7cd-42cf-42ef7c16ddd7	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	0029	f	\N	\N	\N	1	t	\N	f	t
000c0000-5683-b7ce-0a02-81ae3a861699	000d0000-5683-b7cd-42cf-42ef7c16ddd7	00100000-5683-b7cd-351e-d17aec1747a8	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	\N	0030	t	\N	\N	\N	2	f	\N	f	t
000c0000-5683-b7ce-4d65-d83a4405e1ed	000d0000-5683-b7cd-42cf-42ef7c16ddd7	\N	00090000-5683-b7cd-5d9b-b5d8a4c1e674	\N	0031	f	\N	\N	\N	3	f	\N	f	t
000c0000-5683-b7ce-eac4-a99e7dce4cdd	000d0000-5683-b7cd-42cf-42ef7c16ddd7	\N	00090000-5683-b7cd-a393-57adde99e326	\N	0032	f	\N	\N	\N	4	f	\N	f	t
000c0000-5683-b7ce-6f8a-918f1dbf10d6	000d0000-5683-b7cd-2137-5e9240988f76	\N	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	0033	f	\N	\N	\N	4	t	\N	f	t
000c0000-5683-b7ce-b2f1-7c839f1b4f3c	000d0000-5683-b7cd-6c6b-8bcbdeddca2e	00100000-5683-b7cd-351e-d17aec1747a8	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	\N	0034	t	\N	\N	\N	4	t	\N	f	t
000c0000-5683-b7ce-5701-58c231616dd3	000d0000-5683-b7cd-6c6b-8bcbdeddca2e	\N	00090000-5683-b7cd-f63b-3186c4409ae0	\N	0035	f	\N	\N	\N	4	f	\N	f	t
\.


--
-- TOC entry 3171 (class 0 OID 33559008)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33558403)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3162 (class 0 OID 33558885)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5683-b7cd-4657-75cdee5792dd	00160000-5683-b7cc-17d9-0079f3e61848	00090000-5683-b7cd-5d9b-b5d8a4c1e674	aizv	10	t
003d0000-5683-b7cd-5548-dc94a1287bb1	00160000-5683-b7cc-17d9-0079f3e61848	00090000-5683-b7cd-c158-2bbeb99087d2	apri	14	t
003d0000-5683-b7cd-2243-bc611e8b0e31	00160000-5683-b7cc-0db0-4996e48ef71c	00090000-5683-b7cd-a393-57adde99e326	aizv	11	t
003d0000-5683-b7cd-c132-8ecfc9d1d353	00160000-5683-b7cc-29e7-07ecf744b900	00090000-5683-b7cd-1321-df6d506c1157	aizv	12	t
003d0000-5683-b7cd-2240-6988a1741b83	00160000-5683-b7cc-17d9-0079f3e61848	00090000-5683-b7cd-f63b-3186c4409ae0	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33558915)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5683-b7cc-17d9-0079f3e61848	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5683-b7cc-0db0-4996e48ef71c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5683-b7cc-29e7-07ecf744b900	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33559328)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33558658)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5683-b7cd-644c-c3116c5a6865	\N	\N	00200000-5683-b7cd-fdcc-3b433a6dad4f	\N	\N	\N	00220000-5683-b7cc-b7a2-abdfa7e0591f	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5683-b7cd-368a-96f3831dd972	\N	\N	00200000-5683-b7cd-32a7-fc449706a081	\N	\N	\N	00220000-5683-b7cc-b7a2-abdfa7e0591f	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5683-b7cd-059b-f17ffa9431b0	\N	\N	00200000-5683-b7cd-c699-f70b2ef4e2e8	\N	\N	\N	00220000-5683-b7cc-ed55-fad7fb83a43d	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5683-b7cd-4e89-2e62f00641fb	\N	\N	00200000-5683-b7cd-9bc3-8f98b81e7942	\N	\N	\N	00220000-5683-b7cc-8580-80109edbb8dd	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5683-b7cd-9409-4e176d1b5884	\N	\N	00200000-5683-b7cd-a8f9-78e72c4f6ae6	\N	\N	\N	00220000-5683-b7cc-c6c3-d3c9cf956d2e	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33558690)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33558695)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33559250)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33558555)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5683-b7c8-0bdb-4915bd7349c7	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5683-b7c8-ce93-6f6525ff29b4	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5683-b7c8-a51b-088940b7c033	AL	ALB	008	Albania 	Albanija	\N
00040000-5683-b7c8-657f-f8aeaa18431c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5683-b7c8-fbb4-9bb7e0567ac5	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5683-b7c8-7b19-dc809102e2ea	AD	AND	020	Andorra 	Andora	\N
00040000-5683-b7c8-add2-dbf86312f1fc	AO	AGO	024	Angola 	Angola	\N
00040000-5683-b7c8-1378-9674a0c1dcd8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5683-b7c8-7ca3-85f2d27ec900	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5683-b7c8-d241-27303eee398a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5683-b7c8-d878-27c05c52fe0a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5683-b7c8-cc96-e03fa7193815	AM	ARM	051	Armenia 	Armenija	\N
00040000-5683-b7c8-d7b3-4417408a63b3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5683-b7c8-9cc2-c6e0cf95621b	AU	AUS	036	Australia 	Avstralija	\N
00040000-5683-b7c8-3720-95b8c2232317	AT	AUT	040	Austria 	Avstrija	\N
00040000-5683-b7c8-6882-e2d6fee163af	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5683-b7c8-b7a1-249d1119d0db	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5683-b7c8-9fc7-8c8828b67039	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5683-b7c8-164a-b65b1688d560	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5683-b7c8-8878-3295ff54de51	BB	BRB	052	Barbados 	Barbados	\N
00040000-5683-b7c8-83a6-9edd2b0861e7	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5683-b7c8-4407-f12265513921	BE	BEL	056	Belgium 	Belgija	\N
00040000-5683-b7c8-1e79-509e539c3fa5	BZ	BLZ	084	Belize 	Belize	\N
00040000-5683-b7c8-97e8-981d09759529	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5683-b7c8-5e81-452d7e1a9262	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5683-b7c8-20d3-4dec0ff4889a	BT	BTN	064	Bhutan 	Butan	\N
00040000-5683-b7c8-71a2-09a7739740d9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5683-b7c8-2660-0e8957988ba9	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5683-b7c8-9b28-eb7d855c6b36	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5683-b7c8-41aa-032663c22f02	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5683-b7c8-c5d4-797d8ef4e986	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5683-b7c8-b79c-be2b3df02806	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5683-b7c8-efc6-7267a34a4219	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5683-b7c8-1c75-4ffec484b4aa	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5683-b7c8-93a6-98528b73f637	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5683-b7c8-f946-fe0f0d2ef2bd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5683-b7c8-a39a-a5692bb09610	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5683-b7c8-04fc-686db8fc3958	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5683-b7c8-cff8-d3b20295b14e	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5683-b7c8-7428-6fca8fe79cf4	CA	CAN	124	Canada 	Kanada	\N
00040000-5683-b7c8-1dbb-2db79b1e0542	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5683-b7c8-989e-a893be82e04a	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5683-b7c8-bbe2-c8984a97ad1d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5683-b7c8-c7c8-43aa28acde86	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5683-b7c8-a824-10f66712f8f7	CL	CHL	152	Chile 	Čile	\N
00040000-5683-b7c8-ccdb-b7189563d6ea	CN	CHN	156	China 	Kitajska	\N
00040000-5683-b7c8-2674-8e637eba5a05	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5683-b7c8-839c-b3443a8857c7	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5683-b7c8-9232-fc011c6392d2	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5683-b7c8-49eb-529ff549a2e5	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5683-b7c8-0bcf-49b2cc64a574	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5683-b7c8-9f68-67d63297d49b	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5683-b7c8-8a69-90f5eccb7a9a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5683-b7c8-a1e0-246872d4a298	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5683-b7c8-3499-4e0adab7e4b5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5683-b7c8-290c-a5edabd29a56	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5683-b7c8-d517-fac0c0b97b16	CU	CUB	192	Cuba 	Kuba	\N
00040000-5683-b7c8-132d-bb07545092c5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5683-b7c8-a291-dbdb9b037313	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5683-b7c8-01c8-dc25bb661669	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5683-b7c8-42f4-5067ecd10456	DK	DNK	208	Denmark 	Danska	\N
00040000-5683-b7c8-3680-a252772c2517	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5683-b7c8-5b8b-56267abc1b8f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5683-b7c8-c3a3-a47ce5d28769	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5683-b7c8-cc01-88fa486f5984	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5683-b7c8-db5b-a0ae231d61c9	EG	EGY	818	Egypt 	Egipt	\N
00040000-5683-b7c8-5fea-81ec509bcbd1	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5683-b7c8-fd81-c519ac00e3b9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5683-b7c8-8c5f-cfb201ec02ec	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5683-b7c8-7dff-618ca7faecb9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5683-b7c8-d076-a6736f90ee5a	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5683-b7c8-0eb7-d39de107751f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5683-b7c8-e7b5-9fcd0c1307c9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5683-b7c8-29bf-6ec46e209990	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5683-b7c8-5a7a-939f8f769852	FI	FIN	246	Finland 	Finska	\N
00040000-5683-b7c8-060e-e3175afe5ffc	FR	FRA	250	France 	Francija	\N
00040000-5683-b7c8-ceee-573e4a520edc	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5683-b7c8-659e-5d5a9e28b6d1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5683-b7c8-3f61-e0ea8a5495a4	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5683-b7c8-6b9b-57386034d11b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5683-b7c8-c0a3-11c0986089b6	GA	GAB	266	Gabon 	Gabon	\N
00040000-5683-b7c8-cd9a-2d41a6de3bb3	GM	GMB	270	Gambia 	Gambija	\N
00040000-5683-b7c8-e293-b4be9432d22f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5683-b7c8-f515-e56b6b932dd5	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5683-b7c8-3fcd-a0449e05257b	GH	GHA	288	Ghana 	Gana	\N
00040000-5683-b7c8-adfd-467971e558ae	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5683-b7c8-5d4e-7db490867eab	GR	GRC	300	Greece 	Grčija	\N
00040000-5683-b7c8-d031-4f1cf411700a	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5683-b7c8-4f0c-63e81c1ea186	GD	GRD	308	Grenada 	Grenada	\N
00040000-5683-b7c8-af3d-727ad6ab666f	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5683-b7c8-24ab-c9956791293d	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5683-b7c8-a09c-356e73621be0	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5683-b7c8-e783-c7586337b42d	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5683-b7c8-9cef-e58ce72b6998	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5683-b7c8-b412-d058330f6b18	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5683-b7c8-fb81-78aec20ccef0	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5683-b7c8-be3e-cd51517f0aa9	HT	HTI	332	Haiti 	Haiti	\N
00040000-5683-b7c8-6f99-1ee82381ed2e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5683-b7c8-f1b6-0a33bdf8d540	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5683-b7c8-29da-f5fe8a315ca3	HN	HND	340	Honduras 	Honduras	\N
00040000-5683-b7c8-edac-60d7cdb21fbd	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5683-b7c8-b835-9d9e7ec91e00	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5683-b7c8-ea7f-4c9cc565099e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5683-b7c8-1ec6-9059351fd187	IN	IND	356	India 	Indija	\N
00040000-5683-b7c8-6038-452fe39941ec	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5683-b7c8-eeec-d15553342e0d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5683-b7c8-db6d-d7ba1d251660	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5683-b7c8-9c07-0df10423258f	IE	IRL	372	Ireland 	Irska	\N
00040000-5683-b7c8-0247-c8cb3b8c96d1	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5683-b7c8-8742-3e4f5f1e063f	IL	ISR	376	Israel 	Izrael	\N
00040000-5683-b7c8-ba14-ff0637f5b619	IT	ITA	380	Italy 	Italija	\N
00040000-5683-b7c8-84d3-ec67b478b95f	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5683-b7c8-4837-54bcc1a612b5	JP	JPN	392	Japan 	Japonska	\N
00040000-5683-b7c8-ebb0-14c560a5ca86	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5683-b7c8-9251-f077c8d7b052	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5683-b7c8-ce11-a93fa5f788cc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5683-b7c8-8687-1869a518c6f7	KE	KEN	404	Kenya 	Kenija	\N
00040000-5683-b7c8-bc53-7644ec648ba8	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5683-b7c8-b89b-a6a9bbc41054	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5683-b7c8-0f89-38a95c4fe6de	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5683-b7c8-a5fe-cbbac4c5611b	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5683-b7c8-4601-98bc0bdb8c85	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5683-b7c8-ea57-1c08592f8240	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5683-b7c8-38b2-eba1359903e0	LV	LVA	428	Latvia 	Latvija	\N
00040000-5683-b7c8-bd89-f80adf057a0a	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5683-b7c8-cb7f-9b1886c48950	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5683-b7c8-aad8-a254e62b461e	LR	LBR	430	Liberia 	Liberija	\N
00040000-5683-b7c8-4de6-34ab746d162f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5683-b7c8-7f9a-1b3120d0773f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5683-b7c8-5f30-a019f114f822	LT	LTU	440	Lithuania 	Litva	\N
00040000-5683-b7c8-acd7-e3b88a32d8ca	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5683-b7c8-d865-983b826dee42	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5683-b7c8-933c-6f50f86a1674	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5683-b7c8-4c99-ab015ad13116	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5683-b7c8-4729-a507eeb45d67	MW	MWI	454	Malawi 	Malavi	\N
00040000-5683-b7c8-44c0-aecea12aa465	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5683-b7c8-abd1-e14f48e9d03e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5683-b7c8-e914-15ff0df15ac6	ML	MLI	466	Mali 	Mali	\N
00040000-5683-b7c8-ce2f-c22cfc420837	MT	MLT	470	Malta 	Malta	\N
00040000-5683-b7c8-61e4-53d038e008fe	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5683-b7c8-d48b-c1a1f8884ab7	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5683-b7c8-d16b-dfa75b01a675	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5683-b7c8-f9bd-bc5573054f87	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5683-b7c8-1a2a-c5cc38e6611c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5683-b7c8-0a17-cdd22de6bd26	MX	MEX	484	Mexico 	Mehika	\N
00040000-5683-b7c8-6922-1490fabb0df0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5683-b7c8-00f1-7442720211ac	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5683-b7c8-b0b8-a68db90635f2	MC	MCO	492	Monaco 	Monako	\N
00040000-5683-b7c8-c5f7-7223aafdf1ea	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5683-b7c8-a173-20325edb3175	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5683-b7c8-a7dd-7532d8097884	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5683-b7c8-9d85-e6b2d59d834a	MA	MAR	504	Morocco 	Maroko	\N
00040000-5683-b7c8-211c-e0dc9622a4cc	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5683-b7c8-c37f-27aa32e74abc	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5683-b7c8-9852-d0cf81e0bdb3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5683-b7c8-7dd2-2f9bbf90f450	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5683-b7c8-c3e4-b95b0638864a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5683-b7c8-33c4-33eecf16c2bf	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5683-b7c8-0b06-dacc7ca36601	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5683-b7c8-57ad-5a7c57acf488	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5683-b7c8-e915-f799e24b8df3	NE	NER	562	Niger 	Niger 	\N
00040000-5683-b7c8-e9c5-2f8069c70488	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5683-b7c8-b6da-742b49732486	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5683-b7c8-dc09-91b5cc02a8ef	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5683-b7c8-3fcf-b9c31835f75e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5683-b7c8-1840-bd1d277d6944	NO	NOR	578	Norway 	Norveška	\N
00040000-5683-b7c8-a3c7-6f09bdf58ed5	OM	OMN	512	Oman 	Oman	\N
00040000-5683-b7c8-ba75-c7c2aa7f5602	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5683-b7c8-a635-a3e8f86a893a	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5683-b7c8-c4d8-375b286a6168	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5683-b7c8-3518-9cd4b9983144	PA	PAN	591	Panama 	Panama	\N
00040000-5683-b7c8-129d-d692182ffe8b	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5683-b7c8-66ef-e1ebc7fc6077	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5683-b7c8-9b88-527d89d34b42	PE	PER	604	Peru 	Peru	\N
00040000-5683-b7c8-d68d-a5eba153e62e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5683-b7c8-4e36-d904166b33b8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5683-b7c8-e863-890d259f3d1b	PL	POL	616	Poland 	Poljska	\N
00040000-5683-b7c8-846e-423a6c1a45be	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5683-b7c8-51e2-900005fd5267	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5683-b7c8-5304-7e0be877f9f4	QA	QAT	634	Qatar 	Katar	\N
00040000-5683-b7c8-5772-9516d022a741	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5683-b7c8-53a8-c78c428985bd	RO	ROU	642	Romania 	Romunija	\N
00040000-5683-b7c8-7e4f-6dfcbb9b3bbe	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5683-b7c8-c0e1-2249ba58d951	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5683-b7c8-4ccd-00f1f69a2dc5	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5683-b7c8-944e-c38a334d29ee	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5683-b7c8-cd0b-2e2cee5dcbfc	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5683-b7c8-a0dc-76d15e1df2c4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5683-b7c8-1f3e-a14b8c10185f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5683-b7c8-0e79-1c37c2a30d2e	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5683-b7c8-814b-10b2138b4442	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5683-b7c8-1e5e-b752f0fe2085	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5683-b7c8-1595-2b72f057129c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5683-b7c8-cdcc-c4b855b7d95d	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5683-b7c8-b6f5-93efb9d9f5dd	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5683-b7c8-80d8-e36b7d01d14b	SN	SEN	686	Senegal 	Senegal	\N
00040000-5683-b7c8-0be8-04d5d0b631c4	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5683-b7c8-1cec-a29d9cd66664	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5683-b7c8-7362-272b067ae2f5	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5683-b7c8-ad12-f5f270a92cb3	SG	SGP	702	Singapore 	Singapur	\N
00040000-5683-b7c8-05da-6307483bad20	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5683-b7c8-1531-281648909412	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5683-b7c8-aeb3-edba8a647830	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5683-b7c8-39b1-16f8e6183aa4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5683-b7c8-3876-f89ac0c07cd2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5683-b7c8-c38b-df8155cd97ff	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5683-b7c8-0933-d9792d70266b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5683-b7c8-32d2-11fcfe86f8ed	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5683-b7c8-6a89-4f0177474d92	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5683-b7c8-57ff-f1c982034753	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5683-b7c8-45f3-d6ccedf6faea	SD	SDN	729	Sudan 	Sudan	\N
00040000-5683-b7c8-e7bd-afd4b9751981	SR	SUR	740	Suriname 	Surinam	\N
00040000-5683-b7c8-a6e9-2d9270b6a767	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5683-b7c8-1780-96a4e93ea07c	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5683-b7c8-265d-3a0701dc6053	SE	SWE	752	Sweden 	Švedska	\N
00040000-5683-b7c8-1f53-36322b8db735	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5683-b7c8-ef01-4deccc9fefa0	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5683-b7c8-3722-bb6502a87a39	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5683-b7c8-51f8-20dc11f73e0f	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5683-b7c8-70b4-2eaad79326e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5683-b7c8-f5fc-d77ce57c7230	TH	THA	764	Thailand 	Tajska	\N
00040000-5683-b7c8-c865-e12b95e22f77	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5683-b7c8-1c1f-6389ceebf1f2	TG	TGO	768	Togo 	Togo	\N
00040000-5683-b7c8-0921-fabedffc1926	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5683-b7c8-7eb9-a65373ccb596	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5683-b7c8-9f5c-05e7a4a1a716	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5683-b7c8-ee36-58c964cfe5fa	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5683-b7c8-b5d8-6cb8c01a9807	TR	TUR	792	Turkey 	Turčija	\N
00040000-5683-b7c8-642a-256c14e2581e	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5683-b7c8-220c-b9012f094716	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5683-b7c8-0877-943faee4343d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5683-b7c8-aa43-d5e3141d4346	UG	UGA	800	Uganda 	Uganda	\N
00040000-5683-b7c8-b6c0-ab719cae58c0	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5683-b7c8-7324-f7faed7194ed	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5683-b7c8-cf0b-44ec7a337692	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5683-b7c8-5a76-1393abefe743	US	USA	840	United States 	Združene države Amerike	\N
00040000-5683-b7c8-4669-90d120f276e2	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5683-b7c8-92df-abcf2f94cd92	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5683-b7c8-a037-3b366ec70bf7	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5683-b7c8-1699-a7cafa257351	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5683-b7c8-9798-b84d85d30a28	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5683-b7c8-6465-b9e0ca1483a9	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5683-b7c8-c028-2ff58657629f	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5683-b7c8-fcf9-cb161555b6e4	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5683-b7c8-8dcf-5f1927eec820	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5683-b7c8-fb9a-8b1b68999532	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5683-b7c8-f92e-27e9abc33eec	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5683-b7c8-3202-f738a0c20754	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5683-b7c8-af8c-6d0c14743197	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33559038)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5683-b7cd-0439-525bfba80e24	000e0000-5683-b7cd-d4da-ebd16511945d	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5683-b7c8-5d19-8ec2ae8de950	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5683-b7cd-e9a1-8fc10d701cad	000e0000-5683-b7cd-4c8f-94c9d8645f9c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5683-b7c8-6416-e49c6ed4d785	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5683-b7cd-82e7-21168be8ab48	000e0000-5683-b7cd-37b5-f1f0e069102a	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5683-b7c8-5d19-8ec2ae8de950	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5683-b7cd-95e8-4f86645910a3	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5683-b7cd-e4ad-259456aa7b80	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33558838)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5683-b7cd-3a78-2c89d96bc200	000e0000-5683-b7cd-3277-139a54559938	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	0	000f0000-5683-b7c8-2350-7b23afd24c31
000d0000-5683-b7cd-599e-8e73bbaaf548	000e0000-5683-b7cd-3277-139a54559938	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	0	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-cc24-bb26625e7e6a	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-6a07-39efdb3928f8	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5683-b7c8-2350-7b23afd24c31
000d0000-5683-b7cd-0e52-2bd95530ab27	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-b6a0-4b2fe6a8e5a0	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-da82-9980c18b1e03	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-5a68-9166f125b0c5	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5683-b7c8-bed2-ac75fefdfda3
000d0000-5683-b7cd-4b6f-ef5ea30e07b5	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-1407-1f3593d6a9ca	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5683-b7c8-0020-f9aafe5cb918
000d0000-5683-b7cd-12af-479fe0731050	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-89db-b3cd33b5a01e	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5683-b7c8-0020-f9aafe5cb918
000d0000-5683-b7cd-78e0-47f12a3ba437	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-a723-d9f01c3847fa	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5683-b7c8-2350-7b23afd24c31
000d0000-5683-b7cd-cfaa-f462019e1cf1	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-447d-ce1fe71a4764	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5683-b7c8-2350-7b23afd24c31
000d0000-5683-b7cd-d29a-f9b1e63a94cb	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-fe83-ac2200ecc1fc	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5683-b7c8-e30d-cd44b7b56091
000d0000-5683-b7cd-9dd1-ca931ed66893	000e0000-5683-b7cd-4c8f-94c9d8645f9c	000c0000-5683-b7cd-59b1-549e51cde4c3	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5683-b7c8-bc70-b4d14cf8ecc4
000d0000-5683-b7cd-116f-408f33994db6	000e0000-5683-b7cd-2ef8-cd99b972e854	000c0000-5683-b7cd-b234-f34fbe211543	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-82d9-54eb32468d87	000e0000-5683-b7cd-a551-1535ddda7763	000c0000-5683-b7cd-c611-1a1c51db168e	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-aadf-0e1cbd896b1a	000e0000-5683-b7cd-a551-1535ddda7763	000c0000-5683-b7cd-2c9b-4f37d54b55df	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-19ee-529ab0f02317	000e0000-5683-b7cd-46fb-e54d294d7d44	000c0000-5683-b7cd-8a65-408b67e276a4	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-8074-b6e62d3721fb	000e0000-5683-b7cd-1350-6cbd8526b1b1	000c0000-5683-b7cd-412f-8882d699b572	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-74f3-85c65dc53d54	000e0000-5683-b7cd-58da-2fcaf700c7e4	000c0000-5683-b7ce-8c08-31a71df8512f	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	1	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-80fe-d0702e420103	000e0000-5683-b7cd-896a-60f620826e4f	000c0000-5683-b7ce-0728-0c4b233353c2	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	1	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-d754-3e11b36b6753	000e0000-5683-b7cd-1f73-6c471d9f8d80	000c0000-5683-b7ce-bcc3-46faeb39ddea	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-6055-3e6116560459	000e0000-5683-b7cd-1127-02a0ebde7d56	000c0000-5683-b7ce-96ad-7ab762ab9740	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-42cf-42ef7c16ddd7	000e0000-5683-b7cd-1127-02a0ebde7d56	000c0000-5683-b7ce-8d52-265fbcc1c24f	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	4	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-2137-5e9240988f76	000e0000-5683-b7cd-42a0-489f60e16519	000c0000-5683-b7ce-6f8a-918f1dbf10d6	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	1	000f0000-5683-b7c8-6e29-aa74ba3da1ed
000d0000-5683-b7cd-6c6b-8bcbdeddca2e	000e0000-5683-b7cd-42a0-489f60e16519	000c0000-5683-b7ce-b2f1-7c839f1b4f3c	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	2	000f0000-5683-b7c8-6e29-aa74ba3da1ed
\.


--
-- TOC entry 3135 (class 0 OID 33558629)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33558595)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33558572)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5683-b7cd-2a9a-00b1ae446cb7	00080000-5683-b7cd-8f44-9c6a5827a908	00090000-5683-b7cd-f68f-52738ea92b9e	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33558752)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33559308)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5683-b7cd-87dc-ac0eac547700	00010000-5683-b7ca-4266-4cd2f75877e5	\N	Prva mapa	Root mapa	2015-12-30 11:54:05	2015-12-30 11:54:05	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33559321)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33559343)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 33138684)
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
\.


--
-- TOC entry 3151 (class 0 OID 33558777)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33558529)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5683-b7ca-34fd-f89e4894545e	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5683-b7ca-3d6f-04c812ad95eb	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5683-b7ca-0b35-72466dbe5cb3	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5683-b7ca-7f6b-d74052f75ac2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5683-b7ca-0b35-35659ad8c251	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5683-b7ca-faf7-315d03c46fdb	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5683-b7ca-1989-e2222e93954f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5683-b7ca-e320-3b4d5f3dc8b3	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5683-b7ca-f7af-f29ac00bba5c	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5683-b7ca-554e-ff774f2d1cb6	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5683-b7ca-8cfb-c99210cb4723	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5683-b7ca-c9d3-f40b564b9ae8	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5683-b7ca-c5f8-d4a7b1ef01ce	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5683-b7ca-32b2-8bdd8d1ee79a	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5683-b7cc-9cf8-6b6b823d0716	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5683-b7cc-66f2-35b7b6cf5af8	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5683-b7cc-6376-0b76ec992533	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5683-b7cc-5ee6-bc1534ce088f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5683-b7cc-8dd8-9cb0bdbbe252	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5683-b7cf-1b9a-3932f5a79a7e	application.tenant.maticnopodjetje	string	s:36:"00080000-5683-b7cf-eec8-09a74f262fde";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33558429)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5683-b7cc-3c49-94e1691789b4	00000000-5683-b7cc-9cf8-6b6b823d0716	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5683-b7cc-9803-bfa5cd59caa8	00000000-5683-b7cc-9cf8-6b6b823d0716	00010000-5683-b7ca-4266-4cd2f75877e5	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5683-b7cc-85a0-f1dd14a3e0d2	00000000-5683-b7cc-66f2-35b7b6cf5af8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33558496)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5683-b7cd-a535-8197ba85e95c	\N	00100000-5683-b7cd-bdea-f7f2fd0c05f4	00100000-5683-b7cd-351e-d17aec1747a8	01	Gledališče Nimbis
00410000-5683-b7cd-9b38-ccc88ce3f365	00410000-5683-b7cd-a535-8197ba85e95c	00100000-5683-b7cd-bdea-f7f2fd0c05f4	00100000-5683-b7cd-351e-d17aec1747a8	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33558440)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5683-b7cd-3704-0157438f9c05	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5683-b7cd-6490-37ab3fc790fe	00010000-5683-b7cc-d2b3-e5d9e25f5d3a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5683-b7cd-6e7a-9bf47b1ae3f7	00010000-5683-b7cc-4781-f8761ab6f1ad	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5683-b7cd-710e-6b30d2acf72b	00010000-5683-b7cc-a70e-f47d38b176a5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5683-b7cd-cf31-9629f76b36dd	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5683-b7cd-73c4-68811c46f2ce	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5683-b7cd-7cc7-70dfd43a391f	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5683-b7cd-e245-d0695557a133	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5683-b7cd-f68f-52738ea92b9e	00010000-5683-b7cc-4100-21e637320ca6	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5683-b7cd-8e66-310dbadc850c	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5683-b7cd-9801-ea85f4b30dd8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5683-b7cd-b940-df334d447dcb	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5683-b7cd-4c21-ef0cec5189b1	00010000-5683-b7cc-26fb-3f1855a2ddd9	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5683-b7cd-5d9b-b5d8a4c1e674	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5683-b7cd-c158-2bbeb99087d2	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5683-b7cd-a393-57adde99e326	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5683-b7cd-1321-df6d506c1157	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5683-b7cd-f63b-3186c4409ae0	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5683-b7cd-a5fc-ee7426ac80e1	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5683-b7cd-0dc3-c9996a8a7cea	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5683-b7cd-19e8-39f3f939596f	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33558375)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5683-b7c9-1cef-3f4e04fe9b50	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5683-b7c9-7166-a1b207068284	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5683-b7c9-32e8-d04f31ffa38e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5683-b7c9-236f-1a1f37ac2cca	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5683-b7c9-eefe-f92a9ca4f6ce	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5683-b7c9-9347-6a70390bf18f	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5683-b7c9-0b7c-223e1ee86782	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5683-b7c9-1888-a410436b0a54	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5683-b7c9-13fa-9c5aab42f746	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5683-b7c9-b9be-3982cb7682b5	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5683-b7c9-c8aa-89e5ae794ed4	Abonma-read	Abonma - branje	t
00030000-5683-b7c9-b081-e842aa381ee1	Abonma-write	Abonma - spreminjanje	t
00030000-5683-b7c9-419a-5019d42eb50f	Alternacija-read	Alternacija - branje	t
00030000-5683-b7c9-0a1a-edd0e4f11a22	Alternacija-write	Alternacija - spreminjanje	t
00030000-5683-b7c9-d861-10645a49779c	Arhivalija-read	Arhivalija - branje	t
00030000-5683-b7c9-08bb-781083a40016	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5683-b7c9-6ee0-2b97e341779b	AuthStorage-read	AuthStorage - branje	t
00030000-5683-b7c9-b0b1-1ffcb9842b53	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5683-b7c9-b16b-fb5f7ed57198	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5683-b7c9-b7ff-bcf4c48e487c	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5683-b7c9-ede5-1824d2601acc	Besedilo-read	Besedilo - branje	t
00030000-5683-b7c9-3e82-645fe75dcf26	Besedilo-write	Besedilo - spreminjanje	t
00030000-5683-b7c9-b3bd-e4f5ff35a271	Dogodek-read	Dogodek - branje	t
00030000-5683-b7c9-e213-91e706f6f3b7	Dogodek-write	Dogodek - spreminjanje	t
00030000-5683-b7c9-03df-75cb66207762	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5683-b7c9-a04c-5ec09e2b12a3	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5683-b7c9-b2e7-f3e0d8b9f5d2	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5683-b7c9-6598-778e75498e2c	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5683-b7c9-279d-08ee689f6979	DogodekTrait-read	DogodekTrait - branje	t
00030000-5683-b7c9-8930-b9be9f4e1365	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5683-b7c9-31c6-7748e84589c6	DrugiVir-read	DrugiVir - branje	t
00030000-5683-b7c9-565c-a3920e69db29	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5683-b7c9-8cdb-4c96553e83cc	Drzava-read	Drzava - branje	t
00030000-5683-b7c9-a54a-78fc1f1016b6	Drzava-write	Drzava - spreminjanje	t
00030000-5683-b7c9-b372-e8fc703ec632	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5683-b7c9-a7cc-fce3276e3178	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5683-b7c9-54dc-498a9432cf30	Funkcija-read	Funkcija - branje	t
00030000-5683-b7c9-d4ea-186ebb4fc697	Funkcija-write	Funkcija - spreminjanje	t
00030000-5683-b7c9-b698-ee0791ee0bc7	Gostovanje-read	Gostovanje - branje	t
00030000-5683-b7c9-8362-770de9644fdc	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5683-b7c9-e931-e6abd5d72679	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5683-b7c9-3fd0-24451f15ba9e	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5683-b7c9-88a0-4baa57d811c1	Kupec-read	Kupec - branje	t
00030000-5683-b7c9-64a4-640da8c94315	Kupec-write	Kupec - spreminjanje	t
00030000-5683-b7c9-24eb-ab3c8d0bd11d	NacinPlacina-read	NacinPlacina - branje	t
00030000-5683-b7c9-d410-a6426252eecd	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5683-b7c9-2e40-7e50a62c62e6	Option-read	Option - branje	t
00030000-5683-b7c9-d59f-01cd1d74368f	Option-write	Option - spreminjanje	t
00030000-5683-b7c9-2246-1a2986e19e86	OptionValue-read	OptionValue - branje	t
00030000-5683-b7c9-a196-2983f151fb3b	OptionValue-write	OptionValue - spreminjanje	t
00030000-5683-b7c9-8165-255146b44d5b	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5683-b7c9-03cd-85ed10abaf2c	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5683-b7c9-d7ed-ed642a287f6a	Oseba-read	Oseba - branje	t
00030000-5683-b7c9-3abd-276463393e63	Oseba-write	Oseba - spreminjanje	t
00030000-5683-b7c9-bd07-75e33278dbbe	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5683-b7c9-92bf-1efbaa6237c8	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5683-b7c9-123d-35c7b287874d	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5683-b7c9-da11-485c58632339	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5683-b7c9-d1d9-6990c68df5aa	Pogodba-read	Pogodba - branje	t
00030000-5683-b7c9-1b8f-1714f3229d38	Pogodba-write	Pogodba - spreminjanje	t
00030000-5683-b7c9-efe0-90a3af7108c6	Popa-read	Popa - branje	t
00030000-5683-b7c9-4cc9-5adfef61e29e	Popa-write	Popa - spreminjanje	t
00030000-5683-b7c9-6a91-824789dadaa4	Posta-read	Posta - branje	t
00030000-5683-b7c9-f224-79c8f9852d22	Posta-write	Posta - spreminjanje	t
00030000-5683-b7c9-60da-ec031b2bea83	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5683-b7c9-23ea-b848a225e31f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5683-b7c9-acbe-d257be38da6a	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5683-b7c9-3aa9-994fa9bbaae6	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5683-b7c9-dff0-f552f48fb437	PostniNaslov-read	PostniNaslov - branje	t
00030000-5683-b7c9-d70f-88623d296258	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5683-b7c9-076e-073de390ce07	Praznik-read	Praznik - branje	t
00030000-5683-b7c9-45a7-a494e3e493cd	Praznik-write	Praznik - spreminjanje	t
00030000-5683-b7c9-e7d4-7bc2a10d0671	Predstava-read	Predstava - branje	t
00030000-5683-b7c9-f942-4a31949f2afb	Predstava-write	Predstava - spreminjanje	t
00030000-5683-b7c9-cbd5-9ef0f8fac9c7	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5683-b7c9-5be3-198518e364e7	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5683-b7c9-5c87-745c557ee3b4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5683-b7c9-7dc9-1f8829983162	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5683-b7c9-8253-9cc21f8bcff6	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5683-b7c9-54af-4c05b107f787	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5683-b7c9-0ed8-7f835990a745	ProgramDela-read	ProgramDela - branje	t
00030000-5683-b7c9-3d41-3cebda4611f7	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5683-b7c9-e689-d13cb9439f07	ProgramFestival-read	ProgramFestival - branje	t
00030000-5683-b7c9-7262-b5e6d6a02a06	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5683-b7c9-42d4-05c2982c8083	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5683-b7c9-419e-0ec83470e1fa	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5683-b7c9-d4c9-153616632a22	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5683-b7c9-ad90-105b8fb661a5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5683-b7c9-2829-db59c980bf62	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5683-b7c9-e844-b9f545d25f7a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5683-b7c9-59ef-1635f978a5ab	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5683-b7c9-a1e4-9d9b6b51dd9e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5683-b7c9-07f0-872208d3da93	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5683-b7c9-7198-6ba173d981b5	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5683-b7c9-6106-de47a3eca7b8	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5683-b7c9-dd81-aa39c11d5634	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5683-b7c9-25ef-cfbbd6ffcc8d	ProgramRazno-read	ProgramRazno - branje	t
00030000-5683-b7c9-d0d2-02d65c362de1	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5683-b7c9-4539-7b8575031c6b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5683-b7c9-7546-2814620e2fe2	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5683-b7c9-3d9d-4088e82547c0	Prostor-read	Prostor - branje	t
00030000-5683-b7c9-1a51-a0116c0cd3e4	Prostor-write	Prostor - spreminjanje	t
00030000-5683-b7c9-bf3a-31ce7afc9ba7	Racun-read	Racun - branje	t
00030000-5683-b7c9-f4af-02ea0e0d917c	Racun-write	Racun - spreminjanje	t
00030000-5683-b7c9-2304-0d1902086cc0	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5683-b7c9-3a18-f724d74fc1c2	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5683-b7c9-aad7-18c66905bd6e	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5683-b7c9-48f3-d5dc85e50f01	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5683-b7c9-a326-7b65d73cb620	Rekvizit-read	Rekvizit - branje	t
00030000-5683-b7c9-1905-c868dedf9568	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5683-b7c9-50f6-7935460f6406	Revizija-read	Revizija - branje	t
00030000-5683-b7c9-967c-e6c93774be6a	Revizija-write	Revizija - spreminjanje	t
00030000-5683-b7c9-325c-fab93c58b376	Rezervacija-read	Rezervacija - branje	t
00030000-5683-b7c9-116d-cd2be3d95dc4	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5683-b7c9-0ec1-0253955ff382	SedezniRed-read	SedezniRed - branje	t
00030000-5683-b7c9-89c8-abdde228106e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5683-b7c9-21ea-6e83b748ad19	Sedez-read	Sedez - branje	t
00030000-5683-b7c9-a0ba-2f96e3505496	Sedez-write	Sedez - spreminjanje	t
00030000-5683-b7c9-7e71-12e02832cded	Sezona-read	Sezona - branje	t
00030000-5683-b7c9-8cf7-e2cd5bac04cf	Sezona-write	Sezona - spreminjanje	t
00030000-5683-b7c9-01e4-bacd215db7ec	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5683-b7c9-1ca9-64980b3f43f9	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5683-b7c9-7f6e-111385b87bd6	Telefonska-read	Telefonska - branje	t
00030000-5683-b7c9-7d39-e89b2a45ccfe	Telefonska-write	Telefonska - spreminjanje	t
00030000-5683-b7c9-1819-da12dd2c2603	TerminStoritve-read	TerminStoritve - branje	t
00030000-5683-b7c9-75cf-1db6c8cc93ab	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5683-b7c9-431d-a7c6eadaf1e6	TipFunkcije-read	TipFunkcije - branje	t
00030000-5683-b7c9-09cd-abdddeb8ab44	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5683-b7c9-9fdc-8006bb5a6b01	TipPopa-read	TipPopa - branje	t
00030000-5683-b7c9-8cd5-0096cc329836	TipPopa-write	TipPopa - spreminjanje	t
00030000-5683-b7c9-aed8-204934e26016	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5683-b7c9-1dae-0b3d27c28305	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5683-b7c9-a212-32c65f8c54e2	TipVaje-read	TipVaje - branje	t
00030000-5683-b7c9-783b-93b0e54dd2cf	TipVaje-write	TipVaje - spreminjanje	t
00030000-5683-b7c9-1733-e8ec18bc118a	Trr-read	Trr - branje	t
00030000-5683-b7c9-314c-2baf4cdf3e16	Trr-write	Trr - spreminjanje	t
00030000-5683-b7c9-20a0-c0c789e24622	Uprizoritev-read	Uprizoritev - branje	t
00030000-5683-b7c9-d356-c5c4a222f674	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5683-b7c9-9fb4-cd24c0a5dbfb	Vaja-read	Vaja - branje	t
00030000-5683-b7c9-57af-6f47696ae6f2	Vaja-write	Vaja - spreminjanje	t
00030000-5683-b7c9-bf8a-0bc3ac1b9810	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5683-b7c9-317d-a1fd056bffff	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5683-b7c9-39cf-b9b9676600bb	VrstaStroska-read	VrstaStroska - branje	t
00030000-5683-b7c9-dddc-d9aa303c4683	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5683-b7c9-2970-1e759b237e04	Zaposlitev-read	Zaposlitev - branje	t
00030000-5683-b7c9-0118-6eb711755b41	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5683-b7c9-b8c6-62f17fb539d1	Zasedenost-read	Zasedenost - branje	t
00030000-5683-b7c9-f18e-ef09217a7754	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5683-b7c9-2dd9-0cd59a1939ce	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5683-b7c9-d3cc-5023c30b5daa	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5683-b7c9-46cc-303efc72a94a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5683-b7c9-d766-6a899e2b9baf	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5683-b7c9-018d-0577ebd43e2f	Job-read	Branje opravil - samo zase - branje	t
00030000-5683-b7c9-be5b-4ea587630dbd	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5683-b7c9-b9c2-ce7c0e1ae327	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5683-b7c9-1eda-41e8f14f2918	Report-read	Report - branje	t
00030000-5683-b7c9-d914-20bfafd2ef4d	Report-write	Report - spreminjanje	t
00030000-5683-b7c9-2979-a692150a57cf	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5683-b7c9-1890-50098e49bbdd	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5683-b7c9-bed2-5e3986bee3f1	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5683-b7c9-cd40-7363e608f07b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5683-b7c9-f54a-333e93e0d7aa	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5683-b7c9-fdf0-715d0dc73051	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5683-b7c9-10d4-b3c1c52c8d8b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5683-b7c9-39c7-632c1a10da06	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5683-b7c9-784c-5383c876f64a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5683-b7c9-00e1-686824a604a4	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5683-b7c9-6050-1ace314b75af	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5683-b7c9-b643-38a8486a3ae9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5683-b7c9-d872-6161e1b5d89e	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5683-b7c9-bd18-dbc8bc5e1412	Datoteka-write	Datoteka - spreminjanje	t
00030000-5683-b7c9-2fab-324e124e2f06	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33558394)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5683-b7c9-7fd1-5b4b3cf6458e	00030000-5683-b7c9-7166-a1b207068284
00020000-5683-b7c9-7fd1-5b4b3cf6458e	00030000-5683-b7c9-1cef-3f4e04fe9b50
00020000-5683-b7c9-a3b1-659840dc5531	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-7cf4-abdb135078ee	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-4c76-ed760ed6ea55	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-4c76-ed760ed6ea55	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-4c76-ed760ed6ea55	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-4c76-ed760ed6ea55	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-4c76-ed760ed6ea55	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-4c76-ed760ed6ea55	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-0118-6eb711755b41
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-9e66-c2efb16f7b6f	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-c6a1-79aaf933349c	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-c6a1-79aaf933349c	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-c6a1-79aaf933349c	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-0cce-9fb060a3aecc	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-efa7-2a3fe2dba594	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-efa7-2a3fe2dba594	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-efa7-2a3fe2dba594	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-efa7-2a3fe2dba594	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-27b4-ecccaddc9484	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-a19e-96d1b979a86b	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-4cc9-5adfef61e29e
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-3fd0-24451f15ba9e
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-54af-4c05b107f787
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-1891-d839ed29d8f8	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-3472-fed09c974566	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-c670-62248658bedd	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-c670-62248658bedd	00030000-5683-b7c9-8cd5-0096cc329836
00020000-5683-b7c9-2e13-6cc881f81c41	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-1b33-b4c7d051f785	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-1b33-b4c7d051f785	00030000-5683-b7c9-f224-79c8f9852d22
00020000-5683-b7c9-b461-e79a366a6f4d	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-c374-29f0ab14966d	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-c374-29f0ab14966d	00030000-5683-b7c9-a54a-78fc1f1016b6
00020000-5683-b7c9-2148-129f2330aaf1	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-0a22-680da1fefd7c	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-0a22-680da1fefd7c	00030000-5683-b7c9-d766-6a899e2b9baf
00020000-5683-b7c9-a741-5533b6be6fe0	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-7470-a755c31dcd51	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-7470-a755c31dcd51	00030000-5683-b7c9-d3cc-5023c30b5daa
00020000-5683-b7c9-d6b9-e7c222a444cc	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-6016-104e2209dde2	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-6016-104e2209dde2	00030000-5683-b7c9-b081-e842aa381ee1
00020000-5683-b7c9-b5ed-329ced3b5c0b	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-2608-4554ede953f1	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-2608-4554ede953f1	00030000-5683-b7c9-1a51-a0116c0cd3e4
00020000-5683-b7c9-2608-4554ede953f1	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-2608-4554ede953f1	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-2608-4554ede953f1	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7c9-2608-4554ede953f1	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-fc9d-764187b98632	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-fc9d-764187b98632	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-fc9d-764187b98632	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-c018-89dd1755fc93	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-c018-89dd1755fc93	00030000-5683-b7c9-dddc-d9aa303c4683
00020000-5683-b7c9-76ed-17440a1b8437	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-03cd-85ed10abaf2c
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-a17f-c80dd24bd1db	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-1f3e-c6a75d2b1941	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-1f3e-c6a75d2b1941	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-1f3e-c6a75d2b1941	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-1f3e-c6a75d2b1941	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-1f3e-c6a75d2b1941	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-d4b3-fa61a902f2ab	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-d4b3-fa61a902f2ab	00030000-5683-b7c9-783b-93b0e54dd2cf
00020000-5683-b7c9-642c-8df70f1dbc0d	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-0b7c-223e1ee86782
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-1888-a410436b0a54
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-0ed8-7f835990a745
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-3d41-3cebda4611f7
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-e689-d13cb9439f07
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-7262-b5e6d6a02a06
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-42d4-05c2982c8083
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-419e-0ec83470e1fa
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-d4c9-153616632a22
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-ad90-105b8fb661a5
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-2829-db59c980bf62
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-e844-b9f545d25f7a
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-59ef-1635f978a5ab
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-a1e4-9d9b6b51dd9e
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-07f0-872208d3da93
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-7198-6ba173d981b5
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-6106-de47a3eca7b8
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-dd81-aa39c11d5634
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-25ef-cfbbd6ffcc8d
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-d0d2-02d65c362de1
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-4539-7b8575031c6b
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-7546-2814620e2fe2
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-7dc9-1f8829983162
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-565c-a3920e69db29
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-23ea-b848a225e31f
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-be5b-4ea587630dbd
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-31c6-7748e84589c6
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-5c87-745c557ee3b4
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-60da-ec031b2bea83
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-018d-0577ebd43e2f
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-756a-738c55433cf0	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-0ed8-7f835990a745
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-e689-d13cb9439f07
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-42d4-05c2982c8083
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-d4c9-153616632a22
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-2829-db59c980bf62
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-59ef-1635f978a5ab
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-07f0-872208d3da93
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-6106-de47a3eca7b8
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-25ef-cfbbd6ffcc8d
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-4539-7b8575031c6b
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-5c87-745c557ee3b4
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-31c6-7748e84589c6
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-60da-ec031b2bea83
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-018d-0577ebd43e2f
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-02c2-3a03544902bd	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-b9be-3982cb7682b5
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-2c03-a0c497f66a91	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-82a5-f0ed5cfed204	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-862f-106612f9a388	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-1b8f-1714f3229d38
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-b63f-ed287e7c9c78	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-ee6e-55d361c8990e	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-cc82-db7ebe35cb44	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-5ec4-78912f48befe	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-5ec4-78912f48befe	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7c9-5ec4-78912f48befe	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-5ec4-78912f48befe	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-20da-13a131633777	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-20da-13a131633777	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-31c6-7748e84589c6
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-565c-a3920e69db29
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-b9be-3982cb7682b5
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-018d-0577ebd43e2f
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-be5b-4ea587630dbd
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-1b8f-1714f3229d38
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-60da-ec031b2bea83
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-23ea-b848a225e31f
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-5c87-745c557ee3b4
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-7dc9-1f8829983162
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-0b7c-223e1ee86782
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-0ed8-7f835990a745
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-1888-a410436b0a54
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-3d41-3cebda4611f7
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-e689-d13cb9439f07
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-7262-b5e6d6a02a06
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-42d4-05c2982c8083
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-419e-0ec83470e1fa
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-d4c9-153616632a22
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-ad90-105b8fb661a5
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-2829-db59c980bf62
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-e844-b9f545d25f7a
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-59ef-1635f978a5ab
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-a1e4-9d9b6b51dd9e
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-07f0-872208d3da93
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-7198-6ba173d981b5
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-6106-de47a3eca7b8
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-dd81-aa39c11d5634
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-25ef-cfbbd6ffcc8d
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-d0d2-02d65c362de1
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-4539-7b8575031c6b
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-7546-2814620e2fe2
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-1cbd-90cdf4b76eff	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-5337-d38889bae385	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-b9be-3982cb7682b5
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-cd47-451f97dd0add	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-31c6-7748e84589c6
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-565c-a3920e69db29
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-b9be-3982cb7682b5
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-018d-0577ebd43e2f
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-be5b-4ea587630dbd
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-3fd0-24451f15ba9e
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-1b8f-1714f3229d38
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-4cc9-5adfef61e29e
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-60da-ec031b2bea83
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-23ea-b848a225e31f
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-5c87-745c557ee3b4
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-7dc9-1f8829983162
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-54af-4c05b107f787
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-0b7c-223e1ee86782
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-0ed8-7f835990a745
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-1888-a410436b0a54
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-3d41-3cebda4611f7
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-e689-d13cb9439f07
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-7262-b5e6d6a02a06
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-42d4-05c2982c8083
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-419e-0ec83470e1fa
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d4c9-153616632a22
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-ad90-105b8fb661a5
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-2829-db59c980bf62
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-e844-b9f545d25f7a
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-59ef-1635f978a5ab
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-a1e4-9d9b6b51dd9e
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-07f0-872208d3da93
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-7198-6ba173d981b5
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-6106-de47a3eca7b8
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-dd81-aa39c11d5634
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-25ef-cfbbd6ffcc8d
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d0d2-02d65c362de1
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-4539-7b8575031c6b
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-7546-2814620e2fe2
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-0118-6eb711755b41
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-52dc-f9dd4b0cc401	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-b9be-3982cb7682b5
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-3fd0-24451f15ba9e
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-4cc9-5adfef61e29e
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-54af-4c05b107f787
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-0118-6eb711755b41
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-f3e7-0893ce85a70c	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-2dc3-ee89ad0b6893	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-31c6-7748e84589c6
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-565c-a3920e69db29
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-018d-0577ebd43e2f
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-be5b-4ea587630dbd
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-3fd0-24451f15ba9e
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-03cd-85ed10abaf2c
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-1b8f-1714f3229d38
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-4cc9-5adfef61e29e
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-60da-ec031b2bea83
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-23ea-b848a225e31f
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-5c87-745c557ee3b4
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-7dc9-1f8829983162
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-54af-4c05b107f787
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-0b7c-223e1ee86782
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-0ed8-7f835990a745
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-1888-a410436b0a54
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-3d41-3cebda4611f7
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-e689-d13cb9439f07
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-7262-b5e6d6a02a06
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-42d4-05c2982c8083
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-419e-0ec83470e1fa
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-d4c9-153616632a22
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-ad90-105b8fb661a5
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-2829-db59c980bf62
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-e844-b9f545d25f7a
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-59ef-1635f978a5ab
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-a1e4-9d9b6b51dd9e
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-07f0-872208d3da93
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-7198-6ba173d981b5
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-6106-de47a3eca7b8
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-dd81-aa39c11d5634
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-25ef-cfbbd6ffcc8d
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-d0d2-02d65c362de1
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-4539-7b8575031c6b
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-7546-2814620e2fe2
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-dddc-d9aa303c4683
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-0118-6eb711755b41
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7c9-2678-0f82c959447e	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1cef-3f4e04fe9b50
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7166-a1b207068284
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-c8aa-89e5ae794ed4
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b081-e842aa381ee1
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d861-10645a49779c
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-08bb-781083a40016
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-6ee0-2b97e341779b
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b0b1-1ffcb9842b53
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b16b-fb5f7ed57198
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b7ff-bcf4c48e487c
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-ede5-1824d2601acc
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3e82-645fe75dcf26
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b3bd-e4f5ff35a271
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-236f-1a1f37ac2cca
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-03df-75cb66207762
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a04c-5ec09e2b12a3
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b2e7-f3e0d8b9f5d2
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-6598-778e75498e2c
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-279d-08ee689f6979
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8930-b9be9f4e1365
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-e213-91e706f6f3b7
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-31c6-7748e84589c6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-565c-a3920e69db29
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8cdb-4c96553e83cc
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a54a-78fc1f1016b6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b372-e8fc703ec632
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a7cc-fce3276e3178
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b9be-3982cb7682b5
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b698-ee0791ee0bc7
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8362-770de9644fdc
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b9c2-ce7c0e1ae327
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-018d-0577ebd43e2f
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-be5b-4ea587630dbd
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-e931-e6abd5d72679
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3fd0-24451f15ba9e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-88a0-4baa57d811c1
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-64a4-640da8c94315
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-10d4-b3c1c52c8d8b
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-fdf0-715d0dc73051
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1890-50098e49bbdd
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-bed2-5e3986bee3f1
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-cd40-7363e608f07b
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-f54a-333e93e0d7aa
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-24eb-ab3c8d0bd11d
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d410-a6426252eecd
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2e40-7e50a62c62e6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2246-1a2986e19e86
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a196-2983f151fb3b
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d59f-01cd1d74368f
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8165-255146b44d5b
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-03cd-85ed10abaf2c
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-bd07-75e33278dbbe
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-92bf-1efbaa6237c8
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-123d-35c7b287874d
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-da11-485c58632339
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1b8f-1714f3229d38
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-4cc9-5adfef61e29e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-6a91-824789dadaa4
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-60da-ec031b2bea83
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-23ea-b848a225e31f
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-acbe-d257be38da6a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3aa9-994fa9bbaae6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-f224-79c8f9852d22
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-076e-073de390ce07
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-45a7-a494e3e493cd
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-e7d4-7bc2a10d0671
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-f942-4a31949f2afb
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-cbd5-9ef0f8fac9c7
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-5be3-198518e364e7
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-5c87-745c557ee3b4
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7dc9-1f8829983162
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8253-9cc21f8bcff6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-54af-4c05b107f787
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-0b7c-223e1ee86782
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-0ed8-7f835990a745
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1888-a410436b0a54
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3d41-3cebda4611f7
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-e689-d13cb9439f07
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7262-b5e6d6a02a06
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-42d4-05c2982c8083
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-419e-0ec83470e1fa
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d4c9-153616632a22
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-ad90-105b8fb661a5
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2829-db59c980bf62
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-e844-b9f545d25f7a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-59ef-1635f978a5ab
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a1e4-9d9b6b51dd9e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-07f0-872208d3da93
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7198-6ba173d981b5
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-6106-de47a3eca7b8
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-dd81-aa39c11d5634
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-25ef-cfbbd6ffcc8d
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d0d2-02d65c362de1
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-4539-7b8575031c6b
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7546-2814620e2fe2
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3d9d-4088e82547c0
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1a51-a0116c0cd3e4
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-bf3a-31ce7afc9ba7
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-f4af-02ea0e0d917c
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2304-0d1902086cc0
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-3a18-f724d74fc1c2
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-aad7-18c66905bd6e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-48f3-d5dc85e50f01
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a326-7b65d73cb620
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1905-c868dedf9568
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1eda-41e8f14f2918
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d914-20bfafd2ef4d
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-50f6-7935460f6406
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-967c-e6c93774be6a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-325c-fab93c58b376
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-116d-cd2be3d95dc4
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-0ec1-0253955ff382
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-89c8-abdde228106e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-21ea-6e83b748ad19
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a0ba-2f96e3505496
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7e71-12e02832cded
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8cf7-e2cd5bac04cf
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2979-a692150a57cf
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1819-da12dd2c2603
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-32e8-d04f31ffa38e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-75cf-1db6c8cc93ab
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-431d-a7c6eadaf1e6
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-09cd-abdddeb8ab44
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-9fdc-8006bb5a6b01
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-8cd5-0096cc329836
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-aed8-204934e26016
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1dae-0b3d27c28305
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-a212-32c65f8c54e2
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-783b-93b0e54dd2cf
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-9fb4-cd24c0a5dbfb
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-57af-6f47696ae6f2
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-bf8a-0bc3ac1b9810
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-317d-a1fd056bffff
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-39cf-b9b9676600bb
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-dddc-d9aa303c4683
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d872-6161e1b5d89e
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b643-38a8486a3ae9
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-0118-6eb711755b41
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-b8c6-62f17fb539d1
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-f18e-ef09217a7754
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-2dd9-0cd59a1939ce
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d3cc-5023c30b5daa
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-46cc-303efc72a94a
00020000-5683-b7cc-a8d6-4261f23e7afc	00030000-5683-b7c9-d766-6a899e2b9baf
00020000-5683-b7cc-ae13-11f7e5bf5dac	00030000-5683-b7c9-6050-1ace314b75af
00020000-5683-b7cc-5911-442f783fdc71	00030000-5683-b7c9-00e1-686824a604a4
00020000-5683-b7cc-e9b5-16377d59b7f1	00030000-5683-b7c9-d356-c5c4a222f674
00020000-5683-b7cc-1155-83baef932f05	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7cc-453f-f3f6ecd561a7	00030000-5683-b7c9-bed2-5e3986bee3f1
00020000-5683-b7cc-c063-0d3d14c563e4	00030000-5683-b7c9-cd40-7363e608f07b
00020000-5683-b7cc-4bb1-db1d325cbb3c	00030000-5683-b7c9-f54a-333e93e0d7aa
00020000-5683-b7cc-06d2-3d003451434e	00030000-5683-b7c9-1890-50098e49bbdd
00020000-5683-b7cc-1bd9-dbb8f8b9b13c	00030000-5683-b7c9-10d4-b3c1c52c8d8b
00020000-5683-b7cc-b53e-41939f798cc3	00030000-5683-b7c9-fdf0-715d0dc73051
00020000-5683-b7cc-fa3e-3ddad5cef507	00030000-5683-b7c9-784c-5383c876f64a
00020000-5683-b7cc-25fe-aefb2f479264	00030000-5683-b7c9-39c7-632c1a10da06
00020000-5683-b7cc-dae2-6ca81b9136a4	00030000-5683-b7c9-d7ed-ed642a287f6a
00020000-5683-b7cc-6bb0-fe966cb75997	00030000-5683-b7c9-3abd-276463393e63
00020000-5683-b7cc-4b25-2aa3a463c91f	00030000-5683-b7c9-eefe-f92a9ca4f6ce
00020000-5683-b7cc-5800-f0ce081128bd	00030000-5683-b7c9-9347-6a70390bf18f
00020000-5683-b7cc-e494-177c9b150b56	00030000-5683-b7c9-bd18-dbc8bc5e1412
00020000-5683-b7cc-43fa-31461266eddd	00030000-5683-b7c9-2fab-324e124e2f06
00020000-5683-b7cc-12a8-a9b3847c5067	00030000-5683-b7c9-efe0-90a3af7108c6
00020000-5683-b7cc-12a8-a9b3847c5067	00030000-5683-b7c9-4cc9-5adfef61e29e
00020000-5683-b7cc-12a8-a9b3847c5067	00030000-5683-b7c9-20a0-c0c789e24622
00020000-5683-b7cc-41d3-9b6a4598f98c	00030000-5683-b7c9-1733-e8ec18bc118a
00020000-5683-b7cc-b654-47d52a7f2f9a	00030000-5683-b7c9-314c-2baf4cdf3e16
00020000-5683-b7cc-e65b-88cc528fb6d0	00030000-5683-b7c9-2979-a692150a57cf
00020000-5683-b7cc-30fb-e37d8e76dbf1	00030000-5683-b7c9-7f6e-111385b87bd6
00020000-5683-b7cc-0571-c37c8bfcc82a	00030000-5683-b7c9-7d39-e89b2a45ccfe
00020000-5683-b7cc-a13d-2c499ea7e0f7	00030000-5683-b7c9-dff0-f552f48fb437
00020000-5683-b7cc-700f-7bee823a0523	00030000-5683-b7c9-d70f-88623d296258
00020000-5683-b7cc-c73b-9e9a6fb8a874	00030000-5683-b7c9-2970-1e759b237e04
00020000-5683-b7cc-53a8-b2ce8364ad24	00030000-5683-b7c9-0118-6eb711755b41
00020000-5683-b7cc-9ba7-9f7ced29389f	00030000-5683-b7c9-d1d9-6990c68df5aa
00020000-5683-b7cc-c24c-7417ee42a0c1	00030000-5683-b7c9-1b8f-1714f3229d38
00020000-5683-b7cc-697c-a5bb5e0d43b3	00030000-5683-b7c9-01e4-bacd215db7ec
00020000-5683-b7cc-790d-e8e6fdd88a8c	00030000-5683-b7c9-1ca9-64980b3f43f9
00020000-5683-b7cc-d43e-0af6c3f0d946	00030000-5683-b7c9-419a-5019d42eb50f
00020000-5683-b7cc-ef42-435af114c0bd	00030000-5683-b7c9-0a1a-edd0e4f11a22
00020000-5683-b7cc-8f35-61f6e49ef757	00030000-5683-b7c9-13fa-9c5aab42f746
00020000-5683-b7cc-4f4d-ef8965f5ff36	00030000-5683-b7c9-54dc-498a9432cf30
00020000-5683-b7cc-bdec-b41f305fd2b3	00030000-5683-b7c9-d4ea-186ebb4fc697
00020000-5683-b7cc-98ec-55dff91d9bb1	00030000-5683-b7c9-b9be-3982cb7682b5
\.


--
-- TOC entry 3152 (class 0 OID 33558784)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33558818)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33558956)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5683-b7cd-4af0-de7833db337a	00090000-5683-b7cd-3704-0157438f9c05	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5683-b7cd-d726-3d193f5bf68b	00090000-5683-b7cd-73c4-68811c46f2ce	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5683-b7cd-95be-bcaf4f99b37c	00090000-5683-b7cd-4c21-ef0cec5189b1	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5683-b7cd-82ae-6bd4f5081dc4	00090000-5683-b7cd-8e66-310dbadc850c	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33558476)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5683-b7cd-8f44-9c6a5827a908	\N	00040000-5683-b7c8-aeb3-edba8a647830	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-a558-0df98dc7c471	\N	00040000-5683-b7c8-aeb3-edba8a647830	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5683-b7cd-97f4-a9e041ce3e62	\N	00040000-5683-b7c8-aeb3-edba8a647830	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-739a-b741182fc380	\N	00040000-5683-b7c8-aeb3-edba8a647830	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-9def-7b104b12d2d7	\N	00040000-5683-b7c8-aeb3-edba8a647830	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-331b-a4d0d05bd83f	\N	00040000-5683-b7c8-d878-27c05c52fe0a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-7346-0fba511a5319	\N	00040000-5683-b7c8-290c-a5edabd29a56	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-c00c-efc72b35198e	\N	00040000-5683-b7c8-3720-95b8c2232317	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cd-fe75-f4917af315b1	\N	00040000-5683-b7c8-f515-e56b6b932dd5	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5683-b7cf-eec8-09a74f262fde	\N	00040000-5683-b7c8-aeb3-edba8a647830	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33558521)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5683-b7c8-2955-631f5a47ec0a	8341	Adlešiči
00050000-5683-b7c8-ba16-a009f76989ef	5270	Ajdovščina
00050000-5683-b7c8-c684-fd66a3d7df85	6280	Ankaran/Ancarano
00050000-5683-b7c8-ac2f-2f6f7115e9f9	9253	Apače
00050000-5683-b7c8-0003-e36cdce1a3a6	8253	Artiče
00050000-5683-b7c8-f7c9-f401eba0c816	4275	Begunje na Gorenjskem
00050000-5683-b7c8-8231-24746efac619	1382	Begunje pri Cerknici
00050000-5683-b7c8-c3dd-dc664857221a	9231	Beltinci
00050000-5683-b7c8-d7fb-7668998a8e8b	2234	Benedikt
00050000-5683-b7c8-aafa-8f92952d6dd0	2345	Bistrica ob Dravi
00050000-5683-b7c8-9e80-134d0900f737	3256	Bistrica ob Sotli
00050000-5683-b7c8-55f1-fbe6e902d14a	8259	Bizeljsko
00050000-5683-b7c8-2949-86f37475c784	1223	Blagovica
00050000-5683-b7c8-df25-82413ff62da6	8283	Blanca
00050000-5683-b7c8-a362-d4210ceb3c3f	4260	Bled
00050000-5683-b7c8-4451-2ebd22c6a82e	4273	Blejska Dobrava
00050000-5683-b7c8-a0ce-6d7c9085801b	9265	Bodonci
00050000-5683-b7c8-5f26-702faf7fffd0	9222	Bogojina
00050000-5683-b7c8-4430-5e53b5d92898	4263	Bohinjska Bela
00050000-5683-b7c8-2290-15cdd14c4f0c	4264	Bohinjska Bistrica
00050000-5683-b7c8-b879-408557c71059	4265	Bohinjsko jezero
00050000-5683-b7c8-f5e1-25d56202a84e	1353	Borovnica
00050000-5683-b7c8-8e05-e758a8f8cf9b	8294	Boštanj
00050000-5683-b7c8-e9a5-66a17dd16f76	5230	Bovec
00050000-5683-b7c8-a8f3-016cbe261eca	5295	Branik
00050000-5683-b7c8-e1de-cd9e75f925b4	3314	Braslovče
00050000-5683-b7c8-1667-35bca4c6190f	5223	Breginj
00050000-5683-b7c8-38db-7c8c236c1b69	8280	Brestanica
00050000-5683-b7c8-aca3-36385734b0a0	2354	Bresternica
00050000-5683-b7c8-c4a3-8cc1c3495d29	4243	Brezje
00050000-5683-b7c8-ffff-0855b7c32336	1351	Brezovica pri Ljubljani
00050000-5683-b7c8-59c9-9ac079011514	8250	Brežice
00050000-5683-b7c8-ccc8-ccaaf1ebd5e1	4210	Brnik - Aerodrom
00050000-5683-b7c8-56d9-ac65cb7ab0ba	8321	Brusnice
00050000-5683-b7c8-5519-25218a993957	3255	Buče
00050000-5683-b7c8-eeee-b95acefd5d78	8276	Bučka 
00050000-5683-b7c8-f5d9-6695f22882ed	9261	Cankova
00050000-5683-b7c8-a89d-7f38fd587e0a	3000	Celje 
00050000-5683-b7c8-b3fb-709b7b75b726	3001	Celje - poštni predali
00050000-5683-b7c8-c202-d65c15509f92	4207	Cerklje na Gorenjskem
00050000-5683-b7c8-1d68-7ec76923bd41	8263	Cerklje ob Krki
00050000-5683-b7c8-8781-ffd3d603ce76	1380	Cerknica
00050000-5683-b7c8-b9c2-e3ae735ff980	5282	Cerkno
00050000-5683-b7c8-0a7e-f577dd528e13	2236	Cerkvenjak
00050000-5683-b7c8-3c5d-4c0ca53ec01e	2215	Ceršak
00050000-5683-b7c8-9989-78656b245c4f	2326	Cirkovce
00050000-5683-b7c8-d549-ecdf8fa7c9f0	2282	Cirkulane
00050000-5683-b7c8-cd6a-62c1df303a4b	5273	Col
00050000-5683-b7c8-c662-092fd05cefe3	8251	Čatež ob Savi
00050000-5683-b7c8-1d29-b444e863da8b	1413	Čemšenik
00050000-5683-b7c8-27fe-103673202692	5253	Čepovan
00050000-5683-b7c8-8ea6-1ed1ae87eb8a	9232	Črenšovci
00050000-5683-b7c8-dc95-ace862699196	2393	Črna na Koroškem
00050000-5683-b7c8-1f8e-763ebbcdde8b	6275	Črni Kal
00050000-5683-b7c8-129a-16265e981041	5274	Črni Vrh nad Idrijo
00050000-5683-b7c8-0757-0bf487381eb0	5262	Črniče
00050000-5683-b7c8-6606-d53a74cb7332	8340	Črnomelj
00050000-5683-b7c8-4c00-c0d17d68b143	6271	Dekani
00050000-5683-b7c8-5371-85f05894d8b0	5210	Deskle
00050000-5683-b7c8-6fed-77deed5a2833	2253	Destrnik
00050000-5683-b7c8-0ef1-70d356e6ecee	6215	Divača
00050000-5683-b7c8-0797-968e0d21ff0c	1233	Dob
00050000-5683-b7c8-5b17-45662a6bfccd	3224	Dobje pri Planini
00050000-5683-b7c8-aef2-d3825d90242b	8257	Dobova
00050000-5683-b7c8-0f1b-3118825e45e5	1423	Dobovec
00050000-5683-b7c8-3b89-769274e72114	5263	Dobravlje
00050000-5683-b7c8-afa9-096bf395e17c	3204	Dobrna
00050000-5683-b7c8-7d46-888f98ba1050	8211	Dobrnič
00050000-5683-b7c8-cb03-9fda8bc0991c	1356	Dobrova
00050000-5683-b7c8-1c43-7cfa5f76fb33	9223	Dobrovnik/Dobronak 
00050000-5683-b7c8-1342-4535a04c3c39	5212	Dobrovo v Brdih
00050000-5683-b7c8-2fce-6e26e2f96aaf	1431	Dol pri Hrastniku
00050000-5683-b7c8-4935-44585b3c19a0	1262	Dol pri Ljubljani
00050000-5683-b7c8-32cc-a396e86b2212	1273	Dole pri Litiji
00050000-5683-b7c8-f874-5fc849b978b6	1331	Dolenja vas
00050000-5683-b7c8-a6ad-ef0f38f3327b	8350	Dolenjske Toplice
00050000-5683-b7c8-1e80-7226706c0e56	1230	Domžale
00050000-5683-b7c8-4640-ea717a950e79	2252	Dornava
00050000-5683-b7c8-b706-4d137e658a68	5294	Dornberk
00050000-5683-b7c8-592c-29b21cf18f92	1319	Draga
00050000-5683-b7c8-9e81-c296a10d7464	8343	Dragatuš
00050000-5683-b7c8-a58d-a6ffbd655f94	3222	Dramlje
00050000-5683-b7c8-c26f-321b9bac4ddb	2370	Dravograd
00050000-5683-b7c8-b67c-f87dd5f23033	4203	Duplje
00050000-5683-b7c8-e795-516a4f84f132	6221	Dutovlje
00050000-5683-b7c8-833e-34eda9107bcc	8361	Dvor
00050000-5683-b7c8-1747-deb8450d51b0	2343	Fala
00050000-5683-b7c8-0f4d-b5e5a7bce00b	9208	Fokovci
00050000-5683-b7c8-409b-73bef9a86186	2313	Fram
00050000-5683-b7c8-7ca9-168657f63e9a	3213	Frankolovo
00050000-5683-b7c8-8f9d-60a3e333c2f3	1274	Gabrovka
00050000-5683-b7c8-ddc1-f707d9f07647	8254	Globoko
00050000-5683-b7c8-379f-13d4b72c022e	5275	Godovič
00050000-5683-b7c8-52e9-6d09e1caa5a3	4204	Golnik
00050000-5683-b7c8-2fae-83bbe2a99a35	3303	Gomilsko
00050000-5683-b7c8-377e-83ca5e0bbeb9	4224	Gorenja vas
00050000-5683-b7c8-3a14-eba86f356f32	3263	Gorica pri Slivnici
00050000-5683-b7c8-26c8-6497f50d235a	2272	Gorišnica
00050000-5683-b7c8-45ef-ce872c74f460	9250	Gornja Radgona
00050000-5683-b7c8-3d8a-c23fc79422dd	3342	Gornji Grad
00050000-5683-b7c8-c372-2abe51d3c8f4	4282	Gozd Martuljek
00050000-5683-b7c8-9fe5-1a23113b1b96	6272	Gračišče
00050000-5683-b7c8-c375-c472660db55f	9264	Grad
00050000-5683-b7c8-87b3-218972b05f84	8332	Gradac
00050000-5683-b7c8-ac1d-e8b9dca2dfd4	1384	Grahovo
00050000-5683-b7c8-c5fb-5594df4d081e	5242	Grahovo ob Bači
00050000-5683-b7c8-bb35-7d259f9d6f38	5251	Grgar
00050000-5683-b7c8-43dc-7afd9f9325dd	3302	Griže
00050000-5683-b7c8-bf10-6dbd660d7bcb	3231	Grobelno
00050000-5683-b7c8-7a98-c1d707c66412	1290	Grosuplje
00050000-5683-b7c8-e3b2-08f0429c176a	2288	Hajdina
00050000-5683-b7c8-1406-fe714ebe9ac0	8362	Hinje
00050000-5683-b7c8-7603-9cd559397a15	2311	Hoče
00050000-5683-b7c8-3903-c459218677c0	9205	Hodoš/Hodos
00050000-5683-b7c8-0453-e7c4ad6e5159	1354	Horjul
00050000-5683-b7c8-c9ee-f7035e0b9a55	1372	Hotedršica
00050000-5683-b7c8-68e2-9f34825e8c7c	1430	Hrastnik
00050000-5683-b7c8-71bc-a068bc1d3c06	6225	Hruševje
00050000-5683-b7c8-ebee-82ce66db9572	4276	Hrušica
00050000-5683-b7c8-af56-b32c8ec77d5a	5280	Idrija
00050000-5683-b7c8-0832-b6550481988a	1292	Ig
00050000-5683-b7c8-833b-64a8bb5dfe84	6250	Ilirska Bistrica
00050000-5683-b7c8-207b-f5ec705884ee	6251	Ilirska Bistrica-Trnovo
00050000-5683-b7c8-0851-97f95cdeb79c	1295	Ivančna Gorica
00050000-5683-b7c8-dccb-adb08130ca34	2259	Ivanjkovci
00050000-5683-b7c8-175b-fcf3583b817f	1411	Izlake
00050000-5683-b7c8-fb29-b05e9e010030	6310	Izola/Isola
00050000-5683-b7c8-8f30-63de0db62f77	2222	Jakobski Dol
00050000-5683-b7c8-387c-c99a35449b71	2221	Jarenina
00050000-5683-b7c8-497d-842159be00ea	6254	Jelšane
00050000-5683-b7c8-254d-b171ba21fbaa	4270	Jesenice
00050000-5683-b7c8-4aa5-00229b36c187	8261	Jesenice na Dolenjskem
00050000-5683-b7c8-a8cd-41ec37a13521	3273	Jurklošter
00050000-5683-b7c8-5461-edade4de65ea	2223	Jurovski Dol
00050000-5683-b7c8-fcbb-e5892b75deb5	2256	Juršinci
00050000-5683-b7c8-b5d1-9413f5dd269f	5214	Kal nad Kanalom
00050000-5683-b7c8-e1b7-e6670bf64ebe	3233	Kalobje
00050000-5683-b7c8-004b-35740c4bb5ed	4246	Kamna Gorica
00050000-5683-b7c8-dffd-0927b524eb43	2351	Kamnica
00050000-5683-b7c8-e711-7df9c378c79e	1241	Kamnik
00050000-5683-b7c8-e4eb-e5b144cf48b6	5213	Kanal
00050000-5683-b7c8-354c-7a4bf2f5f989	8258	Kapele
00050000-5683-b7c8-9db4-52a670a8b41b	2362	Kapla
00050000-5683-b7c8-6422-102ac7652a1e	2325	Kidričevo
00050000-5683-b7c8-aca1-6880489b9305	1412	Kisovec
00050000-5683-b7c8-2654-1bccba3911cf	6253	Knežak
00050000-5683-b7c8-af35-a83fa6e206cc	5222	Kobarid
00050000-5683-b7c8-336f-7286b5f53c2a	9227	Kobilje
00050000-5683-b7c8-87a5-45a52869aa34	1330	Kočevje
00050000-5683-b7c8-28be-79d96f02e234	1338	Kočevska Reka
00050000-5683-b7c8-5d7f-5c1072c78cb2	2276	Kog
00050000-5683-b7c8-0b78-b15ba2e1c263	5211	Kojsko
00050000-5683-b7c8-de4a-52112b2ef5af	6223	Komen
00050000-5683-b7c8-5669-5f785c1b6325	1218	Komenda
00050000-5683-b7c8-d2b5-9c910daa58a7	6000	Koper/Capodistria 
00050000-5683-b7c8-15ac-aacf8a604b51	6001	Koper/Capodistria - poštni predali
00050000-5683-b7c8-b536-5dce497058a3	8282	Koprivnica
00050000-5683-b7c8-5740-34ca87afdb04	5296	Kostanjevica na Krasu
00050000-5683-b7c8-77bd-b609ffe0a357	8311	Kostanjevica na Krki
00050000-5683-b7c8-358a-62c0de8e8145	1336	Kostel
00050000-5683-b7c8-ccb1-1bd12dfc472e	6256	Košana
00050000-5683-b7c8-6a62-1de0a1626d5d	2394	Kotlje
00050000-5683-b7c8-1ad7-92495ad350f4	6240	Kozina
00050000-5683-b7c8-c998-0bd11c1c5df2	3260	Kozje
00050000-5683-b7c8-10f1-4c267d947970	4000	Kranj 
00050000-5683-b7c8-6cf9-5accb60c9c8d	4001	Kranj - poštni predali
00050000-5683-b7c8-5c2b-c40af8222e45	4280	Kranjska Gora
00050000-5683-b7c8-fd6c-13a40b27e258	1281	Kresnice
00050000-5683-b7c8-ae85-1144bf64dac9	4294	Križe
00050000-5683-b7c8-cd71-07549cc43486	9206	Križevci
00050000-5683-b7c8-a499-96550336ce5c	9242	Križevci pri Ljutomeru
00050000-5683-b7c8-c383-7229079ce450	1301	Krka
00050000-5683-b7c8-33e2-277ca5c4c9ee	8296	Krmelj
00050000-5683-b7c8-63e9-b8326e4e7079	4245	Kropa
00050000-5683-b7c8-549b-bdc7c5a65a43	8262	Krška vas
00050000-5683-b7c8-5477-de01d30da0de	8270	Krško
00050000-5683-b7c8-a2c8-74453da76654	9263	Kuzma
00050000-5683-b7c8-2b19-e7707358478d	2318	Laporje
00050000-5683-b7c8-48a2-9414416aff56	3270	Laško
00050000-5683-b7c8-65c2-c86e0142a05b	1219	Laze v Tuhinju
00050000-5683-b7c8-30fc-3be20cd68011	2230	Lenart v Slovenskih goricah
00050000-5683-b7c8-6599-25ca29e87c2c	9220	Lendava/Lendva
00050000-5683-b7c8-8fbf-c17c494416e7	4248	Lesce
00050000-5683-b7c8-8896-6ff4ff4723fb	3261	Lesično
00050000-5683-b7c8-61ca-a289c91cbd91	8273	Leskovec pri Krškem
00050000-5683-b7c8-c085-8d8e587f3ec2	2372	Libeliče
00050000-5683-b7c8-faeb-8741838c5c91	2341	Limbuš
00050000-5683-b7c8-38fc-d7e779a682bc	1270	Litija
00050000-5683-b7c8-87c6-d67588cb2846	3202	Ljubečna
00050000-5683-b7c8-20bb-5e74001a9665	1000	Ljubljana 
00050000-5683-b7c8-0e6f-a988a5b28acf	1001	Ljubljana - poštni predali
00050000-5683-b7c8-0f91-09c61715da84	1231	Ljubljana - Črnuče
00050000-5683-b7c8-e08f-0a5a38981b92	1261	Ljubljana - Dobrunje
00050000-5683-b7c8-d676-533d3a83dbf2	1260	Ljubljana - Polje
00050000-5683-b7c8-0847-fd54e6bb286f	1210	Ljubljana - Šentvid
00050000-5683-b7c8-dc56-400307aaef6a	1211	Ljubljana - Šmartno
00050000-5683-b7c8-e9e0-53a00c6c8ed6	3333	Ljubno ob Savinji
00050000-5683-b7c8-7ad2-01b5f057f597	9240	Ljutomer
00050000-5683-b7c8-188f-3dfdc259d091	3215	Loče
00050000-5683-b7c8-75b7-3c2f62e37306	5231	Log pod Mangartom
00050000-5683-b7c8-a1da-c5222c7521cc	1358	Log pri Brezovici
00050000-5683-b7c8-c4d1-eef4db5bdea3	1370	Logatec
00050000-5683-b7c8-5de7-8fbc1013948b	1371	Logatec
00050000-5683-b7c8-e47e-a20f9fced7ec	1434	Loka pri Zidanem Mostu
00050000-5683-b7c8-dacd-b254fde53a43	3223	Loka pri Žusmu
00050000-5683-b7c8-758a-12940daf09a1	6219	Lokev
00050000-5683-b7c8-d6f5-941868de2497	1318	Loški Potok
00050000-5683-b7c8-95e0-a6da39d1e1a0	2324	Lovrenc na Dravskem polju
00050000-5683-b7c8-fab4-132f8e898a7c	2344	Lovrenc na Pohorju
00050000-5683-b7c8-510e-2f2d2fbc1ba6	3334	Luče
00050000-5683-b7c8-0275-95f2682d8fcb	1225	Lukovica
00050000-5683-b7c8-b63a-e54c51cf51b5	9202	Mačkovci
00050000-5683-b7c8-c3bb-bdc3b097a374	2322	Majšperk
00050000-5683-b7c8-a976-e56eae356f71	2321	Makole
00050000-5683-b7c8-c502-e70c77c4a3be	9243	Mala Nedelja
00050000-5683-b7c8-b18a-96619c434c8b	2229	Malečnik
00050000-5683-b7c8-97d6-72c07d3570c7	6273	Marezige
00050000-5683-b7c8-3e65-f52463beffd1	2000	Maribor 
00050000-5683-b7c8-a026-dc8134b0d2c8	2001	Maribor - poštni predali
00050000-5683-b7c8-b978-5450f3922192	2206	Marjeta na Dravskem polju
00050000-5683-b7c8-4ff5-de3fcdc60080	2281	Markovci
00050000-5683-b7c8-b94f-bf0b2a406ec5	9221	Martjanci
00050000-5683-b7c8-aa63-fa02d079b296	6242	Materija
00050000-5683-b7c8-3ea5-357c2a41fd8f	4211	Mavčiče
00050000-5683-b7c8-e25a-09549de7810f	1215	Medvode
00050000-5683-b7c8-ab05-6c8e96dc79cd	1234	Mengeš
00050000-5683-b7c8-a04e-37daf972599c	8330	Metlika
00050000-5683-b7c8-11ef-58ef47db87e2	2392	Mežica
00050000-5683-b7c8-5892-e4e0bee470e4	2204	Miklavž na Dravskem polju
00050000-5683-b7c8-d6c8-e2a970c8b1ed	2275	Miklavž pri Ormožu
00050000-5683-b7c8-4e9d-97033a0c9e8b	5291	Miren
00050000-5683-b7c8-71b1-6304f3f91aea	8233	Mirna
00050000-5683-b7c8-8737-e80be859d60c	8216	Mirna Peč
00050000-5683-b7c8-8347-84fedec9dd9b	2382	Mislinja
00050000-5683-b7c8-9c3c-45aba7181180	4281	Mojstrana
00050000-5683-b7c8-69a6-e61c803b7312	8230	Mokronog
00050000-5683-b7c8-600d-c121fbf90c8f	1251	Moravče
00050000-5683-b7c8-526c-8d4facc9dec2	9226	Moravske Toplice
00050000-5683-b7c8-6279-e532bfd4b67a	5216	Most na Soči
00050000-5683-b7c8-1703-e8edbc12c41b	1221	Motnik
00050000-5683-b7c8-c72a-a797d75a4ad3	3330	Mozirje
00050000-5683-b7c8-d7e0-c9ec74392ba0	9000	Murska Sobota 
00050000-5683-b7c8-8a48-db2077ea510a	9001	Murska Sobota - poštni predali
00050000-5683-b7c8-4d8e-0c363d6f9169	2366	Muta
00050000-5683-b7c8-627a-296fda6234c4	4202	Naklo
00050000-5683-b7c8-1bf2-519620845c39	3331	Nazarje
00050000-5683-b7c8-77b0-8e1903526993	1357	Notranje Gorice
00050000-5683-b7c8-9986-b52641c5c29c	3203	Nova Cerkev
00050000-5683-b7c8-cff1-244f06e9f49d	5000	Nova Gorica 
00050000-5683-b7c8-5411-5e89633096ab	5001	Nova Gorica - poštni predali
00050000-5683-b7c8-a24f-6b20b77b4a34	1385	Nova vas
00050000-5683-b7c8-4f8b-2ce35718c0b2	8000	Novo mesto
00050000-5683-b7c8-79e9-18fbba055391	8001	Novo mesto - poštni predali
00050000-5683-b7c8-ef20-fccfaa76a105	6243	Obrov
00050000-5683-b7c8-6219-db76f9694ce0	9233	Odranci
00050000-5683-b7c8-b6fc-1c8d5ee19e1e	2317	Oplotnica
00050000-5683-b7c8-5061-b3568467de85	2312	Orehova vas
00050000-5683-b7c8-bb0f-ffedc4644e68	2270	Ormož
00050000-5683-b7c8-c6ad-1c8e6fe525b5	1316	Ortnek
00050000-5683-b7c8-ef58-0ac777f1ac04	1337	Osilnica
00050000-5683-b7c8-6743-5cbd18519f1f	8222	Otočec
00050000-5683-b7c8-b706-9bcd754ebdf4	2361	Ožbalt
00050000-5683-b7c8-67af-ee165640f525	2231	Pernica
00050000-5683-b7c8-57d2-e9cf7f9d4d3c	2211	Pesnica pri Mariboru
00050000-5683-b7c8-f1fa-314d7bbbd9a8	9203	Petrovci
00050000-5683-b7c8-11bb-83828903de77	3301	Petrovče
00050000-5683-b7c8-aed1-e441fc5bb40a	6330	Piran/Pirano
00050000-5683-b7c8-a90e-fccb6634d56a	8255	Pišece
00050000-5683-b7c8-90a5-b0822ad9ec85	6257	Pivka
00050000-5683-b7c8-d8dd-bb678ec07b94	6232	Planina
00050000-5683-b7c8-9107-ba3d0718fe5d	3225	Planina pri Sevnici
00050000-5683-b7c8-4c43-bcbf13a841c8	6276	Pobegi
00050000-5683-b7c8-68a5-c2bd69bcd172	8312	Podbočje
00050000-5683-b7c8-ddf2-d0f66df4caac	5243	Podbrdo
00050000-5683-b7c8-ea41-d59fe255e0f4	3254	Podčetrtek
00050000-5683-b7c8-f858-63825912fd3a	2273	Podgorci
00050000-5683-b7c8-ec01-3f9f3ddef238	6216	Podgorje
00050000-5683-b7c8-9789-f4fa8bdae483	2381	Podgorje pri Slovenj Gradcu
00050000-5683-b7c8-fed9-8183e29856d0	6244	Podgrad
00050000-5683-b7c8-6aee-53012ca8fb41	1414	Podkum
00050000-5683-b7c8-4d4a-92410e6ead8f	2286	Podlehnik
00050000-5683-b7c8-c491-a5c022e01329	5272	Podnanos
00050000-5683-b7c8-2c12-931eec50e15a	4244	Podnart
00050000-5683-b7c8-5c3d-fa53dec70b53	3241	Podplat
00050000-5683-b7c8-5330-938efb04b543	3257	Podsreda
00050000-5683-b7c8-b9ba-e94a92f1ed50	2363	Podvelka
00050000-5683-b7c8-4eb8-0c2787ab3087	2208	Pohorje
00050000-5683-b7c8-127f-963c027d57c5	2257	Polenšak
00050000-5683-b7c8-d8de-59c3157a04a4	1355	Polhov Gradec
00050000-5683-b7c8-4f21-380176cf71dc	4223	Poljane nad Škofjo Loko
00050000-5683-b7c8-32a0-0eb020ae3fc5	2319	Poljčane
00050000-5683-b7c8-8323-691ca66dc47d	1272	Polšnik
00050000-5683-b7c8-a482-5fd9dabc4cf2	3313	Polzela
00050000-5683-b7c8-e583-e805ad0976ba	3232	Ponikva
00050000-5683-b7c8-19a5-b3e9da6adc74	6320	Portorož/Portorose
00050000-5683-b7c8-aaa3-d01c6f4049a9	6230	Postojna
00050000-5683-b7c8-384e-ad69b237e0d8	2331	Pragersko
00050000-5683-b7c8-cb69-bac3a87b2b48	3312	Prebold
00050000-5683-b7c8-db58-c31c4b89684a	4205	Preddvor
00050000-5683-b7c8-3bae-338bfa9cca9b	6255	Prem
00050000-5683-b7c8-269f-b3592f3c0df2	1352	Preserje
00050000-5683-b7c8-4e44-d63a8627c3f2	6258	Prestranek
00050000-5683-b7c8-671e-71de076e0b44	2391	Prevalje
00050000-5683-b7c8-10f6-97d3b1e3fee1	3262	Prevorje
00050000-5683-b7c8-a39b-b1587b943a1d	1276	Primskovo 
00050000-5683-b7c8-cc8b-33df3086cdc2	3253	Pristava pri Mestinju
00050000-5683-b7c8-22e3-4eb8038abe6c	9207	Prosenjakovci/Partosfalva
00050000-5683-b7c8-47e6-191dd7f00d55	5297	Prvačina
00050000-5683-b7c8-2dad-c0101cd2400d	2250	Ptuj
00050000-5683-b7c8-a86e-c6bcea089f1e	2323	Ptujska Gora
00050000-5683-b7c8-5ce0-feb7c2aeb759	9201	Puconci
00050000-5683-b7c8-d057-45ef5a9618c8	2327	Rače
00050000-5683-b7c8-2a4c-19dbfff2002b	1433	Radeče
00050000-5683-b7c8-2cc7-3e96c88869e3	9252	Radenci
00050000-5683-b7c8-d61b-3f1ae4c5ac23	2360	Radlje ob Dravi
00050000-5683-b7c8-2ac0-c9bfd0556ce6	1235	Radomlje
00050000-5683-b7c8-87d0-28c4f2e887d6	4240	Radovljica
00050000-5683-b7c8-758b-aa7251559d15	8274	Raka
00050000-5683-b7c8-12e9-d798089750da	1381	Rakek
00050000-5683-b7c8-24be-318dcb83a911	4283	Rateče - Planica
00050000-5683-b7c8-c4ef-1acd4cc67230	2390	Ravne na Koroškem
00050000-5683-b7c8-8b58-fb2404e5a3cf	9246	Razkrižje
00050000-5683-b7c8-294a-73b0ab3128d0	3332	Rečica ob Savinji
00050000-5683-b7c8-17d6-b905f625ebe5	5292	Renče
00050000-5683-b7c8-bdb2-e73125d55cf9	1310	Ribnica
00050000-5683-b7c8-8379-2ebc662a2273	2364	Ribnica na Pohorju
00050000-5683-b7c8-aae2-8afe4fb61491	3272	Rimske Toplice
00050000-5683-b7c8-e352-bba09b80bf22	1314	Rob
00050000-5683-b7c8-d836-aeeaa340521d	5215	Ročinj
00050000-5683-b7c8-110e-1ff8a134732f	3250	Rogaška Slatina
00050000-5683-b7c8-df66-5943732f512c	9262	Rogašovci
00050000-5683-b7c8-f27a-7ef6bf03d3be	3252	Rogatec
00050000-5683-b7c8-9beb-d0a155bd868a	1373	Rovte
00050000-5683-b7c8-a1cf-bab58bd434f5	2342	Ruše
00050000-5683-b7c8-9e96-fb52bafdb52f	1282	Sava
00050000-5683-b7c8-c000-0622ac559c23	6333	Sečovlje/Sicciole
00050000-5683-b7c8-d44b-788fed7c0966	4227	Selca
00050000-5683-b7c8-0c9b-cf5254942807	2352	Selnica ob Dravi
00050000-5683-b7c8-4b1a-f020a324883e	8333	Semič
00050000-5683-b7c8-226c-f15517bce640	8281	Senovo
00050000-5683-b7c8-69f8-83d9b383b6bc	6224	Senožeče
00050000-5683-b7c8-d23e-ca39e983defc	8290	Sevnica
00050000-5683-b7c8-58fb-2ba6ae9a2548	6210	Sežana
00050000-5683-b7c8-4922-07ac26448c9a	2214	Sladki Vrh
00050000-5683-b7c8-05a2-ba65eb4b4553	5283	Slap ob Idrijci
00050000-5683-b7c8-ab64-89beb2f90d5a	2380	Slovenj Gradec
00050000-5683-b7c8-5c59-427ccae8d990	2310	Slovenska Bistrica
00050000-5683-b7c8-1e05-b16cdfacbfa1	3210	Slovenske Konjice
00050000-5683-b7c8-b34f-195331c46891	1216	Smlednik
00050000-5683-b7c8-4a12-4ad3679ab4fa	5232	Soča
00050000-5683-b7c8-52dc-9a585a7a3d2a	1317	Sodražica
00050000-5683-b7c8-b86c-a55b9e6dd248	3335	Solčava
00050000-5683-b7c8-fd81-51032db4ddd5	5250	Solkan
00050000-5683-b7c8-0101-23db2d8fa566	4229	Sorica
00050000-5683-b7c8-fa17-44341729acda	4225	Sovodenj
00050000-5683-b7c8-1c8e-a41ef56e9331	5281	Spodnja Idrija
00050000-5683-b7c8-e07e-36e919859656	2241	Spodnji Duplek
00050000-5683-b7c8-3c72-2465dfc4ab1d	9245	Spodnji Ivanjci
00050000-5683-b7c8-1252-bb96762d336c	2277	Središče ob Dravi
00050000-5683-b7c8-74ab-5f0c7a67a706	4267	Srednja vas v Bohinju
00050000-5683-b7c8-60b0-5ba4c6d161d4	8256	Sromlje 
00050000-5683-b7c8-e828-db49467cc972	5224	Srpenica
00050000-5683-b7c8-943d-c1a33d0cb19d	1242	Stahovica
00050000-5683-b7c8-d56e-8d874dd92ed3	1332	Stara Cerkev
00050000-5683-b7c8-674a-04cd6ae7ef9e	8342	Stari trg ob Kolpi
00050000-5683-b7c8-7890-c25a11127024	1386	Stari trg pri Ložu
00050000-5683-b7c8-16de-d5bd9bc556d7	2205	Starše
00050000-5683-b7c8-8999-a4af3b7b3cb5	2289	Stoperce
00050000-5683-b7c8-47af-dfbf33d72698	8322	Stopiče
00050000-5683-b7c8-a932-4bc124c65095	3206	Stranice
00050000-5683-b7c8-1e15-b2b06b3ed5e0	8351	Straža
00050000-5683-b7c8-1279-41691dd8bf9e	1313	Struge
00050000-5683-b7c8-c1d0-a91199b39f41	8293	Studenec
00050000-5683-b7c8-b61c-3247fdd5c26c	8331	Suhor
00050000-5683-b7c8-ed82-c0fd3be03377	2233	Sv. Ana v Slovenskih goricah
00050000-5683-b7c8-fa59-fa6f4df3dc47	2235	Sv. Trojica v Slovenskih goricah
00050000-5683-b7c8-3309-67c58a5d24a7	2353	Sveti Duh na Ostrem Vrhu
00050000-5683-b7c8-5b69-e3fa683d5d5f	9244	Sveti Jurij ob Ščavnici
00050000-5683-b7c8-3057-27c82d3defff	3264	Sveti Štefan
00050000-5683-b7c8-73bc-197b2ad6210a	2258	Sveti Tomaž
00050000-5683-b7c8-6af1-b425fc8c5e31	9204	Šalovci
00050000-5683-b7c8-59c6-dc6fbdd5cff6	5261	Šempas
00050000-5683-b7c8-76f2-9bbc8dc4ded8	5290	Šempeter pri Gorici
00050000-5683-b7c8-1bbc-a377750a10e0	3311	Šempeter v Savinjski dolini
00050000-5683-b7c8-53db-7bbcec75b77e	4208	Šenčur
00050000-5683-b7c8-017a-3ae59d93cf8f	2212	Šentilj v Slovenskih goricah
00050000-5683-b7c8-43a3-7421a1f34f31	8297	Šentjanž
00050000-5683-b7c8-555e-c1a4cea6da3d	2373	Šentjanž pri Dravogradu
00050000-5683-b7c8-9e52-a037e04ad923	8310	Šentjernej
00050000-5683-b7c8-5751-c2e3636e15e1	3230	Šentjur
00050000-5683-b7c8-7a22-b2dff4e9662d	3271	Šentrupert
00050000-5683-b7c8-216c-4e94034efdf8	8232	Šentrupert
00050000-5683-b7c8-adb6-e16318d2dea4	1296	Šentvid pri Stični
00050000-5683-b7c8-a580-38a11031113b	8275	Škocjan
00050000-5683-b7c8-fb04-c3fc4f723902	6281	Škofije
00050000-5683-b7c8-dd5a-fee8ca25f550	4220	Škofja Loka
00050000-5683-b7c8-bf1b-65c4f38b3aa8	3211	Škofja vas
00050000-5683-b7c8-1810-e21055339687	1291	Škofljica
00050000-5683-b7c8-2c8b-9d10c5a5a9d6	6274	Šmarje
00050000-5683-b7c8-8089-dd61a8792c1d	1293	Šmarje - Sap
00050000-5683-b7c8-c238-9942a6ed625a	3240	Šmarje pri Jelšah
00050000-5683-b7c8-68e7-ef62e029704a	8220	Šmarješke Toplice
00050000-5683-b7c8-dff1-53cdbde824e2	2315	Šmartno na Pohorju
00050000-5683-b7c8-db97-f4c94fadd916	3341	Šmartno ob Dreti
00050000-5683-b7c8-48cb-3b855286690a	3327	Šmartno ob Paki
00050000-5683-b7c8-8b43-b701b7b4ee3a	1275	Šmartno pri Litiji
00050000-5683-b7c8-a3d1-8a359d85e210	2383	Šmartno pri Slovenj Gradcu
00050000-5683-b7c8-7f01-6fde4a32f099	3201	Šmartno v Rožni dolini
00050000-5683-b7c8-7d74-e45656e6430e	3325	Šoštanj
00050000-5683-b7c8-6161-a85effe99966	6222	Štanjel
00050000-5683-b7c8-bd59-36e060c3af8f	3220	Štore
00050000-5683-b7c8-e226-e6cc29d3e50f	3304	Tabor
00050000-5683-b7c8-a2b2-c0b969877a5e	3221	Teharje
00050000-5683-b7c8-ebfd-d0c1561fe802	9251	Tišina
00050000-5683-b7c8-32f5-303a69af34c9	5220	Tolmin
00050000-5683-b7c8-d7ba-249f6523d163	3326	Topolšica
00050000-5683-b7c8-0ab5-8bc8b69c961e	2371	Trbonje
00050000-5683-b7c8-3d18-763ff26f326e	1420	Trbovlje
00050000-5683-b7c8-31af-84364f6d3ef0	8231	Trebelno 
00050000-5683-b7c8-fb9f-99156aa8a8c7	8210	Trebnje
00050000-5683-b7c8-8013-6344d354be7a	5252	Trnovo pri Gorici
00050000-5683-b7c8-1c49-bda659bc133f	2254	Trnovska vas
00050000-5683-b7c8-0a19-e9bc46104009	1222	Trojane
00050000-5683-b7c8-ed0c-c04f4bda39da	1236	Trzin
00050000-5683-b7c8-b899-42e71993ac5f	4290	Tržič
00050000-5683-b7c8-e674-f8361decb27a	8295	Tržišče
00050000-5683-b7c8-b1b0-2d99d4772035	1311	Turjak
00050000-5683-b7c8-32dd-386a48b68dfc	9224	Turnišče
00050000-5683-b7c8-34c5-8bcbc20d1e07	8323	Uršna sela
00050000-5683-b7c8-8407-052bfe73feac	1252	Vače
00050000-5683-b7c8-9a23-cd008c410b47	3320	Velenje 
00050000-5683-b7c8-da40-e17dde782a50	3322	Velenje - poštni predali
00050000-5683-b7c8-1e56-6eef023b921c	8212	Velika Loka
00050000-5683-b7c8-edd9-56194a421e96	2274	Velika Nedelja
00050000-5683-b7c8-e107-f357fd12c6f4	9225	Velika Polana
00050000-5683-b7c8-d6e6-dc271476436f	1315	Velike Lašče
00050000-5683-b7c8-33c7-da90bc6ba5e6	8213	Veliki Gaber
00050000-5683-b7c8-1edc-237047d2efbe	9241	Veržej
00050000-5683-b7c8-5071-7729ad2dbc83	1312	Videm - Dobrepolje
00050000-5683-b7c8-3d1c-f34f587a0af4	2284	Videm pri Ptuju
00050000-5683-b7c8-77bd-2fc7e86c780c	8344	Vinica
00050000-5683-b7c8-8fca-d1f67a683e70	5271	Vipava
00050000-5683-b7c8-de03-4669cd12f8f7	4212	Visoko
00050000-5683-b7c8-c555-004d7bdfe43c	1294	Višnja Gora
00050000-5683-b7c8-e6d3-e25a27364a21	3205	Vitanje
00050000-5683-b7c8-cd1c-0d9a132be960	2255	Vitomarci
00050000-5683-b7c8-458d-68dbc27e0181	1217	Vodice
00050000-5683-b7c8-80b5-2f199a0dd550	3212	Vojnik\t
00050000-5683-b7c8-2e92-fc1918d4ef4f	5293	Volčja Draga
00050000-5683-b7c8-83e4-09588f13a4f5	2232	Voličina
00050000-5683-b7c8-fe2f-e32e6430a960	3305	Vransko
00050000-5683-b7c8-b9c9-ae45dfa2d90d	6217	Vremski Britof
00050000-5683-b7c8-cf56-938ad211e7e4	1360	Vrhnika
00050000-5683-b7c8-cd75-851e3e35a6d2	2365	Vuhred
00050000-5683-b7c8-35ff-54eb9bbf268d	2367	Vuzenica
00050000-5683-b7c8-8c8d-fc415ca52742	8292	Zabukovje 
00050000-5683-b7c8-20a2-c2c51e9ffa34	1410	Zagorje ob Savi
00050000-5683-b7c8-6b65-13aeba47a5e0	1303	Zagradec
00050000-5683-b7c8-5a74-d03b8b38fee6	2283	Zavrč
00050000-5683-b7c8-4df3-79c2587804db	8272	Zdole 
00050000-5683-b7c8-a0a1-0134fc1b67bf	4201	Zgornja Besnica
00050000-5683-b7c8-f1ea-714c21c6264a	2242	Zgornja Korena
00050000-5683-b7c8-9944-bd7f3105801e	2201	Zgornja Kungota
00050000-5683-b7c8-e4aa-2d6637fa5fdf	2316	Zgornja Ložnica
00050000-5683-b7c8-2b23-f7c35354eecb	2314	Zgornja Polskava
00050000-5683-b7c8-5e0f-ec67f618ff72	2213	Zgornja Velka
00050000-5683-b7c8-091c-eb96436c8004	4247	Zgornje Gorje
00050000-5683-b7c8-10b8-dcb82867ae05	4206	Zgornje Jezersko
00050000-5683-b7c8-15cc-db5b2d6cfa74	2285	Zgornji Leskovec
00050000-5683-b7c8-b146-b80fed9c6d69	1432	Zidani Most
00050000-5683-b7c8-d7e0-b14c873c51da	3214	Zreče
00050000-5683-b7c8-97f7-11473a6e868b	4209	Žabnica
00050000-5683-b7c8-311e-289bad693bc5	3310	Žalec
00050000-5683-b7c8-8c56-bbc3684e331c	4228	Železniki
00050000-5683-b7c8-25d5-692a6e0d4195	2287	Žetale
00050000-5683-b7c8-411f-f3007c496cb6	4226	Žiri
00050000-5683-b7c8-be75-c9fcc55233fc	4274	Žirovnica
00050000-5683-b7c8-880f-010c2ef470c5	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33559194)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33558758)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33558506)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5683-b7cd-aef0-d98b30aa8734	00080000-5683-b7cd-8f44-9c6a5827a908	\N	00040000-5683-b7c8-aeb3-edba8a647830	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5683-b7cd-c7e8-c4f7e465ee58	00080000-5683-b7cd-8f44-9c6a5827a908	\N	00040000-5683-b7c8-aeb3-edba8a647830	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5683-b7cd-0853-ef14b1aa5b95	00080000-5683-b7cd-a558-0df98dc7c471	\N	00040000-5683-b7c8-aeb3-edba8a647830	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33558650)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5683-b7c9-6eaa-8e852bbce93f	novo leto	1	1	\N	t
00430000-5683-b7c9-2414-4723a40fb63c	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5683-b7c9-e66b-b943aac58021	dan upora proti okupatorju	27	4	\N	t
00430000-5683-b7c9-e724-e96b1f308238	praznik dela	1	5	\N	t
00430000-5683-b7c9-f07d-eeaebd729276	praznik dela	2	5	\N	t
00430000-5683-b7c9-c205-1b455cfa5893	dan Primoža Trubarja	8	6	\N	f
00430000-5683-b7c9-432b-5b4b0ba93dd4	dan državnosti	25	6	\N	t
00430000-5683-b7c9-6eff-f5443e703d68	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5683-b7c9-4622-8e5a0caf8477	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5683-b7c9-4586-889d172294d7	dan suverenosti	25	10	\N	f
00430000-5683-b7c9-44da-341d7f86e78b	dan spomina na mrtve	1	11	\N	t
00430000-5683-b7c9-d871-ed99dc96f98b	dan Rudolfa Maistra	23	11	\N	f
00430000-5683-b7c9-f32a-ea49e552ec5f	božič	25	12	\N	t
00430000-5683-b7c9-e423-444684f5b1ec	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5683-b7c9-cb0c-790744249cf1	Marijino vnebovzetje	15	8	\N	t
00430000-5683-b7c9-5ec5-fab6ae929b85	dan reformacije	31	10	\N	t
00430000-5683-b7c9-56d6-455e7ffe7093	velikonočna nedelja	27	3	2016	t
00430000-5683-b7c9-49b8-017dbaaf5af4	velikonočna nedelja	16	4	2017	t
00430000-5683-b7c9-b221-cc2253b8a7b0	velikonočna nedelja	1	4	2018	t
00430000-5683-b7c9-0375-551ed809965f	velikonočna nedelja	21	4	2019	t
00430000-5683-b7c9-38a3-10e126baf2c8	velikonočna nedelja	12	4	2020	t
00430000-5683-b7c9-cf91-a56c315a8280	velikonočna nedelja	4	4	2021	t
00430000-5683-b7c9-b906-b656f4fffc04	velikonočna nedelja	17	4	2022	t
00430000-5683-b7c9-93be-7af263e3bd22	velikonočna nedelja	9	4	2023	t
00430000-5683-b7c9-f263-6391ac3acc8d	velikonočna nedelja	31	3	2024	t
00430000-5683-b7c9-b392-a4acfaaa552e	velikonočna nedelja	20	4	2025	t
00430000-5683-b7c9-88ae-e3827468d1b8	velikonočna nedelja	5	4	2026	t
00430000-5683-b7c9-d54e-26aabad664a5	velikonočna nedelja	28	3	2027	t
00430000-5683-b7c9-c2e2-5eb99e7d5e47	velikonočna nedelja	16	4	2028	t
00430000-5683-b7c9-4572-564fd91ea1fc	velikonočna nedelja	1	4	2029	t
00430000-5683-b7c9-dfbb-b5a9c573f80f	velikonočna nedelja	21	4	2030	t
00430000-5683-b7c9-4990-ab5ee0a6759c	velikonočni ponedeljek	28	3	2016	t
00430000-5683-b7c9-e77b-a46894fd8359	velikonočni ponedeljek	17	4	2017	t
00430000-5683-b7c9-864a-931415fb5433	velikonočni ponedeljek	2	4	2018	t
00430000-5683-b7c9-4c78-f0c953050bb3	velikonočni ponedeljek	22	4	2019	t
00430000-5683-b7c9-6f1d-4159512f3c9d	velikonočni ponedeljek	13	4	2020	t
00430000-5683-b7c9-0539-01db2d16c68a	velikonočni ponedeljek	5	4	2021	t
00430000-5683-b7c9-104f-e6dcf8111c02	velikonočni ponedeljek	18	4	2022	t
00430000-5683-b7c9-bde2-b537dee6bfd0	velikonočni ponedeljek	10	4	2023	t
00430000-5683-b7c9-ced6-a9e8098e41d7	velikonočni ponedeljek	1	4	2024	t
00430000-5683-b7c9-d5f2-dfb22255016f	velikonočni ponedeljek	21	4	2025	t
00430000-5683-b7c9-5d0f-494ff4aa9e8d	velikonočni ponedeljek	6	4	2026	t
00430000-5683-b7c9-a0d5-fc82f6337fb4	velikonočni ponedeljek	29	3	2027	t
00430000-5683-b7c9-478e-710127f3b9d3	velikonočni ponedeljek	17	4	2028	t
00430000-5683-b7c9-4446-e933cb2650a1	velikonočni ponedeljek	2	4	2029	t
00430000-5683-b7c9-ff71-f236ade9965e	velikonočni ponedeljek	22	4	2030	t
00430000-5683-b7c9-684b-3973655dbdb8	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5683-b7c9-e541-03ef5ea20108	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5683-b7c9-4786-cd31a1d7e427	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5683-b7c9-a6f5-1f8956f9aa09	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5683-b7c9-7175-c5c4622f232d	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5683-b7c9-2e60-41b4038fa5b4	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5683-b7c9-17ce-2cf36172f2ee	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5683-b7c9-8bf5-f13d3b56389b	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5683-b7c9-e514-94c0bc0f0eaa	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5683-b7c9-fa3b-c9f1119cf24f	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5683-b7c9-6c18-bbe69d218861	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5683-b7c9-af69-dcb457fff7ed	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5683-b7c9-ed95-1cf95e784f75	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5683-b7c9-3080-5b477e9ca0ec	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5683-b7c9-5a17-b0d9a3160e48	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33558610)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33558622)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33558770)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33559208)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33559218)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5683-b7cd-b066-84becdd68757	00080000-5683-b7cd-97f4-a9e041ce3e62	0987	AK
00190000-5683-b7cd-e411-b3effca4b2bb	00080000-5683-b7cd-a558-0df98dc7c471	0989	AK
00190000-5683-b7cd-79d2-7de92e18ea28	00080000-5683-b7cd-739a-b741182fc380	0986	AK
00190000-5683-b7cd-2d6d-494d5d4eb191	00080000-5683-b7cd-331b-a4d0d05bd83f	0984	AK
00190000-5683-b7cd-bb46-280f0f1a4a91	00080000-5683-b7cd-7346-0fba511a5319	0983	AK
00190000-5683-b7cd-c07d-239b066b79fe	00080000-5683-b7cd-c00c-efc72b35198e	0982	AK
00190000-5683-b7cf-a440-72bc679add3f	00080000-5683-b7cf-eec8-09a74f262fde	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33559107)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5683-b7cd-df99-adfcd0687ae1	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33559226)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33558799)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5683-b7cc-864a-d8f4e9147bc1	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5683-b7cc-ed55-fad7fb83a43d	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5683-b7cc-8580-80109edbb8dd	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5683-b7cc-1fd9-b82be88825ae	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5683-b7cc-b7a2-abdfa7e0591f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5683-b7cc-c6c3-d3c9cf956d2e	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5683-b7cc-42ef-ea7580c11b5a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33558743)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33558733)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33558945)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33558875)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33558584)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33558346)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5683-b7cf-eec8-09a74f262fde	00010000-5683-b7ca-fb91-d53501c016ce	2015-12-30 11:54:07	INS	a:0:{}
2	App\\Entity\\Option	00000000-5683-b7cf-1b9a-3932f5a79a7e	00010000-5683-b7ca-fb91-d53501c016ce	2015-12-30 11:54:07	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5683-b7cf-a440-72bc679add3f	00010000-5683-b7ca-fb91-d53501c016ce	2015-12-30 11:54:07	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33558812)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33558384)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5683-b7c9-7fd1-5b4b3cf6458e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5683-b7c9-a3b1-659840dc5531	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5683-b7c9-d879-e7ce2497db03	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5683-b7c9-18ad-3eaaccea7317	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5683-b7c9-7cf4-abdb135078ee	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5683-b7c9-4c76-ed760ed6ea55	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5683-b7c9-9e66-c2efb16f7b6f	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5683-b7c9-c6a1-79aaf933349c	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5683-b7c9-0cce-9fb060a3aecc	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5683-b7c9-efa7-2a3fe2dba594	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5683-b7c9-27b4-ecccaddc9484	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5683-b7c9-a19e-96d1b979a86b	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5683-b7c9-1891-d839ed29d8f8	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5683-b7c9-3472-fed09c974566	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5683-b7c9-c670-62248658bedd	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5683-b7c9-2e13-6cc881f81c41	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5683-b7c9-1b33-b4c7d051f785	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5683-b7c9-b461-e79a366a6f4d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5683-b7c9-c374-29f0ab14966d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5683-b7c9-2148-129f2330aaf1	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5683-b7c9-0a22-680da1fefd7c	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5683-b7c9-a741-5533b6be6fe0	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5683-b7c9-7470-a755c31dcd51	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5683-b7c9-d6b9-e7c222a444cc	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5683-b7c9-6016-104e2209dde2	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5683-b7c9-b5ed-329ced3b5c0b	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5683-b7c9-2608-4554ede953f1	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5683-b7c9-fc9d-764187b98632	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5683-b7c9-c018-89dd1755fc93	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5683-b7c9-76ed-17440a1b8437	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5683-b7c9-a17f-c80dd24bd1db	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5683-b7c9-1f3e-c6a75d2b1941	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5683-b7c9-d4b3-fa61a902f2ab	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5683-b7c9-642c-8df70f1dbc0d	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5683-b7c9-756a-738c55433cf0	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5683-b7c9-02c2-3a03544902bd	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5683-b7c9-2c03-a0c497f66a91	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5683-b7c9-82a5-f0ed5cfed204	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5683-b7c9-862f-106612f9a388	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5683-b7c9-b63f-ed287e7c9c78	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5683-b7c9-ee6e-55d361c8990e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5683-b7c9-cc82-db7ebe35cb44	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5683-b7c9-5ec4-78912f48befe	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5683-b7c9-20da-13a131633777	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5683-b7c9-1cbd-90cdf4b76eff	direktor	minimalne pravice za direktorja	t
00020000-5683-b7c9-5337-d38889bae385	arhivar	arhivar	t
00020000-5683-b7c9-cd47-451f97dd0add	dramaturg	dramaturg	t
00020000-5683-b7c9-52dc-f9dd4b0cc401	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5683-b7c9-f3e7-0893ce85a70c	poslovni-sekretar	poslovni sekretar	t
00020000-5683-b7c9-2dc3-ee89ad0b6893	vodja-tehnike	vodja tehnike	t
00020000-5683-b7c9-2678-0f82c959447e	racunovodja	računovodja	t
00020000-5683-b7cc-a8d6-4261f23e7afc	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5683-b7cc-ae13-11f7e5bf5dac	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-5911-442f783fdc71	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-e9b5-16377d59b7f1	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-1155-83baef932f05	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-453f-f3f6ecd561a7	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-c063-0d3d14c563e4	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-4bb1-db1d325cbb3c	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-06d2-3d003451434e	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-1bd9-dbb8f8b9b13c	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-b53e-41939f798cc3	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-fa3e-3ddad5cef507	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-25fe-aefb2f479264	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-dae2-6ca81b9136a4	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-6bb0-fe966cb75997	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-4b25-2aa3a463c91f	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-5800-f0ce081128bd	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-e494-177c9b150b56	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-43fa-31461266eddd	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-12a8-a9b3847c5067	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5683-b7cc-41d3-9b6a4598f98c	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-b654-47d52a7f2f9a	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-e65b-88cc528fb6d0	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-30fb-e37d8e76dbf1	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-0571-c37c8bfcc82a	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-a13d-2c499ea7e0f7	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-700f-7bee823a0523	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-c73b-9e9a6fb8a874	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-53a8-b2ce8364ad24	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-9ba7-9f7ced29389f	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-c24c-7417ee42a0c1	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-697c-a5bb5e0d43b3	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-790d-e8e6fdd88a8c	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-d43e-0af6c3f0d946	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-ef42-435af114c0bd	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-8f35-61f6e49ef757	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-4f4d-ef8965f5ff36	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-bdec-b41f305fd2b3	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5683-b7cc-98ec-55dff91d9bb1	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33558368)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5683-b7ca-4266-4cd2f75877e5	00020000-5683-b7c9-d879-e7ce2497db03
00010000-5683-b7ca-fb91-d53501c016ce	00020000-5683-b7c9-d879-e7ce2497db03
00010000-5683-b7cc-3d13-263b4517fddf	00020000-5683-b7cc-a8d6-4261f23e7afc
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-ae13-11f7e5bf5dac
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-453f-f3f6ecd561a7
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-1bd9-dbb8f8b9b13c
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-fa3e-3ddad5cef507
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-dae2-6ca81b9136a4
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-43fa-31461266eddd
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-e9b5-16377d59b7f1
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-41d3-9b6a4598f98c
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-30fb-e37d8e76dbf1
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-a13d-2c499ea7e0f7
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-c73b-9e9a6fb8a874
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-9ba7-9f7ced29389f
00010000-5683-b7cc-3a30-457467b08f91	00020000-5683-b7cc-d43e-0af6c3f0d946
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-ae13-11f7e5bf5dac
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-5911-442f783fdc71
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-e9b5-16377d59b7f1
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-1155-83baef932f05
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-dae2-6ca81b9136a4
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-5800-f0ce081128bd
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-41d3-9b6a4598f98c
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-30fb-e37d8e76dbf1
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-a13d-2c499ea7e0f7
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-c73b-9e9a6fb8a874
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-9ba7-9f7ced29389f
00010000-5683-b7cc-4437-247eedf0db60	00020000-5683-b7cc-d43e-0af6c3f0d946
00010000-5683-b7cc-2805-a92f4e0a93ff	00020000-5683-b7cc-ae13-11f7e5bf5dac
00010000-5683-b7cc-2805-a92f4e0a93ff	00020000-5683-b7cc-5911-442f783fdc71
00010000-5683-b7cc-2805-a92f4e0a93ff	00020000-5683-b7cc-e9b5-16377d59b7f1
00010000-5683-b7cc-2805-a92f4e0a93ff	00020000-5683-b7cc-1155-83baef932f05
00010000-5683-b7cc-2805-a92f4e0a93ff	00020000-5683-b7cc-fa3e-3ddad5cef507
00010000-5683-b7cc-2805-a92f4e0a93ff	00020000-5683-b7cc-dae2-6ca81b9136a4
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-5911-442f783fdc71
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-c063-0d3d14c563e4
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-b53e-41939f798cc3
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-25fe-aefb2f479264
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-fa3e-3ddad5cef507
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-e494-177c9b150b56
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-dae2-6ca81b9136a4
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-6bb0-fe966cb75997
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-41d3-9b6a4598f98c
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-b654-47d52a7f2f9a
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-30fb-e37d8e76dbf1
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-0571-c37c8bfcc82a
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-a13d-2c499ea7e0f7
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-700f-7bee823a0523
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-c73b-9e9a6fb8a874
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-53a8-b2ce8364ad24
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-9ba7-9f7ced29389f
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-c24c-7417ee42a0c1
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-d43e-0af6c3f0d946
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-ef42-435af114c0bd
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-4f4d-ef8965f5ff36
00010000-5683-b7cd-c4dc-fdef460bd191	00020000-5683-b7cc-bdec-b41f305fd2b3
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-5911-442f783fdc71
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-c063-0d3d14c563e4
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-06d2-3d003451434e
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-b53e-41939f798cc3
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-25fe-aefb2f479264
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-fa3e-3ddad5cef507
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-e494-177c9b150b56
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-dae2-6ca81b9136a4
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-6bb0-fe966cb75997
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-4b25-2aa3a463c91f
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-41d3-9b6a4598f98c
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-b654-47d52a7f2f9a
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-e65b-88cc528fb6d0
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-30fb-e37d8e76dbf1
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-0571-c37c8bfcc82a
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-a13d-2c499ea7e0f7
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-700f-7bee823a0523
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-c73b-9e9a6fb8a874
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-53a8-b2ce8364ad24
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-9ba7-9f7ced29389f
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-c24c-7417ee42a0c1
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-d43e-0af6c3f0d946
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-ef42-435af114c0bd
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-8f35-61f6e49ef757
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-4f4d-ef8965f5ff36
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-bdec-b41f305fd2b3
00010000-5683-b7cd-045d-204700dc65b1	00020000-5683-b7cc-98ec-55dff91d9bb1
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-5911-442f783fdc71
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-e9b5-16377d59b7f1
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-c063-0d3d14c563e4
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-4bb1-db1d325cbb3c
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-06d2-3d003451434e
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-453f-f3f6ecd561a7
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-b53e-41939f798cc3
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-25fe-aefb2f479264
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-fa3e-3ddad5cef507
00010000-5683-b7cd-dad8-e0d0d23a605e	00020000-5683-b7cc-e494-177c9b150b56
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-ae13-11f7e5bf5dac
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-1155-83baef932f05
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-453f-f3f6ecd561a7
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-1bd9-dbb8f8b9b13c
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-fa3e-3ddad5cef507
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-dae2-6ca81b9136a4
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-43fa-31461266eddd
00010000-5683-b7cd-45cd-3a4e859fd287	00020000-5683-b7cc-697c-a5bb5e0d43b3
00010000-5683-b7cd-b58e-d9dcfe31eed5	00020000-5683-b7cc-12a8-a9b3847c5067
00010000-5683-b7cd-c7ba-6eb172e884cb	00020000-5683-b7c9-1cbd-90cdf4b76eff
00010000-5683-b7cd-4b3c-9e700ab4106c	00020000-5683-b7c9-5337-d38889bae385
00010000-5683-b7cd-b3cc-a242ab19757b	00020000-5683-b7c9-cd47-451f97dd0add
00010000-5683-b7cd-4c0c-6dbccc8ecb96	00020000-5683-b7c9-52dc-f9dd4b0cc401
00010000-5683-b7cd-e6de-74fabaf4dd0e	00020000-5683-b7c9-f3e7-0893ce85a70c
00010000-5683-b7cd-7404-24b50a5feb85	00020000-5683-b7c9-2dc3-ee89ad0b6893
00010000-5683-b7cd-cde0-b08553235b08	00020000-5683-b7c9-2678-0f82c959447e
\.


--
-- TOC entry 3157 (class 0 OID 33558826)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33558764)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33558710)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5683-b7cc-28ce-bb8da6179d95	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5683-b7cc-c22b-eaee89889375	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5683-b7cc-b8a1-7aead35bf36f	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33558333)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5683-b7c8-21e2-e2fe388cacfa	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5683-b7c8-5a01-db37df288f2e	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5683-b7c8-627e-4527bf2fec29	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5683-b7c8-e6a3-7399fe39383d	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5683-b7c8-6255-0dac76bbd591	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33558325)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5683-b7c8-725f-1fa53d5a853f	00230000-5683-b7c8-e6a3-7399fe39383d	popa
00240000-5683-b7c8-9418-dd90caa10f85	00230000-5683-b7c8-e6a3-7399fe39383d	oseba
00240000-5683-b7c8-9860-690cb81e0f2f	00230000-5683-b7c8-e6a3-7399fe39383d	tippopa
00240000-5683-b7c8-e494-a0ac7de4decf	00230000-5683-b7c8-e6a3-7399fe39383d	organizacijskaenota
00240000-5683-b7c8-8010-9530d1f7983a	00230000-5683-b7c8-e6a3-7399fe39383d	sezona
00240000-5683-b7c8-0264-d47c28406997	00230000-5683-b7c8-e6a3-7399fe39383d	tipvaje
00240000-5683-b7c8-b21f-dcc29c87236c	00230000-5683-b7c8-5a01-db37df288f2e	prostor
00240000-5683-b7c8-3fd2-4f82d4c89768	00230000-5683-b7c8-e6a3-7399fe39383d	besedilo
00240000-5683-b7c8-9baf-70ffa3d6a47c	00230000-5683-b7c8-e6a3-7399fe39383d	uprizoritev
00240000-5683-b7c8-752e-74f7bfea89e9	00230000-5683-b7c8-e6a3-7399fe39383d	funkcija
00240000-5683-b7c8-9805-bcc77cb0213f	00230000-5683-b7c8-e6a3-7399fe39383d	tipfunkcije
00240000-5683-b7c8-f59f-45e0e4db92f2	00230000-5683-b7c8-e6a3-7399fe39383d	alternacija
00240000-5683-b7c8-1d12-1021e7e94d2b	00230000-5683-b7c8-21e2-e2fe388cacfa	pogodba
00240000-5683-b7c8-2b20-88c94205a062	00230000-5683-b7c8-e6a3-7399fe39383d	zaposlitev
00240000-5683-b7c8-8337-6e58341e06e8	00230000-5683-b7c8-e6a3-7399fe39383d	zvrstuprizoritve
00240000-5683-b7c8-b3df-11ae2f1a3baf	00230000-5683-b7c8-21e2-e2fe388cacfa	programdela
00240000-5683-b7c8-d1cd-57164ec69f83	00230000-5683-b7c8-e6a3-7399fe39383d	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33558320)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
26717511-9e43-48c3-ba7a-35d12f747a08	00240000-5683-b7c8-725f-1fa53d5a853f	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33558892)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5683-b7cd-b653-f5a9c0a93c7f	000e0000-5683-b7cd-4c8f-94c9d8645f9c	00080000-5683-b7cd-8f44-9c6a5827a908	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5683-b7c9-ff2b-918addcbf7c8
00270000-5683-b7cd-6f9b-0c2e8da5a70a	000e0000-5683-b7cd-4c8f-94c9d8645f9c	00080000-5683-b7cd-8f44-9c6a5827a908	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5683-b7c9-ff2b-918addcbf7c8
\.


--
-- TOC entry 3122 (class 0 OID 33558468)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33558720)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5683-b7ce-77a3-2914bb6aceb1	00180000-5683-b7cd-644c-c3116c5a6865	000c0000-5683-b7cd-6a07-39efdb3928f8	00090000-5683-b7cd-3704-0157438f9c05	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5683-b7ce-fdae-8ad2c3930da0	00180000-5683-b7cd-644c-c3116c5a6865	000c0000-5683-b7cd-b6a0-4b2fe6a8e5a0	00090000-5683-b7cd-8e66-310dbadc850c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5683-b7ce-28a0-062c1e83512d	00180000-5683-b7cd-644c-c3116c5a6865	000c0000-5683-b7cd-5a68-9166f125b0c5	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5683-b7ce-3805-e9f935411973	00180000-5683-b7cd-644c-c3116c5a6865	000c0000-5683-b7cd-1407-1f3593d6a9ca	00090000-5683-b7cd-6490-37ab3fc790fe	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5683-b7ce-26d3-d47156fb5976	00180000-5683-b7cd-644c-c3116c5a6865	000c0000-5683-b7cd-89db-b3cd33b5a01e	00090000-5683-b7cd-b940-df334d447dcb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5683-b7ce-9acc-dfb979394695	00180000-5683-b7cd-059b-f17ffa9431b0	\N	00090000-5683-b7cd-b940-df334d447dcb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5683-b7ce-a4de-6bf36d03ddee	00180000-5683-b7cd-059b-f17ffa9431b0	\N	00090000-5683-b7cd-8e66-310dbadc850c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33558933)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5683-b7c8-bc70-b4d14cf8ecc4	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5683-b7c8-809c-28654b9f0620	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5683-b7c8-72de-761e8b93effb	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5683-b7c8-6e29-aa74ba3da1ed	04	Režija	Režija	Režija	umetnik	30
000f0000-5683-b7c8-77dd-bb8c503f334d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5683-b7c8-e283-7f903125df0d	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5683-b7c8-34f6-dc3b6c1dd180	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5683-b7c8-f88a-310ef74606fc	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5683-b7c8-8498-7b374d52d962	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5683-b7c8-a63a-0185e72fdcc3	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5683-b7c8-e30d-cd44b7b56091	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5683-b7c8-35ac-4df471ec7e05	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5683-b7c8-5bf9-48ecd9cb0831	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5683-b7c8-a46d-af67f20e39b4	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5683-b7c8-2350-7b23afd24c31	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5683-b7c8-2b7c-f836ddaf353c	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5683-b7c8-0020-f9aafe5cb918	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5683-b7c8-bed2-ac75fefdfda3	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33558419)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5683-b7cc-723a-9151f1eb9fc3	0001	šola	osnovna ali srednja šola
00400000-5683-b7cc-d6b5-413f8ba8fc93	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5683-b7cc-c668-aa2e010b2d58	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33559238)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5683-b7c8-e6aa-af0fbead21db	01	Velika predstava	f	1.00	1.00
002b0000-5683-b7c8-4ced-8ac3ab9933b6	02	Mala predstava	f	0.50	0.50
002b0000-5683-b7c8-7fd1-701b87491b93	03	Mala koprodukcija	t	0.40	1.00
002b0000-5683-b7c8-5d19-8ec2ae8de950	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5683-b7c8-6416-e49c6ed4d785	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33558700)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5683-b7c8-6812-1e577800ae1c	0001	prva vaja	prva vaja
00420000-5683-b7c8-ce68-fc140db943b5	0002	tehnična vaja	tehnična vaja
00420000-5683-b7c8-505b-5d2a029422d1	0003	lučna vaja	lučna vaja
00420000-5683-b7c8-3d10-0929c0f43cbe	0004	kostumska vaja	kostumska vaja
00420000-5683-b7c8-f448-6a8c1f165583	0005	foto vaja	foto vaja
00420000-5683-b7c8-d8fe-fb3afbc6fd17	0006	1. glavna vaja	1. glavna vaja
00420000-5683-b7c8-c2d8-ef0a72205f7a	0007	2. glavna vaja	2. glavna vaja
00420000-5683-b7c8-d587-e05e81ae261c	0008	1. generalka	1. generalka
00420000-5683-b7c8-024f-3982908f61be	0009	2. generalka	2. generalka
00420000-5683-b7c8-e5ce-c08550cb1315	0010	odprta generalka	odprta generalka
00420000-5683-b7c8-12b1-d9ce39980560	0011	obnovitvena vaja	obnovitvena vaja
00420000-5683-b7c8-faee-74c8fa48b50c	0012	italijanka	krajša "obnovitvena" vaja
00420000-5683-b7c8-8f4f-9b8ff6cc8078	0013	pevska vaja	pevska vaja
00420000-5683-b7c8-9b2f-93b66cbbab0a	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5683-b7c8-9f7d-155c55c480a1	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33558541)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33558355)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5683-b7ca-fb91-d53501c016ce	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9k4Obp7Jx4zVgcAhVJ9T2CSVBoU6taG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-4781-f8761ab6f1ad	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-d2b3-e5d9e25f5d3a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-4100-21e637320ca6	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-26fb-3f1855a2ddd9	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-a70e-f47d38b176a5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-58a1-2d58780d4692	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-a93e-0ce040f45f88	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-12dd-7f03e59fd0d4	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-c1b3-d8ce59e52744	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-3d13-263b4517fddf	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-ac5e-3d5942c56928	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-3a30-457467b08f91	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-4437-247eedf0db60	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5683-b7cc-2805-a92f4e0a93ff	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-c4dc-fdef460bd191	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-045d-204700dc65b1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-dad8-e0d0d23a605e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-45cd-3a4e859fd287	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-b58e-d9dcfe31eed5	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-c7ba-6eb172e884cb	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-4b3c-9e700ab4106c	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-b3cc-a242ab19757b	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-4c0c-6dbccc8ecb96	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-e6de-74fabaf4dd0e	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-7404-24b50a5feb85	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5683-b7cd-cde0-b08553235b08	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5683-b7ca-4266-4cd2f75877e5	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33558983)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5683-b7cd-d4da-ebd16511945d	00160000-5683-b7cc-17d9-0079f3e61848	\N	00140000-5683-b7c8-5658-7ef36f8c1d9d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5683-b7cc-b7a2-abdfa7e0591f
000e0000-5683-b7cd-4c8f-94c9d8645f9c	00160000-5683-b7cc-29e7-07ecf744b900	\N	00140000-5683-b7c8-c9e0-97112e2bfb30	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5683-b7cc-c6c3-d3c9cf956d2e
000e0000-5683-b7cd-37b5-f1f0e069102a	\N	\N	00140000-5683-b7c8-c9e0-97112e2bfb30	00190000-5683-b7cd-b066-84becdd68757	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5683-b7cc-b7a2-abdfa7e0591f
000e0000-5683-b7cd-af03-9dbc841a70d7	\N	\N	00140000-5683-b7c8-c9e0-97112e2bfb30	00190000-5683-b7cd-b066-84becdd68757	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5683-b7cc-b7a2-abdfa7e0591f
000e0000-5683-b7cd-3277-139a54559938	\N	\N	00140000-5683-b7c8-c9e0-97112e2bfb30	00190000-5683-b7cd-b066-84becdd68757	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-8753-81c5cea1c021	\N	\N	00140000-5683-b7c8-c9e0-97112e2bfb30	00190000-5683-b7cd-b066-84becdd68757	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-2ef8-cd99b972e854	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-a551-1535ddda7763	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-46fb-e54d294d7d44	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-1350-6cbd8526b1b1	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-58da-2fcaf700c7e4	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-896a-60f620826e4f	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-1f73-6c471d9f8d80	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-1127-02a0ebde7d56	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
000e0000-5683-b7cd-42a0-489f60e16519	\N	\N	00140000-5683-b7c8-28c9-eb81d3be4290	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5683-b7cc-864a-d8f4e9147bc1
\.


--
-- TOC entry 3136 (class 0 OID 33558640)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5683-b7cd-fdcc-3b433a6dad4f	\N	000e0000-5683-b7cd-4c8f-94c9d8645f9c	1	
00200000-5683-b7cd-32a7-fc449706a081	\N	000e0000-5683-b7cd-4c8f-94c9d8645f9c	2	
00200000-5683-b7cd-c699-f70b2ef4e2e8	\N	000e0000-5683-b7cd-4c8f-94c9d8645f9c	3	
00200000-5683-b7cd-9bc3-8f98b81e7942	\N	000e0000-5683-b7cd-4c8f-94c9d8645f9c	4	
00200000-5683-b7cd-a8f9-78e72c4f6ae6	\N	000e0000-5683-b7cd-4c8f-94c9d8645f9c	5	
\.


--
-- TOC entry 3153 (class 0 OID 33558791)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33558906)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5683-b7c9-bfdb-9ea2188f47d8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5683-b7c9-9b45-43668e0276be	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5683-b7c9-a987-4a3f568af3f9	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5683-b7c9-2907-a98f2cadf00f	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5683-b7c9-5f4d-ee2df05de06b	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5683-b7c9-ebc5-efe156c4c885	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5683-b7c9-07f1-b3209c674c4e	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5683-b7c9-1665-088340c4f013	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5683-b7c9-ff2b-918addcbf7c8	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5683-b7c9-4930-87564a5e160b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5683-b7c9-0ed1-1a7caaa33149	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5683-b7c9-4b1e-f8682b1bc90d	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5683-b7c9-d11a-2a64d752637c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5683-b7c9-7072-ad41e88a5c0e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5683-b7c9-8b78-29518d279753	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5683-b7c9-9a48-9c134d9ed12a	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5683-b7c9-93e6-68048c8d3d6f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5683-b7c9-79da-33a824ddc13c	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5683-b7c9-2d7f-0b2ae1bc1acc	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5683-b7c9-9d49-6f79dfc790d9	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5683-b7c9-ce03-47dc4e5afba6	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5683-b7c9-9f38-3e2f91951cfb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5683-b7c9-371b-8238b1486cb3	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5683-b7c9-bf52-a54ce40a2197	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5683-b7c9-9ad4-76c270b3ed2f	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5683-b7c9-83d2-66695978c05d	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5683-b7c9-0d3f-3c24e8116a91	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5683-b7c9-a517-f718307cd7da	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33559288)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33559257)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33559300)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33558864)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5683-b7cd-bdea-f7f2fd0c05f4	00090000-5683-b7cd-8e66-310dbadc850c	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5683-b7cd-351e-d17aec1747a8	00090000-5683-b7cd-6e7a-9bf47b1ae3f7	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5683-b7cd-5752-ab954d54e427	00090000-5683-b7cd-e245-d0695557a133	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5683-b7cd-107d-089644a673a8	00090000-5683-b7cd-710e-6b30d2acf72b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5683-b7cd-077b-b9f41cf69d18	00090000-5683-b7cd-f68f-52738ea92b9e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5683-b7cd-a6d1-47dcb481eb38	00090000-5683-b7cd-7cc7-70dfd43a391f	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33558684)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33558973)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5683-b7c8-5658-7ef36f8c1d9d	01	Drama	drama (SURS 01)
00140000-5683-b7c8-33f2-3f6d5d8f36f0	02	Opera	opera (SURS 02)
00140000-5683-b7c8-766c-1bf93679c362	03	Balet	balet (SURS 03)
00140000-5683-b7c8-0ae9-f5bb4cb56ce3	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5683-b7c8-28c9-eb81d3be4290	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5683-b7c8-c9e0-97112e2bfb30	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5683-b7c8-5645-d845163e87dc	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33558854)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33558418)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33559032)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33559022)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33558409)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33558889)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33558931)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33559341)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33558672)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33558694)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33558699)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33559255)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33558567)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33559101)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33558850)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33558638)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33558605)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33558581)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33558756)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33559318)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33559325)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33559349)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 33138688)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 33558783)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33558539)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33558437)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33558501)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33558464)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33558398)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33558383)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33558789)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33558825)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33558968)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33558492)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33558527)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33559206)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33558762)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33558517)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33558657)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33558626)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33558618)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33558774)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33559215)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33559223)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33559193)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33559236)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33558807)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33558747)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33558738)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33558955)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33558882)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33558593)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33558354)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33558816)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33558372)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33558392)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33558834)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33558769)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33558718)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33558342)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33558330)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33558324)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33558902)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33558473)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33558729)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33558942)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33558426)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33559248)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33558707)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33558552)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33558367)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33559001)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33558647)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33558797)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33558914)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33559298)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33559282)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33559306)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33558872)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33558688)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33558981)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33558862)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33558682)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33558683)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33558681)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33558680)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33558679)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33558903)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33558904)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33558905)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33559320)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33559319)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33558494)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33558495)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33558790)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33559286)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33559285)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33559287)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33559284)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33559283)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33558776)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33558775)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33558648)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33558649)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33558851)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33558853)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33558852)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33558583)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33558582)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33559237)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33558970)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33558971)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33558972)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33559307)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33559006)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33559003)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33559007)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33559005)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33559004)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33558554)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33558553)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33558467)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33558817)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33558399)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33558400)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33558837)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33558836)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33558835)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33558504)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33558503)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33558505)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33558621)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33558619)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33558620)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33558332)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33558742)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33558740)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33558739)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33558741)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33558373)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33558374)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33558798)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33559342)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33558891)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33558890)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33559350)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33559351)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33558763)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33558883)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33558884)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33559106)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33559105)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33559102)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33559103)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33559104)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33558519)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33558518)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33558520)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33558811)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33558810)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33559216)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33559217)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33559036)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33559037)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33559034)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33559035)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33558873)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33558874)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33558751)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33558750)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33558748)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33558749)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33559024)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33559023)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33558594)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33558608)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33558607)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33558606)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33558609)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33558639)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33558627)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33558628)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33559207)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33559256)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33559326)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33559327)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33558439)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33558438)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33558474)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33558475)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33558689)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33558732)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33558731)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33558730)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33558674)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33558675)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33558678)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33558673)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33558677)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33558676)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33558493)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33558427)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33558428)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33558568)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33558570)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33558569)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33558571)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33558757)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33558969)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33559002)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33558943)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33558944)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33558465)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33558466)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33558863)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33558343)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33558540)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33558502)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33558331)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33559249)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33558809)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33558808)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33558708)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33558709)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33559033)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33558528)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33558982)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33559299)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33559224)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33559225)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33558932)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33558719)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33558393)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2917 (class 2606 OID 33559522)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2918 (class 2606 OID 33559527)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2923 (class 2606 OID 33559552)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2921 (class 2606 OID 33559542)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2916 (class 2606 OID 33559517)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2920 (class 2606 OID 33559537)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2922 (class 2606 OID 33559547)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2919 (class 2606 OID 33559532)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 33559722)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33559727)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 33559732)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 33559897)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2991 (class 2606 OID 33559892)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2894 (class 2606 OID 33559407)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2895 (class 2606 OID 33559412)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33559637)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2988 (class 2606 OID 33559877)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33559872)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2989 (class 2606 OID 33559882)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 33559867)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2985 (class 2606 OID 33559862)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2939 (class 2606 OID 33559632)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2938 (class 2606 OID 33559627)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2914 (class 2606 OID 33559507)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2915 (class 2606 OID 33559512)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33559677)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33559687)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33559682)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2905 (class 2606 OID 33559462)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 33559457)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33559617)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33559852)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 33559737)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33559742)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 33559747)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33559887)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2966 (class 2606 OID 33559767)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2963 (class 2606 OID 33559752)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2967 (class 2606 OID 33559772)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33559762)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 33559757)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2903 (class 2606 OID 33559452)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 33559447)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 33559392)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 33559387)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33559657)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 33559367)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 33559372)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2947 (class 2606 OID 33559672)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33559667)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 33559662)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33559422)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 33559417)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2898 (class 2606 OID 33559427)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 33559487)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 33559477)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33559482)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33559352)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2931 (class 2606 OID 33559592)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2929 (class 2606 OID 33559582)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2928 (class 2606 OID 33559577)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2930 (class 2606 OID 33559587)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2884 (class 2606 OID 33559357)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 33559362)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33559642)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33559912)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2956 (class 2606 OID 33559717)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 33559712)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2996 (class 2606 OID 33559917)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2997 (class 2606 OID 33559922)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33559622)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2953 (class 2606 OID 33559702)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2954 (class 2606 OID 33559707)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 33559827)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 33559822)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 33559807)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 33559812)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33559817)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33559437)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 33559432)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 33559442)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2943 (class 2606 OID 33559652)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2942 (class 2606 OID 33559647)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 33559837)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 33559842)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2972 (class 2606 OID 33559797)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 33559802)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2970 (class 2606 OID 33559787)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2971 (class 2606 OID 33559792)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 33559692)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2952 (class 2606 OID 33559697)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2935 (class 2606 OID 33559612)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2934 (class 2606 OID 33559607)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 33559597)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2933 (class 2606 OID 33559602)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2969 (class 2606 OID 33559782)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 33559777)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33559467)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33559472)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33559502)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2911 (class 2606 OID 33559492)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 33559497)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33559832)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33559847)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33559857)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2993 (class 2606 OID 33559902)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2994 (class 2606 OID 33559907)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 33559382)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 33559377)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2892 (class 2606 OID 33559397)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 33559402)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33559557)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 33559572)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33559567)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 33559562)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-30 11:54:10 CET

--
-- PostgreSQL database dump complete
--

