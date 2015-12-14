--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-14 15:08:49 CET

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
-- TOC entry 183 (class 1259 OID 32131963)
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
-- TOC entry 237 (class 1259 OID 32132578)
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
-- TOC entry 236 (class 1259 OID 32132561)
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
-- TOC entry 182 (class 1259 OID 32131956)
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
-- TOC entry 181 (class 1259 OID 32131954)
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
-- TOC entry 227 (class 1259 OID 32132438)
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
-- TOC entry 230 (class 1259 OID 32132468)
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
-- TOC entry 251 (class 1259 OID 32132881)
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
-- TOC entry 203 (class 1259 OID 32132211)
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
-- TOC entry 205 (class 1259 OID 32132243)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32132248)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32132803)
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
-- TOC entry 194 (class 1259 OID 32132108)
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
-- TOC entry 238 (class 1259 OID 32132591)
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
-- TOC entry 223 (class 1259 OID 32132391)
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
-- TOC entry 200 (class 1259 OID 32132182)
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
-- TOC entry 197 (class 1259 OID 32132148)
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
-- TOC entry 195 (class 1259 OID 32132125)
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
-- TOC entry 212 (class 1259 OID 32132305)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32132861)
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
-- TOC entry 250 (class 1259 OID 32132874)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32132896)
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
-- TOC entry 170 (class 1259 OID 32129503)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32132330)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32132082)
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
-- TOC entry 185 (class 1259 OID 32131982)
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
-- TOC entry 189 (class 1259 OID 32132049)
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
-- TOC entry 186 (class 1259 OID 32131993)
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
-- TOC entry 178 (class 1259 OID 32131928)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32131947)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32132337)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32132371)
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
-- TOC entry 233 (class 1259 OID 32132509)
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
-- TOC entry 188 (class 1259 OID 32132029)
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
-- TOC entry 191 (class 1259 OID 32132074)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32132747)
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
-- TOC entry 213 (class 1259 OID 32132311)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32132059)
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
-- TOC entry 202 (class 1259 OID 32132203)
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
-- TOC entry 198 (class 1259 OID 32132163)
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
-- TOC entry 199 (class 1259 OID 32132175)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32132323)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32132761)
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
-- TOC entry 242 (class 1259 OID 32132771)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32132660)
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
-- TOC entry 243 (class 1259 OID 32132779)
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
-- TOC entry 219 (class 1259 OID 32132352)
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
-- TOC entry 211 (class 1259 OID 32132296)
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
-- TOC entry 210 (class 1259 OID 32132286)
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
-- TOC entry 232 (class 1259 OID 32132498)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32132428)
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
-- TOC entry 196 (class 1259 OID 32132137)
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
-- TOC entry 175 (class 1259 OID 32131899)
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
-- TOC entry 174 (class 1259 OID 32131897)
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
-- TOC entry 220 (class 1259 OID 32132365)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32131937)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32131921)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32132379)
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
-- TOC entry 214 (class 1259 OID 32132317)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32132263)
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
-- TOC entry 173 (class 1259 OID 32131886)
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
-- TOC entry 172 (class 1259 OID 32131878)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32131873)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32132445)
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
-- TOC entry 187 (class 1259 OID 32132021)
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
-- TOC entry 209 (class 1259 OID 32132273)
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
-- TOC entry 231 (class 1259 OID 32132486)
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
-- TOC entry 184 (class 1259 OID 32131972)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32132791)
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
-- TOC entry 207 (class 1259 OID 32132253)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32132094)
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
-- TOC entry 176 (class 1259 OID 32131908)
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
-- TOC entry 235 (class 1259 OID 32132536)
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
-- TOC entry 201 (class 1259 OID 32132193)
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
-- TOC entry 218 (class 1259 OID 32132344)
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
-- TOC entry 229 (class 1259 OID 32132459)
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
-- TOC entry 247 (class 1259 OID 32132841)
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
-- TOC entry 246 (class 1259 OID 32132810)
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
-- TOC entry 248 (class 1259 OID 32132853)
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
-- TOC entry 225 (class 1259 OID 32132417)
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
-- TOC entry 204 (class 1259 OID 32132237)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32132526)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32132407)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32131959)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32131902)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32131963)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-566e-cd6d-85e0-d6cd8abd89a1	10	30	Otroci	Abonma za otroke	200
000a0000-566e-cd6d-abcd-bbd8a2f86dcd	20	60	Mladina	Abonma za mladino	400
000a0000-566e-cd6d-2e25-0ff8356a340f	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32132578)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-566e-cd6e-97c5-05d5110a6400	000d0000-566e-cd6d-b324-6a950a90321c	\N	00090000-566e-cd6d-1f50-0ccb5787e6bb	000b0000-566e-cd6d-c586-beb78440f3ae	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-566e-cd6e-e954-6f47f7729af9	000d0000-566e-cd6d-477b-a4d59c67bad4	00100000-566e-cd6d-80a6-712a68f72057	00090000-566e-cd6d-dda1-66d58958979a	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-566e-cd6e-5841-3e7a9b4f548c	000d0000-566e-cd6d-050e-cc7ed90ff057	00100000-566e-cd6d-3540-4b846e22862b	00090000-566e-cd6d-93b8-a44ea2b9f370	\N	0003	t	\N	2015-12-14	\N	2	t	\N	f	f
000c0000-566e-cd6e-ff17-738088dec308	000d0000-566e-cd6d-074c-cad4b2a66b31	\N	00090000-566e-cd6d-250c-004cf026ce8d	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-566e-cd6e-6a38-840cbb23e0cb	000d0000-566e-cd6d-81c6-9114cf263c32	\N	00090000-566e-cd6d-873b-52f34f976aff	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-566e-cd6e-b607-e798180282be	000d0000-566e-cd6d-d91f-41397889b5b5	\N	00090000-566e-cd6d-c677-87a83fb53185	000b0000-566e-cd6d-1adf-a7a25e49015b	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-566e-cd6e-d8f3-08ab27552ba8	000d0000-566e-cd6d-debf-c51b781bc352	00100000-566e-cd6d-3492-f5ce66f620b6	00090000-566e-cd6d-c263-1482a383ea8b	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-566e-cd6e-e35b-a64cf65aedb0	000d0000-566e-cd6d-af8d-0db1268db30a	\N	00090000-566e-cd6d-4276-4a4565905feb	000b0000-566e-cd6d-5e56-1d5e766623a6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-566e-cd6e-925e-5c4b880d6c9d	000d0000-566e-cd6d-debf-c51b781bc352	00100000-566e-cd6d-b6fa-377916e57522	00090000-566e-cd6d-16fa-35d88634a5a8	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-566e-cd6e-d219-3ddf19099ff1	000d0000-566e-cd6d-debf-c51b781bc352	00100000-566e-cd6d-86dc-97184c464b4c	00090000-566e-cd6d-7c46-21f242082b2c	\N	0010	t	\N	2015-12-14	\N	16	f	\N	f	t
000c0000-566e-cd6e-5e90-32370891ec7d	000d0000-566e-cd6d-debf-c51b781bc352	00100000-566e-cd6d-2567-7a9b454b0e73	00090000-566e-cd6d-41ae-30e912af1c48	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-566e-cd6e-170a-722f46378dc5	000d0000-566e-cd6d-0a49-1c3fe8c2cf68	00100000-566e-cd6d-80a6-712a68f72057	00090000-566e-cd6d-dda1-66d58958979a	000b0000-566e-cd6d-14aa-99436579f67f	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32132561)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32131956)
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
-- TOC entry 3162 (class 0 OID 32132438)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-566e-cd6d-6900-c18d448967f3	00160000-566e-cd6d-9cc9-0162dfb016f4	00090000-566e-cd6d-572d-a5bb505b3b3d	aizv	10	t
003d0000-566e-cd6d-06f2-4a77239ceac9	00160000-566e-cd6d-9cc9-0162dfb016f4	00090000-566e-cd6d-2f27-32ae7235826e	apri	14	t
003d0000-566e-cd6d-1db4-af04a5953f6d	00160000-566e-cd6d-4a7c-b95002a527b7	00090000-566e-cd6d-0ca3-d031b7cf261a	aizv	11	t
003d0000-566e-cd6d-341c-b4d7697e3eed	00160000-566e-cd6d-2038-284442653a63	00090000-566e-cd6d-3fab-cae5409be7d6	aizv	12	t
003d0000-566e-cd6d-c87b-9d76dba68783	00160000-566e-cd6d-9cc9-0162dfb016f4	00090000-566e-cd6d-3e71-6aaec7721fa8	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32132468)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-566e-cd6d-9cc9-0162dfb016f4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-566e-cd6d-4a7c-b95002a527b7	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-566e-cd6d-2038-284442653a63	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32132881)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32132211)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-566e-cd6e-dd8f-45dbdbb88dff	\N	\N	00200000-566e-cd6d-ca40-6002c92e1227	\N	\N	\N	00220000-566e-cd6d-211f-d71ab63907bc	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-566e-cd6e-0f31-5725f96e2393	\N	\N	00200000-566e-cd6d-6da8-40f5c71529d3	\N	\N	\N	00220000-566e-cd6d-211f-d71ab63907bc	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-566e-cd6e-9dbd-575fa4deb098	\N	\N	00200000-566e-cd6d-c15d-5bfad2367621	\N	\N	\N	00220000-566e-cd6d-1eb1-0eb631d6f5ad	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-566e-cd6e-979a-8397fb17c808	\N	\N	00200000-566e-cd6d-dc2c-d7f31a5d09ab	\N	\N	\N	00220000-566e-cd6d-b25c-b5e08146891c	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-566e-cd6e-06d8-3ddefb5c5658	\N	\N	00200000-566e-cd6d-7654-e510c8616277	\N	\N	\N	00220000-566e-cd6d-cdfb-30023e774ac2	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32132243)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32132248)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32132803)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32132108)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-566e-cd6a-3545-d6721b16f32c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-566e-cd6a-6b23-869baed181ac	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-566e-cd6a-c32e-ae31925f3f83	AL	ALB	008	Albania 	Albanija	\N
00040000-566e-cd6a-ec6b-6d10163a2d45	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-566e-cd6a-8014-8dcd85f0383b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-566e-cd6a-c64f-a8fa3dd06bb7	AD	AND	020	Andorra 	Andora	\N
00040000-566e-cd6a-2100-e094cab7ee1a	AO	AGO	024	Angola 	Angola	\N
00040000-566e-cd6a-b054-3422916d9e02	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-566e-cd6a-7024-5524db306cb4	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-566e-cd6a-d33f-b0f08eeeaa70	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-566e-cd6a-6353-d87024d25210	AR	ARG	032	Argentina 	Argenitna	\N
00040000-566e-cd6a-895f-fbf2241c1f7c	AM	ARM	051	Armenia 	Armenija	\N
00040000-566e-cd6a-7503-66cf15e69aa4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-566e-cd6a-9c14-e6e3518e0c5b	AU	AUS	036	Australia 	Avstralija	\N
00040000-566e-cd6a-0b8a-a0bea66d4bec	AT	AUT	040	Austria 	Avstrija	\N
00040000-566e-cd6a-e44c-0d40de8d3591	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-566e-cd6a-d261-eb89de0b69b9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-566e-cd6a-7aa3-68a4f4e3dbea	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-566e-cd6a-374a-e8d07641eca1	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-566e-cd6a-eb55-7b38a70b65f7	BB	BRB	052	Barbados 	Barbados	\N
00040000-566e-cd6a-1be5-12317c0e4a2e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-566e-cd6a-5aea-975f4176b8c2	BE	BEL	056	Belgium 	Belgija	\N
00040000-566e-cd6a-7120-a253e4ff6a2a	BZ	BLZ	084	Belize 	Belize	\N
00040000-566e-cd6a-b072-4514965068c5	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-566e-cd6a-60dd-8e3568395802	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-566e-cd6a-b98d-e4eb5e0d2ae6	BT	BTN	064	Bhutan 	Butan	\N
00040000-566e-cd6a-5f50-ad6ed4079f99	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-566e-cd6a-0c62-626b02f85d81	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-566e-cd6a-9697-820548d223df	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-566e-cd6a-e272-7c9e12cb8ed6	BW	BWA	072	Botswana 	Bocvana	\N
00040000-566e-cd6a-b2e0-8f0ecfa78d55	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-566e-cd6a-28f3-0e7926ba0547	BR	BRA	076	Brazil 	Brazilija	\N
00040000-566e-cd6a-55c8-502de8da3a7d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-566e-cd6a-4c18-7f9e8ac9b273	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-566e-cd6a-5b97-51b73eef9f28	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-566e-cd6a-aa42-715b1c57f7f7	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-566e-cd6a-c78a-c475f97b07e7	BI	BDI	108	Burundi 	Burundi 	\N
00040000-566e-cd6a-48c4-1d1bbdf16991	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-566e-cd6a-e539-830bfa2cf048	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-566e-cd6a-fd7a-18108e0a3701	CA	CAN	124	Canada 	Kanada	\N
00040000-566e-cd6a-3fff-4058bb836ab7	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-566e-cd6a-62af-923aa690d0e2	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-566e-cd6a-e4d2-e778437f4308	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-566e-cd6a-066f-c00fdcfa77fc	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-566e-cd6a-2492-acf5cd2136cd	CL	CHL	152	Chile 	Čile	\N
00040000-566e-cd6a-ce8d-5e36c74391cb	CN	CHN	156	China 	Kitajska	\N
00040000-566e-cd6a-520b-a739a13f030f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-566e-cd6a-87db-4fbdc10b0f6b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-566e-cd6a-86d1-0fac7864aebc	CO	COL	170	Colombia 	Kolumbija	\N
00040000-566e-cd6a-c23c-f6cf1459244d	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-566e-cd6a-4b54-2b476ec5ab6a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-566e-cd6a-35fe-1c86712ad4e5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-566e-cd6a-6c53-6a5b06e80528	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-566e-cd6a-6def-76083e1e6f1f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-566e-cd6a-3f4e-6a3fde05f29a	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-566e-cd6a-2256-14b7f1264b03	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-566e-cd6a-7cff-6da901d47d81	CU	CUB	192	Cuba 	Kuba	\N
00040000-566e-cd6a-3491-259298a19fb2	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-566e-cd6a-b712-f959da3f9932	CY	CYP	196	Cyprus 	Ciper	\N
00040000-566e-cd6a-03d2-a3251f9fb59d	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-566e-cd6a-d3c8-6092b8720005	DK	DNK	208	Denmark 	Danska	\N
00040000-566e-cd6a-708c-fd4891f8885c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-566e-cd6a-e72e-7c083b5d01e5	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-566e-cd6a-9b75-6584017cb0a4	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-566e-cd6a-f702-b342ebac0aad	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-566e-cd6a-83e7-520e4c895dd4	EG	EGY	818	Egypt 	Egipt	\N
00040000-566e-cd6a-5af4-4090b7b716cc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-566e-cd6a-22ca-24cacba9f7ba	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-566e-cd6a-bc3c-55b4bf9b50bf	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-566e-cd6a-f760-4085599ce1d5	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-566e-cd6a-e4bc-7f1d267f7de9	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-566e-cd6a-5ae9-b2d38d0bf6bc	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-566e-cd6a-c403-0f0d31834936	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-566e-cd6a-1f30-add7c9278dd9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-566e-cd6a-4c3d-7d1911c10adb	FI	FIN	246	Finland 	Finska	\N
00040000-566e-cd6a-2258-2bd1e4502b6e	FR	FRA	250	France 	Francija	\N
00040000-566e-cd6a-0f63-eedfa0b8ee24	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-566e-cd6a-36d6-dd4185082d63	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-566e-cd6a-3be3-9eafbba8b5a0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-566e-cd6a-6aef-21866cf36efa	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-566e-cd6a-23da-4543fc829a88	GA	GAB	266	Gabon 	Gabon	\N
00040000-566e-cd6a-5abc-25f55abdefb0	GM	GMB	270	Gambia 	Gambija	\N
00040000-566e-cd6a-a3d8-c8f86bbffdb7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-566e-cd6a-3de8-4fce910e5cdc	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-566e-cd6a-cb9f-c9e54e7d033d	GH	GHA	288	Ghana 	Gana	\N
00040000-566e-cd6a-321f-826343ef1371	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-566e-cd6a-554c-f25d85aedced	GR	GRC	300	Greece 	Grčija	\N
00040000-566e-cd6a-6b79-6bc9bac58333	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-566e-cd6a-83d9-f8130f1990dc	GD	GRD	308	Grenada 	Grenada	\N
00040000-566e-cd6a-4f12-7e7940e81ee6	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-566e-cd6a-3df0-c9f144ac11e9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-566e-cd6a-2d50-ca9c353a2212	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-566e-cd6a-5fc9-38ec58cd11a6	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-566e-cd6a-1557-4a9a1e17ffa5	GN	GIN	324	Guinea 	Gvineja	\N
00040000-566e-cd6a-4a48-3a90adc6f11c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-566e-cd6a-a9c1-00ebcbef6681	GY	GUY	328	Guyana 	Gvajana	\N
00040000-566e-cd6a-94fb-e1e3ef4ec632	HT	HTI	332	Haiti 	Haiti	\N
00040000-566e-cd6a-080a-e8b9ee5e64cb	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-566e-cd6a-66d6-171af2d55c0e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-566e-cd6a-99df-2bba342c565e	HN	HND	340	Honduras 	Honduras	\N
00040000-566e-cd6a-6771-cdd8be6e4c42	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-566e-cd6a-cfb2-2edef9ad953a	HU	HUN	348	Hungary 	Madžarska	\N
00040000-566e-cd6a-3c19-136abffaac21	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-566e-cd6a-35af-1d06cc134615	IN	IND	356	India 	Indija	\N
00040000-566e-cd6a-b111-6cf03c5f0f38	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-566e-cd6a-808f-f69bd4fc397e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-566e-cd6a-3f1c-6375ee420043	IQ	IRQ	368	Iraq 	Irak	\N
00040000-566e-cd6a-9822-d46c914eb002	IE	IRL	372	Ireland 	Irska	\N
00040000-566e-cd6a-d3fb-c973d835cead	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-566e-cd6a-4f2a-c9b106c501e0	IL	ISR	376	Israel 	Izrael	\N
00040000-566e-cd6a-b5c6-316826ea74c5	IT	ITA	380	Italy 	Italija	\N
00040000-566e-cd6a-5522-33988901dc5d	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-566e-cd6a-17f2-ecce40b8aa58	JP	JPN	392	Japan 	Japonska	\N
00040000-566e-cd6a-260a-85f355a8af03	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-566e-cd6a-d16b-ec85ee674997	JO	JOR	400	Jordan 	Jordanija	\N
00040000-566e-cd6a-9f37-7d2ab7c0b42a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-566e-cd6a-33ed-ee21d25affab	KE	KEN	404	Kenya 	Kenija	\N
00040000-566e-cd6a-46d9-5614b0fb16ea	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-566e-cd6a-de43-40a439af8014	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-566e-cd6a-bdbc-f765ba4c582c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-566e-cd6a-00a1-519dc0bbb668	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-566e-cd6a-f8e9-14ad434f6471	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-566e-cd6a-aeaf-9e3ba8d7c94d	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-566e-cd6a-d33e-c57b4991e695	LV	LVA	428	Latvia 	Latvija	\N
00040000-566e-cd6a-94b7-2e7ded935dcf	LB	LBN	422	Lebanon 	Libanon	\N
00040000-566e-cd6a-4a45-c6a6e3fe966c	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-566e-cd6a-a6b9-4a234cf3d68d	LR	LBR	430	Liberia 	Liberija	\N
00040000-566e-cd6a-be47-8a9732579e15	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-566e-cd6a-d676-124e55bc7936	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-566e-cd6a-7902-567f57967b12	LT	LTU	440	Lithuania 	Litva	\N
00040000-566e-cd6a-2ed3-ca890468028e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-566e-cd6a-5938-f73d31efdb22	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-566e-cd6a-1f79-33c9cb1f3db6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-566e-cd6a-e2a0-aa46fe4b09f4	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-566e-cd6a-53c4-13815e744f79	MW	MWI	454	Malawi 	Malavi	\N
00040000-566e-cd6a-44b3-a74955b8c0d1	MY	MYS	458	Malaysia 	Malezija	\N
00040000-566e-cd6a-fbad-3ecacb9ec6ea	MV	MDV	462	Maldives 	Maldivi	\N
00040000-566e-cd6a-c38b-5f37eb6c6a54	ML	MLI	466	Mali 	Mali	\N
00040000-566e-cd6a-7999-bf551e42683e	MT	MLT	470	Malta 	Malta	\N
00040000-566e-cd6a-9555-762979388c76	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-566e-cd6a-8f78-25a8f3005544	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-566e-cd6a-6821-ed43f9a78ded	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-566e-cd6a-4fd4-0fd748915f02	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-566e-cd6a-ba24-86507384b547	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-566e-cd6a-836f-18a7796e14a5	MX	MEX	484	Mexico 	Mehika	\N
00040000-566e-cd6a-b513-77a290898134	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-566e-cd6a-d0e4-65d5c903b270	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-566e-cd6a-518c-cacf1a175d27	MC	MCO	492	Monaco 	Monako	\N
00040000-566e-cd6a-98fc-d763f58c4917	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-566e-cd6a-84b2-b4d767aad905	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-566e-cd6a-23ad-22196bdf5e40	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-566e-cd6a-8c0c-aba4aa0e3b76	MA	MAR	504	Morocco 	Maroko	\N
00040000-566e-cd6a-4262-7ffcaa8f5de7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-566e-cd6a-e2e2-087f037b43e5	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-566e-cd6a-c2ca-a47bb14d6423	NA	NAM	516	Namibia 	Namibija	\N
00040000-566e-cd6a-0ff2-0c640aee4e28	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-566e-cd6a-42de-54ef3e2b9faa	NP	NPL	524	Nepal 	Nepal	\N
00040000-566e-cd6a-7970-9ce7ab328d93	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-566e-cd6a-1874-d91904a3efa4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-566e-cd6a-da9d-faa7da392a07	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-566e-cd6a-ff93-ae15d3beab57	NE	NER	562	Niger 	Niger 	\N
00040000-566e-cd6a-c827-4e318dd4090d	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-566e-cd6a-c9cc-01b0b7db7b37	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-566e-cd6a-990e-fb9885144337	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-566e-cd6a-b4e7-0cfe310946ae	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-566e-cd6a-c54a-f3ed616db98b	NO	NOR	578	Norway 	Norveška	\N
00040000-566e-cd6a-9980-a8b1530af735	OM	OMN	512	Oman 	Oman	\N
00040000-566e-cd6a-d526-4fc10210daa7	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-566e-cd6a-c75e-d9811aef0d11	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-566e-cd6a-c8c5-ece8f9eeb9cf	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-566e-cd6a-7cc3-512a72b58076	PA	PAN	591	Panama 	Panama	\N
00040000-566e-cd6a-da33-f6ac6a0c75ca	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-566e-cd6a-516f-ebba52844290	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-566e-cd6a-ab33-a80240e7f7ec	PE	PER	604	Peru 	Peru	\N
00040000-566e-cd6a-e7bd-437f85244e79	PH	PHL	608	Philippines 	Filipini	\N
00040000-566e-cd6a-7ef4-93cb0f46faeb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-566e-cd6a-718b-888d9df8d0d4	PL	POL	616	Poland 	Poljska	\N
00040000-566e-cd6a-697a-88c29d829ade	PT	PRT	620	Portugal 	Portugalska	\N
00040000-566e-cd6a-efa3-d9738103f352	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-566e-cd6a-39d5-f5046a9b7378	QA	QAT	634	Qatar 	Katar	\N
00040000-566e-cd6a-6718-99029646f63a	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-566e-cd6a-ee22-8e02ad662671	RO	ROU	642	Romania 	Romunija	\N
00040000-566e-cd6a-e5ec-0ddd229ef1a2	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-566e-cd6a-afc2-243b91d9161f	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-566e-cd6a-7503-d1ff4656f7c6	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-566e-cd6a-5a8c-4ee6636f6b49	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-566e-cd6a-1237-7fa345bea726	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-566e-cd6a-4624-a4760f4342fd	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-566e-cd6a-baaa-0a232c56e5a3	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-566e-cd6a-155b-b5bcb4ad4647	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-566e-cd6a-c480-b6657b76ec91	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-566e-cd6a-daed-302b7a57da9d	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-566e-cd6a-e9bf-c5837e07b6f5	SM	SMR	674	San Marino 	San Marino	\N
00040000-566e-cd6a-666f-40c971827962	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-566e-cd6a-c30e-ff4165ec388a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-566e-cd6a-01a6-85d25559fe4b	SN	SEN	686	Senegal 	Senegal	\N
00040000-566e-cd6a-e8f7-6e868978172e	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-566e-cd6a-fe68-f87905c97578	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-566e-cd6a-1801-07c2ffe4d58a	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-566e-cd6a-d406-e9c7c8ed1859	SG	SGP	702	Singapore 	Singapur	\N
00040000-566e-cd6a-cec9-4df76df25f2e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-566e-cd6a-6734-caae8520c257	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-566e-cd6a-92e5-f8a468134d33	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-566e-cd6a-85a3-4a578942c814	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-566e-cd6a-4f45-4c58a6d6400f	SO	SOM	706	Somalia 	Somalija	\N
00040000-566e-cd6a-44ed-005276518180	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-566e-cd6a-b3de-add2eba85c4a	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-566e-cd6a-8d2c-eb7e8edf1ce2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-566e-cd6a-2b15-3dddf6652800	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-566e-cd6a-f921-69d6bb08e0ba	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-566e-cd6a-f554-d02693990a4b	SD	SDN	729	Sudan 	Sudan	\N
00040000-566e-cd6a-bf59-074cd80f0f7f	SR	SUR	740	Suriname 	Surinam	\N
00040000-566e-cd6a-83d7-6daa22d4d137	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-566e-cd6a-04a4-9de1cf1528f0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-566e-cd6a-0b68-ceac40507234	SE	SWE	752	Sweden 	Švedska	\N
00040000-566e-cd6a-63b9-2d65c2e3b7f1	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-566e-cd6a-77ec-ccfbc1a82e15	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-566e-cd6a-fb47-81c69d3449a1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-566e-cd6a-8517-3f8523a1138a	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-566e-cd6a-52b6-bbb9e6ea17e9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-566e-cd6a-4771-902fddd4cfb1	TH	THA	764	Thailand 	Tajska	\N
00040000-566e-cd6a-019e-0b7d7f190aa9	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-566e-cd6a-3dab-dd049e519422	TG	TGO	768	Togo 	Togo	\N
00040000-566e-cd6a-a3f0-d4571cb27440	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-566e-cd6a-5660-a5627a87c295	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-566e-cd6a-3076-389cd2b4d9f4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-566e-cd6a-2a6d-a3aba449fe8a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-566e-cd6a-29c9-32eee675820b	TR	TUR	792	Turkey 	Turčija	\N
00040000-566e-cd6a-dfc4-9b97b75d8d85	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-566e-cd6a-f657-f21ec8870edb	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566e-cd6a-dbd6-46824c9e24c8	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-566e-cd6a-b5fb-e037fa09c5d7	UG	UGA	800	Uganda 	Uganda	\N
00040000-566e-cd6a-79ea-33197bc4d889	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-566e-cd6a-78b5-17fdeb9e51e3	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-566e-cd6a-6191-8a7fa1efc2ce	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-566e-cd6a-8fa5-0cfdfc4e7315	US	USA	840	United States 	Združene države Amerike	\N
00040000-566e-cd6a-d145-ab65ba1381d3	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-566e-cd6a-9f58-9e49e504ed7c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-566e-cd6a-6056-ce2508611ddf	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-566e-cd6a-e7f1-8b56273cc0e4	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-566e-cd6a-ac8e-1353c8c95f27	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-566e-cd6a-ebd3-23a2fd7f5e2a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-566e-cd6a-a7e6-4757798c8d86	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-566e-cd6a-05b3-dd8965b87a0e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-566e-cd6a-f895-367e94df5118	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-566e-cd6a-e416-eda1c2d2d973	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-566e-cd6a-05a7-b881754b66b9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-566e-cd6a-1947-fe23fba2da53	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-566e-cd6a-643d-0aa784ba41b2	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32132591)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-566e-cd6d-1d2f-2633e3b9995c	000e0000-566e-cd6d-3b1a-523caedd0d4a	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-cd6a-10a4-1cd81985cb53	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566e-cd6d-4be6-1fffcb9888bb	000e0000-566e-cd6d-680d-44a7f6e15c08	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-cd6a-1937-d4bd1eb22e90	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-566e-cd6d-aea0-0556d1de5955	000e0000-566e-cd6d-38e2-cc084370df36	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-566e-cd6a-10a4-1cd81985cb53	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566e-cd6e-607b-e9bc83d7e90a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-566e-cd6e-f6c9-b4e55b25b399	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32132391)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-566e-cd6d-b324-6a950a90321c	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-97c5-05d5110a6400	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-566e-cd6a-ecf2-87f091dc17e5
000d0000-566e-cd6d-477b-a4d59c67bad4	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-e954-6f47f7729af9	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-566e-cd6a-5a9d-44cc5f3e6e6e
000d0000-566e-cd6d-050e-cc7ed90ff057	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-5841-3e7a9b4f548c	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-566e-cd6a-333e-158b95a23324
000d0000-566e-cd6d-074c-cad4b2a66b31	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-ff17-738088dec308	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-566e-cd6a-8f54-372be7e8ca3e
000d0000-566e-cd6d-81c6-9114cf263c32	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-6a38-840cbb23e0cb	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-566e-cd6a-8f54-372be7e8ca3e
000d0000-566e-cd6d-d91f-41397889b5b5	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-b607-e798180282be	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-566e-cd6a-ecf2-87f091dc17e5
000d0000-566e-cd6d-debf-c51b781bc352	000e0000-566e-cd6d-680d-44a7f6e15c08	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-566e-cd6a-ecf2-87f091dc17e5
000d0000-566e-cd6d-af8d-0db1268db30a	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-e35b-a64cf65aedb0	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-566e-cd6a-a2ec-5a7e4b6022d9
000d0000-566e-cd6d-0a49-1c3fe8c2cf68	000e0000-566e-cd6d-680d-44a7f6e15c08	000c0000-566e-cd6e-170a-722f46378dc5	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-566e-cd6a-e8d7-88ffea9fbd72
\.


