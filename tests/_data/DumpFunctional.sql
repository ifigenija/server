--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-11 14:12:36 CET

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
-- TOC entry 183 (class 1259 OID 26542765)
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
-- TOC entry 237 (class 1259 OID 26543379)
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
-- TOC entry 236 (class 1259 OID 26543362)
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
-- TOC entry 182 (class 1259 OID 26542758)
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
-- TOC entry 181 (class 1259 OID 26542756)
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
-- TOC entry 227 (class 1259 OID 26543239)
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
-- TOC entry 230 (class 1259 OID 26543269)
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
-- TOC entry 251 (class 1259 OID 26543669)
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
-- TOC entry 203 (class 1259 OID 26543013)
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
-- TOC entry 205 (class 1259 OID 26543045)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 26543050)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 26543592)
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
-- TOC entry 194 (class 1259 OID 26542910)
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
-- TOC entry 238 (class 1259 OID 26543392)
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
-- TOC entry 223 (class 1259 OID 26543193)
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
-- TOC entry 200 (class 1259 OID 26542984)
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
-- TOC entry 197 (class 1259 OID 26542950)
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
-- TOC entry 195 (class 1259 OID 26542927)
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
-- TOC entry 212 (class 1259 OID 26543107)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 26543650)
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
-- TOC entry 250 (class 1259 OID 26543662)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 26543684)
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
-- TOC entry 216 (class 1259 OID 26543132)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 26542884)
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
-- TOC entry 185 (class 1259 OID 26542784)
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
-- TOC entry 189 (class 1259 OID 26542851)
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
-- TOC entry 186 (class 1259 OID 26542795)
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
-- TOC entry 178 (class 1259 OID 26542730)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 26542749)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 26543139)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 26543173)
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
-- TOC entry 233 (class 1259 OID 26543310)
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
-- TOC entry 188 (class 1259 OID 26542831)
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
-- TOC entry 191 (class 1259 OID 26542876)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 26543537)
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
-- TOC entry 213 (class 1259 OID 26543113)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 26542861)
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
-- TOC entry 202 (class 1259 OID 26543005)
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
-- TOC entry 198 (class 1259 OID 26542965)
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
-- TOC entry 199 (class 1259 OID 26542977)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 26543125)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 26543551)
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
-- TOC entry 242 (class 1259 OID 26543561)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 26543460)
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
-- TOC entry 243 (class 1259 OID 26543569)
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
-- TOC entry 219 (class 1259 OID 26543154)
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
-- TOC entry 211 (class 1259 OID 26543098)
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
-- TOC entry 210 (class 1259 OID 26543088)
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
-- TOC entry 232 (class 1259 OID 26543299)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 26543229)
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
-- TOC entry 196 (class 1259 OID 26542939)
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
-- TOC entry 175 (class 1259 OID 26542701)
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
-- TOC entry 174 (class 1259 OID 26542699)
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
-- TOC entry 220 (class 1259 OID 26543167)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 26542739)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 26542723)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 26543181)
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
-- TOC entry 214 (class 1259 OID 26543119)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 26543065)
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
-- TOC entry 173 (class 1259 OID 26542688)
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
-- TOC entry 172 (class 1259 OID 26542680)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 26542675)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 26543246)
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
-- TOC entry 187 (class 1259 OID 26542823)
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
-- TOC entry 209 (class 1259 OID 26543075)
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
-- TOC entry 231 (class 1259 OID 26543287)
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
-- TOC entry 184 (class 1259 OID 26542774)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 26543580)
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
-- TOC entry 207 (class 1259 OID 26543055)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 26542896)
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
-- TOC entry 176 (class 1259 OID 26542710)
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
-- TOC entry 235 (class 1259 OID 26543337)
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
-- TOC entry 201 (class 1259 OID 26542995)
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
-- TOC entry 218 (class 1259 OID 26543146)
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
-- TOC entry 229 (class 1259 OID 26543260)
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
-- TOC entry 247 (class 1259 OID 26543630)
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
-- TOC entry 246 (class 1259 OID 26543599)
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
-- TOC entry 248 (class 1259 OID 26543642)
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
-- TOC entry 225 (class 1259 OID 26543218)
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
-- TOC entry 204 (class 1259 OID 26543039)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 26543327)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 26543208)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 26542761)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 26542704)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3104 (class 0 OID 26542765)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5643-3ec1-c57b-fac2a8e991d7	10	30	Otroci	Abonma za otroke	200
000a0000-5643-3ec1-2b50-1cbcff5a4718	20	60	Mladina	Abonma za mladino	400
000a0000-5643-3ec1-940a-e33a061e0d11	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3158 (class 0 OID 26543379)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5643-3ec1-1199-adef118813b4	000d0000-5643-3ec1-de7f-9f3c5ac1b2cf	\N	00090000-5643-3ec1-4c06-baac7a5db710	000b0000-5643-3ec1-c812-5c94d8b75de9	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5643-3ec1-d804-528cc70ba2b1	000d0000-5643-3ec1-0bb3-f1e963699f35	00100000-5643-3ec1-43b4-32ed1c04984b	00090000-5643-3ec1-2fe3-83ba9ce2e7fb	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5643-3ec1-5d64-4aeb2c21a40a	000d0000-5643-3ec1-6563-e4162a44d010	00100000-5643-3ec1-639b-a0065fbe8186	00090000-5643-3ec1-7c86-2ffe082e6515	\N	0003	t	\N	2015-11-11	\N	2	t	\N	f	f
000c0000-5643-3ec1-2c52-9187a0b70289	000d0000-5643-3ec1-8485-863de2304053	\N	00090000-5643-3ec1-b925-d5adfb93dcd4	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5643-3ec1-d44a-950db41acc5e	000d0000-5643-3ec1-312c-a535b95afce2	\N	00090000-5643-3ec1-e08c-854837d870e2	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5643-3ec1-3a9f-ef38e13fcc7e	000d0000-5643-3ec1-1523-9090c6159608	\N	00090000-5643-3ec1-afa1-ebd78a500788	000b0000-5643-3ec1-1975-ce92c632fc84	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5643-3ec1-50f5-1ee7949bbaf7	000d0000-5643-3ec1-7b0a-0e3e3ad25922	00100000-5643-3ec1-1c38-a59888ea6f36	00090000-5643-3ec1-1134-7287ee9090c2	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5643-3ec1-177f-72417585a76b	000d0000-5643-3ec1-4bda-140ea9ea2bd9	\N	00090000-5643-3ec1-ca16-85b54a443f30	000b0000-5643-3ec1-9df1-77af03cc39c6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5643-3ec1-f86d-5d06bd8400f1	000d0000-5643-3ec1-7b0a-0e3e3ad25922	00100000-5643-3ec1-6ad5-fec5175ce5a2	00090000-5643-3ec1-0ef0-ef2cb4a6fb63	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5643-3ec1-f6a3-6f8d79bd11ec	000d0000-5643-3ec1-7b0a-0e3e3ad25922	00100000-5643-3ec1-e896-264dcbce3c5b	00090000-5643-3ec1-dd8e-4a7624ca2d4f	\N	0010	t	\N	2015-11-11	\N	16	f	\N	f	t
000c0000-5643-3ec1-0a4d-d7ec8e98ba92	000d0000-5643-3ec1-7b0a-0e3e3ad25922	00100000-5643-3ec1-ad19-0cca28963d99	00090000-5643-3ec1-99d9-5510d7cf31d9	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5643-3ec1-2261-c001b49ce542	000d0000-5643-3ec1-dbda-aef581c9fe72	00100000-5643-3ec1-43b4-32ed1c04984b	00090000-5643-3ec1-2fe3-83ba9ce2e7fb	000b0000-5643-3ec1-a5bd-39ca6a2d1713	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3157 (class 0 OID 26543362)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 26542758)
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
-- TOC entry 3148 (class 0 OID 26543239)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5643-3ec1-f942-6a0a1a785aef	00160000-5643-3ec0-caf5-e164ce534d08	00090000-5643-3ec1-e8cb-0177708e0117	aizv	10	t
003d0000-5643-3ec1-446a-d190de0c68b8	00160000-5643-3ec0-caf5-e164ce534d08	00090000-5643-3ec1-1efd-acb7cdf4d103	apri	14	t
003d0000-5643-3ec1-efc1-4d51cfe8c19b	00160000-5643-3ec0-7ba6-fd89751baa64	00090000-5643-3ec1-29f5-ab0bceb194c5	aizv	11	t
003d0000-5643-3ec1-a3c3-8946c29deaae	00160000-5643-3ec0-cd70-5881b2e13c8c	00090000-5643-3ec1-2745-565845445905	aizv	12	t
003d0000-5643-3ec1-c386-dce937b494bb	00160000-5643-3ec0-caf5-e164ce534d08	00090000-5643-3ec1-760e-a5f45aee76a5	apri	18	f
\.


