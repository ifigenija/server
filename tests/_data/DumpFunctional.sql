--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-06 14:47:47 CET

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
-- TOC entry 183 (class 1259 OID 25461467)
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
-- TOC entry 237 (class 1259 OID 25462081)
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
-- TOC entry 236 (class 1259 OID 25462064)
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
-- TOC entry 182 (class 1259 OID 25461460)
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
-- TOC entry 181 (class 1259 OID 25461458)
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
-- TOC entry 227 (class 1259 OID 25461941)
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
-- TOC entry 230 (class 1259 OID 25461971)
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
-- TOC entry 251 (class 1259 OID 25462368)
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
-- TOC entry 203 (class 1259 OID 25461715)
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
-- TOC entry 205 (class 1259 OID 25461747)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25461752)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25462294)
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
-- TOC entry 194 (class 1259 OID 25461612)
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
-- TOC entry 238 (class 1259 OID 25462094)
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
-- TOC entry 223 (class 1259 OID 25461895)
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
-- TOC entry 200 (class 1259 OID 25461686)
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
-- TOC entry 197 (class 1259 OID 25461652)
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
-- TOC entry 195 (class 1259 OID 25461629)
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
-- TOC entry 212 (class 1259 OID 25461809)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25462349)
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
-- TOC entry 250 (class 1259 OID 25462361)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25462383)
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
-- TOC entry 216 (class 1259 OID 25461834)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25461586)
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
-- TOC entry 185 (class 1259 OID 25461486)
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
-- TOC entry 189 (class 1259 OID 25461553)
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
-- TOC entry 186 (class 1259 OID 25461497)
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
-- TOC entry 178 (class 1259 OID 25461432)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25461451)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25461841)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25461875)
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
-- TOC entry 233 (class 1259 OID 25462012)
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
-- TOC entry 188 (class 1259 OID 25461533)
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
-- TOC entry 191 (class 1259 OID 25461578)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25462239)
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
-- TOC entry 213 (class 1259 OID 25461815)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25461563)
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
-- TOC entry 202 (class 1259 OID 25461707)
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
-- TOC entry 198 (class 1259 OID 25461667)
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
-- TOC entry 199 (class 1259 OID 25461679)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25461827)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25462253)
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
-- TOC entry 242 (class 1259 OID 25462263)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25462162)
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
-- TOC entry 243 (class 1259 OID 25462271)
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
-- TOC entry 219 (class 1259 OID 25461856)
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
-- TOC entry 211 (class 1259 OID 25461800)
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
-- TOC entry 210 (class 1259 OID 25461790)
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
-- TOC entry 232 (class 1259 OID 25462001)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25461931)
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
-- TOC entry 196 (class 1259 OID 25461641)
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
-- TOC entry 175 (class 1259 OID 25461403)
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
-- TOC entry 174 (class 1259 OID 25461401)
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
-- TOC entry 220 (class 1259 OID 25461869)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25461441)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25461425)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25461883)
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
-- TOC entry 214 (class 1259 OID 25461821)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25461767)
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
-- TOC entry 173 (class 1259 OID 25461390)
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
-- TOC entry 172 (class 1259 OID 25461382)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25461377)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25461948)
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
-- TOC entry 187 (class 1259 OID 25461525)
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
-- TOC entry 209 (class 1259 OID 25461777)
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
-- TOC entry 231 (class 1259 OID 25461989)
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
-- TOC entry 184 (class 1259 OID 25461476)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25462282)
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
-- TOC entry 207 (class 1259 OID 25461757)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25461598)
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
-- TOC entry 176 (class 1259 OID 25461412)
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
-- TOC entry 235 (class 1259 OID 25462039)
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
-- TOC entry 201 (class 1259 OID 25461697)
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
-- TOC entry 218 (class 1259 OID 25461848)
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
-- TOC entry 229 (class 1259 OID 25461962)
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
-- TOC entry 247 (class 1259 OID 25462329)
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
-- TOC entry 246 (class 1259 OID 25462301)
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
-- TOC entry 248 (class 1259 OID 25462341)
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
-- TOC entry 225 (class 1259 OID 25461920)
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
-- TOC entry 204 (class 1259 OID 25461741)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25462029)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25461910)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25461463)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25461406)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25461467)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-563c-af80-14fd-f18c2e0b0740	10	30	Otroci	Abonma za otroke	200
000a0000-563c-af80-fcc5-bab6a6cfc0ac	20	60	Mladina	Abonma za mladino	400
000a0000-563c-af80-853c-26491b8b914b	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25462081)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-563c-af81-cd91-5deb6a913d4d	000d0000-563c-af80-f23d-75c61ec81522	\N	00090000-563c-af80-2176-7c59ea965277	000b0000-563c-af80-2cc1-92fdb6d0fa0a	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-563c-af81-b744-287592fca2b3	000d0000-563c-af80-4331-8ebf32d3e652	00100000-563c-af80-cea1-1782741a2268	00090000-563c-af80-fa26-031f5d3876dd	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-563c-af81-d3cd-003b452df097	000d0000-563c-af80-a576-64e7d99c94cb	00100000-563c-af80-65f4-18e28420a6b5	00090000-563c-af80-3ea7-38d2f89738c4	\N	0003	t	\N	2015-11-06	\N	2	t	\N	f	f
000c0000-563c-af81-1aa5-ce94f0b73499	000d0000-563c-af80-02fc-8c6983eb5432	\N	00090000-563c-af80-464b-c9ac53b690b1	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-563c-af81-b72e-befefdd80535	000d0000-563c-af80-d915-3470f261f8b1	\N	00090000-563c-af80-7e27-942c0779bcbb	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-563c-af81-269a-ecefe6643180	000d0000-563c-af80-4e1e-583df7a7e5a2	\N	00090000-563c-af80-d2b7-cfa4334ea400	000b0000-563c-af80-43be-159b2f7198eb	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-563c-af81-c046-e1d1f7d1427b	000d0000-563c-af80-ced6-9dfad4d5e40d	00100000-563c-af80-bb18-f99799ba0594	00090000-563c-af80-c682-6ee814ecf5c3	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-563c-af81-a2b5-08a6c27189e4	000d0000-563c-af80-ca57-a488b76b42af	\N	00090000-563c-af80-08b1-2166b10bd2bc	000b0000-563c-af80-7ff3-ae4786db1d13	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-563c-af81-0905-99fbc377012f	000d0000-563c-af80-ced6-9dfad4d5e40d	00100000-563c-af80-f1cd-853f4d6915a5	00090000-563c-af80-de89-2622df3134af	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-563c-af81-b1a9-9d072a9f1d59	000d0000-563c-af80-ced6-9dfad4d5e40d	00100000-563c-af80-9f78-6872310fabd0	00090000-563c-af80-b4ff-4ded7f89d5ca	\N	0010	t	\N	2015-11-06	\N	16	f	\N	f	t
000c0000-563c-af81-2f4d-4dbdf22cc144	000d0000-563c-af80-ced6-9dfad4d5e40d	00100000-563c-af80-8d06-7c67075bffd8	00090000-563c-af80-be29-80971805791b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-563c-af81-5350-69cd537a97b2	000d0000-563c-af80-164e-e7d543e53447	00100000-563c-af80-cea1-1782741a2268	00090000-563c-af80-fa26-031f5d3876dd	000b0000-563c-af80-5fed-81f9f028526f	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25462064)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25461460)
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
-- TOC entry 3145 (class 0 OID 25461941)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-563c-af80-d314-7da6f8f10173	00160000-563c-af80-c8f7-b4c7ba4c8322	00090000-563c-af80-3a4d-60b46a0e297d	aizv	10	t
003d0000-563c-af80-74ab-3f9b0f394a7e	00160000-563c-af80-c8f7-b4c7ba4c8322	00090000-563c-af80-3bc5-d2bb458ec117	apri	14	t
003d0000-563c-af80-447e-133e05b1f1df	00160000-563c-af80-afbb-3d8f55039649	00090000-563c-af80-451a-c9f7d5b2e54b	aizv	11	t
003d0000-563c-af80-fc16-4e7c634a3bd6	00160000-563c-af80-91a7-6f4b67546bdd	00090000-563c-af80-3b10-ef23ff6c1dcb	aizv	12	t
003d0000-563c-af80-827c-c68d1a51f0b1	00160000-563c-af80-c8f7-b4c7ba4c8322	00090000-563c-af80-0fb9-a800f0be9ebd	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25461971)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-563c-af80-c8f7-b4c7ba4c8322	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-563c-af80-afbb-3d8f55039649	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-563c-af80-91a7-6f4b67546bdd	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25462368)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25461715)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-563c-af81-6113-b7065267c7da	\N	\N	00200000-563c-af81-3b8d-04326d268ba2	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-563c-af81-c80a-5b3eb5eebfce	\N	\N	00200000-563c-af81-0362-5744bbf37e31	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-563c-af81-1409-6aad2651811f	\N	\N	00200000-563c-af81-f58c-dda88bc0317a	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-563c-af81-4561-31e50a74fc5b	\N	\N	00200000-563c-af81-f9e4-aeb8c6a4854e	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-563c-af81-989a-a6e39dca0fc2	\N	\N	00200000-563c-af81-5a12-4543c7907a14	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25461747)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25461752)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25462294)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25461612)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-563c-af7e-48a4-d49b215f0481	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-563c-af7e-ca7c-e66961e304d6	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-563c-af7e-c649-16f9bf739fdc	AL	ALB	008	Albania 	Albanija	\N
00040000-563c-af7e-be47-073c2c3d2c9e	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-563c-af7e-937d-9300a957e55e	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-563c-af7e-09ea-b8246fc761e7	AD	AND	020	Andorra 	Andora	\N
00040000-563c-af7e-3e33-b6d8799ca2df	AO	AGO	024	Angola 	Angola	\N
00040000-563c-af7e-a61e-3bf4de6a56fa	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-563c-af7e-9a2e-e112d3443dde	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-563c-af7e-faf1-cce7f5d021c5	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-563c-af7e-988f-1301caa662b2	AR	ARG	032	Argentina 	Argenitna	\N
00040000-563c-af7e-1ce3-4de0e2ec85f5	AM	ARM	051	Armenia 	Armenija	\N
00040000-563c-af7e-1313-d8792915e8d8	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-563c-af7e-8973-4f45e31334fb	AU	AUS	036	Australia 	Avstralija	\N
00040000-563c-af7e-05d8-67cb64fb54d6	AT	AUT	040	Austria 	Avstrija	\N
00040000-563c-af7e-5c76-01a2b19e7dcf	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-563c-af7e-2030-c7314b1184a9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-563c-af7e-fa52-6013c77bd677	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-563c-af7e-fc9e-7b67745786dc	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-563c-af7e-5ba5-eebc6c92d49e	BB	BRB	052	Barbados 	Barbados	\N
00040000-563c-af7e-e62e-e6262c3a9bbb	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-563c-af7e-53bc-65483661ea52	BE	BEL	056	Belgium 	Belgija	\N
00040000-563c-af7e-88c7-13819e16703b	BZ	BLZ	084	Belize 	Belize	\N
00040000-563c-af7e-c1f6-a4f7842fdeb6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-563c-af7e-f5fd-089f8e7c382e	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-563c-af7e-006a-9884c7dfaac0	BT	BTN	064	Bhutan 	Butan	\N
00040000-563c-af7e-49eb-3d563deb377a	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-563c-af7e-20d5-f455332dc3a3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-563c-af7e-f16c-8b3ef3e3e406	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-563c-af7e-9f0f-1088f2a5db4d	BW	BWA	072	Botswana 	Bocvana	\N
00040000-563c-af7e-8730-80e7047dddf5	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-563c-af7e-1ca8-f95762e0e20f	BR	BRA	076	Brazil 	Brazilija	\N
00040000-563c-af7e-450c-72d2e94a0c44	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-563c-af7e-b03b-a6e94cda1792	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-563c-af7e-e51f-560162adb999	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-563c-af7e-884c-89991d341ed1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-563c-af7e-53b6-c6d1b8be6fa4	BI	BDI	108	Burundi 	Burundi 	\N
00040000-563c-af7e-25b8-9eb650f3865b	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-563c-af7e-74f6-1ac89bc07e18	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-563c-af7e-94fb-f84db2f4417b	CA	CAN	124	Canada 	Kanada	\N
00040000-563c-af7e-e2b6-db7821a55791	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-563c-af7e-db57-7d7bcf1d9492	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-563c-af7e-d101-1ed1273220e1	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-563c-af7e-7679-526d073313e3	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-563c-af7e-1f0b-c2d6f7207fd4	CL	CHL	152	Chile 	Čile	\N
00040000-563c-af7e-1723-3423e63b6e62	CN	CHN	156	China 	Kitajska	\N
00040000-563c-af7e-c074-513ecb1be1b2	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-563c-af7e-f7e5-eea9b2c7f0a5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-563c-af7e-1476-50b19264e754	CO	COL	170	Colombia 	Kolumbija	\N
00040000-563c-af7e-95d9-d2273db7495e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-563c-af7e-9bb3-e85341ae0ae4	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-563c-af7e-8a47-0d19abd73181	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-563c-af7e-70f0-130401ce2670	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-563c-af7e-4e55-d1cde1c170cf	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-563c-af7e-442e-2eb249f00653	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-563c-af7e-1123-2b80c82a2a70	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-563c-af7e-896d-1bf1f31fdcda	CU	CUB	192	Cuba 	Kuba	\N
00040000-563c-af7e-e3d6-bcf4ce3fe119	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-563c-af7e-696b-58e4d484872d	CY	CYP	196	Cyprus 	Ciper	\N
00040000-563c-af7e-0fcb-79cde4f05f11	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-563c-af7e-c884-0d2bf5d67161	DK	DNK	208	Denmark 	Danska	\N
00040000-563c-af7e-16a2-5e283fdd0d72	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-563c-af7e-b4f6-49156d90ee68	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-563c-af7e-3615-6758c4fa87a1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-563c-af7e-f10b-c069c47e22bc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-563c-af7e-e556-f9aaee3fb118	EG	EGY	818	Egypt 	Egipt	\N
00040000-563c-af7e-9218-c554276ff57b	SV	SLV	222	El Salvador 	Salvador	\N
00040000-563c-af7e-a764-6b43056de3e9	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-563c-af7e-2a24-bcf3db8ef80b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-563c-af7e-469b-c1a266855ac5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-563c-af7e-55e1-4fb8ac3355f5	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-563c-af7e-3aff-9434ab45abd5	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-563c-af7e-37a2-f7f4402b4649	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-563c-af7e-b9d3-14f8d054c805	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-563c-af7e-15be-267366fd21bc	FI	FIN	246	Finland 	Finska	\N
00040000-563c-af7e-8016-1d2fce61f2b9	FR	FRA	250	France 	Francija	\N
00040000-563c-af7e-4473-887e5b579eb0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-563c-af7e-bf61-124788c433a0	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-563c-af7e-5d08-64ae4d54258e	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-563c-af7e-5015-d5de4d26341e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-563c-af7e-80cf-a4cf9487fc8f	GA	GAB	266	Gabon 	Gabon	\N
00040000-563c-af7e-9e81-3f560f2669a6	GM	GMB	270	Gambia 	Gambija	\N
00040000-563c-af7e-d99c-0aedf905f15d	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-563c-af7e-a8a8-b37d4ea1ae01	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-563c-af7e-e3ee-a760d1f8f1e8	GH	GHA	288	Ghana 	Gana	\N
00040000-563c-af7e-03c6-cd8c77e1145a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-563c-af7e-2fc3-1a88f103a57a	GR	GRC	300	Greece 	Grčija	\N
00040000-563c-af7e-38f9-9bc04c86d055	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-563c-af7e-fd9e-e9042c6e6296	GD	GRD	308	Grenada 	Grenada	\N
00040000-563c-af7e-b775-965e3038ae90	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-563c-af7e-507a-c818f54b962b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-563c-af7e-8451-10079e06013c	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-563c-af7e-9440-3c88d9d7bd35	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-563c-af7e-3df5-d676b6af09b1	GN	GIN	324	Guinea 	Gvineja	\N
00040000-563c-af7e-e1e5-d818f3ecda3e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-563c-af7e-86d8-d49d80d6b5be	GY	GUY	328	Guyana 	Gvajana	\N
00040000-563c-af7e-fd7b-483bd0bffe82	HT	HTI	332	Haiti 	Haiti	\N
00040000-563c-af7e-6b02-c27e4c250b2d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-563c-af7e-feb2-eb8904dd8aa7	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-563c-af7e-2e74-f081015c657f	HN	HND	340	Honduras 	Honduras	\N
00040000-563c-af7e-dfa3-109d327a5438	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-563c-af7e-df29-3b509473e6c2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-563c-af7e-a492-8609f9434e67	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-563c-af7e-7994-a6716b4a6332	IN	IND	356	India 	Indija	\N
00040000-563c-af7e-7d7a-4df1bcd7ae52	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-563c-af7e-cc7f-ef5a85b69aa7	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-563c-af7e-aed1-db939a77f3f4	IQ	IRQ	368	Iraq 	Irak	\N
00040000-563c-af7e-d614-7602bdb0f999	IE	IRL	372	Ireland 	Irska	\N
00040000-563c-af7e-853f-32b7021fd594	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-563c-af7e-03b5-d29b7d8b8d84	IL	ISR	376	Israel 	Izrael	\N
00040000-563c-af7e-cfa6-b0b43556282e	IT	ITA	380	Italy 	Italija	\N
00040000-563c-af7e-8f74-aadd7bf9f632	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-563c-af7e-1419-7a80fbc88554	JP	JPN	392	Japan 	Japonska	\N
00040000-563c-af7e-7ce9-084cfbe26282	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-563c-af7e-3b1a-8157cd223f82	JO	JOR	400	Jordan 	Jordanija	\N
00040000-563c-af7e-8a14-c7bcc8bf4541	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-563c-af7e-f56a-085db87752c4	KE	KEN	404	Kenya 	Kenija	\N
00040000-563c-af7e-2314-d5a04fb357ba	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-563c-af7e-0cf0-f5b4fccf82a5	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-563c-af7e-e1ee-9f630b3e6553	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-563c-af7e-28b1-21859a27d5d6	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-563c-af7e-1ce7-8675bb3db5b7	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-563c-af7e-0c9e-738e58ce9f53	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-563c-af7e-ab9c-ee55d50819b3	LV	LVA	428	Latvia 	Latvija	\N
00040000-563c-af7e-7d32-c24515a17bb3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-563c-af7e-3cbf-76e29dba0a99	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-563c-af7e-b858-6e1b77d9b92d	LR	LBR	430	Liberia 	Liberija	\N
00040000-563c-af7e-ff0f-bffc81134f68	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-563c-af7e-279c-a44088fb3ce9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-563c-af7e-ec7a-a3b6ac87f844	LT	LTU	440	Lithuania 	Litva	\N
00040000-563c-af7e-c5a6-5d21e1ac50dc	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-563c-af7e-a2fe-667d77059f60	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-563c-af7e-42bf-1726b8ce4a0b	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-563c-af7e-795f-6842d33341d3	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-563c-af7e-923c-7c607808871a	MW	MWI	454	Malawi 	Malavi	\N
00040000-563c-af7e-78f8-d97a2f512774	MY	MYS	458	Malaysia 	Malezija	\N
00040000-563c-af7e-f70e-b3889143239e	MV	MDV	462	Maldives 	Maldivi	\N
00040000-563c-af7e-562c-1415f108aa89	ML	MLI	466	Mali 	Mali	\N
00040000-563c-af7e-3638-5fe22db1dad3	MT	MLT	470	Malta 	Malta	\N
00040000-563c-af7e-2d21-c4d5e59d6c01	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-563c-af7e-6005-bfa982b0535d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-563c-af7e-6430-ca321bd1de91	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-563c-af7e-cef1-801e7706e713	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-563c-af7e-8ec0-e8591015238e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-563c-af7e-695c-708ffc2c7744	MX	MEX	484	Mexico 	Mehika	\N
00040000-563c-af7e-f45d-a3287f0eceb5	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-563c-af7e-6b72-734bf0c1b6f7	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-563c-af7e-8c69-d0a0d86a8620	MC	MCO	492	Monaco 	Monako	\N
00040000-563c-af7e-854e-f25781da95d6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-563c-af7e-db6e-dd3a3e6889c9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-563c-af7e-c5bc-e674ab570d95	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-563c-af7e-4eb3-91fb55e04fa2	MA	MAR	504	Morocco 	Maroko	\N
00040000-563c-af7e-372e-f8f13f3fd3b1	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-563c-af7e-75e3-316dc3546f1a	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-563c-af7e-9b24-fc497a81848d	NA	NAM	516	Namibia 	Namibija	\N
00040000-563c-af7e-ae3e-b85da17acb50	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-563c-af7e-3530-a25b4f8176de	NP	NPL	524	Nepal 	Nepal	\N
00040000-563c-af7e-f996-981c9faf075f	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-563c-af7e-88a6-3188ce32bab7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-563c-af7e-cfcd-0dfcaf439d63	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-563c-af7e-e821-71fe0de112d6	NE	NER	562	Niger 	Niger 	\N
00040000-563c-af7e-2a28-bcd8b41fda3e	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-563c-af7e-b572-489a696b4884	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-563c-af7e-ce0b-1cf64ac42278	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-563c-af7e-2cea-1418ba1ca297	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-563c-af7e-776a-a122c6e16c60	NO	NOR	578	Norway 	Norveška	\N
00040000-563c-af7e-4793-2e3b4f991c0e	OM	OMN	512	Oman 	Oman	\N
00040000-563c-af7e-a552-2f64578c2eb3	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-563c-af7e-907c-8d97d2c92e43	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-563c-af7e-bf95-9e16c9e0b13c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-563c-af7e-90bc-666e67447662	PA	PAN	591	Panama 	Panama	\N
00040000-563c-af7e-9453-27a5bb71ad4d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-563c-af7e-373e-cf68be570a37	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-563c-af7e-8eb0-63138081870d	PE	PER	604	Peru 	Peru	\N
00040000-563c-af7e-3bf9-4404e2e0ac95	PH	PHL	608	Philippines 	Filipini	\N
00040000-563c-af7e-36d9-b30e188bfeb4	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-563c-af7e-1e1d-dd7e69e23ee0	PL	POL	616	Poland 	Poljska	\N
00040000-563c-af7e-9552-eda8a97776ca	PT	PRT	620	Portugal 	Portugalska	\N
00040000-563c-af7e-3d6d-b0c6b250931f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-563c-af7e-a22e-a38b34116254	QA	QAT	634	Qatar 	Katar	\N
00040000-563c-af7e-ca0e-f339c1b285cf	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-563c-af7e-2975-cbe30dd99905	RO	ROU	642	Romania 	Romunija	\N
00040000-563c-af7e-4338-59a53acf4ab2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-563c-af7e-bd86-5bf109e9bf33	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-563c-af7e-55d3-c7ec4ba812d6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-563c-af7e-eb88-a39ada2d7d19	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-563c-af7e-3e7a-227f9d78be36	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-563c-af7e-6fad-a566e834d24d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-563c-af7e-63fc-f3abebb5c03e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-563c-af7e-5268-3410676ff2cb	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-563c-af7e-b9d0-f33feec4d609	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-563c-af7e-13e5-7e0852adfbec	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-563c-af7e-ebad-16cca5174b8d	SM	SMR	674	San Marino 	San Marino	\N
00040000-563c-af7e-5b22-61148b7f6d46	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-563c-af7e-6887-18e238a8d865	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-563c-af7e-5ee5-8bb64046d696	SN	SEN	686	Senegal 	Senegal	\N
00040000-563c-af7e-1bc8-f449c2526f7d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-563c-af7e-5f91-3f07f4a23b41	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-563c-af7e-5ad8-0b698958a529	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-563c-af7e-9ac6-393221179de9	SG	SGP	702	Singapore 	Singapur	\N
00040000-563c-af7e-6b0c-c04f7b21671f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-563c-af7e-e0ec-aaae77338de6	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-563c-af7e-8f9c-f694b029b392	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-563c-af7e-cd7c-cadb75c857fd	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-563c-af7e-edcf-7898b1e62afd	SO	SOM	706	Somalia 	Somalija	\N
00040000-563c-af7e-c87a-d16b64405937	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-563c-af7e-74be-0ac9f67efff5	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-563c-af7e-93c6-cff9aee76474	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-563c-af7e-165c-321025153d79	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-563c-af7e-f900-add8d682f3a9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-563c-af7e-3d45-0f085544cf91	SD	SDN	729	Sudan 	Sudan	\N
00040000-563c-af7e-2b56-cd9722b6102b	SR	SUR	740	Suriname 	Surinam	\N
00040000-563c-af7e-6fd2-6075a7a8b2af	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-563c-af7e-0677-b75691f22998	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-563c-af7e-cfd0-22869069304f	SE	SWE	752	Sweden 	Švedska	\N
00040000-563c-af7e-4c64-4ac97a987d71	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-563c-af7e-90db-53c3d025baf4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-563c-af7e-53e8-45809ef279db	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-563c-af7e-fa42-9730e864184e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-563c-af7e-4c58-e2d1c492aa4d	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-563c-af7e-5756-d38d71b66959	TH	THA	764	Thailand 	Tajska	\N
00040000-563c-af7e-0e2d-cdc0059dfbef	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-563c-af7e-fdac-163eb6de75ad	TG	TGO	768	Togo 	Togo	\N
00040000-563c-af7e-fdac-1b710f8c21e7	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-563c-af7e-4c03-63487e3a7def	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-563c-af7e-9702-f61a4799dd26	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-563c-af7e-ebb2-0782325e65d8	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-563c-af7e-1a79-72f05428e51e	TR	TUR	792	Turkey 	Turčija	\N
00040000-563c-af7e-4f2a-e31f981d73dc	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-563c-af7e-e9c1-96637c7473b1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563c-af7e-812a-037729ccf5d0	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-563c-af7e-e32c-a09f01085879	UG	UGA	800	Uganda 	Uganda	\N
00040000-563c-af7e-95ec-2a2bdb7b6b3c	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-563c-af7e-e41d-a34318c8917c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-563c-af7e-e007-e1da21004c4a	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-563c-af7e-cd07-108d771cdf31	US	USA	840	United States 	Združene države Amerike	\N
00040000-563c-af7e-3706-01fc27db3695	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-563c-af7e-9fd0-79ef837f8df5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-563c-af7e-16fa-1632b8da6026	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-563c-af7e-2354-78c345122ec9	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-563c-af7e-ec5b-2716780fb210	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-563c-af7e-aa31-026c64813190	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-563c-af7e-4cfb-6485bd90225e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563c-af7e-1187-ebbfa1c84b07	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-563c-af7e-ebe6-b301e08ef269	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-563c-af7e-a554-210b9a347e06	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-563c-af7e-9d9d-70761319c0d2	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-563c-af7e-6ebc-c7bc451e17ed	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-563c-af7e-a263-978fd84c3821	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25462094)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-563c-af81-811c-01647bf27b43	000e0000-563c-af80-3f08-3277fd5455a1	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563c-af7e-f609-e43dc20b566f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563c-af81-d902-5e6976cfbaaa	000e0000-563c-af80-eb34-ceacf4ff96c6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563c-af7e-72de-15bcfab0538e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563c-af81-5cfc-eb5edbfabc93	000e0000-563c-af80-a664-812c10c949b0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563c-af7e-f609-e43dc20b566f	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563c-af81-565a-3fdd8088eba7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563c-af81-1a7b-d185b90821a4	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25461895)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-563c-af80-ced6-9dfad4d5e40d	000e0000-563c-af80-eb34-ceacf4ff96c6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-563c-af7e-cc8c-e24b6425841d
000d0000-563c-af80-f23d-75c61ec81522	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-cd91-5deb6a913d4d	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-563c-af7e-cc8c-e24b6425841d
000d0000-563c-af80-4331-8ebf32d3e652	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-b744-287592fca2b3	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-563c-af7e-72fb-d4a2b1fab26d
000d0000-563c-af80-a576-64e7d99c94cb	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-d3cd-003b452df097	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-563c-af7e-6f62-fe73fbfff3b1
000d0000-563c-af80-02fc-8c6983eb5432	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-1aa5-ce94f0b73499	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-563c-af7e-1f0b-45674062147c
000d0000-563c-af80-d915-3470f261f8b1	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-b72e-befefdd80535	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-563c-af7e-1f0b-45674062147c
000d0000-563c-af80-4e1e-583df7a7e5a2	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-269a-ecefe6643180	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-563c-af7e-cc8c-e24b6425841d
000d0000-563c-af80-ca57-a488b76b42af	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-a2b5-08a6c27189e4	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-563c-af7e-183e-9cca17c0b113
000d0000-563c-af80-164e-e7d543e53447	000e0000-563c-af80-eb34-ceacf4ff96c6	000c0000-563c-af81-5350-69cd537a97b2	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-563c-af7e-2410-fc3790bb7f9a
\.