--
-- TOC entry 3135 (class 0 OID 32132182)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32132148)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32132125)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-566e-cd6d-00e3-4b3bb5f3a9d2	00080000-566e-cd6d-c8a4-fc699750f398	00090000-566e-cd6d-7c46-21f242082b2c	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32132305)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32132861)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-566e-cd6d-1bd8-a23d7a655543	00010000-566e-cd6b-57fd-ebddb3e1fb14	\N	Prva mapa	Root mapa	2015-12-14 15:08:45	2015-12-14 15:08:45	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32132874)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32132896)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32129503)
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
-- TOC entry 3151 (class 0 OID 32132330)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32132082)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-566e-cd6b-a387-ac0284177893	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-566e-cd6b-a54f-bb747d58719c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-566e-cd6b-81f5-e62016a5ad4f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-566e-cd6b-4b16-4723a49b8913	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-566e-cd6b-d6ac-1fed83f048b2	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-566e-cd6b-ba30-398acebfa9f0	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-566e-cd6b-221a-b78f19bbbfc3	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-566e-cd6b-b7dc-3c8baa271624	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566e-cd6b-c757-1acb883c0ce7	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-566e-cd6b-2a00-637ef8e9bb77	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-566e-cd6b-4aaa-f09385763b93	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-566e-cd6b-797f-16a06f94659b	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-566e-cd6b-eab1-b85765f7b29d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-566e-cd6b-2f86-29c6607d6cae	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-566e-cd6d-f34e-1e33f5e98fe4	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-566e-cd6d-a421-5ec7cd0f44b2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-566e-cd6d-0b74-30f14fdab26c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-566e-cd6d-e178-17fdb82361c5	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-566e-cd6d-552a-2f46bf7fe4cf	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-566e-cd6f-d238-c4156a313343	application.tenant.maticnopodjetje	string	s:36:"00080000-566e-cd6f-3eba-6785bcb6272d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32131982)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-566e-cd6d-5a36-7cb9bf8d96b8	00000000-566e-cd6d-f34e-1e33f5e98fe4	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-566e-cd6d-9dac-a7c06c946e0a	00000000-566e-cd6d-f34e-1e33f5e98fe4	00010000-566e-cd6b-57fd-ebddb3e1fb14	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-566e-cd6d-3cad-66e8573638df	00000000-566e-cd6d-a421-5ec7cd0f44b2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32132049)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-566e-cd6d-a7fa-048cc3b084c7	\N	00100000-566e-cd6d-80a6-712a68f72057	00100000-566e-cd6d-3540-4b846e22862b	01	Gledališče Nimbis
00410000-566e-cd6d-deb3-4daae60106f4	00410000-566e-cd6d-a7fa-048cc3b084c7	00100000-566e-cd6d-80a6-712a68f72057	00100000-566e-cd6d-3540-4b846e22862b	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32131993)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-566e-cd6d-1f50-0ccb5787e6bb	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-566e-cd6d-250c-004cf026ce8d	00010000-566e-cd6d-6205-31db645b471b	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-566e-cd6d-93b8-a44ea2b9f370	00010000-566e-cd6d-faf1-fdc9e4c444af	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-566e-cd6d-16fa-35d88634a5a8	00010000-566e-cd6d-89d1-a0dbd2603479	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-566e-cd6d-fe20-75e99e72c252	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-566e-cd6d-c677-87a83fb53185	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-566e-cd6d-41ae-30e912af1c48	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-566e-cd6d-c263-1482a383ea8b	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-566e-cd6d-7c46-21f242082b2c	00010000-566e-cd6d-43b5-27574005c77f	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-566e-cd6d-dda1-66d58958979a	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-566e-cd6d-3596-0aa4e0730145	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cd6d-873b-52f34f976aff	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-566e-cd6d-4276-4a4565905feb	00010000-566e-cd6d-02af-311dc7a95c78	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cd6d-572d-a5bb505b3b3d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cd6d-2f27-32ae7235826e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cd6d-0ca3-d031b7cf261a	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cd6d-3fab-cae5409be7d6	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cd6d-3e71-6aaec7721fa8	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-566e-cd6d-0ce7-0a71e118dc10	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cd6d-6e28-9b571ba6638b	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-566e-cd6d-3804-3ef8f7bc5bc3	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32131928)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-566e-cd6b-c01a-a8acbaa34865	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-566e-cd6b-a883-8d96a7bc3665	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-566e-cd6b-589c-01604061c23c	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-566e-cd6b-9173-ccf6d5665c5d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-566e-cd6b-0458-aaee13e4bc4f	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-566e-cd6b-326d-1d7e6e11c958	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-566e-cd6b-cc0a-696953156f10	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-566e-cd6b-4ac9-29957dc77f2d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-566e-cd6b-9dbe-c73bc09a1386	Abonma-read	Abonma - branje	t
00030000-566e-cd6b-b852-f33f73fc3e31	Abonma-write	Abonma - spreminjanje	t
00030000-566e-cd6b-8f62-c467c498183e	Alternacija-read	Alternacija - branje	t
00030000-566e-cd6b-c264-4e72afcf9c67	Alternacija-write	Alternacija - spreminjanje	t
00030000-566e-cd6b-5d4f-3cf38a4e5da0	Arhivalija-read	Arhivalija - branje	t
00030000-566e-cd6b-c12c-5fccc064a840	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-566e-cd6b-e5a7-067847a61005	AuthStorage-read	AuthStorage - branje	t
00030000-566e-cd6b-af90-d362eab2e2a8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-566e-cd6b-6940-996172cfb325	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-566e-cd6b-61ae-bc585b41f140	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-566e-cd6b-12b6-3e73f2f21ba1	Besedilo-read	Besedilo - branje	t
00030000-566e-cd6b-d7ba-4e4a73c10cb3	Besedilo-write	Besedilo - spreminjanje	t
00030000-566e-cd6b-d04c-c4b3b394a454	Dogodek-read	Dogodek - branje	t
00030000-566e-cd6b-c11d-2e5c48324f63	Dogodek-write	Dogodek - spreminjanje	t
00030000-566e-cd6b-9acf-c66c0337b2a9	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-566e-cd6b-cfa9-1fcecfa8958e	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-566e-cd6b-bad3-e64bf114b8ab	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-566e-cd6b-d691-b113cc41adbd	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-566e-cd6b-1994-63daebca63d7	DogodekTrait-read	DogodekTrait - branje	t
00030000-566e-cd6b-949e-27cd513e5804	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-566e-cd6b-b2b5-93ea5e0aa0a9	DrugiVir-read	DrugiVir - branje	t
00030000-566e-cd6b-770d-d2ebf9f7bda2	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-566e-cd6b-5353-b9dd1a0263d7	Drzava-read	Drzava - branje	t
00030000-566e-cd6b-37b5-4265b07feb1d	Drzava-write	Drzava - spreminjanje	t
00030000-566e-cd6b-ed73-090f17140d90	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-566e-cd6b-1a61-8d4dc8bed653	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-566e-cd6b-f74f-ecfb0bccd716	Funkcija-read	Funkcija - branje	t
00030000-566e-cd6b-d981-76e19eb824e3	Funkcija-write	Funkcija - spreminjanje	t
00030000-566e-cd6b-623c-63670c5f381a	Gostovanje-read	Gostovanje - branje	t
00030000-566e-cd6b-92bf-229c645db9a0	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-566e-cd6b-92a8-dfc2196a74e9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-566e-cd6b-ba50-16ba5be04761	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-566e-cd6b-e108-41a16e25faec	Kupec-read	Kupec - branje	t
00030000-566e-cd6b-7da5-3e654573a575	Kupec-write	Kupec - spreminjanje	t
00030000-566e-cd6b-1aee-49bdd936ab94	NacinPlacina-read	NacinPlacina - branje	t
00030000-566e-cd6b-82ec-66aee123fb4b	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-566e-cd6b-49d2-3b00ce3d7b34	Option-read	Option - branje	t
00030000-566e-cd6b-2a25-daf3e38a72b7	Option-write	Option - spreminjanje	t
00030000-566e-cd6b-3cb5-7c18b4983dc4	OptionValue-read	OptionValue - branje	t
00030000-566e-cd6b-aa8d-14ddd1220be3	OptionValue-write	OptionValue - spreminjanje	t
00030000-566e-cd6b-9d7a-35339bad8789	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-566e-cd6b-3d2c-568f39c6950f	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-566e-cd6b-c962-8f85f374efb0	Oseba-read	Oseba - branje	t
00030000-566e-cd6b-146c-18364a04ccfe	Oseba-write	Oseba - spreminjanje	t
00030000-566e-cd6b-07ae-24ed121d4910	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-566e-cd6b-0b66-2a15c20a1c59	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-566e-cd6b-9c08-3ecbc31c782c	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-566e-cd6b-f7aa-f3d8be864880	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-566e-cd6b-1ffa-88f6d76b9753	Pogodba-read	Pogodba - branje	t
00030000-566e-cd6b-ffdf-ad080dd96ea9	Pogodba-write	Pogodba - spreminjanje	t
00030000-566e-cd6b-294c-2c388b2426f6	Popa-read	Popa - branje	t
00030000-566e-cd6b-9b6f-c338d715d109	Popa-write	Popa - spreminjanje	t
00030000-566e-cd6b-b519-0846211558da	Posta-read	Posta - branje	t
00030000-566e-cd6b-39e0-781be0524ef1	Posta-write	Posta - spreminjanje	t
00030000-566e-cd6b-11c8-fff744b94cc8	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-566e-cd6b-a375-a3ae43d21257	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-566e-cd6b-8bf7-457e96c0791e	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-566e-cd6b-c010-dc11476fe76f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-566e-cd6b-0804-d0036363fd40	PostniNaslov-read	PostniNaslov - branje	t
00030000-566e-cd6b-b978-dde994718dcc	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-566e-cd6b-668f-bcad8289a3bc	Praznik-read	Praznik - branje	t
00030000-566e-cd6b-90d1-ff97570787fe	Praznik-write	Praznik - spreminjanje	t
00030000-566e-cd6b-0993-7aa5ef6f2001	Predstava-read	Predstava - branje	t
00030000-566e-cd6b-82bf-83cf4a6fcfb8	Predstava-write	Predstava - spreminjanje	t
00030000-566e-cd6b-06b4-b0f28f93432d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-566e-cd6b-66e7-85faf9c3c896	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-566e-cd6b-7327-bea0effe1af8	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-566e-cd6b-ff89-9b4224265bb9	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-566e-cd6b-eb8a-b41905b71460	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-566e-cd6b-786a-efbedd3b165f	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-566e-cd6b-de7f-bd5890cad9fb	ProgramDela-read	ProgramDela - branje	t
00030000-566e-cd6b-330a-2753022a84f1	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-566e-cd6b-a69f-8f2ee372c0f4	ProgramFestival-read	ProgramFestival - branje	t
00030000-566e-cd6b-ab7b-c11e4ba47b9a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-566e-cd6b-4c51-2eabe098ee22	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-566e-cd6b-846e-b647353062a3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-566e-cd6b-7203-130926d344cd	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-566e-cd6b-a421-7d30717df943	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-566e-cd6b-202b-47789cc27155	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-566e-cd6b-e3bd-de98171ced91	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-566e-cd6b-f522-d74f06303013	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-566e-cd6b-433e-3361b169cdf2	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-566e-cd6b-a399-6b3f2afd83e0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-566e-cd6b-74d5-9dcb05b2aff1	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-566e-cd6b-7e0d-1b089d9c119e	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-566e-cd6b-346a-47a8b976f31d	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-566e-cd6b-b335-6c600f1640af	ProgramRazno-read	ProgramRazno - branje	t
00030000-566e-cd6b-d779-d93721b51ffc	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-566e-cd6b-1d0c-d1ebd64243bd	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-566e-cd6b-91ef-a2a2f3f5d395	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-566e-cd6b-2ab1-bd445b623d83	Prostor-read	Prostor - branje	t
00030000-566e-cd6b-ebb0-81750749aa07	Prostor-write	Prostor - spreminjanje	t
00030000-566e-cd6b-7fed-11111553bafc	Racun-read	Racun - branje	t
00030000-566e-cd6b-0b26-82bf15552f2f	Racun-write	Racun - spreminjanje	t
00030000-566e-cd6b-da4b-b0ce82d8294a	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-566e-cd6b-c15f-7d7c267ee510	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-566e-cd6b-3845-548826f26b12	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-566e-cd6b-3d03-5db561efdbda	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-566e-cd6b-9acf-cfa9d41ceeb9	Rekvizit-read	Rekvizit - branje	t
00030000-566e-cd6b-8b2e-857056335750	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-566e-cd6b-3172-6b9b894b6341	Revizija-read	Revizija - branje	t
00030000-566e-cd6b-9d31-3dc748ca90fc	Revizija-write	Revizija - spreminjanje	t
00030000-566e-cd6b-dd63-3c6108aaf51d	Rezervacija-read	Rezervacija - branje	t
00030000-566e-cd6b-1b32-ac54feaefb06	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-566e-cd6b-2aa8-840015891c7b	SedezniRed-read	SedezniRed - branje	t
00030000-566e-cd6b-b963-225f25cad761	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-566e-cd6b-2646-edce39c6f747	Sedez-read	Sedez - branje	t
00030000-566e-cd6b-68c7-56ee4828895e	Sedez-write	Sedez - spreminjanje	t
00030000-566e-cd6b-8713-37ace4148267	Sezona-read	Sezona - branje	t
00030000-566e-cd6b-fc04-d143b7287586	Sezona-write	Sezona - spreminjanje	t
00030000-566e-cd6b-4d19-380cb911d297	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-566e-cd6b-e726-563b63f064f7	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-566e-cd6b-9a44-ea546c6ba266	Telefonska-read	Telefonska - branje	t
00030000-566e-cd6b-9e7d-be0bb8d2c462	Telefonska-write	Telefonska - spreminjanje	t
00030000-566e-cd6b-f93d-a0c0f3d0d34a	TerminStoritve-read	TerminStoritve - branje	t
00030000-566e-cd6b-fdf8-70adc178d257	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-566e-cd6b-fe53-cbafc8753fcf	TipFunkcije-read	TipFunkcije - branje	t
00030000-566e-cd6b-1647-36bc81033665	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-566e-cd6b-861b-40583c901e98	TipPopa-read	TipPopa - branje	t
00030000-566e-cd6b-f07e-ba3f299ff9c9	TipPopa-write	TipPopa - spreminjanje	t
00030000-566e-cd6b-f3ea-158423631f99	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-566e-cd6b-4f69-aab9562a013c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-566e-cd6b-2446-4216c8651187	TipVaje-read	TipVaje - branje	t
00030000-566e-cd6b-45eb-fc1204db0f30	TipVaje-write	TipVaje - spreminjanje	t
00030000-566e-cd6b-4cab-b346415deeb4	Trr-read	Trr - branje	t
00030000-566e-cd6b-61a9-78ec6455f9f8	Trr-write	Trr - spreminjanje	t
00030000-566e-cd6b-d11a-54c074bfe5e7	Uprizoritev-read	Uprizoritev - branje	t
00030000-566e-cd6b-114f-9e037d4bd30d	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-566e-cd6b-c5a0-8b8fe275f5a9	Vaja-read	Vaja - branje	t
00030000-566e-cd6b-96da-65af6ee63a32	Vaja-write	Vaja - spreminjanje	t
00030000-566e-cd6b-73ee-bf60a572c0ae	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-566e-cd6b-4b5d-ea8ea765bd18	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-566e-cd6b-8eef-499b8f4b40ed	VrstaStroska-read	VrstaStroska - branje	t
00030000-566e-cd6b-3a4f-7b473ee85262	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-566e-cd6b-b77d-3c118747ddac	Zaposlitev-read	Zaposlitev - branje	t
00030000-566e-cd6b-1c8e-d0c580cd0125	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-566e-cd6b-47ac-025a4d2f6678	Zasedenost-read	Zasedenost - branje	t
00030000-566e-cd6b-ef9a-a57f68bbe688	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-566e-cd6b-0177-a48834ce16cf	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-566e-cd6b-2c18-dff21d443f38	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-566e-cd6b-b1d6-f6b9c562cf35	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-566e-cd6b-2b9e-be8273e9a834	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-566e-cd6b-2ad6-a0caa260ba6a	Job-read	Branje opravil - samo zase - branje	t
00030000-566e-cd6b-433f-7cc40e05e533	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-566e-cd6b-4a66-46755e097364	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-566e-cd6b-95e2-6b219e8fe5c9	Report-read	Report - branje	t
00030000-566e-cd6b-7be8-5b5a9c3ef57e	Report-write	Report - spreminjanje	t
00030000-566e-cd6b-326b-836bcb537bd1	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-566e-cd6b-8798-48ceb67e341d	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-566e-cd6b-0720-18adbeecf9e7	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-566e-cd6b-64e5-cae2cc63118f	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-566e-cd6b-6be5-2e19944a496e	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-566e-cd6b-a885-291ad411e93e	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-566e-cd6b-4b72-62309dec8218	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-566e-cd6b-0022-e4bd8e696072	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-566e-cd6b-d2ca-b12ac3de1d7f	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-566e-cd6b-f8b6-f27c5a307372	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566e-cd6b-ea36-c7e633bddd7f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-566e-cd6b-9cb9-643427032323	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-566e-cd6b-7843-4ca56ea387eb	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-566e-cd6b-0f79-966a5ad0e612	Datoteka-write	Datoteka - spreminjanje	t
00030000-566e-cd6b-6ca4-c66b3275b0d8	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32131947)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-566e-cd6b-e489-e92ca3bfa38c	00030000-566e-cd6b-a883-8d96a7bc3665
00020000-566e-cd6b-e489-e92ca3bfa38c	00030000-566e-cd6b-c01a-a8acbaa34865
00020000-566e-cd6b-b9f7-0ddf0c8e006b	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-61ae-bc585b41f140
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-d7ba-4e4a73c10cb3
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-6940-996172cfb325
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-12b6-3e73f2f21ba1
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-d0b8-fe129eb73a49	00030000-566e-cd6b-6940-996172cfb325
00020000-566e-cd6b-d0b8-fe129eb73a49	00030000-566e-cd6b-12b6-3e73f2f21ba1
00020000-566e-cd6b-d0b8-fe129eb73a49	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-d0b8-fe129eb73a49	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-d0b8-fe129eb73a49	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-1c8e-d0c580cd0125
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-0458-aaee13e4bc4f
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-146c-18364a04ccfe
00020000-566e-cd6b-699a-89a845550789	00030000-566e-cd6b-9d7a-35339bad8789
00020000-566e-cd6b-62f7-2aae42274980	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-62f7-2aae42274980	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6b-62f7-2aae42274980	00030000-566e-cd6b-9d7a-35339bad8789
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-146c-18364a04ccfe
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-b978-dde994718dcc
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-9e7d-be0bb8d2c462
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-fb66-04cdcce1e18f	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-3a24-f8366a7de0f5	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-146c-18364a04ccfe
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-0458-aaee13e4bc4f
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-61a9-78ec6455f9f8
00020000-566e-cd6b-2fe5-0a4d8898e7c3	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-d014-79884f026f7a	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-d014-79884f026f7a	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6b-d014-79884f026f7a	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-d014-79884f026f7a	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-92a8-dfc2196a74e9
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-9e7d-be0bb8d2c462
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-b978-dde994718dcc
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-61a9-78ec6455f9f8
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-9b6f-c338d715d109
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-ba50-16ba5be04761
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-786a-efbedd3b165f
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-9e84-7ed3542a71f9	00030000-566e-cd6b-861b-40583c901e98
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-92a8-dfc2196a74e9
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-0dea-cdde69c3f2f4	00030000-566e-cd6b-861b-40583c901e98
00020000-566e-cd6b-de68-f52565eada5a	00030000-566e-cd6b-861b-40583c901e98
00020000-566e-cd6b-de68-f52565eada5a	00030000-566e-cd6b-f07e-ba3f299ff9c9
00020000-566e-cd6b-1cc2-5e99ca8d77ea	00030000-566e-cd6b-861b-40583c901e98
00020000-566e-cd6b-cfa5-03e747cfbb49	00030000-566e-cd6b-b519-0846211558da
00020000-566e-cd6b-cfa5-03e747cfbb49	00030000-566e-cd6b-39e0-781be0524ef1
00020000-566e-cd6b-19e1-d23207a45034	00030000-566e-cd6b-b519-0846211558da
00020000-566e-cd6b-6c35-9d0eb8fc9722	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-6c35-9d0eb8fc9722	00030000-566e-cd6b-37b5-4265b07feb1d
00020000-566e-cd6b-7523-a3547504d861	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-8137-48ce695a612e	00030000-566e-cd6b-b1d6-f6b9c562cf35
00020000-566e-cd6b-8137-48ce695a612e	00030000-566e-cd6b-2b9e-be8273e9a834
00020000-566e-cd6b-6d99-cd88cab5af0d	00030000-566e-cd6b-b1d6-f6b9c562cf35
00020000-566e-cd6b-40d6-0484456230a6	00030000-566e-cd6b-0177-a48834ce16cf
00020000-566e-cd6b-40d6-0484456230a6	00030000-566e-cd6b-2c18-dff21d443f38
00020000-566e-cd6b-eb0c-0499b635d9c9	00030000-566e-cd6b-0177-a48834ce16cf
00020000-566e-cd6b-44b8-133e4e3a635a	00030000-566e-cd6b-9dbe-c73bc09a1386
00020000-566e-cd6b-44b8-133e4e3a635a	00030000-566e-cd6b-b852-f33f73fc3e31
00020000-566e-cd6b-8dd3-53e2de2b7965	00030000-566e-cd6b-9dbe-c73bc09a1386
00020000-566e-cd6b-eacc-51b3325e22a7	00030000-566e-cd6b-2ab1-bd445b623d83
00020000-566e-cd6b-eacc-51b3325e22a7	00030000-566e-cd6b-ebb0-81750749aa07
00020000-566e-cd6b-eacc-51b3325e22a7	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-eacc-51b3325e22a7	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-eacc-51b3325e22a7	00030000-566e-cd6b-b978-dde994718dcc
00020000-566e-cd6b-eacc-51b3325e22a7	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-5e61-edacdcb34637	00030000-566e-cd6b-2ab1-bd445b623d83
00020000-566e-cd6b-5e61-edacdcb34637	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-5e61-edacdcb34637	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-22ec-1b70c334ab23	00030000-566e-cd6b-8eef-499b8f4b40ed
00020000-566e-cd6b-22ec-1b70c334ab23	00030000-566e-cd6b-3a4f-7b473ee85262
00020000-566e-cd6b-757e-be600392e324	00030000-566e-cd6b-8eef-499b8f4b40ed
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-3d2c-568f39c6950f
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-9d7a-35339bad8789
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-7c33-076ace57f1bc	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-7c73-e342c0266f1d	00030000-566e-cd6b-9d7a-35339bad8789
00020000-566e-cd6b-7c73-e342c0266f1d	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-7c73-e342c0266f1d	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-7c73-e342c0266f1d	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-7c73-e342c0266f1d	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-1afd-c27f6a5b22b3	00030000-566e-cd6b-2446-4216c8651187
00020000-566e-cd6b-1afd-c27f6a5b22b3	00030000-566e-cd6b-45eb-fc1204db0f30
00020000-566e-cd6b-620e-324027b7fad3	00030000-566e-cd6b-2446-4216c8651187
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-cc0a-696953156f10
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-4ac9-29957dc77f2d
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-de7f-bd5890cad9fb
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-330a-2753022a84f1
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-a69f-8f2ee372c0f4
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-ab7b-c11e4ba47b9a
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-4c51-2eabe098ee22
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-846e-b647353062a3
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-7203-130926d344cd
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-a421-7d30717df943
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-202b-47789cc27155
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-e3bd-de98171ced91
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-f522-d74f06303013
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-433e-3361b169cdf2
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-a399-6b3f2afd83e0
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-74d5-9dcb05b2aff1
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-7e0d-1b089d9c119e
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-346a-47a8b976f31d
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-b335-6c600f1640af
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-d779-d93721b51ffc
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-1d0c-d1ebd64243bd
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-91ef-a2a2f3f5d395
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-ff89-9b4224265bb9
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-770d-d2ebf9f7bda2
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-a375-a3ae43d21257
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-433f-7cc40e05e533
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-b2b5-93ea5e0aa0a9
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-7327-bea0effe1af8
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-11c8-fff744b94cc8
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-8eef-499b8f4b40ed
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-1ffa-88f6d76b9753
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-2ad6-a0caa260ba6a
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-87a3-5befcebf93ac	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-de7f-bd5890cad9fb
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-a69f-8f2ee372c0f4
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-4c51-2eabe098ee22
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-7203-130926d344cd
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-202b-47789cc27155
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-f522-d74f06303013
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-a399-6b3f2afd83e0
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-7e0d-1b089d9c119e
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-b335-6c600f1640af
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-1d0c-d1ebd64243bd
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-7327-bea0effe1af8
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-b2b5-93ea5e0aa0a9
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-11c8-fff744b94cc8
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-2ad6-a0caa260ba6a
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-a998-c4e0191388b5	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-114f-9e037d4bd30d
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-c264-4e72afcf9c67
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-12b6-3e73f2f21ba1
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-d981-76e19eb824e3
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-6ae0-bae67868178e	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-12b6-3e73f2f21ba1
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-48e1-c8a6b950c2ba	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-c264-4e72afcf9c67
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-0458-aaee13e4bc4f
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-1ffa-88f6d76b9753
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-ffdf-ad080dd96ea9
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-e726-563b63f064f7
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-52bc-7dd1ea08da78	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-1ffa-88f6d76b9753
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-6ad4-51b107d3f53e	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-1ffa-88f6d76b9753
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-6a43-2e06926e45e4	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-2ff5-14eca45a8b4c	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6b-2ff5-14eca45a8b4c	00030000-566e-cd6b-e726-563b63f064f7
00020000-566e-cd6b-2ff5-14eca45a8b4c	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-2ff5-14eca45a8b4c	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-3988-78eb7c050d6b	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6b-3988-78eb7c050d6b	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-9dbe-c73bc09a1386
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-6940-996172cfb325
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-61ae-bc585b41f140
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-12b6-3e73f2f21ba1
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-d7ba-4e4a73c10cb3
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-92a8-dfc2196a74e9
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-9d7a-35339bad8789
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-146c-18364a04ccfe
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-b519-0846211558da
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-b978-dde994718dcc
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-2ab1-bd445b623d83
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-9e7d-be0bb8d2c462
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-861b-40583c901e98
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-2446-4216c8651187
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-8eef-499b8f4b40ed
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-0177-a48834ce16cf
00020000-566e-cd6b-7d41-1f8b3d544bcd	00030000-566e-cd6b-b1d6-f6b9c562cf35
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c01a-a8acbaa34865
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-a883-8d96a7bc3665
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9dbe-c73bc09a1386
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b852-f33f73fc3e31
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c264-4e72afcf9c67
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-5d4f-3cf38a4e5da0
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c12c-5fccc064a840
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-e5a7-067847a61005
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-af90-d362eab2e2a8
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-6940-996172cfb325
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-61ae-bc585b41f140
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-12b6-3e73f2f21ba1
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d7ba-4e4a73c10cb3
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d04c-c4b3b394a454
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9173-ccf6d5665c5d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c11d-2e5c48324f63
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9acf-c66c0337b2a9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-cfa9-1fcecfa8958e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-bad3-e64bf114b8ab
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d691-b113cc41adbd
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b2b5-93ea5e0aa0a9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-770d-d2ebf9f7bda2
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-5353-b9dd1a0263d7
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-37b5-4265b07feb1d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ed73-090f17140d90
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1a61-8d4dc8bed653
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f74f-ecfb0bccd716
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d981-76e19eb824e3
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-623c-63670c5f381a
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-92bf-229c645db9a0
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4a66-46755e097364
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2ad6-a0caa260ba6a
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-433f-7cc40e05e533
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-92a8-dfc2196a74e9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ba50-16ba5be04761
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-e108-41a16e25faec
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7da5-3e654573a575
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-8798-48ceb67e341d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0720-18adbeecf9e7
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-64e5-cae2cc63118f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-6be5-2e19944a496e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4b72-62309dec8218
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-a885-291ad411e93e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1aee-49bdd936ab94
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-82ec-66aee123fb4b
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-49d2-3b00ce3d7b34
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2a25-daf3e38a72b7
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-3cb5-7c18b4983dc4
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-aa8d-14ddd1220be3
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9d7a-35339bad8789
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-3d2c-568f39c6950f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0458-aaee13e4bc4f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-146c-18364a04ccfe
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-07ae-24ed121d4910
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0b66-2a15c20a1c59
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9c08-3ecbc31c782c
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f7aa-f3d8be864880
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1ffa-88f6d76b9753
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ffdf-ad080dd96ea9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9b6f-c338d715d109
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b519-0846211558da
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-39e0-781be0524ef1
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-11c8-fff744b94cc8
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-a375-a3ae43d21257
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-8bf7-457e96c0791e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c010-dc11476fe76f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b978-dde994718dcc
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-668f-bcad8289a3bc
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-90d1-ff97570787fe
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0993-7aa5ef6f2001
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-82bf-83cf4a6fcfb8
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-06b4-b0f28f93432d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-66e7-85faf9c3c896
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7327-bea0effe1af8
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ff89-9b4224265bb9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-eb8a-b41905b71460
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-786a-efbedd3b165f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-cc0a-696953156f10
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-de7f-bd5890cad9fb
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4ac9-29957dc77f2d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-330a-2753022a84f1
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-a69f-8f2ee372c0f4
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ab7b-c11e4ba47b9a
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4c51-2eabe098ee22
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-846e-b647353062a3
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7203-130926d344cd
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-a421-7d30717df943
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-202b-47789cc27155
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-e3bd-de98171ced91
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f522-d74f06303013
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-433e-3361b169cdf2
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-a399-6b3f2afd83e0
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-74d5-9dcb05b2aff1
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7e0d-1b089d9c119e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-346a-47a8b976f31d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b335-6c600f1640af
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d779-d93721b51ffc
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1d0c-d1ebd64243bd
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-91ef-a2a2f3f5d395
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2ab1-bd445b623d83
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ebb0-81750749aa07
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7fed-11111553bafc
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0b26-82bf15552f2f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-da4b-b0ce82d8294a
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c15f-7d7c267ee510
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9acf-cfa9d41ceeb9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-8b2e-857056335750
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-3845-548826f26b12
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-3d03-5db561efdbda
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-95e2-6b219e8fe5c9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7be8-5b5a9c3ef57e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-3172-6b9b894b6341
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9d31-3dc748ca90fc
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-dd63-3c6108aaf51d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1b32-ac54feaefb06
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2646-edce39c6f747
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-68c7-56ee4828895e
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2aa8-840015891c7b
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b963-225f25cad761
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-8713-37ace4148267
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-fc04-d143b7287586
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-326b-836bcb537bd1
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-e726-563b63f064f7
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9e7d-be0bb8d2c462
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f93d-a0c0f3d0d34a
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-589c-01604061c23c
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-fdf8-70adc178d257
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-fe53-cbafc8753fcf
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1647-36bc81033665
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-861b-40583c901e98
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f07e-ba3f299ff9c9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f3ea-158423631f99
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4f69-aab9562a013c
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2446-4216c8651187
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-45eb-fc1204db0f30
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-61a9-78ec6455f9f8
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-114f-9e037d4bd30d
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-c5a0-8b8fe275f5a9
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-96da-65af6ee63a32
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-73ee-bf60a572c0ae
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-4b5d-ea8ea765bd18
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-8eef-499b8f4b40ed
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-3a4f-7b473ee85262
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-7843-4ca56ea387eb
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-9cb9-643427032323
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-1c8e-d0c580cd0125
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-47ac-025a4d2f6678
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-ef9a-a57f68bbe688
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-0177-a48834ce16cf
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2c18-dff21d443f38
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-b1d6-f6b9c562cf35
00020000-566e-cd6d-02c7-40f1f26fd523	00030000-566e-cd6b-2b9e-be8273e9a834
00020000-566e-cd6d-081f-44de977c1507	00030000-566e-cd6b-ea36-c7e633bddd7f
00020000-566e-cd6d-6d2b-642739667e6d	00030000-566e-cd6b-f8b6-f27c5a307372
00020000-566e-cd6d-2ff9-429d175a21c8	00030000-566e-cd6b-114f-9e037d4bd30d
00020000-566e-cd6d-4920-07b06fad3298	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6d-e9cf-3e7ac57657bb	00030000-566e-cd6b-0720-18adbeecf9e7
00020000-566e-cd6d-dd20-999d5a3ce248	00030000-566e-cd6b-64e5-cae2cc63118f
00020000-566e-cd6d-c00c-082555c6a198	00030000-566e-cd6b-6be5-2e19944a496e
00020000-566e-cd6d-09b7-00b29969492b	00030000-566e-cd6b-8798-48ceb67e341d
00020000-566e-cd6d-ea45-7db5ed18671f	00030000-566e-cd6b-4b72-62309dec8218
00020000-566e-cd6d-9615-be09fef827ec	00030000-566e-cd6b-a885-291ad411e93e
00020000-566e-cd6d-093e-f19fc9720b1b	00030000-566e-cd6b-d2ca-b12ac3de1d7f
00020000-566e-cd6d-d9f2-daa00e39f0e5	00030000-566e-cd6b-0022-e4bd8e696072
00020000-566e-cd6d-f07c-3f3386235184	00030000-566e-cd6b-c962-8f85f374efb0
00020000-566e-cd6d-1ff8-10867b1bd2c5	00030000-566e-cd6b-146c-18364a04ccfe
00020000-566e-cd6d-9646-f4722b0ca190	00030000-566e-cd6b-0458-aaee13e4bc4f
00020000-566e-cd6d-c4a5-df2f1f93d234	00030000-566e-cd6b-326d-1d7e6e11c958
00020000-566e-cd6d-d060-ca960a374574	00030000-566e-cd6b-0f79-966a5ad0e612
00020000-566e-cd6d-569b-ba005c952bdd	00030000-566e-cd6b-6ca4-c66b3275b0d8
00020000-566e-cd6d-e215-f6ce02a3317e	00030000-566e-cd6b-294c-2c388b2426f6
00020000-566e-cd6d-e215-f6ce02a3317e	00030000-566e-cd6b-9b6f-c338d715d109
00020000-566e-cd6d-e215-f6ce02a3317e	00030000-566e-cd6b-d11a-54c074bfe5e7
00020000-566e-cd6d-62e5-f5abf52b18d1	00030000-566e-cd6b-4cab-b346415deeb4
00020000-566e-cd6d-620f-a291be49e4cb	00030000-566e-cd6b-61a9-78ec6455f9f8
00020000-566e-cd6d-9925-f7b11eb0d7e5	00030000-566e-cd6b-326b-836bcb537bd1
00020000-566e-cd6d-6ff8-5739a0a0bd2e	00030000-566e-cd6b-9a44-ea546c6ba266
00020000-566e-cd6d-5917-ed3521737a3d	00030000-566e-cd6b-9e7d-be0bb8d2c462
00020000-566e-cd6d-c91a-76582965643e	00030000-566e-cd6b-0804-d0036363fd40
00020000-566e-cd6d-72e0-42d6289b52b5	00030000-566e-cd6b-b978-dde994718dcc
00020000-566e-cd6d-6bcf-4f751df20b56	00030000-566e-cd6b-b77d-3c118747ddac
00020000-566e-cd6d-681f-c33d2708cab7	00030000-566e-cd6b-1c8e-d0c580cd0125
00020000-566e-cd6d-a16b-3ef850b84f6a	00030000-566e-cd6b-1ffa-88f6d76b9753
00020000-566e-cd6d-65f7-15b6a0213f39	00030000-566e-cd6b-ffdf-ad080dd96ea9
00020000-566e-cd6d-9e50-a82774ddf851	00030000-566e-cd6b-4d19-380cb911d297
00020000-566e-cd6d-a3b2-14644ec15652	00030000-566e-cd6b-e726-563b63f064f7
00020000-566e-cd6d-c541-388bbaae903a	00030000-566e-cd6b-8f62-c467c498183e
00020000-566e-cd6d-f2d8-de6ecf132059	00030000-566e-cd6b-c264-4e72afcf9c67
\.