--
-- TOC entry 3151 (class 0 OID 26543269)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5643-3ec0-caf5-e164ce534d08	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5643-3ec0-7ba6-fd89751baa64	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5643-3ec0-cd70-5881b2e13c8c	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3172 (class 0 OID 26543669)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 26543013)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5643-3ec1-a985-aac91a943de4	\N	\N	00200000-5643-3ec1-4122-81742fc061a0	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5643-3ec1-b60c-c6817e57d6f5	\N	\N	00200000-5643-3ec1-68ec-04466d50bd4f	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5643-3ec1-37a2-11128cca4b82	\N	\N	00200000-5643-3ec1-6d0a-ced53e014bdf	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5643-3ec1-9dec-3f7c6644c9cf	\N	\N	00200000-5643-3ec1-1b8b-18117f849aac	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5643-3ec1-c7a3-f26852031863	\N	\N	00200000-5643-3ec1-ee8a-32fb53cb4764	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3126 (class 0 OID 26543045)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 26543050)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 26543592)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 26542910)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5643-3ebe-c259-2f449075ea8d	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5643-3ebe-7c62-38a45cf4259b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5643-3ebe-5cb5-93e26e45f46a	AL	ALB	008	Albania 	Albanija	\N
00040000-5643-3ebe-681e-ae1b023d05fe	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5643-3ebe-438b-324db741de30	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5643-3ebe-60da-ae6dd993c26b	AD	AND	020	Andorra 	Andora	\N
00040000-5643-3ebe-2d08-c7e683dc513b	AO	AGO	024	Angola 	Angola	\N
00040000-5643-3ebe-8613-602460262924	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5643-3ebe-d85b-1d471cfe2c38	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5643-3ebe-053c-c2a498842f23	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5643-3ebe-2ec1-b5efd0e2d6b4	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5643-3ebe-986f-e204253c5588	AM	ARM	051	Armenia 	Armenija	\N
00040000-5643-3ebe-37cc-c4c5ab1b9ae6	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5643-3ebe-f62e-e28da14ef53a	AU	AUS	036	Australia 	Avstralija	\N
00040000-5643-3ebe-29bd-a6f2bae2ba79	AT	AUT	040	Austria 	Avstrija	\N
00040000-5643-3ebe-ac89-cf1be99088d4	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5643-3ebe-45c8-0df9d2a17057	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5643-3ebe-f49e-aee94ef88c2d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5643-3ebe-ede6-cf674968ba8c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5643-3ebe-bfbb-4d621bdf7cbd	BB	BRB	052	Barbados 	Barbados	\N
00040000-5643-3ebe-7c01-2045e3bed6ce	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5643-3ebe-afc4-964e1e1133bc	BE	BEL	056	Belgium 	Belgija	\N
00040000-5643-3ebe-5ff2-b79c799bd6f6	BZ	BLZ	084	Belize 	Belize	\N
00040000-5643-3ebe-1ec6-6de085a104a3	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5643-3ebe-5b31-ff6a3772e4d6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5643-3ebe-061a-f4a8f1cbde1d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5643-3ebe-27d3-c9716f5f94c0	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5643-3ebe-7f45-6a2e3f22830c	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5643-3ebe-f19f-4101b01094e3	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5643-3ebe-f998-f19fd1f5d18a	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5643-3ebe-cf25-97cf29d39340	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5643-3ebe-82b4-e31b63e12e40	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5643-3ebe-de68-09c3a407603d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5643-3ebe-41d0-9a0ee8519624	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5643-3ebe-827d-b96ad5efdde0	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5643-3ebe-5bf6-733ae7d62ac5	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5643-3ebe-d628-7f15fb0fb6e5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5643-3ebe-0cd0-da9d131123b5	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5643-3ebe-2aa0-d2d73843a259	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5643-3ebe-27ca-d957e5770146	CA	CAN	124	Canada 	Kanada	\N
00040000-5643-3ebe-5d6c-8ff8157de8a0	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5643-3ebe-2dbb-f12e0019f9e8	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5643-3ebe-95c8-ca0cd29a634e	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5643-3ebe-c5e3-110ac60ed111	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5643-3ebe-7b6e-fbcbef9bf2de	CL	CHL	152	Chile 	Čile	\N
00040000-5643-3ebe-c5d5-1d4687002bf4	CN	CHN	156	China 	Kitajska	\N
00040000-5643-3ebe-db94-fb714d98eb5e	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5643-3ebe-7627-cdb7e2a09c3d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5643-3ebe-1425-5b558f8581a6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5643-3ebe-87f7-512b6d83d836	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5643-3ebe-e314-a22f8975b414	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5643-3ebe-a742-d43836a0c98d	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5643-3ebe-c457-89b233bfb90d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5643-3ebe-2536-20e6ec7210c4	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5643-3ebe-9464-8fede514d22d	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5643-3ebe-2d10-8e31a20893da	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5643-3ebe-d27e-16ef471abb17	CU	CUB	192	Cuba 	Kuba	\N
00040000-5643-3ebe-27dc-f70fe0f6c1a4	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5643-3ebe-58b5-77d587108a25	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5643-3ebe-5007-c576906f368a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5643-3ebe-fdc2-e6dd9b0e2c45	DK	DNK	208	Denmark 	Danska	\N
00040000-5643-3ebe-c5df-f51528eb0ab0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5643-3ebe-f992-1888c19735ac	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5643-3ebe-3c0d-96bac114927b	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5643-3ebe-ed56-e79c20e5240f	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5643-3ebe-92db-4c1d9c64f3f6	EG	EGY	818	Egypt 	Egipt	\N
00040000-5643-3ebe-9f70-8aae0e76b122	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5643-3ebe-de30-72fab6ccf1a6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5643-3ebe-a363-c60d1651187d	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5643-3ebe-3389-050e5cb5cdc9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5643-3ebe-ef00-71dc59e7f611	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5643-3ebe-5c5a-5651b62f854b	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5643-3ebe-7ede-c3db78bec4d9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5643-3ebe-3bb9-2c3a1279cdc9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5643-3ebe-ab93-841d97a5bd09	FI	FIN	246	Finland 	Finska	\N
00040000-5643-3ebe-374e-831d641e52bf	FR	FRA	250	France 	Francija	\N
00040000-5643-3ebe-0928-98d92a66fdb0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5643-3ebe-8e01-97d060a0369f	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5643-3ebe-9310-a3f46555e68c	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5643-3ebe-121d-19c99d5d2bcb	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5643-3ebe-8fb6-8a0a0ab77a69	GA	GAB	266	Gabon 	Gabon	\N
00040000-5643-3ebe-560e-43a3f9a5640b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5643-3ebe-6a07-60cd8f194d7d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5643-3ebe-283a-03e940f163e7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5643-3ebe-b540-93539748e77e	GH	GHA	288	Ghana 	Gana	\N
00040000-5643-3ebe-95ef-b61e0e9f6451	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5643-3ebe-f9b7-921ac85256e4	GR	GRC	300	Greece 	Grčija	\N
00040000-5643-3ebe-fff0-fc351e47459d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5643-3ebe-7ff9-15e0cda9bab6	GD	GRD	308	Grenada 	Grenada	\N
00040000-5643-3ebe-95b3-0387c1e79f95	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5643-3ebe-5d87-d26feb47a9f2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5643-3ebe-fe3e-700a11488e9b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5643-3ebe-399e-8d99f55fee36	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5643-3ebe-d540-4c3e0297103f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5643-3ebe-2771-bff5d60afe28	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5643-3ebe-6760-b736b1dbaa48	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5643-3ebe-20e7-6adb66d8fef6	HT	HTI	332	Haiti 	Haiti	\N
00040000-5643-3ebe-0d75-d413ed5b373b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5643-3ebe-356c-ae64adc4eb4d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5643-3ebe-b908-89ed7982f3d4	HN	HND	340	Honduras 	Honduras	\N
00040000-5643-3ebe-8f8c-8342704725ab	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5643-3ebe-9c06-dba7f0989305	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5643-3ebe-d299-d99379a1dd9f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5643-3ebe-2e7f-908bed5c0de8	IN	IND	356	India 	Indija	\N
00040000-5643-3ebe-c738-b32598b8e8ff	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5643-3ebe-08b3-b635b83db4f8	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5643-3ebe-684f-b776aac9f912	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5643-3ebe-a6f8-f8285b7e76fd	IE	IRL	372	Ireland 	Irska	\N
00040000-5643-3ebe-96c6-664b7334fc4a	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5643-3ebe-63b0-bb4d2caa1ede	IL	ISR	376	Israel 	Izrael	\N
00040000-5643-3ebe-d33e-261a0d8c0d50	IT	ITA	380	Italy 	Italija	\N
00040000-5643-3ebe-7c32-93f082fe80f5	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5643-3ebe-deac-53e3ddc18c48	JP	JPN	392	Japan 	Japonska	\N
00040000-5643-3ebe-7525-327068267c7e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5643-3ebe-97be-066028c259a8	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5643-3ebe-44ea-70fa27b26669	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5643-3ebe-6af8-cf22814cee42	KE	KEN	404	Kenya 	Kenija	\N
00040000-5643-3ebe-7a45-a090ee22df65	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5643-3ebe-0f6a-90c4969a54e1	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5643-3ebe-d72c-950911c42e80	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5643-3ebe-cc98-368ad553d4a0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5643-3ebe-785c-d87d4d16e6cd	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5643-3ebe-95ea-9b3b32638376	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5643-3ebe-cd07-3864a0ee93eb	LV	LVA	428	Latvia 	Latvija	\N
00040000-5643-3ebe-e42a-e338d5afc91c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5643-3ebe-854a-b02f8843663a	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5643-3ebe-bac0-2baa24a20f7d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5643-3ebe-2e69-8f2084187649	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5643-3ebe-34f4-4e1ee46ee2fb	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5643-3ebe-17d9-e1d8b4beb6e0	LT	LTU	440	Lithuania 	Litva	\N
00040000-5643-3ebe-26b3-fc24237e1ea9	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5643-3ebe-9ff3-65ed66b06cc2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5643-3ebe-8a5a-636baf51c8af	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5643-3ebe-ab96-a181324c8aef	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5643-3ebe-cab6-ecbe875cc7ad	MW	MWI	454	Malawi 	Malavi	\N
00040000-5643-3ebe-f8d2-2d7b77a8eecb	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5643-3ebe-e273-118db418895d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5643-3ebe-51d5-51d2e39086f4	ML	MLI	466	Mali 	Mali	\N
00040000-5643-3ebe-9263-9b4e7e66d776	MT	MLT	470	Malta 	Malta	\N
00040000-5643-3ebe-241b-fd0e087cc7b5	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5643-3ebe-2210-04e2390f20b2	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5643-3ebe-d6e0-2fd6d503b49f	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5643-3ebe-4457-4c584f2ff2f5	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5643-3ebe-f924-ba36699a8316	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5643-3ebe-8c0a-3a24aa743176	MX	MEX	484	Mexico 	Mehika	\N
00040000-5643-3ebe-62cb-edcd01eed32b	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5643-3ebe-0f0f-01e55df40b75	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5643-3ebe-ae75-b2a94b518ed3	MC	MCO	492	Monaco 	Monako	\N
00040000-5643-3ebe-5036-7e489d357702	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5643-3ebe-fc87-5154716e2a6f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5643-3ebe-fa35-461756b3e893	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5643-3ebe-f7cb-960d8b5b50b1	MA	MAR	504	Morocco 	Maroko	\N
00040000-5643-3ebe-cdd7-346c630f067c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5643-3ebe-a44b-e2cdff10df11	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5643-3ebe-0325-b0c1c5e7ebcb	NA	NAM	516	Namibia 	Namibija	\N
00040000-5643-3ebe-1b7c-0f410c35c0a6	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5643-3ebe-b33f-28e6364449ba	NP	NPL	524	Nepal 	Nepal	\N
00040000-5643-3ebe-42b5-f98589f61f7d	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5643-3ebe-f316-85a840717f2c	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5643-3ebe-bee0-21a4d8099ea5	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5643-3ebe-83dd-3241ac40a282	NE	NER	562	Niger 	Niger 	\N
00040000-5643-3ebe-404f-46cefdcbc82b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5643-3ebe-d85d-72e5d05d67a2	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5643-3ebe-0d23-444bd28856e3	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5643-3ebe-b7eb-fd9ad9369242	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5643-3ebe-b044-63cdb0de2045	NO	NOR	578	Norway 	Norveška	\N
00040000-5643-3ebe-0ae9-65cc647d2541	OM	OMN	512	Oman 	Oman	\N
00040000-5643-3ebe-d92c-e55054a8fea7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5643-3ebe-529d-196930912e92	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5643-3ebe-a320-faab2f28ca10	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5643-3ebe-7bbd-5ce3342bb36f	PA	PAN	591	Panama 	Panama	\N
00040000-5643-3ebe-da81-e32af2fb94ad	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5643-3ebe-8417-7e040100e756	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5643-3ebe-5f53-0af2231764f0	PE	PER	604	Peru 	Peru	\N
00040000-5643-3ebe-7077-b5d4d3ed5f7c	PH	PHL	608	Philippines 	Filipini	\N
00040000-5643-3ebe-1026-c1e109c29461	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5643-3ebe-6740-d55e7028d143	PL	POL	616	Poland 	Poljska	\N
00040000-5643-3ebe-35ac-5b62a4281cc5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5643-3ebe-ab52-2ffa497dc861	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5643-3ebe-bc37-ab4ccece9fef	QA	QAT	634	Qatar 	Katar	\N
00040000-5643-3ebe-8ae8-04ad1927cb9d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5643-3ebe-9b21-204a98618cf8	RO	ROU	642	Romania 	Romunija	\N
00040000-5643-3ebe-9f96-69e9ec67fef9	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5643-3ebe-adc1-29802353bfb4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5643-3ebe-7cf6-c92df6b1a347	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5643-3ebe-cf2b-49b4d5701258	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5643-3ebe-5791-dae6121898e1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5643-3ebe-4ce1-f67fd35bd30e	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5643-3ebe-c5fa-85c2d201a3f9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5643-3ebe-5573-62dc3afa7eb6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5643-3ebe-7e27-699af1279b71	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5643-3ebe-65f4-ec327250312d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5643-3ebe-9a16-f697d2cad488	SM	SMR	674	San Marino 	San Marino	\N
00040000-5643-3ebe-b41f-17888f1d60ff	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5643-3ebe-d788-87dc67c3ce53	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5643-3ebe-6f0a-07ee807f79f5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5643-3ebe-973a-59cae48ed580	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5643-3ebe-71df-7f0d1e77e1bd	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5643-3ebe-4965-2920e885a190	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5643-3ebe-ee67-506c605ddae8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5643-3ebe-58b4-81352d851fc9	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5643-3ebe-4d35-aefab4e3abe4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5643-3ebe-c29d-d84c8c30353e	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5643-3ebe-5d76-2d6588bf773a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5643-3ebe-d7ba-05585a1eb6c7	SO	SOM	706	Somalia 	Somalija	\N
00040000-5643-3ebe-273e-09d77a2721bc	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5643-3ebe-97e1-8b9a5290d7a1	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5643-3ebe-9bdc-57dea43b86e9	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5643-3ebe-12d6-9f512ce2cbe7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5643-3ebe-f6b7-f6a20a3966d6	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5643-3ebe-ee08-051e17e11374	SD	SDN	729	Sudan 	Sudan	\N
00040000-5643-3ebe-209a-41847dbf5a9e	SR	SUR	740	Suriname 	Surinam	\N
00040000-5643-3ebe-439f-95927e5e9d47	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5643-3ebe-bce5-9520190ee5f2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5643-3ebe-9554-87f3f4e112c2	SE	SWE	752	Sweden 	Švedska	\N
00040000-5643-3ebe-414e-874719cec2cf	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5643-3ebe-3e26-2b8bd29b5089	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5643-3ebe-ef11-a88c8595335e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5643-3ebe-af94-22c56f78984d	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5643-3ebe-1296-802744bdf0d0	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5643-3ebe-0444-e1e112aa2c4a	TH	THA	764	Thailand 	Tajska	\N
00040000-5643-3ebe-c95a-d79a7f2c5706	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5643-3ebe-f058-1f0c371da766	TG	TGO	768	Togo 	Togo	\N
00040000-5643-3ebe-f466-3de0a3d8f91d	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5643-3ebe-5370-f37d82acdfda	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5643-3ebe-5ec3-35fa68109456	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5643-3ebe-acbe-20731c552a24	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5643-3ebe-1529-14879ba694f4	TR	TUR	792	Turkey 	Turčija	\N
00040000-5643-3ebe-8a1a-9c1fcb7d4f0d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5643-3ebe-b81c-de016a1b9ad0	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5643-3ebe-dae3-cf8036e10f4b	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5643-3ebe-168f-0f630076136f	UG	UGA	800	Uganda 	Uganda	\N
00040000-5643-3ebe-79aa-3f67561128b8	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5643-3ebe-c747-bd7467d22735	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5643-3ebe-60e0-7a5b74b354ae	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5643-3ebe-5a8e-91bd5b12cced	US	USA	840	United States 	Združene države Amerike	\N
00040000-5643-3ebe-e02b-4339adca51b4	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5643-3ebe-212f-854b9fed4a3e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5643-3ebe-4c27-50af6e2e442a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5643-3ebe-8283-913f37f15e9f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5643-3ebe-d208-265473a730cf	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5643-3ebe-7323-897acf19eb77	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5643-3ebe-7048-c3bdd80de308	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5643-3ebe-c54f-1d5f6065de5a	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5643-3ebe-0d83-9f079f9b7eac	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5643-3ebe-04ed-fdf8fb19d968	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5643-3ebe-1cce-3c938dcadb59	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5643-3ebe-9d68-726f858ff4cc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5643-3ebe-b0fd-1a538b69bd91	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3159 (class 0 OID 26543392)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5643-3ec1-445b-5d830e6496c3	000e0000-5643-3ec1-4cd1-aded82ae3674	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5643-3ebe-579a-883c5cb60516	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5643-3ec1-617e-980cd4e9f804	000e0000-5643-3ec1-71fb-8f6c5af2e976	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5643-3ebe-6d41-b126cdb97e1a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5643-3ec1-e86d-29b0543a51aa	000e0000-5643-3ec1-40a6-ee9262b44163	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5643-3ebe-579a-883c5cb60516	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5643-3ec1-1278-e1604c0aba14	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5643-3ec1-a819-c23244084abb	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3144 (class 0 OID 26543193)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5643-3ec1-7b0a-0e3e3ad25922	000e0000-5643-3ec1-71fb-8f6c5af2e976	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5643-3ebe-b5da-3f034e9ae869
000d0000-5643-3ec1-de7f-9f3c5ac1b2cf	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-1199-adef118813b4	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5643-3ebe-b5da-3f034e9ae869
000d0000-5643-3ec1-0bb3-f1e963699f35	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-d804-528cc70ba2b1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5643-3ebe-ceb3-1f6fce936925
000d0000-5643-3ec1-6563-e4162a44d010	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-5d64-4aeb2c21a40a	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5643-3ebe-c943-c864e77f8e92
000d0000-5643-3ec1-8485-863de2304053	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-2c52-9187a0b70289	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5643-3ebe-5ffc-101785527340
000d0000-5643-3ec1-312c-a535b95afce2	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-d44a-950db41acc5e	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5643-3ebe-5ffc-101785527340
000d0000-5643-3ec1-1523-9090c6159608	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-3a9f-ef38e13fcc7e	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5643-3ebe-b5da-3f034e9ae869
000d0000-5643-3ec1-4bda-140ea9ea2bd9	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-177f-72417585a76b	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5643-3ebe-3319-a0852e2eef5e
000d0000-5643-3ec1-dbda-aef581c9fe72	000e0000-5643-3ec1-71fb-8f6c5af2e976	000c0000-5643-3ec1-2261-c001b49ce542	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5643-3ebe-bf77-0c77c59e6b1b
\.


--
-- TOC entry 3121 (class 0 OID 26542984)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 26542950)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 26542927)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5643-3ec1-8eca-27b219bf9a30	00080000-5643-3ec1-1444-7cb9f3ed2174	00090000-5643-3ec1-dd8e-4a7624ca2d4f	AK		igralka
\.


--
-- TOC entry 3133 (class 0 OID 26543107)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 26543650)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5643-3ec1-6585-c0565b46a0e2	00010000-5643-3ebf-04bb-ec2ac20798d1	\N	Prva mapa	Root mapa	2015-11-11 14:12:33	2015-11-11 14:12:33	R	\N	\N
\.


--
-- TOC entry 3171 (class 0 OID 26543662)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 26543684)
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
-- TOC entry 3137 (class 0 OID 26543132)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 26542884)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5643-3ebf-a3bd-600439f37745	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5643-3ebf-0e87-1a3f8d94d883	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5643-3ebf-a3d6-2ba433343b6f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5643-3ebf-3981-d24b8cda3db2	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5643-3ebf-a239-608de2f29fb8	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5643-3ebf-6be8-4e3260816a03	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5643-3ebf-df33-737fb6f8ec43	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5643-3ebf-a02e-e2eb97b8c519	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5643-3ebf-297d-bb6b829dbb46	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5643-3ebf-ebdb-243eac493d7b	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5643-3ebf-72ed-1ccacedcdd6a	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5643-3ebf-b387-77142c5aec4c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5643-3ebf-d303-cb7ccdb7d077	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5643-3ebf-84e5-ecba8fbf8f73	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5643-3ebf-4523-e9c279fb79a4	fsacl.dostop	array	a:5:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}s:4:"RWDA";a:1:{s:5:"label";s:45:"Branje pisanje, brisanje, ažuriranje zapisov";}}	f	t	f	\N	ACL Javni dostop
00000000-5643-3ec0-d880-648d6db0363e	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5643-3ec0-06dd-5e11aafff969	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5643-3ec0-b849-8d787f69e1b2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5643-3ec0-889a-3474a2deea66	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5643-3ec0-f55b-77b9a287cc18	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5643-3ec2-7959-24acf9b73ca3	application.tenant.maticnopodjetje	string	s:36:"00080000-5643-3ec2-cf1f-2c2e381ea5ad";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3106 (class 0 OID 26542784)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5643-3ec0-ba15-4420e4adf1a2	00000000-5643-3ec0-d880-648d6db0363e	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5643-3ec0-a76f-d9c7eeaa278e	00000000-5643-3ec0-d880-648d6db0363e	00010000-5643-3ebf-04bb-ec2ac20798d1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5643-3ec0-774e-2031e8041e18	00000000-5643-3ec0-06dd-5e11aafff969	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3110 (class 0 OID 26542851)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5643-3ec1-e5aa-cbdbea21c305	\N	00100000-5643-3ec1-43b4-32ed1c04984b	00100000-5643-3ec1-639b-a0065fbe8186	01	Gledališče Nimbis
00410000-5643-3ec1-1d2a-d1035b0c1849	00410000-5643-3ec1-e5aa-cbdbea21c305	00100000-5643-3ec1-43b4-32ed1c04984b	00100000-5643-3ec1-639b-a0065fbe8186	02	Tehnika
\.