--
-- TOC entry 3118 (class 0 OID 25461686)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25461652)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25461629)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-563c-af80-065c-6f3bbb01c1dc	00080000-563c-af80-1f13-3fcee27329c4	00090000-563c-af80-b4ff-4ded7f89d5ca	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25461809)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25462349)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25462361)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25462383)
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
-- TOC entry 3134 (class 0 OID 25461834)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25461586)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-563c-af7f-ca07-c3f17ad478fe	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-563c-af7f-e69f-0a3bdac87796	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-563c-af7f-565f-560cd1d335e8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-563c-af7f-36d3-d41ad02145f9	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-563c-af7f-c5f3-81939fdd0710	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-563c-af7f-afe2-afa383a2b36f	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-563c-af7f-9d8a-bc570913f697	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-563c-af7f-6cb8-7e3f5257dc50	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563c-af7f-22f1-b12532056a28	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563c-af7f-81f6-7036c13a2532	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-563c-af7f-80f8-d374d725299e	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-563c-af7f-9a76-c4af6f928e6a	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-563c-af7f-521a-7610c89170c4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-563c-af7f-a909-753e0eb3e7db	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-563c-af7f-b094-6ad1bc38088a	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-563c-af80-edac-d3488419cdec	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-563c-af80-928c-ada472e74717	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-563c-af80-ac11-6afaba277c59	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-563c-af80-4d11-3fb2387fe8e5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-563c-af80-8373-55f05abda4ed	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-563c-af82-40ca-75f54560ad7f	application.tenant.maticnopodjetje	string	s:36:"00080000-563c-af82-6c67-5b633d369bbe";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25461486)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-563c-af80-4148-3580be5373bf	00000000-563c-af80-edac-d3488419cdec	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-563c-af80-d55b-945cca292994	00000000-563c-af80-edac-d3488419cdec	00010000-563c-af7f-5fea-a32ff1a90347	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-563c-af80-0743-cc71297976e9	00000000-563c-af80-928c-ada472e74717	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25461553)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-563c-af80-b3cf-e8bb449232ac	\N	00100000-563c-af80-cea1-1782741a2268	00100000-563c-af80-65f4-18e28420a6b5	01	Gledališče Nimbis
00410000-563c-af80-87d2-d93a3b333fe8	00410000-563c-af80-b3cf-e8bb449232ac	00100000-563c-af80-cea1-1782741a2268	00100000-563c-af80-65f4-18e28420a6b5	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25461497)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-563c-af80-2176-7c59ea965277	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-563c-af80-464b-c9ac53b690b1	00010000-563c-af80-e55b-a79a68cd97fd	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-563c-af80-3ea7-38d2f89738c4	00010000-563c-af80-5256-289d0d0d6a42	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-563c-af80-de89-2622df3134af	00010000-563c-af80-6c5d-ee7da1f8bd79	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-563c-af80-da83-753f70259bd5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-563c-af80-d2b7-cfa4334ea400	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-563c-af80-be29-80971805791b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-563c-af80-c682-6ee814ecf5c3	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-563c-af80-b4ff-4ded7f89d5ca	00010000-563c-af80-1da1-de5ac42c5128	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-563c-af80-fa26-031f5d3876dd	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-563c-af80-2f56-0f8bb5e5b8b8	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563c-af80-7e27-942c0779bcbb	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-563c-af80-08b1-2166b10bd2bc	00010000-563c-af80-799f-bd7c4339d16d	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563c-af80-3a4d-60b46a0e297d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-af80-3bc5-d2bb458ec117	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-af80-451a-c9f7d5b2e54b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-af80-3b10-ef23ff6c1dcb	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563c-af80-0fb9-a800f0be9ebd	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563c-af80-1598-24706962ddea	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-af80-7e20-d0f015bd917d	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-563c-af80-4b54-30394d5b7af8	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25461432)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-563c-af7e-fd46-2d31c27d3182	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-563c-af7e-de76-9908ef06e2ab	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-563c-af7e-75ef-6e9b0bb6b65c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-563c-af7e-6f41-50bff59951f2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-563c-af7e-d0ea-6dacb179d6bf	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-563c-af7e-f0b7-b991af53cb51	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-563c-af7e-b5ec-c7f2267bfc3e	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-563c-af7e-bfff-8225ae439537	Abonma-read	Abonma - branje	t
00030000-563c-af7e-6b0d-bdcecde9514e	Abonma-write	Abonma - spreminjanje	t
00030000-563c-af7e-4942-9887ec54c3b1	Alternacija-read	Alternacija - branje	t
00030000-563c-af7e-83f8-ab575d3fbe77	Alternacija-write	Alternacija - spreminjanje	t
00030000-563c-af7e-56be-383f890e51b5	Arhivalija-read	Arhivalija - branje	t
00030000-563c-af7e-e9ce-3e5cf2ed9af1	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-563c-af7e-e5a4-674d640185bd	AuthStorage-read	AuthStorage - branje	t
00030000-563c-af7e-7e6f-c486405d94c9	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-563c-af7e-94f9-af8fee352796	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-563c-af7e-d2a8-e6ea365be009	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-563c-af7e-5a97-b3191d76344c	Besedilo-read	Besedilo - branje	t
00030000-563c-af7e-e01a-9e506cf3b981	Besedilo-write	Besedilo - spreminjanje	t
00030000-563c-af7e-2756-71094ced9184	Dogodek-read	Dogodek - branje	t
00030000-563c-af7e-c085-41b61c50cc23	Dogodek-write	Dogodek - spreminjanje	t
00030000-563c-af7e-127f-300b164952dc	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-563c-af7e-6339-e3840e105335	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-563c-af7e-502f-28faa6e7c315	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-563c-af7e-96b7-5ce156eb2ead	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-563c-af7e-0409-9cd9e68e37b8	DogodekTrait-read	DogodekTrait - branje	t
00030000-563c-af7e-998b-06f3dbc63c62	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-563c-af7e-fdb7-4fd85ed852b6	DrugiVir-read	DrugiVir - branje	t
00030000-563c-af7e-5d33-4ed958b992c9	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-563c-af7e-fb19-d9ddba7a1064	Drzava-read	Drzava - branje	t
00030000-563c-af7e-0f48-9735e3b7e81d	Drzava-write	Drzava - spreminjanje	t
00030000-563c-af7e-3731-30da5446c39b	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-563c-af7e-3864-5b1dc2680e8b	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-563c-af7e-8f88-544a1fb6c273	Funkcija-read	Funkcija - branje	t
00030000-563c-af7e-1550-125e476a0cb8	Funkcija-write	Funkcija - spreminjanje	t
00030000-563c-af7e-adf2-702043bcf2e2	Gostovanje-read	Gostovanje - branje	t
00030000-563c-af7e-71d0-01feadf7ac59	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-563c-af7e-1c81-aa55419b3e02	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-563c-af7e-bd4c-5480d3e72949	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-563c-af7e-7497-807c7c69cfec	Kupec-read	Kupec - branje	t
00030000-563c-af7e-c027-742d60f73de2	Kupec-write	Kupec - spreminjanje	t
00030000-563c-af7e-95ed-9f9d4c3a05b0	NacinPlacina-read	NacinPlacina - branje	t
00030000-563c-af7e-d01d-4cb8e44ddcf7	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-563c-af7e-d787-0503bc996793	Option-read	Option - branje	t
00030000-563c-af7e-33c1-9f25f7fc7cbe	Option-write	Option - spreminjanje	t
00030000-563c-af7e-8e73-6724e4eac28a	OptionValue-read	OptionValue - branje	t
00030000-563c-af7e-d9c5-f266aa24bbfb	OptionValue-write	OptionValue - spreminjanje	t
00030000-563c-af7e-e78d-6b7a78eca1fe	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-563c-af7e-a872-8ec417e9d961	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-563c-af7e-6d53-02caaaca4f64	Oseba-read	Oseba - branje	t
00030000-563c-af7e-ee83-1b1c38203347	Oseba-write	Oseba - spreminjanje	t
00030000-563c-af7e-028c-986f36f12680	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-563c-af7e-65aa-bb0d2027b95a	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-563c-af7e-4577-a1b0c695fdf5	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-563c-af7e-8b9d-2c1daa6aef0c	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-563c-af7e-1984-42feb97c0d05	Pogodba-read	Pogodba - branje	t
00030000-563c-af7e-dfae-e22b923f1315	Pogodba-write	Pogodba - spreminjanje	t
00030000-563c-af7e-12e1-f02114d0f9df	Popa-read	Popa - branje	t
00030000-563c-af7e-3a25-d24e62d3eee7	Popa-write	Popa - spreminjanje	t
00030000-563c-af7e-1158-bc7765ce6e43	Posta-read	Posta - branje	t
00030000-563c-af7e-d443-520b91c3878a	Posta-write	Posta - spreminjanje	t
00030000-563c-af7e-9304-d2a113af3af8	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-563c-af7e-322f-dcd87d059627	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-563c-af7e-c9f1-3419c569c129	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-563c-af7e-d8f6-ff5df915d3d5	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-563c-af7e-285e-78aad9263da4	PostniNaslov-read	PostniNaslov - branje	t
00030000-563c-af7e-1882-d68eface5de9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-563c-af7e-50bf-400cb9327b20	Praznik-read	Praznik - branje	t
00030000-563c-af7e-d342-c2569c0b9e4b	Praznik-write	Praznik - spreminjanje	t
00030000-563c-af7e-6474-185c43fecd5f	Predstava-read	Predstava - branje	t
00030000-563c-af7e-79ed-d20c2f43d06d	Predstava-write	Predstava - spreminjanje	t
00030000-563c-af7e-1bb4-545fee16c10e	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-563c-af7e-f20f-a9cf77682871	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-563c-af7e-f3e4-7e54c45870ef	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-563c-af7e-3168-b384b25ef979	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-563c-af7e-baf8-a9b69e913c8b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-563c-af7e-c523-f3bbd78c115b	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-563c-af7e-2b23-8d1f6986761a	ProgramDela-read	ProgramDela - branje	t
00030000-563c-af7e-2c6f-faa4312b9370	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-563c-af7e-b673-bedeea6773ef	ProgramFestival-read	ProgramFestival - branje	t
00030000-563c-af7e-6ffb-bd17c3f7c5f8	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-563c-af7e-55c2-c777fc809b12	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-563c-af7e-ec2f-d70209ff2e74	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-563c-af7e-c988-5e81da26a8af	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-563c-af7e-3f38-98b6ee505b8a	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-563c-af7e-42a9-25d9b10b415b	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-563c-af7e-ac2e-ae965ac55c95	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-563c-af7e-c308-b06cc4f51c17	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-563c-af7e-1578-a67313188170	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-563c-af7e-25e8-7ad4d7174944	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-563c-af7e-4e6e-1776b68a81dc	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-563c-af7e-1aaa-68281d5d1a9e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-563c-af7e-b60e-df58581b5558	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-563c-af7e-4324-671f63f88e64	ProgramRazno-read	ProgramRazno - branje	t
00030000-563c-af7e-2931-74e55a15f8e1	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-563c-af7e-bc2c-4f5cb646a288	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-563c-af7e-1c69-07ae03772fdc	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-563c-af7e-9c83-63edf56a091f	Prostor-read	Prostor - branje	t
00030000-563c-af7e-fb28-cb717e1af43d	Prostor-write	Prostor - spreminjanje	t
00030000-563c-af7e-a3ee-c9bb66440000	Racun-read	Racun - branje	t
00030000-563c-af7e-ddf2-57e812138467	Racun-write	Racun - spreminjanje	t
00030000-563c-af7e-e00c-bca98e5b3436	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-563c-af7e-f7a6-e8d9dcff92f1	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-563c-af7e-6a9c-018f84be6f61	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-563c-af7e-9d2a-7edede5eb521	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-563c-af7e-c79c-cf404b55ec8a	Rekvizit-read	Rekvizit - branje	t
00030000-563c-af7e-ce34-c2dc22d3bd24	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-563c-af7e-fa8a-eadd2192a1b7	Revizija-read	Revizija - branje	t
00030000-563c-af7e-8bec-a88869cc9158	Revizija-write	Revizija - spreminjanje	t
00030000-563c-af7e-6c23-e80eba62a399	Rezervacija-read	Rezervacija - branje	t
00030000-563c-af7e-9f1c-375a9184477e	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-563c-af7e-aa07-601cc60af880	SedezniRed-read	SedezniRed - branje	t
00030000-563c-af7e-78fc-df8784cb202a	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-563c-af7e-9377-c29ab2449467	Sedez-read	Sedez - branje	t
00030000-563c-af7e-7274-6875f509feef	Sedez-write	Sedez - spreminjanje	t
00030000-563c-af7e-6abc-b551278cca2b	Sezona-read	Sezona - branje	t
00030000-563c-af7e-df95-0f55c3257b94	Sezona-write	Sezona - spreminjanje	t
00030000-563c-af7e-44c1-220477b1ae56	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-563c-af7e-8cff-2775f2e648eb	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-563c-af7e-0c01-ae4d2243e2dc	Stevilcenje-read	Stevilcenje - branje	t
00030000-563c-af7e-7197-dd95a1eac943	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-563c-af7e-e519-cb6c019670be	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-563c-af7e-3cf4-d85de86a7d1b	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-563c-af7e-83b2-a35cda6fca1b	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-563c-af7e-648e-68b5edfdec45	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-563c-af7e-87ce-e7d94a9cf7b8	Telefonska-read	Telefonska - branje	t
00030000-563c-af7e-8b3f-8795f42b95d0	Telefonska-write	Telefonska - spreminjanje	t
00030000-563c-af7e-e052-4906e3471bea	TerminStoritve-read	TerminStoritve - branje	t
00030000-563c-af7e-f2ec-2201b26ec87d	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-563c-af7e-8914-8893247a5444	TipFunkcije-read	TipFunkcije - branje	t
00030000-563c-af7e-6ac9-46f8ec4aef6b	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-563c-af7e-a16e-dd1eff261a6a	TipPopa-read	TipPopa - branje	t
00030000-563c-af7e-33cc-9142dc2f3b38	TipPopa-write	TipPopa - spreminjanje	t
00030000-563c-af7e-0384-06032bec062c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-563c-af7e-ab70-ab659adabf82	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-563c-af7e-7fa4-6da17eff0765	TipVaje-read	TipVaje - branje	t
00030000-563c-af7e-603c-6750d30d6ddf	TipVaje-write	TipVaje - spreminjanje	t
00030000-563c-af7e-ca3f-9ef07fd169a5	Trr-read	Trr - branje	t
00030000-563c-af7e-1e60-d97fd63f6714	Trr-write	Trr - spreminjanje	t
00030000-563c-af7e-0101-d34bc3575859	Uprizoritev-read	Uprizoritev - branje	t
00030000-563c-af7e-02f5-6c2bcfc70d66	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-563c-af7e-bcb8-5404f5cab441	Vaja-read	Vaja - branje	t
00030000-563c-af7e-3d5a-78e165d73784	Vaja-write	Vaja - spreminjanje	t
00030000-563c-af7e-68f3-af66ace06a35	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-563c-af7e-fa3a-69edeba3106c	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-563c-af7e-ca86-091c6950014e	VrstaStroska-read	VrstaStroska - branje	t
00030000-563c-af7e-56f9-33b0e699059e	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-563c-af7e-f6c7-aca3f68e1cc0	Zaposlitev-read	Zaposlitev - branje	t
00030000-563c-af7e-37da-81513a6691ff	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-563c-af7e-8ee2-4a6ae3d88095	Zasedenost-read	Zasedenost - branje	t
00030000-563c-af7e-68a9-83d63984f318	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-563c-af7e-512f-148d8b332454	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-563c-af7e-1fa9-e7b1214bf3e4	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-563c-af7e-316d-8749812770b2	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-563c-af7e-2fa4-5c0832b9ccdc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-563c-af7e-ced4-61f18966795d	Job-read	Branje opravil - samo zase - branje	t
00030000-563c-af7e-5335-83e9b5d9cc18	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-563c-af7f-b5ed-76cfc9bf2693	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-563c-af7f-3612-df190a44d6ff	Report-read	Report - branje	t
00030000-563c-af7f-d101-613aa6ce61dd	Report-write	Report - spreminjanje	t
00030000-563c-af7f-9151-1eab9faf5ea4	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-563c-af7f-9d11-139a38ec360e	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-563c-af7f-bba7-facb5b3bb193	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-563c-af7f-1e94-87a6a0a861fa	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-563c-af7f-ff1d-144d19d9ea3c	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-563c-af7f-d924-32d2eee3133f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-563c-af7f-1ac3-44e793b08b9f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563c-af7f-121c-aae47b08ac71	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563c-af7f-16cc-c5f90c6b1674	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-563c-af7f-1763-890900b90231	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-563c-af7f-9397-3d1b6a518f4b	Datoteka-write	Datoteka - spreminjanje	t
00030000-563c-af7f-4c1a-2c65d55c7a9b	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25461451)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-563c-af7f-7539-c1cffd21f515	00030000-563c-af7e-de76-9908ef06e2ab
00020000-563c-af7f-c516-9652a3f74ef7	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-bfff-8225ae439537
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-6b0d-bdcecde9514e
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-4942-9887ec54c3b1
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-83f8-ab575d3fbe77
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-56be-383f890e51b5
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-2756-71094ced9184
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-6f41-50bff59951f2
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-c085-41b61c50cc23
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-0f48-9735e3b7e81d
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-8f88-544a1fb6c273
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-1550-125e476a0cb8
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-adf2-702043bcf2e2
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-71d0-01feadf7ac59
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-1c81-aa55419b3e02
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-bd4c-5480d3e72949
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-d787-0503bc996793
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-8e73-6724e4eac28a
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-6d53-02caaaca4f64
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-ee83-1b1c38203347
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-12e1-f02114d0f9df
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-3a25-d24e62d3eee7
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-1158-bc7765ce6e43
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-d443-520b91c3878a
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-285e-78aad9263da4
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-1882-d68eface5de9
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-6474-185c43fecd5f
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-79ed-d20c2f43d06d
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-baf8-a9b69e913c8b
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-c523-f3bbd78c115b
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-9c83-63edf56a091f
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-fb28-cb717e1af43d
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-6a9c-018f84be6f61
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-9d2a-7edede5eb521
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-c79c-cf404b55ec8a
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-ce34-c2dc22d3bd24
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-6abc-b551278cca2b
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-df95-0f55c3257b94
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-8914-8893247a5444
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-0101-d34bc3575859
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-02f5-6c2bcfc70d66
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-bcb8-5404f5cab441
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-3d5a-78e165d73784
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-8ee2-4a6ae3d88095
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-68a9-83d63984f318
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-512f-148d8b332454
00020000-563c-af7f-c749-cae58a9e4d24	00030000-563c-af7e-316d-8749812770b2
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-bfff-8225ae439537
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-56be-383f890e51b5
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-2756-71094ced9184
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-adf2-702043bcf2e2
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-1c81-aa55419b3e02
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-bd4c-5480d3e72949
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-d787-0503bc996793
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-8e73-6724e4eac28a
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-6d53-02caaaca4f64
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-ee83-1b1c38203347
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-12e1-f02114d0f9df
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-1158-bc7765ce6e43
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-285e-78aad9263da4
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-1882-d68eface5de9
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-6474-185c43fecd5f
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-9c83-63edf56a091f
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-6a9c-018f84be6f61
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-c79c-cf404b55ec8a
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-6abc-b551278cca2b
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-87ce-e7d94a9cf7b8
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-8b3f-8795f42b95d0
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-ca3f-9ef07fd169a5
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-1e60-d97fd63f6714
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-f6c7-aca3f68e1cc0
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-37da-81513a6691ff
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-512f-148d8b332454
00020000-563c-af7f-765f-520d9b4558c0	00030000-563c-af7e-316d-8749812770b2
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-bfff-8225ae439537
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-4942-9887ec54c3b1
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-56be-383f890e51b5
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-e9ce-3e5cf2ed9af1
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-5a97-b3191d76344c
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-127f-300b164952dc
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-2756-71094ced9184
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-8f88-544a1fb6c273
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-adf2-702043bcf2e2
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-1c81-aa55419b3e02
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-d787-0503bc996793
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-8e73-6724e4eac28a
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-6d53-02caaaca4f64
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-12e1-f02114d0f9df
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-1158-bc7765ce6e43
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-6474-185c43fecd5f
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-baf8-a9b69e913c8b
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-9c83-63edf56a091f
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-6a9c-018f84be6f61
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-c79c-cf404b55ec8a
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-6abc-b551278cca2b
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-8914-8893247a5444
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-bcb8-5404f5cab441
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-8ee2-4a6ae3d88095
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-512f-148d8b332454
00020000-563c-af7f-8573-cc9c1ab728a6	00030000-563c-af7e-316d-8749812770b2
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-bfff-8225ae439537
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-6b0d-bdcecde9514e
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-83f8-ab575d3fbe77
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-56be-383f890e51b5
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-2756-71094ced9184
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-adf2-702043bcf2e2
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-d787-0503bc996793
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-8e73-6724e4eac28a
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-12e1-f02114d0f9df
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-1158-bc7765ce6e43
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-6474-185c43fecd5f
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-9c83-63edf56a091f
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-6a9c-018f84be6f61
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-c79c-cf404b55ec8a
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-6abc-b551278cca2b
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-8914-8893247a5444
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-512f-148d8b332454
00020000-563c-af7f-b725-311150abe6cb	00030000-563c-af7e-316d-8749812770b2
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-bfff-8225ae439537
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-56be-383f890e51b5
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-2756-71094ced9184
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-adf2-702043bcf2e2
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-d787-0503bc996793
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-8e73-6724e4eac28a
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-12e1-f02114d0f9df
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-1158-bc7765ce6e43
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-6474-185c43fecd5f
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-9c83-63edf56a091f
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-6a9c-018f84be6f61
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-c79c-cf404b55ec8a
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-6abc-b551278cca2b
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-e052-4906e3471bea
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-75ef-6e9b0bb6b65c
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-8914-8893247a5444
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-512f-148d8b332454
00020000-563c-af7f-f977-9781ffe4cb10	00030000-563c-af7e-316d-8749812770b2
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-fd46-2d31c27d3182
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-de76-9908ef06e2ab
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-bfff-8225ae439537
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6b0d-bdcecde9514e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-4942-9887ec54c3b1
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-83f8-ab575d3fbe77
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-56be-383f890e51b5
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-e9ce-3e5cf2ed9af1
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-94f9-af8fee352796
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d2a8-e6ea365be009
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-5a97-b3191d76344c
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-e01a-9e506cf3b981
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-127f-300b164952dc
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6339-e3840e105335
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-2756-71094ced9184
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6f41-50bff59951f2
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c085-41b61c50cc23
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-fdb7-4fd85ed852b6
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-5d33-4ed958b992c9
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-fb19-d9ddba7a1064
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-0f48-9735e3b7e81d
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3731-30da5446c39b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3864-5b1dc2680e8b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8f88-544a1fb6c273
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1550-125e476a0cb8
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-adf2-702043bcf2e2
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-71d0-01feadf7ac59
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1c81-aa55419b3e02
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-bd4c-5480d3e72949
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-7497-807c7c69cfec
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c027-742d60f73de2
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-95ed-9f9d4c3a05b0
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d01d-4cb8e44ddcf7
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d787-0503bc996793
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8e73-6724e4eac28a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d9c5-f266aa24bbfb
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-33c1-9f25f7fc7cbe
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-e78d-6b7a78eca1fe
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-a872-8ec417e9d961
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6d53-02caaaca4f64
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d0ea-6dacb179d6bf
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ee83-1b1c38203347
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-028c-986f36f12680
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-65aa-bb0d2027b95a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-4577-a1b0c695fdf5
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8b9d-2c1daa6aef0c
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1984-42feb97c0d05
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-dfae-e22b923f1315
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-12e1-f02114d0f9df
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3a25-d24e62d3eee7
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1158-bc7765ce6e43
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-9304-d2a113af3af8
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-322f-dcd87d059627
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c9f1-3419c569c129
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d8f6-ff5df915d3d5
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d443-520b91c3878a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-285e-78aad9263da4
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1882-d68eface5de9
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-50bf-400cb9327b20
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-d342-c2569c0b9e4b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6474-185c43fecd5f
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-79ed-d20c2f43d06d
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1bb4-545fee16c10e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-f20f-a9cf77682871
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-f3e4-7e54c45870ef
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3168-b384b25ef979
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-baf8-a9b69e913c8b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c523-f3bbd78c115b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-f0b7-b991af53cb51
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-2b23-8d1f6986761a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-b5ec-c7f2267bfc3e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-2c6f-faa4312b9370
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-b673-bedeea6773ef
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6ffb-bd17c3f7c5f8
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-55c2-c777fc809b12
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ec2f-d70209ff2e74
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c988-5e81da26a8af
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3f38-98b6ee505b8a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-42a9-25d9b10b415b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ac2e-ae965ac55c95
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c308-b06cc4f51c17
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1578-a67313188170
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-25e8-7ad4d7174944
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-4e6e-1776b68a81dc
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1aaa-68281d5d1a9e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-b60e-df58581b5558
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-4324-671f63f88e64
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-2931-74e55a15f8e1
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-bc2c-4f5cb646a288
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1c69-07ae03772fdc
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-9c83-63edf56a091f
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-fb28-cb717e1af43d
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-a3ee-c9bb66440000
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ddf2-57e812138467
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-e00c-bca98e5b3436
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-f7a6-e8d9dcff92f1
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6a9c-018f84be6f61
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-9d2a-7edede5eb521
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-c79c-cf404b55ec8a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ce34-c2dc22d3bd24
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-fa8a-eadd2192a1b7
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8bec-a88869cc9158
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6c23-e80eba62a399
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-9f1c-375a9184477e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-aa07-601cc60af880
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-78fc-df8784cb202a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-9377-c29ab2449467
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-7274-6875f509feef
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6abc-b551278cca2b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-df95-0f55c3257b94
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-44c1-220477b1ae56
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8cff-2775f2e648eb
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-0c01-ae4d2243e2dc
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-e519-cb6c019670be
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3cf4-d85de86a7d1b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-7197-dd95a1eac943
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-83b2-a35cda6fca1b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-648e-68b5edfdec45
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-87ce-e7d94a9cf7b8
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8b3f-8795f42b95d0
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-e052-4906e3471bea
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-75ef-6e9b0bb6b65c
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-f2ec-2201b26ec87d
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8914-8893247a5444
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-6ac9-46f8ec4aef6b
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-a16e-dd1eff261a6a
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-33cc-9142dc2f3b38
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-0384-06032bec062c
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ab70-ab659adabf82
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-7fa4-6da17eff0765
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-603c-6750d30d6ddf
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ca3f-9ef07fd169a5
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1e60-d97fd63f6714
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-0101-d34bc3575859
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-02f5-6c2bcfc70d66
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-bcb8-5404f5cab441
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-3d5a-78e165d73784
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-68f3-af66ace06a35
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-fa3a-69edeba3106c
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-ca86-091c6950014e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-56f9-33b0e699059e
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-f6c7-aca3f68e1cc0
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-37da-81513a6691ff
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-8ee2-4a6ae3d88095
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-68a9-83d63984f318
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-512f-148d8b332454
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-1fa9-e7b1214bf3e4
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-316d-8749812770b2
00020000-563c-af80-5d88-318a290d37de	00030000-563c-af7e-2fa4-5c0832b9ccdc
00020000-563c-af80-56ca-cfdfd7588723	00030000-563c-af7f-121c-aae47b08ac71
00020000-563c-af80-9a8a-314b290458be	00030000-563c-af7f-1ac3-44e793b08b9f
00020000-563c-af80-5b9f-5130ea6a3a5b	00030000-563c-af7e-02f5-6c2bcfc70d66
00020000-563c-af80-2e4d-c4bcf87767c4	00030000-563c-af7e-0101-d34bc3575859
\.