--
-- TOC entry 3152 (class 0 OID 32132337)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32132371)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32132509)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-566e-cd6d-c586-beb78440f3ae	00090000-566e-cd6d-1f50-0ccb5787e6bb	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-566e-cd6d-1adf-a7a25e49015b	00090000-566e-cd6d-c677-87a83fb53185	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-566e-cd6d-5e56-1d5e766623a6	00090000-566e-cd6d-4276-4a4565905feb	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-566e-cd6d-14aa-99436579f67f	00090000-566e-cd6d-dda1-66d58958979a	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32132029)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-566e-cd6d-c8a4-fc699750f398	\N	00040000-566e-cd6a-92e5-f8a468134d33	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-3a8e-3e47c83be2f9	\N	00040000-566e-cd6a-92e5-f8a468134d33	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-566e-cd6d-c609-55f99da0a1a1	\N	00040000-566e-cd6a-92e5-f8a468134d33	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-9b5c-1c235b26ff89	\N	00040000-566e-cd6a-92e5-f8a468134d33	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-3f86-46f8b6a36b81	\N	00040000-566e-cd6a-92e5-f8a468134d33	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-a716-9108461c2bfa	\N	00040000-566e-cd6a-6353-d87024d25210	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-a165-566480233554	\N	00040000-566e-cd6a-2256-14b7f1264b03	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-b8b3-4582404a2f53	\N	00040000-566e-cd6a-0b8a-a0bea66d4bec	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6d-63f8-93f81102a47c	\N	00040000-566e-cd6a-3de8-4fce910e5cdc	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-566e-cd6f-3eba-6785bcb6272d	\N	00040000-566e-cd6a-92e5-f8a468134d33	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32132074)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-566e-cd6a-1dd6-2a5d3080f0de	8341	Adlešiči
00050000-566e-cd6a-edb3-7231c1f0cf73	5270	Ajdovščina
00050000-566e-cd6a-2799-b66b9d7b14f7	6280	Ankaran/Ancarano
00050000-566e-cd6a-1a44-620347e958b7	9253	Apače
00050000-566e-cd6a-6eaf-8f54800c28dc	8253	Artiče
00050000-566e-cd6a-6745-5afd308b46f3	4275	Begunje na Gorenjskem
00050000-566e-cd6a-7feb-78bd537d019d	1382	Begunje pri Cerknici
00050000-566e-cd6a-0797-6aef3fe07be8	9231	Beltinci
00050000-566e-cd6a-8174-e464a567ae20	2234	Benedikt
00050000-566e-cd6a-e1a6-2cb27efa96dd	2345	Bistrica ob Dravi
00050000-566e-cd6a-d475-9b07aa766bda	3256	Bistrica ob Sotli
00050000-566e-cd6a-7fd0-093c2267a40b	8259	Bizeljsko
00050000-566e-cd6a-5251-38f5beaa165a	1223	Blagovica
00050000-566e-cd6a-823d-7acb0610361d	8283	Blanca
00050000-566e-cd6a-62d3-7fe75db58999	4260	Bled
00050000-566e-cd6a-55e3-edde117a4106	4273	Blejska Dobrava
00050000-566e-cd6a-9254-87c35696c9d2	9265	Bodonci
00050000-566e-cd6a-5cd0-f10f30ce2dd7	9222	Bogojina
00050000-566e-cd6a-a223-4bd11de99c5f	4263	Bohinjska Bela
00050000-566e-cd6a-6d71-e264d92df895	4264	Bohinjska Bistrica
00050000-566e-cd6a-9535-be1db90e3c30	4265	Bohinjsko jezero
00050000-566e-cd6a-94b8-353b787a51c7	1353	Borovnica
00050000-566e-cd6a-7d57-6faf955ed1ec	8294	Boštanj
00050000-566e-cd6a-fd25-baa7599d2990	5230	Bovec
00050000-566e-cd6a-67d1-1e0ec9cd11b2	5295	Branik
00050000-566e-cd6a-def3-9c8b15297125	3314	Braslovče
00050000-566e-cd6a-8c7d-5b26c4662273	5223	Breginj
00050000-566e-cd6a-9c81-f3b437d44c6b	8280	Brestanica
00050000-566e-cd6a-8cce-ccd9275d7399	2354	Bresternica
00050000-566e-cd6a-2928-4b184c7e805e	4243	Brezje
00050000-566e-cd6a-99ac-2e6082682b63	1351	Brezovica pri Ljubljani
00050000-566e-cd6a-1dd3-c8abf1f3693f	8250	Brežice
00050000-566e-cd6a-2afd-d09107252801	4210	Brnik - Aerodrom
00050000-566e-cd6a-9343-732efb4f8b08	8321	Brusnice
00050000-566e-cd6a-8996-1ec6b8741699	3255	Buče
00050000-566e-cd6a-82c9-ff68093eb1fe	8276	Bučka 
00050000-566e-cd6a-289e-41b7d1bdb0e6	9261	Cankova
00050000-566e-cd6a-83b4-59bc1f5bf27b	3000	Celje 
00050000-566e-cd6a-e273-9ab64580dc77	3001	Celje - poštni predali
00050000-566e-cd6a-e9e9-69548bf82698	4207	Cerklje na Gorenjskem
00050000-566e-cd6a-9a2d-d7ac1708b078	8263	Cerklje ob Krki
00050000-566e-cd6a-71e8-ac73b98110fe	1380	Cerknica
00050000-566e-cd6a-3970-197e9bc61426	5282	Cerkno
00050000-566e-cd6a-2136-c9b82b218d57	2236	Cerkvenjak
00050000-566e-cd6a-863b-815146f59568	2215	Ceršak
00050000-566e-cd6a-eb0f-68d917bb0639	2326	Cirkovce
00050000-566e-cd6a-16b3-31b7a48e7164	2282	Cirkulane
00050000-566e-cd6a-f318-b2df275b103e	5273	Col
00050000-566e-cd6a-1037-8f8949e4992d	8251	Čatež ob Savi
00050000-566e-cd6a-7628-6f5810ed42e8	1413	Čemšenik
00050000-566e-cd6a-bafb-fb1890bb1609	5253	Čepovan
00050000-566e-cd6a-c89d-adebd1515469	9232	Črenšovci
00050000-566e-cd6a-4483-712b3c0b2c28	2393	Črna na Koroškem
00050000-566e-cd6a-2d27-b0790109cfd9	6275	Črni Kal
00050000-566e-cd6a-5083-6811357b856e	5274	Črni Vrh nad Idrijo
00050000-566e-cd6a-43db-faaebfec0483	5262	Črniče
00050000-566e-cd6a-5c7b-d7f9873a395d	8340	Črnomelj
00050000-566e-cd6a-40aa-0d9c4df61de0	6271	Dekani
00050000-566e-cd6a-b7cd-cd33f649bb99	5210	Deskle
00050000-566e-cd6a-3366-fdc4bdab2d63	2253	Destrnik
00050000-566e-cd6a-6f1f-b903f01a8fa7	6215	Divača
00050000-566e-cd6a-257a-f98eb07983d4	1233	Dob
00050000-566e-cd6a-3223-681463fab1f7	3224	Dobje pri Planini
00050000-566e-cd6a-2d5f-fb95049844e9	8257	Dobova
00050000-566e-cd6a-bc24-e2e79ec1ef6c	1423	Dobovec
00050000-566e-cd6a-d38c-2df357f41958	5263	Dobravlje
00050000-566e-cd6a-dae1-1d0d2a8c27df	3204	Dobrna
00050000-566e-cd6a-b6d0-7d88cbdaa52c	8211	Dobrnič
00050000-566e-cd6a-c3b6-c112e0a3c5e6	1356	Dobrova
00050000-566e-cd6a-ab73-2348bd8de27f	9223	Dobrovnik/Dobronak 
00050000-566e-cd6a-9c12-0a034c9ba319	5212	Dobrovo v Brdih
00050000-566e-cd6a-33e1-256fdaf77b0d	1431	Dol pri Hrastniku
00050000-566e-cd6a-7f9f-da40b551dfc9	1262	Dol pri Ljubljani
00050000-566e-cd6a-0fed-4eb394472724	1273	Dole pri Litiji
00050000-566e-cd6a-bcf7-d32e8cc859fc	1331	Dolenja vas
00050000-566e-cd6a-0290-296febc25856	8350	Dolenjske Toplice
00050000-566e-cd6a-7f30-2c79d9fc2517	1230	Domžale
00050000-566e-cd6a-4300-33ac86c673f6	2252	Dornava
00050000-566e-cd6a-7186-dfc1a931a66b	5294	Dornberk
00050000-566e-cd6a-801f-c3b959b882d4	1319	Draga
00050000-566e-cd6a-d055-349c9d3498c3	8343	Dragatuš
00050000-566e-cd6a-c121-777212066d2d	3222	Dramlje
00050000-566e-cd6a-1dab-4b135c620868	2370	Dravograd
00050000-566e-cd6a-d412-811c2c45dbfb	4203	Duplje
00050000-566e-cd6a-926d-687c3824bbd0	6221	Dutovlje
00050000-566e-cd6a-09fd-00c029f9ffac	8361	Dvor
00050000-566e-cd6a-6f26-1467d0de9b5a	2343	Fala
00050000-566e-cd6a-3666-1f408001a813	9208	Fokovci
00050000-566e-cd6a-c844-ddf3b47d5fc1	2313	Fram
00050000-566e-cd6a-26c0-3d72b2cbf025	3213	Frankolovo
00050000-566e-cd6a-605a-e8e392223510	1274	Gabrovka
00050000-566e-cd6a-2b3d-d27bab9d61ec	8254	Globoko
00050000-566e-cd6a-3471-8b64c62ad4e4	5275	Godovič
00050000-566e-cd6a-dae0-4a416f792c0c	4204	Golnik
00050000-566e-cd6a-7e87-65c95dbb1bc9	3303	Gomilsko
00050000-566e-cd6a-ca90-a3583904d343	4224	Gorenja vas
00050000-566e-cd6a-3cf0-640259401eda	3263	Gorica pri Slivnici
00050000-566e-cd6a-30a2-8e8188c8d17a	2272	Gorišnica
00050000-566e-cd6a-45ef-11aa480d750a	9250	Gornja Radgona
00050000-566e-cd6a-85d1-89db303f255f	3342	Gornji Grad
00050000-566e-cd6a-3054-cf997faf05eb	4282	Gozd Martuljek
00050000-566e-cd6a-82a3-42cfa33145a6	6272	Gračišče
00050000-566e-cd6a-8547-6c257c06a5f0	9264	Grad
00050000-566e-cd6a-2efc-29a43333415f	8332	Gradac
00050000-566e-cd6a-0eac-5a98e991d508	1384	Grahovo
00050000-566e-cd6a-de1b-d55e43d1cff9	5242	Grahovo ob Bači
00050000-566e-cd6a-9f00-ad9eaec467d5	5251	Grgar
00050000-566e-cd6a-127a-609390ae4451	3302	Griže
00050000-566e-cd6a-064f-8e075980aee0	3231	Grobelno
00050000-566e-cd6a-6576-e5ef2dbcc2ef	1290	Grosuplje
00050000-566e-cd6a-a263-a79483c1b89b	2288	Hajdina
00050000-566e-cd6a-5af8-558eb6d2403c	8362	Hinje
00050000-566e-cd6a-580b-7ed4a537ee71	2311	Hoče
00050000-566e-cd6a-a248-de4c695aa2f6	9205	Hodoš/Hodos
00050000-566e-cd6a-325c-11f457de28cc	1354	Horjul
00050000-566e-cd6a-e91a-bf0d8322594d	1372	Hotedršica
00050000-566e-cd6a-79bb-47f384c253da	1430	Hrastnik
00050000-566e-cd6a-6beb-df8923db6636	6225	Hruševje
00050000-566e-cd6a-6d8e-9a377b42c442	4276	Hrušica
00050000-566e-cd6a-9d42-9bb982b53e01	5280	Idrija
00050000-566e-cd6a-edee-6a59f659985a	1292	Ig
00050000-566e-cd6a-1706-51185e8e6693	6250	Ilirska Bistrica
00050000-566e-cd6a-cbb7-b07f384b3710	6251	Ilirska Bistrica-Trnovo
00050000-566e-cd6a-b985-712ecaf3c0c4	1295	Ivančna Gorica
00050000-566e-cd6a-2d01-2e115507a869	2259	Ivanjkovci
00050000-566e-cd6a-2975-bea701b4cf2b	1411	Izlake
00050000-566e-cd6a-7aac-49b536b143cc	6310	Izola/Isola
00050000-566e-cd6a-6c5d-a867b7cfa2b7	2222	Jakobski Dol
00050000-566e-cd6a-fc3f-4e458d00333b	2221	Jarenina
00050000-566e-cd6a-bcaf-7bceb2cd6751	6254	Jelšane
00050000-566e-cd6a-da91-488bc566b6c0	4270	Jesenice
00050000-566e-cd6a-718a-87e309b0e879	8261	Jesenice na Dolenjskem
00050000-566e-cd6a-1169-89bc0dd7e4d4	3273	Jurklošter
00050000-566e-cd6a-7476-8cdd887fe402	2223	Jurovski Dol
00050000-566e-cd6a-c8a1-068bdc04e9a8	2256	Juršinci
00050000-566e-cd6a-444b-facae6e15e01	5214	Kal nad Kanalom
00050000-566e-cd6a-292d-a4e911bdcdbd	3233	Kalobje
00050000-566e-cd6a-8d7a-b7fa0b849d52	4246	Kamna Gorica
00050000-566e-cd6a-ca3b-e3cc10c43c0a	2351	Kamnica
00050000-566e-cd6a-f834-cc2ef5bce896	1241	Kamnik
00050000-566e-cd6a-848d-7da2d99d9984	5213	Kanal
00050000-566e-cd6a-4fd5-d248c1bb86ea	8258	Kapele
00050000-566e-cd6a-c10d-5e5c9eadaf13	2362	Kapla
00050000-566e-cd6a-1b3b-6b6392825532	2325	Kidričevo
00050000-566e-cd6a-f2a9-60967d638f7b	1412	Kisovec
00050000-566e-cd6a-b94f-1c1e992f4114	6253	Knežak
00050000-566e-cd6a-163d-4bca1d49703f	5222	Kobarid
00050000-566e-cd6a-6756-ba9c1a0ff14d	9227	Kobilje
00050000-566e-cd6a-0eba-01646ba906b5	1330	Kočevje
00050000-566e-cd6a-4d26-04f77f00e7c6	1338	Kočevska Reka
00050000-566e-cd6a-0ef6-4ee45eae2414	2276	Kog
00050000-566e-cd6a-e887-3f70599da0fa	5211	Kojsko
00050000-566e-cd6a-f3a8-62533b62d36a	6223	Komen
00050000-566e-cd6a-5d7b-3b05cc7e1871	1218	Komenda
00050000-566e-cd6a-afad-0d5e0df0a6da	6000	Koper/Capodistria 
00050000-566e-cd6a-9a39-0c1eb26e78a6	6001	Koper/Capodistria - poštni predali
00050000-566e-cd6a-9cad-71c119b4f596	8282	Koprivnica
00050000-566e-cd6a-4db9-12aace13ae01	5296	Kostanjevica na Krasu
00050000-566e-cd6a-20eb-1d688a55b0af	8311	Kostanjevica na Krki
00050000-566e-cd6a-7a67-06aea9c1e5f2	1336	Kostel
00050000-566e-cd6a-52c9-d44f3ef3ceda	6256	Košana
00050000-566e-cd6a-3888-c1b6c21324c2	2394	Kotlje
00050000-566e-cd6a-3136-daa32c5270f2	6240	Kozina
00050000-566e-cd6a-a35c-78ebb345af18	3260	Kozje
00050000-566e-cd6a-3b6e-3beb73d96f75	4000	Kranj 
00050000-566e-cd6a-7604-387da7a94665	4001	Kranj - poštni predali
00050000-566e-cd6a-dcb8-ad03e9c35f84	4280	Kranjska Gora
00050000-566e-cd6a-545f-8c573a55e629	1281	Kresnice
00050000-566e-cd6a-1cbe-b8f8105f39bb	4294	Križe
00050000-566e-cd6a-5e63-7babf93d6a34	9206	Križevci
00050000-566e-cd6a-2c67-c44d9d6d6289	9242	Križevci pri Ljutomeru
00050000-566e-cd6a-2da4-136b6989d68a	1301	Krka
00050000-566e-cd6a-2c0e-63030d4b4946	8296	Krmelj
00050000-566e-cd6a-143e-815f7124c470	4245	Kropa
00050000-566e-cd6a-a35e-a9abb27b047b	8262	Krška vas
00050000-566e-cd6a-fa01-3b20cf5df677	8270	Krško
00050000-566e-cd6a-aa0a-9ceeb8aea350	9263	Kuzma
00050000-566e-cd6a-4bfe-11ba07461c55	2318	Laporje
00050000-566e-cd6a-55c5-f7ff2a7f3367	3270	Laško
00050000-566e-cd6a-3712-35db024f8d3b	1219	Laze v Tuhinju
00050000-566e-cd6a-c78b-a4675af4bd4f	2230	Lenart v Slovenskih goricah
00050000-566e-cd6a-3852-5e7992e649b5	9220	Lendava/Lendva
00050000-566e-cd6a-7c82-668776201ea9	4248	Lesce
00050000-566e-cd6a-9dfd-4393d9a75681	3261	Lesično
00050000-566e-cd6a-efeb-b65f403f37b6	8273	Leskovec pri Krškem
00050000-566e-cd6a-6f3b-0e620655d329	2372	Libeliče
00050000-566e-cd6a-e66e-50b6813794a0	2341	Limbuš
00050000-566e-cd6a-ea1f-6b7b2d74d18b	1270	Litija
00050000-566e-cd6a-8f16-4df7ac79f772	3202	Ljubečna
00050000-566e-cd6a-ed4c-ea186b4c3016	1000	Ljubljana 
00050000-566e-cd6a-3775-606462ea9e1d	1001	Ljubljana - poštni predali
00050000-566e-cd6a-9007-1108980a616e	1231	Ljubljana - Črnuče
00050000-566e-cd6a-3e6e-eb26cdcd311f	1261	Ljubljana - Dobrunje
00050000-566e-cd6a-1d3b-20acf9991c59	1260	Ljubljana - Polje
00050000-566e-cd6a-8fe0-c16cd7b6f6e1	1210	Ljubljana - Šentvid
00050000-566e-cd6a-cd50-6147185b5223	1211	Ljubljana - Šmartno
00050000-566e-cd6a-e838-7f9d477a54ce	3333	Ljubno ob Savinji
00050000-566e-cd6a-072d-510d603c6a48	9240	Ljutomer
00050000-566e-cd6a-793e-7dbaf5fed3a3	3215	Loče
00050000-566e-cd6a-4c26-e9c3c0e3ca74	5231	Log pod Mangartom
00050000-566e-cd6a-0879-cdeac5313e0d	1358	Log pri Brezovici
00050000-566e-cd6a-c525-f156afa8079f	1370	Logatec
00050000-566e-cd6a-0609-e86625dbe07f	1371	Logatec
00050000-566e-cd6a-e4bf-2e123e55b056	1434	Loka pri Zidanem Mostu
00050000-566e-cd6a-aabe-a06ccaae9381	3223	Loka pri Žusmu
00050000-566e-cd6a-da2a-24008f309c2a	6219	Lokev
00050000-566e-cd6a-6303-75d3ddf64433	1318	Loški Potok
00050000-566e-cd6a-f35b-0b7d73490f3e	2324	Lovrenc na Dravskem polju
00050000-566e-cd6a-33f7-909c9785a2b8	2344	Lovrenc na Pohorju
00050000-566e-cd6a-a710-140f7b10d331	3334	Luče
00050000-566e-cd6a-f156-0ea60634fc95	1225	Lukovica
00050000-566e-cd6a-328a-e1f2f0ca938b	9202	Mačkovci
00050000-566e-cd6a-b924-9b563a0975e5	2322	Majšperk
00050000-566e-cd6a-6113-2d8800e94421	2321	Makole
00050000-566e-cd6a-8822-f146919d93ea	9243	Mala Nedelja
00050000-566e-cd6a-d251-51fb1d32ec99	2229	Malečnik
00050000-566e-cd6a-e3ad-d4523cc9b0cc	6273	Marezige
00050000-566e-cd6a-185d-200dd66b5204	2000	Maribor 
00050000-566e-cd6a-2bb1-fe37ee8bfd75	2001	Maribor - poštni predali
00050000-566e-cd6a-8829-9281711c0430	2206	Marjeta na Dravskem polju
00050000-566e-cd6a-d86f-0f0939995e07	2281	Markovci
00050000-566e-cd6a-14f0-b5f8f68d562d	9221	Martjanci
00050000-566e-cd6a-b8b4-91c8dc529f8b	6242	Materija
00050000-566e-cd6a-afa8-b89c478981fb	4211	Mavčiče
00050000-566e-cd6a-8476-83198c9f1d68	1215	Medvode
00050000-566e-cd6a-5906-36d125693c12	1234	Mengeš
00050000-566e-cd6a-8f97-769ae67454f3	8330	Metlika
00050000-566e-cd6a-cf1b-4817ada5ea9f	2392	Mežica
00050000-566e-cd6a-555a-36251ac00cad	2204	Miklavž na Dravskem polju
00050000-566e-cd6a-f3d4-0c2495c3b7f1	2275	Miklavž pri Ormožu
00050000-566e-cd6a-c284-c8bd63c81665	5291	Miren
00050000-566e-cd6a-03d5-5f245806ec91	8233	Mirna
00050000-566e-cd6a-2566-28fadb3d6751	8216	Mirna Peč
00050000-566e-cd6a-f64a-ca60811714fc	2382	Mislinja
00050000-566e-cd6a-ceb8-7b1fdcc6612e	4281	Mojstrana
00050000-566e-cd6a-0d89-bbe637013a18	8230	Mokronog
00050000-566e-cd6a-1a52-69526c5431a2	1251	Moravče
00050000-566e-cd6a-8e4d-df4cf8a54a3e	9226	Moravske Toplice
00050000-566e-cd6a-38a7-af89c9583db4	5216	Most na Soči
00050000-566e-cd6a-6c40-8cb0b57a2e0c	1221	Motnik
00050000-566e-cd6a-f82d-88758e32c91f	3330	Mozirje
00050000-566e-cd6a-e606-60bb4479988c	9000	Murska Sobota 
00050000-566e-cd6a-7b94-f59f519d105c	9001	Murska Sobota - poštni predali
00050000-566e-cd6a-728b-657c5c461a8c	2366	Muta
00050000-566e-cd6a-80fb-d6479a016240	4202	Naklo
00050000-566e-cd6a-c9a8-cb2cbce41e98	3331	Nazarje
00050000-566e-cd6a-6489-b404254b649b	1357	Notranje Gorice
00050000-566e-cd6a-ca78-d15de1b2ddc7	3203	Nova Cerkev
00050000-566e-cd6a-e8cf-234cc15d2efd	5000	Nova Gorica 
00050000-566e-cd6a-02c8-a126380ee81d	5001	Nova Gorica - poštni predali
00050000-566e-cd6a-b515-c4fabd3ff562	1385	Nova vas
00050000-566e-cd6a-6522-3a5a8ea28041	8000	Novo mesto
00050000-566e-cd6a-6202-17a634500bda	8001	Novo mesto - poštni predali
00050000-566e-cd6a-de0e-3c0d671a56c3	6243	Obrov
00050000-566e-cd6a-93b4-3592891deacf	9233	Odranci
00050000-566e-cd6a-ad10-50a7025620cf	2317	Oplotnica
00050000-566e-cd6a-16e9-5b0c1a668192	2312	Orehova vas
00050000-566e-cd6a-0329-42beba787e2f	2270	Ormož
00050000-566e-cd6a-1380-5f246fde8fac	1316	Ortnek
00050000-566e-cd6a-d5f4-bc3919d9d3b4	1337	Osilnica
00050000-566e-cd6a-f76a-3d840c64f4eb	8222	Otočec
00050000-566e-cd6a-7a68-922596f5b5ba	2361	Ožbalt
00050000-566e-cd6a-eba9-bec5d1240a8f	2231	Pernica
00050000-566e-cd6a-16bf-a25db81a5d67	2211	Pesnica pri Mariboru
00050000-566e-cd6a-5d41-59f3e76352df	9203	Petrovci
00050000-566e-cd6a-13b9-2c94a943a311	3301	Petrovče
00050000-566e-cd6a-bad4-53987af9d5b8	6330	Piran/Pirano
00050000-566e-cd6a-ce9b-5216e4284bb3	8255	Pišece
00050000-566e-cd6a-e78a-a0c4fb9d1964	6257	Pivka
00050000-566e-cd6a-e36f-0a6fde27585d	6232	Planina
00050000-566e-cd6a-f3d7-035235e6ed71	3225	Planina pri Sevnici
00050000-566e-cd6a-558d-4281e058a4e4	6276	Pobegi
00050000-566e-cd6a-99cc-a6e8439faa01	8312	Podbočje
00050000-566e-cd6a-f63c-4824d6b10320	5243	Podbrdo
00050000-566e-cd6a-800e-889bf05433fc	3254	Podčetrtek
00050000-566e-cd6a-e930-6bc20524c7c2	2273	Podgorci
00050000-566e-cd6a-7952-2b68cc3157b1	6216	Podgorje
00050000-566e-cd6a-37a2-a69e2bb5e737	2381	Podgorje pri Slovenj Gradcu
00050000-566e-cd6a-1820-c401b2c1aea2	6244	Podgrad
00050000-566e-cd6a-1a7b-8e583972b905	1414	Podkum
00050000-566e-cd6a-601e-3e394ceadabe	2286	Podlehnik
00050000-566e-cd6a-224a-f142ba71c4f4	5272	Podnanos
00050000-566e-cd6a-07a9-6af53da6a8d5	4244	Podnart
00050000-566e-cd6a-f04e-935ebcb1bec6	3241	Podplat
00050000-566e-cd6a-7290-19effa4b613c	3257	Podsreda
00050000-566e-cd6a-0fc7-7f1a6577eadc	2363	Podvelka
00050000-566e-cd6a-6c76-0b3c473840a2	2208	Pohorje
00050000-566e-cd6a-d93b-c223228b48f1	2257	Polenšak
00050000-566e-cd6a-c5b6-0bbfb3f6feb2	1355	Polhov Gradec
00050000-566e-cd6a-b6db-1f47eb03d68a	4223	Poljane nad Škofjo Loko
00050000-566e-cd6a-97ec-e4d619968965	2319	Poljčane
00050000-566e-cd6a-3ee8-80b8a634f737	1272	Polšnik
00050000-566e-cd6a-01c9-654f54ba8852	3313	Polzela
00050000-566e-cd6a-e8eb-e4abf502893c	3232	Ponikva
00050000-566e-cd6a-c616-13ec852778f5	6320	Portorož/Portorose
00050000-566e-cd6a-60b9-b5fcd067b8d9	6230	Postojna
00050000-566e-cd6a-5d6d-db45e6bcfe7b	2331	Pragersko
00050000-566e-cd6a-b6cd-81537e293f37	3312	Prebold
00050000-566e-cd6a-4f6d-4e554742fdfc	4205	Preddvor
00050000-566e-cd6a-b7ff-befecb1662d7	6255	Prem
00050000-566e-cd6a-2c70-854c1a5981cd	1352	Preserje
00050000-566e-cd6a-8e26-e88f67db5a22	6258	Prestranek
00050000-566e-cd6a-0587-1b5f78cde3de	2391	Prevalje
00050000-566e-cd6a-4582-7267a7fdebd4	3262	Prevorje
00050000-566e-cd6a-d270-a0c1e3514d2f	1276	Primskovo 
00050000-566e-cd6a-8735-76cf49851a2d	3253	Pristava pri Mestinju
00050000-566e-cd6a-0248-04f58ee55a48	9207	Prosenjakovci/Partosfalva
00050000-566e-cd6a-6214-6245df62e760	5297	Prvačina
00050000-566e-cd6a-8c3d-4b3e69e07120	2250	Ptuj
00050000-566e-cd6a-4af2-7de7259767e8	2323	Ptujska Gora
00050000-566e-cd6a-f5af-ed7a56131339	9201	Puconci
00050000-566e-cd6a-537f-96138bb25d8e	2327	Rače
00050000-566e-cd6a-6cde-6c4f9fdf7543	1433	Radeče
00050000-566e-cd6a-b34f-d126ea86d0e6	9252	Radenci
00050000-566e-cd6a-d131-794495070ddc	2360	Radlje ob Dravi
00050000-566e-cd6a-a17a-cbe637bf58cf	1235	Radomlje
00050000-566e-cd6a-07f3-4cf952e27305	4240	Radovljica
00050000-566e-cd6a-2c27-ab27ee2907ff	8274	Raka
00050000-566e-cd6a-8f64-18ba5d4bffa7	1381	Rakek
00050000-566e-cd6a-2f0b-19fc37e86127	4283	Rateče - Planica
00050000-566e-cd6a-07f0-150dd1adcaa2	2390	Ravne na Koroškem
00050000-566e-cd6a-4aab-876f588e439c	9246	Razkrižje
00050000-566e-cd6a-30db-e0c9df321bb3	3332	Rečica ob Savinji
00050000-566e-cd6a-aca9-e281333698b0	5292	Renče
00050000-566e-cd6a-2088-664f410f19bc	1310	Ribnica
00050000-566e-cd6a-a04d-26b4a6006250	2364	Ribnica na Pohorju
00050000-566e-cd6a-7613-70ca992845e2	3272	Rimske Toplice
00050000-566e-cd6a-66e4-3f1f4c06e04a	1314	Rob
00050000-566e-cd6a-d6ff-1cb50e2637e2	5215	Ročinj
00050000-566e-cd6a-39cb-3eef217c29c3	3250	Rogaška Slatina
00050000-566e-cd6a-3694-fb34ea69ef03	9262	Rogašovci
00050000-566e-cd6a-af35-f37fbbbe427c	3252	Rogatec
00050000-566e-cd6a-e501-0da81d0b5714	1373	Rovte
00050000-566e-cd6a-a2c8-15d34bf95833	2342	Ruše
00050000-566e-cd6a-a326-1ccc75094a37	1282	Sava
00050000-566e-cd6a-e5e3-49aa84fc76a9	6333	Sečovlje/Sicciole
00050000-566e-cd6a-c600-1de1d5913a51	4227	Selca
00050000-566e-cd6a-787a-bc5da07d52bd	2352	Selnica ob Dravi
00050000-566e-cd6a-3b50-b3291debc60a	8333	Semič
00050000-566e-cd6a-5232-86c7f08ba9ad	8281	Senovo
00050000-566e-cd6a-a89a-3937c61706c5	6224	Senožeče
00050000-566e-cd6a-4d85-24a3e98edb2d	8290	Sevnica
00050000-566e-cd6a-e1b4-f9f116d08e2a	6210	Sežana
00050000-566e-cd6a-c6dd-1f3f8962f95b	2214	Sladki Vrh
00050000-566e-cd6a-8df9-becaf356e668	5283	Slap ob Idrijci
00050000-566e-cd6a-34ae-6ddc4385d9f9	2380	Slovenj Gradec
00050000-566e-cd6a-6556-2bc65cd7a101	2310	Slovenska Bistrica
00050000-566e-cd6a-bdce-e52318e3306e	3210	Slovenske Konjice
00050000-566e-cd6a-76f7-a21241f6e297	1216	Smlednik
00050000-566e-cd6a-3d14-a03052944741	5232	Soča
00050000-566e-cd6a-578b-9dba5b12bc99	1317	Sodražica
00050000-566e-cd6a-99ad-deeaa8efc4f4	3335	Solčava
00050000-566e-cd6a-6954-7b0645c52c64	5250	Solkan
00050000-566e-cd6a-ab3e-a5957b17900a	4229	Sorica
00050000-566e-cd6a-e833-3720b1d5b57c	4225	Sovodenj
00050000-566e-cd6a-41ad-7150f4e7e946	5281	Spodnja Idrija
00050000-566e-cd6a-2a29-44d3c654d024	2241	Spodnji Duplek
00050000-566e-cd6a-e755-f8460159b1d9	9245	Spodnji Ivanjci
00050000-566e-cd6a-62c7-0553da7af9d3	2277	Središče ob Dravi
00050000-566e-cd6a-06ec-0503ae3fb85d	4267	Srednja vas v Bohinju
00050000-566e-cd6a-7d7f-c3986c85cc3c	8256	Sromlje 
00050000-566e-cd6a-12f3-2795b85a1111	5224	Srpenica
00050000-566e-cd6a-f410-b2eca4289214	1242	Stahovica
00050000-566e-cd6a-c094-a9d43e432467	1332	Stara Cerkev
00050000-566e-cd6a-a3d1-9880884a37b0	8342	Stari trg ob Kolpi
00050000-566e-cd6a-04b3-5c9f06adc5fb	1386	Stari trg pri Ložu
00050000-566e-cd6a-e8ba-d049c5f832a7	2205	Starše
00050000-566e-cd6a-bb57-abda5ba733dd	2289	Stoperce
00050000-566e-cd6a-916c-0e7d98b85ede	8322	Stopiče
00050000-566e-cd6a-1238-e6c1763328c2	3206	Stranice
00050000-566e-cd6a-5d1d-3160a114bd3a	8351	Straža
00050000-566e-cd6a-9faf-8a3aa0dfbfbe	1313	Struge
00050000-566e-cd6a-6e08-d4b2ec5b3fed	8293	Studenec
00050000-566e-cd6a-d1f1-2f0a6a61a2c1	8331	Suhor
00050000-566e-cd6a-9209-7472b6cab2d2	2233	Sv. Ana v Slovenskih goricah
00050000-566e-cd6a-7c20-e498b918c95b	2235	Sv. Trojica v Slovenskih goricah
00050000-566e-cd6a-2990-40a68d89f5eb	2353	Sveti Duh na Ostrem Vrhu
00050000-566e-cd6a-b585-ee2d519f07c5	9244	Sveti Jurij ob Ščavnici
00050000-566e-cd6a-8034-e3c9a24ae210	3264	Sveti Štefan
00050000-566e-cd6a-bfc4-a489c91579a0	2258	Sveti Tomaž
00050000-566e-cd6a-81f6-a94d6d69ba7a	9204	Šalovci
00050000-566e-cd6a-894b-603a0affcbdc	5261	Šempas
00050000-566e-cd6a-7ef0-0604488d1b16	5290	Šempeter pri Gorici
00050000-566e-cd6a-ca0e-0a822168afa2	3311	Šempeter v Savinjski dolini
00050000-566e-cd6a-8f03-89149dbd8a7a	4208	Šenčur
00050000-566e-cd6a-843e-f67471a10d50	2212	Šentilj v Slovenskih goricah
00050000-566e-cd6a-abc2-dbe6e6ff3879	8297	Šentjanž
00050000-566e-cd6a-8581-7e5137fc63b4	2373	Šentjanž pri Dravogradu
00050000-566e-cd6a-a07f-8cbbdf968b91	8310	Šentjernej
00050000-566e-cd6a-5b32-ceea8392341d	3230	Šentjur
00050000-566e-cd6a-02b3-e7460af51c44	3271	Šentrupert
00050000-566e-cd6a-fcb3-0211be214056	8232	Šentrupert
00050000-566e-cd6a-70e6-29ce48dfbb0a	1296	Šentvid pri Stični
00050000-566e-cd6a-89f2-874a31f5c14c	8275	Škocjan
00050000-566e-cd6a-043f-0268fc74b14b	6281	Škofije
00050000-566e-cd6a-73f3-8f608a7af470	4220	Škofja Loka
00050000-566e-cd6a-dbb2-42ffc424df2a	3211	Škofja vas
00050000-566e-cd6a-765a-51ea308da37b	1291	Škofljica
00050000-566e-cd6a-657c-657a4a730bb5	6274	Šmarje
00050000-566e-cd6a-cdaf-ef6832a342e8	1293	Šmarje - Sap
00050000-566e-cd6a-f169-a9510baeaaa9	3240	Šmarje pri Jelšah
00050000-566e-cd6a-18ef-b1f741aa1356	8220	Šmarješke Toplice
00050000-566e-cd6a-077d-e038b42ec3fe	2315	Šmartno na Pohorju
00050000-566e-cd6a-6b3d-4c260c4673f2	3341	Šmartno ob Dreti
00050000-566e-cd6a-c208-9c83bea71116	3327	Šmartno ob Paki
00050000-566e-cd6a-0a93-19f449494de4	1275	Šmartno pri Litiji
00050000-566e-cd6a-a0b5-2e33c2d254d0	2383	Šmartno pri Slovenj Gradcu
00050000-566e-cd6a-c07c-3f1ef97a319b	3201	Šmartno v Rožni dolini
00050000-566e-cd6a-d40f-3c35bcbe841c	3325	Šoštanj
00050000-566e-cd6a-7e38-9a174e8cea62	6222	Štanjel
00050000-566e-cd6a-da23-e7f2f14c7215	3220	Štore
00050000-566e-cd6a-f1e9-088d1783ae18	3304	Tabor
00050000-566e-cd6a-d867-6bbda9208d9a	3221	Teharje
00050000-566e-cd6a-c2bf-1ecd01257172	9251	Tišina
00050000-566e-cd6a-4057-e2d6d5461ede	5220	Tolmin
00050000-566e-cd6a-3725-4acddd506048	3326	Topolšica
00050000-566e-cd6a-3c7a-119ab649d78c	2371	Trbonje
00050000-566e-cd6a-d558-24a8259c02f2	1420	Trbovlje
00050000-566e-cd6a-d58a-bb501316dd4d	8231	Trebelno 
00050000-566e-cd6a-0655-415f75cf62d9	8210	Trebnje
00050000-566e-cd6a-229c-ca9469db6d6b	5252	Trnovo pri Gorici
00050000-566e-cd6a-a3ea-3c95aac260b3	2254	Trnovska vas
00050000-566e-cd6a-f595-82164e5ac4fd	1222	Trojane
00050000-566e-cd6a-e4a6-1f1efe572477	1236	Trzin
00050000-566e-cd6a-e4ed-b7864e5a5054	4290	Tržič
00050000-566e-cd6a-f9e1-cb948c6dd173	8295	Tržišče
00050000-566e-cd6a-5745-3198ecc16d26	1311	Turjak
00050000-566e-cd6a-0dcb-5385dbbdfbe7	9224	Turnišče
00050000-566e-cd6a-ee95-33ae8383303e	8323	Uršna sela
00050000-566e-cd6a-8587-800c946a6ab6	1252	Vače
00050000-566e-cd6a-c21f-748b6caa31bb	3320	Velenje 
00050000-566e-cd6a-7ced-262fb3efadc5	3322	Velenje - poštni predali
00050000-566e-cd6a-3a52-ec655f420664	8212	Velika Loka
00050000-566e-cd6a-f4a9-a63d947c280b	2274	Velika Nedelja
00050000-566e-cd6a-73bf-3e5279781659	9225	Velika Polana
00050000-566e-cd6a-9c28-63f312e71bec	1315	Velike Lašče
00050000-566e-cd6a-544f-cac584c799ee	8213	Veliki Gaber
00050000-566e-cd6a-6a20-089b9b81268f	9241	Veržej
00050000-566e-cd6a-d119-3ff73c6c6f1d	1312	Videm - Dobrepolje
00050000-566e-cd6a-c4f1-c0e86ff068b9	2284	Videm pri Ptuju
00050000-566e-cd6a-8050-65111157ec66	8344	Vinica
00050000-566e-cd6a-6bb8-3b20e25fd1a3	5271	Vipava
00050000-566e-cd6a-f410-743f9786f827	4212	Visoko
00050000-566e-cd6a-0d6d-ad7e6a668ed6	1294	Višnja Gora
00050000-566e-cd6a-dd6a-5d5e7b0be9a8	3205	Vitanje
00050000-566e-cd6a-2207-5d546d9782b5	2255	Vitomarci
00050000-566e-cd6a-46d9-a850a7050100	1217	Vodice
00050000-566e-cd6a-19c5-5b37d77f9fb7	3212	Vojnik\t
00050000-566e-cd6a-efd6-fc70e5ab8b15	5293	Volčja Draga
00050000-566e-cd6a-59c2-4ffe1d54322f	2232	Voličina
00050000-566e-cd6a-6d4a-021230da9af5	3305	Vransko
00050000-566e-cd6a-818c-86cc9d94673c	6217	Vremski Britof
00050000-566e-cd6a-9d60-3872d2d28d5e	1360	Vrhnika
00050000-566e-cd6a-adbb-4e2335061abd	2365	Vuhred
00050000-566e-cd6a-3906-4033a0f63eec	2367	Vuzenica
00050000-566e-cd6a-775e-fecf658db4f6	8292	Zabukovje 
00050000-566e-cd6a-5993-5f04e623a5ef	1410	Zagorje ob Savi
00050000-566e-cd6a-53b1-a1e565479154	1303	Zagradec
00050000-566e-cd6a-d55b-4e80c0158f4e	2283	Zavrč
00050000-566e-cd6a-252e-ada334d0a8cb	8272	Zdole 
00050000-566e-cd6a-47f2-4fb5ce0c5a54	4201	Zgornja Besnica
00050000-566e-cd6a-b938-298a6c0f4aad	2242	Zgornja Korena
00050000-566e-cd6a-3319-c5a602da0a56	2201	Zgornja Kungota
00050000-566e-cd6a-1961-fac1225958c7	2316	Zgornja Ložnica
00050000-566e-cd6a-7a44-cf9fd5f80788	2314	Zgornja Polskava
00050000-566e-cd6a-2198-6f2d563e4350	2213	Zgornja Velka
00050000-566e-cd6a-7627-88d87b567e6e	4247	Zgornje Gorje
00050000-566e-cd6a-398b-1beaa380e5ba	4206	Zgornje Jezersko
00050000-566e-cd6a-7f41-5a9169f4a098	2285	Zgornji Leskovec
00050000-566e-cd6a-197a-97cace76594d	1432	Zidani Most
00050000-566e-cd6a-ad65-e59a985791d2	3214	Zreče
00050000-566e-cd6a-b5a7-c0e8c52073f1	4209	Žabnica
00050000-566e-cd6a-1d62-e24bb414d70b	3310	Žalec
00050000-566e-cd6a-52c3-dde5c8c0e579	4228	Železniki
00050000-566e-cd6a-d04c-ea4c76a09b37	2287	Žetale
00050000-566e-cd6a-72bc-0eb53bf3a45d	4226	Žiri
00050000-566e-cd6a-2635-8144eb72f867	4274	Žirovnica
00050000-566e-cd6a-bb39-5fb1c29f08b1	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32132747)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32132311)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32132059)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-566e-cd6d-2a00-d115f9671081	00080000-566e-cd6d-c8a4-fc699750f398	\N	00040000-566e-cd6a-92e5-f8a468134d33	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-566e-cd6d-0214-c38406546d76	00080000-566e-cd6d-c8a4-fc699750f398	\N	00040000-566e-cd6a-92e5-f8a468134d33	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-566e-cd6d-cf97-9ff9cc2756e5	00080000-566e-cd6d-3a8e-3e47c83be2f9	\N	00040000-566e-cd6a-92e5-f8a468134d33	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32132203)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-566e-cd6b-3081-1b5223ee98b3	novo leto	1	1	\N	t
00430000-566e-cd6b-c300-7de916be795f	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-566e-cd6b-0e14-1331d19447a1	dan upora proti okupatorju	27	4	\N	t
00430000-566e-cd6b-15ea-97f9ceddee51	praznik dela	1	5	\N	t
00430000-566e-cd6b-9efa-2c08bb78efef	praznik dela	2	5	\N	t
00430000-566e-cd6b-b7da-a15b4a216fdb	dan Primoža Trubarja	8	6	\N	f
00430000-566e-cd6b-58e6-0e5aa2b54949	dan državnosti	25	6	\N	t
00430000-566e-cd6b-4953-72d8f7203deb	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-566e-cd6b-dc0c-127afecd82a0	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-566e-cd6b-9989-5cac67aa12c8	dan suverenosti	25	10	\N	f
00430000-566e-cd6b-b9fc-cb4436331a1c	dan spomina na mrtve	1	11	\N	t
00430000-566e-cd6b-c81e-c929a8a94ad9	dan Rudolfa Maistra	23	11	\N	f
00430000-566e-cd6b-d64b-9e09aae566a9	božič	25	12	\N	t
00430000-566e-cd6b-3f1b-87e3490fd43c	dan samostojnosti in enotnosti	26	12	\N	t
00430000-566e-cd6b-cd3e-ef31fa693528	Marijino vnebovzetje	15	8	\N	t
00430000-566e-cd6b-ee9f-51965428e527	dan reformacije	31	10	\N	t
00430000-566e-cd6b-c918-f02e9369f89b	velikonočna nedelja	27	3	2016	t
00430000-566e-cd6b-5e56-e64e72b7789f	velikonočna nedelja	16	4	2017	t
00430000-566e-cd6b-d62e-86abfbf2752c	velikonočna nedelja	1	4	2018	t
00430000-566e-cd6b-85d4-617c3a71221e	velikonočna nedelja	21	4	2019	t
00430000-566e-cd6b-d797-8524b5ba9419	velikonočna nedelja	12	4	2020	t
00430000-566e-cd6b-95fc-cd8179eb2c24	velikonočna nedelja	4	4	2021	t
00430000-566e-cd6b-d335-3cd411c687e3	velikonočna nedelja	17	4	2022	t
00430000-566e-cd6b-7019-d20ff6d44612	velikonočna nedelja	9	4	2023	t
00430000-566e-cd6b-a1ce-3132beb7d44e	velikonočna nedelja	31	3	2024	t
00430000-566e-cd6b-9501-bbbdc1898d23	velikonočna nedelja	20	4	2025	t
00430000-566e-cd6b-0e69-d6b418c4511c	velikonočna nedelja	5	4	2026	t
00430000-566e-cd6b-7c1a-43951945a8dc	velikonočna nedelja	28	3	2027	t
00430000-566e-cd6b-c9c2-a31ffb5c1338	velikonočna nedelja	16	4	2028	t
00430000-566e-cd6b-013d-d6aed620641e	velikonočna nedelja	1	4	2029	t
00430000-566e-cd6b-dd5a-c368e014939d	velikonočna nedelja	21	4	2030	t
00430000-566e-cd6b-d2b5-bc24c2e969ba	velikonočni ponedeljek	28	3	2016	t
00430000-566e-cd6b-2c2a-1376462388a8	velikonočni ponedeljek	17	4	2017	t
00430000-566e-cd6b-cd7d-3470b285b260	velikonočni ponedeljek	2	4	2018	t
00430000-566e-cd6b-0293-891e79974348	velikonočni ponedeljek	22	4	2019	t
00430000-566e-cd6b-3c4d-9670fe20aecf	velikonočni ponedeljek	13	4	2020	t
00430000-566e-cd6b-bb58-6b91379885d3	velikonočni ponedeljek	5	4	2021	t
00430000-566e-cd6b-50a2-9a5ffdf1a500	velikonočni ponedeljek	18	4	2022	t
00430000-566e-cd6b-589a-f42469fe0ea0	velikonočni ponedeljek	10	4	2023	t
00430000-566e-cd6b-ed71-7b00d38434de	velikonočni ponedeljek	1	4	2024	t
00430000-566e-cd6b-0bf5-7cc8fb7e4637	velikonočni ponedeljek	21	4	2025	t
00430000-566e-cd6b-8843-649f031ad3cf	velikonočni ponedeljek	6	4	2026	t
00430000-566e-cd6b-8297-9fb70878a382	velikonočni ponedeljek	29	3	2027	t
00430000-566e-cd6b-8b01-50e6a17a6d8f	velikonočni ponedeljek	17	4	2028	t
00430000-566e-cd6b-32cb-15823c0cf747	velikonočni ponedeljek	2	4	2029	t
00430000-566e-cd6b-271f-55d88b2ca2bb	velikonočni ponedeljek	22	4	2030	t
00430000-566e-cd6b-6101-b73dd9df5ca2	binkoštna nedelja - binkošti	15	5	2016	t
00430000-566e-cd6b-f632-b710aa34c5f4	binkoštna nedelja - binkošti	4	6	2017	t
00430000-566e-cd6b-e771-189c2593270f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-566e-cd6b-1b14-28cfeacac655	binkoštna nedelja - binkošti	9	6	2019	t
00430000-566e-cd6b-f22c-b635c4380a7c	binkoštna nedelja - binkošti	31	5	2020	t
00430000-566e-cd6b-586d-022c0f5a2a14	binkoštna nedelja - binkošti	23	5	2021	t
00430000-566e-cd6b-6d0a-3b69745c3a87	binkoštna nedelja - binkošti	5	6	2022	t
00430000-566e-cd6b-2a0b-033526e196fd	binkoštna nedelja - binkošti	28	5	2023	t
00430000-566e-cd6b-92b4-c443b7f93297	binkoštna nedelja - binkošti	19	5	2024	t
00430000-566e-cd6b-1412-3e9f565d5e31	binkoštna nedelja - binkošti	8	6	2025	t
00430000-566e-cd6b-d54c-f333076c3034	binkoštna nedelja - binkošti	24	5	2026	t
00430000-566e-cd6b-3cc8-cd0924281320	binkoštna nedelja - binkošti	16	5	2027	t
00430000-566e-cd6b-1d7b-37825bf92f61	binkoštna nedelja - binkošti	4	6	2028	t
00430000-566e-cd6b-b5bb-8eddcd5567c2	binkoštna nedelja - binkošti	20	5	2029	t
00430000-566e-cd6b-8f11-4cc4930f2ccd	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32132163)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32132175)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32132323)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32132761)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32132771)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-566e-cd6d-f4af-1e8bf3720567	00080000-566e-cd6d-c609-55f99da0a1a1	0987	AK
00190000-566e-cd6d-e82f-6cc77ce3a407	00080000-566e-cd6d-3a8e-3e47c83be2f9	0989	AK
00190000-566e-cd6d-de36-e8d5715293e3	00080000-566e-cd6d-9b5c-1c235b26ff89	0986	AK
00190000-566e-cd6d-a729-9b103d17dcda	00080000-566e-cd6d-a716-9108461c2bfa	0984	AK
00190000-566e-cd6d-60d3-0bf38c2e3dea	00080000-566e-cd6d-a165-566480233554	0983	AK
00190000-566e-cd6d-8a79-bdccd8c15d13	00080000-566e-cd6d-b8b3-4582404a2f53	0982	AK
00190000-566e-cd6f-2888-b5e842cec584	00080000-566e-cd6f-3eba-6785bcb6272d	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32132660)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-566e-cd6e-5ca4-79cafe5f8039	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32132779)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32132352)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-566e-cd6d-3fe4-0d8e601c7d11	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-566e-cd6d-1eb1-0eb631d6f5ad	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-566e-cd6d-b25c-b5e08146891c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-566e-cd6d-9916-dbf08e5ba494	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-566e-cd6d-211f-d71ab63907bc	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-566e-cd6d-cdfb-30023e774ac2	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-566e-cd6d-e5b1-34929c6a915b	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32132296)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32132286)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32132498)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32132428)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32132137)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32131899)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-566e-cd6f-3eba-6785bcb6272d	00010000-566e-cd6b-79dc-d5d42bbc46e9	2015-12-14 15:08:47	INS	a:0:{}
2	App\\Entity\\Option	00000000-566e-cd6f-d238-c4156a313343	00010000-566e-cd6b-79dc-d5d42bbc46e9	2015-12-14 15:08:47	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-566e-cd6f-2888-b5e842cec584	00010000-566e-cd6b-79dc-d5d42bbc46e9	2015-12-14 15:08:47	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32132365)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32131937)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-566e-cd6b-e489-e92ca3bfa38c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-566e-cd6b-b9f7-0ddf0c8e006b	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-566e-cd6b-589b-0b07aa23da3b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-566e-cd6b-7eea-0f51c65c859e	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-566e-cd6b-0b3e-b4cfc8bfa2c3	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-566e-cd6b-d0b8-fe129eb73a49	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-566e-cd6b-699a-89a845550789	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-566e-cd6b-62f7-2aae42274980	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-566e-cd6b-fb66-04cdcce1e18f	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cd6b-3a24-f8366a7de0f5	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cd6b-2fe5-0a4d8898e7c3	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cd6b-d014-79884f026f7a	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-566e-cd6b-9e84-7ed3542a71f9	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-566e-cd6b-0dea-cdde69c3f2f4	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-566e-cd6b-de68-f52565eada5a	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566e-cd6b-1cc2-5e99ca8d77ea	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-566e-cd6b-cfa5-03e747cfbb49	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-566e-cd6b-19e1-d23207a45034	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-566e-cd6b-6c35-9d0eb8fc9722	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-566e-cd6b-7523-a3547504d861	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-566e-cd6b-8137-48ce695a612e	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566e-cd6b-6d99-cd88cab5af0d	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-566e-cd6b-40d6-0484456230a6	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566e-cd6b-eb0c-0499b635d9c9	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-566e-cd6b-44b8-133e4e3a635a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-566e-cd6b-8dd3-53e2de2b7965	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-566e-cd6b-eacc-51b3325e22a7	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-566e-cd6b-5e61-edacdcb34637	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-566e-cd6b-22ec-1b70c334ab23	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-566e-cd6b-757e-be600392e324	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-566e-cd6b-7c33-076ace57f1bc	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-566e-cd6b-7c73-e342c0266f1d	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-566e-cd6b-1afd-c27f6a5b22b3	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-566e-cd6b-620e-324027b7fad3	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-566e-cd6b-87a3-5befcebf93ac	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-566e-cd6b-a998-c4e0191388b5	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-566e-cd6b-6ae0-bae67868178e	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-566e-cd6b-48e1-c8a6b950c2ba	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-566e-cd6b-52bc-7dd1ea08da78	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-566e-cd6b-6ad4-51b107d3f53e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-566e-cd6b-6a43-2e06926e45e4	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-566e-cd6b-2ff5-14eca45a8b4c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566e-cd6b-3988-78eb7c050d6b	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-566e-cd6b-7d41-1f8b3d544bcd	arhivar	arhivar	t
00020000-566e-cd6d-02c7-40f1f26fd523	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-566e-cd6d-081f-44de977c1507	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-6d2b-642739667e6d	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-2ff9-429d175a21c8	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-4920-07b06fad3298	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-e9cf-3e7ac57657bb	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-dd20-999d5a3ce248	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-c00c-082555c6a198	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-09b7-00b29969492b	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-ea45-7db5ed18671f	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-9615-be09fef827ec	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-093e-f19fc9720b1b	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-d9f2-daa00e39f0e5	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-f07c-3f3386235184	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-1ff8-10867b1bd2c5	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-9646-f4722b0ca190	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-c4a5-df2f1f93d234	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-d060-ca960a374574	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-569b-ba005c952bdd	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-e215-f6ce02a3317e	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-566e-cd6d-62e5-f5abf52b18d1	Trr-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-620f-a291be49e4cb	Trr-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-9925-f7b11eb0d7e5	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-6ff8-5739a0a0bd2e	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-5917-ed3521737a3d	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-c91a-76582965643e	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-72e0-42d6289b52b5	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-6bcf-4f751df20b56	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-681f-c33d2708cab7	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-a16b-3ef850b84f6a	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-65f7-15b6a0213f39	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-9e50-a82774ddf851	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-a3b2-14644ec15652	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-c541-388bbaae903a	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-566e-cd6d-f2d8-de6ecf132059	Alternacija-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32131921)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-566e-cd6b-57fd-ebddb3e1fb14	00020000-566e-cd6b-589b-0b07aa23da3b
00010000-566e-cd6b-79dc-d5d42bbc46e9	00020000-566e-cd6b-589b-0b07aa23da3b
00010000-566e-cd6d-a82b-5cde9954a059	00020000-566e-cd6d-02c7-40f1f26fd523
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-081f-44de977c1507
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-e9cf-3e7ac57657bb
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-ea45-7db5ed18671f
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-093e-f19fc9720b1b
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-f07c-3f3386235184
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-569b-ba005c952bdd
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-2ff9-429d175a21c8
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-62e5-f5abf52b18d1
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-6ff8-5739a0a0bd2e
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-c91a-76582965643e
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-6bcf-4f751df20b56
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-a16b-3ef850b84f6a
00010000-566e-cd6d-f95e-05b22924a15c	00020000-566e-cd6d-c541-388bbaae903a
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-081f-44de977c1507
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-6d2b-642739667e6d
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-2ff9-429d175a21c8
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-4920-07b06fad3298
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-f07c-3f3386235184
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-c4a5-df2f1f93d234
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-62e5-f5abf52b18d1
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-6ff8-5739a0a0bd2e
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-c91a-76582965643e
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-6bcf-4f751df20b56
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-a16b-3ef850b84f6a
00010000-566e-cd6d-3533-c9ef8ed3caab	00020000-566e-cd6d-c541-388bbaae903a
00010000-566e-cd6d-ff87-0de2130c0f8a	00020000-566e-cd6d-081f-44de977c1507
00010000-566e-cd6d-ff87-0de2130c0f8a	00020000-566e-cd6d-6d2b-642739667e6d
00010000-566e-cd6d-ff87-0de2130c0f8a	00020000-566e-cd6d-2ff9-429d175a21c8
00010000-566e-cd6d-ff87-0de2130c0f8a	00020000-566e-cd6d-4920-07b06fad3298
00010000-566e-cd6d-ff87-0de2130c0f8a	00020000-566e-cd6d-093e-f19fc9720b1b
00010000-566e-cd6d-ff87-0de2130c0f8a	00020000-566e-cd6d-f07c-3f3386235184
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-6d2b-642739667e6d
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-dd20-999d5a3ce248
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-9615-be09fef827ec
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-d9f2-daa00e39f0e5
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-093e-f19fc9720b1b
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-d060-ca960a374574
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-f07c-3f3386235184
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-1ff8-10867b1bd2c5
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-62e5-f5abf52b18d1
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-620f-a291be49e4cb
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-6ff8-5739a0a0bd2e
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-5917-ed3521737a3d
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-c91a-76582965643e
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-72e0-42d6289b52b5
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-6bcf-4f751df20b56
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-681f-c33d2708cab7
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-a16b-3ef850b84f6a
00010000-566e-cd6d-47d2-a22b61c0b5ff	00020000-566e-cd6d-65f7-15b6a0213f39
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-6d2b-642739667e6d
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-dd20-999d5a3ce248
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-09b7-00b29969492b
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-9615-be09fef827ec
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-d9f2-daa00e39f0e5
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-093e-f19fc9720b1b
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-d060-ca960a374574
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-f07c-3f3386235184
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-1ff8-10867b1bd2c5
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-9646-f4722b0ca190
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-62e5-f5abf52b18d1
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-620f-a291be49e4cb
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-9925-f7b11eb0d7e5
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-6ff8-5739a0a0bd2e
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-5917-ed3521737a3d
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-c91a-76582965643e
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-72e0-42d6289b52b5
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-6bcf-4f751df20b56
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-681f-c33d2708cab7
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-a16b-3ef850b84f6a
00010000-566e-cd6d-69e8-1b1aede5de80	00020000-566e-cd6d-65f7-15b6a0213f39
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-6d2b-642739667e6d
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-2ff9-429d175a21c8
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-dd20-999d5a3ce248
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-c00c-082555c6a198
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-09b7-00b29969492b
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-e9cf-3e7ac57657bb
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-9615-be09fef827ec
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-d9f2-daa00e39f0e5
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-093e-f19fc9720b1b
00010000-566e-cd6d-b319-b8b3835fd527	00020000-566e-cd6d-d060-ca960a374574
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-081f-44de977c1507
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-4920-07b06fad3298
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-e9cf-3e7ac57657bb
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-ea45-7db5ed18671f
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-093e-f19fc9720b1b
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-f07c-3f3386235184
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-569b-ba005c952bdd
00010000-566e-cd6d-8a99-e0a43549b5ae	00020000-566e-cd6d-9e50-a82774ddf851
00010000-566e-cd6d-4601-8ec7a74a5f9c	00020000-566e-cd6d-e215-f6ce02a3317e
\.