--
-- TOC entry 3107 (class 0 OID 26542795)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5643-3ec1-4c06-baac7a5db710	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5643-3ec1-b925-d5adfb93dcd4	00010000-5643-3ec1-3af5-821fc8558bdc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5643-3ec1-7c86-2ffe082e6515	00010000-5643-3ec1-d624-ca28110fb7c5	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5643-3ec1-0ef0-ef2cb4a6fb63	00010000-5643-3ec1-b9fc-6d1998797f36	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5643-3ec1-72e7-5e33c235d7f1	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5643-3ec1-afa1-ebd78a500788	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5643-3ec1-99d9-5510d7cf31d9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5643-3ec1-1134-7287ee9090c2	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5643-3ec1-dd8e-4a7624ca2d4f	00010000-5643-3ec1-3c37-29acdf3f5981	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5643-3ec1-2fe3-83ba9ce2e7fb	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5643-3ec1-b4ce-b800b802385e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5643-3ec1-e08c-854837d870e2	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5643-3ec1-ca16-85b54a443f30	00010000-5643-3ec1-f047-a69a1d836279	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5643-3ec1-e8cb-0177708e0117	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-3ec1-1efd-acb7cdf4d103	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-3ec1-29f5-ab0bceb194c5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-3ec1-2745-565845445905	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5643-3ec1-760e-a5f45aee76a5	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5643-3ec1-7096-b3755ad67e6e	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-3ec1-2785-39d1d2cd4a0d	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5643-3ec1-50f0-81c5464d3a75	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3099 (class 0 OID 26542730)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5643-3ebf-d431-bc5c97037ab1	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5643-3ebf-5fef-790fd3554696	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5643-3ebf-7e20-b3bbc5d5a597	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5643-3ebf-75f6-411ecb3ec5ae	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5643-3ebf-2b85-21972a360262	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5643-3ebf-6921-b3b67bc621b3	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5643-3ebf-973d-4743c781aa4d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5643-3ebf-0063-799f2820a2ef	Abonma-read	Abonma - branje	t
00030000-5643-3ebf-6553-774c076c6557	Abonma-write	Abonma - spreminjanje	t
00030000-5643-3ebf-ac9f-6f7e05c471dc	Alternacija-read	Alternacija - branje	t
00030000-5643-3ebf-e8b2-a6788ce283fb	Alternacija-write	Alternacija - spreminjanje	t
00030000-5643-3ebf-a14e-b8fa99a2f213	Arhivalija-read	Arhivalija - branje	t
00030000-5643-3ebf-795c-6d73e9620009	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5643-3ebf-5e32-c0e3db86bed0	AuthStorage-read	AuthStorage - branje	t
00030000-5643-3ebf-5fa7-f3360e4e8682	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5643-3ebf-1963-a372424b3637	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5643-3ebf-a541-49a025cbd2e5	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5643-3ebf-0c98-efd69faac660	Besedilo-read	Besedilo - branje	t
00030000-5643-3ebf-3202-6a4e520d2cb7	Besedilo-write	Besedilo - spreminjanje	t
00030000-5643-3ebf-da1b-96981ba5d14b	Dogodek-read	Dogodek - branje	t
00030000-5643-3ebf-1dd3-120ec1b051e8	Dogodek-write	Dogodek - spreminjanje	t
00030000-5643-3ebf-1e2e-ec440c4720e3	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5643-3ebf-bd4b-dc1f32312916	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5643-3ebf-f69c-fe7a82473e6f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5643-3ebf-f7d5-02795af61500	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5643-3ebf-705c-8d353a84138b	DogodekTrait-read	DogodekTrait - branje	t
00030000-5643-3ebf-473f-39445a9a7f2e	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5643-3ebf-7792-4395ff5a03c4	DrugiVir-read	DrugiVir - branje	t
00030000-5643-3ebf-bc76-b347777d92d6	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5643-3ebf-db6f-b63b640eb856	Drzava-read	Drzava - branje	t
00030000-5643-3ebf-ca13-7ecd311673b2	Drzava-write	Drzava - spreminjanje	t
00030000-5643-3ebf-090e-18a1b458a67e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5643-3ebf-20f7-9574d2c681b2	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5643-3ebf-a32a-7a37539b5b4a	Funkcija-read	Funkcija - branje	t
00030000-5643-3ebf-530f-70e982dc64a3	Funkcija-write	Funkcija - spreminjanje	t
00030000-5643-3ebf-5a6c-fe2ef32c2726	Gostovanje-read	Gostovanje - branje	t
00030000-5643-3ebf-d636-a109702344f6	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5643-3ebf-3425-5d1dbc71bdd3	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5643-3ebf-6167-151b1398c8fe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5643-3ebf-2f26-882b013f8368	Kupec-read	Kupec - branje	t
00030000-5643-3ebf-b9c7-f88796419ac3	Kupec-write	Kupec - spreminjanje	t
00030000-5643-3ebf-f59e-eb68d52f025d	NacinPlacina-read	NacinPlacina - branje	t
00030000-5643-3ebf-ef36-e6b0d8553a88	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5643-3ebf-150f-0ce6c5d57bd9	Option-read	Option - branje	t
00030000-5643-3ebf-3952-93985793c3c3	Option-write	Option - spreminjanje	t
00030000-5643-3ebf-fd05-988cd306c6a9	OptionValue-read	OptionValue - branje	t
00030000-5643-3ebf-1a43-a4f68aa9c63a	OptionValue-write	OptionValue - spreminjanje	t
00030000-5643-3ebf-0cba-e81cf771fa7d	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5643-3ebf-0290-6a297a48c6c1	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5643-3ebf-0e8d-fc49f6815496	Oseba-read	Oseba - branje	t
00030000-5643-3ebf-e85b-1f9f58f8839b	Oseba-write	Oseba - spreminjanje	t
00030000-5643-3ebf-2c97-d39369bce5de	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5643-3ebf-1752-7bbb7ce33163	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5643-3ebf-c5f7-13e7ec6890c3	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5643-3ebf-4b59-48f458fd95af	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5643-3ebf-edb3-701497253e44	Pogodba-read	Pogodba - branje	t
00030000-5643-3ebf-fa06-2fdae3537d78	Pogodba-write	Pogodba - spreminjanje	t
00030000-5643-3ebf-bb8c-364facf27b4b	Popa-read	Popa - branje	t
00030000-5643-3ebf-5b09-bf811e77adb6	Popa-write	Popa - spreminjanje	t
00030000-5643-3ebf-b0d4-5b93fe3b2f36	Posta-read	Posta - branje	t
00030000-5643-3ebf-d85e-c66d68592d82	Posta-write	Posta - spreminjanje	t
00030000-5643-3ebf-9806-469da1953e71	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5643-3ebf-a02f-b110596146ad	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5643-3ebf-5235-ea7b8d2e2d9f	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5643-3ebf-ee0f-90a91d774938	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5643-3ebf-c0ec-3f4fa218880a	PostniNaslov-read	PostniNaslov - branje	t
00030000-5643-3ebf-a0ba-cdcc2570ec46	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5643-3ebf-8fa8-a3205d7cf0fd	Praznik-read	Praznik - branje	t
00030000-5643-3ebf-713e-ca947e10ffa6	Praznik-write	Praznik - spreminjanje	t
00030000-5643-3ebf-5685-ca82fd8dac9e	Predstava-read	Predstava - branje	t
00030000-5643-3ebf-9731-0065373ba8ad	Predstava-write	Predstava - spreminjanje	t
00030000-5643-3ebf-dab7-a68d7ade75ec	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5643-3ebf-a0c4-c4ee4c5bbad2	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5643-3ebf-1ac6-a82dac6dfc9c	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5643-3ebf-3c60-82d5b2ce30a7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5643-3ebf-58fa-df1d99cba46d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5643-3ebf-89bd-c2dfc497a027	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5643-3ebf-89cf-e085c7e8f74f	ProgramDela-read	ProgramDela - branje	t
00030000-5643-3ebf-828d-3eb9c927d423	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5643-3ebf-ea2e-e116297d8a98	ProgramFestival-read	ProgramFestival - branje	t
00030000-5643-3ebf-ca25-7ffe37cb7387	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5643-3ebf-8e6f-19d91c0fa88c	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5643-3ebf-29e4-b888f670ecbc	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5643-3ebf-b49c-6b15121f5b2d	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5643-3ebf-6300-d7e2ad783bdf	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5643-3ebf-036e-e9a564b24ca2	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5643-3ebf-f631-8d738018c478	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5643-3ebf-eaff-d048603c0aa2	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5643-3ebf-bb67-948776e49b5a	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5643-3ebf-92a0-848ee01b7d22	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5643-3ebf-67af-133945e14e09	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5643-3ebf-29e1-e6226bc301d7	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5643-3ebf-692e-83f01cd8b523	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5643-3ebf-8d77-c71813143a3a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5643-3ebf-b196-7f7d90e2da7f	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5643-3ebf-efc2-3a7e89c18b95	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5643-3ebf-1cc1-68e9a1e75120	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5643-3ebf-c9fe-d2f56922de37	Prostor-read	Prostor - branje	t
00030000-5643-3ebf-96b5-564f99b0d0a2	Prostor-write	Prostor - spreminjanje	t
00030000-5643-3ebf-165e-b1f1f660b633	Racun-read	Racun - branje	t
00030000-5643-3ebf-8a7b-39f25c5840f7	Racun-write	Racun - spreminjanje	t
00030000-5643-3ebf-02f5-8ec3321e68a8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5643-3ebf-6aea-f231fce4c465	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5643-3ebf-33c8-3c84aade866c	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5643-3ebf-3364-036b1c89792d	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5643-3ebf-d3d3-d86970c9cb7a	Rekvizit-read	Rekvizit - branje	t
00030000-5643-3ebf-dd74-ab0f611d23d9	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5643-3ebf-ee00-58889fb61af7	Revizija-read	Revizija - branje	t
00030000-5643-3ebf-afca-f535748f204c	Revizija-write	Revizija - spreminjanje	t
00030000-5643-3ebf-f9c3-5b62713554b8	Rezervacija-read	Rezervacija - branje	t
00030000-5643-3ebf-eaef-914a81f9108e	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5643-3ebf-0ffd-4140b4358b32	SedezniRed-read	SedezniRed - branje	t
00030000-5643-3ebf-bad1-3489c398ecf8	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5643-3ebf-72f5-214f85b79691	Sedez-read	Sedez - branje	t
00030000-5643-3ebf-f8bd-533d9476551b	Sedez-write	Sedez - spreminjanje	t
00030000-5643-3ebf-396b-dc1aeb197b9c	Sezona-read	Sezona - branje	t
00030000-5643-3ebf-72ae-dd437a2e21cf	Sezona-write	Sezona - spreminjanje	t
00030000-5643-3ebf-b777-ef89c2e7acff	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5643-3ebf-b6e8-96678acaf5da	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5643-3ebf-ec68-bda071486330	Stevilcenje-read	Stevilcenje - branje	t
00030000-5643-3ebf-91a9-ed26f8341acf	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5643-3ebf-17d4-1a0da42e75c4	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5643-3ebf-d21b-306f9f8efcdc	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5643-3ebf-dd97-2d9cf19bade2	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5643-3ebf-4962-5d4a0d571792	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5643-3ebf-7181-e53d7a448969	Telefonska-read	Telefonska - branje	t
00030000-5643-3ebf-d14d-e02921c9ae63	Telefonska-write	Telefonska - spreminjanje	t
00030000-5643-3ebf-1751-74d4f961cbc9	TerminStoritve-read	TerminStoritve - branje	t
00030000-5643-3ebf-c177-76002d142b70	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5643-3ebf-7de5-f352c40a523e	TipFunkcije-read	TipFunkcije - branje	t
00030000-5643-3ebf-ab25-0676fe515e8f	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5643-3ebf-dd2d-d1ced5336439	TipPopa-read	TipPopa - branje	t
00030000-5643-3ebf-e1ce-5f2e38636855	TipPopa-write	TipPopa - spreminjanje	t
00030000-5643-3ebf-0190-510720649fc2	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5643-3ebf-9c7a-69eaa84c2159	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5643-3ebf-9302-60ed86be0967	TipVaje-read	TipVaje - branje	t
00030000-5643-3ebf-1a28-a2bdb2d7206a	TipVaje-write	TipVaje - spreminjanje	t
00030000-5643-3ebf-dfb1-64f15b1a006a	Trr-read	Trr - branje	t
00030000-5643-3ebf-9e92-c36b58b0d5de	Trr-write	Trr - spreminjanje	t
00030000-5643-3ebf-8027-31ff61965fda	Uprizoritev-read	Uprizoritev - branje	t
00030000-5643-3ebf-2692-85cd7b0c2f19	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5643-3ebf-47c2-86bec7699972	Vaja-read	Vaja - branje	t
00030000-5643-3ebf-f5a0-3c16e24a5dbb	Vaja-write	Vaja - spreminjanje	t
00030000-5643-3ebf-31bb-5f3e2cec147b	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5643-3ebf-3819-7d7628014008	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5643-3ebf-f284-44d6be0c8741	VrstaStroska-read	VrstaStroska - branje	t
00030000-5643-3ebf-89b6-9420afdf1b5f	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5643-3ebf-0d9f-bd5d3cc4119b	Zaposlitev-read	Zaposlitev - branje	t
00030000-5643-3ebf-9613-e812a554e882	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5643-3ebf-c3c4-ba5662668b91	Zasedenost-read	Zasedenost - branje	t
00030000-5643-3ebf-9a89-d45a03f068b1	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5643-3ebf-cb69-2f5000f436ce	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5643-3ebf-cacb-cddb0d170089	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5643-3ebf-5297-fa9355362980	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5643-3ebf-e641-5c4d73bb1a54	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5643-3ebf-34a3-36395b716bf6	Job-read	Branje opravil - samo zase - branje	t
00030000-5643-3ebf-7eca-28f1925b866e	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5643-3ebf-2c17-5c0f4293ae20	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5643-3ebf-e74f-d6f93c00eda0	Report-read	Report - branje	t
00030000-5643-3ebf-c469-440a69620e27	Report-write	Report - spreminjanje	t
00030000-5643-3ebf-ef60-8f4e59b3a7f1	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5643-3ebf-e6d4-2680269e0900	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5643-3ebf-5fa7-b67239e6793b	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5643-3ebf-3d2e-a915b75c2ce2	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5643-3ebf-0b21-c37e1f6c1872	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5643-3ebf-5097-6182937599c9	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5643-3ebf-e1bc-383d8dbf2161	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5643-3ebf-3511-4a2d872590a5	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5643-3ebf-f11c-8d3b9a2423de	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5643-3ebf-ecfa-8db2e194d765	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5643-3ebf-b10e-af704a909e4a	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5643-3ebf-f3a7-72e789a20c36	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5643-3ebf-0310-ee07b028604a	Datoteka-write	Datoteka - spreminjanje	t
00030000-5643-3ebf-6964-af5d8ddd5329	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3101 (class 0 OID 26542749)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5643-3ebf-58eb-d51a3ee606af	00030000-5643-3ebf-5fef-790fd3554696
00020000-5643-3ebf-13c8-22946ab644db	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-0063-799f2820a2ef
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-6553-774c076c6557
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-ac9f-6f7e05c471dc
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-e8b2-a6788ce283fb
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-a14e-b8fa99a2f213
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-da1b-96981ba5d14b
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-75f6-411ecb3ec5ae
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-1dd3-120ec1b051e8
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-ca13-7ecd311673b2
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-a32a-7a37539b5b4a
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-530f-70e982dc64a3
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-5a6c-fe2ef32c2726
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-d636-a109702344f6
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-3425-5d1dbc71bdd3
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-6167-151b1398c8fe
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-150f-0ce6c5d57bd9
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-fd05-988cd306c6a9
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-0e8d-fc49f6815496
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-e85b-1f9f58f8839b
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-bb8c-364facf27b4b
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-5b09-bf811e77adb6
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-b0d4-5b93fe3b2f36
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-d85e-c66d68592d82
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-c0ec-3f4fa218880a
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-a0ba-cdcc2570ec46
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-5685-ca82fd8dac9e
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-9731-0065373ba8ad
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-58fa-df1d99cba46d
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-89bd-c2dfc497a027
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-c9fe-d2f56922de37
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-96b5-564f99b0d0a2
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-33c8-3c84aade866c
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-3364-036b1c89792d
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-d3d3-d86970c9cb7a
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-dd74-ab0f611d23d9
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-396b-dc1aeb197b9c
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-72ae-dd437a2e21cf
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-7de5-f352c40a523e
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-8027-31ff61965fda
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-2692-85cd7b0c2f19
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-47c2-86bec7699972
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-f5a0-3c16e24a5dbb
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-c3c4-ba5662668b91
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-9a89-d45a03f068b1
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-cb69-2f5000f436ce
00020000-5643-3ebf-064a-029baa8dc37b	00030000-5643-3ebf-5297-fa9355362980
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-0063-799f2820a2ef
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-a14e-b8fa99a2f213
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-da1b-96981ba5d14b
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-5a6c-fe2ef32c2726
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-3425-5d1dbc71bdd3
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-6167-151b1398c8fe
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-150f-0ce6c5d57bd9
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-fd05-988cd306c6a9
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-0e8d-fc49f6815496
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-e85b-1f9f58f8839b
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-bb8c-364facf27b4b
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-b0d4-5b93fe3b2f36
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-c0ec-3f4fa218880a
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-a0ba-cdcc2570ec46
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-5685-ca82fd8dac9e
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-c9fe-d2f56922de37
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-33c8-3c84aade866c
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-d3d3-d86970c9cb7a
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-396b-dc1aeb197b9c
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-7181-e53d7a448969
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-d14d-e02921c9ae63
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-dfb1-64f15b1a006a
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-9e92-c36b58b0d5de
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-0d9f-bd5d3cc4119b
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-9613-e812a554e882
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-cb69-2f5000f436ce
00020000-5643-3ebf-0d10-2e53fae7d472	00030000-5643-3ebf-5297-fa9355362980
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-0063-799f2820a2ef
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-ac9f-6f7e05c471dc
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-a14e-b8fa99a2f213
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-795c-6d73e9620009
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-0c98-efd69faac660
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-1e2e-ec440c4720e3
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-da1b-96981ba5d14b
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-a32a-7a37539b5b4a
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-5a6c-fe2ef32c2726
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-3425-5d1dbc71bdd3
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-150f-0ce6c5d57bd9
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-fd05-988cd306c6a9
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-0e8d-fc49f6815496
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-bb8c-364facf27b4b
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-b0d4-5b93fe3b2f36
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-5685-ca82fd8dac9e
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-58fa-df1d99cba46d
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-c9fe-d2f56922de37
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-33c8-3c84aade866c
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-d3d3-d86970c9cb7a
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-396b-dc1aeb197b9c
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-7de5-f352c40a523e
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-47c2-86bec7699972
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-c3c4-ba5662668b91
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-cb69-2f5000f436ce
00020000-5643-3ebf-cfa2-2b4285193a7a	00030000-5643-3ebf-5297-fa9355362980
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-0063-799f2820a2ef
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-6553-774c076c6557
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-e8b2-a6788ce283fb
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-a14e-b8fa99a2f213
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-da1b-96981ba5d14b
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-5a6c-fe2ef32c2726
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-150f-0ce6c5d57bd9
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-fd05-988cd306c6a9
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-bb8c-364facf27b4b
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-b0d4-5b93fe3b2f36
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-5685-ca82fd8dac9e
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-c9fe-d2f56922de37
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-33c8-3c84aade866c
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-d3d3-d86970c9cb7a
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-396b-dc1aeb197b9c
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-7de5-f352c40a523e
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-cb69-2f5000f436ce
00020000-5643-3ebf-7370-8318b9adb164	00030000-5643-3ebf-5297-fa9355362980
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-0063-799f2820a2ef
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-a14e-b8fa99a2f213
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-da1b-96981ba5d14b
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-5a6c-fe2ef32c2726
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-150f-0ce6c5d57bd9
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-fd05-988cd306c6a9
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-bb8c-364facf27b4b
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-b0d4-5b93fe3b2f36
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-5685-ca82fd8dac9e
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-c9fe-d2f56922de37
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-33c8-3c84aade866c
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-d3d3-d86970c9cb7a
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-396b-dc1aeb197b9c
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-1751-74d4f961cbc9
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-7e20-b3bbc5d5a597
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-7de5-f352c40a523e
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-cb69-2f5000f436ce
00020000-5643-3ebf-9c4e-9dab04d9a5c4	00030000-5643-3ebf-5297-fa9355362980
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-d431-bc5c97037ab1
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-5fef-790fd3554696
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0063-799f2820a2ef
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-6553-774c076c6557
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ac9f-6f7e05c471dc
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-e8b2-a6788ce283fb
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-a14e-b8fa99a2f213
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-795c-6d73e9620009
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1963-a372424b3637
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-a541-49a025cbd2e5
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0c98-efd69faac660
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-3202-6a4e520d2cb7
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1e2e-ec440c4720e3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-bd4b-dc1f32312916
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-da1b-96981ba5d14b
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-75f6-411ecb3ec5ae
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1dd3-120ec1b051e8
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-7792-4395ff5a03c4
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-bc76-b347777d92d6
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-db6f-b63b640eb856
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ca13-7ecd311673b2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-090e-18a1b458a67e
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-20f7-9574d2c681b2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-a32a-7a37539b5b4a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-530f-70e982dc64a3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-5a6c-fe2ef32c2726
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-d636-a109702344f6
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-3425-5d1dbc71bdd3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-6167-151b1398c8fe
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-2f26-882b013f8368
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-b9c7-f88796419ac3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-f59e-eb68d52f025d
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ef36-e6b0d8553a88
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-150f-0ce6c5d57bd9
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-fd05-988cd306c6a9
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1a43-a4f68aa9c63a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-3952-93985793c3c3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0cba-e81cf771fa7d
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0290-6a297a48c6c1
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0e8d-fc49f6815496
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-2b85-21972a360262
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-e85b-1f9f58f8839b
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-2c97-d39369bce5de
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1752-7bbb7ce33163
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-c5f7-13e7ec6890c3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-4b59-48f458fd95af
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-edb3-701497253e44
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-fa06-2fdae3537d78
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-bb8c-364facf27b4b
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-5b09-bf811e77adb6
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-b0d4-5b93fe3b2f36
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9806-469da1953e71
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-a02f-b110596146ad
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-5235-ea7b8d2e2d9f
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ee0f-90a91d774938
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-d85e-c66d68592d82
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-c0ec-3f4fa218880a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-a0ba-cdcc2570ec46
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-8fa8-a3205d7cf0fd
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-713e-ca947e10ffa6
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-5685-ca82fd8dac9e
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9731-0065373ba8ad
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-dab7-a68d7ade75ec
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-a0c4-c4ee4c5bbad2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1ac6-a82dac6dfc9c
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-3c60-82d5b2ce30a7
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-58fa-df1d99cba46d
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-89bd-c2dfc497a027
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-6921-b3b67bc621b3
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-89cf-e085c7e8f74f
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-973d-4743c781aa4d
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-828d-3eb9c927d423
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ea2e-e116297d8a98
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ca25-7ffe37cb7387
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-8e6f-19d91c0fa88c
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-29e4-b888f670ecbc
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-b49c-6b15121f5b2d
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-6300-d7e2ad783bdf
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-036e-e9a564b24ca2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-f631-8d738018c478
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-eaff-d048603c0aa2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-bb67-948776e49b5a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-92a0-848ee01b7d22
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-67af-133945e14e09
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-29e1-e6226bc301d7
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-692e-83f01cd8b523
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-8d77-c71813143a3a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-b196-7f7d90e2da7f
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-efc2-3a7e89c18b95
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1cc1-68e9a1e75120
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-c9fe-d2f56922de37
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-96b5-564f99b0d0a2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-165e-b1f1f660b633
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-8a7b-39f25c5840f7
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-02f5-8ec3321e68a8
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-6aea-f231fce4c465
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-33c8-3c84aade866c
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-3364-036b1c89792d
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-d3d3-d86970c9cb7a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-dd74-ab0f611d23d9
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ee00-58889fb61af7
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-afca-f535748f204c
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-f9c3-5b62713554b8
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-eaef-914a81f9108e
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0ffd-4140b4358b32
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-bad1-3489c398ecf8
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-72f5-214f85b79691
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-f8bd-533d9476551b
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-396b-dc1aeb197b9c
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-72ae-dd437a2e21cf
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-b777-ef89c2e7acff
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-b6e8-96678acaf5da
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ec68-bda071486330
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-17d4-1a0da42e75c4
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-d21b-306f9f8efcdc
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-91a9-ed26f8341acf
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-dd97-2d9cf19bade2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-4962-5d4a0d571792
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-7181-e53d7a448969
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-d14d-e02921c9ae63
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1751-74d4f961cbc9
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-7e20-b3bbc5d5a597
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-c177-76002d142b70
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-7de5-f352c40a523e
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-ab25-0676fe515e8f
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-dd2d-d1ced5336439
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-e1ce-5f2e38636855
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0190-510720649fc2
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9c7a-69eaa84c2159
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9302-60ed86be0967
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-1a28-a2bdb2d7206a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-dfb1-64f15b1a006a
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9e92-c36b58b0d5de
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-8027-31ff61965fda
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-2692-85cd7b0c2f19
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-47c2-86bec7699972
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-f5a0-3c16e24a5dbb
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-31bb-5f3e2cec147b
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-3819-7d7628014008
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-f284-44d6be0c8741
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-89b6-9420afdf1b5f
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-0d9f-bd5d3cc4119b
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9613-e812a554e882
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-c3c4-ba5662668b91
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-9a89-d45a03f068b1
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-cb69-2f5000f436ce
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-cacb-cddb0d170089
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-5297-fa9355362980
00020000-5643-3ec0-ebed-495b52191fcd	00030000-5643-3ebf-e641-5c4d73bb1a54
00020000-5643-3ec0-90b4-f0d2a75891b2	00030000-5643-3ebf-ecfa-8db2e194d765
00020000-5643-3ec0-85f4-503fd9731b48	00030000-5643-3ebf-f11c-8d3b9a2423de
00020000-5643-3ec0-72aa-cf33cb4560df	00030000-5643-3ebf-2692-85cd7b0c2f19
00020000-5643-3ec0-25be-8c115d4eac27	00030000-5643-3ebf-8027-31ff61965fda
00020000-5643-3ec0-db2a-c6321d1c923c	00030000-5643-3ebf-e6d4-2680269e0900
00020000-5643-3ec0-56d2-4277cadc4a4d	00030000-5643-3ebf-5fa7-b67239e6793b
00020000-5643-3ec0-4305-e63bb97dae30	00030000-5643-3ebf-3d2e-a915b75c2ce2
00020000-5643-3ec0-8d9a-ecfbe406f6cb	00030000-5643-3ebf-ef60-8f4e59b3a7f1
\.


