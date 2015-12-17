--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-17 08:34:10 CET

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
-- TOC entry 183 (class 1259 OID 32485350)
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
-- TOC entry 237 (class 1259 OID 32485965)
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
-- TOC entry 236 (class 1259 OID 32485948)
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
-- TOC entry 182 (class 1259 OID 32485343)
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
-- TOC entry 181 (class 1259 OID 32485341)
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
-- TOC entry 227 (class 1259 OID 32485825)
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
-- TOC entry 230 (class 1259 OID 32485855)
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
-- TOC entry 251 (class 1259 OID 32486268)
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
-- TOC entry 203 (class 1259 OID 32485598)
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
-- TOC entry 205 (class 1259 OID 32485630)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32485635)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32486190)
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
-- TOC entry 194 (class 1259 OID 32485495)
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
-- TOC entry 238 (class 1259 OID 32485978)
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
-- TOC entry 223 (class 1259 OID 32485778)
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
-- TOC entry 200 (class 1259 OID 32485569)
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
-- TOC entry 197 (class 1259 OID 32485535)
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
-- TOC entry 195 (class 1259 OID 32485512)
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
-- TOC entry 212 (class 1259 OID 32485692)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32486248)
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
-- TOC entry 250 (class 1259 OID 32486261)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32486283)
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
-- TOC entry 170 (class 1259 OID 32153619)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32485717)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32485469)
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
-- TOC entry 185 (class 1259 OID 32485369)
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
-- TOC entry 189 (class 1259 OID 32485436)
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
-- TOC entry 186 (class 1259 OID 32485380)
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
-- TOC entry 178 (class 1259 OID 32485315)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32485334)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32485724)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32485758)
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
-- TOC entry 233 (class 1259 OID 32485896)
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
-- TOC entry 188 (class 1259 OID 32485416)
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
-- TOC entry 191 (class 1259 OID 32485461)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32486134)
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
-- TOC entry 213 (class 1259 OID 32485698)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32485446)
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
-- TOC entry 202 (class 1259 OID 32485590)
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
-- TOC entry 198 (class 1259 OID 32485550)
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
-- TOC entry 199 (class 1259 OID 32485562)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32485710)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32486148)
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
-- TOC entry 242 (class 1259 OID 32486158)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32486047)
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
-- TOC entry 243 (class 1259 OID 32486166)
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
-- TOC entry 219 (class 1259 OID 32485739)
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
-- TOC entry 211 (class 1259 OID 32485683)
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
-- TOC entry 210 (class 1259 OID 32485673)
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
-- TOC entry 232 (class 1259 OID 32485885)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32485815)
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
-- TOC entry 196 (class 1259 OID 32485524)
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
-- TOC entry 175 (class 1259 OID 32485286)
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
-- TOC entry 174 (class 1259 OID 32485284)
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
-- TOC entry 220 (class 1259 OID 32485752)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32485324)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32485308)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32485766)
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
-- TOC entry 214 (class 1259 OID 32485704)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32485650)
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
-- TOC entry 173 (class 1259 OID 32485273)
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
-- TOC entry 172 (class 1259 OID 32485265)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32485260)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32485832)
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
-- TOC entry 187 (class 1259 OID 32485408)
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
-- TOC entry 209 (class 1259 OID 32485660)
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
-- TOC entry 231 (class 1259 OID 32485873)
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
-- TOC entry 184 (class 1259 OID 32485359)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32486178)
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
-- TOC entry 207 (class 1259 OID 32485640)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32485481)
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
-- TOC entry 176 (class 1259 OID 32485295)
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
-- TOC entry 235 (class 1259 OID 32485923)
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
-- TOC entry 201 (class 1259 OID 32485580)
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
-- TOC entry 218 (class 1259 OID 32485731)
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
-- TOC entry 229 (class 1259 OID 32485846)
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
-- TOC entry 247 (class 1259 OID 32486228)
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
-- TOC entry 246 (class 1259 OID 32486197)
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
-- TOC entry 248 (class 1259 OID 32486240)
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
-- TOC entry 225 (class 1259 OID 32485804)
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
-- TOC entry 204 (class 1259 OID 32485624)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32485913)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32485794)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32485346)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32485289)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32485350)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5672-656f-3a04-ebc5ceb21a39	10	30	Otroci	Abonma za otroke	200
000a0000-5672-656f-6f4c-056bb89c62a1	20	60	Mladina	Abonma za mladino	400
000a0000-5672-656f-b7da-c6daae427dc8	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32485965)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5672-656f-9bf0-2700a9c0c8a5	000d0000-5672-656f-5bf7-a0bc30f0566d	\N	00090000-5672-656f-e01c-85ea58f65b75	000b0000-5672-656f-841d-ad85fd8ac87e	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5672-656f-6167-f456c1867f29	000d0000-5672-656f-3709-8f2ffa08d84f	00100000-5672-656f-4601-f03d64ed03ef	00090000-5672-656f-b9e4-a6fe0c8f573a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5672-656f-da2a-abc468d8b925	000d0000-5672-656f-6ce0-1eaa3a924ba1	00100000-5672-656f-b7f9-b5fdbe217a31	00090000-5672-656f-6aac-33105a7358b7	\N	0003	t	\N	2015-12-17	\N	2	t	\N	f	f
000c0000-5672-656f-4ed4-1d7d874c732c	000d0000-5672-656f-cbd1-82b3e6968f7e	\N	00090000-5672-656f-9a08-ea6ff685167d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5672-656f-3443-d78ac3c4d792	000d0000-5672-656f-ad6b-f73f06dbd2bb	\N	00090000-5672-656f-3d30-2a56ed3fc493	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5672-656f-7441-fd84f2fb0f6c	000d0000-5672-656f-0bdf-daacb0b9bfb7	\N	00090000-5672-656f-7f5c-b14fe67d1c41	000b0000-5672-656f-11c9-f025b99e4a38	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5672-656f-33ea-ccdcb42a16c7	000d0000-5672-656f-5ac1-064e2a06a5c6	00100000-5672-656f-f941-1a2c12723e54	00090000-5672-656f-89fa-5bb93fd26f48	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5672-656f-29d3-4a56b43afe8b	000d0000-5672-656f-b070-d42f9b9eef5f	\N	00090000-5672-656f-d27c-011f48c5e2c2	000b0000-5672-656f-a28b-eda027def952	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5672-656f-a7d8-37713227eeaf	000d0000-5672-656f-5ac1-064e2a06a5c6	00100000-5672-656f-d624-37f1e6330944	00090000-5672-656f-d280-db0397f0d00d	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5672-656f-0643-d48606beaafe	000d0000-5672-656f-5ac1-064e2a06a5c6	00100000-5672-656f-3528-eb4395381b74	00090000-5672-656f-d13d-7b1f9dc27f04	\N	0010	t	\N	2015-12-17	\N	16	f	\N	f	t
000c0000-5672-656f-4c05-06df984ac7b1	000d0000-5672-656f-5ac1-064e2a06a5c6	00100000-5672-656f-fa17-233026ba3481	00090000-5672-656f-26ae-66828eea6bf2	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5672-656f-c2c4-57c0f5b3f691	000d0000-5672-656f-0149-e1d9fccd11c4	00100000-5672-656f-4601-f03d64ed03ef	00090000-5672-656f-b9e4-a6fe0c8f573a	000b0000-5672-656f-eca6-4312f0656e49	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32485948)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32485343)
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
-- TOC entry 3162 (class 0 OID 32485825)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5672-656f-d3aa-61d7ea3ee253	00160000-5672-656f-787d-c3683d009923	00090000-5672-656f-55e1-4bb51fddcbf7	aizv	10	t
003d0000-5672-656f-5517-ae1e3ccb0361	00160000-5672-656f-787d-c3683d009923	00090000-5672-656f-22d2-527b5afaac94	apri	14	t
003d0000-5672-656f-715c-699b6b68bef9	00160000-5672-656f-9837-60549b06d1c5	00090000-5672-656f-8b54-3d867f44e111	aizv	11	t
003d0000-5672-656f-0e9e-93a641cbbdf6	00160000-5672-656f-fd8f-f5db1a5bf14f	00090000-5672-656f-8a95-d5cfad7863eb	aizv	12	t
003d0000-5672-656f-0c6e-028a5f090e35	00160000-5672-656f-787d-c3683d009923	00090000-5672-656f-3814-805cae2abe83	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32485855)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5672-656f-787d-c3683d009923	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5672-656f-9837-60549b06d1c5	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5672-656f-fd8f-f5db1a5bf14f	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32486268)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32485598)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5672-656f-3ef8-cb6f2268f93b	\N	\N	00200000-5672-656f-a0ea-e525f337fc15	\N	\N	\N	00220000-5672-656f-cbf7-b7760f71c6d3	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5672-656f-5c02-f23cb5901e7c	\N	\N	00200000-5672-656f-fe95-38aff0e3a4e6	\N	\N	\N	00220000-5672-656f-cbf7-b7760f71c6d3	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5672-656f-b61d-1aaa79060fb7	\N	\N	00200000-5672-656f-a081-f2b916bc5dc0	\N	\N	\N	00220000-5672-656f-a8b0-449eb333d06b	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5672-656f-f10f-e96473389a30	\N	\N	00200000-5672-656f-6f37-a614a001cccf	\N	\N	\N	00220000-5672-656f-cf14-ac30e265eb32	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5672-656f-6799-70db070fe4ef	\N	\N	00200000-5672-656f-23af-bf70d9279932	\N	\N	\N	00220000-5672-656f-c893-504edffef0ea	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32485630)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32485635)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32486190)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32485495)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5672-656c-0c4d-ed7f410511c6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5672-656c-9a8d-f900582d3411	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5672-656c-04db-050ff4417979	AL	ALB	008	Albania 	Albanija	\N
00040000-5672-656c-60c0-ab8454d6811d	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5672-656c-9873-a3ffae73fb58	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5672-656c-621e-ec2c372baa34	AD	AND	020	Andorra 	Andora	\N
00040000-5672-656c-5f3c-63380ab923e7	AO	AGO	024	Angola 	Angola	\N
00040000-5672-656c-8c04-f1c40b8d0527	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5672-656c-38e2-7378cca7666b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5672-656c-d058-94ec9458a925	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5672-656c-e02c-cc9eab48efd3	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5672-656c-c669-98bcdd6205f3	AM	ARM	051	Armenia 	Armenija	\N
00040000-5672-656c-051f-1b1a5af8c9e5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5672-656c-f6e7-804c03093455	AU	AUS	036	Australia 	Avstralija	\N
00040000-5672-656c-abec-35077a69feb7	AT	AUT	040	Austria 	Avstrija	\N
00040000-5672-656c-3d9b-8194ff580fca	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5672-656c-9d09-42bf5dbe422c	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5672-656c-6a84-bcbb9f3b9fa1	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5672-656c-c6fd-37e85e3e6fd7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5672-656c-cdce-9bb5713c8254	BB	BRB	052	Barbados 	Barbados	\N
00040000-5672-656c-5399-c6055691ecdb	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5672-656c-81c6-2760fb5b742e	BE	BEL	056	Belgium 	Belgija	\N
00040000-5672-656c-b196-464afe62c721	BZ	BLZ	084	Belize 	Belize	\N
00040000-5672-656c-762e-1f1ae5c0e36f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5672-656c-4103-310cc83cf7ff	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5672-656c-ab19-26f5873459d2	BT	BTN	064	Bhutan 	Butan	\N
00040000-5672-656c-33f5-5f4fe02fe79f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5672-656c-4533-a8ad64627ad0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5672-656c-03f6-2a88b2dac433	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5672-656c-2b5f-a284f1c7e846	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5672-656c-9810-6944e2185001	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5672-656c-1343-94978519a28a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5672-656c-6dcc-287afd241aba	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5672-656c-0079-1db160424ad9	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5672-656c-2a0b-10293d7a8050	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5672-656c-cc0c-97593d162fb4	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5672-656c-85bc-5076362cb1da	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5672-656c-3931-b224ad27642e	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5672-656c-73a4-fe9c8060c199	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5672-656c-8aca-73a769e6a13c	CA	CAN	124	Canada 	Kanada	\N
00040000-5672-656c-4d32-920705155a23	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5672-656c-0d46-3acad7c22716	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5672-656c-ddaf-c7e147395058	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5672-656c-7c3d-6a7cecbc6334	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5672-656c-71c5-89b4b45bf8f1	CL	CHL	152	Chile 	Čile	\N
00040000-5672-656c-9e3d-dc7a3b417376	CN	CHN	156	China 	Kitajska	\N
00040000-5672-656c-3f4d-acdfba9d7ef3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5672-656c-4c70-6374c50e3465	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5672-656c-0877-20c2a572940d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5672-656c-8ce5-f3047dd3cf5f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5672-656c-2a89-e0ba9a9ffb76	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5672-656c-e30b-faa48c4486d5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5672-656c-3ca7-79d6a9a267eb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5672-656c-d803-02a1177e99c9	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5672-656c-a9bc-2afae6d06fff	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5672-656c-85d2-84a60d5fe9c7	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5672-656c-407c-f3b76f91bafe	CU	CUB	192	Cuba 	Kuba	\N
00040000-5672-656c-a0ee-bf049377e5d9	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5672-656c-79c9-d323a7fdd967	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5672-656c-600e-923365319e81	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5672-656c-9909-49500e5b0427	DK	DNK	208	Denmark 	Danska	\N
00040000-5672-656c-529e-c8bf274087d0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5672-656c-eaf1-147d2084c700	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5672-656c-4af0-7511c92752bc	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5672-656c-65f5-b3c465f9efc7	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5672-656c-126a-ed4626ae6e41	EG	EGY	818	Egypt 	Egipt	\N
00040000-5672-656c-2202-616599ae9ecf	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5672-656c-c190-ce35d3903d43	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5672-656c-1b4c-bede153465a8	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5672-656c-3be7-514d1bea138b	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5672-656c-c5d4-bde9cb7262d6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5672-656c-0dd1-7a864ddb6955	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5672-656c-b0fb-5b9e75ae671a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5672-656c-1905-2981c0fefddf	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5672-656c-5204-e87961899fb8	FI	FIN	246	Finland 	Finska	\N
00040000-5672-656c-d403-d63cd27f1a44	FR	FRA	250	France 	Francija	\N
00040000-5672-656c-4604-44c7eedf8954	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5672-656c-e6fe-a194400ba479	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5672-656c-b6f8-71071738bd65	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5672-656c-68bc-ec69bfe1086a	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5672-656c-1ed2-367814c0d3cf	GA	GAB	266	Gabon 	Gabon	\N
00040000-5672-656c-d94e-1716e0babf91	GM	GMB	270	Gambia 	Gambija	\N
00040000-5672-656c-acc4-940212d12907	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5672-656c-82e4-279da25c80fe	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5672-656c-3104-829b2e5ba363	GH	GHA	288	Ghana 	Gana	\N
00040000-5672-656c-f042-8de9bb19eda4	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5672-656c-e612-8c27884f97ad	GR	GRC	300	Greece 	Grčija	\N
00040000-5672-656c-0383-503a61de37ef	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5672-656c-d0e7-d219bd69dc86	GD	GRD	308	Grenada 	Grenada	\N
00040000-5672-656c-043a-e9173620782e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5672-656c-5611-138c660ee50e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5672-656c-36aa-f8f9b76a121e	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5672-656c-d89d-3e7b1b7d94cf	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5672-656c-7af8-d02707035612	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5672-656c-a2de-b596131c7e59	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5672-656c-6fe6-d993fd046960	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5672-656c-d1f6-9480aac4ed60	HT	HTI	332	Haiti 	Haiti	\N
00040000-5672-656c-4223-6e4b43c1c595	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5672-656c-51a1-997445732e4d	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5672-656c-f6ef-62369289b47a	HN	HND	340	Honduras 	Honduras	\N
00040000-5672-656c-a9b2-df3bcde1958b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5672-656c-7022-7c8c1216684a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5672-656c-2895-77e584557e38	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5672-656c-77ef-03ffe3faef34	IN	IND	356	India 	Indija	\N
00040000-5672-656c-ccdd-966d2a470ec8	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5672-656c-86a2-12c45ab5484e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5672-656c-4b8b-fb0f08bd6a6f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5672-656c-0591-e3e55cf2b41e	IE	IRL	372	Ireland 	Irska	\N
00040000-5672-656c-0269-5b31a466b822	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5672-656c-70fb-e83c0c0a0060	IL	ISR	376	Israel 	Izrael	\N
00040000-5672-656c-0aba-632386372d40	IT	ITA	380	Italy 	Italija	\N
00040000-5672-656c-1903-e6fcf6ca2a13	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5672-656c-3576-08f0e0458b05	JP	JPN	392	Japan 	Japonska	\N
00040000-5672-656c-8b48-f12dc38778e7	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5672-656c-be27-4f190307123e	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5672-656c-9eec-2877f41ad67e	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5672-656c-f0ff-52779a7307ac	KE	KEN	404	Kenya 	Kenija	\N
00040000-5672-656c-342c-a0bf7bd503e4	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5672-656c-a68b-f03ec08a7c49	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5672-656c-8006-c0089bb66cfb	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5672-656c-eb80-919594f03ed1	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5672-656c-0faa-2ed14ba48cec	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5672-656c-29a1-9c51b5c39b7a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5672-656c-cc01-a74028ee4ef6	LV	LVA	428	Latvia 	Latvija	\N
00040000-5672-656c-dd6b-d3766ca76a1d	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5672-656c-ec2f-8473d2728d32	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5672-656c-9cba-a017a5d9925d	LR	LBR	430	Liberia 	Liberija	\N
00040000-5672-656c-1c15-7f1116388365	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5672-656c-807a-d6256b81f000	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5672-656c-b05c-610cc3e37cc4	LT	LTU	440	Lithuania 	Litva	\N
00040000-5672-656c-c468-184c55a8a230	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5672-656c-7e5d-502a1c7b412a	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5672-656c-b1b0-29a94e54eb22	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5672-656c-ae4d-797b54d2ccda	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5672-656c-fe28-fb3a4fa04848	MW	MWI	454	Malawi 	Malavi	\N
00040000-5672-656c-b596-ff51dc35398a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5672-656c-3416-239da560d1d3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5672-656c-4040-40a4fd78e076	ML	MLI	466	Mali 	Mali	\N
00040000-5672-656c-9036-6f029d5528f9	MT	MLT	470	Malta 	Malta	\N
00040000-5672-656c-6e0f-962855260ab3	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5672-656c-91bc-8a6b9c26f188	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5672-656c-165a-5d378e826196	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5672-656c-a419-5794686be143	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5672-656c-3a0d-813b275537d0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5672-656c-5290-2780d18db9af	MX	MEX	484	Mexico 	Mehika	\N
00040000-5672-656c-665b-0bc7c1b55506	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5672-656c-f112-d25ae970fa5b	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5672-656c-5678-acffa09ecff1	MC	MCO	492	Monaco 	Monako	\N
00040000-5672-656c-11a3-ef5196a20a2d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5672-656c-02e7-8c30296a4b28	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5672-656c-a779-e7973c7dda15	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5672-656c-28ae-092ef89efe22	MA	MAR	504	Morocco 	Maroko	\N
00040000-5672-656c-c58d-10074e6b1649	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5672-656c-7c67-9373b9c2dc49	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5672-656c-1ab9-b97c19a0e6fb	NA	NAM	516	Namibia 	Namibija	\N
00040000-5672-656c-e727-ccd435ca841f	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5672-656c-963a-67fb258c35ad	NP	NPL	524	Nepal 	Nepal	\N
00040000-5672-656c-6795-fc214cbb8750	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5672-656c-4bae-dbf7dfe2baf7	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5672-656c-a02e-69399d8ad573	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5672-656c-74d3-b27f99dac8b7	NE	NER	562	Niger 	Niger 	\N
00040000-5672-656c-b349-0fc145f37aea	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5672-656c-e037-a709dfd51ca1	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5672-656c-d94f-cc7c26c7b87f	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5672-656c-132c-9b4b8b5c9cd0	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5672-656c-ea43-2f17732c06e0	NO	NOR	578	Norway 	Norveška	\N
00040000-5672-656c-2b39-e9d191aed8ec	OM	OMN	512	Oman 	Oman	\N
00040000-5672-656c-a7b9-ef136003d599	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5672-656c-1f34-324448232349	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5672-656c-e99f-1c4cad0aea64	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5672-656c-ab45-94c3088c9570	PA	PAN	591	Panama 	Panama	\N
00040000-5672-656c-fe8a-042e57657065	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5672-656c-f5e3-7446f4ddae12	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5672-656c-9239-7495b3e4e34e	PE	PER	604	Peru 	Peru	\N
00040000-5672-656c-e6fb-923c580c3bbd	PH	PHL	608	Philippines 	Filipini	\N
00040000-5672-656c-2588-13b24b8f1138	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5672-656c-14cf-082735b0b880	PL	POL	616	Poland 	Poljska	\N
00040000-5672-656c-3c5f-28633c47e7f7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5672-656c-6e16-fcdfb3c4ccca	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5672-656c-0356-c7ae63c7c3ac	QA	QAT	634	Qatar 	Katar	\N
00040000-5672-656c-65e8-41d0a4935005	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5672-656c-955f-d6919b59e36d	RO	ROU	642	Romania 	Romunija	\N
00040000-5672-656c-c4a2-5228cb9b5eea	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5672-656c-cd40-f5516b631f71	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5672-656c-b552-01b27ed57f85	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5672-656c-20f7-6c7de746f908	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5672-656c-091e-389864946cf4	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5672-656c-8054-51b832c07387	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5672-656c-bcdb-38be8113d649	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5672-656c-08ca-eacd339beedd	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5672-656c-2e5a-a95fea3ed3c1	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5672-656c-8931-bfa4733df4a6	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5672-656c-05d0-9196a276fde4	SM	SMR	674	San Marino 	San Marino	\N
00040000-5672-656c-f99d-abe1173312b1	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5672-656c-46ca-8e1cfe533cb8	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5672-656c-0eee-560d2c36b432	SN	SEN	686	Senegal 	Senegal	\N
00040000-5672-656c-9f60-c0e36718d5b6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5672-656c-7768-e997f7dd655a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5672-656c-bbcf-dc2dc75510e6	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5672-656c-9cf1-d39b22c44739	SG	SGP	702	Singapore 	Singapur	\N
00040000-5672-656c-5bb6-28eb923a682c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5672-656c-465b-aff464772802	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5672-656c-6e88-857e5d8af088	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5672-656c-bb9f-eb485d85350e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5672-656c-43ce-3b26fd24a81f	SO	SOM	706	Somalia 	Somalija	\N
00040000-5672-656c-750d-74c6994f5cd3	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5672-656c-552a-2aff808dd4c8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5672-656c-ae84-ab75b30fcc39	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5672-656c-bb16-7ffe8144459c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5672-656c-6714-79fcbf905300	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5672-656c-2431-bcea7a5a01f7	SD	SDN	729	Sudan 	Sudan	\N
00040000-5672-656c-267b-ba6f1603fac7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5672-656c-d30d-79d27d7e8db4	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5672-656c-2408-d521aa944adb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5672-656c-2694-17e6d699d06b	SE	SWE	752	Sweden 	Švedska	\N
00040000-5672-656c-d107-cd834ff495c0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5672-656c-f06e-d50b7e897b3b	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5672-656c-55c5-1426af431986	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5672-656c-ccde-a42e29d19d96	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5672-656c-ceb9-21155d7656b5	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5672-656c-fbfb-fd57acd9e670	TH	THA	764	Thailand 	Tajska	\N
00040000-5672-656c-e5ee-e27119a8108c	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5672-656c-2f7b-0b6d54b34850	TG	TGO	768	Togo 	Togo	\N
00040000-5672-656c-bc9e-0ca17a8945c0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5672-656c-28ef-819eecf870ee	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5672-656c-9d30-bc961df95076	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5672-656c-7345-5476673e20f0	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5672-656c-3136-e89fb3e610df	TR	TUR	792	Turkey 	Turčija	\N
00040000-5672-656c-5bb0-817633c7da93	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5672-656c-d4a8-2af3fd457b35	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5672-656c-97e5-7f38989700a6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5672-656c-6977-4dc406c8d15d	UG	UGA	800	Uganda 	Uganda	\N
00040000-5672-656c-f7eb-d6d9400a4152	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5672-656c-9322-5da10a09bd48	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5672-656c-0bb3-5434e2c019b0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5672-656c-708b-426497be5d0a	US	USA	840	United States 	Združene države Amerike	\N
00040000-5672-656c-dbaa-7317e552420f	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5672-656c-6257-6d43e60c8568	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5672-656c-e5e6-ffb8ad95afc9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5672-656c-d163-410b04da503b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5672-656c-a6ea-954484fdc6b6	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5672-656c-3ae4-a9c4a0e58081	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5672-656c-fb4a-4c6a35d6b85b	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5672-656c-9aa8-6d4c075e9f68	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5672-656c-b488-ea18c848d653	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5672-656c-5352-d12d6d164559	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5672-656c-22a9-f7540f056a42	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5672-656c-39e0-075b7898b44a	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5672-656c-b3a5-cf13642d7441	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32485978)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5672-656f-efe8-acd1d56c51a7	000e0000-5672-656f-945e-626041e36754	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-656c-31db-4389539f31ba	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5672-656f-9fea-c381a0470661	000e0000-5672-656f-18d1-77a3069985e6	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-656c-70cf-6b78e0274782	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5672-656f-15ab-ea57ec18c1c5	000e0000-5672-656f-788d-90dbe8ed40ce	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5672-656c-31db-4389539f31ba	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5672-656f-fb2e-9fc8069f3e57	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5672-656f-d373-a976527abb34	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32485778)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5672-656f-5bf7-a0bc30f0566d	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-9bf0-2700a9c0c8a5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5672-656c-1fa0-edf075743d3a
000d0000-5672-656f-3709-8f2ffa08d84f	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-6167-f456c1867f29	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5672-656c-a9a2-cf34c691ad24
000d0000-5672-656f-6ce0-1eaa3a924ba1	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-da2a-abc468d8b925	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5672-656c-99d3-12b95dcefb9c
000d0000-5672-656f-cbd1-82b3e6968f7e	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-4ed4-1d7d874c732c	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5672-656c-b6de-68fea87bc197
000d0000-5672-656f-ad6b-f73f06dbd2bb	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-3443-d78ac3c4d792	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5672-656c-b6de-68fea87bc197
000d0000-5672-656f-0bdf-daacb0b9bfb7	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-7441-fd84f2fb0f6c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5672-656c-1fa0-edf075743d3a
000d0000-5672-656f-5ac1-064e2a06a5c6	000e0000-5672-656f-18d1-77a3069985e6	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5672-656c-1fa0-edf075743d3a
000d0000-5672-656f-b070-d42f9b9eef5f	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-29d3-4a56b43afe8b	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5672-656c-bfa5-39ddb7f696fc
000d0000-5672-656f-0149-e1d9fccd11c4	000e0000-5672-656f-18d1-77a3069985e6	000c0000-5672-656f-c2c4-57c0f5b3f691	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5672-656c-0543-0a2896be631d
\.