--
-- TOC entry 3135 (class 0 OID 25461841)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25461875)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25462012)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-563c-af80-2cc1-92fdb6d0fa0a	00090000-563c-af80-2176-7c59ea965277	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-563c-af80-43be-159b2f7198eb	00090000-563c-af80-d2b7-cfa4334ea400	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-563c-af80-7ff3-ae4786db1d13	00090000-563c-af80-08b1-2166b10bd2bc	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-563c-af80-5fed-81f9f028526f	00090000-563c-af80-fa26-031f5d3876dd	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25461533)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-563c-af80-1f13-3fcee27329c4	\N	00040000-563c-af7e-8f9c-f694b029b392	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-4726-8bce2e7cde5f	\N	00040000-563c-af7e-8f9c-f694b029b392	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-563c-af80-3fbe-24326228ef3a	\N	00040000-563c-af7e-8f9c-f694b029b392	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-b9a0-4b82c576006d	\N	00040000-563c-af7e-8f9c-f694b029b392	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-1056-5a8cf6c5c985	\N	00040000-563c-af7e-8f9c-f694b029b392	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-504e-879bd1d14711	\N	00040000-563c-af7e-988f-1301caa662b2	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-491a-3632fb8813fc	\N	00040000-563c-af7e-1123-2b80c82a2a70	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-ce17-f34e7fda8762	\N	00040000-563c-af7e-05d8-67cb64fb54d6	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af80-8d56-e33135189e24	\N	00040000-563c-af7e-a8a8-b37d4ea1ae01	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563c-af82-6c67-5b633d369bbe	\N	00040000-563c-af7e-8f9c-f694b029b392	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25461578)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-563c-af7e-b372-a70a5d12d65e	8341	Adlešiči
00050000-563c-af7e-f667-fdd38187dc22	5270	Ajdovščina
00050000-563c-af7e-4e14-6d37728d5c83	6280	Ankaran/Ancarano
00050000-563c-af7e-e695-dfda17c7cf64	9253	Apače
00050000-563c-af7e-5f6d-89e3d6d60ef3	8253	Artiče
00050000-563c-af7e-f34f-a0da29c47757	4275	Begunje na Gorenjskem
00050000-563c-af7e-3a68-62785932834b	1382	Begunje pri Cerknici
00050000-563c-af7e-af29-6645054b16eb	9231	Beltinci
00050000-563c-af7e-1757-7eb3555c16e3	2234	Benedikt
00050000-563c-af7e-22a4-35d719b66218	2345	Bistrica ob Dravi
00050000-563c-af7e-38ed-9357672cb7a3	3256	Bistrica ob Sotli
00050000-563c-af7e-0ee5-071aa680e807	8259	Bizeljsko
00050000-563c-af7e-9b66-70333a7ad753	1223	Blagovica
00050000-563c-af7e-fb3c-4f5fd06d30db	8283	Blanca
00050000-563c-af7e-ef7b-0b84388bfa06	4260	Bled
00050000-563c-af7e-67b9-6bd2cdd0e8b7	4273	Blejska Dobrava
00050000-563c-af7e-5420-26a599b28424	9265	Bodonci
00050000-563c-af7e-ec5e-9affb1be9977	9222	Bogojina
00050000-563c-af7e-9698-593f18ce48e9	4263	Bohinjska Bela
00050000-563c-af7e-83c8-f37ff2350013	4264	Bohinjska Bistrica
00050000-563c-af7e-6f32-ffe94ac29449	4265	Bohinjsko jezero
00050000-563c-af7e-f567-d4d3bb9c53d7	1353	Borovnica
00050000-563c-af7e-de46-c8b9fa9616c4	8294	Boštanj
00050000-563c-af7e-a275-81cec9184d50	5230	Bovec
00050000-563c-af7e-2f5c-076e9b719b7f	5295	Branik
00050000-563c-af7e-9d91-dd333cedaece	3314	Braslovče
00050000-563c-af7e-9a46-eaa1ed2d942e	5223	Breginj
00050000-563c-af7e-6fc5-9ec8ef3d1e8a	8280	Brestanica
00050000-563c-af7e-7492-3ef4374ea256	2354	Bresternica
00050000-563c-af7e-b920-de35a60dbd44	4243	Brezje
00050000-563c-af7e-3773-e7723a039dfc	1351	Brezovica pri Ljubljani
00050000-563c-af7e-e8d7-0ce1894e9443	8250	Brežice
00050000-563c-af7e-bfda-323c9be2f118	4210	Brnik - Aerodrom
00050000-563c-af7e-944b-936448873fed	8321	Brusnice
00050000-563c-af7e-58e4-485f3fe2981a	3255	Buče
00050000-563c-af7e-b085-2764c1b54c92	8276	Bučka 
00050000-563c-af7e-6752-20c4436f9d14	9261	Cankova
00050000-563c-af7e-f896-bf9570ddfe5d	3000	Celje 
00050000-563c-af7e-d920-4f41689fbb31	3001	Celje - poštni predali
00050000-563c-af7e-d8ce-19581691f86e	4207	Cerklje na Gorenjskem
00050000-563c-af7e-8950-2c1279eaa66d	8263	Cerklje ob Krki
00050000-563c-af7e-3556-2be7bd3966f2	1380	Cerknica
00050000-563c-af7e-f20f-e29447990b04	5282	Cerkno
00050000-563c-af7e-b381-c9273179795c	2236	Cerkvenjak
00050000-563c-af7e-d108-c09909da5efe	2215	Ceršak
00050000-563c-af7e-77e2-052e83416280	2326	Cirkovce
00050000-563c-af7e-c9f4-eaa91ddc6ca9	2282	Cirkulane
00050000-563c-af7e-bd67-cc107fcef3c5	5273	Col
00050000-563c-af7e-f878-28ea110b366c	8251	Čatež ob Savi
00050000-563c-af7e-fb93-b4f16f0efce0	1413	Čemšenik
00050000-563c-af7e-ebd2-7b2042e759f2	5253	Čepovan
00050000-563c-af7e-5e36-0919c928a058	9232	Črenšovci
00050000-563c-af7e-3d56-93569b5407b0	2393	Črna na Koroškem
00050000-563c-af7e-f5b2-013f2d6d375f	6275	Črni Kal
00050000-563c-af7e-1cad-7d0062523c33	5274	Črni Vrh nad Idrijo
00050000-563c-af7e-4ad2-2e2e29dc031c	5262	Črniče
00050000-563c-af7e-70ee-4c114618284c	8340	Črnomelj
00050000-563c-af7e-511c-237512b72000	6271	Dekani
00050000-563c-af7e-fbf2-33df29e5ae4c	5210	Deskle
00050000-563c-af7e-2f1c-429228ab6956	2253	Destrnik
00050000-563c-af7e-0c71-54b8cdd6137d	6215	Divača
00050000-563c-af7e-2078-fa4b4e0962d9	1233	Dob
00050000-563c-af7e-0368-b2ef0fdb4763	3224	Dobje pri Planini
00050000-563c-af7e-a439-60054036f224	8257	Dobova
00050000-563c-af7e-5e0a-b3bdaa3b6910	1423	Dobovec
00050000-563c-af7e-9ebd-1b333804e691	5263	Dobravlje
00050000-563c-af7e-7485-50711e2f438d	3204	Dobrna
00050000-563c-af7e-e5a4-21dffb493b44	8211	Dobrnič
00050000-563c-af7e-32dd-7e0d249ebbbb	1356	Dobrova
00050000-563c-af7e-3a94-71ea26bfe055	9223	Dobrovnik/Dobronak 
00050000-563c-af7e-be57-97b040d42948	5212	Dobrovo v Brdih
00050000-563c-af7e-26aa-38cb84e62f0e	1431	Dol pri Hrastniku
00050000-563c-af7e-2cf4-29864f5c2e9f	1262	Dol pri Ljubljani
00050000-563c-af7e-e4d8-badbf9f48245	1273	Dole pri Litiji
00050000-563c-af7e-16e2-5beeacb05e4a	1331	Dolenja vas
00050000-563c-af7e-4fdc-7ac4131458e2	8350	Dolenjske Toplice
00050000-563c-af7e-465d-2d4fd2db55d7	1230	Domžale
00050000-563c-af7e-b585-ef990be25675	2252	Dornava
00050000-563c-af7e-9833-248e66cea54e	5294	Dornberk
00050000-563c-af7e-a02a-b319ede34e07	1319	Draga
00050000-563c-af7e-2ac9-bb8aa3486ac2	8343	Dragatuš
00050000-563c-af7e-90e9-5cf13ab24727	3222	Dramlje
00050000-563c-af7e-f66b-49f65b3d57f5	2370	Dravograd
00050000-563c-af7e-7dda-ab8f55365d5a	4203	Duplje
00050000-563c-af7e-7e45-1937856110d9	6221	Dutovlje
00050000-563c-af7e-b1fb-71bfd11019e4	8361	Dvor
00050000-563c-af7e-e88c-a877ec1247f3	2343	Fala
00050000-563c-af7e-8ac8-bd5fc43230e6	9208	Fokovci
00050000-563c-af7e-54aa-6d78b1b75675	2313	Fram
00050000-563c-af7e-d73a-8f2ace7080a0	3213	Frankolovo
00050000-563c-af7e-2725-cbc137e7cfc9	1274	Gabrovka
00050000-563c-af7e-1163-98f2164f9afa	8254	Globoko
00050000-563c-af7e-3960-31fb83b0c646	5275	Godovič
00050000-563c-af7e-d0d7-1f512605a561	4204	Golnik
00050000-563c-af7e-3a3e-8157299669da	3303	Gomilsko
00050000-563c-af7e-22e8-fbd99e414126	4224	Gorenja vas
00050000-563c-af7e-1cd2-5be08c38f27d	3263	Gorica pri Slivnici
00050000-563c-af7e-4c0c-85bdda1c2451	2272	Gorišnica
00050000-563c-af7e-0796-8fe9ae2a9560	9250	Gornja Radgona
00050000-563c-af7e-34fb-dc7218c0fb73	3342	Gornji Grad
00050000-563c-af7e-3151-963d4963eff9	4282	Gozd Martuljek
00050000-563c-af7e-b7b8-d2d109aa7e69	6272	Gračišče
00050000-563c-af7e-aab3-b303f2eec3b8	9264	Grad
00050000-563c-af7e-e12e-7658a7323b8e	8332	Gradac
00050000-563c-af7e-c26f-45e937a72f1c	1384	Grahovo
00050000-563c-af7e-2868-c67826dd20a5	5242	Grahovo ob Bači
00050000-563c-af7e-5741-0b36f2d95698	5251	Grgar
00050000-563c-af7e-f561-53df9468d9db	3302	Griže
00050000-563c-af7e-6820-29d2064cea64	3231	Grobelno
00050000-563c-af7e-6700-f5d6a00dc2b2	1290	Grosuplje
00050000-563c-af7e-e54c-32ce33730c0d	2288	Hajdina
00050000-563c-af7e-0ec8-9317948d9164	8362	Hinje
00050000-563c-af7e-cc10-56725ec13a01	2311	Hoče
00050000-563c-af7e-b4de-6a8ee2cc7ed2	9205	Hodoš/Hodos
00050000-563c-af7e-f546-0803e83b6dd4	1354	Horjul
00050000-563c-af7e-7fe9-41921a8cec17	1372	Hotedršica
00050000-563c-af7e-225c-b67a2f1465c1	1430	Hrastnik
00050000-563c-af7e-4934-59ca7556f4c6	6225	Hruševje
00050000-563c-af7e-385f-ea09cb7fb9d4	4276	Hrušica
00050000-563c-af7e-f524-45047b37a161	5280	Idrija
00050000-563c-af7e-3264-9058271e959e	1292	Ig
00050000-563c-af7e-ffaa-3732e2bbf593	6250	Ilirska Bistrica
00050000-563c-af7e-dae8-1b5a99d633f8	6251	Ilirska Bistrica-Trnovo
00050000-563c-af7e-3845-34d8ab58a2f1	1295	Ivančna Gorica
00050000-563c-af7e-555b-9b3dec10934f	2259	Ivanjkovci
00050000-563c-af7e-5558-0eda967a1683	1411	Izlake
00050000-563c-af7e-3151-29a7caec08ea	6310	Izola/Isola
00050000-563c-af7e-e438-5738fe531c6a	2222	Jakobski Dol
00050000-563c-af7e-52f8-19d85ee11c3b	2221	Jarenina
00050000-563c-af7e-0a87-d3f478a02458	6254	Jelšane
00050000-563c-af7e-cd87-2af0cb8a8b4d	4270	Jesenice
00050000-563c-af7e-dc79-5344e265307e	8261	Jesenice na Dolenjskem
00050000-563c-af7e-f1b5-c45b68dea9d2	3273	Jurklošter
00050000-563c-af7e-cc96-a130b28052dd	2223	Jurovski Dol
00050000-563c-af7e-33ef-877e4d9ff451	2256	Juršinci
00050000-563c-af7e-1e97-14dc206a2eae	5214	Kal nad Kanalom
00050000-563c-af7e-468f-5daf4bd02424	3233	Kalobje
00050000-563c-af7e-5da2-d27b919022ba	4246	Kamna Gorica
00050000-563c-af7e-699f-3c8c9a61d81d	2351	Kamnica
00050000-563c-af7e-e2fa-0b8ca9747766	1241	Kamnik
00050000-563c-af7e-425e-c7d69d48be35	5213	Kanal
00050000-563c-af7e-03aa-f7ce40b2b3cb	8258	Kapele
00050000-563c-af7e-aeb0-8fb3c19f8865	2362	Kapla
00050000-563c-af7e-67de-8f5ea70809a9	2325	Kidričevo
00050000-563c-af7e-8690-a4bbb618621b	1412	Kisovec
00050000-563c-af7e-8f0f-dac31dcf2ccd	6253	Knežak
00050000-563c-af7e-deb5-1c3dbaba2d78	5222	Kobarid
00050000-563c-af7e-4465-17c1137a4d3b	9227	Kobilje
00050000-563c-af7e-b5d7-d3346fc60485	1330	Kočevje
00050000-563c-af7e-69e7-7bbda0f3df69	1338	Kočevska Reka
00050000-563c-af7e-580b-229e0fc77873	2276	Kog
00050000-563c-af7e-83e6-e5cfa2dc564a	5211	Kojsko
00050000-563c-af7e-aa10-4e858bf98e9e	6223	Komen
00050000-563c-af7e-7e7f-26177115315b	1218	Komenda
00050000-563c-af7e-1e63-41a93532574b	6000	Koper/Capodistria 
00050000-563c-af7e-6174-93cc07a5bf63	6001	Koper/Capodistria - poštni predali
00050000-563c-af7e-8bd7-9bd8eae6ceaf	8282	Koprivnica
00050000-563c-af7e-f364-50c745a954c8	5296	Kostanjevica na Krasu
00050000-563c-af7e-9f84-b1b52f1130a0	8311	Kostanjevica na Krki
00050000-563c-af7e-012a-04d670cb125e	1336	Kostel
00050000-563c-af7e-5166-be6a3913e681	6256	Košana
00050000-563c-af7e-2a7a-ba306517a319	2394	Kotlje
00050000-563c-af7e-7126-59ce07561beb	6240	Kozina
00050000-563c-af7e-48cb-f84bda0c5fcf	3260	Kozje
00050000-563c-af7e-3325-d6ef8817b9b5	4000	Kranj 
00050000-563c-af7e-035d-51c7ab3551bd	4001	Kranj - poštni predali
00050000-563c-af7e-a70e-176e2ea668ac	4280	Kranjska Gora
00050000-563c-af7e-3c4d-ee0406c9a765	1281	Kresnice
00050000-563c-af7e-1b66-95346bcd62c3	4294	Križe
00050000-563c-af7e-8419-e5b418f13416	9206	Križevci
00050000-563c-af7e-4c27-d6da991e9304	9242	Križevci pri Ljutomeru
00050000-563c-af7e-3530-6c6db5ce978c	1301	Krka
00050000-563c-af7e-df5f-f311e7b0ec24	8296	Krmelj
00050000-563c-af7e-f997-b245ae0f8550	4245	Kropa
00050000-563c-af7e-40ff-e6f216f2f701	8262	Krška vas
00050000-563c-af7e-8b7d-c58cc8b7dc73	8270	Krško
00050000-563c-af7e-e212-b92aa60f73ba	9263	Kuzma
00050000-563c-af7e-12ca-b3907ec654a0	2318	Laporje
00050000-563c-af7e-ffa0-3204425ddb76	3270	Laško
00050000-563c-af7e-4888-2c4d9bbd4cd1	1219	Laze v Tuhinju
00050000-563c-af7e-a314-83601545c4a0	2230	Lenart v Slovenskih goricah
00050000-563c-af7e-6dbb-ded54462fddf	9220	Lendava/Lendva
00050000-563c-af7e-5a8f-6de52922e932	4248	Lesce
00050000-563c-af7e-06b1-168222fb4abb	3261	Lesično
00050000-563c-af7e-fdc2-d84a01c8b984	8273	Leskovec pri Krškem
00050000-563c-af7e-e51d-60617e204a4f	2372	Libeliče
00050000-563c-af7e-086f-035dc5d1c8c6	2341	Limbuš
00050000-563c-af7e-260a-dafe90eb1b70	1270	Litija
00050000-563c-af7e-2d6e-092fe1cc3152	3202	Ljubečna
00050000-563c-af7e-64bb-ac21182f7d7d	1000	Ljubljana 
00050000-563c-af7e-697a-649b254c5292	1001	Ljubljana - poštni predali
00050000-563c-af7e-3517-0effecc7a109	1231	Ljubljana - Črnuče
00050000-563c-af7e-d6f6-621d43f964bf	1261	Ljubljana - Dobrunje
00050000-563c-af7e-665c-699770eff9a1	1260	Ljubljana - Polje
00050000-563c-af7e-a24a-6ef3a47697f4	1210	Ljubljana - Šentvid
00050000-563c-af7e-1484-ebb7db9338e2	1211	Ljubljana - Šmartno
00050000-563c-af7e-e37a-08a1bcce708d	3333	Ljubno ob Savinji
00050000-563c-af7e-b6ae-7d3f117da896	9240	Ljutomer
00050000-563c-af7e-250c-2b01030750d9	3215	Loče
00050000-563c-af7e-63d6-8c9b94f0ce18	5231	Log pod Mangartom
00050000-563c-af7e-1281-895d9e7fde34	1358	Log pri Brezovici
00050000-563c-af7e-ef2d-824abd7054b1	1370	Logatec
00050000-563c-af7e-55f0-f35e7546a35e	1371	Logatec
00050000-563c-af7e-b1dc-27d772fb4bed	1434	Loka pri Zidanem Mostu
00050000-563c-af7e-fedc-56fe6e5ff80d	3223	Loka pri Žusmu
00050000-563c-af7e-7ae2-b8681f11d769	6219	Lokev
00050000-563c-af7e-1d52-d882bb37fc8e	1318	Loški Potok
00050000-563c-af7e-6741-3af1566ead26	2324	Lovrenc na Dravskem polju
00050000-563c-af7e-2c37-3cefc8247e96	2344	Lovrenc na Pohorju
00050000-563c-af7e-9c4b-5c58050c41b1	3334	Luče
00050000-563c-af7e-f38f-7a01a74f8e3d	1225	Lukovica
00050000-563c-af7e-c62d-596bf167a8ce	9202	Mačkovci
00050000-563c-af7e-96ac-71b1471ca61e	2322	Majšperk
00050000-563c-af7e-ed61-5a1081b5d87e	2321	Makole
00050000-563c-af7e-efd7-fbca03a0e9e8	9243	Mala Nedelja
00050000-563c-af7e-b327-76447ecae8d5	2229	Malečnik
00050000-563c-af7e-9941-24262a72a202	6273	Marezige
00050000-563c-af7e-0f72-7b5d1b92018f	2000	Maribor 
00050000-563c-af7e-0233-696d8a2cd99e	2001	Maribor - poštni predali
00050000-563c-af7e-21c6-79063eed7291	2206	Marjeta na Dravskem polju
00050000-563c-af7e-5619-4b978580312f	2281	Markovci
00050000-563c-af7e-2870-ba227affeef0	9221	Martjanci
00050000-563c-af7e-167a-5a180976e2e7	6242	Materija
00050000-563c-af7e-86a2-c254cd21cec5	4211	Mavčiče
00050000-563c-af7e-fc31-7485740a5c39	1215	Medvode
00050000-563c-af7e-3828-b4c5b46ae1e4	1234	Mengeš
00050000-563c-af7e-21d4-1c50413e7f32	8330	Metlika
00050000-563c-af7e-67d2-8ba4a22baf94	2392	Mežica
00050000-563c-af7e-696c-e397243ba2a7	2204	Miklavž na Dravskem polju
00050000-563c-af7e-1bc2-48a8d01632fc	2275	Miklavž pri Ormožu
00050000-563c-af7e-f155-1c5e23866e3f	5291	Miren
00050000-563c-af7e-9c1a-76ff0a60e0da	8233	Mirna
00050000-563c-af7e-c6ec-ce1cc507fbd4	8216	Mirna Peč
00050000-563c-af7e-78a2-76f1ecb37b4e	2382	Mislinja
00050000-563c-af7e-69b5-b9956ef79029	4281	Mojstrana
00050000-563c-af7e-7889-fbd3fc74c44d	8230	Mokronog
00050000-563c-af7e-aca2-84fe0bc33300	1251	Moravče
00050000-563c-af7e-4cd7-2265e65c4ed3	9226	Moravske Toplice
00050000-563c-af7e-bd5f-c649f85de5c1	5216	Most na Soči
00050000-563c-af7e-8f88-68cbbe6de10e	1221	Motnik
00050000-563c-af7e-0abd-18d3949f6d1d	3330	Mozirje
00050000-563c-af7e-4d93-efae44a869f7	9000	Murska Sobota 
00050000-563c-af7e-f69f-63b09de9bd3b	9001	Murska Sobota - poštni predali
00050000-563c-af7e-55e1-9ad965ef2a7b	2366	Muta
00050000-563c-af7e-3870-66aabf95820f	4202	Naklo
00050000-563c-af7e-1660-24566d95ec49	3331	Nazarje
00050000-563c-af7e-542f-fd8bc41f706e	1357	Notranje Gorice
00050000-563c-af7e-0a97-ba7d1b9b4d25	3203	Nova Cerkev
00050000-563c-af7e-0cbd-38a2ea96453e	5000	Nova Gorica 
00050000-563c-af7e-9cb3-e085ba7db2a9	5001	Nova Gorica - poštni predali
00050000-563c-af7e-8dfb-f2c45adb7daf	1385	Nova vas
00050000-563c-af7e-6195-800142816f11	8000	Novo mesto
00050000-563c-af7e-8772-c1bcb11b0ae9	8001	Novo mesto - poštni predali
00050000-563c-af7e-72d3-09d013bf9357	6243	Obrov
00050000-563c-af7e-988a-7fb9d5897778	9233	Odranci
00050000-563c-af7e-97b4-2c73d6778ede	2317	Oplotnica
00050000-563c-af7e-4848-24c976d4aacb	2312	Orehova vas
00050000-563c-af7e-6826-f802034493b2	2270	Ormož
00050000-563c-af7e-14eb-25c5507d6b55	1316	Ortnek
00050000-563c-af7e-aaf6-21a5aa6e1cd5	1337	Osilnica
00050000-563c-af7e-ea12-c7ac688d5fec	8222	Otočec
00050000-563c-af7e-caaa-ded8371dd8c6	2361	Ožbalt
00050000-563c-af7e-afa7-3dec919c0bdc	2231	Pernica
00050000-563c-af7e-2da0-6a71666a3c8f	2211	Pesnica pri Mariboru
00050000-563c-af7e-cac5-d9fbbe7db269	9203	Petrovci
00050000-563c-af7e-2d59-5252058122d5	3301	Petrovče
00050000-563c-af7e-8dfe-bf3a3e2c067e	6330	Piran/Pirano
00050000-563c-af7e-3863-8c875c63286c	8255	Pišece
00050000-563c-af7e-36e6-0cf244411441	6257	Pivka
00050000-563c-af7e-23fd-68b80994d396	6232	Planina
00050000-563c-af7e-b599-d77de6128b86	3225	Planina pri Sevnici
00050000-563c-af7e-812a-6aa6c883152a	6276	Pobegi
00050000-563c-af7e-f9d5-4612f5e9fb77	8312	Podbočje
00050000-563c-af7e-b54d-59f756a507b2	5243	Podbrdo
00050000-563c-af7e-5b6a-f5c4974f77fa	3254	Podčetrtek
00050000-563c-af7e-2e9c-3f1675807e5e	2273	Podgorci
00050000-563c-af7e-00de-27a21f248107	6216	Podgorje
00050000-563c-af7e-ba88-51202eacf6e9	2381	Podgorje pri Slovenj Gradcu
00050000-563c-af7e-64ba-c585e9488cdf	6244	Podgrad
00050000-563c-af7e-c0ce-39267a39c827	1414	Podkum
00050000-563c-af7e-7398-7b7b3842a071	2286	Podlehnik
00050000-563c-af7e-eff2-dc02afd94bae	5272	Podnanos
00050000-563c-af7e-830e-92f2910d042f	4244	Podnart
00050000-563c-af7e-d2ab-dae674a05deb	3241	Podplat
00050000-563c-af7e-e893-35742aa24906	3257	Podsreda
00050000-563c-af7e-3d42-ce7a1f70f62c	2363	Podvelka
00050000-563c-af7e-a028-4a839ec66875	2208	Pohorje
00050000-563c-af7e-6897-36d07b4515c3	2257	Polenšak
00050000-563c-af7e-1ed2-48d24908ae33	1355	Polhov Gradec
00050000-563c-af7e-bc56-eb043c370aae	4223	Poljane nad Škofjo Loko
00050000-563c-af7e-ebbe-7a7f058e00d7	2319	Poljčane
00050000-563c-af7e-16b3-c1239ce775b2	1272	Polšnik
00050000-563c-af7e-daad-d509cf24df03	3313	Polzela
00050000-563c-af7e-341c-1331e5dbbc78	3232	Ponikva
00050000-563c-af7e-26ce-c5c2b87fc9ac	6320	Portorož/Portorose
00050000-563c-af7e-ecb5-eb3f326988ea	6230	Postojna
00050000-563c-af7e-89a9-ffa69bce9a1f	2331	Pragersko
00050000-563c-af7e-fe84-bd9645cbcc18	3312	Prebold
00050000-563c-af7e-152d-3f02cab08f94	4205	Preddvor
00050000-563c-af7e-f3ca-32fc70e87bfb	6255	Prem
00050000-563c-af7e-eb08-57c6527345b8	1352	Preserje
00050000-563c-af7e-a498-4189f076d319	6258	Prestranek
00050000-563c-af7e-b592-bbb2f3af9b8c	2391	Prevalje
00050000-563c-af7e-e3b1-7393a808a9d1	3262	Prevorje
00050000-563c-af7e-3406-a7cf77ccfee6	1276	Primskovo 
00050000-563c-af7e-9356-d52287e9ba6a	3253	Pristava pri Mestinju
00050000-563c-af7e-7435-f6720d96d869	9207	Prosenjakovci/Partosfalva
00050000-563c-af7e-c51b-a38e45e3e4a1	5297	Prvačina
00050000-563c-af7e-5099-cc4789b94456	2250	Ptuj
00050000-563c-af7e-1753-f65a7365e2f4	2323	Ptujska Gora
00050000-563c-af7e-426e-23e019bbb531	9201	Puconci
00050000-563c-af7e-8f58-241afbcb600f	2327	Rače
00050000-563c-af7e-a469-6dac8d79611c	1433	Radeče
00050000-563c-af7e-0130-eb9e899e9f45	9252	Radenci
00050000-563c-af7e-56ba-8b15164788fc	2360	Radlje ob Dravi
00050000-563c-af7e-1005-792f598666be	1235	Radomlje
00050000-563c-af7e-1442-cd8ccbbb089c	4240	Radovljica
00050000-563c-af7e-11ca-faff5f8568f0	8274	Raka
00050000-563c-af7e-7cd7-f7997a96ae3a	1381	Rakek
00050000-563c-af7e-116f-026a8b928505	4283	Rateče - Planica
00050000-563c-af7e-6483-4c00c82bdecf	2390	Ravne na Koroškem
00050000-563c-af7e-6a58-e44d42583012	9246	Razkrižje
00050000-563c-af7e-d021-e866cd474ed0	3332	Rečica ob Savinji
00050000-563c-af7e-2962-2c30bc365444	5292	Renče
00050000-563c-af7e-229b-c50943beadee	1310	Ribnica
00050000-563c-af7e-0d9c-497f50753d29	2364	Ribnica na Pohorju
00050000-563c-af7e-c5ad-6180093a18ab	3272	Rimske Toplice
00050000-563c-af7e-9d62-8ccbb5064911	1314	Rob
00050000-563c-af7e-1620-71b899896e92	5215	Ročinj
00050000-563c-af7e-5ff4-bb3c80f9ae38	3250	Rogaška Slatina
00050000-563c-af7e-94c5-300c0b156b2a	9262	Rogašovci
00050000-563c-af7e-4d4c-f140022590a7	3252	Rogatec
00050000-563c-af7e-ebe1-ca30019c12ba	1373	Rovte
00050000-563c-af7e-5c9f-aec4cd0c2a36	2342	Ruše
00050000-563c-af7e-72de-052e29c6a1db	1282	Sava
00050000-563c-af7e-cbf6-0af391869546	6333	Sečovlje/Sicciole
00050000-563c-af7e-c122-4cb3793e5ead	4227	Selca
00050000-563c-af7e-30c7-33ab095b0fec	2352	Selnica ob Dravi
00050000-563c-af7e-d5b4-c24719190d5e	8333	Semič
00050000-563c-af7e-25b0-77a8ccbb2dc8	8281	Senovo
00050000-563c-af7e-5d17-9fa1c02813d6	6224	Senožeče
00050000-563c-af7e-28a4-e2ba708dc4a6	8290	Sevnica
00050000-563c-af7e-c972-42284f36833b	6210	Sežana
00050000-563c-af7e-82df-3ecd73668be5	2214	Sladki Vrh
00050000-563c-af7e-19dc-2fcdb76f9411	5283	Slap ob Idrijci
00050000-563c-af7e-d190-fdf71c90c506	2380	Slovenj Gradec
00050000-563c-af7e-5aa2-0e33a5436d5e	2310	Slovenska Bistrica
00050000-563c-af7e-0241-d1531d67aba8	3210	Slovenske Konjice
00050000-563c-af7e-c0eb-ec1b34a28078	1216	Smlednik
00050000-563c-af7e-2ea6-5e08d0b02bc4	5232	Soča
00050000-563c-af7e-440a-c673d5a7db18	1317	Sodražica
00050000-563c-af7e-6ae0-00f0f78b5070	3335	Solčava
00050000-563c-af7e-26f5-0d603c318e3f	5250	Solkan
00050000-563c-af7e-67e6-22bfb0916a4d	4229	Sorica
00050000-563c-af7e-d800-e668c7360a0d	4225	Sovodenj
00050000-563c-af7e-da44-2358e2de01d4	5281	Spodnja Idrija
00050000-563c-af7e-e374-1423b738310a	2241	Spodnji Duplek
00050000-563c-af7e-e3a4-3a2147ac7357	9245	Spodnji Ivanjci
00050000-563c-af7e-5f95-b2f6a962571b	2277	Središče ob Dravi
00050000-563c-af7e-e21b-146bd591634b	4267	Srednja vas v Bohinju
00050000-563c-af7e-28e3-fb4d64755c4b	8256	Sromlje 
00050000-563c-af7e-f4f6-bfb569471725	5224	Srpenica
00050000-563c-af7e-744d-de496cf8bcb4	1242	Stahovica
00050000-563c-af7e-9425-d650461d2c19	1332	Stara Cerkev
00050000-563c-af7e-b8d2-c9c82b529461	8342	Stari trg ob Kolpi
00050000-563c-af7e-82b7-6d64ec46d0c4	1386	Stari trg pri Ložu
00050000-563c-af7e-b2a8-ac5f55dc98c7	2205	Starše
00050000-563c-af7e-b02d-65390b1814ad	2289	Stoperce
00050000-563c-af7e-3c1b-e30b86b21ceb	8322	Stopiče
00050000-563c-af7e-fdce-c05ea6a175bc	3206	Stranice
00050000-563c-af7e-a06f-92c42fd1c80a	8351	Straža
00050000-563c-af7e-f19c-574c3a320683	1313	Struge
00050000-563c-af7e-82f1-2501dc41b210	8293	Studenec
00050000-563c-af7e-71f7-b5160ab8a654	8331	Suhor
00050000-563c-af7e-4ac5-bb4270a106f4	2233	Sv. Ana v Slovenskih goricah
00050000-563c-af7e-0906-1dd64fa0389d	2235	Sv. Trojica v Slovenskih goricah
00050000-563c-af7e-466f-d67fdd2113ef	2353	Sveti Duh na Ostrem Vrhu
00050000-563c-af7e-1393-c5280203422d	9244	Sveti Jurij ob Ščavnici
00050000-563c-af7e-d329-414744d6be15	3264	Sveti Štefan
00050000-563c-af7e-ce68-83e28acc1863	2258	Sveti Tomaž
00050000-563c-af7e-052d-f4efbf96c6ed	9204	Šalovci
00050000-563c-af7e-0879-3a372638a38c	5261	Šempas
00050000-563c-af7e-f20c-ad2a44ab1714	5290	Šempeter pri Gorici
00050000-563c-af7e-36a7-a0a0f3232f53	3311	Šempeter v Savinjski dolini
00050000-563c-af7e-aa26-16eeb39cdb5f	4208	Šenčur
00050000-563c-af7e-5469-2b34522f4f47	2212	Šentilj v Slovenskih goricah
00050000-563c-af7e-18a5-54e6893c2d46	8297	Šentjanž
00050000-563c-af7e-ed9d-994236904dae	2373	Šentjanž pri Dravogradu
00050000-563c-af7e-2e3b-f51916db5963	8310	Šentjernej
00050000-563c-af7e-c668-599aefc446d7	3230	Šentjur
00050000-563c-af7e-cdfa-18abbdf01f07	3271	Šentrupert
00050000-563c-af7e-88f2-11c4cef2fb29	8232	Šentrupert
00050000-563c-af7e-5047-dec4a8de97dd	1296	Šentvid pri Stični
00050000-563c-af7e-aaaa-80573729d18a	8275	Škocjan
00050000-563c-af7e-4357-f31362973a31	6281	Škofije
00050000-563c-af7e-d467-2c0427f8d9c5	4220	Škofja Loka
00050000-563c-af7e-fad3-24a63c224952	3211	Škofja vas
00050000-563c-af7e-bb7b-60b8131a54c6	1291	Škofljica
00050000-563c-af7e-7d92-e37b7fce2198	6274	Šmarje
00050000-563c-af7e-9247-247ff6ecedd0	1293	Šmarje - Sap
00050000-563c-af7e-126f-4488a894af4b	3240	Šmarje pri Jelšah
00050000-563c-af7e-ca6e-1426e331c706	8220	Šmarješke Toplice
00050000-563c-af7e-db78-32ebc1a30098	2315	Šmartno na Pohorju
00050000-563c-af7e-6249-8b4b2d4b673e	3341	Šmartno ob Dreti
00050000-563c-af7e-6eb2-00bbbc002765	3327	Šmartno ob Paki
00050000-563c-af7e-2c77-bedd6067f649	1275	Šmartno pri Litiji
00050000-563c-af7e-e101-20e7ecf795cd	2383	Šmartno pri Slovenj Gradcu
00050000-563c-af7e-5f00-6dd5208c86ef	3201	Šmartno v Rožni dolini
00050000-563c-af7e-c9b7-40e2d6eb7349	3325	Šoštanj
00050000-563c-af7e-4265-c56888ad2a87	6222	Štanjel
00050000-563c-af7e-4264-98b2db1239d4	3220	Štore
00050000-563c-af7e-ca58-c5d60176ef67	3304	Tabor
00050000-563c-af7e-c890-1ecfaf834233	3221	Teharje
00050000-563c-af7e-7c75-fd61dc7223f4	9251	Tišina
00050000-563c-af7e-a4a5-f3f506009332	5220	Tolmin
00050000-563c-af7e-c3e4-98f5f07f2a11	3326	Topolšica
00050000-563c-af7e-2791-1b79ac14323b	2371	Trbonje
00050000-563c-af7e-77ee-93d142e1685f	1420	Trbovlje
00050000-563c-af7e-bb01-333d9d156262	8231	Trebelno 
00050000-563c-af7e-9ef6-f49e1307372e	8210	Trebnje
00050000-563c-af7e-7853-a89807683b47	5252	Trnovo pri Gorici
00050000-563c-af7e-63da-d549ad5506e0	2254	Trnovska vas
00050000-563c-af7e-64f5-4115919c6636	1222	Trojane
00050000-563c-af7e-5bd5-8b230db1b3af	1236	Trzin
00050000-563c-af7e-29fb-06ed8434b608	4290	Tržič
00050000-563c-af7e-b364-2d27e4fc5f63	8295	Tržišče
00050000-563c-af7e-a073-37ea1f320df5	1311	Turjak
00050000-563c-af7e-f786-4623d0c13f4e	9224	Turnišče
00050000-563c-af7e-3734-4a8d8741fe26	8323	Uršna sela
00050000-563c-af7e-2f16-18d7257665ea	1252	Vače
00050000-563c-af7e-19d7-ca6d48410b5a	3320	Velenje 
00050000-563c-af7e-6ffd-7d2d20506aa6	3322	Velenje - poštni predali
00050000-563c-af7e-6d88-0f3b88ac6050	8212	Velika Loka
00050000-563c-af7e-7a28-88a23d569d4a	2274	Velika Nedelja
00050000-563c-af7e-5ee3-17a27fa8b3f0	9225	Velika Polana
00050000-563c-af7e-2f34-fb96472804b2	1315	Velike Lašče
00050000-563c-af7e-3640-f0c1059ae3ce	8213	Veliki Gaber
00050000-563c-af7e-c200-bdfc01c859a0	9241	Veržej
00050000-563c-af7e-d61b-e039efc263ce	1312	Videm - Dobrepolje
00050000-563c-af7e-f9f1-1b240ad25b11	2284	Videm pri Ptuju
00050000-563c-af7e-45cd-df0243da83dc	8344	Vinica
00050000-563c-af7e-6378-1e63506e6b3b	5271	Vipava
00050000-563c-af7e-6510-ffd9cdf4d32d	4212	Visoko
00050000-563c-af7e-d762-7fa368e7636f	1294	Višnja Gora
00050000-563c-af7e-629b-4f7aeda21d2c	3205	Vitanje
00050000-563c-af7e-6869-e7c0c10157ad	2255	Vitomarci
00050000-563c-af7e-da6e-1b14fb371f4e	1217	Vodice
00050000-563c-af7e-f5a3-8d895c2aca7d	3212	Vojnik\t
00050000-563c-af7e-0ae0-381e4edde956	5293	Volčja Draga
00050000-563c-af7e-d1e5-103a89a710db	2232	Voličina
00050000-563c-af7e-44aa-c8018f26476b	3305	Vransko
00050000-563c-af7e-2115-7e1d480857aa	6217	Vremski Britof
00050000-563c-af7e-c30a-a456f0545e05	1360	Vrhnika
00050000-563c-af7e-0247-712016f7c886	2365	Vuhred
00050000-563c-af7e-d9f5-5a06de9608ea	2367	Vuzenica
00050000-563c-af7e-8538-6bb79464f254	8292	Zabukovje 
00050000-563c-af7e-63d0-568ce01436f4	1410	Zagorje ob Savi
00050000-563c-af7e-340a-4d95fc32d8e0	1303	Zagradec
00050000-563c-af7e-cd0e-4954b4dcd2a8	2283	Zavrč
00050000-563c-af7e-fa73-d643e8d38a1e	8272	Zdole 
00050000-563c-af7e-95bf-ceb8b4d7e99d	4201	Zgornja Besnica
00050000-563c-af7e-404b-b6b6710e433e	2242	Zgornja Korena
00050000-563c-af7e-6225-fd124ac75b10	2201	Zgornja Kungota
00050000-563c-af7e-7a78-48457f013fc2	2316	Zgornja Ložnica
00050000-563c-af7e-1d74-358a81ea820d	2314	Zgornja Polskava
00050000-563c-af7e-0d09-583b9c07f517	2213	Zgornja Velka
00050000-563c-af7e-9c08-8f7f1374cbaa	4247	Zgornje Gorje
00050000-563c-af7e-d1bb-39f79aac0380	4206	Zgornje Jezersko
00050000-563c-af7e-7140-c961d7893395	2285	Zgornji Leskovec
00050000-563c-af7e-b827-e6ba00757255	1432	Zidani Most
00050000-563c-af7e-6e1e-0cee6720e331	3214	Zreče
00050000-563c-af7e-1c2f-063f1d7e5998	4209	Žabnica
00050000-563c-af7e-0d30-7db0a427d377	3310	Žalec
00050000-563c-af7e-90c2-286b12a239ef	4228	Železniki
00050000-563c-af7e-ce27-873cfc80e055	2287	Žetale
00050000-563c-af7e-d774-d8de81547ee0	4226	Žiri
00050000-563c-af7e-e46f-0753a7c1f25a	4274	Žirovnica
00050000-563c-af7e-68f8-c99f10d82155	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25462239)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25461815)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25461563)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-563c-af80-6d1d-c2fc4eb35632	00080000-563c-af80-1f13-3fcee27329c4	\N	00040000-563c-af7e-8f9c-f694b029b392	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-563c-af80-d2fa-22900a023c2c	00080000-563c-af80-1f13-3fcee27329c4	\N	00040000-563c-af7e-8f9c-f694b029b392	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-563c-af80-fdee-dea8c9d1ff0a	00080000-563c-af80-4726-8bce2e7cde5f	\N	00040000-563c-af7e-8f9c-f694b029b392	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25461707)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-563c-af7e-22c0-11b16394a5e4	novo leto	1	1	\N	t
00430000-563c-af7e-3a68-df60a52a1b09	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-563c-af7e-33d6-14702abd85a0	dan upora proti okupatorju	27	4	\N	t
00430000-563c-af7e-0271-cc33d4dbc864	praznik dela	1	5	\N	t
00430000-563c-af7e-5e5d-7e388cbadf61	praznik dela	2	5	\N	t
00430000-563c-af7e-41f6-ad3966a8d1ce	dan Primoža Trubarja	8	6	\N	f
00430000-563c-af7e-bf7d-c43a96035d40	dan državnosti	25	6	\N	t
00430000-563c-af7e-8653-565365ec985e	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-563c-af7e-9a0e-d3da4ce83b20	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-563c-af7e-8474-38fd70f4051c	dan suverenosti	25	10	\N	f
00430000-563c-af7e-c3f4-cad0a43860b9	dan spomina na mrtve	1	11	\N	t
00430000-563c-af7e-a3e3-30ec8b378c3c	dan Rudolfa Maistra	23	11	\N	f
00430000-563c-af7e-cc36-1db382045e15	božič	25	12	\N	t
00430000-563c-af7e-cef2-7cc1260664ea	dan samostojnosti in enotnosti	26	12	\N	t
00430000-563c-af7e-e721-d6ba34cbd32e	Marijino vnebovzetje	15	8	\N	t
00430000-563c-af7e-058f-813d1c303265	dan reformacije	31	10	\N	t
00430000-563c-af7e-3325-73dd2ea8dbac	velikonočna nedelja	27	3	2016	t
00430000-563c-af7e-81a2-8f7fde2df8f7	velikonočna nedelja	16	4	2017	t
00430000-563c-af7e-ba96-6badde12d29e	velikonočna nedelja	1	4	2018	t
00430000-563c-af7e-16de-4d8b3eb2a302	velikonočna nedelja	21	4	2019	t
00430000-563c-af7e-8d1d-a0845770e62c	velikonočna nedelja	12	4	2020	t
00430000-563c-af7e-fe6a-7d0955e1898d	velikonočna nedelja	4	4	2021	t
00430000-563c-af7e-a427-44edf53400a0	velikonočna nedelja	17	4	2022	t
00430000-563c-af7e-9b2f-83857f8c0914	velikonočna nedelja	9	4	2023	t
00430000-563c-af7e-803b-8da3fabb3860	velikonočna nedelja	31	3	2024	t
00430000-563c-af7e-871f-12c75e6495de	velikonočna nedelja	20	4	2025	t
00430000-563c-af7e-da63-6c83a98c0901	velikonočna nedelja	5	4	2026	t
00430000-563c-af7e-41d0-084a9b2e9fa6	velikonočna nedelja	28	3	2027	t
00430000-563c-af7e-b39f-85aa1e1707ff	velikonočna nedelja	16	4	2028	t
00430000-563c-af7e-0bc1-30a6df5c5972	velikonočna nedelja	1	4	2029	t
00430000-563c-af7e-1bdb-971d566870c2	velikonočna nedelja	21	4	2030	t
00430000-563c-af7e-1885-428aed2bdfcf	velikonočni ponedeljek	28	3	2016	t
00430000-563c-af7e-5d1d-ad11e803abc5	velikonočni ponedeljek	17	4	2017	t
00430000-563c-af7e-f63d-1f096b961a48	velikonočni ponedeljek	2	4	2018	t
00430000-563c-af7e-4d9e-67424fb204f8	velikonočni ponedeljek	22	4	2019	t
00430000-563c-af7e-5b4c-152afd05dca6	velikonočni ponedeljek	13	4	2020	t
00430000-563c-af7e-ea34-99acd2f56f9f	velikonočni ponedeljek	5	4	2021	t
00430000-563c-af7e-bc10-7a258d024d48	velikonočni ponedeljek	18	4	2022	t
00430000-563c-af7e-283d-899d308840ff	velikonočni ponedeljek	10	4	2023	t
00430000-563c-af7e-ec88-7182fa5bd65d	velikonočni ponedeljek	1	4	2024	t
00430000-563c-af7e-3119-a525a38faecc	velikonočni ponedeljek	21	4	2025	t
00430000-563c-af7e-81fc-543efa6bb577	velikonočni ponedeljek	6	4	2026	t
00430000-563c-af7e-41c4-1441d2dd01e7	velikonočni ponedeljek	29	3	2027	t
00430000-563c-af7e-07d8-7dae91559c32	velikonočni ponedeljek	17	4	2028	t
00430000-563c-af7e-e1e5-1df2b2f4c713	velikonočni ponedeljek	2	4	2029	t
00430000-563c-af7e-4845-ba0b4a0c614a	velikonočni ponedeljek	22	4	2030	t
00430000-563c-af7e-86da-81ca7114e73f	binkoštna nedelja - binkošti	15	5	2016	t
00430000-563c-af7e-ba4c-c75fa93618bc	binkoštna nedelja - binkošti	4	6	2017	t
00430000-563c-af7e-47c4-5a0b383b86c9	binkoštna nedelja - binkošti	20	5	2018	t
00430000-563c-af7e-02bb-7831b6f87ce7	binkoštna nedelja - binkošti	9	6	2019	t
00430000-563c-af7e-a02a-8bccac0cb72c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-563c-af7e-d3c5-1cbcc83d0c53	binkoštna nedelja - binkošti	23	5	2021	t
00430000-563c-af7e-2cfe-3cb7ff95c25f	binkoštna nedelja - binkošti	5	6	2022	t
00430000-563c-af7e-b7d3-c5a721c1b1b7	binkoštna nedelja - binkošti	28	5	2023	t
00430000-563c-af7e-094e-61e33b3aceb0	binkoštna nedelja - binkošti	19	5	2024	t
00430000-563c-af7e-34a8-12b826e64ffd	binkoštna nedelja - binkošti	8	6	2025	t
00430000-563c-af7e-78f6-b8f7f8617302	binkoštna nedelja - binkošti	24	5	2026	t
00430000-563c-af7e-6c80-fa2d2498ee13	binkoštna nedelja - binkošti	16	5	2027	t
00430000-563c-af7e-1159-145218534d64	binkoštna nedelja - binkošti	4	6	2028	t
00430000-563c-af7e-086d-2059ac0ca00f	binkoštna nedelja - binkošti	20	5	2029	t
00430000-563c-af7e-39a5-bf41b69e8e6f	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25461667)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25461679)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25461827)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25462253)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25462263)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-563c-af80-4f2f-136f1e8dea0b	00080000-563c-af80-3fbe-24326228ef3a	0987	AK
00190000-563c-af80-b257-42f52c2bdc17	00080000-563c-af80-4726-8bce2e7cde5f	0989	AK
00190000-563c-af80-6e34-b20e95c60c1f	00080000-563c-af80-b9a0-4b82c576006d	0986	AK
00190000-563c-af80-f3dc-55b8707cb616	00080000-563c-af80-504e-879bd1d14711	0984	AK
00190000-563c-af80-090a-66403c39065b	00080000-563c-af80-491a-3632fb8813fc	0983	AK
00190000-563c-af80-2afc-f72e42364893	00080000-563c-af80-ce17-f34e7fda8762	0982	AK
00190000-563c-af82-c8dc-3bdef6b26ae1	00080000-563c-af82-6c67-5b633d369bbe	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25462162)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-563c-af81-2bb5-8f1be999024f	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25462271)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25461856)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-563c-af80-4521-0e3a635ecd1b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-563c-af80-bf8e-07ab6d145836	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-563c-af80-67c9-058cfc5a7263	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-563c-af80-1388-58d4afe12c4a	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-563c-af80-20c6-8aace84219cc	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-563c-af80-263b-a530c26af281	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-563c-af80-01f5-5f1ba6f7db79	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25461800)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25461790)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25462001)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25461931)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25461641)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25461403)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-563c-af82-6c67-5b633d369bbe	00010000-563c-af7f-b3a5-491453e86dc8	2015-11-06 14:47:46	INS	a:0:{}
2	App\\Entity\\Option	00000000-563c-af82-40ca-75f54560ad7f	00010000-563c-af7f-b3a5-491453e86dc8	2015-11-06 14:47:46	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-563c-af82-c8dc-3bdef6b26ae1	00010000-563c-af7f-b3a5-491453e86dc8	2015-11-06 14:47:46	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25461869)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25461441)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-563c-af7f-7539-c1cffd21f515	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-563c-af7f-c516-9652a3f74ef7	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-563c-af7f-923c-5fa61babdd60	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-563c-af7f-c9a7-114a13016ece	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-563c-af7f-c749-cae58a9e4d24	planer	Planer dogodkov v koledarju	t
00020000-563c-af7f-765f-520d9b4558c0	kadrovska	Kadrovska služba	t
00020000-563c-af7f-8573-cc9c1ab728a6	arhivar	Ažuriranje arhivalij	t
00020000-563c-af7f-b725-311150abe6cb	igralec	Igralec	t
00020000-563c-af7f-f977-9781ffe4cb10	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-563c-af80-5d88-318a290d37de	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-563c-af80-56ca-cfdfd7588723	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-563c-af80-9a8a-314b290458be	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-563c-af80-5b9f-5130ea6a3a5b	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-563c-af80-2e4d-c4bcf87767c4	Uprizoritev-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3095 (class 0 OID 25461425)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-563c-af7f-5fea-a32ff1a90347	00020000-563c-af7f-923c-5fa61babdd60
00010000-563c-af7f-b3a5-491453e86dc8	00020000-563c-af7f-923c-5fa61babdd60
00010000-563c-af80-6089-76171de99656	00020000-563c-af80-5d88-318a290d37de
00010000-563c-af80-b0cc-905a1699207f	00020000-563c-af80-56ca-cfdfd7588723
00010000-563c-af80-1131-88f152a714df	00020000-563c-af80-9a8a-314b290458be
00010000-563c-af80-b8c6-3fb2dc090223	00020000-563c-af80-9a8a-314b290458be
00010000-563c-af80-b8c6-3fb2dc090223	00020000-563c-af80-5b9f-5130ea6a3a5b
00010000-563c-af80-d1d0-093753c09488	00020000-563c-af80-56ca-cfdfd7588723
00010000-563c-af80-d1d0-093753c09488	00020000-563c-af80-2e4d-c4bcf87767c4
\.