--
-- TOC entry 3157 (class 0 OID 32132379)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32132317)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32132263)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-566e-cd6d-feeb-b1bd53027c53	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-566e-cd6d-e518-0f51da464657	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-566e-cd6d-3d1e-10390e7defe2	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32131886)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-566e-cd6a-08d5-7f61010b258a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-566e-cd6a-d29e-7e8f235390a1	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-566e-cd6a-cd85-b5fc06593e5b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-566e-cd6a-aa71-9bc0f22a1487	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-566e-cd6a-d90d-2d599ad8fafb	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32131878)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-566e-cd6a-46f8-22391ea87eda	00230000-566e-cd6a-aa71-9bc0f22a1487	popa
00240000-566e-cd6a-a00a-cd14739b4b82	00230000-566e-cd6a-aa71-9bc0f22a1487	oseba
00240000-566e-cd6a-f9fa-2c254a547473	00230000-566e-cd6a-aa71-9bc0f22a1487	tippopa
00240000-566e-cd6a-f1be-1267e900858f	00230000-566e-cd6a-aa71-9bc0f22a1487	organizacijskaenota
00240000-566e-cd6a-9525-9b951fac0b0d	00230000-566e-cd6a-aa71-9bc0f22a1487	sezona
00240000-566e-cd6a-55f4-5640cc42fd46	00230000-566e-cd6a-aa71-9bc0f22a1487	tipvaje
00240000-566e-cd6a-adb4-63a602ab64d5	00230000-566e-cd6a-d29e-7e8f235390a1	prostor
00240000-566e-cd6a-5c24-a2df7fbdfb78	00230000-566e-cd6a-aa71-9bc0f22a1487	besedilo
00240000-566e-cd6a-45ea-51eccb226b32	00230000-566e-cd6a-aa71-9bc0f22a1487	uprizoritev
00240000-566e-cd6a-bca5-4b2e87586c10	00230000-566e-cd6a-aa71-9bc0f22a1487	funkcija
00240000-566e-cd6a-e402-02bccc3e740a	00230000-566e-cd6a-aa71-9bc0f22a1487	tipfunkcije
00240000-566e-cd6a-cf78-9fe67d8d3186	00230000-566e-cd6a-aa71-9bc0f22a1487	alternacija
00240000-566e-cd6a-ed4a-771d17a193a2	00230000-566e-cd6a-08d5-7f61010b258a	pogodba
00240000-566e-cd6a-7583-8610b94b02f1	00230000-566e-cd6a-aa71-9bc0f22a1487	zaposlitev
00240000-566e-cd6a-7ac2-7278c6574a8a	00230000-566e-cd6a-aa71-9bc0f22a1487	zvrstuprizoritve
00240000-566e-cd6a-6683-14dda0c6b735	00230000-566e-cd6a-08d5-7f61010b258a	programdela
00240000-566e-cd6a-23dd-7fb80fd7be0f	00230000-566e-cd6a-aa71-9bc0f22a1487	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32131873)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
7a3e3d8f-6bc5-49f2-a186-9a3099f2c109	00240000-566e-cd6a-46f8-22391ea87eda	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32132445)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-566e-cd6e-d434-4193a3b8e65f	000e0000-566e-cd6d-680d-44a7f6e15c08	00080000-566e-cd6d-c8a4-fc699750f398	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-566e-cd6b-b3d8-47580b020a77
00270000-566e-cd6e-5526-3d427428a81f	000e0000-566e-cd6d-680d-44a7f6e15c08	00080000-566e-cd6d-c8a4-fc699750f398	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-566e-cd6b-b3d8-47580b020a77
\.