--
-- TOC entry 3138 (class 0 OID 26543139)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 26543173)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 26543310)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5643-3ec1-c812-5c94d8b75de9	00090000-5643-3ec1-4c06-baac7a5db710	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5643-3ec1-1975-ce92c632fc84	00090000-5643-3ec1-afa1-ebd78a500788	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5643-3ec1-9df1-77af03cc39c6	00090000-5643-3ec1-ca16-85b54a443f30	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5643-3ec1-a5bd-39ca6a2d1713	00090000-5643-3ec1-2fe3-83ba9ce2e7fb	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3109 (class 0 OID 26542831)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5643-3ec1-1444-7cb9f3ed2174	\N	00040000-5643-3ebe-c29d-d84c8c30353e	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-439a-8d91a67da555	\N	00040000-5643-3ebe-c29d-d84c8c30353e	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5643-3ec1-4874-b9d4ee2586fc	\N	00040000-5643-3ebe-c29d-d84c8c30353e	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-3983-9f59b8505fe6	\N	00040000-5643-3ebe-c29d-d84c8c30353e	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-5543-2c94df7896b5	\N	00040000-5643-3ebe-c29d-d84c8c30353e	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-dff0-b804b66770f3	\N	00040000-5643-3ebe-2ec1-b5efd0e2d6b4	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-de7c-84aced3d3cee	\N	00040000-5643-3ebe-2d10-8e31a20893da	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-59c4-2f0b5ce69184	\N	00040000-5643-3ebe-29bd-a6f2bae2ba79	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec1-333d-a02019b3808a	\N	00040000-5643-3ebe-283a-03e940f163e7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5643-3ec2-cf1f-2c2e381ea5ad	\N	00040000-5643-3ebe-c29d-d84c8c30353e	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3112 (class 0 OID 26542876)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5643-3ebe-f264-d066bb609cae	8341	Adlešiči
00050000-5643-3ebe-9817-8917f498d44f	5270	Ajdovščina
00050000-5643-3ebe-ac8a-2b85f97a5717	6280	Ankaran/Ancarano
00050000-5643-3ebe-6653-e482676e3982	9253	Apače
00050000-5643-3ebe-538c-50a213da2400	8253	Artiče
00050000-5643-3ebe-d433-6d9894c3b0b0	4275	Begunje na Gorenjskem
00050000-5643-3ebe-2fd3-9d80e0aa0d20	1382	Begunje pri Cerknici
00050000-5643-3ebe-9a28-ef70dca11d72	9231	Beltinci
00050000-5643-3ebe-f41c-81f66c4da67f	2234	Benedikt
00050000-5643-3ebe-8e8b-5887d2f99fc2	2345	Bistrica ob Dravi
00050000-5643-3ebe-1ed4-61a0e2c36812	3256	Bistrica ob Sotli
00050000-5643-3ebe-a0ae-155e98808a6d	8259	Bizeljsko
00050000-5643-3ebe-becc-bed4897699cb	1223	Blagovica
00050000-5643-3ebe-020c-69e5bfde77b4	8283	Blanca
00050000-5643-3ebe-d526-90aa4e7a48e9	4260	Bled
00050000-5643-3ebe-9ad9-8a8be5b96a18	4273	Blejska Dobrava
00050000-5643-3ebe-772f-0484a9abcf55	9265	Bodonci
00050000-5643-3ebe-8506-dbdcdea10664	9222	Bogojina
00050000-5643-3ebe-e057-25eb2c55f132	4263	Bohinjska Bela
00050000-5643-3ebe-b17a-36c6cbe27a28	4264	Bohinjska Bistrica
00050000-5643-3ebe-8c4e-fd31be7b4bcc	4265	Bohinjsko jezero
00050000-5643-3ebe-6a59-582d45a35e9f	1353	Borovnica
00050000-5643-3ebe-c087-647e932663f2	8294	Boštanj
00050000-5643-3ebe-9abd-a8f46c8c1044	5230	Bovec
00050000-5643-3ebe-5ebd-adeb8caf2385	5295	Branik
00050000-5643-3ebe-7611-a6cdb1571da9	3314	Braslovče
00050000-5643-3ebe-46ec-2d92fb2da83b	5223	Breginj
00050000-5643-3ebe-6fdc-746869998f09	8280	Brestanica
00050000-5643-3ebe-b4e9-f1d5c18923fc	2354	Bresternica
00050000-5643-3ebe-c5a6-edf63c6a872a	4243	Brezje
00050000-5643-3ebe-8105-e6c297723201	1351	Brezovica pri Ljubljani
00050000-5643-3ebe-6d53-9409cbe94cbb	8250	Brežice
00050000-5643-3ebe-8ac9-f142111acf62	4210	Brnik - Aerodrom
00050000-5643-3ebe-ec12-76ca440b317c	8321	Brusnice
00050000-5643-3ebe-d5a7-b9939f953814	3255	Buče
00050000-5643-3ebe-483d-e4d134c35a80	8276	Bučka 
00050000-5643-3ebe-cd36-4cdcbe7293c8	9261	Cankova
00050000-5643-3ebe-6de6-30c031725d34	3000	Celje 
00050000-5643-3ebe-4bb3-5460b4afe8ce	3001	Celje - poštni predali
00050000-5643-3ebe-5024-b1f67027deef	4207	Cerklje na Gorenjskem
00050000-5643-3ebe-413e-e3760e1a86e4	8263	Cerklje ob Krki
00050000-5643-3ebe-96b6-89862ce1277b	1380	Cerknica
00050000-5643-3ebe-cb7d-d4228eb43cca	5282	Cerkno
00050000-5643-3ebe-c648-64bece6480d8	2236	Cerkvenjak
00050000-5643-3ebe-e2ce-cc778ca71344	2215	Ceršak
00050000-5643-3ebe-2e2d-2b5b126b8ac6	2326	Cirkovce
00050000-5643-3ebe-0f2a-2da2db60d74b	2282	Cirkulane
00050000-5643-3ebe-2ced-18f76cb51e85	5273	Col
00050000-5643-3ebe-f98d-572fc3373e6c	8251	Čatež ob Savi
00050000-5643-3ebe-c5d2-42e9aa0ae913	1413	Čemšenik
00050000-5643-3ebe-8699-2789a4ebec5a	5253	Čepovan
00050000-5643-3ebe-60e6-fb77fa3cbcbf	9232	Črenšovci
00050000-5643-3ebe-c763-4946443b56b3	2393	Črna na Koroškem
00050000-5643-3ebe-8d33-4a74f6eb2584	6275	Črni Kal
00050000-5643-3ebe-d770-a3f8c44d02db	5274	Črni Vrh nad Idrijo
00050000-5643-3ebe-e3e0-bdea629a5f05	5262	Črniče
00050000-5643-3ebe-a348-5020d024bb99	8340	Črnomelj
00050000-5643-3ebe-deed-9165c001ae55	6271	Dekani
00050000-5643-3ebe-637a-cf814e71784f	5210	Deskle
00050000-5643-3ebe-4837-59a464d6efa0	2253	Destrnik
00050000-5643-3ebe-39d2-e3775ffab3b9	6215	Divača
00050000-5643-3ebe-8b1a-3818b7c2b64d	1233	Dob
00050000-5643-3ebe-ef39-3b489026b485	3224	Dobje pri Planini
00050000-5643-3ebe-595d-597a3ff3d45e	8257	Dobova
00050000-5643-3ebe-6228-906e474e7ca4	1423	Dobovec
00050000-5643-3ebe-3941-f07ab4ae2d9c	5263	Dobravlje
00050000-5643-3ebe-4361-68041241c1e8	3204	Dobrna
00050000-5643-3ebe-d272-6b24e6f3da7d	8211	Dobrnič
00050000-5643-3ebe-d9dc-acd84187d12c	1356	Dobrova
00050000-5643-3ebe-d56a-bc163a47dd33	9223	Dobrovnik/Dobronak 
00050000-5643-3ebe-a334-7d59ed9e29f4	5212	Dobrovo v Brdih
00050000-5643-3ebe-faa2-bbafeb57cc49	1431	Dol pri Hrastniku
00050000-5643-3ebe-89e8-5c45a97fcf8b	1262	Dol pri Ljubljani
00050000-5643-3ebe-52f0-d4af785d1c75	1273	Dole pri Litiji
00050000-5643-3ebe-135a-da3b0750a1e2	1331	Dolenja vas
00050000-5643-3ebe-8fc5-27e688dfcfa0	8350	Dolenjske Toplice
00050000-5643-3ebe-8f00-1bdf448d4f8e	1230	Domžale
00050000-5643-3ebe-c1a7-2a4efaf5d3cb	2252	Dornava
00050000-5643-3ebe-17d9-8e41ef7da72f	5294	Dornberk
00050000-5643-3ebe-35b7-a9e735ab8367	1319	Draga
00050000-5643-3ebe-b443-ad2d778065c7	8343	Dragatuš
00050000-5643-3ebe-7129-3debc5b3f5c1	3222	Dramlje
00050000-5643-3ebe-3368-5e33bd754925	2370	Dravograd
00050000-5643-3ebe-8f05-1cfeb0d6030d	4203	Duplje
00050000-5643-3ebe-a30f-7f2359dfa135	6221	Dutovlje
00050000-5643-3ebe-2794-ed692d32655b	8361	Dvor
00050000-5643-3ebe-7a38-969be0a6e213	2343	Fala
00050000-5643-3ebe-686a-bc8d2606602f	9208	Fokovci
00050000-5643-3ebe-c41f-452babbd0cd8	2313	Fram
00050000-5643-3ebe-b6c1-39657995d08c	3213	Frankolovo
00050000-5643-3ebe-e4d0-fde771cf872d	1274	Gabrovka
00050000-5643-3ebe-7ccb-5f41c04aa611	8254	Globoko
00050000-5643-3ebe-d7bb-ecf06eeb8013	5275	Godovič
00050000-5643-3ebe-f06a-7ac244fdc66a	4204	Golnik
00050000-5643-3ebe-5d50-7191eff17a5a	3303	Gomilsko
00050000-5643-3ebe-963a-b5ab2c2049f5	4224	Gorenja vas
00050000-5643-3ebe-1965-2c891ec78f60	3263	Gorica pri Slivnici
00050000-5643-3ebe-7a5b-042d720f02fa	2272	Gorišnica
00050000-5643-3ebe-9313-6f2e0be4032b	9250	Gornja Radgona
00050000-5643-3ebe-d28f-c56b363f49a2	3342	Gornji Grad
00050000-5643-3ebe-cf1e-ebe32b8bbf2a	4282	Gozd Martuljek
00050000-5643-3ebe-1d9f-a60fdd2fadb7	6272	Gračišče
00050000-5643-3ebe-d29c-68f54be3ce06	9264	Grad
00050000-5643-3ebe-aa01-61fbc8214351	8332	Gradac
00050000-5643-3ebe-9717-3f08db3f022b	1384	Grahovo
00050000-5643-3ebe-2c53-8b2350a8fae2	5242	Grahovo ob Bači
00050000-5643-3ebe-61b1-dfeab4e6d099	5251	Grgar
00050000-5643-3ebe-aaf4-b7078f42429c	3302	Griže
00050000-5643-3ebe-f8ff-760a12a30e8b	3231	Grobelno
00050000-5643-3ebe-52ef-0db061649bf0	1290	Grosuplje
00050000-5643-3ebe-f8c4-aa6706369353	2288	Hajdina
00050000-5643-3ebe-663f-f05b8c128e17	8362	Hinje
00050000-5643-3ebe-2793-63500df50763	2311	Hoče
00050000-5643-3ebe-3c04-b2f38d80a490	9205	Hodoš/Hodos
00050000-5643-3ebe-ea86-c732357632ee	1354	Horjul
00050000-5643-3ebe-8bbe-78a2a2cef19d	1372	Hotedršica
00050000-5643-3ebe-a7e3-822624cfb9bb	1430	Hrastnik
00050000-5643-3ebe-eeba-d4cd0c68939a	6225	Hruševje
00050000-5643-3ebe-b29d-8771a10aae96	4276	Hrušica
00050000-5643-3ebe-3bf0-ab9f7f081365	5280	Idrija
00050000-5643-3ebe-c5cd-c4cfdb2767b6	1292	Ig
00050000-5643-3ebe-3bc2-cdb629a2b985	6250	Ilirska Bistrica
00050000-5643-3ebe-b757-6b1b36ef2a22	6251	Ilirska Bistrica-Trnovo
00050000-5643-3ebe-4a82-0a1ed7b784b4	1295	Ivančna Gorica
00050000-5643-3ebe-2918-dcc3e5e6abc5	2259	Ivanjkovci
00050000-5643-3ebe-c2b9-1f61c04bc106	1411	Izlake
00050000-5643-3ebe-866f-95459279aae5	6310	Izola/Isola
00050000-5643-3ebe-e1d9-df08c61b59b4	2222	Jakobski Dol
00050000-5643-3ebe-a3d6-838be9b45871	2221	Jarenina
00050000-5643-3ebe-29ba-310971728f1e	6254	Jelšane
00050000-5643-3ebe-7dbd-925fc6538cd1	4270	Jesenice
00050000-5643-3ebe-98f1-ada00afb737f	8261	Jesenice na Dolenjskem
00050000-5643-3ebe-9a39-36f169a776b1	3273	Jurklošter
00050000-5643-3ebe-791e-8a22193f8bad	2223	Jurovski Dol
00050000-5643-3ebe-8a6c-a3bcbd89aefd	2256	Juršinci
00050000-5643-3ebe-ee4f-795a462e9e88	5214	Kal nad Kanalom
00050000-5643-3ebe-6fd7-8d0093146c28	3233	Kalobje
00050000-5643-3ebe-827c-e6b03749630e	4246	Kamna Gorica
00050000-5643-3ebe-6f6a-b8bacac2e08b	2351	Kamnica
00050000-5643-3ebe-9202-e1591dc37851	1241	Kamnik
00050000-5643-3ebe-ee4e-8fbb52457713	5213	Kanal
00050000-5643-3ebe-e6b4-7d711b103328	8258	Kapele
00050000-5643-3ebe-fcc3-f3ae2de39b8a	2362	Kapla
00050000-5643-3ebe-74bd-84825c1670c1	2325	Kidričevo
00050000-5643-3ebe-e99c-a610bbc3cecd	1412	Kisovec
00050000-5643-3ebe-6597-8da9b63b19c9	6253	Knežak
00050000-5643-3ebe-0324-06e55dd79168	5222	Kobarid
00050000-5643-3ebe-6049-4a9a759ee227	9227	Kobilje
00050000-5643-3ebe-f01c-b86baf17452c	1330	Kočevje
00050000-5643-3ebe-5c31-3b39c1097ce9	1338	Kočevska Reka
00050000-5643-3ebe-451c-1bb37dc41979	2276	Kog
00050000-5643-3ebe-3c93-3cb55d0ff432	5211	Kojsko
00050000-5643-3ebe-83b1-866e0c40bf05	6223	Komen
00050000-5643-3ebe-1d99-f39e57263d4b	1218	Komenda
00050000-5643-3ebe-8e97-ff3f93d2dbd2	6000	Koper/Capodistria 
00050000-5643-3ebe-6271-a09e7f901ab9	6001	Koper/Capodistria - poštni predali
00050000-5643-3ebe-e488-bd914c029514	8282	Koprivnica
00050000-5643-3ebe-c780-b4b564650c04	5296	Kostanjevica na Krasu
00050000-5643-3ebe-88e6-fbced21ef90f	8311	Kostanjevica na Krki
00050000-5643-3ebe-9f14-b13b01216573	1336	Kostel
00050000-5643-3ebe-bac7-abf47cdfd06d	6256	Košana
00050000-5643-3ebe-adc8-919494a22fbc	2394	Kotlje
00050000-5643-3ebe-c553-20055e31ef9f	6240	Kozina
00050000-5643-3ebe-68ad-c81e76875c53	3260	Kozje
00050000-5643-3ebe-ed5b-7588487fc88a	4000	Kranj 
00050000-5643-3ebe-36c3-fe44de49192b	4001	Kranj - poštni predali
00050000-5643-3ebe-4ec4-e2f9dab9cead	4280	Kranjska Gora
00050000-5643-3ebe-578d-fa2dec473eee	1281	Kresnice
00050000-5643-3ebe-4fc1-5651caaa9f59	4294	Križe
00050000-5643-3ebe-0d05-1b6fbc470102	9206	Križevci
00050000-5643-3ebe-2a96-20e71735a8fe	9242	Križevci pri Ljutomeru
00050000-5643-3ebe-3127-b4307623d323	1301	Krka
00050000-5643-3ebe-c49d-bb12dd75514a	8296	Krmelj
00050000-5643-3ebe-89cc-2cac0b5f5b76	4245	Kropa
00050000-5643-3ebe-1198-c42cb7c41c39	8262	Krška vas
00050000-5643-3ebe-8231-fc5c8ca494a5	8270	Krško
00050000-5643-3ebe-c2fc-e061bb058bad	9263	Kuzma
00050000-5643-3ebe-fb3d-50f42c5f750f	2318	Laporje
00050000-5643-3ebe-53e1-07ce02dc6752	3270	Laško
00050000-5643-3ebe-eca2-3e108e28d371	1219	Laze v Tuhinju
00050000-5643-3ebe-8109-a37ddd65c295	2230	Lenart v Slovenskih goricah
00050000-5643-3ebe-e111-5245c8086303	9220	Lendava/Lendva
00050000-5643-3ebe-39b8-049502d2b84e	4248	Lesce
00050000-5643-3ebe-31c9-d79547a6435c	3261	Lesično
00050000-5643-3ebe-60eb-e1dbb1f79fd9	8273	Leskovec pri Krškem
00050000-5643-3ebe-83f2-128b57bef559	2372	Libeliče
00050000-5643-3ebe-cb08-b3acac40959d	2341	Limbuš
00050000-5643-3ebe-bdf3-5726c9ae4f18	1270	Litija
00050000-5643-3ebe-e4da-a3c07e197110	3202	Ljubečna
00050000-5643-3ebe-d9cb-9320d3ae0db8	1000	Ljubljana 
00050000-5643-3ebe-1c6b-78e068646efd	1001	Ljubljana - poštni predali
00050000-5643-3ebe-8b8b-fb9cd3503fbc	1231	Ljubljana - Črnuče
00050000-5643-3ebe-9194-15da86de4850	1261	Ljubljana - Dobrunje
00050000-5643-3ebe-67e5-a6d33e4f620e	1260	Ljubljana - Polje
00050000-5643-3ebe-9773-069c39730f9a	1210	Ljubljana - Šentvid
00050000-5643-3ebe-0369-90eba295328f	1211	Ljubljana - Šmartno
00050000-5643-3ebe-5db5-869e446245a3	3333	Ljubno ob Savinji
00050000-5643-3ebe-3c1b-65f736a534a5	9240	Ljutomer
00050000-5643-3ebe-cbec-3e4eb8979ed8	3215	Loče
00050000-5643-3ebe-8462-4ca140a85c5d	5231	Log pod Mangartom
00050000-5643-3ebe-28ba-b716c6a5d7ff	1358	Log pri Brezovici
00050000-5643-3ebe-7c5f-fa73b733e60c	1370	Logatec
00050000-5643-3ebe-c0e5-2b36e26a8592	1371	Logatec
00050000-5643-3ebe-0c09-9dff0c124d5e	1434	Loka pri Zidanem Mostu
00050000-5643-3ebe-8515-a1807283313b	3223	Loka pri Žusmu
00050000-5643-3ebe-9ad8-1a6f2b7eb497	6219	Lokev
00050000-5643-3ebe-e20d-3161574a8778	1318	Loški Potok
00050000-5643-3ebe-d3bc-09e1995d1567	2324	Lovrenc na Dravskem polju
00050000-5643-3ebe-9115-e41c9efb55e6	2344	Lovrenc na Pohorju
00050000-5643-3ebe-da3a-4a6d9aaf98ad	3334	Luče
00050000-5643-3ebe-5870-c10824f46fa3	1225	Lukovica
00050000-5643-3ebe-9793-f7280cf60c97	9202	Mačkovci
00050000-5643-3ebe-ad27-42c7c40dc445	2322	Majšperk
00050000-5643-3ebe-4426-df8d4e669bde	2321	Makole
00050000-5643-3ebe-c613-4d57d305bbc0	9243	Mala Nedelja
00050000-5643-3ebe-5142-d2d57ca5afc2	2229	Malečnik
00050000-5643-3ebe-47f6-abfbe0a21ee2	6273	Marezige
00050000-5643-3ebe-5df0-f2ef675ef1e3	2000	Maribor 
00050000-5643-3ebe-01dd-0349a6257b47	2001	Maribor - poštni predali
00050000-5643-3ebe-72e7-84488a6051b9	2206	Marjeta na Dravskem polju
00050000-5643-3ebe-93dc-a05e4d56f4d9	2281	Markovci
00050000-5643-3ebe-5cfb-dcd9a9b22dd1	9221	Martjanci
00050000-5643-3ebe-9688-be9a4137e84f	6242	Materija
00050000-5643-3ebe-13ea-ddf865567e4d	4211	Mavčiče
00050000-5643-3ebe-5397-3d43132eb91e	1215	Medvode
00050000-5643-3ebe-bc15-4f61a6130f27	1234	Mengeš
00050000-5643-3ebe-66ba-b6a70fcdd8f7	8330	Metlika
00050000-5643-3ebe-d416-d1cf83069f15	2392	Mežica
00050000-5643-3ebe-a9d8-756431a4abee	2204	Miklavž na Dravskem polju
00050000-5643-3ebe-4c40-76e5cfe77795	2275	Miklavž pri Ormožu
00050000-5643-3ebe-ad9a-066d4ba0ce7f	5291	Miren
00050000-5643-3ebe-74f0-3de343b8f7de	8233	Mirna
00050000-5643-3ebe-f872-5f989318ba65	8216	Mirna Peč
00050000-5643-3ebe-cedd-bc7715da5949	2382	Mislinja
00050000-5643-3ebe-5a18-992af3a1f39d	4281	Mojstrana
00050000-5643-3ebe-a9f2-b10c55fba90c	8230	Mokronog
00050000-5643-3ebe-3b51-bb8dd2b1c721	1251	Moravče
00050000-5643-3ebe-6101-1bf17c0b8fc9	9226	Moravske Toplice
00050000-5643-3ebe-965c-472a98d1eb5e	5216	Most na Soči
00050000-5643-3ebe-0f06-06aac996fd8c	1221	Motnik
00050000-5643-3ebe-a947-639ec84b17e0	3330	Mozirje
00050000-5643-3ebe-ecf3-d583d607d54a	9000	Murska Sobota 
00050000-5643-3ebe-c09a-c8abc8224f02	9001	Murska Sobota - poštni predali
00050000-5643-3ebe-f5bb-bd10be4d3c60	2366	Muta
00050000-5643-3ebe-34df-2c1c6cf3dc25	4202	Naklo
00050000-5643-3ebe-4cfc-f5206bd4e5ad	3331	Nazarje
00050000-5643-3ebe-c12b-7fb211c9cdb0	1357	Notranje Gorice
00050000-5643-3ebe-5f19-f7801afc5309	3203	Nova Cerkev
00050000-5643-3ebe-92f8-7030cbb01468	5000	Nova Gorica 
00050000-5643-3ebe-bf3e-f0d85340bd93	5001	Nova Gorica - poštni predali
00050000-5643-3ebe-1bba-69ebd14c567d	1385	Nova vas
00050000-5643-3ebe-4f99-6d8e016d9cb0	8000	Novo mesto
00050000-5643-3ebe-fc65-4992a7c91bb0	8001	Novo mesto - poštni predali
00050000-5643-3ebe-5819-66327510efd1	6243	Obrov
00050000-5643-3ebe-63d0-c1ed3ba8f5ba	9233	Odranci
00050000-5643-3ebe-0a4d-abcf2a8c2785	2317	Oplotnica
00050000-5643-3ebe-c9f7-fa0c9beee13e	2312	Orehova vas
00050000-5643-3ebe-313c-3ff80b463156	2270	Ormož
00050000-5643-3ebe-7646-d2e0e600f0fc	1316	Ortnek
00050000-5643-3ebe-352c-e2d1522575fb	1337	Osilnica
00050000-5643-3ebe-7593-83b535b9cf30	8222	Otočec
00050000-5643-3ebe-5b4a-04cb9d39889a	2361	Ožbalt
00050000-5643-3ebe-c754-6db1e588538a	2231	Pernica
00050000-5643-3ebe-909b-906191169378	2211	Pesnica pri Mariboru
00050000-5643-3ebe-06de-421eda212cc1	9203	Petrovci
00050000-5643-3ebe-5235-fa47f2f8cadc	3301	Petrovče
00050000-5643-3ebe-1ebc-cdc5e3b3fab2	6330	Piran/Pirano
00050000-5643-3ebe-353f-a11cd8940900	8255	Pišece
00050000-5643-3ebe-040c-2dd247606b4e	6257	Pivka
00050000-5643-3ebe-e77b-330d869e9f10	6232	Planina
00050000-5643-3ebe-b04f-95db272b5417	3225	Planina pri Sevnici
00050000-5643-3ebe-d643-061961ddd050	6276	Pobegi
00050000-5643-3ebe-795d-9aad1b819a2a	8312	Podbočje
00050000-5643-3ebe-033d-2caef384039e	5243	Podbrdo
00050000-5643-3ebe-75e3-7fc64f7fb7e5	3254	Podčetrtek
00050000-5643-3ebe-c126-ffbb86599e99	2273	Podgorci
00050000-5643-3ebe-4452-5ab1aa251606	6216	Podgorje
00050000-5643-3ebe-8014-ab70b4cf348b	2381	Podgorje pri Slovenj Gradcu
00050000-5643-3ebe-fb5b-42b85b05488a	6244	Podgrad
00050000-5643-3ebe-8f51-bf889d3a98bc	1414	Podkum
00050000-5643-3ebe-49c9-3863ecd08d32	2286	Podlehnik
00050000-5643-3ebe-f883-c554eba902e1	5272	Podnanos
00050000-5643-3ebe-d583-5014656b0fb1	4244	Podnart
00050000-5643-3ebe-a24d-bd6d95c90a53	3241	Podplat
00050000-5643-3ebe-a6a8-255f7d360ded	3257	Podsreda
00050000-5643-3ebe-7552-1f4759d3e345	2363	Podvelka
00050000-5643-3ebe-ed88-19b35adcdd25	2208	Pohorje
00050000-5643-3ebe-5fc0-f5489d34db73	2257	Polenšak
00050000-5643-3ebe-7eb4-654bdf1827e2	1355	Polhov Gradec
00050000-5643-3ebe-6513-8a330de353d0	4223	Poljane nad Škofjo Loko
00050000-5643-3ebe-bd25-02c6455722af	2319	Poljčane
00050000-5643-3ebe-da8b-dc2cdf3149ff	1272	Polšnik
00050000-5643-3ebe-8bb0-42e08c37ca6a	3313	Polzela
00050000-5643-3ebe-8502-340bdb706ebf	3232	Ponikva
00050000-5643-3ebe-429c-8eee27f161d5	6320	Portorož/Portorose
00050000-5643-3ebe-38b8-fee02893fbec	6230	Postojna
00050000-5643-3ebe-8a83-04698a7e14aa	2331	Pragersko
00050000-5643-3ebe-a502-770bfbcdedb6	3312	Prebold
00050000-5643-3ebe-5cd4-ddaad1107d34	4205	Preddvor
00050000-5643-3ebe-d724-cf1f327266a5	6255	Prem
00050000-5643-3ebe-a06e-3f0ba187731b	1352	Preserje
00050000-5643-3ebe-a23a-e2bcce53b313	6258	Prestranek
00050000-5643-3ebe-0da0-8443f36b1085	2391	Prevalje
00050000-5643-3ebe-3f77-0196c8b2d5f1	3262	Prevorje
00050000-5643-3ebe-350f-080b86f51854	1276	Primskovo 
00050000-5643-3ebe-e3e9-019e4bd23c90	3253	Pristava pri Mestinju
00050000-5643-3ebe-21b3-d933cb61cba7	9207	Prosenjakovci/Partosfalva
00050000-5643-3ebe-cb47-54570536251b	5297	Prvačina
00050000-5643-3ebe-ff40-e748726eb6d2	2250	Ptuj
00050000-5643-3ebe-4bfc-59281ba5ec52	2323	Ptujska Gora
00050000-5643-3ebe-19c9-7fb40ce31a94	9201	Puconci
00050000-5643-3ebe-05fc-5aaed241fa07	2327	Rače
00050000-5643-3ebe-dd4a-2467ee52b6ba	1433	Radeče
00050000-5643-3ebe-d3bd-31096842afb6	9252	Radenci
00050000-5643-3ebe-592d-dc4247379f82	2360	Radlje ob Dravi
00050000-5643-3ebe-79f8-2fa4edb63833	1235	Radomlje
00050000-5643-3ebe-ae76-d5aeeb09e5b3	4240	Radovljica
00050000-5643-3ebe-71c2-9f25ff9f56e9	8274	Raka
00050000-5643-3ebe-a864-2416ead4ce72	1381	Rakek
00050000-5643-3ebe-6879-7c6325d83890	4283	Rateče - Planica
00050000-5643-3ebe-a778-c70af6599b8d	2390	Ravne na Koroškem
00050000-5643-3ebe-c781-6e9d55bc3dde	9246	Razkrižje
00050000-5643-3ebe-a311-6f817779da80	3332	Rečica ob Savinji
00050000-5643-3ebe-fee0-54b074912011	5292	Renče
00050000-5643-3ebe-7ae5-1da230bc503f	1310	Ribnica
00050000-5643-3ebe-1a89-de661fe316aa	2364	Ribnica na Pohorju
00050000-5643-3ebe-495e-3c109939a9ef	3272	Rimske Toplice
00050000-5643-3ebe-e387-3ba201823b1a	1314	Rob
00050000-5643-3ebe-bf4a-c2bb3c77511c	5215	Ročinj
00050000-5643-3ebe-fdcd-596942cc7274	3250	Rogaška Slatina
00050000-5643-3ebe-0a03-e3a9ff8be5d3	9262	Rogašovci
00050000-5643-3ebe-2c0a-3cef24bedce8	3252	Rogatec
00050000-5643-3ebe-8ac0-5eac4d6bf5e1	1373	Rovte
00050000-5643-3ebe-0f44-e94162ba7bb3	2342	Ruše
00050000-5643-3ebe-d6a2-266708b2c2b4	1282	Sava
00050000-5643-3ebe-70fe-79799c70c31c	6333	Sečovlje/Sicciole
00050000-5643-3ebe-390e-d24c9f88df44	4227	Selca
00050000-5643-3ebe-a5cb-7de8313b62c9	2352	Selnica ob Dravi
00050000-5643-3ebe-c5fb-6f222ea62662	8333	Semič
00050000-5643-3ebe-6efa-8fa3054cb0b8	8281	Senovo
00050000-5643-3ebe-b21e-a77b74b438c5	6224	Senožeče
00050000-5643-3ebe-a2f9-9204bd74ca87	8290	Sevnica
00050000-5643-3ebe-7f70-4af45936b9f6	6210	Sežana
00050000-5643-3ebe-fd42-a47086415e04	2214	Sladki Vrh
00050000-5643-3ebe-8c85-02823524c9de	5283	Slap ob Idrijci
00050000-5643-3ebe-4a44-e76500a1c392	2380	Slovenj Gradec
00050000-5643-3ebe-573a-5287312f9ead	2310	Slovenska Bistrica
00050000-5643-3ebe-458f-38271dbd1616	3210	Slovenske Konjice
00050000-5643-3ebe-51b2-f7790bc262d0	1216	Smlednik
00050000-5643-3ebe-e6cf-6b2a95033c40	5232	Soča
00050000-5643-3ebe-ff56-81768d10c370	1317	Sodražica
00050000-5643-3ebe-aedf-d07d105d5ee9	3335	Solčava
00050000-5643-3ebe-1108-5e99e5de7efb	5250	Solkan
00050000-5643-3ebe-22b6-d06c9c416fce	4229	Sorica
00050000-5643-3ebe-96d2-d8857eb17e2a	4225	Sovodenj
00050000-5643-3ebe-e509-ce7da72c8313	5281	Spodnja Idrija
00050000-5643-3ebe-e115-c0ff476e75b3	2241	Spodnji Duplek
00050000-5643-3ebe-c966-ab601c456eeb	9245	Spodnji Ivanjci
00050000-5643-3ebe-59dd-501caf6dd6a1	2277	Središče ob Dravi
00050000-5643-3ebe-207d-dabf3b2b3024	4267	Srednja vas v Bohinju
00050000-5643-3ebe-520c-c2bac1066cdd	8256	Sromlje 
00050000-5643-3ebe-1bc6-0fe7ad4eeb78	5224	Srpenica
00050000-5643-3ebe-3f87-e2b21e21e54d	1242	Stahovica
00050000-5643-3ebe-071d-c21fd349e5b4	1332	Stara Cerkev
00050000-5643-3ebe-6b3a-93bf71a2e8a7	8342	Stari trg ob Kolpi
00050000-5643-3ebe-8292-41ff5a8acd47	1386	Stari trg pri Ložu
00050000-5643-3ebe-1249-c5e02f63d3e6	2205	Starše
00050000-5643-3ebe-742e-af93af3f3d15	2289	Stoperce
00050000-5643-3ebe-ec6a-fdf979034c49	8322	Stopiče
00050000-5643-3ebe-47de-043a198d325a	3206	Stranice
00050000-5643-3ebe-f847-446bd80ed89a	8351	Straža
00050000-5643-3ebe-7080-648b77971b41	1313	Struge
00050000-5643-3ebe-5063-adfb0b9e5ef7	8293	Studenec
00050000-5643-3ebe-bdc3-01af438e98bd	8331	Suhor
00050000-5643-3ebe-c77d-bee2c1b2d938	2233	Sv. Ana v Slovenskih goricah
00050000-5643-3ebe-56bb-954a054f3229	2235	Sv. Trojica v Slovenskih goricah
00050000-5643-3ebe-a9bc-ed4958796f29	2353	Sveti Duh na Ostrem Vrhu
00050000-5643-3ebe-2627-23ae6a892d17	9244	Sveti Jurij ob Ščavnici
00050000-5643-3ebe-e6f9-7490c0f66ed9	3264	Sveti Štefan
00050000-5643-3ebe-6109-fbbbe745a740	2258	Sveti Tomaž
00050000-5643-3ebe-365a-776fb2355121	9204	Šalovci
00050000-5643-3ebe-086f-c2fc36d652fa	5261	Šempas
00050000-5643-3ebe-39a2-56e86b928039	5290	Šempeter pri Gorici
00050000-5643-3ebe-d640-b72fad1bf655	3311	Šempeter v Savinjski dolini
00050000-5643-3ebe-f19b-590026a2ae05	4208	Šenčur
00050000-5643-3ebe-d2e0-92b230e5d827	2212	Šentilj v Slovenskih goricah
00050000-5643-3ebe-e0da-354c392194e0	8297	Šentjanž
00050000-5643-3ebe-474b-941ecd52c717	2373	Šentjanž pri Dravogradu
00050000-5643-3ebe-1049-e0644d333190	8310	Šentjernej
00050000-5643-3ebe-d0e4-b8bd67365e1a	3230	Šentjur
00050000-5643-3ebe-3382-bd6124e5301a	3271	Šentrupert
00050000-5643-3ebe-d6b4-9c9927709816	8232	Šentrupert
00050000-5643-3ebe-fbbb-7d7820954cdc	1296	Šentvid pri Stični
00050000-5643-3ebe-a343-4c64162517ba	8275	Škocjan
00050000-5643-3ebe-a1b4-e3457276113d	6281	Škofije
00050000-5643-3ebe-4998-95aa81b2dff8	4220	Škofja Loka
00050000-5643-3ebe-eeb4-c88f1d402d3c	3211	Škofja vas
00050000-5643-3ebe-5dab-35154b8ea313	1291	Škofljica
00050000-5643-3ebe-4ce0-4913cc70660c	6274	Šmarje
00050000-5643-3ebe-06d3-9ee6abcbf10f	1293	Šmarje - Sap
00050000-5643-3ebe-592f-47f2cf3eb69e	3240	Šmarje pri Jelšah
00050000-5643-3ebe-e719-8768041a4470	8220	Šmarješke Toplice
00050000-5643-3ebe-95db-014fe76cb304	2315	Šmartno na Pohorju
00050000-5643-3ebe-e3d3-90831fcb5e65	3341	Šmartno ob Dreti
00050000-5643-3ebe-ad5d-3f31062a9d9c	3327	Šmartno ob Paki
00050000-5643-3ebe-822e-83c191ce0eeb	1275	Šmartno pri Litiji
00050000-5643-3ebe-0654-476d4e119598	2383	Šmartno pri Slovenj Gradcu
00050000-5643-3ebe-292f-a99aa033114d	3201	Šmartno v Rožni dolini
00050000-5643-3ebe-f31f-3792fa61b192	3325	Šoštanj
00050000-5643-3ebe-bf2a-6c297e6303d8	6222	Štanjel
00050000-5643-3ebe-80a1-4e9b8d94812e	3220	Štore
00050000-5643-3ebe-bbf3-f045b1c586ce	3304	Tabor
00050000-5643-3ebe-25e5-0da2aefa07b3	3221	Teharje
00050000-5643-3ebe-39c5-613975218cf4	9251	Tišina
00050000-5643-3ebe-738a-5fa2fef4bbd5	5220	Tolmin
00050000-5643-3ebe-289e-c29ee4749daa	3326	Topolšica
00050000-5643-3ebe-576c-eed7ad811dc7	2371	Trbonje
00050000-5643-3ebe-6b17-ef5963fcc88a	1420	Trbovlje
00050000-5643-3ebe-e209-4a353aa440c1	8231	Trebelno 
00050000-5643-3ebe-a24d-2603858b56d1	8210	Trebnje
00050000-5643-3ebe-f336-acaa2bc3ad4e	5252	Trnovo pri Gorici
00050000-5643-3ebe-92e1-4ec7de5a0fae	2254	Trnovska vas
00050000-5643-3ebe-37e4-9f0f13d2595a	1222	Trojane
00050000-5643-3ebe-28ad-b81792411c6b	1236	Trzin
00050000-5643-3ebe-d015-78361ab00785	4290	Tržič
00050000-5643-3ebe-d995-336964c6b9b1	8295	Tržišče
00050000-5643-3ebe-0255-7068bd41ba87	1311	Turjak
00050000-5643-3ebe-626c-431a66ec0a6f	9224	Turnišče
00050000-5643-3ebe-fb12-4cb55c623e27	8323	Uršna sela
00050000-5643-3ebe-5027-b66366721dd0	1252	Vače
00050000-5643-3ebe-c8d3-95aa798c8fba	3320	Velenje 
00050000-5643-3ebe-b27a-0933e9ab1a2a	3322	Velenje - poštni predali
00050000-5643-3ebe-fcd0-2c876493db02	8212	Velika Loka
00050000-5643-3ebe-be12-75d22eb490fe	2274	Velika Nedelja
00050000-5643-3ebe-74ef-a62d7d17fff1	9225	Velika Polana
00050000-5643-3ebe-b330-699e2347a67d	1315	Velike Lašče
00050000-5643-3ebe-dbfe-7b14b49ef5d1	8213	Veliki Gaber
00050000-5643-3ebe-d512-c73d596752d1	9241	Veržej
00050000-5643-3ebe-3ce4-bd97e58d2c8d	1312	Videm - Dobrepolje
00050000-5643-3ebe-4351-1ff656758eb5	2284	Videm pri Ptuju
00050000-5643-3ebe-fd06-b5194118ab53	8344	Vinica
00050000-5643-3ebe-f986-ba375ed602d3	5271	Vipava
00050000-5643-3ebe-10e8-0a6466b74bda	4212	Visoko
00050000-5643-3ebe-cff7-dbfd0dcb7de9	1294	Višnja Gora
00050000-5643-3ebe-2d14-234597639218	3205	Vitanje
00050000-5643-3ebe-7197-7a86ae8f1342	2255	Vitomarci
00050000-5643-3ebe-d830-cae5dcb338f3	1217	Vodice
00050000-5643-3ebe-6f6e-1a32bc2e1c13	3212	Vojnik\t
00050000-5643-3ebe-e2a1-92607515c116	5293	Volčja Draga
00050000-5643-3ebe-0e2e-c8ba0a736eac	2232	Voličina
00050000-5643-3ebe-34f3-90c60d357a9f	3305	Vransko
00050000-5643-3ebe-2498-598897640f2d	6217	Vremski Britof
00050000-5643-3ebe-1174-879c829e2564	1360	Vrhnika
00050000-5643-3ebe-99bf-f20ba0e49f7b	2365	Vuhred
00050000-5643-3ebe-54af-29afd360be79	2367	Vuzenica
00050000-5643-3ebe-1b17-2e1eada5ee6d	8292	Zabukovje 
00050000-5643-3ebe-bce1-ee9593ae0d22	1410	Zagorje ob Savi
00050000-5643-3ebe-fb22-10db4b2013ac	1303	Zagradec
00050000-5643-3ebe-9d3c-4b9ba0c3732c	2283	Zavrč
00050000-5643-3ebe-a1b0-ff9f7e92bae2	8272	Zdole 
00050000-5643-3ebe-f98b-d35a65860995	4201	Zgornja Besnica
00050000-5643-3ebe-016e-8ab5d8481775	2242	Zgornja Korena
00050000-5643-3ebe-2ed0-a316c80b870b	2201	Zgornja Kungota
00050000-5643-3ebe-b708-fb383db5b8ef	2316	Zgornja Ložnica
00050000-5643-3ebe-f364-59b531cc002d	2314	Zgornja Polskava
00050000-5643-3ebe-e151-8f54fcfe982f	2213	Zgornja Velka
00050000-5643-3ebe-ec27-36815b99871d	4247	Zgornje Gorje
00050000-5643-3ebe-e02a-caa93cff90a5	4206	Zgornje Jezersko
00050000-5643-3ebe-3541-182d572be19b	2285	Zgornji Leskovec
00050000-5643-3ebe-bbc9-5198892cc04e	1432	Zidani Most
00050000-5643-3ebe-f742-1c1ac19028bb	3214	Zreče
00050000-5643-3ebe-11b8-bf33480fbf3a	4209	Žabnica
00050000-5643-3ebe-918b-29b93c953bb7	3310	Žalec
00050000-5643-3ebe-7f2f-c9afcb997f73	4228	Železniki
00050000-5643-3ebe-fd70-7908b5efb256	2287	Žetale
00050000-5643-3ebe-dc38-2c5afdbafc91	4226	Žiri
00050000-5643-3ebe-5636-1c3692424060	4274	Žirovnica
00050000-5643-3ebe-daf4-633552ccb30c	8360	Žužemberk
\.