--
-- TOC entry 3135 (class 0 OID 32485569)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32485535)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32485512)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5672-656f-1f0a-b3b35a9df4f1	00080000-5672-656f-607d-ac9658e08817	00090000-5672-656f-d13d-7b1f9dc27f04	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32485692)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32486248)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5672-656f-e850-6f2aa8747029	00010000-5672-656d-c62f-65735db95317	\N	Prva mapa	Root mapa	2015-12-17 08:34:07	2015-12-17 08:34:07	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32486261)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32486283)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32153619)
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
\.


--
-- TOC entry 3151 (class 0 OID 32485717)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32485469)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5672-656d-f368-fff46837314b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5672-656d-bf28-ca5c54619991	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5672-656d-b4f8-239c44599eed	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5672-656d-2886-0d49c8e0205d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5672-656d-221b-c74f04d3c9bc	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5672-656d-0b8c-7057ea5bd6b8	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5672-656d-25a6-6b059dce376a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5672-656d-bcb1-787f6096df7b	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5672-656d-7ca6-82cf8a32f206	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5672-656d-d1d4-646694282fbe	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5672-656d-33c0-5bf7e4d15e9d	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5672-656d-2277-9fe19af9bd1c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5672-656d-6ab5-500aa380b4ae	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5672-656d-5ed0-958265d67a6b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5672-656f-e4c5-af98457e88bb	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5672-656f-a53e-02de1de1bd83	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5672-656f-9a15-edaba8f08512	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5672-656f-1bd6-bffba26b9bf5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5672-656f-a792-5f9b4b2fcb94	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5672-6571-13db-42d107e0d49d	application.tenant.maticnopodjetje	string	s:36:"00080000-5672-6571-e296-c134f58f5bf0";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32485369)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5672-656f-2db0-127cfd684964	00000000-5672-656f-e4c5-af98457e88bb	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5672-656f-ea9b-3f7d7a78cf28	00000000-5672-656f-e4c5-af98457e88bb	00010000-5672-656d-c62f-65735db95317	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5672-656f-1e11-8a6e4479d3ca	00000000-5672-656f-a53e-02de1de1bd83	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32485436)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5672-656f-2283-f44fd2935700	\N	00100000-5672-656f-4601-f03d64ed03ef	00100000-5672-656f-b7f9-b5fdbe217a31	01	Gledališče Nimbis
00410000-5672-656f-6b5c-0be043bf3107	00410000-5672-656f-2283-f44fd2935700	00100000-5672-656f-4601-f03d64ed03ef	00100000-5672-656f-b7f9-b5fdbe217a31	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32485380)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5672-656f-e01c-85ea58f65b75	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5672-656f-9a08-ea6ff685167d	00010000-5672-656f-20fd-a084f094f98a	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5672-656f-6aac-33105a7358b7	00010000-5672-656f-60d1-99edb5b13d26	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5672-656f-d280-db0397f0d00d	00010000-5672-656f-7042-0afd0f58a8ea	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5672-656f-ac7e-438dcc8ecbc7	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5672-656f-7f5c-b14fe67d1c41	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5672-656f-26ae-66828eea6bf2	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5672-656f-89fa-5bb93fd26f48	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5672-656f-d13d-7b1f9dc27f04	00010000-5672-656f-7f35-a9407c66879c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5672-656f-b9e4-a6fe0c8f573a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5672-656f-325e-edb53e60df82	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5672-656f-3d30-2a56ed3fc493	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5672-656f-d27c-011f48c5e2c2	00010000-5672-656f-b440-bacb15114835	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5672-656f-55e1-4bb51fddcbf7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-656f-22d2-527b5afaac94	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-656f-8b54-3d867f44e111	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-656f-8a95-d5cfad7863eb	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5672-656f-3814-805cae2abe83	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5672-656f-d009-9f2bcdab17db	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-656f-8866-507849c1fae9	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5672-656f-8cd5-8739fec8e453	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32485315)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5672-656c-c51b-5f891bb1c963	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5672-656c-baa2-5f5863ecd4a3	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5672-656c-10ec-3aa43206d0f6	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5672-656c-b03f-46e0df152306	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5672-656c-c05b-fb940a113afb	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5672-656c-bde9-c237aee78e2c	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5672-656c-8dc0-076b2367986f	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5672-656c-cf0b-f493319adb64	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5672-656c-e334-607b60e2ebe5	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5672-656c-a3a5-f36af34e55fc	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5672-656c-e1f1-133adfc98e8c	Abonma-read	Abonma - branje	t
00030000-5672-656c-2a14-e8da5e3d8d33	Abonma-write	Abonma - spreminjanje	t
00030000-5672-656c-dd85-e5e99ca460af	Alternacija-read	Alternacija - branje	t
00030000-5672-656c-0a88-ff42bf3febd5	Alternacija-write	Alternacija - spreminjanje	t
00030000-5672-656c-abbf-5351f3a3e7d5	Arhivalija-read	Arhivalija - branje	t
00030000-5672-656c-0072-e52d0a561a59	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5672-656c-e71f-6eaf420dae76	AuthStorage-read	AuthStorage - branje	t
00030000-5672-656c-e152-05f7ebf70b24	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5672-656c-4edc-398daf49e8e3	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5672-656c-abdb-d36b74fcf821	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5672-656c-a66e-278b20d8794d	Besedilo-read	Besedilo - branje	t
00030000-5672-656c-c2e9-63ee7ff1a680	Besedilo-write	Besedilo - spreminjanje	t
00030000-5672-656c-05eb-b80ce05a3ed6	Dogodek-read	Dogodek - branje	t
00030000-5672-656c-fae1-4744e6117571	Dogodek-write	Dogodek - spreminjanje	t
00030000-5672-656c-d1aa-2ea80f11730c	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5672-656c-744e-e1ea9a778ce9	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5672-656c-bbec-e2c0787d4168	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5672-656c-9554-4a4150fa0d6a	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5672-656c-affe-c41dcd8b648b	DogodekTrait-read	DogodekTrait - branje	t
00030000-5672-656c-2957-b2b1cab87491	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5672-656c-d89b-061d7a12d0ef	DrugiVir-read	DrugiVir - branje	t
00030000-5672-656c-7e53-0c8ffd59ee38	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5672-656c-ebce-885698b72c19	Drzava-read	Drzava - branje	t
00030000-5672-656c-60c0-2f3175ac72af	Drzava-write	Drzava - spreminjanje	t
00030000-5672-656c-ee41-58734bccf96f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5672-656c-b837-b4aef04ad606	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5672-656c-b65a-2a2f5e1d6f3a	Funkcija-read	Funkcija - branje	t
00030000-5672-656c-1896-8347bea1f30c	Funkcija-write	Funkcija - spreminjanje	t
00030000-5672-656c-dd7a-c07cb4aef8fe	Gostovanje-read	Gostovanje - branje	t
00030000-5672-656c-a485-db12e5949f15	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5672-656c-c606-2871d82b34ff	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5672-656c-684a-90c46a4fa163	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5672-656c-7fbb-4b948d02c34f	Kupec-read	Kupec - branje	t
00030000-5672-656c-f690-a74deb7571da	Kupec-write	Kupec - spreminjanje	t
00030000-5672-656c-accd-f27aead08b04	NacinPlacina-read	NacinPlacina - branje	t
00030000-5672-656c-bc79-bb6d6479508a	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5672-656c-95a6-2c321ea92704	Option-read	Option - branje	t
00030000-5672-656c-9b66-120fdfe40c64	Option-write	Option - spreminjanje	t
00030000-5672-656c-b50a-957dafa26287	OptionValue-read	OptionValue - branje	t
00030000-5672-656c-cfd3-8841be9e6a0f	OptionValue-write	OptionValue - spreminjanje	t
00030000-5672-656c-adb6-7726b98ad9dc	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5672-656c-156d-c93bcbef3509	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5672-656c-8904-35fdd648c620	Oseba-read	Oseba - branje	t
00030000-5672-656c-9133-72c52ec50c13	Oseba-write	Oseba - spreminjanje	t
00030000-5672-656c-c58b-2b19289fe476	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5672-656c-517c-886f720de4e6	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5672-656c-d9e6-580267e2ccee	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5672-656c-ef69-1b2cfef09054	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5672-656c-acf9-e385fa0d7076	Pogodba-read	Pogodba - branje	t
00030000-5672-656c-a11b-960b517830c0	Pogodba-write	Pogodba - spreminjanje	t
00030000-5672-656c-d891-ed1c4955af6b	Popa-read	Popa - branje	t
00030000-5672-656c-8349-929a32b7acad	Popa-write	Popa - spreminjanje	t
00030000-5672-656c-c87c-910318641f75	Posta-read	Posta - branje	t
00030000-5672-656c-bee7-d3188c10302b	Posta-write	Posta - spreminjanje	t
00030000-5672-656c-57ce-13ced8621a1b	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5672-656c-f1fe-6bdaf85fc163	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5672-656c-f331-53d6b9f8449c	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5672-656c-a20e-e9c539ffcd02	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5672-656c-105a-efa7c770b631	PostniNaslov-read	PostniNaslov - branje	t
00030000-5672-656c-23b8-e1c616fc00e9	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5672-656c-1c65-7c8f838e96f8	Praznik-read	Praznik - branje	t
00030000-5672-656c-0ada-b32fc441d3d8	Praznik-write	Praznik - spreminjanje	t
00030000-5672-656c-ca12-1ce03356723a	Predstava-read	Predstava - branje	t
00030000-5672-656c-887d-4e3b8badc42a	Predstava-write	Predstava - spreminjanje	t
00030000-5672-656c-ce25-f943206c5b0c	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5672-656c-30a7-4189b4b5fe2d	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5672-656c-7d40-d140b2f0a7b8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5672-656c-df0d-7f9e028564aa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5672-656c-e4ed-99edaae93851	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5672-656c-eb0e-78f488959777	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5672-656c-1cdb-e9379a8902c1	ProgramDela-read	ProgramDela - branje	t
00030000-5672-656c-d33c-051540a3a3c6	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5672-656c-9fb1-b79f8ec8d520	ProgramFestival-read	ProgramFestival - branje	t
00030000-5672-656c-66e0-36048eb567cd	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5672-656c-0b25-0c2e12f4ea68	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5672-656c-b664-4095981c0866	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5672-656c-6b56-561369cd4c51	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5672-656c-15bf-3959dacc43f7	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5672-656c-9151-89993ca2b8dc	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5672-656d-776d-6b67980e52d9	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5672-656d-aaa3-ecabc0a11645	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5672-656d-6e06-ef6dab3494bb	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5672-656d-6b28-3f4fc29d0750	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5672-656d-346b-5ae90a490d71	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5672-656d-6029-1daaf60b214c	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5672-656d-a040-b79d960af930	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5672-656d-1ff7-ddf6536d8ac2	ProgramRazno-read	ProgramRazno - branje	t
00030000-5672-656d-e6e8-9431140da52d	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5672-656d-3b22-35a3604bbfe3	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5672-656d-fa5a-d616a062850d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5672-656d-cf13-eac6362a70eb	Prostor-read	Prostor - branje	t
00030000-5672-656d-c5e7-3382e4a8f7a4	Prostor-write	Prostor - spreminjanje	t
00030000-5672-656d-3a40-0191647830e1	Racun-read	Racun - branje	t
00030000-5672-656d-c15f-325513ebeb99	Racun-write	Racun - spreminjanje	t
00030000-5672-656d-c3b9-15a53d2037b7	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5672-656d-662d-5c96bb5cff7c	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5672-656d-0249-8df9fd832307	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5672-656d-d10e-5df78196ba16	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5672-656d-61eb-9ee09c34c69a	Rekvizit-read	Rekvizit - branje	t
00030000-5672-656d-7488-3f3e7b4c0ec5	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5672-656d-47a6-0c94fbb1e246	Revizija-read	Revizija - branje	t
00030000-5672-656d-6764-1a24eef2eaeb	Revizija-write	Revizija - spreminjanje	t
00030000-5672-656d-b533-bc5415ba728d	Rezervacija-read	Rezervacija - branje	t
00030000-5672-656d-db3c-da5b4353937a	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5672-656d-83e6-046bc227cadd	SedezniRed-read	SedezniRed - branje	t
00030000-5672-656d-34fe-dd666015e65e	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5672-656d-ac8f-074247b620dc	Sedez-read	Sedez - branje	t
00030000-5672-656d-5b50-6c2a5fdb4bb4	Sedez-write	Sedez - spreminjanje	t
00030000-5672-656d-48b8-67ebff1382f9	Sezona-read	Sezona - branje	t
00030000-5672-656d-0d32-ddd0a80cbdca	Sezona-write	Sezona - spreminjanje	t
00030000-5672-656d-0d8b-f8ae4e0e4b59	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5672-656d-1faa-f63cb7789f41	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5672-656d-1f03-49c15aa429ee	Telefonska-read	Telefonska - branje	t
00030000-5672-656d-aa85-ec2710cd5b62	Telefonska-write	Telefonska - spreminjanje	t
00030000-5672-656d-fd9c-8643f22471e9	TerminStoritve-read	TerminStoritve - branje	t
00030000-5672-656d-def0-6c75e3e76f7e	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5672-656d-0cb0-6d97982d6ad7	TipFunkcije-read	TipFunkcije - branje	t
00030000-5672-656d-55a7-98e0ac83f9e9	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5672-656d-dead-1e0f6e65d5da	TipPopa-read	TipPopa - branje	t
00030000-5672-656d-0171-7594728a9725	TipPopa-write	TipPopa - spreminjanje	t
00030000-5672-656d-bcd3-9ca5a72e4646	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5672-656d-c66b-e675e6897f2d	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5672-656d-31fa-f14b7beeb71a	TipVaje-read	TipVaje - branje	t
00030000-5672-656d-3553-9f88f3130a2d	TipVaje-write	TipVaje - spreminjanje	t
00030000-5672-656d-5b0e-9f62f0334cf2	Trr-read	Trr - branje	t
00030000-5672-656d-816c-4d48da6f397b	Trr-write	Trr - spreminjanje	t
00030000-5672-656d-9a44-8f1a979698b6	Uprizoritev-read	Uprizoritev - branje	t
00030000-5672-656d-8245-69b0a9fbe9af	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5672-656d-f3a4-a66978890532	Vaja-read	Vaja - branje	t
00030000-5672-656d-62b7-a51e80603968	Vaja-write	Vaja - spreminjanje	t
00030000-5672-656d-def0-b1e5195a0127	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5672-656d-c72e-7eef18b85282	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5672-656d-3f2f-113d13f4815f	VrstaStroska-read	VrstaStroska - branje	t
00030000-5672-656d-3598-eed24bce1491	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5672-656d-6487-1c789dce1920	Zaposlitev-read	Zaposlitev - branje	t
00030000-5672-656d-8327-d27a9ad17ae2	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5672-656d-2fa5-075b5303ef84	Zasedenost-read	Zasedenost - branje	t
00030000-5672-656d-b0b5-81947181ba38	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5672-656d-7ec7-b24b3b868f51	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5672-656d-79ff-cdb2137d4962	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5672-656d-9e44-7acc04f84dae	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5672-656d-cf58-f8c17597cb1f	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5672-656d-8bc3-a2c2caf8b817	Job-read	Branje opravil - samo zase - branje	t
00030000-5672-656d-76eb-23cc6f27eb71	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5672-656d-69fb-5073cc205df0	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5672-656d-d1dd-fd85fd9e3972	Report-read	Report - branje	t
00030000-5672-656d-d806-fb5f1ac1c654	Report-write	Report - spreminjanje	t
00030000-5672-656d-73fc-0c64a990b712	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5672-656d-0a4c-98bcde4b7c50	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5672-656d-085c-07b967c455d6	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5672-656d-c1ea-6210167bbbda	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5672-656d-470e-40653477b301	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5672-656d-1ac9-f8d5e9bee99f	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5672-656d-f9c7-e4e83c22a82f	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5672-656d-e3a0-d0c1f48bade6	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5672-656d-8afe-f98a13d1fc0f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5672-656d-7795-d05eba967ce6	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5672-656d-082d-c029b0a2408f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5672-656d-3697-12225f8edc42	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5672-656d-0f40-4ae84190435b	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5672-656d-1e84-33d1030d842c	Datoteka-write	Datoteka - spreminjanje	t
00030000-5672-656d-b6fb-e72bfe27e5ae	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32485334)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5672-656d-bcae-07fa6b8581c9	00030000-5672-656c-baa2-5f5863ecd4a3
00020000-5672-656d-bcae-07fa6b8581c9	00030000-5672-656c-c51b-5f891bb1c963
00020000-5672-656d-5a19-38dc3e91e98d	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-e2f1-c3330bb70648	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-81a0-8f2af583e98d	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-81a0-8f2af583e98d	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-81a0-8f2af583e98d	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-81a0-8f2af583e98d	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-81a0-8f2af583e98d	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-81a0-8f2af583e98d	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656d-8327-d27a9ad17ae2
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-50ee-f1f10e7500b1	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-234c-7eb3ea0288dc	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-234c-7eb3ea0288dc	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-234c-7eb3ea0288dc	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-0ff6-f051dd6c6c3a	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-2f07-b980236fc2ed	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-2f07-b980236fc2ed	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-2f07-b980236fc2ed	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-2f07-b980236fc2ed	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-ac4f-aeee2127d9e1	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-df5d-2a163ada78f5	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-8349-929a32b7acad
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-684a-90c46a4fa163
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-eb0e-78f488959777
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-10b6-f314f1f8cf4c	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-6e7e-5d58a444ab51	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-944a-ebabd2dc2a12	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-944a-ebabd2dc2a12	00030000-5672-656d-0171-7594728a9725
00020000-5672-656d-aad6-6cf196070a29	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-42c0-8ccc27c85463	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-42c0-8ccc27c85463	00030000-5672-656c-bee7-d3188c10302b
00020000-5672-656d-4fcf-95b74d33f7e4	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-4f9d-ea122ec1944d	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-4f9d-ea122ec1944d	00030000-5672-656c-60c0-2f3175ac72af
00020000-5672-656d-ce28-f9bf1c9cbffd	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-edd1-8c109de914d8	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-edd1-8c109de914d8	00030000-5672-656d-cf58-f8c17597cb1f
00020000-5672-656d-ddd4-fa4be5f018a7	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-f5a8-347d3d1a8e52	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-f5a8-347d3d1a8e52	00030000-5672-656d-79ff-cdb2137d4962
00020000-5672-656d-af74-fd9ea13f351f	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-8a87-ec13bf01b5ab	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-8a87-ec13bf01b5ab	00030000-5672-656c-2a14-e8da5e3d8d33
00020000-5672-656d-00b0-b12a84e51d60	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-af5e-220470e395e2	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-af5e-220470e395e2	00030000-5672-656d-c5e7-3382e4a8f7a4
00020000-5672-656d-af5e-220470e395e2	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-af5e-220470e395e2	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-af5e-220470e395e2	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656d-af5e-220470e395e2	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-c20f-55fadaed2b8a	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-c20f-55fadaed2b8a	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-c20f-55fadaed2b8a	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-7eb6-b31d412d1be3	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-7eb6-b31d412d1be3	00030000-5672-656d-3598-eed24bce1491
00020000-5672-656d-e8be-309359497fb0	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656c-156d-c93bcbef3509
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-6000-1b72a89d2663	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-3ab0-7f305a62c8bc	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-3ab0-7f305a62c8bc	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-3ab0-7f305a62c8bc	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-3ab0-7f305a62c8bc	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-3ab0-7f305a62c8bc	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-cf1c-8eda962edcc7	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-cf1c-8eda962edcc7	00030000-5672-656d-3553-9f88f3130a2d
00020000-5672-656d-fb76-beec3f7f9ee1	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-8dc0-076b2367986f
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-cf0b-f493319adb64
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-1cdb-e9379a8902c1
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-d33c-051540a3a3c6
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-9fb1-b79f8ec8d520
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-66e0-36048eb567cd
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-0b25-0c2e12f4ea68
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-b664-4095981c0866
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-6b56-561369cd4c51
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-15bf-3959dacc43f7
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-9151-89993ca2b8dc
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-776d-6b67980e52d9
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-aaa3-ecabc0a11645
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-6e06-ef6dab3494bb
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-6b28-3f4fc29d0750
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-346b-5ae90a490d71
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-6029-1daaf60b214c
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-a040-b79d960af930
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-1ff7-ddf6536d8ac2
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-e6e8-9431140da52d
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-3b22-35a3604bbfe3
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-fa5a-d616a062850d
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-df0d-7f9e028564aa
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-7e53-0c8ffd59ee38
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-f1fe-6bdaf85fc163
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-76eb-23cc6f27eb71
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-d89b-061d7a12d0ef
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-7d40-d140b2f0a7b8
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-57ce-13ced8621a1b
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-8bc3-a2c2caf8b817
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-c755-4052b83667d1	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-1cdb-e9379a8902c1
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-9fb1-b79f8ec8d520
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-0b25-0c2e12f4ea68
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-6b56-561369cd4c51
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-9151-89993ca2b8dc
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-aaa3-ecabc0a11645
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-6b28-3f4fc29d0750
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-6029-1daaf60b214c
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-1ff7-ddf6536d8ac2
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-3b22-35a3604bbfe3
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-7d40-d140b2f0a7b8
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-d89b-061d7a12d0ef
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-57ce-13ced8621a1b
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-8bc3-a2c2caf8b817
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-3596-4d4b832809af	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-a3a5-f36af34e55fc
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-08e6-b0010f6a16dd	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-6740-e16b3a36c90e	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-7e4c-b9ce413610eb	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-a11b-960b517830c0
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-4b60-3b92c06f8773	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-519d-6cb83d59fdec	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-4d9f-d2669419c9e0	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-96e7-e242b9ec623a	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-96e7-e242b9ec623a	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656d-96e7-e242b9ec623a	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-96e7-e242b9ec623a	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-b5d4-6eb0ea7be577	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-b5d4-6eb0ea7be577	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-d89b-061d7a12d0ef
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-7e53-0c8ffd59ee38
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-a3a5-f36af34e55fc
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-8bc3-a2c2caf8b817
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-76eb-23cc6f27eb71
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-a11b-960b517830c0
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-57ce-13ced8621a1b
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-f1fe-6bdaf85fc163
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-7d40-d140b2f0a7b8
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-df0d-7f9e028564aa
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-8dc0-076b2367986f
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-1cdb-e9379a8902c1
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-cf0b-f493319adb64
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-d33c-051540a3a3c6
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-9fb1-b79f8ec8d520
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-66e0-36048eb567cd
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-0b25-0c2e12f4ea68
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-b664-4095981c0866
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-6b56-561369cd4c51
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-15bf-3959dacc43f7
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656c-9151-89993ca2b8dc
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-776d-6b67980e52d9
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-aaa3-ecabc0a11645
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-6e06-ef6dab3494bb
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-6b28-3f4fc29d0750
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-346b-5ae90a490d71
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-6029-1daaf60b214c
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-a040-b79d960af930
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-1ff7-ddf6536d8ac2
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-e6e8-9431140da52d
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-3b22-35a3604bbfe3
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-fa5a-d616a062850d
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-5360-1fa54c4acd57	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-bffe-fe5cc485bec5	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-a3a5-f36af34e55fc
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-d535-be28e103eef4	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-d89b-061d7a12d0ef
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-7e53-0c8ffd59ee38
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-a3a5-f36af34e55fc
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-8bc3-a2c2caf8b817
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-76eb-23cc6f27eb71
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-684a-90c46a4fa163
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-a11b-960b517830c0
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-8349-929a32b7acad
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-57ce-13ced8621a1b
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-f1fe-6bdaf85fc163
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-7d40-d140b2f0a7b8
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-df0d-7f9e028564aa
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-eb0e-78f488959777
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-8dc0-076b2367986f
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-1cdb-e9379a8902c1
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-cf0b-f493319adb64
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-d33c-051540a3a3c6
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-9fb1-b79f8ec8d520
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-66e0-36048eb567cd
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-0b25-0c2e12f4ea68
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-b664-4095981c0866
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-6b56-561369cd4c51
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-15bf-3959dacc43f7
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656c-9151-89993ca2b8dc
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-776d-6b67980e52d9
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-aaa3-ecabc0a11645
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-6e06-ef6dab3494bb
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-6b28-3f4fc29d0750
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-346b-5ae90a490d71
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-6029-1daaf60b214c
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-a040-b79d960af930
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-1ff7-ddf6536d8ac2
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-e6e8-9431140da52d
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-3b22-35a3604bbfe3
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-fa5a-d616a062850d
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-8327-d27a9ad17ae2
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-a94d-fa7c7beb677c	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-a3a5-f36af34e55fc
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-684a-90c46a4fa163
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-8349-929a32b7acad
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656c-eb0e-78f488959777
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-8327-d27a9ad17ae2
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-bfcf-1eaf988d5648	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-481d-ba03c804c377	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-d89b-061d7a12d0ef
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-7e53-0c8ffd59ee38
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-8bc3-a2c2caf8b817
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-76eb-23cc6f27eb71
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-684a-90c46a4fa163
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-156d-c93bcbef3509
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-a11b-960b517830c0
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-8349-929a32b7acad
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-c87c-910318641f75
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-57ce-13ced8621a1b
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-f1fe-6bdaf85fc163
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-7d40-d140b2f0a7b8
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-df0d-7f9e028564aa
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-eb0e-78f488959777
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-8dc0-076b2367986f
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-1cdb-e9379a8902c1
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-cf0b-f493319adb64
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-d33c-051540a3a3c6
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-9fb1-b79f8ec8d520
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-66e0-36048eb567cd
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-0b25-0c2e12f4ea68
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-b664-4095981c0866
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-6b56-561369cd4c51
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-15bf-3959dacc43f7
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656c-9151-89993ca2b8dc
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-776d-6b67980e52d9
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-aaa3-ecabc0a11645
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-6e06-ef6dab3494bb
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-6b28-3f4fc29d0750
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-346b-5ae90a490d71
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-6029-1daaf60b214c
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-a040-b79d960af930
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-1ff7-ddf6536d8ac2
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-e6e8-9431140da52d
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-3b22-35a3604bbfe3
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-fa5a-d616a062850d
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-3598-eed24bce1491
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-8327-d27a9ad17ae2
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656d-7698-dc370f37975a	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-c51b-5f891bb1c963
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-baa2-5f5863ecd4a3
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-e1f1-133adfc98e8c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-2a14-e8da5e3d8d33
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-abbf-5351f3a3e7d5
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-0072-e52d0a561a59
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-e71f-6eaf420dae76
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-e152-05f7ebf70b24
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-4edc-398daf49e8e3
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-abdb-d36b74fcf821
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-a66e-278b20d8794d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-c2e9-63ee7ff1a680
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-05eb-b80ce05a3ed6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-b03f-46e0df152306
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-d1aa-2ea80f11730c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-744e-e1ea9a778ce9
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-bbec-e2c0787d4168
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-9554-4a4150fa0d6a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-affe-c41dcd8b648b
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-2957-b2b1cab87491
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-fae1-4744e6117571
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-d89b-061d7a12d0ef
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-7e53-0c8ffd59ee38
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-ebce-885698b72c19
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-60c0-2f3175ac72af
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-ee41-58734bccf96f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-b837-b4aef04ad606
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-a3a5-f36af34e55fc
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-dd7a-c07cb4aef8fe
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-a485-db12e5949f15
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-69fb-5073cc205df0
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-8bc3-a2c2caf8b817
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-76eb-23cc6f27eb71
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-c606-2871d82b34ff
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-684a-90c46a4fa163
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-7fbb-4b948d02c34f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-f690-a74deb7571da
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-f9c7-e4e83c22a82f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-1ac9-f8d5e9bee99f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0a4c-98bcde4b7c50
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-085c-07b967c455d6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-c1ea-6210167bbbda
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-470e-40653477b301
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-accd-f27aead08b04
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-bc79-bb6d6479508a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-95a6-2c321ea92704
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-b50a-957dafa26287
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-cfd3-8841be9e6a0f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-9b66-120fdfe40c64
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-adb6-7726b98ad9dc
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-156d-c93bcbef3509
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-c58b-2b19289fe476
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-517c-886f720de4e6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-d9e6-580267e2ccee
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-ef69-1b2cfef09054
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-a11b-960b517830c0
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-8349-929a32b7acad
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-c87c-910318641f75
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-57ce-13ced8621a1b
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-f1fe-6bdaf85fc163
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-f331-53d6b9f8449c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-a20e-e9c539ffcd02
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-bee7-d3188c10302b
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-1c65-7c8f838e96f8
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-0ada-b32fc441d3d8
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-ca12-1ce03356723a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-887d-4e3b8badc42a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-ce25-f943206c5b0c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-30a7-4189b4b5fe2d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-7d40-d140b2f0a7b8
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-df0d-7f9e028564aa
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-e4ed-99edaae93851
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-eb0e-78f488959777
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-8dc0-076b2367986f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-1cdb-e9379a8902c1
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-cf0b-f493319adb64
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-d33c-051540a3a3c6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-9fb1-b79f8ec8d520
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-66e0-36048eb567cd
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-0b25-0c2e12f4ea68
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-b664-4095981c0866
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-6b56-561369cd4c51
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-15bf-3959dacc43f7
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-9151-89993ca2b8dc
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-776d-6b67980e52d9
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-aaa3-ecabc0a11645
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-6e06-ef6dab3494bb
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-6b28-3f4fc29d0750
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-346b-5ae90a490d71
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-6029-1daaf60b214c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-a040-b79d960af930
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-1ff7-ddf6536d8ac2
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-e6e8-9431140da52d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-3b22-35a3604bbfe3
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-fa5a-d616a062850d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-cf13-eac6362a70eb
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-c5e7-3382e4a8f7a4
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-3a40-0191647830e1
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-c15f-325513ebeb99
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-c3b9-15a53d2037b7
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-662d-5c96bb5cff7c
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0249-8df9fd832307
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-d10e-5df78196ba16
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-61eb-9ee09c34c69a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-7488-3f3e7b4c0ec5
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-d1dd-fd85fd9e3972
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-d806-fb5f1ac1c654
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-47a6-0c94fbb1e246
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-6764-1a24eef2eaeb
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-b533-bc5415ba728d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-db3c-da5b4353937a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-83e6-046bc227cadd
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-34fe-dd666015e65e
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-ac8f-074247b620dc
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-5b50-6c2a5fdb4bb4
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-48b8-67ebff1382f9
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0d32-ddd0a80cbdca
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-73fc-0c64a990b712
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-fd9c-8643f22471e9
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656c-10ec-3aa43206d0f6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-def0-6c75e3e76f7e
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0cb0-6d97982d6ad7
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-55a7-98e0ac83f9e9
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-dead-1e0f6e65d5da
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0171-7594728a9725
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-bcd3-9ca5a72e4646
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-c66b-e675e6897f2d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-31fa-f14b7beeb71a
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-3553-9f88f3130a2d
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-f3a4-a66978890532
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-62b7-a51e80603968
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-def0-b1e5195a0127
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-c72e-7eef18b85282
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-3f2f-113d13f4815f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-3598-eed24bce1491
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-0f40-4ae84190435b
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-3697-12225f8edc42
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-8327-d27a9ad17ae2
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-2fa5-075b5303ef84
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-b0b5-81947181ba38
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-7ec7-b24b3b868f51
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-79ff-cdb2137d4962
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-9e44-7acc04f84dae
00020000-5672-656f-3dd4-40ada8a8e199	00030000-5672-656d-cf58-f8c17597cb1f
00020000-5672-656f-9ae6-acb532989eaa	00030000-5672-656d-082d-c029b0a2408f
00020000-5672-656f-b9fa-d4684cebccd4	00030000-5672-656d-7795-d05eba967ce6
00020000-5672-656f-a5ea-09911d78778a	00030000-5672-656d-8245-69b0a9fbe9af
00020000-5672-656f-db2c-c00ebc21b228	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656f-f8ba-e79084f1891f	00030000-5672-656d-085c-07b967c455d6
00020000-5672-656f-1557-f16627278111	00030000-5672-656d-c1ea-6210167bbbda
00020000-5672-656f-574a-327a05d61e55	00030000-5672-656d-470e-40653477b301
00020000-5672-656f-8bc1-60c2f30dd157	00030000-5672-656d-0a4c-98bcde4b7c50
00020000-5672-656f-2777-7970fbe05d16	00030000-5672-656d-f9c7-e4e83c22a82f
00020000-5672-656f-4645-6063be4b9b48	00030000-5672-656d-1ac9-f8d5e9bee99f
00020000-5672-656f-2aaf-70a84456d708	00030000-5672-656d-8afe-f98a13d1fc0f
00020000-5672-656f-04a4-1660219e558b	00030000-5672-656d-e3a0-d0c1f48bade6
00020000-5672-656f-6c3e-27f457ceb471	00030000-5672-656c-8904-35fdd648c620
00020000-5672-656f-144c-0fd8f025d993	00030000-5672-656c-9133-72c52ec50c13
00020000-5672-656f-a9e8-ce90d42b2d6a	00030000-5672-656c-c05b-fb940a113afb
00020000-5672-656f-824f-49e3583f13c3	00030000-5672-656c-bde9-c237aee78e2c
00020000-5672-656f-4201-30f24c3e61d2	00030000-5672-656d-1e84-33d1030d842c
00020000-5672-656f-2639-28bc99c1a215	00030000-5672-656d-b6fb-e72bfe27e5ae
00020000-5672-656f-f229-312151598bda	00030000-5672-656c-d891-ed1c4955af6b
00020000-5672-656f-f229-312151598bda	00030000-5672-656c-8349-929a32b7acad
00020000-5672-656f-f229-312151598bda	00030000-5672-656d-9a44-8f1a979698b6
00020000-5672-656f-5932-7edbfab6b1df	00030000-5672-656d-5b0e-9f62f0334cf2
00020000-5672-656f-99f8-1804b1eac1e7	00030000-5672-656d-816c-4d48da6f397b
00020000-5672-656f-8fd6-683b70ceb98e	00030000-5672-656d-73fc-0c64a990b712
00020000-5672-656f-1ce1-c533f41291d1	00030000-5672-656d-1f03-49c15aa429ee
00020000-5672-656f-589f-9bc0c8378e5e	00030000-5672-656d-aa85-ec2710cd5b62
00020000-5672-656f-dbec-f704004e3c54	00030000-5672-656c-105a-efa7c770b631
00020000-5672-656f-d27d-18a9ba411238	00030000-5672-656c-23b8-e1c616fc00e9
00020000-5672-656f-1d91-fe709f504fb0	00030000-5672-656d-6487-1c789dce1920
00020000-5672-656f-08bf-0550e3a760a7	00030000-5672-656d-8327-d27a9ad17ae2
00020000-5672-656f-2c58-7855c1f2927d	00030000-5672-656c-acf9-e385fa0d7076
00020000-5672-656f-62e0-8676839f20d4	00030000-5672-656c-a11b-960b517830c0
00020000-5672-656f-1d63-bffff380d406	00030000-5672-656d-0d8b-f8ae4e0e4b59
00020000-5672-656f-c3f8-e1f41ce3a5f4	00030000-5672-656d-1faa-f63cb7789f41
00020000-5672-656f-f633-9e290cfb1942	00030000-5672-656c-dd85-e5e99ca460af
00020000-5672-656f-38ea-a911bbb20e95	00030000-5672-656c-0a88-ff42bf3febd5
00020000-5672-656f-20d3-566af0d74522	00030000-5672-656c-e334-607b60e2ebe5
00020000-5672-656f-ebf1-798e0d4dadc5	00030000-5672-656c-b65a-2a2f5e1d6f3a
00020000-5672-656f-514a-a9eb9eb4c205	00030000-5672-656c-1896-8347bea1f30c
00020000-5672-656f-c051-65f5e6ef1304	00030000-5672-656c-a3a5-f36af34e55fc
\.