--
-- TOC entry 3122 (class 0 OID 32132021)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32132273)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-566e-cd6e-d918-f48db10bd0d7	00180000-566e-cd6e-dd8f-45dbdbb88dff	000c0000-566e-cd6e-97c5-05d5110a6400	00090000-566e-cd6d-1f50-0ccb5787e6bb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cd6e-ce2b-53a57e92b3e0	00180000-566e-cd6e-dd8f-45dbdbb88dff	000c0000-566e-cd6e-e954-6f47f7729af9	00090000-566e-cd6d-dda1-66d58958979a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cd6e-5827-29f0a032d7c5	00180000-566e-cd6e-dd8f-45dbdbb88dff	000c0000-566e-cd6e-5841-3e7a9b4f548c	00090000-566e-cd6d-93b8-a44ea2b9f370	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cd6e-ddf9-793d0140462e	00180000-566e-cd6e-dd8f-45dbdbb88dff	000c0000-566e-cd6e-ff17-738088dec308	00090000-566e-cd6d-250c-004cf026ce8d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cd6e-eb31-ca791fc96c17	00180000-566e-cd6e-dd8f-45dbdbb88dff	000c0000-566e-cd6e-6a38-840cbb23e0cb	00090000-566e-cd6d-873b-52f34f976aff	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-566e-cd6e-9608-734ea9fc1411	00180000-566e-cd6e-9dbd-575fa4deb098	\N	00090000-566e-cd6d-873b-52f34f976aff	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-566e-cd6e-a8da-3be4db988acb	00180000-566e-cd6e-9dbd-575fa4deb098	\N	00090000-566e-cd6d-dda1-66d58958979a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32132486)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-566e-cd6a-e8d7-88ffea9fbd72	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-566e-cd6a-ed26-50a8eea92419	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-566e-cd6a-568d-e670384f0393	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-566e-cd6a-5a9d-44cc5f3e6e6e	04	Režija	Režija	Režija	umetnik	30
000f0000-566e-cd6a-c158-9067a664c33e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-566e-cd6a-99ea-90655526c25a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-566e-cd6a-ff95-6dd8ef71056e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-566e-cd6a-6976-75f307a6e293	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-566e-cd6a-d52a-152c41620dcb	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-566e-cd6a-9795-3347c6ecb61f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-566e-cd6a-a2ec-5a7e4b6022d9	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-566e-cd6a-571e-d6c0f5bae08f	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-566e-cd6a-06bf-6bc0af8c3310	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-566e-cd6a-9a99-5d88da803c6a	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-566e-cd6a-ecf2-87f091dc17e5	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-566e-cd6a-13b8-01a6dc300de1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-566e-cd6a-8f54-372be7e8ca3e	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-566e-cd6a-333e-158b95a23324	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32131972)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-566e-cd6d-a2e9-104b530c7802	0001	šola	osnovna ali srednja šola
00400000-566e-cd6d-4ddc-937942f15fe4	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-566e-cd6d-41c4-e572d292c013	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32132791)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-566e-cd6a-64ad-7299715e2bd4	01	Velika predstava	f	1.00	1.00
002b0000-566e-cd6a-a013-aad426cca8ce	02	Mala predstava	f	0.50	0.50
002b0000-566e-cd6a-8590-2863f5e77e6d	03	Mala koprodukcija	t	0.40	1.00
002b0000-566e-cd6a-10a4-1cd81985cb53	04	Srednja koprodukcija	t	0.70	2.00
002b0000-566e-cd6a-1937-d4bd1eb22e90	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32132253)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-566e-cd6a-4509-2f2638e5b4b1	0001	prva vaja	prva vaja
00420000-566e-cd6a-0880-63e16c0a0501	0002	tehnična vaja	tehnična vaja
00420000-566e-cd6a-6280-f7cc5e9c5d52	0003	lučna vaja	lučna vaja
00420000-566e-cd6a-f29f-613308988464	0004	kostumska vaja	kostumska vaja
00420000-566e-cd6a-cce3-bfc482356692	0005	foto vaja	foto vaja
00420000-566e-cd6a-ee61-3a5644df35f7	0006	1. glavna vaja	1. glavna vaja
00420000-566e-cd6a-c043-3461cc156659	0007	2. glavna vaja	2. glavna vaja
00420000-566e-cd6a-0c5e-ce8bc310a6c8	0008	1. generalka	1. generalka
00420000-566e-cd6a-8653-8c92ce6122fa	0009	2. generalka	2. generalka
00420000-566e-cd6a-2ebe-2d5be08c62cb	0010	odprta generalka	odprta generalka
00420000-566e-cd6a-b8d8-b92ae700426a	0011	obnovitvena vaja	obnovitvena vaja
00420000-566e-cd6a-c648-97a7d154753d	0012	italijanka	krajša "obnovitvena" vaja
00420000-566e-cd6a-846c-7f7f04dba71b	0013	pevska vaja	pevska vaja
00420000-566e-cd6a-3413-4018b5aaf79b	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-566e-cd6a-e644-98e4493b4819	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32132094)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32131908)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-566e-cd6b-79dc-d5d42bbc46e9	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROR8M70tEiob6H8J6EvEcfiFCx57i8wK.	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-faf1-fdc9e4c444af	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-6205-31db645b471b	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-43b5-27574005c77f	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-02af-311dc7a95c78	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-89d1-a0dbd2603479	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-72e1-8323166f1611	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-5e99-54b682cf75d2	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-ecbe-dc093dae4868	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-07d9-c30cbae2d89a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-a82b-5cde9954a059	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-4e3d-0e6b8ef62f5d	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-f95e-05b22924a15c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-3533-c9ef8ed3caab	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-ff87-0de2130c0f8a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-47d2-a22b61c0b5ff	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-69e8-1b1aede5de80	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-b319-b8b3835fd527	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-8a99-e0a43549b5ae	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-566e-cd6d-4601-8ec7a74a5f9c	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-566e-cd6b-57fd-ebddb3e1fb14	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32132536)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-566e-cd6d-3b1a-523caedd0d4a	00160000-566e-cd6d-9cc9-0162dfb016f4	\N	00140000-566e-cd6a-905d-0a0ca8477eb2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-566e-cd6d-211f-d71ab63907bc
000e0000-566e-cd6d-680d-44a7f6e15c08	00160000-566e-cd6d-2038-284442653a63	\N	00140000-566e-cd6a-d0cc-8cca5f1c63be	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-566e-cd6d-cdfb-30023e774ac2
000e0000-566e-cd6d-38e2-cc084370df36	\N	\N	00140000-566e-cd6a-d0cc-8cca5f1c63be	00190000-566e-cd6d-f4af-1e8bf3720567	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566e-cd6d-211f-d71ab63907bc
000e0000-566e-cd6d-f0c3-243f1139881e	\N	\N	00140000-566e-cd6a-d0cc-8cca5f1c63be	00190000-566e-cd6d-f4af-1e8bf3720567	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-566e-cd6d-211f-d71ab63907bc
000e0000-566e-cd6d-5735-938de5311e7f	\N	\N	00140000-566e-cd6a-d0cc-8cca5f1c63be	00190000-566e-cd6d-f4af-1e8bf3720567	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-566e-cd6d-3fe4-0d8e601c7d11
000e0000-566e-cd6d-8436-82aed46de294	\N	\N	00140000-566e-cd6a-d0cc-8cca5f1c63be	00190000-566e-cd6d-f4af-1e8bf3720567	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-566e-cd6d-3fe4-0d8e601c7d11
\.