--
-- TOC entry 3140 (class 0 OID 25461883)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25461821)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25461767)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-563c-af80-61d5-5dbb1caf4e1d	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-563c-af80-a116-d0f0f60cde2b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-563c-af80-d8e3-7ff931eebb47	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25461390)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-563c-af7e-d724-dfbb617506ed	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-563c-af7e-f86a-b08779293488	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-563c-af7e-36fa-4bae65a3dbcf	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-563c-af7e-48f1-41f93be3cb26	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-563c-af7e-f95b-9692680fd773	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25461382)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-563c-af7e-e207-a61ed53651e4	00230000-563c-af7e-48f1-41f93be3cb26	popa
00240000-563c-af7e-adb2-94a6619cd0fd	00230000-563c-af7e-48f1-41f93be3cb26	oseba
00240000-563c-af7e-8a87-d3c5e4ae116d	00230000-563c-af7e-48f1-41f93be3cb26	tippopa
00240000-563c-af7e-e04c-a1cc5785b697	00230000-563c-af7e-48f1-41f93be3cb26	organizacijskaenota
00240000-563c-af7e-e3ea-14326da217f0	00230000-563c-af7e-48f1-41f93be3cb26	sezona
00240000-563c-af7e-567e-9907aa411950	00230000-563c-af7e-48f1-41f93be3cb26	tipvaje
00240000-563c-af7e-0d63-0c5736988ebe	00230000-563c-af7e-f86a-b08779293488	prostor
00240000-563c-af7e-ea2d-7a7f81c84fd8	00230000-563c-af7e-48f1-41f93be3cb26	besedilo
00240000-563c-af7e-396a-ded54e1de555	00230000-563c-af7e-48f1-41f93be3cb26	uprizoritev
00240000-563c-af7e-abe6-88dca88f4213	00230000-563c-af7e-48f1-41f93be3cb26	funkcija
00240000-563c-af7e-0af0-c5b48b68d852	00230000-563c-af7e-48f1-41f93be3cb26	tipfunkcije
00240000-563c-af7e-b455-ca4af53e9e00	00230000-563c-af7e-48f1-41f93be3cb26	alternacija
00240000-563c-af7e-e5a2-2499e9ce9ed0	00230000-563c-af7e-d724-dfbb617506ed	pogodba
00240000-563c-af7e-1ced-81bfeb317402	00230000-563c-af7e-48f1-41f93be3cb26	zaposlitev
00240000-563c-af7e-20e4-b24afbc23ad2	00230000-563c-af7e-48f1-41f93be3cb26	zvrstuprizoritve
00240000-563c-af7e-e74d-8cd37b9d6f55	00230000-563c-af7e-d724-dfbb617506ed	programdela
00240000-563c-af7e-61ea-98894be67c37	00230000-563c-af7e-48f1-41f93be3cb26	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25461377)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2a2c1ff3-cd71-46fe-92e8-1e11603dcaed	00240000-563c-af7e-e207-a61ed53651e4	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25461948)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-563c-af81-271c-2f33ce571158	000e0000-563c-af80-eb34-ceacf4ff96c6	00080000-563c-af80-1f13-3fcee27329c4	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-563c-af7e-26c1-b2c56c571243
00270000-563c-af81-fbf7-93870978edad	000e0000-563c-af80-eb34-ceacf4ff96c6	00080000-563c-af80-1f13-3fcee27329c4	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-563c-af7e-26c1-b2c56c571243
\.