--
-- TOC entry 3152 (class 0 OID 32485724)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32485758)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32485896)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5672-656f-841d-ad85fd8ac87e	00090000-5672-656f-e01c-85ea58f65b75	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5672-656f-11c9-f025b99e4a38	00090000-5672-656f-7f5c-b14fe67d1c41	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5672-656f-a28b-eda027def952	00090000-5672-656f-d27c-011f48c5e2c2	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5672-656f-eca6-4312f0656e49	00090000-5672-656f-b9e4-a6fe0c8f573a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32485416)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5672-656f-607d-ac9658e08817	\N	00040000-5672-656c-6e88-857e5d8af088	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-128b-a798abad8f7b	\N	00040000-5672-656c-6e88-857e5d8af088	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5672-656f-f771-1b7c2215f519	\N	00040000-5672-656c-6e88-857e5d8af088	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-461a-fb8537eda5c7	\N	00040000-5672-656c-6e88-857e5d8af088	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-8d41-5a2a0310f0b8	\N	00040000-5672-656c-6e88-857e5d8af088	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-abd3-59bf899770b8	\N	00040000-5672-656c-e02c-cc9eab48efd3	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-2a0c-349f6a0d2f15	\N	00040000-5672-656c-85d2-84a60d5fe9c7	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-30db-8c72caf7f968	\N	00040000-5672-656c-abec-35077a69feb7	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-656f-bea0-2131b67af61d	\N	00040000-5672-656c-82e4-279da25c80fe	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5672-6571-e296-c134f58f5bf0	\N	00040000-5672-656c-6e88-857e5d8af088	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32485461)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5672-656c-949c-a88fefc1b44a	8341	Adlešiči
00050000-5672-656c-4730-1abcd6882bb8	5270	Ajdovščina
00050000-5672-656c-4f34-f9af51eab0f4	6280	Ankaran/Ancarano
00050000-5672-656c-0de2-a340e5055c45	9253	Apače
00050000-5672-656c-8327-346f7f538108	8253	Artiče
00050000-5672-656c-6a9b-e6faba4159c0	4275	Begunje na Gorenjskem
00050000-5672-656c-f711-501cdb63b422	1382	Begunje pri Cerknici
00050000-5672-656c-5430-ae5d1a3a8bbe	9231	Beltinci
00050000-5672-656c-eaa7-5999dedcd3fe	2234	Benedikt
00050000-5672-656c-fe38-f39e203304dd	2345	Bistrica ob Dravi
00050000-5672-656c-ca21-7df4f9aaa239	3256	Bistrica ob Sotli
00050000-5672-656c-8fa8-cfe0ee70abbb	8259	Bizeljsko
00050000-5672-656c-28d2-cf2a52a942d9	1223	Blagovica
00050000-5672-656c-e9fc-825569385cbd	8283	Blanca
00050000-5672-656c-a67b-31af3d549a35	4260	Bled
00050000-5672-656c-4a53-4d8129d06037	4273	Blejska Dobrava
00050000-5672-656c-0f28-54e0127e0017	9265	Bodonci
00050000-5672-656c-e999-21a47b6eee72	9222	Bogojina
00050000-5672-656c-4954-3dc3942de02d	4263	Bohinjska Bela
00050000-5672-656c-067f-d23be3e54fc4	4264	Bohinjska Bistrica
00050000-5672-656c-ff8c-ad009c3d3e69	4265	Bohinjsko jezero
00050000-5672-656c-0e67-4cefbe20b16e	1353	Borovnica
00050000-5672-656c-4ac1-24af7af84c7b	8294	Boštanj
00050000-5672-656c-3ce5-b1d905e5b170	5230	Bovec
00050000-5672-656c-a2d5-598280299bcc	5295	Branik
00050000-5672-656c-c252-1a5a0389fd54	3314	Braslovče
00050000-5672-656c-53e6-a5bfffe3a759	5223	Breginj
00050000-5672-656c-dbf7-fd11a9374b69	8280	Brestanica
00050000-5672-656c-0165-d0e61548d818	2354	Bresternica
00050000-5672-656c-9ca4-3d2479c0a253	4243	Brezje
00050000-5672-656c-7ca6-7016a51cdbb0	1351	Brezovica pri Ljubljani
00050000-5672-656c-754d-b792bde13a24	8250	Brežice
00050000-5672-656c-a293-d2c28e60addd	4210	Brnik - Aerodrom
00050000-5672-656c-59b5-7fae6901b5b9	8321	Brusnice
00050000-5672-656c-c19f-82514b0127d6	3255	Buče
00050000-5672-656c-8957-a7b0455fb361	8276	Bučka 
00050000-5672-656c-4b8a-bef3b01553d2	9261	Cankova
00050000-5672-656c-a1ae-e57f8382825b	3000	Celje 
00050000-5672-656c-d335-61f1a92c8dc2	3001	Celje - poštni predali
00050000-5672-656c-fdd0-6750ba7ce1c5	4207	Cerklje na Gorenjskem
00050000-5672-656c-eecb-c59f3e411474	8263	Cerklje ob Krki
00050000-5672-656c-cb4d-89b37447bbb3	1380	Cerknica
00050000-5672-656c-2aef-df52c8c0c719	5282	Cerkno
00050000-5672-656c-2d39-8b83531c6a1b	2236	Cerkvenjak
00050000-5672-656c-98e5-e6c9c7b255a9	2215	Ceršak
00050000-5672-656c-631c-470c58ae3012	2326	Cirkovce
00050000-5672-656c-5ccd-5fd5240b40d6	2282	Cirkulane
00050000-5672-656c-71b8-2a0a60c87ea7	5273	Col
00050000-5672-656c-92cb-29c965af9d78	8251	Čatež ob Savi
00050000-5672-656c-1ff5-db72c7e67a7c	1413	Čemšenik
00050000-5672-656c-c943-d180f10f1d8b	5253	Čepovan
00050000-5672-656c-bd08-b300da9163ce	9232	Črenšovci
00050000-5672-656c-4c68-1800cc9a375e	2393	Črna na Koroškem
00050000-5672-656c-97cd-ee3006ed72f2	6275	Črni Kal
00050000-5672-656c-97fd-c10edb04f218	5274	Črni Vrh nad Idrijo
00050000-5672-656c-2c4a-f0b1bab884e2	5262	Črniče
00050000-5672-656c-03bf-4da5ba5d1497	8340	Črnomelj
00050000-5672-656c-c08d-2d491e2b4db6	6271	Dekani
00050000-5672-656c-e9d9-16fb2248fa26	5210	Deskle
00050000-5672-656c-2d7d-e07e10ff949f	2253	Destrnik
00050000-5672-656c-0c88-504834d25ae1	6215	Divača
00050000-5672-656c-3c4c-fcf9befce924	1233	Dob
00050000-5672-656c-04c6-83368bb92b68	3224	Dobje pri Planini
00050000-5672-656c-1aff-1431590e888b	8257	Dobova
00050000-5672-656c-e8f8-8fb058450816	1423	Dobovec
00050000-5672-656c-9cfa-0293997ecee7	5263	Dobravlje
00050000-5672-656c-26f9-ca1e91718e74	3204	Dobrna
00050000-5672-656c-3291-90604d579059	8211	Dobrnič
00050000-5672-656c-d314-35fdf5ceef18	1356	Dobrova
00050000-5672-656c-c02c-058f3b516b74	9223	Dobrovnik/Dobronak 
00050000-5672-656c-d1bd-31648b213966	5212	Dobrovo v Brdih
00050000-5672-656c-ba69-6787274d399e	1431	Dol pri Hrastniku
00050000-5672-656c-9ca1-9bbf9e398a3b	1262	Dol pri Ljubljani
00050000-5672-656c-7666-e2c6689623f7	1273	Dole pri Litiji
00050000-5672-656c-4de8-44a09e59e563	1331	Dolenja vas
00050000-5672-656c-4f7f-a3a1efdc3a2e	8350	Dolenjske Toplice
00050000-5672-656c-7dbe-54a7c6b6b0ec	1230	Domžale
00050000-5672-656c-ec97-ea18a5a1c41c	2252	Dornava
00050000-5672-656c-5ef9-02f00947e174	5294	Dornberk
00050000-5672-656c-c454-7c91aa856974	1319	Draga
00050000-5672-656c-69a6-4628e5a71525	8343	Dragatuš
00050000-5672-656c-d384-e670c71badcf	3222	Dramlje
00050000-5672-656c-cf24-5876775deb54	2370	Dravograd
00050000-5672-656c-d9f8-24e201d83e67	4203	Duplje
00050000-5672-656c-8f14-fdd845e36d93	6221	Dutovlje
00050000-5672-656c-fe62-4e0718ab7124	8361	Dvor
00050000-5672-656c-a4d0-b179f8397a08	2343	Fala
00050000-5672-656c-3b36-c241c55574a0	9208	Fokovci
00050000-5672-656c-3114-dc98feaf44eb	2313	Fram
00050000-5672-656c-a063-467626e72f58	3213	Frankolovo
00050000-5672-656c-1e38-3eed7faf6289	1274	Gabrovka
00050000-5672-656c-65c8-e5a4733a59eb	8254	Globoko
00050000-5672-656c-bb00-ec6b64c03b11	5275	Godovič
00050000-5672-656c-c4b1-79b4efb81e07	4204	Golnik
00050000-5672-656c-d71c-379d1e6e7a6d	3303	Gomilsko
00050000-5672-656c-0a7b-5d94100725eb	4224	Gorenja vas
00050000-5672-656c-3076-5a66d6f06344	3263	Gorica pri Slivnici
00050000-5672-656c-3c84-9115853c1a0c	2272	Gorišnica
00050000-5672-656c-b3f6-880d692d9683	9250	Gornja Radgona
00050000-5672-656c-4e91-660b35f886c6	3342	Gornji Grad
00050000-5672-656c-61fc-641706e038fd	4282	Gozd Martuljek
00050000-5672-656c-d0e1-65ee717f1a6c	6272	Gračišče
00050000-5672-656c-17bd-0bc0b4a40473	9264	Grad
00050000-5672-656c-7f74-0cea8b0c0c97	8332	Gradac
00050000-5672-656c-0c64-fe6231dbb5b0	1384	Grahovo
00050000-5672-656c-ad00-09f1a4fd38ee	5242	Grahovo ob Bači
00050000-5672-656c-230c-eebfd44e9a14	5251	Grgar
00050000-5672-656c-4dab-c5cb22df0fc2	3302	Griže
00050000-5672-656c-27f4-f77ddeb7cc47	3231	Grobelno
00050000-5672-656c-abd0-73d00f0567c7	1290	Grosuplje
00050000-5672-656c-2a9c-c2c941e48305	2288	Hajdina
00050000-5672-656c-b662-b63ce8bec270	8362	Hinje
00050000-5672-656c-c40b-1efce22203eb	2311	Hoče
00050000-5672-656c-9b87-1f47875ac1e7	9205	Hodoš/Hodos
00050000-5672-656c-07a7-33e91ec15123	1354	Horjul
00050000-5672-656c-63c3-fc49c5db8436	1372	Hotedršica
00050000-5672-656c-56b2-44abf6c0e34d	1430	Hrastnik
00050000-5672-656c-7fca-cce2af8d3cae	6225	Hruševje
00050000-5672-656c-6f5d-f6d1e5fe1b33	4276	Hrušica
00050000-5672-656c-74c5-760d4d1027a2	5280	Idrija
00050000-5672-656c-4ecf-a6ee6a8d3583	1292	Ig
00050000-5672-656c-12b0-b89f6e80af1b	6250	Ilirska Bistrica
00050000-5672-656c-5c9d-115fb8d9db35	6251	Ilirska Bistrica-Trnovo
00050000-5672-656c-917d-249a8640c154	1295	Ivančna Gorica
00050000-5672-656c-6d57-b980c9a2b7f9	2259	Ivanjkovci
00050000-5672-656c-a122-e62df8dbc74d	1411	Izlake
00050000-5672-656c-19c8-27184c02e43f	6310	Izola/Isola
00050000-5672-656c-a206-a8e060c89ed3	2222	Jakobski Dol
00050000-5672-656c-40b2-01a22e7fbb97	2221	Jarenina
00050000-5672-656c-6a6b-f1a0d58f0050	6254	Jelšane
00050000-5672-656c-d70b-2e4682b967ff	4270	Jesenice
00050000-5672-656c-4d38-123af81908f8	8261	Jesenice na Dolenjskem
00050000-5672-656c-ac2c-a5476014d76a	3273	Jurklošter
00050000-5672-656c-3ff4-53dbdb19bef3	2223	Jurovski Dol
00050000-5672-656c-3d6f-1e2a118d6d9a	2256	Juršinci
00050000-5672-656c-fcc4-7945512c2c9b	5214	Kal nad Kanalom
00050000-5672-656c-2c0f-e1278fbf58df	3233	Kalobje
00050000-5672-656c-50fb-5d9781c8c952	4246	Kamna Gorica
00050000-5672-656c-6f8d-a734e1c7a46c	2351	Kamnica
00050000-5672-656c-7cc2-887b6ce563bd	1241	Kamnik
00050000-5672-656c-2d4d-19cbd2f2350f	5213	Kanal
00050000-5672-656c-ddb3-824f2dd4705d	8258	Kapele
00050000-5672-656c-3cb0-73128e333d71	2362	Kapla
00050000-5672-656c-45e7-7e9a8fb5f3a7	2325	Kidričevo
00050000-5672-656c-0988-d9188059839d	1412	Kisovec
00050000-5672-656c-4e8c-4ebefc0bf206	6253	Knežak
00050000-5672-656c-e8c8-f5b1f6ce09cd	5222	Kobarid
00050000-5672-656c-94ba-e339dc6138ba	9227	Kobilje
00050000-5672-656c-3180-46aa3af2b88c	1330	Kočevje
00050000-5672-656c-a9f4-1416e3c2939a	1338	Kočevska Reka
00050000-5672-656c-912c-bcfe9661264a	2276	Kog
00050000-5672-656c-90ae-dc219963a759	5211	Kojsko
00050000-5672-656c-e8fd-d21a6c832e25	6223	Komen
00050000-5672-656c-5778-09f3c0ebfa9c	1218	Komenda
00050000-5672-656c-4a94-eff2b1ff206f	6000	Koper/Capodistria 
00050000-5672-656c-a86f-99ca1cdfcbc0	6001	Koper/Capodistria - poštni predali
00050000-5672-656c-4cab-e42d2e493f8e	8282	Koprivnica
00050000-5672-656c-fba2-493e871d5311	5296	Kostanjevica na Krasu
00050000-5672-656c-133c-646682f4ed67	8311	Kostanjevica na Krki
00050000-5672-656c-69a2-1f3ab16dd98c	1336	Kostel
00050000-5672-656c-fbfa-a27f4c5e9b4e	6256	Košana
00050000-5672-656c-7f6e-5cadbf6697d6	2394	Kotlje
00050000-5672-656c-46a8-f2d85e15b463	6240	Kozina
00050000-5672-656c-1398-73fa1c3a54fc	3260	Kozje
00050000-5672-656c-6929-d8270063f6cc	4000	Kranj 
00050000-5672-656c-f2b8-a0dd678b4b3c	4001	Kranj - poštni predali
00050000-5672-656c-0ebc-f6bee51c0650	4280	Kranjska Gora
00050000-5672-656c-f881-a888cf8b9d26	1281	Kresnice
00050000-5672-656c-9ca3-23d7cdef1671	4294	Križe
00050000-5672-656c-0a55-d7e2f140d1d0	9206	Križevci
00050000-5672-656c-4a7a-f5a1767bd435	9242	Križevci pri Ljutomeru
00050000-5672-656c-4922-a926630e4bab	1301	Krka
00050000-5672-656c-d46a-4f121c71c8f0	8296	Krmelj
00050000-5672-656c-74e5-08439921d5c0	4245	Kropa
00050000-5672-656c-ec72-a6e75ab1f2e8	8262	Krška vas
00050000-5672-656c-22aa-e2c36c82ce8d	8270	Krško
00050000-5672-656c-9ec6-603fc310a991	9263	Kuzma
00050000-5672-656c-7707-bd6d5bda1777	2318	Laporje
00050000-5672-656c-e20e-2e1c9aff97e2	3270	Laško
00050000-5672-656c-d6fc-0af8cd7e849e	1219	Laze v Tuhinju
00050000-5672-656c-58ad-c45b62c1deb8	2230	Lenart v Slovenskih goricah
00050000-5672-656c-fd50-90021f7b4ab0	9220	Lendava/Lendva
00050000-5672-656c-9c01-276499223cf4	4248	Lesce
00050000-5672-656c-6f51-c740871618de	3261	Lesično
00050000-5672-656c-b312-7aa90c4d3afb	8273	Leskovec pri Krškem
00050000-5672-656c-d6ae-f078fbd300a9	2372	Libeliče
00050000-5672-656c-9d92-15828490431b	2341	Limbuš
00050000-5672-656c-6386-731474ea8841	1270	Litija
00050000-5672-656c-32b4-addab42368b0	3202	Ljubečna
00050000-5672-656c-cbfd-a5d35625f839	1000	Ljubljana 
00050000-5672-656c-322c-58565e1faa59	1001	Ljubljana - poštni predali
00050000-5672-656c-ebb4-33353f41157d	1231	Ljubljana - Črnuče
00050000-5672-656c-9071-6c4c447bfc9e	1261	Ljubljana - Dobrunje
00050000-5672-656c-98e9-44fb6d8d27ea	1260	Ljubljana - Polje
00050000-5672-656c-14a7-85546faa39b6	1210	Ljubljana - Šentvid
00050000-5672-656c-a2c9-bfc149f08319	1211	Ljubljana - Šmartno
00050000-5672-656c-85d3-3877421a7715	3333	Ljubno ob Savinji
00050000-5672-656c-611e-a5a77d39527e	9240	Ljutomer
00050000-5672-656c-b67b-8a1bc915f8b0	3215	Loče
00050000-5672-656c-2513-1992c3a30a3a	5231	Log pod Mangartom
00050000-5672-656c-4398-c2e8e9812a75	1358	Log pri Brezovici
00050000-5672-656c-879d-bab803d35d67	1370	Logatec
00050000-5672-656c-bc99-77eafbe89601	1371	Logatec
00050000-5672-656c-a37e-b8898d781f24	1434	Loka pri Zidanem Mostu
00050000-5672-656c-e7b7-82eb437af4bd	3223	Loka pri Žusmu
00050000-5672-656c-9511-3f396a158856	6219	Lokev
00050000-5672-656c-5d79-bd6b49aab1ca	1318	Loški Potok
00050000-5672-656c-6020-3470aeeb7f54	2324	Lovrenc na Dravskem polju
00050000-5672-656c-360e-b579258bbc0e	2344	Lovrenc na Pohorju
00050000-5672-656c-f238-578b56294514	3334	Luče
00050000-5672-656c-3f5c-a17e9f1ab3de	1225	Lukovica
00050000-5672-656c-1a8c-164f2facd785	9202	Mačkovci
00050000-5672-656c-0da2-ed4d77313226	2322	Majšperk
00050000-5672-656c-c79f-7c4003cb8072	2321	Makole
00050000-5672-656c-96d6-5a516fa4e6f5	9243	Mala Nedelja
00050000-5672-656c-ada1-944bdfcc05ca	2229	Malečnik
00050000-5672-656c-507c-c7f8973f11e0	6273	Marezige
00050000-5672-656c-b7a0-d9ce9d5efc6c	2000	Maribor 
00050000-5672-656c-eb70-2d5b80466b33	2001	Maribor - poštni predali
00050000-5672-656c-295e-c06392bb4c2d	2206	Marjeta na Dravskem polju
00050000-5672-656c-4cce-52524b8701a1	2281	Markovci
00050000-5672-656c-47b0-e200b1f5d920	9221	Martjanci
00050000-5672-656c-69aa-0bafff43be75	6242	Materija
00050000-5672-656c-dd3a-09585ac2735d	4211	Mavčiče
00050000-5672-656c-2b7e-657e7b8e0316	1215	Medvode
00050000-5672-656c-71f3-d39828a85f22	1234	Mengeš
00050000-5672-656c-638b-ace67a14c68f	8330	Metlika
00050000-5672-656c-9fea-0996c8420139	2392	Mežica
00050000-5672-656c-4436-3f5a04d7120b	2204	Miklavž na Dravskem polju
00050000-5672-656c-5a0f-5e3bff319e21	2275	Miklavž pri Ormožu
00050000-5672-656c-eb74-dca8569be555	5291	Miren
00050000-5672-656c-a538-2de99ef88c29	8233	Mirna
00050000-5672-656c-2170-760e7ff4cd79	8216	Mirna Peč
00050000-5672-656c-c110-794886bb695e	2382	Mislinja
00050000-5672-656c-d4ce-5cdee46c5e11	4281	Mojstrana
00050000-5672-656c-3a22-bdcfd8649ce0	8230	Mokronog
00050000-5672-656c-dd78-9d8f548243d7	1251	Moravče
00050000-5672-656c-e00d-f697c860c0fe	9226	Moravske Toplice
00050000-5672-656c-68ce-3e39a175c754	5216	Most na Soči
00050000-5672-656c-4171-f22a828cab18	1221	Motnik
00050000-5672-656c-9de7-e5db11e2fe70	3330	Mozirje
00050000-5672-656c-81e1-1eff73ad7d33	9000	Murska Sobota 
00050000-5672-656c-6cca-4d55210c2d6c	9001	Murska Sobota - poštni predali
00050000-5672-656c-95a1-ac3becfb8994	2366	Muta
00050000-5672-656c-ef03-0c9dd668bf40	4202	Naklo
00050000-5672-656c-69ce-ae5ebb06cda0	3331	Nazarje
00050000-5672-656c-2566-4f2a1a7971b9	1357	Notranje Gorice
00050000-5672-656c-2720-b5d4dbfa6b47	3203	Nova Cerkev
00050000-5672-656c-b74b-7c8cb9fe1a97	5000	Nova Gorica 
00050000-5672-656c-a20c-dc7d066308d3	5001	Nova Gorica - poštni predali
00050000-5672-656c-8000-621712a29d76	1385	Nova vas
00050000-5672-656c-9d3b-c854f6f9ab0d	8000	Novo mesto
00050000-5672-656c-37bb-704ee5ee1e33	8001	Novo mesto - poštni predali
00050000-5672-656c-8e09-017bccc256e4	6243	Obrov
00050000-5672-656c-400d-3246d52ab308	9233	Odranci
00050000-5672-656c-3630-4d285d74e927	2317	Oplotnica
00050000-5672-656c-dcbe-0ef793c7ab8c	2312	Orehova vas
00050000-5672-656c-dc85-c0b896c1551f	2270	Ormož
00050000-5672-656c-c533-d53eae60b682	1316	Ortnek
00050000-5672-656c-6044-5154f4c6cb78	1337	Osilnica
00050000-5672-656c-0840-6cad49f5c891	8222	Otočec
00050000-5672-656c-f736-a6448aed42fa	2361	Ožbalt
00050000-5672-656c-3c12-55910be37b17	2231	Pernica
00050000-5672-656c-a938-03546f0f93c9	2211	Pesnica pri Mariboru
00050000-5672-656c-7dd0-6860b5a30db1	9203	Petrovci
00050000-5672-656c-2475-24c4fe6572f0	3301	Petrovče
00050000-5672-656c-ebdf-b63bf1909df1	6330	Piran/Pirano
00050000-5672-656c-18c1-2cd6e048190e	8255	Pišece
00050000-5672-656c-0ba1-cbe5a2b44ac9	6257	Pivka
00050000-5672-656c-db20-eec8745d0528	6232	Planina
00050000-5672-656c-511d-96acbc6bbee2	3225	Planina pri Sevnici
00050000-5672-656c-5ac3-eed8d5b086be	6276	Pobegi
00050000-5672-656c-3141-d1f3c0a9ac49	8312	Podbočje
00050000-5672-656c-fd24-f465073dd16d	5243	Podbrdo
00050000-5672-656c-edb1-d0f5406d33ea	3254	Podčetrtek
00050000-5672-656c-b4d1-fce6d6010d73	2273	Podgorci
00050000-5672-656c-a3a6-7cb35321e4de	6216	Podgorje
00050000-5672-656c-1a50-450f52cd8eb9	2381	Podgorje pri Slovenj Gradcu
00050000-5672-656c-9923-58edf9748df2	6244	Podgrad
00050000-5672-656c-97fe-4c2773c35252	1414	Podkum
00050000-5672-656c-3724-b4dbc27ac633	2286	Podlehnik
00050000-5672-656c-692f-9e5f48549b25	5272	Podnanos
00050000-5672-656c-f9d9-4b95f9865353	4244	Podnart
00050000-5672-656c-6c53-5d2a0ac000de	3241	Podplat
00050000-5672-656c-cabc-1332de6a2209	3257	Podsreda
00050000-5672-656c-baca-73f381ff4d5d	2363	Podvelka
00050000-5672-656c-a6f7-c45d1e63a0d9	2208	Pohorje
00050000-5672-656c-96b3-c665fb5df491	2257	Polenšak
00050000-5672-656c-1b9c-bd71b9669bad	1355	Polhov Gradec
00050000-5672-656c-4d38-5f307562ae24	4223	Poljane nad Škofjo Loko
00050000-5672-656c-78b7-3ce2d08a6fec	2319	Poljčane
00050000-5672-656c-5edc-933ef0097bf4	1272	Polšnik
00050000-5672-656c-3ede-9c3b274e7a71	3313	Polzela
00050000-5672-656c-c38e-1db5f2c0c0f7	3232	Ponikva
00050000-5672-656c-2d20-858dbb76a82c	6320	Portorož/Portorose
00050000-5672-656c-da90-a043167ba9f0	6230	Postojna
00050000-5672-656c-b698-609317293ba9	2331	Pragersko
00050000-5672-656c-c171-a074ed74f878	3312	Prebold
00050000-5672-656c-b7a3-8ec7c514aa9c	4205	Preddvor
00050000-5672-656c-4097-ad87e92ab2b8	6255	Prem
00050000-5672-656c-6d78-8c0814d1ea8a	1352	Preserje
00050000-5672-656c-d331-c254405e3bc7	6258	Prestranek
00050000-5672-656c-3a59-418075f48512	2391	Prevalje
00050000-5672-656c-0965-da5389059ee5	3262	Prevorje
00050000-5672-656c-c39e-8c72df63113f	1276	Primskovo 
00050000-5672-656c-68fe-4152fe97afb0	3253	Pristava pri Mestinju
00050000-5672-656c-dfed-6097c42dd472	9207	Prosenjakovci/Partosfalva
00050000-5672-656c-1561-98347cbeca1e	5297	Prvačina
00050000-5672-656c-4d94-b1763bc694b5	2250	Ptuj
00050000-5672-656c-6481-14ed90bc35e1	2323	Ptujska Gora
00050000-5672-656c-22ee-502094542855	9201	Puconci
00050000-5672-656c-5280-42f8da073539	2327	Rače
00050000-5672-656c-13b3-215658682971	1433	Radeče
00050000-5672-656c-bebe-957face7c133	9252	Radenci
00050000-5672-656c-c014-5ecfcc484252	2360	Radlje ob Dravi
00050000-5672-656c-2529-95d334c3f9ed	1235	Radomlje
00050000-5672-656c-8851-6f11d8ded30e	4240	Radovljica
00050000-5672-656c-18e7-6a61fd56e10c	8274	Raka
00050000-5672-656c-76f2-67c6db68b4fc	1381	Rakek
00050000-5672-656c-3428-562eaa041230	4283	Rateče - Planica
00050000-5672-656c-b71d-f8de8092def1	2390	Ravne na Koroškem
00050000-5672-656c-0aff-726f87a9458b	9246	Razkrižje
00050000-5672-656c-6c28-9bfc157b40e7	3332	Rečica ob Savinji
00050000-5672-656c-443c-8b5b384126fe	5292	Renče
00050000-5672-656c-646b-173ea1ccceb4	1310	Ribnica
00050000-5672-656c-7269-6ddfb242ddd8	2364	Ribnica na Pohorju
00050000-5672-656c-5812-8fbd59061bc0	3272	Rimske Toplice
00050000-5672-656c-984f-5f1dc0b42d34	1314	Rob
00050000-5672-656c-f67c-0900585aaf09	5215	Ročinj
00050000-5672-656c-aadd-035d88a74600	3250	Rogaška Slatina
00050000-5672-656c-df0c-d11e404e3a06	9262	Rogašovci
00050000-5672-656c-20fd-2d43f1144866	3252	Rogatec
00050000-5672-656c-9b9e-133a6f5b8407	1373	Rovte
00050000-5672-656c-e7a5-2b9ce92c1085	2342	Ruše
00050000-5672-656c-fb9f-dc16736ea907	1282	Sava
00050000-5672-656c-0a4b-012477e7da84	6333	Sečovlje/Sicciole
00050000-5672-656c-fc2a-1e74dcfff2ca	4227	Selca
00050000-5672-656c-1d85-728b4186d899	2352	Selnica ob Dravi
00050000-5672-656c-81a7-94aa18277008	8333	Semič
00050000-5672-656c-a648-309dd14e6a6e	8281	Senovo
00050000-5672-656c-e086-48b76239335e	6224	Senožeče
00050000-5672-656c-b95e-bc929386fb4c	8290	Sevnica
00050000-5672-656c-83cc-c64a7e5c31d0	6210	Sežana
00050000-5672-656c-e192-8b7c8da5ff82	2214	Sladki Vrh
00050000-5672-656c-6757-4dff6ec3a701	5283	Slap ob Idrijci
00050000-5672-656c-29e1-01a061597957	2380	Slovenj Gradec
00050000-5672-656c-2a7c-2737286b5706	2310	Slovenska Bistrica
00050000-5672-656c-ea4d-fde92f7f886d	3210	Slovenske Konjice
00050000-5672-656c-5072-c465d5844abd	1216	Smlednik
00050000-5672-656c-6f0d-4172dbdba5e8	5232	Soča
00050000-5672-656c-5c45-3e05f9848abe	1317	Sodražica
00050000-5672-656c-c4ef-4d3f581d4e5c	3335	Solčava
00050000-5672-656c-e2cb-2fa5eca8a58c	5250	Solkan
00050000-5672-656c-70f7-62d939ba1f0b	4229	Sorica
00050000-5672-656c-4284-fa184592ce73	4225	Sovodenj
00050000-5672-656c-7e9c-7c841710dfcc	5281	Spodnja Idrija
00050000-5672-656c-1105-1881873b978d	2241	Spodnji Duplek
00050000-5672-656c-3f91-92115d6bb005	9245	Spodnji Ivanjci
00050000-5672-656c-a802-5ec6e0635889	2277	Središče ob Dravi
00050000-5672-656c-0547-23cbd3e7f1ee	4267	Srednja vas v Bohinju
00050000-5672-656c-e803-5bcb77afa9e7	8256	Sromlje 
00050000-5672-656c-def9-8cb6c123d590	5224	Srpenica
00050000-5672-656c-ce62-58db09ee55bc	1242	Stahovica
00050000-5672-656c-6624-135410831b6a	1332	Stara Cerkev
00050000-5672-656c-fc96-99297b33d9cf	8342	Stari trg ob Kolpi
00050000-5672-656c-b0d6-6ab23e68c0c1	1386	Stari trg pri Ložu
00050000-5672-656c-ca76-4aa582a020e9	2205	Starše
00050000-5672-656c-c149-e78599f103a6	2289	Stoperce
00050000-5672-656c-dea4-faf1a4f03b75	8322	Stopiče
00050000-5672-656c-6d9b-f115afee146b	3206	Stranice
00050000-5672-656c-5dc4-7cd5e689e856	8351	Straža
00050000-5672-656c-8e9c-1bebada2af8e	1313	Struge
00050000-5672-656c-dc34-787c1ae8e6ad	8293	Studenec
00050000-5672-656c-9861-6b88757cef0e	8331	Suhor
00050000-5672-656c-5df3-9b47eccd6efb	2233	Sv. Ana v Slovenskih goricah
00050000-5672-656c-8294-61d8825fcfc7	2235	Sv. Trojica v Slovenskih goricah
00050000-5672-656c-61f9-fdd2693aec02	2353	Sveti Duh na Ostrem Vrhu
00050000-5672-656c-16b1-1eb3dde6aa8a	9244	Sveti Jurij ob Ščavnici
00050000-5672-656c-a061-3146de11f976	3264	Sveti Štefan
00050000-5672-656c-6c8c-83d20c358562	2258	Sveti Tomaž
00050000-5672-656c-84a5-51bcc43f8f19	9204	Šalovci
00050000-5672-656c-7779-678ac199ad53	5261	Šempas
00050000-5672-656c-d1d0-9fb06954ff55	5290	Šempeter pri Gorici
00050000-5672-656c-e74a-ab0fbac751c3	3311	Šempeter v Savinjski dolini
00050000-5672-656c-c7d3-e4da2930db01	4208	Šenčur
00050000-5672-656c-212f-468e28b2819a	2212	Šentilj v Slovenskih goricah
00050000-5672-656c-cadd-e3cba82aebe8	8297	Šentjanž
00050000-5672-656c-795b-e0da3397f194	2373	Šentjanž pri Dravogradu
00050000-5672-656c-b4e7-ca2764a00cb6	8310	Šentjernej
00050000-5672-656c-adef-cf7e4bdf9efa	3230	Šentjur
00050000-5672-656c-d649-aed46e1949a9	3271	Šentrupert
00050000-5672-656c-8ee8-3bc2c4ea92d7	8232	Šentrupert
00050000-5672-656c-a2d4-07067fa17423	1296	Šentvid pri Stični
00050000-5672-656c-8e97-fc132ff1bdc7	8275	Škocjan
00050000-5672-656c-5409-7bb9d732a21e	6281	Škofije
00050000-5672-656c-a78e-6425c8d75e09	4220	Škofja Loka
00050000-5672-656c-b59f-23ac39efd800	3211	Škofja vas
00050000-5672-656c-2bc5-ff318ae370c2	1291	Škofljica
00050000-5672-656c-d2c1-20d005a9b9ad	6274	Šmarje
00050000-5672-656c-3cce-9a66ae9f5593	1293	Šmarje - Sap
00050000-5672-656c-2f3e-6e2b0995704f	3240	Šmarje pri Jelšah
00050000-5672-656c-019e-b1c9b856c63f	8220	Šmarješke Toplice
00050000-5672-656c-9a50-d02d10bdd758	2315	Šmartno na Pohorju
00050000-5672-656c-c275-1130623a55ee	3341	Šmartno ob Dreti
00050000-5672-656c-6456-91e616e63dfa	3327	Šmartno ob Paki
00050000-5672-656c-7b48-872efabfb6b0	1275	Šmartno pri Litiji
00050000-5672-656c-3956-79cdd8f517a5	2383	Šmartno pri Slovenj Gradcu
00050000-5672-656c-2bdf-1dfebabd3f31	3201	Šmartno v Rožni dolini
00050000-5672-656c-d955-05a387b30d1b	3325	Šoštanj
00050000-5672-656c-30fb-d50c44cfed0c	6222	Štanjel
00050000-5672-656c-ffa8-5f247c0f9e11	3220	Štore
00050000-5672-656c-14d0-a4e635fe7859	3304	Tabor
00050000-5672-656c-cb21-10d7b987220c	3221	Teharje
00050000-5672-656c-d810-8090bfbdce0a	9251	Tišina
00050000-5672-656c-c8b8-c8ced681dfe6	5220	Tolmin
00050000-5672-656c-38aa-85b072645848	3326	Topolšica
00050000-5672-656c-af50-fcb1d182fff6	2371	Trbonje
00050000-5672-656c-d4a9-e3693817cc0f	1420	Trbovlje
00050000-5672-656c-d47d-167b3b3a15f0	8231	Trebelno 
00050000-5672-656c-2a87-af17dc7d7a5d	8210	Trebnje
00050000-5672-656c-89d0-782116f0f576	5252	Trnovo pri Gorici
00050000-5672-656c-d681-0130dca08fe8	2254	Trnovska vas
00050000-5672-656c-2f2f-65fc88e85792	1222	Trojane
00050000-5672-656c-ba98-585d98708788	1236	Trzin
00050000-5672-656c-fa97-43666a1500fd	4290	Tržič
00050000-5672-656c-e217-b19f19acdf70	8295	Tržišče
00050000-5672-656c-bca5-9fde83fb697f	1311	Turjak
00050000-5672-656c-5318-9fcfb0f6484e	9224	Turnišče
00050000-5672-656c-2202-93439a06afef	8323	Uršna sela
00050000-5672-656c-16b2-de994d60b5d6	1252	Vače
00050000-5672-656c-7843-5f1fcbd78a7e	3320	Velenje 
00050000-5672-656c-a008-86d52da44e02	3322	Velenje - poštni predali
00050000-5672-656c-0efc-f6ae74a23928	8212	Velika Loka
00050000-5672-656c-c508-114f7bee3bdd	2274	Velika Nedelja
00050000-5672-656c-ad33-9d1a49bafc00	9225	Velika Polana
00050000-5672-656c-c705-ac79f5ed90bf	1315	Velike Lašče
00050000-5672-656c-8b49-515b830ab987	8213	Veliki Gaber
00050000-5672-656c-ab13-c82c06a5c50e	9241	Veržej
00050000-5672-656c-3704-471388cb8ea6	1312	Videm - Dobrepolje
00050000-5672-656c-a8ea-191a5507a95d	2284	Videm pri Ptuju
00050000-5672-656c-372c-7d5942a19fc8	8344	Vinica
00050000-5672-656c-b7f2-5425f0b7b723	5271	Vipava
00050000-5672-656c-eaf4-a9f201e76c87	4212	Visoko
00050000-5672-656c-86ad-edb1f3418385	1294	Višnja Gora
00050000-5672-656c-480f-71939667c196	3205	Vitanje
00050000-5672-656c-5d65-0d98484fe070	2255	Vitomarci
00050000-5672-656c-5cfb-877e621f955f	1217	Vodice
00050000-5672-656c-107e-74bcce23ee0e	3212	Vojnik\t
00050000-5672-656c-a6e5-5f87e595f28b	5293	Volčja Draga
00050000-5672-656c-d954-b11a3c7e586c	2232	Voličina
00050000-5672-656c-e3d8-40f934886954	3305	Vransko
00050000-5672-656c-ad2e-78239badbf7b	6217	Vremski Britof
00050000-5672-656c-37d1-780602840908	1360	Vrhnika
00050000-5672-656c-279a-226edbcfaf6f	2365	Vuhred
00050000-5672-656c-cf26-f14a0b3d5e03	2367	Vuzenica
00050000-5672-656c-808a-0422b6cd6f76	8292	Zabukovje 
00050000-5672-656c-7185-975de359cafc	1410	Zagorje ob Savi
00050000-5672-656c-9eb6-681e78193b40	1303	Zagradec
00050000-5672-656c-fdf9-cff39071bb22	2283	Zavrč
00050000-5672-656c-aacf-615b5fedc908	8272	Zdole 
00050000-5672-656c-0a5e-33957f12be66	4201	Zgornja Besnica
00050000-5672-656c-6213-35b3a63c065b	2242	Zgornja Korena
00050000-5672-656c-618c-f1b50433c5d4	2201	Zgornja Kungota
00050000-5672-656c-7420-7b2656294336	2316	Zgornja Ložnica
00050000-5672-656c-9ff1-69449bba922d	2314	Zgornja Polskava
00050000-5672-656c-cd59-7e8658f33300	2213	Zgornja Velka
00050000-5672-656c-f5ee-823dbd79ac04	4247	Zgornje Gorje
00050000-5672-656c-1720-b6b922e3005e	4206	Zgornje Jezersko
00050000-5672-656c-758e-9d611da55590	2285	Zgornji Leskovec
00050000-5672-656c-c7f2-b9cb81c6fe3c	1432	Zidani Most
00050000-5672-656c-4a01-3f01511e3d29	3214	Zreče
00050000-5672-656c-6ef7-6f16ef101eb0	4209	Žabnica
00050000-5672-656c-1b9d-184dee2363c6	3310	Žalec
00050000-5672-656c-651e-7bf1b0929fd8	4228	Železniki
00050000-5672-656c-52c5-7e5f068b7f0b	2287	Žetale
00050000-5672-656c-60e4-4558799c0429	4226	Žiri
00050000-5672-656c-f79a-2df821da0f30	4274	Žirovnica
00050000-5672-656c-3fe9-ac8f8585ca3e	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32486134)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32485698)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32485446)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5672-656f-9e62-ea09692dfa16	00080000-5672-656f-607d-ac9658e08817	\N	00040000-5672-656c-6e88-857e5d8af088	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5672-656f-3be5-93cb6424ce7b	00080000-5672-656f-607d-ac9658e08817	\N	00040000-5672-656c-6e88-857e5d8af088	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5672-656f-2e26-9645dd65ba22	00080000-5672-656f-128b-a798abad8f7b	\N	00040000-5672-656c-6e88-857e5d8af088	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32485590)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5672-656c-e0c3-553ff232362b	novo leto	1	1	\N	t
00430000-5672-656c-28a7-8e547e8737fc	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5672-656c-0058-2e8c4be950e2	dan upora proti okupatorju	27	4	\N	t
00430000-5672-656c-0bf4-ed44b81da334	praznik dela	1	5	\N	t
00430000-5672-656c-07d0-91363b500743	praznik dela	2	5	\N	t
00430000-5672-656c-6c07-b651507b63d7	dan Primoža Trubarja	8	6	\N	f
00430000-5672-656c-c899-ce6a4862b85d	dan državnosti	25	6	\N	t
00430000-5672-656c-6216-1029dced40d6	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5672-656c-1a12-5050773599ab	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5672-656c-353f-3ad349668b44	dan suverenosti	25	10	\N	f
00430000-5672-656c-f9c3-4fbf13452896	dan spomina na mrtve	1	11	\N	t
00430000-5672-656c-d47a-e690ecc3baf1	dan Rudolfa Maistra	23	11	\N	f
00430000-5672-656c-c942-81773d6781a5	božič	25	12	\N	t
00430000-5672-656c-f92b-d7a9e969eea2	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5672-656c-ee28-a8ffd08d2f1d	Marijino vnebovzetje	15	8	\N	t
00430000-5672-656c-c197-1495efdefff5	dan reformacije	31	10	\N	t
00430000-5672-656c-ff87-5e0becfd280f	velikonočna nedelja	27	3	2016	t
00430000-5672-656c-68c4-78806ce1ea49	velikonočna nedelja	16	4	2017	t
00430000-5672-656c-8123-d17881ef1f4a	velikonočna nedelja	1	4	2018	t
00430000-5672-656c-745f-aabdcf1696a2	velikonočna nedelja	21	4	2019	t
00430000-5672-656c-5975-4a658e58f5ab	velikonočna nedelja	12	4	2020	t
00430000-5672-656c-bd38-46720e82beb6	velikonočna nedelja	4	4	2021	t
00430000-5672-656c-08ed-4000d0020154	velikonočna nedelja	17	4	2022	t
00430000-5672-656c-8367-4aa7e0eb6758	velikonočna nedelja	9	4	2023	t
00430000-5672-656c-d717-bf2630ea6685	velikonočna nedelja	31	3	2024	t
00430000-5672-656c-3027-e853f6257a2c	velikonočna nedelja	20	4	2025	t
00430000-5672-656c-2056-d3d3c051b033	velikonočna nedelja	5	4	2026	t
00430000-5672-656c-ed99-d872f4274278	velikonočna nedelja	28	3	2027	t
00430000-5672-656c-ac66-84ca7e5e0448	velikonočna nedelja	16	4	2028	t
00430000-5672-656c-fa47-eb0a624c521d	velikonočna nedelja	1	4	2029	t
00430000-5672-656c-bf8c-a7781fb5ab27	velikonočna nedelja	21	4	2030	t
00430000-5672-656c-2045-f2fb41008d18	velikonočni ponedeljek	28	3	2016	t
00430000-5672-656c-d816-359d5ecfef67	velikonočni ponedeljek	17	4	2017	t
00430000-5672-656c-e8df-a54065457f78	velikonočni ponedeljek	2	4	2018	t
00430000-5672-656c-787f-32ce26ba8d93	velikonočni ponedeljek	22	4	2019	t
00430000-5672-656c-28ef-500e972853ae	velikonočni ponedeljek	13	4	2020	t
00430000-5672-656c-b836-206e9edc02fe	velikonočni ponedeljek	5	4	2021	t
00430000-5672-656c-d9bd-77ca185903f5	velikonočni ponedeljek	18	4	2022	t
00430000-5672-656c-7130-8ec01d267507	velikonočni ponedeljek	10	4	2023	t
00430000-5672-656c-522f-ef643de11a1d	velikonočni ponedeljek	1	4	2024	t
00430000-5672-656c-3877-a25091ca70c1	velikonočni ponedeljek	21	4	2025	t
00430000-5672-656c-3d83-1eede4052ea3	velikonočni ponedeljek	6	4	2026	t
00430000-5672-656c-f51d-d369743a6e48	velikonočni ponedeljek	29	3	2027	t
00430000-5672-656c-9a5d-6f6aa9485289	velikonočni ponedeljek	17	4	2028	t
00430000-5672-656c-f8fe-ffe352b6db7d	velikonočni ponedeljek	2	4	2029	t
00430000-5672-656c-eb2a-c95a38c05509	velikonočni ponedeljek	22	4	2030	t
00430000-5672-656c-702a-5ad377b26825	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5672-656c-118a-b699e5ae8571	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5672-656c-8b3d-10253a2edb0f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5672-656c-dfe5-fc05eb4f8898	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5672-656c-d551-64e5dae1d7ef	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5672-656c-9fa1-cb3262903ab8	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5672-656c-4b18-d8397789c82a	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5672-656c-5734-b7386972ecd2	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5672-656c-cfbd-e2385f9d5bbf	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5672-656c-0db4-1d6ebef229dc	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5672-656c-efc6-38f0029efa14	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5672-656c-4e6a-e4148d011515	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5672-656c-c2cb-e7bbe6e8ef97	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5672-656c-7279-5ba8455280a4	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5672-656c-b516-19569952f2bc	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32485550)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32485562)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32485710)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32486148)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32486158)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5672-656f-1f94-13621d520820	00080000-5672-656f-f771-1b7c2215f519	0987	AK
00190000-5672-656f-00b5-f17c5be7c433	00080000-5672-656f-128b-a798abad8f7b	0989	AK
00190000-5672-656f-c2fb-3ab34c39e70e	00080000-5672-656f-461a-fb8537eda5c7	0986	AK
00190000-5672-656f-22e2-c402473fabcf	00080000-5672-656f-abd3-59bf899770b8	0984	AK
00190000-5672-656f-4766-cd11c3668370	00080000-5672-656f-2a0c-349f6a0d2f15	0983	AK
00190000-5672-656f-c335-b5680b8d878a	00080000-5672-656f-30db-8c72caf7f968	0982	AK
00190000-5672-6571-6e63-1ce022c7bc66	00080000-5672-6571-e296-c134f58f5bf0	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32486047)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5672-656f-3c89-fed4dc4282b6	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32486166)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32485739)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5672-656f-4f25-51aa4e0d513f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5672-656f-a8b0-449eb333d06b	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5672-656f-cf14-ac30e265eb32	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5672-656f-fff4-da7b7db6f46d	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5672-656f-cbf7-b7760f71c6d3	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5672-656f-c893-504edffef0ea	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5672-656f-278b-a047a889aa1c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32485683)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32485673)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32485885)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32485815)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32485524)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32485286)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5672-6571-e296-c134f58f5bf0	00010000-5672-656d-6a8b-1cec544e965a	2015-12-17 08:34:09	INS	a:0:{}
2	App\\Entity\\Option	00000000-5672-6571-13db-42d107e0d49d	00010000-5672-656d-6a8b-1cec544e965a	2015-12-17 08:34:09	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5672-6571-6e63-1ce022c7bc66	00010000-5672-656d-6a8b-1cec544e965a	2015-12-17 08:34:09	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32485752)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32485324)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5672-656d-bcae-07fa6b8581c9	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5672-656d-5a19-38dc3e91e98d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5672-656d-45aa-f12534e940c6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5672-656d-f502-172acb4ccd5b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5672-656d-e2f1-c3330bb70648	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5672-656d-81a0-8f2af583e98d	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5672-656d-50ee-f1f10e7500b1	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5672-656d-234c-7eb3ea0288dc	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5672-656d-0ff6-f051dd6c6c3a	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-656d-2f07-b980236fc2ed	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-656d-ac4f-aeee2127d9e1	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-656d-df5d-2a163ada78f5	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5672-656d-10b6-f314f1f8cf4c	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5672-656d-6e7e-5d58a444ab51	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5672-656d-944a-ebabd2dc2a12	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5672-656d-aad6-6cf196070a29	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5672-656d-42c0-8ccc27c85463	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5672-656d-4fcf-95b74d33f7e4	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5672-656d-4f9d-ea122ec1944d	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5672-656d-ce28-f9bf1c9cbffd	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5672-656d-edd1-8c109de914d8	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5672-656d-ddd4-fa4be5f018a7	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5672-656d-f5a8-347d3d1a8e52	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5672-656d-af74-fd9ea13f351f	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5672-656d-8a87-ec13bf01b5ab	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5672-656d-00b0-b12a84e51d60	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5672-656d-af5e-220470e395e2	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5672-656d-c20f-55fadaed2b8a	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5672-656d-7eb6-b31d412d1be3	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5672-656d-e8be-309359497fb0	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5672-656d-6000-1b72a89d2663	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5672-656d-3ab0-7f305a62c8bc	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5672-656d-cf1c-8eda962edcc7	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5672-656d-fb76-beec3f7f9ee1	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5672-656d-c755-4052b83667d1	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5672-656d-3596-4d4b832809af	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5672-656d-08e6-b0010f6a16dd	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5672-656d-6740-e16b3a36c90e	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5672-656d-7e4c-b9ce413610eb	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5672-656d-4b60-3b92c06f8773	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5672-656d-519d-6cb83d59fdec	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5672-656d-4d9f-d2669419c9e0	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5672-656d-96e7-e242b9ec623a	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5672-656d-b5d4-6eb0ea7be577	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5672-656d-5360-1fa54c4acd57	direktor	minimalne pravice za direktorja	t
00020000-5672-656d-bffe-fe5cc485bec5	arhivar	arhivar	t
00020000-5672-656d-d535-be28e103eef4	dramaturg	dramaturg	t
00020000-5672-656d-a94d-fa7c7beb677c	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5672-656d-bfcf-1eaf988d5648	poslovni-sekretar	poslovni sekretar	t
00020000-5672-656d-481d-ba03c804c377	vodja-tehnike	vodja tehnike	t
00020000-5672-656d-7698-dc370f37975a	racunovodja	računovodja	t
00020000-5672-656f-3dd4-40ada8a8e199	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5672-656f-9ae6-acb532989eaa	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-b9fa-d4684cebccd4	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-a5ea-09911d78778a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-db2c-c00ebc21b228	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-f8ba-e79084f1891f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-1557-f16627278111	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-574a-327a05d61e55	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5672-656f-8bc1-60c2f30dd157	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5672-656f-2777-7970fbe05d16	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-4645-6063be4b9b48	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-2aaf-70a84456d708	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-04a4-1660219e558b	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-6c3e-27f457ceb471	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-144c-0fd8f025d993	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-a9e8-ce90d42b2d6a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-824f-49e3583f13c3	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-4201-30f24c3e61d2	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-2639-28bc99c1a215	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-f229-312151598bda	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5672-656f-5932-7edbfab6b1df	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-99f8-1804b1eac1e7	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-8fd6-683b70ceb98e	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-1ce1-c533f41291d1	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-589f-9bc0c8378e5e	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-dbec-f704004e3c54	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-d27d-18a9ba411238	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-1d91-fe709f504fb0	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-08bf-0550e3a760a7	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-2c58-7855c1f2927d	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-62e0-8676839f20d4	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-1d63-bffff380d406	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-c3f8-e1f41ce3a5f4	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-f633-9e290cfb1942	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-38ea-a911bbb20e95	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-20d3-566af0d74522	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5672-656f-ebf1-798e0d4dadc5	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5672-656f-514a-a9eb9eb4c205	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5672-656f-c051-65f5e6ef1304	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32485308)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5672-656d-c62f-65735db95317	00020000-5672-656d-45aa-f12534e940c6
00010000-5672-656d-6a8b-1cec544e965a	00020000-5672-656d-45aa-f12534e940c6
00010000-5672-656f-340f-b729c6cc6e77	00020000-5672-656f-3dd4-40ada8a8e199
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-9ae6-acb532989eaa
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-f8ba-e79084f1891f
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-2777-7970fbe05d16
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-2aaf-70a84456d708
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-6c3e-27f457ceb471
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-2639-28bc99c1a215
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-a5ea-09911d78778a
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-5932-7edbfab6b1df
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-1ce1-c533f41291d1
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-dbec-f704004e3c54
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-1d91-fe709f504fb0
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-2c58-7855c1f2927d
00010000-5672-656f-4b59-39a12c6a1b36	00020000-5672-656f-f633-9e290cfb1942
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-9ae6-acb532989eaa
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-b9fa-d4684cebccd4
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-a5ea-09911d78778a
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-db2c-c00ebc21b228
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-6c3e-27f457ceb471
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-824f-49e3583f13c3
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-5932-7edbfab6b1df
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-1ce1-c533f41291d1
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-dbec-f704004e3c54
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-1d91-fe709f504fb0
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-2c58-7855c1f2927d
00010000-5672-656f-f672-060477c3f86e	00020000-5672-656f-f633-9e290cfb1942
00010000-5672-656f-bbdd-51888d1ee7f0	00020000-5672-656f-9ae6-acb532989eaa
00010000-5672-656f-bbdd-51888d1ee7f0	00020000-5672-656f-b9fa-d4684cebccd4
00010000-5672-656f-bbdd-51888d1ee7f0	00020000-5672-656f-a5ea-09911d78778a
00010000-5672-656f-bbdd-51888d1ee7f0	00020000-5672-656f-db2c-c00ebc21b228
00010000-5672-656f-bbdd-51888d1ee7f0	00020000-5672-656f-2aaf-70a84456d708
00010000-5672-656f-bbdd-51888d1ee7f0	00020000-5672-656f-6c3e-27f457ceb471
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-b9fa-d4684cebccd4
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-1557-f16627278111
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-4645-6063be4b9b48
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-04a4-1660219e558b
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-2aaf-70a84456d708
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-4201-30f24c3e61d2
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-6c3e-27f457ceb471
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-144c-0fd8f025d993
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-5932-7edbfab6b1df
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-99f8-1804b1eac1e7
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-1ce1-c533f41291d1
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-589f-9bc0c8378e5e
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-dbec-f704004e3c54
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-d27d-18a9ba411238
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-1d91-fe709f504fb0
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-08bf-0550e3a760a7
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-2c58-7855c1f2927d
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-62e0-8676839f20d4
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-f633-9e290cfb1942
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-38ea-a911bbb20e95
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-ebf1-798e0d4dadc5
00010000-5672-656f-b76f-7414e9c85732	00020000-5672-656f-514a-a9eb9eb4c205
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-b9fa-d4684cebccd4
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-1557-f16627278111
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-8bc1-60c2f30dd157
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-4645-6063be4b9b48
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-04a4-1660219e558b
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-2aaf-70a84456d708
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-4201-30f24c3e61d2
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-6c3e-27f457ceb471
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-144c-0fd8f025d993
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-a9e8-ce90d42b2d6a
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-5932-7edbfab6b1df
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-99f8-1804b1eac1e7
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-8fd6-683b70ceb98e
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-1ce1-c533f41291d1
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-589f-9bc0c8378e5e
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-dbec-f704004e3c54
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-d27d-18a9ba411238
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-1d91-fe709f504fb0
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-08bf-0550e3a760a7
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-2c58-7855c1f2927d
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-62e0-8676839f20d4
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-f633-9e290cfb1942
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-38ea-a911bbb20e95
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-20d3-566af0d74522
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-ebf1-798e0d4dadc5
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-514a-a9eb9eb4c205
00010000-5672-656f-29e3-3fb3227c1076	00020000-5672-656f-c051-65f5e6ef1304
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-b9fa-d4684cebccd4
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-a5ea-09911d78778a
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-1557-f16627278111
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-574a-327a05d61e55
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-8bc1-60c2f30dd157
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-f8ba-e79084f1891f
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-4645-6063be4b9b48
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-04a4-1660219e558b
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-2aaf-70a84456d708
00010000-5672-656f-60cd-65ca8dd8a45d	00020000-5672-656f-4201-30f24c3e61d2
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-9ae6-acb532989eaa
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-db2c-c00ebc21b228
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-f8ba-e79084f1891f
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-2777-7970fbe05d16
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-2aaf-70a84456d708
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-6c3e-27f457ceb471
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-2639-28bc99c1a215
00010000-5672-656f-d857-97a1fa1e55a8	00020000-5672-656f-1d63-bffff380d406
00010000-5672-656f-5c2a-b6619a4a4f17	00020000-5672-656f-f229-312151598bda
00010000-5672-656f-d4ff-d92538705a2b	00020000-5672-656d-5360-1fa54c4acd57
00010000-5672-656f-392b-5a23666ea021	00020000-5672-656d-bffe-fe5cc485bec5
00010000-5672-656f-2aa9-31e5317060d0	00020000-5672-656d-d535-be28e103eef4
00010000-5672-656f-d791-67df68d13262	00020000-5672-656d-a94d-fa7c7beb677c
00010000-5672-656f-dafe-749a0b01770c	00020000-5672-656d-bfcf-1eaf988d5648
00010000-5672-656f-4b65-a8dd4257461d	00020000-5672-656d-481d-ba03c804c377
00010000-5672-656f-0da8-77d43df68268	00020000-5672-656d-7698-dc370f37975a
\.