--
-- TOC entry 3136 (class 0 OID 32132193)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-566e-cd6d-ca40-6002c92e1227	\N	000e0000-566e-cd6d-680d-44a7f6e15c08	1	
00200000-566e-cd6d-6da8-40f5c71529d3	\N	000e0000-566e-cd6d-680d-44a7f6e15c08	2	
00200000-566e-cd6d-c15d-5bfad2367621	\N	000e0000-566e-cd6d-680d-44a7f6e15c08	3	
00200000-566e-cd6d-dc2c-d7f31a5d09ab	\N	000e0000-566e-cd6d-680d-44a7f6e15c08	4	
00200000-566e-cd6d-7654-e510c8616277	\N	000e0000-566e-cd6d-680d-44a7f6e15c08	5	
\.


--
-- TOC entry 3153 (class 0 OID 32132344)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32132459)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-566e-cd6b-8af2-592c11ebc8cd	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-566e-cd6b-c3ce-327f91a89130	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-566e-cd6b-0fb4-bed99f785aef	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-566e-cd6b-d9d0-144db1db28cc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-566e-cd6b-424d-e245877d1ff3	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-566e-cd6b-d39f-1b5a3b6bc90c	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-566e-cd6b-d769-7979c373ec33	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-566e-cd6b-493b-b9811fd8bb80	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-566e-cd6b-b3d8-47580b020a77	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-566e-cd6b-b047-c40b9fc91dbd	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-566e-cd6b-3d57-15686c656b1f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-566e-cd6b-4150-3d4d2f3a6c96	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-566e-cd6b-5f36-0ec5717e69ff	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-566e-cd6b-4cf5-e30b2dadae83	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-566e-cd6b-401c-51484958669d	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-566e-cd6b-b7bb-726886339327	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-566e-cd6b-270d-360c01910140	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-566e-cd6b-56c3-faea868a72a0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-566e-cd6b-6800-0c5783436d01	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-566e-cd6b-e96f-2e5eb6be5873	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-566e-cd6b-c7c5-df426883280e	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-566e-cd6b-c28d-3c6cfa0eaf38	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-566e-cd6b-1fcc-c54636ff0d44	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-566e-cd6b-e307-760ef069169b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-566e-cd6b-c3e4-e86998f80775	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-566e-cd6b-62da-03dc7fb2ab7c	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-566e-cd6b-9b9f-93091e4edd66	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-566e-cd6b-e145-04ffef439297	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32132841)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32132810)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32132853)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32132417)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-566e-cd6d-80a6-712a68f72057	00090000-566e-cd6d-dda1-66d58958979a	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cd6d-3540-4b846e22862b	00090000-566e-cd6d-93b8-a44ea2b9f370	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cd6d-3492-f5ce66f620b6	00090000-566e-cd6d-c263-1482a383ea8b	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cd6d-b6fa-377916e57522	00090000-566e-cd6d-16fa-35d88634a5a8	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cd6d-86dc-97184c464b4c	00090000-566e-cd6d-7c46-21f242082b2c	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-566e-cd6d-2567-7a9b454b0e73	00090000-566e-cd6d-41ae-30e912af1c48	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32132237)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32132526)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-566e-cd6a-905d-0a0ca8477eb2	01	Drama	drama (SURS 01)
00140000-566e-cd6a-41a7-e4e25426b187	02	Opera	opera (SURS 02)
00140000-566e-cd6a-8476-ae488ad6385e	03	Balet	balet (SURS 03)
00140000-566e-cd6a-f8d4-cef8b8fe0f5b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-566e-cd6a-9270-7a0518130082	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-566e-cd6a-d0cc-8cca5f1c63be	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-566e-cd6a-b29e-cef13a7bac91	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32132407)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32131971)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32132585)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32132575)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32131962)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32132442)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32132484)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32132894)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32132225)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32132247)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32132252)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32132808)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32132120)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32132654)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32132403)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32132191)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32132158)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32132134)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32132309)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32132871)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32132878)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32132902)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32129507)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32132336)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32132092)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32131990)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32132054)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32132017)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32131951)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32131936)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32132342)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32132378)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32132521)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32132045)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32132080)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32132759)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32132315)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32132070)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32132210)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32132179)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32132171)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32132327)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32132768)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32132776)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32132746)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32132789)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32132360)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32132300)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32132291)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32132508)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32132435)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32132146)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32131907)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32132369)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32131925)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32131945)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32132387)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32132322)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32132271)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32131895)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32131883)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32131877)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32132455)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32132026)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32132282)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32132495)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32131979)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32132801)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32132260)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32132105)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32131920)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32132554)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32132200)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32132350)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32132467)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32132851)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32132835)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32132859)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32132425)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32132241)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32132534)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32132415)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32132235)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32132236)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32132234)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32132233)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32132232)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32132456)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32132457)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32132458)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32132873)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32132872)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32132047)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32132048)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32132343)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32132839)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32132838)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32132840)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32132837)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32132836)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32132329)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32132328)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32132201)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32132202)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32132404)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32132406)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32132405)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32132136)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32132135)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32132790)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32132523)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32132524)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32132525)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32132860)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32132559)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32132556)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32132560)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32132558)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32132557)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32132107)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32132106)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32132020)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32132370)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32131952)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32131953)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32132390)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32132389)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32132388)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32132057)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32132056)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32132058)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32132174)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32132172)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32132173)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32131885)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32132295)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32132293)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32132292)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32132294)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32131926)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32131927)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32132351)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32132895)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32132444)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32132443)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32132903)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32132904)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32132316)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32132436)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32132437)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32132659)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32132658)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32132655)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32132656)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32132657)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32132072)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32132071)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32132073)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32132364)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32132363)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32132769)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32132770)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32132589)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32132590)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32132587)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32132588)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32132426)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32132427)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32132304)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32132303)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32132301)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32132302)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32132577)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32132576)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32132147)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32132161)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32132160)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32132159)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32132162)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32132192)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32132180)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32132181)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32132760)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32132809)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32132879)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32132880)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32131992)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32131991)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32132027)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32132028)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32132242)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32132285)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32132284)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32132283)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32132227)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32132228)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32132231)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32132226)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32132230)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32132229)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32132046)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32131980)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32131981)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32132121)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32132123)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32132122)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32132124)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32132310)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32132522)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32132555)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32132496)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32132497)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32132018)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32132019)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32132416)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32131896)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32132093)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32132055)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32131884)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32132802)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32132362)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32132361)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32132261)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32132262)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32132586)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32132081)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32132535)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32132852)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32132777)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32132778)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32132485)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32132272)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32131946)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 32133075)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 32133080)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 32133105)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 32133095)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 32133070)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 32133090)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 32133100)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 32133085)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 32133275)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32133280)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 32133285)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 32133450)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 32133445)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 32132960)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 32132965)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32133190)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 32133430)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32133425)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 32133435)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 32133420)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 32133415)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 32133185)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 32133180)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 32133060)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 32133065)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32133230)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32133240)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32133235)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 32133015)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 32133010)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32133170)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32133405)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 32133290)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32133295)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 32133300)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32133440)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 32133320)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 32133305)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 32133325)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32133315)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 32133310)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 32133005)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 32133000)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 32132945)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 32132940)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32133210)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 32132920)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 32132925)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 32133225)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32133220)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 32133215)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32132975)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 32132970)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 32132980)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 32133040)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 32133030)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32133035)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32132905)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 32133145)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 32133135)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 32133130)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 32133140)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 32132910)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 32132915)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32133195)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32133465)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 32133270)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 32133265)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 32133470)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 32133475)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32133175)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 32133255)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 32133260)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 32133380)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 32133375)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 32133360)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 32133365)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32133370)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32132990)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 32132985)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 32132995)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 32133205)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 32133200)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 32133390)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 32133395)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 32133350)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 32133355)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 32133340)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 32133345)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 32133245)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 32133250)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 32133165)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 32133160)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 32133150)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 32133155)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 32133335)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 32133330)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32133020)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32133025)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32133055)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 32133045)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 32133050)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32133385)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32133400)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32133410)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 32133455)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 32133460)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 32132935)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 32132930)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 32132950)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 32132955)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32133110)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 32133125)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32133120)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 32133115)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-14 15:08:49 CET

--
-- PostgreSQL database dump complete
--