--
-- TOC entry 3161 (class 0 OID 26543537)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 26543113)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 26542861)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5643-3ec1-2aea-92df18e6c79d	00080000-5643-3ec1-1444-7cb9f3ed2174	\N	00040000-5643-3ebe-c29d-d84c8c30353e	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5643-3ec1-0461-fc848fb3083d	00080000-5643-3ec1-1444-7cb9f3ed2174	\N	00040000-5643-3ebe-c29d-d84c8c30353e	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5643-3ec1-64af-c39dd6837cb2	00080000-5643-3ec1-439a-8d91a67da555	\N	00040000-5643-3ebe-c29d-d84c8c30353e	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3123 (class 0 OID 26543005)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5643-3ebe-22bd-81497771323e	novo leto	1	1	\N	t
00430000-5643-3ebe-067c-75ed20746b02	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5643-3ebe-79e1-c8a714cdd2d0	dan upora proti okupatorju	27	4	\N	t
00430000-5643-3ebe-69e2-60f75b20149b	praznik dela	1	5	\N	t
00430000-5643-3ebe-e50d-bdb9e1f8823a	praznik dela	2	5	\N	t
00430000-5643-3ebe-a99b-3f7cd8c9344f	dan Primoža Trubarja	8	6	\N	f
00430000-5643-3ebe-ce4f-cd93c21c5b38	dan državnosti	25	6	\N	t
00430000-5643-3ebe-38c2-0d0300a4b958	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5643-3ebe-82dd-b2bc673e491b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5643-3ebe-f218-db9ed14fbb80	dan suverenosti	25	10	\N	f
00430000-5643-3ebe-e330-06e4689eb61e	dan spomina na mrtve	1	11	\N	t
00430000-5643-3ebe-574f-e0102d876910	dan Rudolfa Maistra	23	11	\N	f
00430000-5643-3ebe-3bad-9f592caa9bf6	božič	25	12	\N	t
00430000-5643-3ebe-dd6d-b5fc725a7158	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5643-3ebe-8764-3cdff173455d	Marijino vnebovzetje	15	8	\N	t
00430000-5643-3ebe-2612-5605ae3e4ec7	dan reformacije	31	10	\N	t
00430000-5643-3ebe-49e9-c4c46f09a6ee	velikonočna nedelja	27	3	2016	t
00430000-5643-3ebe-bc6e-b406eeb0039a	velikonočna nedelja	16	4	2017	t
00430000-5643-3ebe-6e37-6a18767fc279	velikonočna nedelja	1	4	2018	t
00430000-5643-3ebe-ad83-d9184a8b09e0	velikonočna nedelja	21	4	2019	t
00430000-5643-3ebe-4c5c-8afc85a73856	velikonočna nedelja	12	4	2020	t
00430000-5643-3ebe-2a20-274b6c9dbb4d	velikonočna nedelja	4	4	2021	t
00430000-5643-3ebe-44c6-918e482b930e	velikonočna nedelja	17	4	2022	t
00430000-5643-3ebe-08bb-0789dbcd8dc5	velikonočna nedelja	9	4	2023	t
00430000-5643-3ebe-ecc7-ed8ad1ff4472	velikonočna nedelja	31	3	2024	t
00430000-5643-3ebe-4667-cc28e753e475	velikonočna nedelja	20	4	2025	t
00430000-5643-3ebe-da36-8c00c3cf8859	velikonočna nedelja	5	4	2026	t
00430000-5643-3ebe-537e-06d5ebec73b1	velikonočna nedelja	28	3	2027	t
00430000-5643-3ebe-f261-6cac1c922a6d	velikonočna nedelja	16	4	2028	t
00430000-5643-3ebe-8765-e662ee3f5bab	velikonočna nedelja	1	4	2029	t
00430000-5643-3ebe-6a21-4be759a1fa9b	velikonočna nedelja	21	4	2030	t
00430000-5643-3ebe-150b-68c3c08fcfbe	velikonočni ponedeljek	28	3	2016	t
00430000-5643-3ebe-0d92-d8ffb4c02718	velikonočni ponedeljek	17	4	2017	t
00430000-5643-3ebe-568e-f766bad7c9e7	velikonočni ponedeljek	2	4	2018	t
00430000-5643-3ebe-ec8d-0aa89feeacb0	velikonočni ponedeljek	22	4	2019	t
00430000-5643-3ebe-6bc3-fc7bebb8ce41	velikonočni ponedeljek	13	4	2020	t
00430000-5643-3ebe-ac86-defe72850c27	velikonočni ponedeljek	5	4	2021	t
00430000-5643-3ebe-c87d-f87528459636	velikonočni ponedeljek	18	4	2022	t
00430000-5643-3ebe-4fd3-e3d5e6302140	velikonočni ponedeljek	10	4	2023	t
00430000-5643-3ebe-a539-edc0ac8a1d73	velikonočni ponedeljek	1	4	2024	t
00430000-5643-3ebe-f028-727f5646886c	velikonočni ponedeljek	21	4	2025	t
00430000-5643-3ebe-6c7a-4265ac0d9196	velikonočni ponedeljek	6	4	2026	t
00430000-5643-3ebe-0bdd-e00e752fec74	velikonočni ponedeljek	29	3	2027	t
00430000-5643-3ebe-4da3-9c8d81a3f983	velikonočni ponedeljek	17	4	2028	t
00430000-5643-3ebe-4358-4733b32173fa	velikonočni ponedeljek	2	4	2029	t
00430000-5643-3ebe-be44-1f8695db551b	velikonočni ponedeljek	22	4	2030	t
00430000-5643-3ebe-594c-23d5ca927d21	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5643-3ebe-1a85-2925fdf26034	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5643-3ebe-19ac-89eb295185cb	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5643-3ebe-9416-4e95658eb189	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5643-3ebe-e7cd-03d41c699277	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5643-3ebe-d2e0-38e057140536	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5643-3ebe-49e8-244ddbd98439	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5643-3ebe-ea4e-f4b4eb4a66b3	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5643-3ebe-0713-5dd00254207e	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5643-3ebe-b7fa-247a3206764e	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5643-3ebe-2a0b-26ef9added60	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5643-3ebe-fd85-f519ddf2868a	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5643-3ebe-5cea-1bd8ddee7344	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5643-3ebe-dc5b-3e2673afa8d9	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5643-3ebe-904f-29fc8a928493	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3119 (class 0 OID 26542965)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 26542977)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 26543125)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3162 (class 0 OID 26543551)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 26543561)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5643-3ec1-012b-286f0f1a6f31	00080000-5643-3ec1-4874-b9d4ee2586fc	0987	AK
00190000-5643-3ec1-0d85-eb5d57eb020f	00080000-5643-3ec1-439a-8d91a67da555	0989	AK
00190000-5643-3ec1-e34e-db20773c765d	00080000-5643-3ec1-3983-9f59b8505fe6	0986	AK
00190000-5643-3ec1-006b-8256b95c99da	00080000-5643-3ec1-dff0-b804b66770f3	0984	AK
00190000-5643-3ec1-5a39-ed7852c0be87	00080000-5643-3ec1-de7c-84aced3d3cee	0983	AK
00190000-5643-3ec1-7e9d-4890a0d5f96d	00080000-5643-3ec1-59c4-2f0b5ce69184	0982	AK
00190000-5643-3ec2-e44f-dec633c00a00	00080000-5643-3ec2-cf1f-2c2e381ea5ad	1001	AK
\.