--
-- TOC entry 3157 (class 0 OID 32485766)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32485704)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32485650)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5672-656f-deff-24b2ab93b2e7	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5672-656f-72c5-240fab37e318	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5672-656f-970d-8821ce2c7e16	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32485273)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5672-656c-20d8-814b31700585	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5672-656c-9bfd-00e3d7b7b194	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5672-656c-8898-ebaf97262a60	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5672-656c-e07e-6d1c1b010b1f	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5672-656c-99c7-d2d87ea99109	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32485265)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5672-656c-f32f-f1214d27e0b7	00230000-5672-656c-e07e-6d1c1b010b1f	popa
00240000-5672-656c-fd29-e69d809b91eb	00230000-5672-656c-e07e-6d1c1b010b1f	oseba
00240000-5672-656c-f25b-f9ce59c3e463	00230000-5672-656c-e07e-6d1c1b010b1f	tippopa
00240000-5672-656c-b6e8-905a5d81f80e	00230000-5672-656c-e07e-6d1c1b010b1f	organizacijskaenota
00240000-5672-656c-0156-4504ad649690	00230000-5672-656c-e07e-6d1c1b010b1f	sezona
00240000-5672-656c-b8d2-cd093be776f8	00230000-5672-656c-e07e-6d1c1b010b1f	tipvaje
00240000-5672-656c-81a1-9459564fb55b	00230000-5672-656c-9bfd-00e3d7b7b194	prostor
00240000-5672-656c-152b-5274026c68c0	00230000-5672-656c-e07e-6d1c1b010b1f	besedilo
00240000-5672-656c-5b11-ac53a55de8e5	00230000-5672-656c-e07e-6d1c1b010b1f	uprizoritev
00240000-5672-656c-336e-ff63e5b5fb51	00230000-5672-656c-e07e-6d1c1b010b1f	funkcija
00240000-5672-656c-35a7-a2f6c310d929	00230000-5672-656c-e07e-6d1c1b010b1f	tipfunkcije
00240000-5672-656c-c6ca-d986b092bac8	00230000-5672-656c-e07e-6d1c1b010b1f	alternacija
00240000-5672-656c-44f5-b3ec717376fa	00230000-5672-656c-20d8-814b31700585	pogodba
00240000-5672-656c-6c50-0c53aff6b4d6	00230000-5672-656c-e07e-6d1c1b010b1f	zaposlitev
00240000-5672-656c-0478-98393f774a94	00230000-5672-656c-e07e-6d1c1b010b1f	zvrstuprizoritve
00240000-5672-656c-e0c2-d5bc9a4c2efd	00230000-5672-656c-20d8-814b31700585	programdela
00240000-5672-656c-fac6-33a34be19dad	00230000-5672-656c-e07e-6d1c1b010b1f	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32485260)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
a002560e-16e6-4dd2-9ee0-0f223fc0540c	00240000-5672-656c-f32f-f1214d27e0b7	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32485832)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5672-656f-84b3-81e7476f8619	000e0000-5672-656f-18d1-77a3069985e6	00080000-5672-656f-607d-ac9658e08817	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5672-656c-0848-02268fcda85f
00270000-5672-656f-218a-b6ff3d847300	000e0000-5672-656f-18d1-77a3069985e6	00080000-5672-656f-607d-ac9658e08817	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5672-656c-0848-02268fcda85f
\.