--
-- TOC entry 3105 (class 0 OID 25461525)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25461777)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-563c-af81-8d45-7e107995ea20	00180000-563c-af81-6113-b7065267c7da	000c0000-563c-af81-cd91-5deb6a913d4d	00090000-563c-af80-2176-7c59ea965277	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-af81-e9e1-1a12b5d66600	00180000-563c-af81-6113-b7065267c7da	000c0000-563c-af81-b744-287592fca2b3	00090000-563c-af80-fa26-031f5d3876dd	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-af81-d127-be0dde9d57ee	00180000-563c-af81-6113-b7065267c7da	000c0000-563c-af81-d3cd-003b452df097	00090000-563c-af80-3ea7-38d2f89738c4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-af81-a47f-2dc4d58575f9	00180000-563c-af81-6113-b7065267c7da	000c0000-563c-af81-1aa5-ce94f0b73499	00090000-563c-af80-464b-c9ac53b690b1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-af81-62da-96f47f01f577	00180000-563c-af81-6113-b7065267c7da	000c0000-563c-af81-b72e-befefdd80535	00090000-563c-af80-7e27-942c0779bcbb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563c-af81-0cee-b7abfae9659e	00180000-563c-af81-1409-6aad2651811f	\N	00090000-563c-af80-7e27-942c0779bcbb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-563c-af81-613b-44b760be9b9f	00180000-563c-af81-1409-6aad2651811f	\N	00090000-563c-af80-fa26-031f5d3876dd	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25461989)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-563c-af7e-2410-fc3790bb7f9a	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-563c-af7e-92f5-eff4c41095a7	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-563c-af7e-854d-85d32857c229	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-563c-af7e-72fb-d4a2b1fab26d	04	Režija	Režija	Režija	umetnik	30
000f0000-563c-af7e-4c4c-db952be6348d	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-563c-af7e-03aa-7299179a7ebf	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-563c-af7e-3729-5f32be91a1a5	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-563c-af7e-77a1-95ad2f8a4659	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-563c-af7e-9656-550e61d19bb9	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-563c-af7e-bde8-8b4082bc4401	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-563c-af7e-183e-9cca17c0b113	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-563c-af7e-a6cc-596bcfc0e6c9	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-563c-af7e-2ae3-8c5f70561fe6	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-563c-af7e-d031-af79773e498a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-563c-af7e-cc8c-e24b6425841d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-563c-af7e-3311-12f5aa003354	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-563c-af7e-1f0b-45674062147c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-563c-af7e-6f62-fe73fbfff3b1	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25461476)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-563c-af80-9504-5491a928883d	0001	šola	osnovna ali srednja šola
00400000-563c-af80-d5ce-0e1f85cf2875	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-563c-af80-60bb-ff359d936634	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25462282)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-563c-af7e-139b-0f4f230918d2	01	Velika predstava	f	1.00	1.00
002b0000-563c-af7e-dd47-871fa9191626	02	Mala predstava	f	0.50	0.50
002b0000-563c-af7e-aeb1-d0c912886763	03	Mala koprodukcija	t	0.40	1.00
002b0000-563c-af7e-f609-e43dc20b566f	04	Srednja koprodukcija	t	0.70	2.00
002b0000-563c-af7e-72de-15bcfab0538e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25461757)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-563c-af7e-46b0-35f12a7b2d25	0001	prva vaja	prva vaja
00420000-563c-af7e-027d-016a70a3fa69	0002	tehnična vaja	tehnična vaja
00420000-563c-af7e-894f-30e26c0fda06	0003	lučna vaja	lučna vaja
00420000-563c-af7e-ef00-ac141238c96c	0004	kostumska vaja	kostumska vaja
00420000-563c-af7e-81e0-12374a90cb54	0005	foto vaja	foto vaja
00420000-563c-af7e-8039-470c5d2ce8ca	0006	1. glavna vaja	1. glavna vaja
00420000-563c-af7e-6e9d-cd53e8a015cf	0007	2. glavna vaja	2. glavna vaja
00420000-563c-af7e-ba0a-c44eaec5a3dc	0008	1. generalka	1. generalka
00420000-563c-af7e-8dba-8bda837a642f	0009	2. generalka	2. generalka
00420000-563c-af7e-951a-9979ed741343	0010	odprta generalka	odprta generalka
00420000-563c-af7e-9f2d-3c30493e580b	0011	obnovitvena vaja	obnovitvena vaja
00420000-563c-af7e-ce69-4b4abdfbcdb5	0012	pevska vaja	pevska vaja
00420000-563c-af7e-044f-cd3229299c4e	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-563c-af7e-4bba-b1293b805824	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25461598)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25461412)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-563c-af7f-b3a5-491453e86dc8	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO9LGkyl7mLkMpIju1rFZH7SAWjtgVLoW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-563c-af80-5256-289d0d0d6a42	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-563c-af80-e55b-a79a68cd97fd	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-563c-af80-1da1-de5ac42c5128	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-563c-af80-799f-bd7c4339d16d	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-563c-af80-6c5d-ee7da1f8bd79	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-563c-af80-363c-c5860a8cf057	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-563c-af80-e254-d29e1428ef07	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-563c-af80-01fc-016dfb52823c	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-563c-af80-d50a-26acd357b6bc	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-563c-af80-6089-76171de99656	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-563c-af80-c623-19651991b8d0	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-563c-af80-b0cc-905a1699207f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-563c-af80-1131-88f152a714df	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-563c-af80-b8c6-3fb2dc090223	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-563c-af80-d1d0-093753c09488	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-563c-af7f-5fea-a32ff1a90347	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25462039)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-563c-af80-3f08-3277fd5455a1	00160000-563c-af80-c8f7-b4c7ba4c8322	\N	00140000-563c-af7e-715a-16f02baca784	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-563c-af80-20c6-8aace84219cc
000e0000-563c-af80-eb34-ceacf4ff96c6	00160000-563c-af80-91a7-6f4b67546bdd	\N	00140000-563c-af7e-0073-2d1c45ee6239	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-563c-af80-263b-a530c26af281
000e0000-563c-af80-a664-812c10c949b0	\N	\N	00140000-563c-af7e-0073-2d1c45ee6239	00190000-563c-af80-4f2f-136f1e8dea0b	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563c-af80-20c6-8aace84219cc
000e0000-563c-af80-0412-b8473f36967b	\N	\N	00140000-563c-af7e-0073-2d1c45ee6239	00190000-563c-af80-4f2f-136f1e8dea0b	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563c-af80-20c6-8aace84219cc
000e0000-563c-af80-3937-686dbfc97951	\N	\N	00140000-563c-af7e-0073-2d1c45ee6239	00190000-563c-af80-4f2f-136f1e8dea0b	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-563c-af80-4521-0e3a635ecd1b
000e0000-563c-af80-51b7-6430ff0cbf99	\N	\N	00140000-563c-af7e-0073-2d1c45ee6239	00190000-563c-af80-4f2f-136f1e8dea0b	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-563c-af80-4521-0e3a635ecd1b
\.