--
-- TOC entry 3160 (class 0 OID 26543460)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5643-3ec1-8b19-f40f5086b585	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3164 (class 0 OID 26543569)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3140 (class 0 OID 26543154)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5643-3ec0-2428-0b0bce4c8b26	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5643-3ec0-e0ee-2a5703f529bb	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5643-3ec0-0df2-c63e88408947	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5643-3ec0-7812-63b0db93a5f9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5643-3ec0-f7cb-4ca35e4601ad	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5643-3ec0-2595-021b44637579	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5643-3ec0-d8ae-200fee8dc78c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3132 (class 0 OID 26543098)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 26543088)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 26543299)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 26543229)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 26542939)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3096 (class 0 OID 26542701)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5643-3ec2-cf1f-2c2e381ea5ad	00010000-5643-3ebf-a33b-b536119ed423	2015-11-11 14:12:34	INS	a:0:{}
2	App\\Entity\\Option	00000000-5643-3ec2-7959-24acf9b73ca3	00010000-5643-3ebf-a33b-b536119ed423	2015-11-11 14:12:34	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5643-3ec2-e44f-dec633c00a00	00010000-5643-3ebf-a33b-b536119ed423	2015-11-11 14:12:34	INS	a:0:{}
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3141 (class 0 OID 26543167)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 26542739)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5643-3ebf-58eb-d51a3ee606af	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5643-3ebf-13c8-22946ab644db	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5643-3ebf-e63a-e678da05b09e	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5643-3ebf-4fef-df485fa01287	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5643-3ebf-064a-029baa8dc37b	planer	Planer dogodkov v koledarju	t
00020000-5643-3ebf-0d10-2e53fae7d472	kadrovska	Kadrovska služba	t
00020000-5643-3ebf-cfa2-2b4285193a7a	arhivar	Ažuriranje arhivalij	t
00020000-5643-3ebf-7370-8318b9adb164	igralec	Igralec	t
00020000-5643-3ebf-9c4e-9dab04d9a5c4	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5643-3ec0-ebed-495b52191fcd	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5643-3ec0-90b4-f0d2a75891b2	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-85f4-503fd9731b48	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-72aa-cf33cb4560df	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-25be-8c115d4eac27	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-db2a-c6321d1c923c	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-56d2-4277cadc4a4d	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-4305-e63bb97dae30	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5643-3ec0-8d9a-ecfbe406f6cb	Mapa-append	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3098 (class 0 OID 26542723)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5643-3ebf-04bb-ec2ac20798d1	00020000-5643-3ebf-e63a-e678da05b09e
00010000-5643-3ebf-a33b-b536119ed423	00020000-5643-3ebf-e63a-e678da05b09e
00010000-5643-3ec1-3c84-9c271a2eec4c	00020000-5643-3ec0-ebed-495b52191fcd
00010000-5643-3ec1-fa3d-ce96352f222e	00020000-5643-3ec0-90b4-f0d2a75891b2
00010000-5643-3ec1-fa3d-ce96352f222e	00020000-5643-3ec0-db2a-c6321d1c923c
00010000-5643-3ec1-2908-dbc067ae6ae4	00020000-5643-3ec0-85f4-503fd9731b48
00010000-5643-3ec1-2908-dbc067ae6ae4	00020000-5643-3ec0-56d2-4277cadc4a4d
00010000-5643-3ec1-e39e-0a8795bc9cf5	00020000-5643-3ec0-85f4-503fd9731b48
00010000-5643-3ec1-e39e-0a8795bc9cf5	00020000-5643-3ec0-72aa-cf33cb4560df
00010000-5643-3ec1-e39e-0a8795bc9cf5	00020000-5643-3ec0-56d2-4277cadc4a4d
00010000-5643-3ec1-e39e-0a8795bc9cf5	00020000-5643-3ec0-4305-e63bb97dae30
00010000-5643-3ec1-e39e-0a8795bc9cf5	00020000-5643-3ec0-8d9a-ecfbe406f6cb
00010000-5643-3ec1-483e-0bdfd0e27640	00020000-5643-3ec0-90b4-f0d2a75891b2
00010000-5643-3ec1-483e-0bdfd0e27640	00020000-5643-3ec0-25be-8c115d4eac27
\.