--
-- TOC entry 3122 (class 0 OID 32485408)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32485660)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5672-656f-24b7-421c798433b0	00180000-5672-656f-3ef8-cb6f2268f93b	000c0000-5672-656f-9bf0-2700a9c0c8a5	00090000-5672-656f-e01c-85ea58f65b75	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-656f-e6f2-46feff27fa26	00180000-5672-656f-3ef8-cb6f2268f93b	000c0000-5672-656f-6167-f456c1867f29	00090000-5672-656f-b9e4-a6fe0c8f573a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-656f-cdab-d6418e7784e0	00180000-5672-656f-3ef8-cb6f2268f93b	000c0000-5672-656f-da2a-abc468d8b925	00090000-5672-656f-6aac-33105a7358b7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-656f-9c55-dc5facec9c6d	00180000-5672-656f-3ef8-cb6f2268f93b	000c0000-5672-656f-4ed4-1d7d874c732c	00090000-5672-656f-9a08-ea6ff685167d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-656f-8e35-0b960e67b0f8	00180000-5672-656f-3ef8-cb6f2268f93b	000c0000-5672-656f-3443-d78ac3c4d792	00090000-5672-656f-3d30-2a56ed3fc493	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5672-656f-44b1-4a305bc31bb4	00180000-5672-656f-b61d-1aaa79060fb7	\N	00090000-5672-656f-3d30-2a56ed3fc493	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5672-656f-cfa4-327b97961a41	00180000-5672-656f-b61d-1aaa79060fb7	\N	00090000-5672-656f-b9e4-a6fe0c8f573a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32485873)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5672-656c-0543-0a2896be631d	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5672-656c-59ec-1c80ca86851f	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5672-656c-81a2-35e5e3c5310e	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5672-656c-a9a2-cf34c691ad24	04	Režija	Režija	Režija	umetnik	30
000f0000-5672-656c-d1e8-62da0fd2ce42	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5672-656c-b4d8-e2cbd2a5bfee	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5672-656c-9fb5-5f177f8b84de	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5672-656c-4924-2403c2758e5e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5672-656c-acbf-f03696b4e5db	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5672-656c-a7c6-8acf54c1ed0c	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5672-656c-bfa5-39ddb7f696fc	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5672-656c-22bf-b5f7c32f1c34	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5672-656c-e2be-b0201e9ca52a	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5672-656c-ba2e-387229d617f3	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5672-656c-1fa0-edf075743d3a	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5672-656c-f4c5-de278800dfd6	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5672-656c-b6de-68fea87bc197	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5672-656c-99d3-12b95dcefb9c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32485359)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5672-656f-6fe4-80de129f350a	0001	šola	osnovna ali srednja šola
00400000-5672-656f-6ffd-e81105625bd1	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5672-656f-9976-f6f4a02a490a	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32486178)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5672-656c-85b4-582930cafee3	01	Velika predstava	f	1.00	1.00
002b0000-5672-656c-b67b-71a46893e9b9	02	Mala predstava	f	0.50	0.50
002b0000-5672-656c-1366-3b771a3295ed	03	Mala koprodukcija	t	0.40	1.00
002b0000-5672-656c-31db-4389539f31ba	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5672-656c-70cf-6b78e0274782	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32485640)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5672-656c-47a0-4c33661e60a7	0001	prva vaja	prva vaja
00420000-5672-656c-793d-43c2d3bc08e9	0002	tehnična vaja	tehnična vaja
00420000-5672-656c-80d2-7def9a2f971a	0003	lučna vaja	lučna vaja
00420000-5672-656c-861b-b7f10e98cb9c	0004	kostumska vaja	kostumska vaja
00420000-5672-656c-bb52-9ca2b1af7a7a	0005	foto vaja	foto vaja
00420000-5672-656c-4ee4-60179b3d22a8	0006	1. glavna vaja	1. glavna vaja
00420000-5672-656c-e4f4-7633c996e9e6	0007	2. glavna vaja	2. glavna vaja
00420000-5672-656c-226e-98097982b60d	0008	1. generalka	1. generalka
00420000-5672-656c-89a4-fdcfff545621	0009	2. generalka	2. generalka
00420000-5672-656c-d358-36a1b4e326f6	0010	odprta generalka	odprta generalka
00420000-5672-656c-c2a4-4e368838cefb	0011	obnovitvena vaja	obnovitvena vaja
00420000-5672-656c-0171-ee2802ef4d9f	0012	italijanka	krajša "obnovitvena" vaja
00420000-5672-656c-5c08-13a772cb9539	0013	pevska vaja	pevska vaja
00420000-5672-656c-002f-23be57642105	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5672-656c-5402-59b307bdd450	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32485481)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32485295)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5672-656d-6a8b-1cec544e965a	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO/vLizdzYU7u80pq4IlUn6FZAhLcRCVW	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5672-656f-60d1-99edb5b13d26	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5672-656f-20fd-a084f094f98a	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5672-656f-7f35-a9407c66879c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5672-656f-b440-bacb15114835	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5672-656f-7042-0afd0f58a8ea	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5672-656f-9c82-e3c5a280b820	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5672-656f-765a-52b4a09ea808	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5672-656f-24e2-a3855d166494	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5672-656f-d1f9-2fbdb6794aec	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5672-656f-340f-b729c6cc6e77	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5672-656f-308d-10b35c244f43	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5672-656f-4b59-39a12c6a1b36	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5672-656f-f672-060477c3f86e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5672-656f-bbdd-51888d1ee7f0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5672-656f-b76f-7414e9c85732	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5672-656f-29e3-3fb3227c1076	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5672-656f-60cd-65ca8dd8a45d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5672-656f-d857-97a1fa1e55a8	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5672-656f-5c2a-b6619a4a4f17	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5672-656f-d4ff-d92538705a2b	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5672-656f-392b-5a23666ea021	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5672-656f-2aa9-31e5317060d0	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5672-656f-d791-67df68d13262	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5672-656f-dafe-749a0b01770c	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5672-656f-4b65-a8dd4257461d	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5672-656f-0da8-77d43df68268	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5672-656d-c62f-65735db95317	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32485923)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5672-656f-945e-626041e36754	00160000-5672-656f-787d-c3683d009923	\N	00140000-5672-656c-d09f-9b65851f9299	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5672-656f-cbf7-b7760f71c6d3
000e0000-5672-656f-18d1-77a3069985e6	00160000-5672-656f-fd8f-f5db1a5bf14f	\N	00140000-5672-656c-8476-7da330447c26	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5672-656f-c893-504edffef0ea
000e0000-5672-656f-788d-90dbe8ed40ce	\N	\N	00140000-5672-656c-8476-7da330447c26	00190000-5672-656f-1f94-13621d520820	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5672-656f-cbf7-b7760f71c6d3
000e0000-5672-656f-6ac1-136a0eb32f6f	\N	\N	00140000-5672-656c-8476-7da330447c26	00190000-5672-656f-1f94-13621d520820	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5672-656f-cbf7-b7760f71c6d3
000e0000-5672-656f-729b-9d43b721443d	\N	\N	00140000-5672-656c-8476-7da330447c26	00190000-5672-656f-1f94-13621d520820	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5672-656f-4f25-51aa4e0d513f
000e0000-5672-656f-ffce-41c6409fce1e	\N	\N	00140000-5672-656c-8476-7da330447c26	00190000-5672-656f-1f94-13621d520820	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5672-656f-4f25-51aa4e0d513f
\.