--
-- TOC entry 3119 (class 0 OID 25461697)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-563c-af81-3b8d-04326d268ba2	\N	000e0000-563c-af80-eb34-ceacf4ff96c6	1	
00200000-563c-af81-0362-5744bbf37e31	\N	000e0000-563c-af80-eb34-ceacf4ff96c6	2	
00200000-563c-af81-f58c-dda88bc0317a	\N	000e0000-563c-af80-eb34-ceacf4ff96c6	3	
00200000-563c-af81-f9e4-aeb8c6a4854e	\N	000e0000-563c-af80-eb34-ceacf4ff96c6	4	
00200000-563c-af81-5a12-4543c7907a14	\N	000e0000-563c-af80-eb34-ceacf4ff96c6	5	
\.


--
-- TOC entry 3136 (class 0 OID 25461848)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25461962)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-563c-af7e-6f75-511346951fea	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-563c-af7e-c21e-9418a33d4248	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-563c-af7e-0e48-945f6e6efe4d	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-563c-af7e-9782-c60dc582112b	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-563c-af7e-89b1-b8e623cec4f4	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-563c-af7e-47ed-c6672dbb18ac	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-563c-af7e-30ee-dfacf98abf3d	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-563c-af7e-9e86-d801159f3cf3	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-563c-af7e-26c1-b2c56c571243	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-563c-af7e-020e-f1548a370d99	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-563c-af7e-3588-bf318f638466	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-563c-af7e-34c1-88b725e0a1ec	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-563c-af7e-61f6-e439f80bd408	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-563c-af7e-8563-9f8c0faa7c24	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-563c-af7e-865a-834fb7a88f1a	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-563c-af7e-d231-ef81fb0ae17b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-563c-af7e-a007-86ed3f1c06f7	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-563c-af7e-8776-f74760f2c3f0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-563c-af7e-4088-7f7b90de6f1a	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-563c-af7e-578a-4a69027832d2	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-563c-af7e-1b59-2cdf4f00bd41	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-563c-af7e-8eeb-8c257d4cd85f	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-563c-af7e-0af1-7b3d66025b1b	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-563c-af7e-ba63-feb295d0db55	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-563c-af7e-8f3d-4537fd1d8290	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-563c-af7e-b779-52debc62f1cc	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-563c-af7e-36ba-e1b617a4debc	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-563c-af7e-47f6-ed92a50eb783	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25462329)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25462301)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25462341)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25461920)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-563c-af80-cea1-1782741a2268	00090000-563c-af80-fa26-031f5d3876dd	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-af80-65f4-18e28420a6b5	00090000-563c-af80-3ea7-38d2f89738c4	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-af80-bb18-f99799ba0594	00090000-563c-af80-c682-6ee814ecf5c3	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-af80-f1cd-853f4d6915a5	00090000-563c-af80-de89-2622df3134af	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-af80-9f78-6872310fabd0	00090000-563c-af80-b4ff-4ded7f89d5ca	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563c-af80-8d06-7c67075bffd8	00090000-563c-af80-be29-80971805791b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25461741)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25462029)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-563c-af7e-715a-16f02baca784	01	Drama	drama (SURS 01)
00140000-563c-af7e-7239-3f4352fbf883	02	Opera	opera (SURS 02)
00140000-563c-af7e-bdf8-b02481ebda67	03	Balet	balet (SURS 03)
00140000-563c-af7e-2b24-649e4a3529db	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-563c-af7e-891c-69120db8fcef	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-563c-af7e-0073-2d1c45ee6239	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-563c-af7e-5aad-107ccfde2492	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25461910)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25461475)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25462088)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25462078)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25461466)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25461945)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25461987)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25462381)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25461729)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25461751)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25461756)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25462299)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25461624)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25462156)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25461906)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25461695)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25461662)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25461638)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25461813)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25462358)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25462365)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25462389)
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
-- TOC entry 2722 (class 2606 OID 25461840)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25461596)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25461494)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25461558)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25461521)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25461455)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25461440)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25461846)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25461882)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25462024)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25461549)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25461584)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25462251)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25461819)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25461574)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25461714)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25461683)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25461675)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25461831)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25462260)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25462268)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25462238)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25462280)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25461864)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25461804)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25461795)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25462011)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25461938)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25461650)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25461411)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25461873)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25461429)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25461449)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25461891)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25461826)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25461775)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25461399)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25461387)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25461381)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25461958)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25461530)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25461786)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25461998)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25461483)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25462292)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25461764)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25461609)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25461424)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25462057)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25461704)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25461854)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25461970)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25462339)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25462323)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25462347)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25461928)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25461745)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25462037)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25461918)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25461739)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25461740)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25461738)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25461737)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25461736)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25461959)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25461960)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25461961)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25462360)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25462359)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25461551)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25461552)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25461847)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25462327)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25462326)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25462328)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25462325)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25462324)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25461833)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25461832)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25461705)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25461706)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25461907)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25461909)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25461908)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25461640)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25461639)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25462281)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25462026)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25462027)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25462028)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25462348)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25462062)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25462059)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25462063)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25462061)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25462060)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25461611)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25461610)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25461524)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25461874)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25461456)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25461457)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25461894)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25461893)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25461892)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25461561)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25461560)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25461562)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25461678)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25461676)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25461677)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25461389)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25461799)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25461797)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25461796)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25461798)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25461430)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25461431)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25461855)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25462382)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25461947)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25461946)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25462390)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25462391)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25461820)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25461939)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25461940)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25462161)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25462160)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25462157)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25462158)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25462159)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25461576)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25461575)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25461577)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25461868)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25461867)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25462261)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25462262)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25462092)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25462093)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25462090)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25462091)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25461929)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25461930)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25461808)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25461807)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25461805)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25461806)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25462080)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25462079)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25461651)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25461665)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25461664)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25461663)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25461666)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25461696)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25461684)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25461685)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25462252)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25462300)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25462366)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25462367)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25461496)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25461495)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25461531)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25461532)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25461746)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25461789)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25461788)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25461787)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25461731)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25461732)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25461735)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25461730)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25461734)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25461733)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25461550)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25461484)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25461485)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25461625)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25461627)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25461626)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25461628)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25461814)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25462025)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25462058)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25461999)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25462000)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25461522)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25461523)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25461919)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25461400)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25461597)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25461559)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25461388)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25462293)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25461866)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25461865)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25461765)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25461766)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25462089)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25461585)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25462038)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25462340)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25462269)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25462270)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25461988)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25461776)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25461450)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25462562)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25462567)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25462592)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25462582)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25462557)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25462577)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25462587)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25462572)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25462762)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25462767)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25462772)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25462937)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25462932)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25462447)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25462452)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25462677)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25462917)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25462912)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25462922)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25462907)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25462902)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25462672)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25462667)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25462547)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25462552)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25462717)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25462727)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25462722)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25462502)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25462497)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25462657)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25462892)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25462777)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25462782)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25462787)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25462927)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25462807)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25462792)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25462812)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25462802)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25462797)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25462492)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25462487)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25462432)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25462427)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25462697)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25462407)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25462412)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25462712)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25462707)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25462702)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25462462)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25462457)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25462467)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25462527)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25462517)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25462522)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25462392)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25462632)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25462622)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25462617)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25462627)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25462397)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25462402)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25462682)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25462952)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25462757)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25462752)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25462957)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25462962)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25462662)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25462742)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25462747)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25462867)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25462862)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25462847)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25462852)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25462857)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25462477)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25462472)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25462482)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25462692)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25462687)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25462877)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25462882)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25462837)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25462842)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25462827)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25462832)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25462732)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25462737)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25462652)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25462647)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25462637)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25462642)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25462822)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25462817)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25462507)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25462512)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25462542)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25462532)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25462537)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25462872)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25462887)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25462897)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25462942)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25462947)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25462422)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25462417)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25462437)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25462442)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25462597)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25462612)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25462607)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25462602)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-06 14:47:48 CET

--
-- PostgreSQL database dump complete
--