--
-- TOC entry 3143 (class 0 OID 26543181)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 26543119)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 26543065)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5643-3ec1-ec8a-50ee2813d022	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5643-3ec1-dcb7-36484f3c6b30	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5643-3ec1-4bea-7c2452b1940e	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3094 (class 0 OID 26542688)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5643-3ebe-ea2e-69205c601ba3	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5643-3ebe-29c9-25b5baee6cf2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5643-3ebe-7400-d95308016da1	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5643-3ebe-def0-67a1e260ee99	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5643-3ebe-51a2-ee0c42596e2f	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3093 (class 0 OID 26542680)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5643-3ebe-be58-449719492eb3	00230000-5643-3ebe-def0-67a1e260ee99	popa
00240000-5643-3ebe-f946-166593f08e28	00230000-5643-3ebe-def0-67a1e260ee99	oseba
00240000-5643-3ebe-a286-622e3f2826c6	00230000-5643-3ebe-def0-67a1e260ee99	tippopa
00240000-5643-3ebe-3d6c-92b343baf107	00230000-5643-3ebe-def0-67a1e260ee99	organizacijskaenota
00240000-5643-3ebe-7bb3-fdb776897edd	00230000-5643-3ebe-def0-67a1e260ee99	sezona
00240000-5643-3ebe-06c9-cc538500f376	00230000-5643-3ebe-def0-67a1e260ee99	tipvaje
00240000-5643-3ebe-dada-c16dc0f58fa1	00230000-5643-3ebe-29c9-25b5baee6cf2	prostor
00240000-5643-3ebe-f926-78686a315b91	00230000-5643-3ebe-def0-67a1e260ee99	besedilo
00240000-5643-3ebe-6fa5-4f9649b05045	00230000-5643-3ebe-def0-67a1e260ee99	uprizoritev
00240000-5643-3ebe-83ac-462fb54c452c	00230000-5643-3ebe-def0-67a1e260ee99	funkcija
00240000-5643-3ebe-4ff4-3146880d5e30	00230000-5643-3ebe-def0-67a1e260ee99	tipfunkcije
00240000-5643-3ebe-bccb-20bb67e4f868	00230000-5643-3ebe-def0-67a1e260ee99	alternacija
00240000-5643-3ebe-d393-ea8a222a695f	00230000-5643-3ebe-ea2e-69205c601ba3	pogodba
00240000-5643-3ebe-44b3-122fd8297180	00230000-5643-3ebe-def0-67a1e260ee99	zaposlitev
00240000-5643-3ebe-0aa1-e87d4f14dc00	00230000-5643-3ebe-def0-67a1e260ee99	zvrstuprizoritve
00240000-5643-3ebe-1b2a-5ed21f9e2645	00230000-5643-3ebe-ea2e-69205c601ba3	programdela
00240000-5643-3ebe-eb85-db833c39e406	00230000-5643-3ebe-def0-67a1e260ee99	zapis
\.


--
-- TOC entry 3092 (class 0 OID 26542675)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f7c71c40-5fc0-4530-acd6-20558d23ca21	00240000-5643-3ebe-be58-449719492eb3	0	1001
\.


--
-- TOC entry 3149 (class 0 OID 26543246)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5643-3ec1-bdad-a885f053444e	000e0000-5643-3ec1-71fb-8f6c5af2e976	00080000-5643-3ec1-1444-7cb9f3ed2174	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5643-3ebe-c5e8-035de30802ba
00270000-5643-3ec1-e1ca-008f9714c065	000e0000-5643-3ec1-71fb-8f6c5af2e976	00080000-5643-3ec1-1444-7cb9f3ed2174	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5643-3ebe-c5e8-035de30802ba
\.


--
-- TOC entry 3108 (class 0 OID 26542823)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 26543075)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5643-3ec1-d137-2720e0512d5c	00180000-5643-3ec1-a985-aac91a943de4	000c0000-5643-3ec1-1199-adef118813b4	00090000-5643-3ec1-4c06-baac7a5db710	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-3ec1-129a-8e3b4eb829ca	00180000-5643-3ec1-a985-aac91a943de4	000c0000-5643-3ec1-d804-528cc70ba2b1	00090000-5643-3ec1-2fe3-83ba9ce2e7fb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-3ec1-081e-057c05685d4e	00180000-5643-3ec1-a985-aac91a943de4	000c0000-5643-3ec1-5d64-4aeb2c21a40a	00090000-5643-3ec1-7c86-2ffe082e6515	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-3ec1-da34-da2c809d71d1	00180000-5643-3ec1-a985-aac91a943de4	000c0000-5643-3ec1-2c52-9187a0b70289	00090000-5643-3ec1-b925-d5adfb93dcd4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-3ec1-fc46-c3e3be36d7f8	00180000-5643-3ec1-a985-aac91a943de4	000c0000-5643-3ec1-d44a-950db41acc5e	00090000-5643-3ec1-e08c-854837d870e2	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5643-3ec1-f368-8ac4fda0d1ee	00180000-5643-3ec1-37a2-11128cca4b82	\N	00090000-5643-3ec1-e08c-854837d870e2	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5643-3ec1-892d-503f1028996c	00180000-5643-3ec1-37a2-11128cca4b82	\N	00090000-5643-3ec1-2fe3-83ba9ce2e7fb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3152 (class 0 OID 26543287)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5643-3ebe-bf77-0c77c59e6b1b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5643-3ebe-00ff-0a27a236213f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5643-3ebe-4a96-39cee1c2dccc	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5643-3ebe-ceb3-1f6fce936925	04	Režija	Režija	Režija	umetnik	30
000f0000-5643-3ebe-3bf4-ab0b2209c43e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5643-3ebe-a80f-5c58a30b3136	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5643-3ebe-f37c-c4d8c62d5c80	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5643-3ebe-eaff-c3f7a5e82e63	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5643-3ebe-d22a-15fdf26ef40f	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5643-3ebe-a97b-29ddefb3b51d	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5643-3ebe-3319-a0852e2eef5e	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5643-3ebe-6bef-4cc937186da8	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5643-3ebe-c023-ba2724e78e79	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5643-3ebe-6761-fed73f800849	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5643-3ebe-b5da-3f034e9ae869	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5643-3ebe-7abb-32880b186788	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5643-3ebe-5ffc-101785527340	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5643-3ebe-c943-c864e77f8e92	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3105 (class 0 OID 26542774)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5643-3ec0-4247-ff013f2d9f7c	0001	šola	osnovna ali srednja šola
00400000-5643-3ec0-93dc-1e96c7a282b9	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5643-3ec0-52e9-df7516b142ec	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3165 (class 0 OID 26543580)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5643-3ebe-4edd-377cefeca99a	01	Velika predstava	f	1.00	1.00
002b0000-5643-3ebe-2dfa-4bb75c3684aa	02	Mala predstava	f	0.50	0.50
002b0000-5643-3ebe-dd62-922cf10e7a16	03	Mala koprodukcija	t	0.40	1.00
002b0000-5643-3ebe-579a-883c5cb60516	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5643-3ebe-6d41-b126cdb97e1a	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3128 (class 0 OID 26543055)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5643-3ebe-0e51-e3d75e8ca45f	0001	prva vaja	prva vaja
00420000-5643-3ebe-7472-4006c5063a0a	0002	tehnična vaja	tehnična vaja
00420000-5643-3ebe-52f5-46b1a1689cbe	0003	lučna vaja	lučna vaja
00420000-5643-3ebe-5537-77a1d179bc0b	0004	kostumska vaja	kostumska vaja
00420000-5643-3ebe-768d-536f3fe36814	0005	foto vaja	foto vaja
00420000-5643-3ebe-e000-e662a3837a96	0006	1. glavna vaja	1. glavna vaja
00420000-5643-3ebe-0a60-d35200ae411e	0007	2. glavna vaja	2. glavna vaja
00420000-5643-3ebe-d5c0-1eb506dbdd8c	0008	1. generalka	1. generalka
00420000-5643-3ebe-b337-e14daacc3e77	0009	2. generalka	2. generalka
00420000-5643-3ebe-46ba-73e0e88885a9	0010	odprta generalka	odprta generalka
00420000-5643-3ebe-4e7f-9de6bfb1f9b4	0011	obnovitvena vaja	obnovitvena vaja
00420000-5643-3ebe-b8c8-23d073478eae	0012	pevska vaja	pevska vaja
00420000-5643-3ebe-bbae-2656c9d805db	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5643-3ebe-3fea-0d80f7e875ae	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3114 (class 0 OID 26542896)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 26542710)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5643-3ebf-a33b-b536119ed423	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROyxdLMgPLTG84fl5aK3.1wssaGYsvlz6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-d624-ca28110fb7c5	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-3af5-821fc8558bdc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-3c37-29acdf3f5981	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-f047-a69a1d836279	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-b9fc-6d1998797f36	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-5e02-441ea7a4cb2d	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-0945-378f4d67caba	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-af5a-2ce5f7479212	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-7908-627204ced5a5	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-3c84-9c271a2eec4c	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-ea24-874d9b6eea05	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-fa3d-ce96352f222e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-2908-dbc067ae6ae4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-e39e-0a8795bc9cf5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5643-3ec1-483e-0bdfd0e27640	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5643-3ebf-04bb-ec2ac20798d1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3156 (class 0 OID 26543337)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5643-3ec1-4cd1-aded82ae3674	00160000-5643-3ec0-caf5-e164ce534d08	\N	00140000-5643-3ebe-9d45-ab6f72c36a01	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5643-3ec0-f7cb-4ca35e4601ad
000e0000-5643-3ec1-71fb-8f6c5af2e976	00160000-5643-3ec0-cd70-5881b2e13c8c	\N	00140000-5643-3ebe-a290-95798d654190	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5643-3ec0-2595-021b44637579
000e0000-5643-3ec1-40a6-ee9262b44163	\N	\N	00140000-5643-3ebe-a290-95798d654190	00190000-5643-3ec1-012b-286f0f1a6f31	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5643-3ec0-f7cb-4ca35e4601ad
000e0000-5643-3ec1-ac99-58cc68dd7f23	\N	\N	00140000-5643-3ebe-a290-95798d654190	00190000-5643-3ec1-012b-286f0f1a6f31	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5643-3ec0-f7cb-4ca35e4601ad
000e0000-5643-3ec1-1f3a-4726df488551	\N	\N	00140000-5643-3ebe-a290-95798d654190	00190000-5643-3ec1-012b-286f0f1a6f31	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5643-3ec0-2428-0b0bce4c8b26
000e0000-5643-3ec1-3a87-0a1b597d0201	\N	\N	00140000-5643-3ebe-a290-95798d654190	00190000-5643-3ec1-012b-286f0f1a6f31	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5643-3ec0-2428-0b0bce4c8b26
\.