--
-- TOC entry 3136 (class 0 OID 32485580)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5672-656f-a0ea-e525f337fc15	\N	000e0000-5672-656f-18d1-77a3069985e6	1	
00200000-5672-656f-fe95-38aff0e3a4e6	\N	000e0000-5672-656f-18d1-77a3069985e6	2	
00200000-5672-656f-a081-f2b916bc5dc0	\N	000e0000-5672-656f-18d1-77a3069985e6	3	
00200000-5672-656f-6f37-a614a001cccf	\N	000e0000-5672-656f-18d1-77a3069985e6	4	
00200000-5672-656f-23af-bf70d9279932	\N	000e0000-5672-656f-18d1-77a3069985e6	5	
\.


--
-- TOC entry 3153 (class 0 OID 32485731)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32485846)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5672-656c-47f8-fd23b1851db3	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5672-656c-10fc-785a26e37b60	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5672-656c-0608-5206c018ade6	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5672-656c-7fd4-599740d40023	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5672-656c-02d6-504bd0e79348	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5672-656c-e662-3f552c6127ec	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5672-656c-198f-5ca2502bfbbb	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5672-656c-059a-572e1ad882c6	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5672-656c-0848-02268fcda85f	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5672-656c-6ff9-450c0cada7ed	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5672-656c-f45e-96f7c67660e9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5672-656c-6f03-2bf48d1dcd81	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5672-656c-a06f-bcc5f87ab916	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5672-656c-0b53-a61a9d041c1d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5672-656c-2e9c-b864d7d5661b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5672-656c-42e0-8e481b95d2a5	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5672-656c-3806-acad375fa6dc	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5672-656c-c3fa-16588914c5bd	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5672-656c-7765-d5228a037e37	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5672-656c-d8de-ab72af8ad87f	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5672-656c-6e59-1263c4eb7818	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5672-656c-9a16-acd54fa15cc0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5672-656c-2ee4-9e6ff77ef5b1	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5672-656c-0ce3-5f5cad6e2f62	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5672-656c-efc7-50c312c8d7b1	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5672-656c-bc5f-19c3e499af7e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5672-656c-b669-f453b5c0ea2f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5672-656c-e935-bba56421f53e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32486228)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32486197)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32486240)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32485804)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5672-656f-4601-f03d64ed03ef	00090000-5672-656f-b9e4-a6fe0c8f573a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-656f-b7f9-b5fdbe217a31	00090000-5672-656f-6aac-33105a7358b7	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-656f-f941-1a2c12723e54	00090000-5672-656f-89fa-5bb93fd26f48	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-656f-d624-37f1e6330944	00090000-5672-656f-d280-db0397f0d00d	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-656f-3528-eb4395381b74	00090000-5672-656f-d13d-7b1f9dc27f04	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5672-656f-fa17-233026ba3481	00090000-5672-656f-26ae-66828eea6bf2	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32485624)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32485913)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5672-656c-d09f-9b65851f9299	01	Drama	drama (SURS 01)
00140000-5672-656c-6574-3ff74212588b	02	Opera	opera (SURS 02)
00140000-5672-656c-83d3-99571b66923d	03	Balet	balet (SURS 03)
00140000-5672-656c-40a3-e9a417153342	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5672-656c-798f-4c165dd499a6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5672-656c-8476-7da330447c26	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5672-656c-dc69-5b9c787d24cf	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32485794)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32485358)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32485972)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32485962)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32485349)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32485829)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32485871)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32486281)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32485612)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32485634)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32485639)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32486195)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32485507)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32486041)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32485790)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32485578)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32485545)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32485521)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32485696)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32486258)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32486265)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32486289)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32153623)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32485723)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32485479)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32485377)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32485441)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32485404)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32485338)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32485323)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32485729)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32485765)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32485908)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32485432)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32485467)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32486146)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32485702)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32485457)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32485597)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32485566)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32485558)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32485714)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32486155)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32486163)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32486133)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32486176)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32485747)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32485687)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32485678)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32485895)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32485822)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32485533)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32485294)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32485756)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32485312)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32485332)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32485774)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32485709)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32485658)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32485282)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32485270)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32485264)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32485842)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32485413)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32485669)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32485882)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32485366)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32486188)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32485647)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32485492)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32485307)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32485941)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32485587)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32485737)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32485854)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32486238)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32486222)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32486246)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32485812)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32485628)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32485921)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32485802)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32485622)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32485623)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32485621)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32485620)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32485619)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32485843)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32485844)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32485845)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32486260)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32486259)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32485434)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32485435)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32485730)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32486226)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32486225)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32486227)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32486224)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32486223)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32485716)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32485715)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32485588)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32485589)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32485791)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32485793)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32485792)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32485523)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32485522)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32486177)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32485910)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32485911)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32485912)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32486247)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32485946)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32485943)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32485947)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32485945)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32485944)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32485494)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32485493)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32485407)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32485757)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32485339)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32485340)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32485777)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32485776)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32485775)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32485444)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32485443)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32485445)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32485561)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32485559)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32485560)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32485272)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32485682)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32485680)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32485679)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32485681)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32485313)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32485314)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32485738)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32486282)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32485831)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32485830)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32486290)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32486291)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32485703)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32485823)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32485824)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32486046)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32486045)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32486042)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32486043)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32486044)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32485459)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32485458)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32485460)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32485751)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32485750)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32486156)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32486157)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32485976)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32485977)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32485974)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32485975)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32485813)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32485814)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32485691)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32485690)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32485688)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32485689)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32485964)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32485963)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32485534)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32485548)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32485547)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32485546)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32485549)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32485579)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32485567)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32485568)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32486147)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32486196)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32486266)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32486267)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32485379)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32485378)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32485414)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32485415)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32485629)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32485672)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32485671)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32485670)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32485614)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32485615)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32485618)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32485613)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32485617)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32485616)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32485433)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32485367)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32485368)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32485508)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32485510)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32485509)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32485511)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32485697)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32485909)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32485942)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32485883)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32485884)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32485405)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32485406)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32485803)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32485283)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32485480)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32485442)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32485271)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32486189)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32485749)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32485748)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32485648)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32485649)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32485973)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32485468)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32485922)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32486239)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32486164)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32486165)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32485872)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32485659)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32485333)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 32486462)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 32486467)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 32486492)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 32486482)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 32486457)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 32486477)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 32486487)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 32486472)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 32486662)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32486667)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 32486672)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 32486837)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 32486832)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 32486347)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 32486352)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32486577)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 32486817)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32486812)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32486822)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 32486807)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 32486802)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 32486572)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 32486567)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 32486447)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 32486452)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32486617)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32486627)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32486622)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 32486402)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 32486397)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32486557)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32486792)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 32486677)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32486682)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 32486687)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32486827)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 32486707)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 32486692)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 32486712)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32486702)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 32486697)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 32486392)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 32486387)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 32486332)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 32486327)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32486597)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 32486307)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 32486312)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 32486612)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32486607)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 32486602)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32486362)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 32486357)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 32486367)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 32486427)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 32486417)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32486422)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32486292)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 32486532)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 32486522)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 32486517)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 32486527)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 32486297)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32486302)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32486582)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32486852)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 32486657)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 32486652)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 32486857)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 32486862)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32486562)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 32486642)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 32486647)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 32486767)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32486762)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 32486747)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 32486752)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32486757)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32486377)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 32486372)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 32486382)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 32486592)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 32486587)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 32486777)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 32486782)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 32486737)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 32486742)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 32486727)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 32486732)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 32486632)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 32486637)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 32486552)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 32486547)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 32486537)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 32486542)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 32486722)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 32486717)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32486407)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32486412)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32486442)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 32486432)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 32486437)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32486772)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32486787)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32486797)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 32486842)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 32486847)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 32486322)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 32486317)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 32486337)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32486342)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32486497)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 32486512)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32486507)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 32486502)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-17 08:34:10 CET

--
-- PostgreSQL database dump complete
--