--
-- TOC entry 3122 (class 0 OID 26542995)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5643-3ec1-4122-81742fc061a0	\N	000e0000-5643-3ec1-71fb-8f6c5af2e976	1	
00200000-5643-3ec1-68ec-04466d50bd4f	\N	000e0000-5643-3ec1-71fb-8f6c5af2e976	2	
00200000-5643-3ec1-6d0a-ced53e014bdf	\N	000e0000-5643-3ec1-71fb-8f6c5af2e976	3	
00200000-5643-3ec1-1b8b-18117f849aac	\N	000e0000-5643-3ec1-71fb-8f6c5af2e976	4	
00200000-5643-3ec1-ee8a-32fb53cb4764	\N	000e0000-5643-3ec1-71fb-8f6c5af2e976	5	
\.


--
-- TOC entry 3139 (class 0 OID 26543146)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 26543260)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5643-3ebe-ad82-bd7986a96afd	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5643-3ebe-b884-534ca9da6105	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5643-3ebe-82f5-238fec366730	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5643-3ebe-0a30-cb52a5d3506d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5643-3ebe-722e-51106eb629a7	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5643-3ebe-d951-58bfad5abf16	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5643-3ebe-da7b-420ac520e41a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5643-3ebe-b790-0ffaf6f7ac60	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5643-3ebe-c5e8-035de30802ba	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5643-3ebe-1529-6d7bcef3b257	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5643-3ebe-0929-99e6e2eb0770	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5643-3ebe-7d0c-7eb441518792	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5643-3ebe-3a0d-60bf8c5b5f5e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5643-3ebe-fbe8-165d07178ffb	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5643-3ebe-2846-164ac927a9d8	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5643-3ebe-0052-958e14ffec58	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5643-3ebe-ce1e-f1c7defedf7f	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5643-3ebe-792e-e0fbb5e789e3	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5643-3ebe-cac3-c6d0a87c5c85	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5643-3ebe-8503-71d6edf6a34e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5643-3ebe-cde7-4cd06a919a08	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5643-3ebe-88cd-eff22269e4d1	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5643-3ebe-47ea-44ac0b5ced3d	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5643-3ebe-6368-c00784bcca9f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5643-3ebe-13a4-a1c687a025f1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5643-3ebe-4507-496a83305c45	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5643-3ebe-8a32-49b12ccecbff	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5643-3ebe-5ed2-782673f3c3d1	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3168 (class 0 OID 26543630)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 26543599)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 26543642)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3146 (class 0 OID 26543218)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5643-3ec1-43b4-32ed1c04984b	00090000-5643-3ec1-2fe3-83ba9ce2e7fb	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-3ec1-639b-a0065fbe8186	00090000-5643-3ec1-7c86-2ffe082e6515	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-3ec1-1c38-a59888ea6f36	00090000-5643-3ec1-1134-7287ee9090c2	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-3ec1-6ad5-fec5175ce5a2	00090000-5643-3ec1-0ef0-ef2cb4a6fb63	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-3ec1-e896-264dcbce3c5b	00090000-5643-3ec1-dd8e-4a7624ca2d4f	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5643-3ec1-ad19-0cca28963d99	00090000-5643-3ec1-99d9-5510d7cf31d9	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3125 (class 0 OID 26543039)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 26543327)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5643-3ebe-9d45-ab6f72c36a01	01	Drama	drama (SURS 01)
00140000-5643-3ebe-1a30-8586c7ebca33	02	Opera	opera (SURS 02)
00140000-5643-3ebe-e935-f34161a3c3d2	03	Balet	balet (SURS 03)
00140000-5643-3ebe-3b36-b97adc13bef1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5643-3ebe-ea77-95e577541a71	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5643-3ebe-a290-95798d654190	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5643-3ebe-2257-dbe2a792dc55	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3145 (class 0 OID 26543208)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2587 (class 2606 OID 26542773)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 26543386)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 26543376)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 26542764)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2765 (class 2606 OID 26543243)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 26543285)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 26543682)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 26543027)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 26543049)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 26543054)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 26543597)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 26542922)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 26543454)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 26543204)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 26542993)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 26542960)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 26542936)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 26543111)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2857 (class 2606 OID 26543659)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 26543666)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2868 (class 2606 OID 26543690)
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
-- TOC entry 2725 (class 2606 OID 26543138)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 26542894)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 26542792)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 26542856)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 26542819)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 26542753)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2576 (class 2606 OID 26542738)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 26543144)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 26543180)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 26543322)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 26542847)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 26542882)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 26543549)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 26543117)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 26542872)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 26543012)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2658 (class 2606 OID 26542981)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2654 (class 2606 OID 26542973)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 26543129)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 26543558)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 26543566)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 26543536)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 26543578)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 26543162)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2711 (class 2606 OID 26543102)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 26543093)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 26543309)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 26543236)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 26542948)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 26542709)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 26543171)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2574 (class 2606 OID 26542727)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2578 (class 2606 OID 26542747)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 26543189)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 26543124)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 26543073)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 26542697)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 26542685)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 26542679)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 26543256)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 26542828)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 26543084)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 26543296)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 26542781)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 26543590)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 26543062)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 26542907)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2570 (class 2606 OID 26542722)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 26543355)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 26543002)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 26543152)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 26543268)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 26543640)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 26543624)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 26543648)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 26543226)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 26543043)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 26543335)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 26543216)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 1259 OID 26543037)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2671 (class 1259 OID 26543038)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2672 (class 1259 OID 26543036)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2673 (class 1259 OID 26543035)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2674 (class 1259 OID 26543034)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2768 (class 1259 OID 26543257)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2769 (class 1259 OID 26543258)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2770 (class 1259 OID 26543259)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2854 (class 1259 OID 26543661)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2855 (class 1259 OID 26543660)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2605 (class 1259 OID 26542849)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2606 (class 1259 OID 26542850)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2726 (class 1259 OID 26543145)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2841 (class 1259 OID 26543628)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2842 (class 1259 OID 26543627)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2843 (class 1259 OID 26543629)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2844 (class 1259 OID 26543626)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2845 (class 1259 OID 26543625)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2720 (class 1259 OID 26543131)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2721 (class 1259 OID 26543130)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2662 (class 1259 OID 26543003)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2663 (class 1259 OID 26543004)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2750 (class 1259 OID 26543205)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 26543207)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2752 (class 1259 OID 26543206)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2637 (class 1259 OID 26542938)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2638 (class 1259 OID 26542937)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2832 (class 1259 OID 26543579)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2784 (class 1259 OID 26543324)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2785 (class 1259 OID 26543325)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 26543326)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2851 (class 1259 OID 26543649)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2793 (class 1259 OID 26543360)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2794 (class 1259 OID 26543357)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2795 (class 1259 OID 26543361)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2796 (class 1259 OID 26543359)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2797 (class 1259 OID 26543358)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2627 (class 1259 OID 26542909)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2628 (class 1259 OID 26542908)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2596 (class 1259 OID 26542822)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2738 (class 1259 OID 26543172)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2580 (class 1259 OID 26542754)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2581 (class 1259 OID 26542755)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2743 (class 1259 OID 26543192)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2744 (class 1259 OID 26543191)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2745 (class 1259 OID 26543190)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2610 (class 1259 OID 26542859)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2611 (class 1259 OID 26542858)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2612 (class 1259 OID 26542860)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2650 (class 1259 OID 26542976)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2651 (class 1259 OID 26542974)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2652 (class 1259 OID 26542975)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2560 (class 1259 OID 26542687)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2700 (class 1259 OID 26543097)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2701 (class 1259 OID 26543095)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2702 (class 1259 OID 26543094)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2703 (class 1259 OID 26543096)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2571 (class 1259 OID 26542728)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2572 (class 1259 OID 26542729)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2729 (class 1259 OID 26543153)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2864 (class 1259 OID 26543683)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2766 (class 1259 OID 26543245)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2767 (class 1259 OID 26543244)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2865 (class 1259 OID 26543691)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2866 (class 1259 OID 26543692)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2715 (class 1259 OID 26543118)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2760 (class 1259 OID 26543237)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2761 (class 1259 OID 26543238)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 26543459)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2815 (class 1259 OID 26543458)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2816 (class 1259 OID 26543455)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 26543456)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2818 (class 1259 OID 26543457)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2616 (class 1259 OID 26542874)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2617 (class 1259 OID 26542873)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2618 (class 1259 OID 26542875)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2732 (class 1259 OID 26543166)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2733 (class 1259 OID 26543165)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2824 (class 1259 OID 26543559)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2825 (class 1259 OID 26543560)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2807 (class 1259 OID 26543390)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 26543391)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2809 (class 1259 OID 26543388)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2810 (class 1259 OID 26543389)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2756 (class 1259 OID 26543227)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2757 (class 1259 OID 26543228)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2706 (class 1259 OID 26543106)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2707 (class 1259 OID 26543105)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2708 (class 1259 OID 26543103)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2709 (class 1259 OID 26543104)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2803 (class 1259 OID 26543378)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2804 (class 1259 OID 26543377)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2641 (class 1259 OID 26542949)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2644 (class 1259 OID 26542963)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2645 (class 1259 OID 26542962)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2646 (class 1259 OID 26542961)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2647 (class 1259 OID 26542964)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2661 (class 1259 OID 26542994)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2655 (class 1259 OID 26542982)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2656 (class 1259 OID 26542983)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2821 (class 1259 OID 26543550)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2840 (class 1259 OID 26543598)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2858 (class 1259 OID 26543667)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2859 (class 1259 OID 26543668)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2592 (class 1259 OID 26542794)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2593 (class 1259 OID 26542793)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2601 (class 1259 OID 26542829)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2602 (class 1259 OID 26542830)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2681 (class 1259 OID 26543044)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2695 (class 1259 OID 26543087)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 26543086)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2697 (class 1259 OID 26543085)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2675 (class 1259 OID 26543029)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2676 (class 1259 OID 26543030)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2677 (class 1259 OID 26543033)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2678 (class 1259 OID 26543028)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2679 (class 1259 OID 26543032)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2680 (class 1259 OID 26543031)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2609 (class 1259 OID 26542848)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2590 (class 1259 OID 26542782)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 26542783)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 26542923)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 26542925)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2635 (class 1259 OID 26542924)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2636 (class 1259 OID 26542926)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2714 (class 1259 OID 26543112)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 26543323)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2798 (class 1259 OID 26543356)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2780 (class 1259 OID 26543297)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 26543298)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2599 (class 1259 OID 26542820)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 26542821)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2753 (class 1259 OID 26543217)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 26542698)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 26542895)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2615 (class 1259 OID 26542857)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 26542686)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2837 (class 1259 OID 26543591)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2736 (class 1259 OID 26543164)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2737 (class 1259 OID 26543163)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2690 (class 1259 OID 26543063)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 26543064)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2811 (class 1259 OID 26543387)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 26542883)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2790 (class 1259 OID 26543336)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2848 (class 1259 OID 26543641)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2830 (class 1259 OID 26543567)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 26543568)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2777 (class 1259 OID 26543286)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2694 (class 1259 OID 26543074)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2579 (class 1259 OID 26542748)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2908 (class 2606 OID 26543863)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 26543868)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2902 (class 2606 OID 26543893)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2904 (class 2606 OID 26543883)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2909 (class 2606 OID 26543858)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2905 (class 2606 OID 26543878)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2903 (class 2606 OID 26543888)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 26543873)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2945 (class 2606 OID 26544063)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2944 (class 2606 OID 26544068)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2943 (class 2606 OID 26544073)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 26544238)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 26544233)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 26543748)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2880 (class 2606 OID 26543753)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2926 (class 2606 OID 26543978)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2972 (class 2606 OID 26544218)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 26544213)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2971 (class 2606 OID 26544223)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 26544208)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2975 (class 2606 OID 26544203)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2924 (class 2606 OID 26543973)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 26543968)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 26543848)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2900 (class 2606 OID 26543853)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2936 (class 2606 OID 26544018)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 26544028)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2935 (class 2606 OID 26544023)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2890 (class 2606 OID 26543803)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 26543798)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2922 (class 2606 OID 26543958)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 26544193)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2948 (class 2606 OID 26544078)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2947 (class 2606 OID 26544083)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2946 (class 2606 OID 26544088)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2976 (class 2606 OID 26544228)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2950 (class 2606 OID 26544108)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2953 (class 2606 OID 26544093)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2949 (class 2606 OID 26544113)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2951 (class 2606 OID 26544103)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2952 (class 2606 OID 26544098)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2888 (class 2606 OID 26543793)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 26543788)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2876 (class 2606 OID 26543733)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 26543728)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2930 (class 2606 OID 26543998)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 26543708)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2872 (class 2606 OID 26543713)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2931 (class 2606 OID 26544013)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2932 (class 2606 OID 26544008)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2933 (class 2606 OID 26544003)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2883 (class 2606 OID 26543763)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2884 (class 2606 OID 26543758)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2882 (class 2606 OID 26543768)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2894 (class 2606 OID 26543828)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2896 (class 2606 OID 26543818)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2895 (class 2606 OID 26543823)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2869 (class 2606 OID 26543693)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2914 (class 2606 OID 26543933)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 26543923)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 26543918)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2915 (class 2606 OID 26543928)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 26543698)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2870 (class 2606 OID 26543703)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2927 (class 2606 OID 26543983)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2981 (class 2606 OID 26544253)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2941 (class 2606 OID 26544058)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 26544053)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 26544258)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2982 (class 2606 OID 26544263)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2923 (class 2606 OID 26543963)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 26544043)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2939 (class 2606 OID 26544048)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 26544168)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2961 (class 2606 OID 26544163)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2964 (class 2606 OID 26544148)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2963 (class 2606 OID 26544153)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2962 (class 2606 OID 26544158)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2886 (class 2606 OID 26543778)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2887 (class 2606 OID 26543773)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2885 (class 2606 OID 26543783)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2928 (class 2606 OID 26543993)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 26543988)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 26544178)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2966 (class 2606 OID 26544183)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2957 (class 2606 OID 26544138)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 26544143)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 26544128)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 26544133)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 26544033)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2937 (class 2606 OID 26544038)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2918 (class 2606 OID 26543953)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2919 (class 2606 OID 26543948)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 26543938)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 26543943)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2954 (class 2606 OID 26544123)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 26544118)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2892 (class 2606 OID 26543808)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2893 (class 2606 OID 26543813)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2899 (class 2606 OID 26543843)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 26543833)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2897 (class 2606 OID 26543838)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2965 (class 2606 OID 26544173)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2968 (class 2606 OID 26544188)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 26544198)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 26544243)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 26544248)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2874 (class 2606 OID 26543723)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 26543718)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 26543738)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2878 (class 2606 OID 26543743)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2910 (class 2606 OID 26543898)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2911 (class 2606 OID 26543913)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 26543908)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2913 (class 2606 OID 26543903)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-11 14:12:36 CET

--
-- PostgreSQL database dump complete
--

