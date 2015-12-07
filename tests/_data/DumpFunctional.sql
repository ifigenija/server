--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-07 09:53:54 CET

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
-- TOC entry 183 (class 1259 OID 30912975)
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
-- TOC entry 237 (class 1259 OID 30913590)
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
-- TOC entry 236 (class 1259 OID 30913573)
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
-- TOC entry 182 (class 1259 OID 30912968)
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
-- TOC entry 181 (class 1259 OID 30912966)
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
-- TOC entry 227 (class 1259 OID 30913450)
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
-- TOC entry 230 (class 1259 OID 30913480)
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
-- TOC entry 251 (class 1259 OID 30913883)
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
-- TOC entry 203 (class 1259 OID 30913224)
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
-- TOC entry 205 (class 1259 OID 30913256)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30913261)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30913805)
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
-- TOC entry 194 (class 1259 OID 30913121)
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
-- TOC entry 238 (class 1259 OID 30913603)
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
-- TOC entry 223 (class 1259 OID 30913404)
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
-- TOC entry 200 (class 1259 OID 30913195)
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
-- TOC entry 197 (class 1259 OID 30913161)
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
-- TOC entry 195 (class 1259 OID 30913138)
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
-- TOC entry 212 (class 1259 OID 30913318)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30913863)
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
-- TOC entry 250 (class 1259 OID 30913876)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30913898)
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
-- TOC entry 216 (class 1259 OID 30913343)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30913095)
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
-- TOC entry 185 (class 1259 OID 30912994)
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
-- TOC entry 189 (class 1259 OID 30913062)
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
-- TOC entry 186 (class 1259 OID 30913006)
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
-- TOC entry 178 (class 1259 OID 30912940)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30912959)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30913350)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30913384)
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
-- TOC entry 233 (class 1259 OID 30913521)
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
-- TOC entry 188 (class 1259 OID 30913042)
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
-- TOC entry 191 (class 1259 OID 30913087)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30913749)
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
-- TOC entry 213 (class 1259 OID 30913324)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30913072)
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
-- TOC entry 202 (class 1259 OID 30913216)
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
-- TOC entry 198 (class 1259 OID 30913176)
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
-- TOC entry 199 (class 1259 OID 30913188)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30913336)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30913763)
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
-- TOC entry 242 (class 1259 OID 30913773)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30913672)
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
-- TOC entry 243 (class 1259 OID 30913781)
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
-- TOC entry 219 (class 1259 OID 30913365)
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
-- TOC entry 211 (class 1259 OID 30913309)
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
-- TOC entry 210 (class 1259 OID 30913299)
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
-- TOC entry 232 (class 1259 OID 30913510)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30913440)
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
-- TOC entry 196 (class 1259 OID 30913150)
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
-- TOC entry 175 (class 1259 OID 30912911)
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
-- TOC entry 174 (class 1259 OID 30912909)
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
-- TOC entry 220 (class 1259 OID 30913378)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30912949)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30912933)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30913392)
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
-- TOC entry 214 (class 1259 OID 30913330)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30913276)
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
-- TOC entry 173 (class 1259 OID 30912898)
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
-- TOC entry 172 (class 1259 OID 30912890)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30912885)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30913457)
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
-- TOC entry 187 (class 1259 OID 30913034)
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
-- TOC entry 209 (class 1259 OID 30913286)
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
-- TOC entry 231 (class 1259 OID 30913498)
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
-- TOC entry 184 (class 1259 OID 30912984)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30913793)
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
-- TOC entry 207 (class 1259 OID 30913266)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30913107)
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
-- TOC entry 176 (class 1259 OID 30912920)
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
-- TOC entry 235 (class 1259 OID 30913548)
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
-- TOC entry 201 (class 1259 OID 30913206)
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
-- TOC entry 218 (class 1259 OID 30913357)
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
-- TOC entry 229 (class 1259 OID 30913471)
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
-- TOC entry 247 (class 1259 OID 30913843)
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
-- TOC entry 246 (class 1259 OID 30913812)
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
-- TOC entry 248 (class 1259 OID 30913855)
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
-- TOC entry 225 (class 1259 OID 30913429)
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
-- TOC entry 204 (class 1259 OID 30913250)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30913538)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30913419)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30912971)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30912914)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3107 (class 0 OID 30912975)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5665-491e-cf51-219d4914193a	10	30	Otroci	Abonma za otroke	200
000a0000-5665-491e-b9d3-1cff343c9c38	20	60	Mladina	Abonma za mladino	400
000a0000-5665-491e-822f-6be2d816947c	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3161 (class 0 OID 30913590)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5665-491f-35b2-8b776ee6f2e5	000d0000-5665-491f-fba6-5cd883a4f6b7	\N	00090000-5665-491e-b9a0-2a29b96abab8	000b0000-5665-491e-e33a-8dd83ac2400b	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5665-491f-df1e-8e746ed3cf89	000d0000-5665-491f-cbe4-b19d032cb7a1	00100000-5665-491e-59eb-fe40b3deecfc	00090000-5665-491e-d85f-772fef0a3534	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5665-491f-2fbf-139ab644dc22	000d0000-5665-491f-f232-6f0e98cdb446	00100000-5665-491e-3c31-68a8ea86852b	00090000-5665-491e-ce79-eb0cb435494b	\N	0003	t	\N	2015-12-07	\N	2	t	\N	f	f
000c0000-5665-491f-3ce5-bb36e90a801e	000d0000-5665-491f-0009-0c3e86ba0786	\N	00090000-5665-491e-2e39-678258ca8b5f	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5665-491f-bfc2-1b35001f4729	000d0000-5665-491f-e3ec-9686cf145efb	\N	00090000-5665-491e-63f8-31a5fe03c00c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5665-491f-2e38-51d87bd0fa45	000d0000-5665-491f-d432-38a30f5ff554	\N	00090000-5665-491e-1c90-963d8d09a58f	000b0000-5665-491e-f71a-7d30c0af2d9d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5665-491f-1c63-94905a739e4d	000d0000-5665-491f-e5e0-e88a800eb1a3	00100000-5665-491e-ec7f-ed72e1c3a9d8	00090000-5665-491e-dae2-0042cb3292cd	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5665-491f-557a-321b95d50915	000d0000-5665-491f-ca28-3266e5e9dd10	\N	00090000-5665-491e-6bb9-aace5287ed93	000b0000-5665-491e-3b80-629f71722304	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5665-491f-3afa-71b5ac787559	000d0000-5665-491f-e5e0-e88a800eb1a3	00100000-5665-491e-54b6-7814f5371d5d	00090000-5665-491e-6d79-168cbcf185fc	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5665-491f-6830-7de07278fc2a	000d0000-5665-491f-e5e0-e88a800eb1a3	00100000-5665-491e-8d6f-80be583aa8f2	00090000-5665-491e-a3d8-3ad87a86002e	\N	0010	t	\N	2015-12-07	\N	16	f	\N	f	t
000c0000-5665-491f-f5ad-b385a9125f4c	000d0000-5665-491f-e5e0-e88a800eb1a3	00100000-5665-491e-f86b-2304b931b89f	00090000-5665-491e-9419-36fb83f79a72	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5665-491f-8dbf-21b3b819708b	000d0000-5665-491f-9952-3ed54589bd56	00100000-5665-491e-59eb-fe40b3deecfc	00090000-5665-491e-d85f-772fef0a3534	000b0000-5665-491e-9b98-49520558ea98	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3160 (class 0 OID 30913573)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3106 (class 0 OID 30912968)
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
-- TOC entry 3151 (class 0 OID 30913450)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5665-491e-b60c-7221589b42d5	00160000-5665-491e-f08d-c07d223de7e4	00090000-5665-491e-8888-d98f82fe5e45	aizv	10	t
003d0000-5665-491e-4bf5-aebe9b9e4ec7	00160000-5665-491e-f08d-c07d223de7e4	00090000-5665-491e-8727-f3536387ed31	apri	14	t
003d0000-5665-491e-3639-377770c7d3ad	00160000-5665-491e-cc4b-825c1a9e71c0	00090000-5665-491e-f062-34e221510464	aizv	11	t
003d0000-5665-491e-e743-f6d5dd46dd97	00160000-5665-491e-c531-a0153ebd1151	00090000-5665-491e-33d0-950c7a159145	aizv	12	t
003d0000-5665-491e-9b91-9fd4334a2266	00160000-5665-491e-f08d-c07d223de7e4	00090000-5665-491e-de71-02af47dc00c7	apri	18	f
\.


--
-- TOC entry 3154 (class 0 OID 30913480)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5665-491e-f08d-c07d223de7e4	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5665-491e-cc4b-825c1a9e71c0	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5665-491e-c531-a0153ebd1151	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3175 (class 0 OID 30913883)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 30913224)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5665-491f-a9c3-c97d4d7c8def	\N	\N	00200000-5665-491f-0e2a-54f8b352c6f1	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5665-491f-6d00-10f11ad89a53	\N	\N	00200000-5665-491f-068a-23105589b26e	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5665-491f-e58c-713f305d8694	\N	\N	00200000-5665-491f-2809-9eb009241af8	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5665-491f-8ca5-2843d92db125	\N	\N	00200000-5665-491f-fff3-5171af3c2c49	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5665-491f-9e12-6cc03465d4cd	\N	\N	00200000-5665-491f-c73b-bd913b9c49c8	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3129 (class 0 OID 30913256)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30913261)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 30913805)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30913121)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5665-491c-e749-e5d4daf657b0	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5665-491c-f3ca-0fa30e911968	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5665-491c-1a9b-04479ee2d354	AL	ALB	008	Albania 	Albanija	\N
00040000-5665-491c-729b-0e87fee3997c	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5665-491c-018f-42e6fe837521	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5665-491c-d490-9a0d6ec24ea7	AD	AND	020	Andorra 	Andora	\N
00040000-5665-491c-b76a-bc08d0c63d6b	AO	AGO	024	Angola 	Angola	\N
00040000-5665-491c-0ab1-0e3d5bba5940	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5665-491c-2a2e-3333dfa00320	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5665-491c-f4cc-8f6eb26e7266	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5665-491c-adbd-baaf43220651	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5665-491c-3fe8-5dd87199a12f	AM	ARM	051	Armenia 	Armenija	\N
00040000-5665-491c-1453-95b476cb64ac	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5665-491c-5c9d-46fb5fac8f84	AU	AUS	036	Australia 	Avstralija	\N
00040000-5665-491c-ae1b-a56f249a8ea8	AT	AUT	040	Austria 	Avstrija	\N
00040000-5665-491c-2d5d-c70d62d95604	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5665-491c-599c-7599e0bd1e2b	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5665-491c-293e-7900d269d383	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5665-491c-3852-ab1b91724921	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5665-491c-c509-e3ab316d8f33	BB	BRB	052	Barbados 	Barbados	\N
00040000-5665-491c-bb3f-18ac23399746	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5665-491c-2dcf-401f2ca21610	BE	BEL	056	Belgium 	Belgija	\N
00040000-5665-491c-db5a-73d2c8a4ca62	BZ	BLZ	084	Belize 	Belize	\N
00040000-5665-491c-b505-6bea95e3237a	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5665-491c-715a-e27c2b62fc27	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5665-491c-71a6-947183975d7e	BT	BTN	064	Bhutan 	Butan	\N
00040000-5665-491c-f725-3e9942a85e27	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5665-491c-6e7e-6ac416a683a6	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5665-491c-fa06-75b7bb22b083	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5665-491c-da82-759d09f836e8	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5665-491c-ae5f-c58ed9f50b96	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5665-491c-2975-38ccf43aa36c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5665-491c-dff5-879773865b9d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5665-491c-4753-02918f479b2e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5665-491c-ca7d-a65e5e095c02	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5665-491c-a3bd-393f5c26bf53	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5665-491c-2e46-caf9d2b7932b	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5665-491c-a77e-9d7b5111c728	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5665-491c-d261-d6dbf82db639	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5665-491c-c9bc-458397719e31	CA	CAN	124	Canada 	Kanada	\N
00040000-5665-491c-45b3-81b483ba2280	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5665-491c-394e-30ffd145ad97	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5665-491c-941c-f82c95c5b493	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5665-491c-532a-7b230462eef1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5665-491c-9ed2-b82325f72671	CL	CHL	152	Chile 	Čile	\N
00040000-5665-491c-05b7-12eff460cf48	CN	CHN	156	China 	Kitajska	\N
00040000-5665-491c-65a9-983ba28adcb3	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5665-491c-9d21-9a850b8ad255	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5665-491c-2c39-41abef8a2846	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5665-491c-2b29-b335fc0241c7	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5665-491c-19dc-8ef8e72da0e5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5665-491c-1e36-9de644741ba6	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5665-491c-d110-df0e5e2cdb4e	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5665-491c-e519-46e0bb233180	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5665-491c-23bf-6b08f1edd4b5	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5665-491c-f87f-a125fac826bc	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5665-491c-a22f-2e5b0f848a67	CU	CUB	192	Cuba 	Kuba	\N
00040000-5665-491c-1589-067c5d97f6a0	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5665-491c-7ac8-4e3dcaf0c043	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5665-491c-7603-5d3e8005d5a4	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5665-491c-cb9f-ebb4030d7830	DK	DNK	208	Denmark 	Danska	\N
00040000-5665-491c-c545-935882bc98b8	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5665-491c-e0e0-81017c4f5436	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5665-491c-9f59-9a673edac0dd	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5665-491c-1006-bf43ec1465eb	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5665-491c-e5b8-3da67360bada	EG	EGY	818	Egypt 	Egipt	\N
00040000-5665-491c-c631-ffb2e28ad7a9	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5665-491c-fbed-56a0160c22d0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5665-491c-85fd-9a6b7e20c4ae	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5665-491c-5db8-f456329649dc	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5665-491c-26d3-1b88cea41067	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5665-491c-927c-ad54ee6c2879	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5665-491c-3577-6eb3f892b437	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5665-491c-f88b-726e1c57f208	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5665-491c-894d-271fe7180f9f	FI	FIN	246	Finland 	Finska	\N
00040000-5665-491c-74d0-dc681596f35e	FR	FRA	250	France 	Francija	\N
00040000-5665-491c-ea0b-dd066b36f42f	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5665-491c-51de-f26eb6f37b59	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5665-491c-e51d-723c224c05f5	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5665-491c-56e3-764af3f8e5d1	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5665-491c-7024-65bcb76effcb	GA	GAB	266	Gabon 	Gabon	\N
00040000-5665-491c-6be4-601ecd9c7355	GM	GMB	270	Gambia 	Gambija	\N
00040000-5665-491c-55d1-1ae1ed91524b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5665-491c-34a4-60f69b6b08cb	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5665-491c-95cf-2e2aef8dcd5f	GH	GHA	288	Ghana 	Gana	\N
00040000-5665-491c-6898-8a560f872214	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5665-491c-5678-08bf6cee6904	GR	GRC	300	Greece 	Grčija	\N
00040000-5665-491c-fc1c-410aa9242707	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5665-491c-0db3-76dc15fad401	GD	GRD	308	Grenada 	Grenada	\N
00040000-5665-491c-be47-a66a109723ea	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5665-491c-6d1b-d283701b0251	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5665-491c-7efd-9f252888ec01	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5665-491c-f92f-e11775b8e5cf	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5665-491c-7c49-5d7e7b13d1ea	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5665-491c-0646-0a1f6a127841	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5665-491c-e829-3d201886e7c3	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5665-491c-508a-6fef6db41fa5	HT	HTI	332	Haiti 	Haiti	\N
00040000-5665-491c-d6ef-6275b0320d35	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5665-491c-dc3a-badb83225368	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5665-491c-f2e4-5ff1d3bc2123	HN	HND	340	Honduras 	Honduras	\N
00040000-5665-491c-e8c3-bfe19cdbb1a6	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5665-491c-9d78-6c9744066c32	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5665-491c-30ac-ef2e25a6eeb7	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5665-491c-e171-4846f219b653	IN	IND	356	India 	Indija	\N
00040000-5665-491c-0ad2-2853f378592d	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5665-491c-1f36-521cf4c9208d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5665-491c-2f69-198931a25661	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5665-491c-8b2d-db04a24eb5b6	IE	IRL	372	Ireland 	Irska	\N
00040000-5665-491c-36f7-c6daf52339c6	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5665-491c-cf27-4d3efa5e79c7	IL	ISR	376	Israel 	Izrael	\N
00040000-5665-491c-bcca-580daaa8222e	IT	ITA	380	Italy 	Italija	\N
00040000-5665-491c-0c56-d8a89c6969d3	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5665-491c-e3e5-97808a8fbc45	JP	JPN	392	Japan 	Japonska	\N
00040000-5665-491c-76ef-1ea1c5054856	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5665-491c-93e8-cf65933c3902	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5665-491c-0f40-29938c5a5bcf	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5665-491c-6fdf-e28bce84d4d0	KE	KEN	404	Kenya 	Kenija	\N
00040000-5665-491c-d409-ee51c840c5e7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5665-491c-2a36-09f4153eb0d7	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5665-491c-769c-f4a32c16d86c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5665-491c-64ef-e0b61e211a9f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5665-491c-5c98-2d6ee315ee71	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5665-491c-1f02-7e260c967fbf	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5665-491c-4b40-9b93acfc28bd	LV	LVA	428	Latvia 	Latvija	\N
00040000-5665-491c-c0eb-62b5979a41ae	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5665-491c-7f23-d11066bf59ed	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5665-491c-36bb-f4eede6307bd	LR	LBR	430	Liberia 	Liberija	\N
00040000-5665-491c-a5c2-693baee67946	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5665-491c-97be-657a450b1801	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5665-491c-2436-08c27267659f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5665-491c-b0a9-a345a971a8fb	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5665-491c-12a4-b2551bd06183	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5665-491c-f57d-48f97bd87529	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5665-491c-1e6a-fab439a0f6c9	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5665-491c-e5e8-2dd5c78c3758	MW	MWI	454	Malawi 	Malavi	\N
00040000-5665-491c-41a7-4ebf69c4cfbd	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5665-491c-c8f5-c908317b5ae3	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5665-491c-b17a-c06a52789683	ML	MLI	466	Mali 	Mali	\N
00040000-5665-491c-8dcb-37a5ac517f21	MT	MLT	470	Malta 	Malta	\N
00040000-5665-491c-da77-0dd3746b8b84	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5665-491c-6f85-9bab892b5072	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5665-491c-903a-c678ee243b4c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5665-491c-54bf-9a86258e516e	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5665-491c-a772-2d7369571012	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5665-491c-4517-31ec8640bce7	MX	MEX	484	Mexico 	Mehika	\N
00040000-5665-491c-2998-8026d4357064	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5665-491c-eebf-79a4efc90176	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5665-491c-f8e6-5a11ecae765c	MC	MCO	492	Monaco 	Monako	\N
00040000-5665-491c-e17a-bceed706ce63	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5665-491c-99dc-607e253293e5	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5665-491c-790e-742d2960f863	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5665-491c-5dac-dcaf2fbcb86f	MA	MAR	504	Morocco 	Maroko	\N
00040000-5665-491c-eca9-08f190ed743f	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5665-491c-c752-ef11bfde5782	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5665-491c-3a97-00012810da1a	NA	NAM	516	Namibia 	Namibija	\N
00040000-5665-491c-afff-5d35261fca5c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5665-491c-4c6a-cb89f928b370	NP	NPL	524	Nepal 	Nepal	\N
00040000-5665-491c-c30e-25b90d416ec3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5665-491c-c937-6179adc039ef	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5665-491c-d7c9-c6f5b877678e	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5665-491c-4a68-099aa36a6e5c	NE	NER	562	Niger 	Niger 	\N
00040000-5665-491c-cefa-27d130966084	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5665-491c-e030-b24111a65a1a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5665-491c-bdb9-d12c6b7fc8ce	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5665-491c-a3df-d0ec79629a4e	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5665-491c-af4f-97b6343db5a1	NO	NOR	578	Norway 	Norveška	\N
00040000-5665-491c-d49f-0370cd0e6928	OM	OMN	512	Oman 	Oman	\N
00040000-5665-491c-5535-cfe5a526eec1	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5665-491c-36e0-d49ffa287c2f	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5665-491c-c41c-6026ccd4fca5	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5665-491c-88d3-af946da8f589	PA	PAN	591	Panama 	Panama	\N
00040000-5665-491c-e608-f89d05825505	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5665-491c-7933-f323981150e0	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5665-491c-4323-045c30bc4c15	PE	PER	604	Peru 	Peru	\N
00040000-5665-491c-f2de-8268ab7a94b9	PH	PHL	608	Philippines 	Filipini	\N
00040000-5665-491c-3b3a-a0c8519e1cc2	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5665-491c-65d8-12f477da04a9	PL	POL	616	Poland 	Poljska	\N
00040000-5665-491c-be5d-5f2082a8c150	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5665-491c-ca5b-e653f4da8f56	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5665-491c-da5f-b5308b998043	QA	QAT	634	Qatar 	Katar	\N
00040000-5665-491c-13bb-ee618f823ef5	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5665-491c-88ae-9786903fc693	RO	ROU	642	Romania 	Romunija	\N
00040000-5665-491c-bc87-c3dd7b972c75	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5665-491c-ab3e-dbc46f77cb63	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5665-491c-a755-585c671357ea	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5665-491c-b382-908911a3d84d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5665-491c-b296-32b8c4362818	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5665-491c-1032-206eaaa07615	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5665-491c-07e1-dfe8aac11ab2	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5665-491c-09c3-9f8bba3938b3	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5665-491c-482b-76958fbc9df9	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5665-491c-841a-74e6df85f3f3	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5665-491c-2f92-d8d8c418503f	SM	SMR	674	San Marino 	San Marino	\N
00040000-5665-491c-a08a-a636a46fe40f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5665-491c-7f60-0d2fb12393e5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5665-491c-5f49-a7f12ad9b60d	SN	SEN	686	Senegal 	Senegal	\N
00040000-5665-491c-853d-c7d87d4008b2	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5665-491c-e90d-89db3592da99	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5665-491c-8c7f-3932e7da27ae	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5665-491c-f67a-f2148f17dbcd	SG	SGP	702	Singapore 	Singapur	\N
00040000-5665-491c-82c9-8c86d22e20f5	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5665-491c-be3b-cb41adf6723e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5665-491c-3911-ffb35619fd27	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5665-491c-a506-7f77a4265de4	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5665-491c-6e2e-2221b9e69ba2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5665-491c-e493-ec95f0a7d304	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5665-491c-ce46-6b0001bac388	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5665-491c-2700-a5968793e455	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5665-491c-2b3d-ff24a0c66dde	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5665-491c-82fd-5656e6c9bf6a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5665-491c-cc37-a651f909615a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5665-491c-6059-b5bae9db1982	SR	SUR	740	Suriname 	Surinam	\N
00040000-5665-491c-acee-3551dec8521d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5665-491c-b69c-8aeaa1812505	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5665-491c-1a2a-ea4c74178cce	SE	SWE	752	Sweden 	Švedska	\N
00040000-5665-491c-5fa2-7b0b0c8172bd	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5665-491c-c270-da59829ad9d4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5665-491c-7192-f68c91a086b2	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5665-491c-f8e1-c587d4708a2e	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5665-491c-e3b3-855fbf73b62f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5665-491c-f1a2-f10e5406aa35	TH	THA	764	Thailand 	Tajska	\N
00040000-5665-491c-1cb8-1e1ee78fa18f	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5665-491c-bc94-b4bf1887d792	TG	TGO	768	Togo 	Togo	\N
00040000-5665-491c-5b20-a843e878c307	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5665-491c-24c8-d5fe8d9fd309	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5665-491c-e263-b20c43a23d20	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5665-491c-e82a-3f832a2ea4ff	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5665-491c-2cb7-df7dcf871c58	TR	TUR	792	Turkey 	Turčija	\N
00040000-5665-491c-8556-c0e26008d516	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5665-491c-69ee-0e6a592a6b77	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5665-491c-bc0d-9d29cdb250eb	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5665-491c-9c0c-d62e28b35ffd	UG	UGA	800	Uganda 	Uganda	\N
00040000-5665-491c-ff0b-8b8943ee4cfb	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5665-491c-0042-d0ff2cf4d074	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5665-491c-711a-662cfd0f654f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5665-491c-dc3c-e3e7c33d4366	US	USA	840	United States 	Združene države Amerike	\N
00040000-5665-491c-690e-9b0675887e84	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5665-491c-9241-a3288d183be1	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5665-491c-c6e7-127694eb3b20	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5665-491c-8702-7385b7cb1024	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5665-491c-94e1-8f04c2f766d1	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5665-491c-2f28-f510548f31c2	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5665-491c-9cf1-ee52ea843e00	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5665-491c-c83a-37f6795cc348	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5665-491c-7656-e64c0ecf7811	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5665-491c-6011-fd3ce57199a1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5665-491c-0409-d87a27ca3741	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5665-491c-cc04-ed75f0df4122	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5665-491c-3b1f-e6b8e77319b9	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3162 (class 0 OID 30913603)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5665-491f-20c1-d922a20147dc	000e0000-5665-491f-a1c8-a27f294f8283	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-491c-6a02-b38cef83d265	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5665-491f-21cd-a00d7a5e8878	000e0000-5665-491f-778b-f566463c3b44	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-491c-dd21-77eb6e365f8e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5665-491f-5cda-069df9559805	000e0000-5665-491f-f902-41e6c288b97e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5665-491c-6a02-b38cef83d265	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5665-491f-422f-ba2981af2038	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5665-491f-d2dd-61d6d7d59a72	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3147 (class 0 OID 30913404)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5665-491f-e5e0-e88a800eb1a3	000e0000-5665-491f-778b-f566463c3b44	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5665-491c-aabe-0029297d6b58
000d0000-5665-491f-fba6-5cd883a4f6b7	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-35b2-8b776ee6f2e5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5665-491c-aabe-0029297d6b58
000d0000-5665-491f-cbe4-b19d032cb7a1	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-df1e-8e746ed3cf89	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5665-491c-2c9c-5d8cefa46d4f
000d0000-5665-491f-f232-6f0e98cdb446	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-2fbf-139ab644dc22	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5665-491c-f02c-0b30a5c1305a
000d0000-5665-491f-0009-0c3e86ba0786	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-3ce5-bb36e90a801e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5665-491c-05e1-49a735262b63
000d0000-5665-491f-e3ec-9686cf145efb	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-bfc2-1b35001f4729	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5665-491c-05e1-49a735262b63
000d0000-5665-491f-d432-38a30f5ff554	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-2e38-51d87bd0fa45	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5665-491c-aabe-0029297d6b58
000d0000-5665-491f-ca28-3266e5e9dd10	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-557a-321b95d50915	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5665-491c-ce82-270e9dca7476
000d0000-5665-491f-9952-3ed54589bd56	000e0000-5665-491f-778b-f566463c3b44	000c0000-5665-491f-8dbf-21b3b819708b	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5665-491c-bc5f-21efc4bc124e
\.


--
-- TOC entry 3124 (class 0 OID 30913195)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30913161)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30913138)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5665-491e-e254-fde3658be140	00080000-5665-491e-f6f8-065c5fbb5ec8	00090000-5665-491e-a3d8-3ad87a86002e	AK		igralka
\.


--
-- TOC entry 3136 (class 0 OID 30913318)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 30913863)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5665-491e-1a0e-f68a550d195b	00010000-5665-491c-bbb2-36557471b71a	\N	Prva mapa	Root mapa	2015-12-07 09:53:50	2015-12-07 09:53:50	R	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 30913876)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 30913898)
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
-- TOC entry 3140 (class 0 OID 30913343)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30913095)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5665-491c-8cac-ee7a238d5786	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5665-491c-e638-d977b2523f9e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5665-491c-ad56-10a9acd597d8	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5665-491c-34a2-08e1ecddb1ec	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5665-491c-1fa4-fe88f0628eb4	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5665-491c-bfe1-7fcdc400c20e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5665-491c-22c4-f70e05bed435	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5665-491c-df8b-57a36ed98f2f	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5665-491c-4c3e-72b9c341614e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5665-491c-f72c-dbe10db00072	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5665-491c-12e4-372e78be0a7c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5665-491c-bbec-bf10d1a135b1	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5665-491c-bb21-07f2befac333	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5665-491c-5d62-365fc29800ff	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5665-491e-c0bd-ea5570c046db	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5665-491e-4ba5-8326f779032f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5665-491e-7d5b-13eab8d58e7d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5665-491e-69bc-20b1cb58fd38	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5665-491e-75e6-b992b08cc12a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5665-4920-61cf-bfa1e050c0e0	application.tenant.maticnopodjetje	string	s:36:"00080000-5665-4920-e963-b6f613e22128";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3109 (class 0 OID 30912994)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5665-491e-4562-c5cfd7b3ab3e	00000000-5665-491e-c0bd-ea5570c046db	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5665-491e-d6e5-ba9a4c684c13	00000000-5665-491e-c0bd-ea5570c046db	00010000-5665-491c-bbb2-36557471b71a	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5665-491e-7477-0f621d92de08	00000000-5665-491e-4ba5-8326f779032f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3113 (class 0 OID 30913062)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5665-491e-4247-ddaa634bbd93	\N	00100000-5665-491e-59eb-fe40b3deecfc	00100000-5665-491e-3c31-68a8ea86852b	01	Gledališče Nimbis
00410000-5665-491e-040c-65f60158dd20	00410000-5665-491e-4247-ddaa634bbd93	00100000-5665-491e-59eb-fe40b3deecfc	00100000-5665-491e-3c31-68a8ea86852b	02	Tehnika
\.


--
-- TOC entry 3110 (class 0 OID 30913006)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5665-491e-b9a0-2a29b96abab8	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5665-491e-2e39-678258ca8b5f	00010000-5665-491e-1303-be327c5c6155	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5665-491e-ce79-eb0cb435494b	00010000-5665-491e-79fa-25370c7eead6	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5665-491e-6d79-168cbcf185fc	00010000-5665-491e-1f67-019d6dc08911	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5665-491e-ace2-a8ca9bd507a5	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5665-491e-1c90-963d8d09a58f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5665-491e-9419-36fb83f79a72	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5665-491e-dae2-0042cb3292cd	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5665-491e-a3d8-3ad87a86002e	00010000-5665-491e-e34d-828f6bc77fae	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5665-491e-d85f-772fef0a3534	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5665-491e-a3b7-131adbe2b39f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5665-491e-63f8-31a5fe03c00c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5665-491e-6bb9-aace5287ed93	00010000-5665-491e-cb13-458f42b0c5c5	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5665-491e-8888-d98f82fe5e45	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-491e-8727-f3536387ed31	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-491e-f062-34e221510464	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-491e-33d0-950c7a159145	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5665-491e-de71-02af47dc00c7	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5665-491e-7a55-cb1b8367283e	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-491e-f8ce-3852d0866d70	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5665-491e-8113-d0c035ae59c1	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3102 (class 0 OID 30912940)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5665-491c-1992-18bf019633d8	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5665-491c-802e-bd03f9dc8fb8	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5665-491c-6122-20cd57093f2a	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5665-491c-5dc2-b94752c2b8f4	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5665-491c-3228-de855e3f2e3b	Oseba-vse	Oseba - spreminjanje osebnih podatkov	t
00030000-5665-491c-d627-c4ff137feae1	Oseba-readVse	Oseba - branje tudi osebnih podatkov	t
00030000-5665-491c-c9c7-ed1de9cd87c7	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5665-491c-6b32-062680dc98bb	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5665-491c-b508-306e7419c4cc	Abonma-read	Abonma - branje	t
00030000-5665-491c-d7c2-310fbdbc2fba	Abonma-write	Abonma - spreminjanje	t
00030000-5665-491c-15d8-38f57f8e53ac	Alternacija-read	Alternacija - branje	t
00030000-5665-491c-6253-3e37f0b73079	Alternacija-write	Alternacija - spreminjanje	t
00030000-5665-491c-e3b5-683d9f1c7c5a	Arhivalija-read	Arhivalija - branje	t
00030000-5665-491c-0cff-d73b79194190	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5665-491c-e341-c32846d4dd67	AuthStorage-read	AuthStorage - branje	t
00030000-5665-491c-2af0-de625f799af8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5665-491c-782a-7cf58354a101	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5665-491c-bdd3-d3b11144d71f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5665-491c-62c2-314472a9390f	Besedilo-read	Besedilo - branje	t
00030000-5665-491c-437a-3fbdb26c8a34	Besedilo-write	Besedilo - spreminjanje	t
00030000-5665-491c-6df8-96e62131a64a	Dogodek-read	Dogodek - branje	t
00030000-5665-491c-6055-eb2e4f017b9a	Dogodek-write	Dogodek - spreminjanje	t
00030000-5665-491c-7e67-70b6a06990d3	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5665-491c-0abc-9bf22adcee6d	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5665-491c-f72f-2159148e8290	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5665-491c-24d6-d174d85e620f	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5665-491c-4a77-08b1f3516632	DogodekTrait-read	DogodekTrait - branje	t
00030000-5665-491c-5049-c06eb15fec9b	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5665-491c-815b-7d78ea5b56f8	DrugiVir-read	DrugiVir - branje	t
00030000-5665-491c-6a9e-4dc0b643c7f5	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5665-491c-3c90-3b6457c07b0d	Drzava-read	Drzava - branje	t
00030000-5665-491c-ffe8-7f9178ae4ca4	Drzava-write	Drzava - spreminjanje	t
00030000-5665-491c-12c8-0614a42d9d68	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5665-491c-b536-46a57215398a	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5665-491c-c771-1035725992a6	Funkcija-read	Funkcija - branje	t
00030000-5665-491c-4631-3a104db47189	Funkcija-write	Funkcija - spreminjanje	t
00030000-5665-491c-b83a-9a2fdde4a8c0	Gostovanje-read	Gostovanje - branje	t
00030000-5665-491c-a619-5c28f0acbb2f	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5665-491c-eb86-59ce59034436	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5665-491c-35be-6a3d74d5870f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5665-491c-ca69-d7d7241e990c	Kupec-read	Kupec - branje	t
00030000-5665-491c-52bb-36fe33803e4c	Kupec-write	Kupec - spreminjanje	t
00030000-5665-491c-8dca-ce226722a47d	NacinPlacina-read	NacinPlacina - branje	t
00030000-5665-491c-3ef2-4bdfff82d01b	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5665-491c-92ca-f6de7ed4ed40	Option-read	Option - branje	t
00030000-5665-491c-a004-390def15d12e	Option-write	Option - spreminjanje	t
00030000-5665-491c-cc0b-a7b76585867e	OptionValue-read	OptionValue - branje	t
00030000-5665-491c-b726-a0b02eb037cb	OptionValue-write	OptionValue - spreminjanje	t
00030000-5665-491c-0cf3-ed42e3e26eff	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5665-491c-cfcb-9c7cef938006	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5665-491c-596e-55bd9c93d244	Oseba-read	Oseba - branje	t
00030000-5665-491c-ca73-1150f27e5ab8	Oseba-write	Oseba - spreminjanje	t
00030000-5665-491c-e425-88e98c5a65ad	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5665-491c-395a-0aef247c18bb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5665-491c-6ed2-3c5d9e9228af	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5665-491c-cc8a-44b80e399509	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5665-491c-ef49-d0303678a0b7	Pogodba-read	Pogodba - branje	t
00030000-5665-491c-1460-d69c9d01a2ca	Pogodba-write	Pogodba - spreminjanje	t
00030000-5665-491c-6b0f-03b6b3e70aea	Popa-read	Popa - branje	t
00030000-5665-491c-f627-0412d34622d7	Popa-write	Popa - spreminjanje	t
00030000-5665-491c-0dc1-d04be2cdcaff	Posta-read	Posta - branje	t
00030000-5665-491c-ede7-d24bb4c145ea	Posta-write	Posta - spreminjanje	t
00030000-5665-491c-fbbe-206a98f6f326	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5665-491c-46b0-d29f0e5dbf59	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5665-491c-e708-578ff3ce66e6	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5665-491c-1cb6-268f2e960358	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5665-491c-1207-cdca65440eef	PostniNaslov-read	PostniNaslov - branje	t
00030000-5665-491c-32e8-906399fa3373	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5665-491c-ccc2-e8ddfd9b71b3	Praznik-read	Praznik - branje	t
00030000-5665-491c-a512-6b9a63db44e7	Praznik-write	Praznik - spreminjanje	t
00030000-5665-491c-4e8d-6775cf42b11b	Predstava-read	Predstava - branje	t
00030000-5665-491c-3384-9408502d2734	Predstava-write	Predstava - spreminjanje	t
00030000-5665-491c-be25-a3399d8f5e47	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5665-491c-9846-98266d33aa40	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5665-491c-940f-18c76ad67172	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5665-491c-ae65-6962452d078f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5665-491c-22d6-a3ca367f0e8b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5665-491c-8117-8661a8fd569c	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5665-491c-595f-984a82f66a9e	ProgramDela-read	ProgramDela - branje	t
00030000-5665-491c-70d2-486af7709524	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5665-491c-b219-89c2b2bf0ff6	ProgramFestival-read	ProgramFestival - branje	t
00030000-5665-491c-3d53-52bf1ac167f5	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5665-491c-1500-44210339ff08	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5665-491c-6490-b2e3c45556f1	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5665-491c-3716-10fc8fa9b9ce	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5665-491c-f3f9-0594222e0a3b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5665-491c-9646-02c66d02ebb2	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5665-491c-5b04-47853498296f	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5665-491c-e505-747b45f795ae	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5665-491c-c3ee-b3b3e4ca6568	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5665-491c-1e88-0d245383ace5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5665-491c-0835-098678cedb24	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5665-491c-203e-54aaedf10d30	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5665-491c-e4ca-80f9ebe6f905	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5665-491c-3ad2-082edad3a23a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5665-491c-d9b1-d900c90ef509	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5665-491c-e6ce-d1e33129e4dc	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5665-491c-7c0e-3b1ea437dc3e	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5665-491c-2e89-afe884c99d68	Prostor-read	Prostor - branje	t
00030000-5665-491c-b087-9676ca8804f8	Prostor-write	Prostor - spreminjanje	t
00030000-5665-491c-81c3-591303a7a08e	Racun-read	Racun - branje	t
00030000-5665-491c-b40e-a8fab65dab62	Racun-write	Racun - spreminjanje	t
00030000-5665-491c-2117-95a77afae923	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5665-491c-d345-f0da7249760f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5665-491c-a221-21dd38309557	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5665-491c-6aa2-1e59794d9c23	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5665-491c-a02f-81e47d1f408e	Rekvizit-read	Rekvizit - branje	t
00030000-5665-491c-c8dd-915101479594	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5665-491c-fde4-acaa8c2f0957	Revizija-read	Revizija - branje	t
00030000-5665-491c-aa6d-5b6bb799b121	Revizija-write	Revizija - spreminjanje	t
00030000-5665-491c-2984-15bf79b57854	Rezervacija-read	Rezervacija - branje	t
00030000-5665-491c-5974-8b0ec3074ebf	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5665-491c-49cb-4dcded6bbe90	SedezniRed-read	SedezniRed - branje	t
00030000-5665-491c-ea09-0b1559d12a12	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5665-491c-8a54-fed7f2444f65	Sedez-read	Sedez - branje	t
00030000-5665-491c-4d67-ea13577db257	Sedez-write	Sedez - spreminjanje	t
00030000-5665-491c-8411-16ddb33c0725	Sezona-read	Sezona - branje	t
00030000-5665-491c-d7e5-38af5135639a	Sezona-write	Sezona - spreminjanje	t
00030000-5665-491c-942a-c65677f57970	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5665-491c-9cbe-0806bebe6a78	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5665-491c-efbb-fe8ea01b2bca	Telefonska-read	Telefonska - branje	t
00030000-5665-491c-cb0f-8ad87204c2b1	Telefonska-write	Telefonska - spreminjanje	t
00030000-5665-491c-4582-def7de433dcb	TerminStoritve-read	TerminStoritve - branje	t
00030000-5665-491c-0e66-4a4867bb52c7	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5665-491c-63e7-2457f3406d3f	TipFunkcije-read	TipFunkcije - branje	t
00030000-5665-491c-e35b-fc3a921d439c	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5665-491c-a49b-e6a707750845	TipPopa-read	TipPopa - branje	t
00030000-5665-491c-31fe-729b405a2461	TipPopa-write	TipPopa - spreminjanje	t
00030000-5665-491c-58bd-3969172fd887	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5665-491c-77d1-3398d0758379	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5665-491c-6307-b1d502c1e7ab	TipVaje-read	TipVaje - branje	t
00030000-5665-491c-a2a2-69d0c245cfa4	TipVaje-write	TipVaje - spreminjanje	t
00030000-5665-491c-97b7-68bac9eeb44a	Trr-read	Trr - branje	t
00030000-5665-491c-f41d-02bce209b3c9	Trr-write	Trr - spreminjanje	t
00030000-5665-491c-5044-6823c4b79853	Uprizoritev-read	Uprizoritev - branje	t
00030000-5665-491c-75a1-f1fc454d3560	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5665-491c-1932-c55db8c83020	Vaja-read	Vaja - branje	t
00030000-5665-491c-b7fc-177d5c076536	Vaja-write	Vaja - spreminjanje	t
00030000-5665-491c-d966-3f8b1ade8a27	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5665-491c-4801-747c806ea206	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5665-491c-0c62-7ebf9959ab9e	VrstaStroska-read	VrstaStroska - branje	t
00030000-5665-491c-dafe-d6d0d9fad58c	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5665-491c-6e82-1bd37a115fd1	Zaposlitev-read	Zaposlitev - branje	t
00030000-5665-491c-783d-0d53330b5b74	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5665-491c-69e5-8d598c78cf81	Zasedenost-read	Zasedenost - branje	t
00030000-5665-491c-3613-d7f84ea83d76	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5665-491c-fd5e-f33bdb237502	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5665-491c-3c5e-c8ec8026607f	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5665-491c-5a5b-83cfdc72ebae	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5665-491c-6a53-b0ab51b78bad	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5665-491c-6204-4711e00bf45a	Job-read	Branje opravil - samo zase - branje	t
00030000-5665-491c-1cb9-b1b05d0b3e39	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5665-491c-674e-8ae54274db84	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5665-491c-c3b9-378ee251e68c	Report-read	Report - branje	t
00030000-5665-491c-0ce0-454279ee2130	Report-write	Report - spreminjanje	t
00030000-5665-491c-afb2-ef4d0cf6bb89	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5665-491c-b7fe-c0edfd0eca90	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5665-491c-23ad-8fe92f4e8191	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5665-491c-97fc-1f2a0475bacc	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5665-491c-0b1f-a18ca52b22ef	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5665-491c-b919-cfbb47c4148c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5665-491c-4e46-3218bd56db29	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5665-491c-bb45-0622eb227683	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5665-491c-3291-5be2e868b9d1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5665-491c-0931-55813b9abdfb	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5665-491c-0537-c867273dd554	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5665-491c-e38b-9bbdcd45bcb9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5665-491c-ae5f-4e418eac10c2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5665-491c-4ac1-5883d6324f9d	Datoteka-write	Datoteka - spreminjanje	t
00030000-5665-491c-ea49-88c5a2909418	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3104 (class 0 OID 30912959)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5665-491c-0725-fac0571cb370	00030000-5665-491c-802e-bd03f9dc8fb8
00020000-5665-491c-0725-fac0571cb370	00030000-5665-491c-1992-18bf019633d8
00020000-5665-491c-51ae-b724aae264cb	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-bdd3-d3b11144d71f
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-437a-3fbdb26c8a34
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-782a-7cf58354a101
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-62c2-314472a9390f
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-bd3e-18ef208c2e3d	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-e093-fd212aae8756	00030000-5665-491c-782a-7cf58354a101
00020000-5665-491c-e093-fd212aae8756	00030000-5665-491c-62c2-314472a9390f
00020000-5665-491c-e093-fd212aae8756	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-e093-fd212aae8756	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-e093-fd212aae8756	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-8d36-5595430e1cbb	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-8d36-5595430e1cbb	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-8d36-5595430e1cbb	00030000-5665-491c-783d-0d53330b5b74
00020000-5665-491c-8d36-5595430e1cbb	00030000-5665-491c-0cf3-ed42e3e26eff
00020000-5665-491c-2750-5cd0325b8cca	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-2750-5cd0325b8cca	00030000-5665-491c-0cf3-ed42e3e26eff
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-ca73-1150f27e5ab8
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-32e8-906399fa3373
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-efbb-fe8ea01b2bca
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-cb0f-8ad87204c2b1
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-2f06-1105d1d84715	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-efbb-fe8ea01b2bca
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-34db-c7160a3d5f39	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-ca73-1150f27e5ab8
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-d627-c4ff137feae1
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-3228-de855e3f2e3b
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-f41d-02bce209b3c9
00020000-5665-491c-7f75-bd04d1f5092f	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-fefa-cbf3650ca39f	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-fefa-cbf3650ca39f	00030000-5665-491c-d627-c4ff137feae1
00020000-5665-491c-fefa-cbf3650ca39f	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-fefa-cbf3650ca39f	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-efbb-fe8ea01b2bca
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-eb86-59ce59034436
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-cb0f-8ad87204c2b1
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-32e8-906399fa3373
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-f41d-02bce209b3c9
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-f627-0412d34622d7
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-35be-6a3d74d5870f
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-8117-8661a8fd569c
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-d796-21026b691fd4	00030000-5665-491c-a49b-e6a707750845
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-efbb-fe8ea01b2bca
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-eb86-59ce59034436
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-4cb9-5c69ef6855c0	00030000-5665-491c-a49b-e6a707750845
00020000-5665-491c-b08b-f9b375565735	00030000-5665-491c-a49b-e6a707750845
00020000-5665-491c-b08b-f9b375565735	00030000-5665-491c-31fe-729b405a2461
00020000-5665-491c-617e-cf0894ad2e53	00030000-5665-491c-a49b-e6a707750845
00020000-5665-491c-9e0c-7eea7c999c6e	00030000-5665-491c-0dc1-d04be2cdcaff
00020000-5665-491c-9e0c-7eea7c999c6e	00030000-5665-491c-ede7-d24bb4c145ea
00020000-5665-491c-b494-5fbd7e56da5b	00030000-5665-491c-0dc1-d04be2cdcaff
00020000-5665-491c-b39e-fe8ad1354040	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-b39e-fe8ad1354040	00030000-5665-491c-ffe8-7f9178ae4ca4
00020000-5665-491c-4d5e-843129ce06a5	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-ea20-211fa5009d48	00030000-5665-491c-5a5b-83cfdc72ebae
00020000-5665-491c-ea20-211fa5009d48	00030000-5665-491c-6a53-b0ab51b78bad
00020000-5665-491c-5dd0-3ae9f94e9a4e	00030000-5665-491c-5a5b-83cfdc72ebae
00020000-5665-491c-ec40-3348564225bb	00030000-5665-491c-fd5e-f33bdb237502
00020000-5665-491c-ec40-3348564225bb	00030000-5665-491c-3c5e-c8ec8026607f
00020000-5665-491c-d8d8-5c24d1454c9d	00030000-5665-491c-fd5e-f33bdb237502
00020000-5665-491c-d055-7c20c4473215	00030000-5665-491c-b508-306e7419c4cc
00020000-5665-491c-d055-7c20c4473215	00030000-5665-491c-d7c2-310fbdbc2fba
00020000-5665-491c-2cf6-be750738fa08	00030000-5665-491c-b508-306e7419c4cc
00020000-5665-491c-1fa2-761d6ba5794c	00030000-5665-491c-2e89-afe884c99d68
00020000-5665-491c-1fa2-761d6ba5794c	00030000-5665-491c-b087-9676ca8804f8
00020000-5665-491c-1fa2-761d6ba5794c	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-1fa2-761d6ba5794c	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-1fa2-761d6ba5794c	00030000-5665-491c-32e8-906399fa3373
00020000-5665-491c-1fa2-761d6ba5794c	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-1686-52fcc34138a9	00030000-5665-491c-2e89-afe884c99d68
00020000-5665-491c-1686-52fcc34138a9	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-1686-52fcc34138a9	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-7f2e-6b424120a6c6	00030000-5665-491c-0c62-7ebf9959ab9e
00020000-5665-491c-7f2e-6b424120a6c6	00030000-5665-491c-dafe-d6d0d9fad58c
00020000-5665-491c-f871-2b269d053193	00030000-5665-491c-0c62-7ebf9959ab9e
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-cfcb-9c7cef938006
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-0cf3-ed42e3e26eff
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-732b-629263e44b16	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-beea-2fae024e782f	00030000-5665-491c-0cf3-ed42e3e26eff
00020000-5665-491c-beea-2fae024e782f	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-beea-2fae024e782f	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-beea-2fae024e782f	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-beea-2fae024e782f	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-8ddc-e6454905c136	00030000-5665-491c-6307-b1d502c1e7ab
00020000-5665-491c-8ddc-e6454905c136	00030000-5665-491c-a2a2-69d0c245cfa4
00020000-5665-491c-734c-96172d1e5ac5	00030000-5665-491c-6307-b1d502c1e7ab
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-c9c7-ed1de9cd87c7
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-6b32-062680dc98bb
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-595f-984a82f66a9e
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-70d2-486af7709524
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-b219-89c2b2bf0ff6
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-3d53-52bf1ac167f5
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-1500-44210339ff08
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-6490-b2e3c45556f1
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-3716-10fc8fa9b9ce
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-f3f9-0594222e0a3b
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-9646-02c66d02ebb2
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-5b04-47853498296f
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-e505-747b45f795ae
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-c3ee-b3b3e4ca6568
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-1e88-0d245383ace5
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-0835-098678cedb24
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-203e-54aaedf10d30
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-e4ca-80f9ebe6f905
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-3ad2-082edad3a23a
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-d9b1-d900c90ef509
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-e6ce-d1e33129e4dc
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-7c0e-3b1ea437dc3e
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-ae65-6962452d078f
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-6a9e-4dc0b643c7f5
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-46b0-d29f0e5dbf59
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-1cb9-b1b05d0b3e39
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-815b-7d78ea5b56f8
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-940f-18c76ad67172
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-fbbe-206a98f6f326
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-0c62-7ebf9959ab9e
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-942a-c65677f57970
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-ef49-d0303678a0b7
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-6204-4711e00bf45a
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-32e4-6d8d33045def	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-595f-984a82f66a9e
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-b219-89c2b2bf0ff6
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-1500-44210339ff08
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-3716-10fc8fa9b9ce
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-9646-02c66d02ebb2
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-e505-747b45f795ae
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-1e88-0d245383ace5
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-203e-54aaedf10d30
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-3ad2-082edad3a23a
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-e6ce-d1e33129e4dc
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-940f-18c76ad67172
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-815b-7d78ea5b56f8
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-fbbe-206a98f6f326
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-6204-4711e00bf45a
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-f34e-28075260608a	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-75a1-f1fc454d3560
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-6253-3e37f0b73079
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-62c2-314472a9390f
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-4631-3a104db47189
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-fbfa-b66b0620649a	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-62c2-314472a9390f
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-652e-1e22cd085fd8	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-6253-3e37f0b73079
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-ef49-d0303678a0b7
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-1460-d69c9d01a2ca
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-942a-c65677f57970
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-9cbe-0806bebe6a78
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-22d8-e87a5a33f187	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-ef49-d0303678a0b7
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-942a-c65677f57970
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-34f6-7e1697d03182	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-942a-c65677f57970
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-ef49-d0303678a0b7
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-ed2b-9f5063110fab	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-f05f-1aa5de61b290	00030000-5665-491c-942a-c65677f57970
00020000-5665-491c-f05f-1aa5de61b290	00030000-5665-491c-9cbe-0806bebe6a78
00020000-5665-491c-f05f-1aa5de61b290	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-f05f-1aa5de61b290	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-b2a6-289ed6ae3544	00030000-5665-491c-942a-c65677f57970
00020000-5665-491c-b2a6-289ed6ae3544	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-b508-306e7419c4cc
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-782a-7cf58354a101
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-bdd3-d3b11144d71f
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-62c2-314472a9390f
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-437a-3fbdb26c8a34
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-c771-1035725992a6
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-eb86-59ce59034436
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-0cf3-ed42e3e26eff
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-ca73-1150f27e5ab8
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-0dc1-d04be2cdcaff
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-32e8-906399fa3373
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-2e89-afe884c99d68
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-efbb-fe8ea01b2bca
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-cb0f-8ad87204c2b1
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-a49b-e6a707750845
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-6307-b1d502c1e7ab
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-0c62-7ebf9959ab9e
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-0537-c867273dd554
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-fd5e-f33bdb237502
00020000-5665-491c-b04b-78831f71d1c8	00030000-5665-491c-5a5b-83cfdc72ebae
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1992-18bf019633d8
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-802e-bd03f9dc8fb8
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b508-306e7419c4cc
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-d7c2-310fbdbc2fba
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-15d8-38f57f8e53ac
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6253-3e37f0b73079
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e3b5-683d9f1c7c5a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0cff-d73b79194190
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e341-c32846d4dd67
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-2af0-de625f799af8
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-782a-7cf58354a101
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-bdd3-d3b11144d71f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-62c2-314472a9390f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-437a-3fbdb26c8a34
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6df8-96e62131a64a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-5dc2-b94752c2b8f4
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6055-eb2e4f017b9a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-7e67-70b6a06990d3
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0abc-9bf22adcee6d
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-f72f-2159148e8290
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-24d6-d174d85e620f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-815b-7d78ea5b56f8
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6a9e-4dc0b643c7f5
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3c90-3b6457c07b0d
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ffe8-7f9178ae4ca4
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-12c8-0614a42d9d68
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b536-46a57215398a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-c771-1035725992a6
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4631-3a104db47189
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b83a-9a2fdde4a8c0
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a619-5c28f0acbb2f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-674e-8ae54274db84
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6204-4711e00bf45a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1cb9-b1b05d0b3e39
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-eb86-59ce59034436
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-35be-6a3d74d5870f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ca69-d7d7241e990c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-52bb-36fe33803e4c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b7fe-c0edfd0eca90
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-23ad-8fe92f4e8191
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-97fc-1f2a0475bacc
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0b1f-a18ca52b22ef
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4e46-3218bd56db29
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b919-cfbb47c4148c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-8dca-ce226722a47d
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3ef2-4bdfff82d01b
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-92ca-f6de7ed4ed40
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a004-390def15d12e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-cc0b-a7b76585867e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b726-a0b02eb037cb
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0cf3-ed42e3e26eff
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-cfcb-9c7cef938006
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3228-de855e3f2e3b
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ca73-1150f27e5ab8
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e425-88e98c5a65ad
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-395a-0aef247c18bb
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6ed2-3c5d9e9228af
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-cc8a-44b80e399509
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ef49-d0303678a0b7
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1460-d69c9d01a2ca
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-f627-0412d34622d7
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0dc1-d04be2cdcaff
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ede7-d24bb4c145ea
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-fbbe-206a98f6f326
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-46b0-d29f0e5dbf59
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e708-578ff3ce66e6
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1cb6-268f2e960358
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1207-cdca65440eef
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-32e8-906399fa3373
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ccc2-e8ddfd9b71b3
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a512-6b9a63db44e7
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4e8d-6775cf42b11b
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3384-9408502d2734
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-be25-a3399d8f5e47
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-9846-98266d33aa40
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-940f-18c76ad67172
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ae65-6962452d078f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-22d6-a3ca367f0e8b
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-8117-8661a8fd569c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-c9c7-ed1de9cd87c7
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-595f-984a82f66a9e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6b32-062680dc98bb
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-70d2-486af7709524
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b219-89c2b2bf0ff6
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3d53-52bf1ac167f5
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1500-44210339ff08
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6490-b2e3c45556f1
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3716-10fc8fa9b9ce
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-f3f9-0594222e0a3b
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-9646-02c66d02ebb2
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-5b04-47853498296f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e505-747b45f795ae
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-c3ee-b3b3e4ca6568
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1e88-0d245383ace5
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0835-098678cedb24
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-203e-54aaedf10d30
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e4ca-80f9ebe6f905
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3ad2-082edad3a23a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-d9b1-d900c90ef509
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e6ce-d1e33129e4dc
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-7c0e-3b1ea437dc3e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-2e89-afe884c99d68
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b087-9676ca8804f8
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-81c3-591303a7a08e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b40e-a8fab65dab62
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-2117-95a77afae923
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-d345-f0da7249760f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a02f-81e47d1f408e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-c8dd-915101479594
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a221-21dd38309557
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6aa2-1e59794d9c23
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-c3b9-378ee251e68c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0ce0-454279ee2130
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-fde4-acaa8c2f0957
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-aa6d-5b6bb799b121
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-2984-15bf79b57854
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-5974-8b0ec3074ebf
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-8a54-fed7f2444f65
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4d67-ea13577db257
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-49cb-4dcded6bbe90
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ea09-0b1559d12a12
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-8411-16ddb33c0725
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-d7e5-38af5135639a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-afb2-ef4d0cf6bb89
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-942a-c65677f57970
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-9cbe-0806bebe6a78
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-efbb-fe8ea01b2bca
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-cb0f-8ad87204c2b1
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4582-def7de433dcb
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6122-20cd57093f2a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0e66-4a4867bb52c7
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-63e7-2457f3406d3f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e35b-fc3a921d439c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a49b-e6a707750845
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-31fe-729b405a2461
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-58bd-3969172fd887
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-77d1-3398d0758379
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6307-b1d502c1e7ab
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-a2a2-69d0c245cfa4
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-f41d-02bce209b3c9
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-75a1-f1fc454d3560
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-1932-c55db8c83020
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-b7fc-177d5c076536
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-d966-3f8b1ade8a27
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-4801-747c806ea206
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0c62-7ebf9959ab9e
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-dafe-d6d0d9fad58c
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-ae5f-4e418eac10c2
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-e38b-9bbdcd45bcb9
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0537-c867273dd554
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6e82-1bd37a115fd1
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-783d-0d53330b5b74
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-69e5-8d598c78cf81
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3613-d7f84ea83d76
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-fd5e-f33bdb237502
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-3c5e-c8ec8026607f
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-5a5b-83cfdc72ebae
00020000-5665-491e-00bc-4ecb45c9d28b	00030000-5665-491c-6a53-b0ab51b78bad
00020000-5665-491e-df1f-320d58cbad99	00030000-5665-491c-0537-c867273dd554
00020000-5665-491e-113e-774ab0810ec1	00030000-5665-491c-0931-55813b9abdfb
00020000-5665-491e-88cd-51aaf8c719f3	00030000-5665-491c-75a1-f1fc454d3560
00020000-5665-491e-ce5c-6f62b46932a2	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491e-f4c9-7283fba05dd5	00030000-5665-491c-23ad-8fe92f4e8191
00020000-5665-491e-03fc-96e1aa1b3676	00030000-5665-491c-97fc-1f2a0475bacc
00020000-5665-491e-a57b-ad5f07cc2df9	00030000-5665-491c-0b1f-a18ca52b22ef
00020000-5665-491e-7021-204e4eac6383	00030000-5665-491c-b7fe-c0edfd0eca90
00020000-5665-491e-5c5a-f1df0b691448	00030000-5665-491c-4e46-3218bd56db29
00020000-5665-491e-3912-2db5a9ed351c	00030000-5665-491c-b919-cfbb47c4148c
00020000-5665-491e-623f-c7780593e730	00030000-5665-491c-3291-5be2e868b9d1
00020000-5665-491e-1b13-df074e159d49	00030000-5665-491c-bb45-0622eb227683
00020000-5665-491e-fd0b-439eed848e21	00030000-5665-491c-596e-55bd9c93d244
00020000-5665-491e-38a6-d1601eb9eb11	00030000-5665-491c-ca73-1150f27e5ab8
00020000-5665-491e-ab39-bcfdf9567c90	00030000-5665-491c-3228-de855e3f2e3b
00020000-5665-491e-2cf2-404c7fe7ea8f	00030000-5665-491c-d627-c4ff137feae1
00020000-5665-491e-f275-6004cc470024	00030000-5665-491c-4ac1-5883d6324f9d
00020000-5665-491e-c9cf-70882c3428b9	00030000-5665-491c-ea49-88c5a2909418
00020000-5665-491e-7685-12b4bc879441	00030000-5665-491c-6b0f-03b6b3e70aea
00020000-5665-491e-7685-12b4bc879441	00030000-5665-491c-f627-0412d34622d7
00020000-5665-491e-7685-12b4bc879441	00030000-5665-491c-5044-6823c4b79853
00020000-5665-491e-b74f-702d3d9a76cc	00030000-5665-491c-97b7-68bac9eeb44a
00020000-5665-491e-8ee7-4f6262a594a3	00030000-5665-491c-f41d-02bce209b3c9
00020000-5665-491e-bdd6-fbc60f041a2d	00030000-5665-491c-afb2-ef4d0cf6bb89
\.


--
-- TOC entry 3141 (class 0 OID 30913350)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 30913384)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 30913521)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5665-491e-e33a-8dd83ac2400b	00090000-5665-491e-b9a0-2a29b96abab8	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5665-491e-f71a-7d30c0af2d9d	00090000-5665-491e-1c90-963d8d09a58f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5665-491e-3b80-629f71722304	00090000-5665-491e-6bb9-aace5287ed93	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5665-491e-9b98-49520558ea98	00090000-5665-491e-d85f-772fef0a3534	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3112 (class 0 OID 30913042)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5665-491e-f6f8-065c5fbb5ec8	\N	00040000-5665-491c-3911-ffb35619fd27	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-d17d-2bd842217e42	\N	00040000-5665-491c-3911-ffb35619fd27	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5665-491e-f787-9c643fabc379	\N	00040000-5665-491c-3911-ffb35619fd27	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-cfdd-d583fa8a30f4	\N	00040000-5665-491c-3911-ffb35619fd27	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-e019-ae2ae2de8e39	\N	00040000-5665-491c-3911-ffb35619fd27	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-e58d-5e47375636d2	\N	00040000-5665-491c-adbd-baaf43220651	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-d4b1-9b9abc5d3546	\N	00040000-5665-491c-f87f-a125fac826bc	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-6806-84a8c624b7ac	\N	00040000-5665-491c-ae1b-a56f249a8ea8	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-491e-1810-05ce7eadbb86	\N	00040000-5665-491c-34a4-60f69b6b08cb	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5665-4920-e963-b6f613e22128	\N	00040000-5665-491c-3911-ffb35619fd27	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3115 (class 0 OID 30913087)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5665-491b-fc98-99a8ef710862	8341	Adlešiči
00050000-5665-491b-665b-4dd2037424f0	5270	Ajdovščina
00050000-5665-491b-7d9c-50c0385385c8	6280	Ankaran/Ancarano
00050000-5665-491b-bef4-87d96f8a49fb	9253	Apače
00050000-5665-491b-c12e-3dc10dbc06d5	8253	Artiče
00050000-5665-491b-03bd-f6b387f8030a	4275	Begunje na Gorenjskem
00050000-5665-491b-6e80-c076fdafac8a	1382	Begunje pri Cerknici
00050000-5665-491b-97ad-ca0dbd20db14	9231	Beltinci
00050000-5665-491b-8e4b-4f196d809379	2234	Benedikt
00050000-5665-491b-f5e1-a5a91f977110	2345	Bistrica ob Dravi
00050000-5665-491b-e32a-3ed7ef1d28ad	3256	Bistrica ob Sotli
00050000-5665-491b-be76-6913131a958d	8259	Bizeljsko
00050000-5665-491b-7ba1-5e8309002ce0	1223	Blagovica
00050000-5665-491b-9ce8-c52c1388604f	8283	Blanca
00050000-5665-491b-7b27-829608fa2a20	4260	Bled
00050000-5665-491b-7e42-fc14f3297106	4273	Blejska Dobrava
00050000-5665-491b-0388-e0dbde39be53	9265	Bodonci
00050000-5665-491b-4143-af6a112c19e1	9222	Bogojina
00050000-5665-491b-db8b-2a4fb0f89ba1	4263	Bohinjska Bela
00050000-5665-491b-51b7-a5158ad607a1	4264	Bohinjska Bistrica
00050000-5665-491b-5a17-4b0d078ca194	4265	Bohinjsko jezero
00050000-5665-491b-9912-49226b98bec2	1353	Borovnica
00050000-5665-491b-9585-68f909e27dac	8294	Boštanj
00050000-5665-491b-a589-0f50fe763bb8	5230	Bovec
00050000-5665-491b-fc61-43bffddb4f02	5295	Branik
00050000-5665-491b-6e2c-b2ed445b6ab6	3314	Braslovče
00050000-5665-491b-e756-c91ad866a803	5223	Breginj
00050000-5665-491b-c857-e2dd9fd7720c	8280	Brestanica
00050000-5665-491b-a560-412d161d3c1b	2354	Bresternica
00050000-5665-491b-ed38-dba06a752ac8	4243	Brezje
00050000-5665-491b-f1c5-042174f1153b	1351	Brezovica pri Ljubljani
00050000-5665-491b-1b41-38321982c453	8250	Brežice
00050000-5665-491b-e024-5aef52a3dfaa	4210	Brnik - Aerodrom
00050000-5665-491b-b1c1-187ed0920c96	8321	Brusnice
00050000-5665-491b-7269-6eedea7b3fb8	3255	Buče
00050000-5665-491b-2ab4-144492557c1f	8276	Bučka 
00050000-5665-491b-9acc-efceed5c3c45	9261	Cankova
00050000-5665-491b-8e78-85641de8c17b	3000	Celje 
00050000-5665-491b-a12d-b4c760d76eed	3001	Celje - poštni predali
00050000-5665-491b-988c-6317ccdd0707	4207	Cerklje na Gorenjskem
00050000-5665-491b-bd3f-1a8f54ce8360	8263	Cerklje ob Krki
00050000-5665-491b-73d1-b4c2fcbbb621	1380	Cerknica
00050000-5665-491b-53ec-594d8f1dceb0	5282	Cerkno
00050000-5665-491b-a38a-dabf3c7718e7	2236	Cerkvenjak
00050000-5665-491b-2b7b-069ae89141b2	2215	Ceršak
00050000-5665-491b-5ebe-904e71703557	2326	Cirkovce
00050000-5665-491b-acd3-bf9eb4550dbb	2282	Cirkulane
00050000-5665-491b-3141-934f97b75e1b	5273	Col
00050000-5665-491b-46f7-3c34b91782de	8251	Čatež ob Savi
00050000-5665-491b-a83e-eb0813761945	1413	Čemšenik
00050000-5665-491b-a492-24c652c601b1	5253	Čepovan
00050000-5665-491b-13ca-14c22548ff87	9232	Črenšovci
00050000-5665-491b-e6a3-5a3b47988622	2393	Črna na Koroškem
00050000-5665-491b-6f15-c1b3c30f56b7	6275	Črni Kal
00050000-5665-491b-968e-cb77de444452	5274	Črni Vrh nad Idrijo
00050000-5665-491b-ef63-8befc2856776	5262	Črniče
00050000-5665-491b-cab2-21cb9d4c64f6	8340	Črnomelj
00050000-5665-491b-d5fb-e648db165148	6271	Dekani
00050000-5665-491b-645c-ba8fa171cd3f	5210	Deskle
00050000-5665-491b-f2ff-6c905ad66804	2253	Destrnik
00050000-5665-491b-af0c-343b8b9481b1	6215	Divača
00050000-5665-491b-e663-2f5bea8b27f0	1233	Dob
00050000-5665-491b-8494-a1befd7581df	3224	Dobje pri Planini
00050000-5665-491b-29bf-18a91783baf3	8257	Dobova
00050000-5665-491b-9671-dbe843083fa0	1423	Dobovec
00050000-5665-491b-621d-5f53c39c1e82	5263	Dobravlje
00050000-5665-491b-6a0e-304e91db0c25	3204	Dobrna
00050000-5665-491b-dfdb-814b046e9941	8211	Dobrnič
00050000-5665-491b-835d-60e37982e85d	1356	Dobrova
00050000-5665-491b-ad1a-9fb0459b2230	9223	Dobrovnik/Dobronak 
00050000-5665-491b-245f-66cfde696c77	5212	Dobrovo v Brdih
00050000-5665-491b-9001-947bb711ab83	1431	Dol pri Hrastniku
00050000-5665-491b-f4b7-83f49c270d93	1262	Dol pri Ljubljani
00050000-5665-491b-3ebb-e449470a8dd6	1273	Dole pri Litiji
00050000-5665-491b-d510-dcf1aea46f5f	1331	Dolenja vas
00050000-5665-491b-16c6-4a1e47fb1abf	8350	Dolenjske Toplice
00050000-5665-491b-9ccd-a5b1cc861529	1230	Domžale
00050000-5665-491b-534e-676f3a6b3bf5	2252	Dornava
00050000-5665-491b-3a8a-8844ff49222b	5294	Dornberk
00050000-5665-491b-672e-c98c7eb6ad4c	1319	Draga
00050000-5665-491b-fbde-f807c9210e5b	8343	Dragatuš
00050000-5665-491b-932d-1d6eefaf4dd8	3222	Dramlje
00050000-5665-491b-f6ef-d3c119751bce	2370	Dravograd
00050000-5665-491b-f254-bddedbb63eb4	4203	Duplje
00050000-5665-491b-f4f4-67ce4e35bf91	6221	Dutovlje
00050000-5665-491b-50ac-c34191499092	8361	Dvor
00050000-5665-491b-568d-ddba17b55868	2343	Fala
00050000-5665-491b-e104-5e3aa45098c0	9208	Fokovci
00050000-5665-491b-e57b-b9b6af507b60	2313	Fram
00050000-5665-491b-cf01-b368a88c6ec8	3213	Frankolovo
00050000-5665-491b-5631-b484698b8c0a	1274	Gabrovka
00050000-5665-491b-8ddd-69d292059820	8254	Globoko
00050000-5665-491b-d815-dcc4e2f20ad7	5275	Godovič
00050000-5665-491b-fea4-65151717ac6f	4204	Golnik
00050000-5665-491b-d6c4-771389e84a91	3303	Gomilsko
00050000-5665-491b-2faf-d8cd26b05eb7	4224	Gorenja vas
00050000-5665-491b-bad1-89c89582456b	3263	Gorica pri Slivnici
00050000-5665-491b-2e5f-79b368a3e7df	2272	Gorišnica
00050000-5665-491b-a404-f17c8f150bef	9250	Gornja Radgona
00050000-5665-491b-7d48-5446093458f9	3342	Gornji Grad
00050000-5665-491b-7709-c89ba8505643	4282	Gozd Martuljek
00050000-5665-491b-77c2-b4b5fcdb078b	6272	Gračišče
00050000-5665-491b-7e79-ce98a885c0a0	9264	Grad
00050000-5665-491b-bae6-7d7ce50719f7	8332	Gradac
00050000-5665-491b-ded0-870655268aac	1384	Grahovo
00050000-5665-491b-283a-82be02291030	5242	Grahovo ob Bači
00050000-5665-491b-bd60-285d99ba3682	5251	Grgar
00050000-5665-491b-9e29-4d0f3e839120	3302	Griže
00050000-5665-491b-42f2-91bfd28f0580	3231	Grobelno
00050000-5665-491b-f7b8-c46bf9cd3da5	1290	Grosuplje
00050000-5665-491b-19c0-e9539948033e	2288	Hajdina
00050000-5665-491b-281b-3279e7ab319f	8362	Hinje
00050000-5665-491b-d1f7-bb94d215c01d	2311	Hoče
00050000-5665-491b-22c9-e500dcc63817	9205	Hodoš/Hodos
00050000-5665-491b-95b7-33706688819b	1354	Horjul
00050000-5665-491b-fdee-8f6e3e306da1	1372	Hotedršica
00050000-5665-491b-fcd7-303efd5b0f10	1430	Hrastnik
00050000-5665-491b-827a-6527cc67918b	6225	Hruševje
00050000-5665-491b-a293-3af57d9b884e	4276	Hrušica
00050000-5665-491b-8827-af301872c5bf	5280	Idrija
00050000-5665-491b-6d19-d99331327cc6	1292	Ig
00050000-5665-491b-acd3-4ea4b988ea52	6250	Ilirska Bistrica
00050000-5665-491b-0c51-17a62a267a25	6251	Ilirska Bistrica-Trnovo
00050000-5665-491b-5690-f30ee31a05e3	1295	Ivančna Gorica
00050000-5665-491b-772e-09cb7ac0c5df	2259	Ivanjkovci
00050000-5665-491b-0024-cfefd39b6fc3	1411	Izlake
00050000-5665-491b-bbb7-e74d9244d16f	6310	Izola/Isola
00050000-5665-491b-933a-b8ea9941a0bc	2222	Jakobski Dol
00050000-5665-491b-e324-7f7091b1c575	2221	Jarenina
00050000-5665-491b-7ab4-432af81e8036	6254	Jelšane
00050000-5665-491b-b880-9c790ceba377	4270	Jesenice
00050000-5665-491b-7800-c619e3409565	8261	Jesenice na Dolenjskem
00050000-5665-491b-f520-88495a83035d	3273	Jurklošter
00050000-5665-491b-a2d5-6918ffebbef1	2223	Jurovski Dol
00050000-5665-491b-972a-e5096a7e7964	2256	Juršinci
00050000-5665-491b-1bab-d600a0f701f3	5214	Kal nad Kanalom
00050000-5665-491b-2884-ddefbc5a0734	3233	Kalobje
00050000-5665-491b-3228-0abf6dee9515	4246	Kamna Gorica
00050000-5665-491b-ea7a-2fcb1ecc56aa	2351	Kamnica
00050000-5665-491b-0bc1-5e6bcd09322b	1241	Kamnik
00050000-5665-491b-55c2-bda41bbd1b04	5213	Kanal
00050000-5665-491b-a6f5-c1cbfb7d77ea	8258	Kapele
00050000-5665-491b-2b82-875367dcdf20	2362	Kapla
00050000-5665-491b-a875-9b1e7b17ca31	2325	Kidričevo
00050000-5665-491b-2c8a-faeb4ce907a1	1412	Kisovec
00050000-5665-491b-b82f-de00e9916f43	6253	Knežak
00050000-5665-491b-2fae-b140c0b45f8d	5222	Kobarid
00050000-5665-491b-feb0-f4db025bc822	9227	Kobilje
00050000-5665-491b-b82e-4c735467c961	1330	Kočevje
00050000-5665-491b-f906-47daf0f5a2ac	1338	Kočevska Reka
00050000-5665-491b-bb67-0ed0aa084d7a	2276	Kog
00050000-5665-491b-9139-d2e119406187	5211	Kojsko
00050000-5665-491b-7923-2595bf9f0502	6223	Komen
00050000-5665-491b-2aef-0f876835aa5e	1218	Komenda
00050000-5665-491b-4222-b698e8035afe	6000	Koper/Capodistria 
00050000-5665-491b-fcab-fe4ab0220b0c	6001	Koper/Capodistria - poštni predali
00050000-5665-491b-6640-8dc36b38c0bd	8282	Koprivnica
00050000-5665-491b-1d20-3bfd7e294293	5296	Kostanjevica na Krasu
00050000-5665-491b-0ba4-51e8949c4df4	8311	Kostanjevica na Krki
00050000-5665-491b-fa58-11a199dbead4	1336	Kostel
00050000-5665-491b-66bf-18631faf828e	6256	Košana
00050000-5665-491b-9017-12da6cd4df5c	2394	Kotlje
00050000-5665-491b-88ed-eba467f6a656	6240	Kozina
00050000-5665-491b-8788-00de945a736e	3260	Kozje
00050000-5665-491b-67cf-cfe3dab9b8c2	4000	Kranj 
00050000-5665-491b-9bff-a2f0028eab8f	4001	Kranj - poštni predali
00050000-5665-491b-1981-2c508de37cdb	4280	Kranjska Gora
00050000-5665-491b-3ac9-af28d7195e75	1281	Kresnice
00050000-5665-491b-0a3e-34beee5cd3f8	4294	Križe
00050000-5665-491b-341c-cd0f78653a9f	9206	Križevci
00050000-5665-491b-6649-4ed7ec26e827	9242	Križevci pri Ljutomeru
00050000-5665-491b-a100-fb894565c343	1301	Krka
00050000-5665-491b-f497-a8a31d4f1c8a	8296	Krmelj
00050000-5665-491b-768d-789b3a82b26f	4245	Kropa
00050000-5665-491b-f7e2-bf18993eab47	8262	Krška vas
00050000-5665-491b-48f2-18d8475584c3	8270	Krško
00050000-5665-491b-15ab-04477fe58d11	9263	Kuzma
00050000-5665-491b-73b0-f39826931895	2318	Laporje
00050000-5665-491b-0f67-7cfc021a939a	3270	Laško
00050000-5665-491b-ccfb-dd0a93a3a8c7	1219	Laze v Tuhinju
00050000-5665-491b-550d-63d4cb7e1910	2230	Lenart v Slovenskih goricah
00050000-5665-491b-8121-a5e4f2cd2d6a	9220	Lendava/Lendva
00050000-5665-491b-2162-ad49e2688d84	4248	Lesce
00050000-5665-491b-5b75-4557f5fafc5d	3261	Lesično
00050000-5665-491b-0561-a9e096c1605f	8273	Leskovec pri Krškem
00050000-5665-491b-8cbd-f8e99c99759e	2372	Libeliče
00050000-5665-491b-af0a-a57b72603e84	2341	Limbuš
00050000-5665-491b-ef91-bffc66381a79	1270	Litija
00050000-5665-491b-689c-e4904952db38	3202	Ljubečna
00050000-5665-491b-421f-01655be3e1a8	1000	Ljubljana 
00050000-5665-491b-bce9-1227365d9ceb	1001	Ljubljana - poštni predali
00050000-5665-491b-b1cb-fdce74a852c7	1231	Ljubljana - Črnuče
00050000-5665-491b-9444-bba301e8b7dd	1261	Ljubljana - Dobrunje
00050000-5665-491b-c801-a6427146d0de	1260	Ljubljana - Polje
00050000-5665-491b-a345-ab4d49b64329	1210	Ljubljana - Šentvid
00050000-5665-491b-1d66-c93259343fbe	1211	Ljubljana - Šmartno
00050000-5665-491b-7c44-550d097b3eec	3333	Ljubno ob Savinji
00050000-5665-491b-fb09-3fc1966d6bb7	9240	Ljutomer
00050000-5665-491b-aa48-16a0108de775	3215	Loče
00050000-5665-491b-b0d1-ac23b38b13d1	5231	Log pod Mangartom
00050000-5665-491b-0aa0-3f133909c2c0	1358	Log pri Brezovici
00050000-5665-491b-11b0-2ceec96be01f	1370	Logatec
00050000-5665-491b-2c6d-7720ca19141e	1371	Logatec
00050000-5665-491b-791e-d65f45ca589b	1434	Loka pri Zidanem Mostu
00050000-5665-491b-ad25-7f7beb3a45c6	3223	Loka pri Žusmu
00050000-5665-491b-96c6-3e7abff7411f	6219	Lokev
00050000-5665-491b-0716-b84d8ae8a170	1318	Loški Potok
00050000-5665-491b-9c24-a98690c1e129	2324	Lovrenc na Dravskem polju
00050000-5665-491b-a0a7-c2056d7e0831	2344	Lovrenc na Pohorju
00050000-5665-491b-a598-9974698340db	3334	Luče
00050000-5665-491b-9ba6-7ceb960c949f	1225	Lukovica
00050000-5665-491b-9910-22670cd05cd1	9202	Mačkovci
00050000-5665-491b-d462-21e6ddec9802	2322	Majšperk
00050000-5665-491b-44c1-fdb0509f72e8	2321	Makole
00050000-5665-491b-5269-b4fa51b774b3	9243	Mala Nedelja
00050000-5665-491b-da76-bd8ff31f6921	2229	Malečnik
00050000-5665-491b-a50f-087b7b1ae1f9	6273	Marezige
00050000-5665-491b-f479-b46c31a6ed64	2000	Maribor 
00050000-5665-491b-d3eb-cd9958d286a9	2001	Maribor - poštni predali
00050000-5665-491b-ba31-bbd17525607c	2206	Marjeta na Dravskem polju
00050000-5665-491b-4260-e15b99e93655	2281	Markovci
00050000-5665-491b-971e-5844ef565cc0	9221	Martjanci
00050000-5665-491b-4ebc-1a869504bcf3	6242	Materija
00050000-5665-491b-58c9-e3c709f1f3d2	4211	Mavčiče
00050000-5665-491b-dd2c-210d5b2e4548	1215	Medvode
00050000-5665-491b-840e-270bda6cd6b5	1234	Mengeš
00050000-5665-491b-9596-2d2cb96d25d4	8330	Metlika
00050000-5665-491b-c06b-6e8819605a8b	2392	Mežica
00050000-5665-491b-1a73-1d5a7807999c	2204	Miklavž na Dravskem polju
00050000-5665-491b-d57f-0dae1815c7e2	2275	Miklavž pri Ormožu
00050000-5665-491b-f1d6-e5eb0767fa08	5291	Miren
00050000-5665-491b-e6ef-ec15da62a728	8233	Mirna
00050000-5665-491b-f78c-5f8fccdb40ad	8216	Mirna Peč
00050000-5665-491b-1de4-370547ca99ec	2382	Mislinja
00050000-5665-491b-6eef-8b151e7aece6	4281	Mojstrana
00050000-5665-491b-b074-3cd3e3e29789	8230	Mokronog
00050000-5665-491b-4f16-77e9c08f8751	1251	Moravče
00050000-5665-491b-a230-b737ffa9d08c	9226	Moravske Toplice
00050000-5665-491b-0d71-5bf033cf5007	5216	Most na Soči
00050000-5665-491b-907f-24bf3cc87394	1221	Motnik
00050000-5665-491b-58ca-2b0e6fab741f	3330	Mozirje
00050000-5665-491b-4bab-7eb607b6c70a	9000	Murska Sobota 
00050000-5665-491b-77f7-a0d6a12a5dd3	9001	Murska Sobota - poštni predali
00050000-5665-491b-a5c3-258d7d0c109b	2366	Muta
00050000-5665-491b-b3ac-7fbcfb2c4ef3	4202	Naklo
00050000-5665-491b-e598-262c0b260ec4	3331	Nazarje
00050000-5665-491b-8247-dc06a05bd738	1357	Notranje Gorice
00050000-5665-491b-9590-dac045f75c67	3203	Nova Cerkev
00050000-5665-491b-105c-3120e345b2be	5000	Nova Gorica 
00050000-5665-491b-0d86-7061dd132cf2	5001	Nova Gorica - poštni predali
00050000-5665-491b-bc79-64cf8b419e08	1385	Nova vas
00050000-5665-491b-7b9e-014d0fceb90d	8000	Novo mesto
00050000-5665-491b-dd4c-671bdff3f62e	8001	Novo mesto - poštni predali
00050000-5665-491b-e352-e34c06073418	6243	Obrov
00050000-5665-491b-a7ca-4fbec8762714	9233	Odranci
00050000-5665-491b-9b55-2f3f513a7d1a	2317	Oplotnica
00050000-5665-491b-5f85-8634532fefaf	2312	Orehova vas
00050000-5665-491b-badf-72dc69dbc0ae	2270	Ormož
00050000-5665-491b-85d9-4be12f8358f0	1316	Ortnek
00050000-5665-491b-26e0-48b628df64f5	1337	Osilnica
00050000-5665-491b-fd49-0537722e0d8f	8222	Otočec
00050000-5665-491b-5eee-47f77bbecef5	2361	Ožbalt
00050000-5665-491b-5d5d-5371b562cc52	2231	Pernica
00050000-5665-491b-434a-8bdecf042cff	2211	Pesnica pri Mariboru
00050000-5665-491b-7c0e-9ad413a3fa79	9203	Petrovci
00050000-5665-491b-3039-4dcd6fd3d4ea	3301	Petrovče
00050000-5665-491b-3a03-3b3acafea3ad	6330	Piran/Pirano
00050000-5665-491b-6c84-15466f4a23f2	8255	Pišece
00050000-5665-491b-11d6-1fbd15b428a3	6257	Pivka
00050000-5665-491b-e97a-ed3224902706	6232	Planina
00050000-5665-491b-961d-14744f7c9e4b	3225	Planina pri Sevnici
00050000-5665-491b-0f14-49553756598a	6276	Pobegi
00050000-5665-491b-b6d5-4f49dbbfa058	8312	Podbočje
00050000-5665-491b-dd57-d13a83d32884	5243	Podbrdo
00050000-5665-491b-9678-17bed7601535	3254	Podčetrtek
00050000-5665-491b-a541-fcba06cda9d8	2273	Podgorci
00050000-5665-491b-6b1c-f5fb28940303	6216	Podgorje
00050000-5665-491b-26e8-27a0582ca5f4	2381	Podgorje pri Slovenj Gradcu
00050000-5665-491b-70f5-5feaf0469126	6244	Podgrad
00050000-5665-491b-b4d4-78be14777987	1414	Podkum
00050000-5665-491b-89d4-0ae84cd8111c	2286	Podlehnik
00050000-5665-491b-0f46-4c8d3872dde1	5272	Podnanos
00050000-5665-491b-00e1-d989616946ac	4244	Podnart
00050000-5665-491b-2f12-1925f66237e6	3241	Podplat
00050000-5665-491b-de42-64eb738fcaab	3257	Podsreda
00050000-5665-491b-ef39-b610317e1ff2	2363	Podvelka
00050000-5665-491b-c356-4da910e436fd	2208	Pohorje
00050000-5665-491b-fadb-db6847c2e649	2257	Polenšak
00050000-5665-491b-818d-ac99baaf1a92	1355	Polhov Gradec
00050000-5665-491b-19ec-fc0b390a07de	4223	Poljane nad Škofjo Loko
00050000-5665-491b-607d-29f8d73c09e0	2319	Poljčane
00050000-5665-491b-fbd5-f7a919a2da27	1272	Polšnik
00050000-5665-491b-739c-d50eb82a1fad	3313	Polzela
00050000-5665-491b-4531-190d843e4b9e	3232	Ponikva
00050000-5665-491b-dee1-368ddc23afa4	6320	Portorož/Portorose
00050000-5665-491b-3a14-31b344ea7942	6230	Postojna
00050000-5665-491b-6a91-f76364322719	2331	Pragersko
00050000-5665-491b-2ed2-4260d6b4c67f	3312	Prebold
00050000-5665-491b-c766-71742da55c3c	4205	Preddvor
00050000-5665-491b-070c-8fe41b0ac502	6255	Prem
00050000-5665-491b-4b5b-3f1628af244f	1352	Preserje
00050000-5665-491b-a4b0-b899cd2b86c6	6258	Prestranek
00050000-5665-491b-fad4-7c0eccdd033c	2391	Prevalje
00050000-5665-491b-db64-fb7403f3f895	3262	Prevorje
00050000-5665-491b-095e-f2ba2babd560	1276	Primskovo 
00050000-5665-491b-4d8a-13aed8e0cb6b	3253	Pristava pri Mestinju
00050000-5665-491b-ee93-e2cfb8161217	9207	Prosenjakovci/Partosfalva
00050000-5665-491b-9185-55e2472e488c	5297	Prvačina
00050000-5665-491b-9e3d-ae0c3ee7cf5e	2250	Ptuj
00050000-5665-491b-b23c-1e58cca54ba3	2323	Ptujska Gora
00050000-5665-491b-d2c2-475d6906e4a7	9201	Puconci
00050000-5665-491b-80b8-c226a1e7006b	2327	Rače
00050000-5665-491b-4a8d-a98eddf61ba6	1433	Radeče
00050000-5665-491b-040d-b44b30853ffc	9252	Radenci
00050000-5665-491b-9bde-b97b57e24a85	2360	Radlje ob Dravi
00050000-5665-491b-2c1a-1d2285954aa6	1235	Radomlje
00050000-5665-491b-3544-c317195165aa	4240	Radovljica
00050000-5665-491b-64ad-c5e8c992b184	8274	Raka
00050000-5665-491b-2a2b-aecbe50cc206	1381	Rakek
00050000-5665-491b-2fa6-53d7dc417434	4283	Rateče - Planica
00050000-5665-491b-c78d-86d2d3eafdd3	2390	Ravne na Koroškem
00050000-5665-491b-42e9-c65f5e81f713	9246	Razkrižje
00050000-5665-491b-80fc-d80e3260792e	3332	Rečica ob Savinji
00050000-5665-491b-8ae8-f3dfd06030b6	5292	Renče
00050000-5665-491b-df11-1bfb4877e40d	1310	Ribnica
00050000-5665-491b-6f34-ff6b79208582	2364	Ribnica na Pohorju
00050000-5665-491b-e49f-f8d45f472213	3272	Rimske Toplice
00050000-5665-491b-9506-598284e589ba	1314	Rob
00050000-5665-491b-396b-42af1742d703	5215	Ročinj
00050000-5665-491b-36de-a9cfbd9d1c8b	3250	Rogaška Slatina
00050000-5665-491b-7bc2-9ae0b5166472	9262	Rogašovci
00050000-5665-491b-1dff-cc613ef2dcbd	3252	Rogatec
00050000-5665-491b-cf77-586210ca23cc	1373	Rovte
00050000-5665-491b-9e65-ae1cae9f702b	2342	Ruše
00050000-5665-491b-fa0c-283eab13ce46	1282	Sava
00050000-5665-491b-13d3-72079450f90d	6333	Sečovlje/Sicciole
00050000-5665-491b-de64-0adf374818cc	4227	Selca
00050000-5665-491b-94ee-37e1c5e1038d	2352	Selnica ob Dravi
00050000-5665-491b-89ac-273974ed1a81	8333	Semič
00050000-5665-491b-0f68-a6e14b35de8e	8281	Senovo
00050000-5665-491b-6b2b-a0892ac84d2e	6224	Senožeče
00050000-5665-491b-7f5f-a2a95e0d404c	8290	Sevnica
00050000-5665-491b-32e8-9244b88a5919	6210	Sežana
00050000-5665-491b-8581-f323d9901bb0	2214	Sladki Vrh
00050000-5665-491b-b3c9-5f00980f3c92	5283	Slap ob Idrijci
00050000-5665-491b-63fe-238e13563974	2380	Slovenj Gradec
00050000-5665-491b-76f8-d1d26d1b668e	2310	Slovenska Bistrica
00050000-5665-491b-1d75-0ef4cc4f3050	3210	Slovenske Konjice
00050000-5665-491b-7d0d-218f2e2ff20b	1216	Smlednik
00050000-5665-491b-030c-6c7ffbc8d2da	5232	Soča
00050000-5665-491b-ecea-e1ab817dd001	1317	Sodražica
00050000-5665-491b-b695-5a72e6741d12	3335	Solčava
00050000-5665-491b-3447-6a7785a314c3	5250	Solkan
00050000-5665-491b-eb50-8cf5e5938031	4229	Sorica
00050000-5665-491b-64be-bc63170f1fb0	4225	Sovodenj
00050000-5665-491b-0548-adf60dbba17f	5281	Spodnja Idrija
00050000-5665-491b-201e-6b38f7ec5e70	2241	Spodnji Duplek
00050000-5665-491b-881a-35e10c201c26	9245	Spodnji Ivanjci
00050000-5665-491b-4ade-928413c89ed9	2277	Središče ob Dravi
00050000-5665-491b-7caa-459b5b148c10	4267	Srednja vas v Bohinju
00050000-5665-491b-1601-ba2c583598f7	8256	Sromlje 
00050000-5665-491b-c84b-b136b588511e	5224	Srpenica
00050000-5665-491b-19d3-fb4463ba4c51	1242	Stahovica
00050000-5665-491b-5452-b156617f42ee	1332	Stara Cerkev
00050000-5665-491b-d65b-cdc856fd6cfa	8342	Stari trg ob Kolpi
00050000-5665-491b-e278-865a9acb4f0a	1386	Stari trg pri Ložu
00050000-5665-491b-0bd6-15a5754610af	2205	Starše
00050000-5665-491b-5f38-b6e1a766cc43	2289	Stoperce
00050000-5665-491b-f3a5-ca9b1d9df98a	8322	Stopiče
00050000-5665-491b-e558-20e3ef9eaa1f	3206	Stranice
00050000-5665-491b-2191-5a62788426c0	8351	Straža
00050000-5665-491b-5db2-5a6517447af0	1313	Struge
00050000-5665-491b-71f4-efb9a6f94eea	8293	Studenec
00050000-5665-491b-fb89-d72cb091281d	8331	Suhor
00050000-5665-491b-be80-b15206ac5bac	2233	Sv. Ana v Slovenskih goricah
00050000-5665-491b-39b2-96be2bdc5731	2235	Sv. Trojica v Slovenskih goricah
00050000-5665-491b-8e70-e6d7c05b5143	2353	Sveti Duh na Ostrem Vrhu
00050000-5665-491b-6d0f-264b6cfaac6a	9244	Sveti Jurij ob Ščavnici
00050000-5665-491b-226c-01a4bae494dc	3264	Sveti Štefan
00050000-5665-491b-d871-9ab253bd5e2d	2258	Sveti Tomaž
00050000-5665-491b-9984-d2f8edd19c19	9204	Šalovci
00050000-5665-491b-047d-987b591d055d	5261	Šempas
00050000-5665-491b-cb6e-f32918982602	5290	Šempeter pri Gorici
00050000-5665-491b-e0e6-aaa51bd30638	3311	Šempeter v Savinjski dolini
00050000-5665-491b-8d93-5ea695f8a0fb	4208	Šenčur
00050000-5665-491b-d5ff-03b63ccf813d	2212	Šentilj v Slovenskih goricah
00050000-5665-491b-b453-622d3ef6815a	8297	Šentjanž
00050000-5665-491b-135a-2eea6050e95a	2373	Šentjanž pri Dravogradu
00050000-5665-491b-4669-43d927ae2ca5	8310	Šentjernej
00050000-5665-491b-65f8-33d4490afea6	3230	Šentjur
00050000-5665-491b-afe6-dbec34f648f8	3271	Šentrupert
00050000-5665-491b-53c6-6100df381e7e	8232	Šentrupert
00050000-5665-491b-cc30-13afba25c5eb	1296	Šentvid pri Stični
00050000-5665-491b-64e3-2da77c2e8d6a	8275	Škocjan
00050000-5665-491b-63c7-8332048aedde	6281	Škofije
00050000-5665-491b-3f7b-a977eb8e4816	4220	Škofja Loka
00050000-5665-491b-c7ea-7477bf3fdd87	3211	Škofja vas
00050000-5665-491b-66ef-c3aad1b495ae	1291	Škofljica
00050000-5665-491b-0521-b49ad3339a2b	6274	Šmarje
00050000-5665-491b-c3aa-795c5bb0f5c1	1293	Šmarje - Sap
00050000-5665-491b-62b5-d974d46706a9	3240	Šmarje pri Jelšah
00050000-5665-491b-3dcd-f9ca0cd03b27	8220	Šmarješke Toplice
00050000-5665-491b-c40d-a8d9794da10d	2315	Šmartno na Pohorju
00050000-5665-491b-7ac1-605f175e1855	3341	Šmartno ob Dreti
00050000-5665-491b-6f3b-cb4312fe8f03	3327	Šmartno ob Paki
00050000-5665-491b-58aa-01a754fd6a87	1275	Šmartno pri Litiji
00050000-5665-491b-3514-deca2810c2f8	2383	Šmartno pri Slovenj Gradcu
00050000-5665-491b-83cc-5369a2049c78	3201	Šmartno v Rožni dolini
00050000-5665-491b-68ab-e29a503346a2	3325	Šoštanj
00050000-5665-491b-75b2-73ccc75c14de	6222	Štanjel
00050000-5665-491b-839b-c8a60babea9f	3220	Štore
00050000-5665-491b-cecb-a6b551f327f0	3304	Tabor
00050000-5665-491b-f0c1-94a76b2a216a	3221	Teharje
00050000-5665-491b-c464-dbb538c62cf7	9251	Tišina
00050000-5665-491b-9e38-074ad5623472	5220	Tolmin
00050000-5665-491b-472d-36e76f9bf6f1	3326	Topolšica
00050000-5665-491b-b0e2-817a5043c32b	2371	Trbonje
00050000-5665-491b-c7bf-c42020521c72	1420	Trbovlje
00050000-5665-491b-65f1-f92eb63e408b	8231	Trebelno 
00050000-5665-491b-0064-8218ec728780	8210	Trebnje
00050000-5665-491b-046c-8d4cf0df264c	5252	Trnovo pri Gorici
00050000-5665-491b-1e21-6ff584698723	2254	Trnovska vas
00050000-5665-491b-af66-ffd2fffde23a	1222	Trojane
00050000-5665-491b-70c9-b50134057fd7	1236	Trzin
00050000-5665-491b-bac4-b662274f2e4c	4290	Tržič
00050000-5665-491b-e1c6-c67c463658bb	8295	Tržišče
00050000-5665-491b-ffa7-2bcdeecf1b36	1311	Turjak
00050000-5665-491b-bf84-b55d71f8f8e6	9224	Turnišče
00050000-5665-491b-961c-a0f7c647ddf1	8323	Uršna sela
00050000-5665-491b-682b-a7584211d228	1252	Vače
00050000-5665-491b-f392-438dfd98a214	3320	Velenje 
00050000-5665-491b-1b3c-52e6caba53fe	3322	Velenje - poštni predali
00050000-5665-491b-584a-2d0cb067e096	8212	Velika Loka
00050000-5665-491b-19d9-8ef9ae14a3d0	2274	Velika Nedelja
00050000-5665-491b-38cb-f27fff73d917	9225	Velika Polana
00050000-5665-491b-7dd4-3b64232dfd2f	1315	Velike Lašče
00050000-5665-491b-d4b6-db6f02f42946	8213	Veliki Gaber
00050000-5665-491b-c5c4-cffcdc8b4b83	9241	Veržej
00050000-5665-491b-7723-da787af52747	1312	Videm - Dobrepolje
00050000-5665-491b-277d-c3b05919dd0f	2284	Videm pri Ptuju
00050000-5665-491b-196e-427af9067805	8344	Vinica
00050000-5665-491b-4412-358d6e18068a	5271	Vipava
00050000-5665-491b-0a52-dc69ecb9a35f	4212	Visoko
00050000-5665-491b-a2ba-f5dcbdbb7fe3	1294	Višnja Gora
00050000-5665-491b-c15a-2652484821c6	3205	Vitanje
00050000-5665-491b-8633-d4da7931e8b2	2255	Vitomarci
00050000-5665-491b-d558-8b2d3accf58d	1217	Vodice
00050000-5665-491b-24fe-4bd2ea59a584	3212	Vojnik\t
00050000-5665-491b-c0b0-d7fd00882b30	5293	Volčja Draga
00050000-5665-491b-608d-47310a74773b	2232	Voličina
00050000-5665-491b-d0e2-5d03ad5a085f	3305	Vransko
00050000-5665-491b-9837-596be51f25c0	6217	Vremski Britof
00050000-5665-491b-b368-f750cc157a19	1360	Vrhnika
00050000-5665-491b-2c86-68b180c2e742	2365	Vuhred
00050000-5665-491b-26a2-cd24d5920141	2367	Vuzenica
00050000-5665-491b-5564-92895e25fa48	8292	Zabukovje 
00050000-5665-491b-c8a5-a3e4f865ed97	1410	Zagorje ob Savi
00050000-5665-491b-0c27-5ee66099b9d7	1303	Zagradec
00050000-5665-491b-d433-9c352c3bfb2d	2283	Zavrč
00050000-5665-491b-353d-9f943814b5d3	8272	Zdole 
00050000-5665-491b-15e7-897d7c03b006	4201	Zgornja Besnica
00050000-5665-491b-0009-a64016270eb4	2242	Zgornja Korena
00050000-5665-491b-2203-8f7849dbac7b	2201	Zgornja Kungota
00050000-5665-491b-4fc9-01285681a0fc	2316	Zgornja Ložnica
00050000-5665-491b-bf95-d3cea78006eb	2314	Zgornja Polskava
00050000-5665-491b-122c-667ee81a33f3	2213	Zgornja Velka
00050000-5665-491b-1d2c-50c6d0b0155b	4247	Zgornje Gorje
00050000-5665-491b-1990-2faadc9e9f05	4206	Zgornje Jezersko
00050000-5665-491b-c35e-432ea6cf6a67	2285	Zgornji Leskovec
00050000-5665-491b-0498-93582a2f824c	1432	Zidani Most
00050000-5665-491b-a5c7-dc37a237c5ca	3214	Zreče
00050000-5665-491b-af80-2dfe37d72a16	4209	Žabnica
00050000-5665-491b-9935-4a55365a9c08	3310	Žalec
00050000-5665-491b-05b3-9d3a3fb54b57	4228	Železniki
00050000-5665-491b-32bf-ef070c6e757d	2287	Žetale
00050000-5665-491b-ac7f-20a35e00b4fb	4226	Žiri
00050000-5665-491b-0110-290836548623	4274	Žirovnica
00050000-5665-491b-1f4c-d19a20118e90	8360	Žužemberk
\.


--
-- TOC entry 3164 (class 0 OID 30913749)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30913324)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30913072)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5665-491e-a2ef-8832b92165d8	00080000-5665-491e-f6f8-065c5fbb5ec8	\N	00040000-5665-491c-3911-ffb35619fd27	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5665-491e-2b75-4d5529ab5fbb	00080000-5665-491e-f6f8-065c5fbb5ec8	\N	00040000-5665-491c-3911-ffb35619fd27	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5665-491e-c35c-7e48d59a525f	00080000-5665-491e-d17d-2bd842217e42	\N	00040000-5665-491c-3911-ffb35619fd27	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3126 (class 0 OID 30913216)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5665-491c-175e-aa0004da3adb	novo leto	1	1	\N	t
00430000-5665-491c-0062-88817b5898ee	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5665-491c-a207-c69aabdb7ecd	dan upora proti okupatorju	27	4	\N	t
00430000-5665-491c-38e3-3156507adb23	praznik dela	1	5	\N	t
00430000-5665-491c-2374-49f3e015b3d0	praznik dela	2	5	\N	t
00430000-5665-491c-c83a-818ad8a4deb0	dan Primoža Trubarja	8	6	\N	f
00430000-5665-491c-3ed3-14dbd8e6e93b	dan državnosti	25	6	\N	t
00430000-5665-491c-3f6a-8ba3e36efbcc	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5665-491c-ba1a-0c433b2396c4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5665-491c-1be0-737998b699a6	dan suverenosti	25	10	\N	f
00430000-5665-491c-401a-bd7f1c7794dc	dan spomina na mrtve	1	11	\N	t
00430000-5665-491c-bc6d-c6a22cceeac9	dan Rudolfa Maistra	23	11	\N	f
00430000-5665-491c-58a1-34d5ec01615f	božič	25	12	\N	t
00430000-5665-491c-3411-7be49baf8e04	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5665-491c-8e3b-3cc09612a2b8	Marijino vnebovzetje	15	8	\N	t
00430000-5665-491c-e1d0-3626f55f8354	dan reformacije	31	10	\N	t
00430000-5665-491c-f687-c856870feb5d	velikonočna nedelja	27	3	2016	t
00430000-5665-491c-ce41-a23ebfb61a4c	velikonočna nedelja	16	4	2017	t
00430000-5665-491c-2ca6-8268e6289bdd	velikonočna nedelja	1	4	2018	t
00430000-5665-491c-645d-935885b5c460	velikonočna nedelja	21	4	2019	t
00430000-5665-491c-5d75-1b9e6dc8f36c	velikonočna nedelja	12	4	2020	t
00430000-5665-491c-83cd-8b9a18f5b105	velikonočna nedelja	4	4	2021	t
00430000-5665-491c-339e-daf4612d7a99	velikonočna nedelja	17	4	2022	t
00430000-5665-491c-b1d2-326a57a98bab	velikonočna nedelja	9	4	2023	t
00430000-5665-491c-a6d9-31a3d729858e	velikonočna nedelja	31	3	2024	t
00430000-5665-491c-47a3-5862e4b4d91a	velikonočna nedelja	20	4	2025	t
00430000-5665-491c-4995-4d7a0a3ee795	velikonočna nedelja	5	4	2026	t
00430000-5665-491c-1698-268e7cbbd4c4	velikonočna nedelja	28	3	2027	t
00430000-5665-491c-fcf3-f4077dcce4ce	velikonočna nedelja	16	4	2028	t
00430000-5665-491c-569b-d1fec217cd20	velikonočna nedelja	1	4	2029	t
00430000-5665-491c-d815-a277ba334058	velikonočna nedelja	21	4	2030	t
00430000-5665-491c-41bd-3ece8611a2cc	velikonočni ponedeljek	28	3	2016	t
00430000-5665-491c-df32-0ea7f96ab10c	velikonočni ponedeljek	17	4	2017	t
00430000-5665-491c-149f-65c12368650a	velikonočni ponedeljek	2	4	2018	t
00430000-5665-491c-6ccd-7f18eee0a904	velikonočni ponedeljek	22	4	2019	t
00430000-5665-491c-143e-5d378dd6ff2e	velikonočni ponedeljek	13	4	2020	t
00430000-5665-491c-51eb-b27e16077758	velikonočni ponedeljek	5	4	2021	t
00430000-5665-491c-864a-8555e092a515	velikonočni ponedeljek	18	4	2022	t
00430000-5665-491c-517e-a8e261e865ce	velikonočni ponedeljek	10	4	2023	t
00430000-5665-491c-5707-f70dea3dc1c3	velikonočni ponedeljek	1	4	2024	t
00430000-5665-491c-4fab-1885dbbb1ccf	velikonočni ponedeljek	21	4	2025	t
00430000-5665-491c-9da9-860dd9c3c34a	velikonočni ponedeljek	6	4	2026	t
00430000-5665-491c-3dd1-0d364fbbf484	velikonočni ponedeljek	29	3	2027	t
00430000-5665-491c-6790-14463154392c	velikonočni ponedeljek	17	4	2028	t
00430000-5665-491c-8e3b-e0694f27a4a5	velikonočni ponedeljek	2	4	2029	t
00430000-5665-491c-981b-50c5d721e7d9	velikonočni ponedeljek	22	4	2030	t
00430000-5665-491c-1aad-8dd09689e197	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5665-491c-f7a6-b2891eefaecb	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5665-491c-2bf0-0cea83a89ab2	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5665-491c-c645-e4b7f403eaee	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5665-491c-19c6-0568e55b60ad	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5665-491c-64c8-743e0ebbdbd4	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5665-491c-0e07-92bd44002f03	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5665-491c-9dc1-c8d85e2021bc	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5665-491c-c154-23d9d0e07bbe	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5665-491c-224d-da8ca9b5b88a	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5665-491c-3530-efd24eda48a8	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5665-491c-8369-5341e0574ccb	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5665-491c-7dda-95faf1760838	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5665-491c-1c39-25872e7090f2	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5665-491c-5ed4-11eebb290726	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3122 (class 0 OID 30913176)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3123 (class 0 OID 30913188)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 30913336)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 30913763)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 30913773)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5665-491e-74f6-93d4265ad758	00080000-5665-491e-f787-9c643fabc379	0987	AK
00190000-5665-491e-17a4-26e167be7d6a	00080000-5665-491e-d17d-2bd842217e42	0989	AK
00190000-5665-491e-64ac-d6147aba2b34	00080000-5665-491e-cfdd-d583fa8a30f4	0986	AK
00190000-5665-491e-f792-996c886aab4d	00080000-5665-491e-e58d-5e47375636d2	0984	AK
00190000-5665-491e-c039-6bae08b09007	00080000-5665-491e-d4b1-9b9abc5d3546	0983	AK
00190000-5665-491e-451e-748e1c29d12f	00080000-5665-491e-6806-84a8c624b7ac	0982	AK
00190000-5665-4920-a4bf-f54672012d9e	00080000-5665-4920-e963-b6f613e22128	1001	AK
\.


--
-- TOC entry 3163 (class 0 OID 30913672)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5665-491f-7bd3-312c89446158	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3167 (class 0 OID 30913781)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30913365)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5665-491e-e3b8-ab14de772523	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5665-491e-3ce1-694232a3ee2f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5665-491e-27c8-85279014b9f6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5665-491e-dc4a-ac38a574269b	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5665-491e-a5f5-b14cb3ada13d	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5665-491e-f0ff-faeabcd066f9	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5665-491e-0a33-d36a2f730176	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3135 (class 0 OID 30913309)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 30913299)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30913510)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 30913440)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3120 (class 0 OID 30913150)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3099 (class 0 OID 30912911)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5665-4920-e963-b6f613e22128	00010000-5665-491c-4e2d-acb93f693530	2015-12-07 09:53:52	INS	a:0:{}
2	App\\Entity\\Option	00000000-5665-4920-61cf-bfa1e050c0e0	00010000-5665-491c-4e2d-acb93f693530	2015-12-07 09:53:52	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5665-4920-a4bf-f54672012d9e	00010000-5665-491c-4e2d-acb93f693530	2015-12-07 09:53:52	INS	a:0:{}
\.


--
-- TOC entry 3188 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3144 (class 0 OID 30913378)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3103 (class 0 OID 30912949)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5665-491c-0725-fac0571cb370	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5665-491c-51ae-b724aae264cb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5665-491c-46fa-5426f13ae241	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5665-491c-77a2-d1d3de2ecc53	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5665-491c-bd3e-18ef208c2e3d	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5665-491c-e093-fd212aae8756	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5665-491c-8d36-5595430e1cbb	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5665-491c-2750-5cd0325b8cca	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5665-491c-2f06-1105d1d84715	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-491c-34db-c7160a3d5f39	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-491c-7f75-bd04d1f5092f	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-491c-fefa-cbf3650ca39f	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5665-491c-d796-21026b691fd4	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5665-491c-4cb9-5c69ef6855c0	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5665-491c-b08b-f9b375565735	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5665-491c-617e-cf0894ad2e53	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5665-491c-9e0c-7eea7c999c6e	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5665-491c-b494-5fbd7e56da5b	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5665-491c-b39e-fe8ad1354040	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5665-491c-4d5e-843129ce06a5	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5665-491c-ea20-211fa5009d48	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5665-491c-5dd0-3ae9f94e9a4e	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5665-491c-ec40-3348564225bb	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5665-491c-d8d8-5c24d1454c9d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5665-491c-d055-7c20c4473215	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5665-491c-2cf6-be750738fa08	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5665-491c-1fa2-761d6ba5794c	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5665-491c-1686-52fcc34138a9	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5665-491c-7f2e-6b424120a6c6	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5665-491c-f871-2b269d053193	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5665-491c-732b-629263e44b16	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5665-491c-beea-2fae024e782f	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5665-491c-8ddc-e6454905c136	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5665-491c-734c-96172d1e5ac5	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5665-491c-32e4-6d8d33045def	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5665-491c-f34e-28075260608a	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5665-491c-fbfa-b66b0620649a	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5665-491c-652e-1e22cd085fd8	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5665-491c-22d8-e87a5a33f187	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5665-491c-34f6-7e1697d03182	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5665-491c-ed2b-9f5063110fab	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5665-491c-f05f-1aa5de61b290	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5665-491c-b2a6-289ed6ae3544	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5665-491c-b04b-78831f71d1c8	arhivar	arhivar	t
00020000-5665-491e-00bc-4ecb45c9d28b	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5665-491e-df1f-320d58cbad99	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-113e-774ab0810ec1	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-88cd-51aaf8c719f3	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-ce5c-6f62b46932a2	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-f4c9-7283fba05dd5	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-03fc-96e1aa1b3676	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-a57b-ad5f07cc2df9	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5665-491e-7021-204e4eac6383	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5665-491e-5c5a-f1df0b691448	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-3912-2db5a9ed351c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-623f-c7780593e730	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-1b13-df074e159d49	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-fd0b-439eed848e21	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-38a6-d1601eb9eb11	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-ab39-bcfdf9567c90	Oseba-vse	Vloga z 1 dovoljenjem	t
00020000-5665-491e-2cf2-404c7fe7ea8f	Oseba-readVse	Vloga z 1 dovoljenjem	t
00020000-5665-491e-f275-6004cc470024	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-c9cf-70882c3428b9	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-7685-12b4bc879441	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5665-491e-b74f-702d3d9a76cc	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5665-491e-8ee7-4f6262a594a3	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5665-491e-bdd6-fbc60f041a2d	Stevilcenje-write	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3101 (class 0 OID 30912933)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5665-491c-bbb2-36557471b71a	00020000-5665-491c-46fa-5426f13ae241
00010000-5665-491c-4e2d-acb93f693530	00020000-5665-491c-46fa-5426f13ae241
00010000-5665-491e-bbc5-b08be9cedd85	00020000-5665-491e-00bc-4ecb45c9d28b
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-df1f-320d58cbad99
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-f4c9-7283fba05dd5
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-5c5a-f1df0b691448
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-623f-c7780593e730
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-fd0b-439eed848e21
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-c9cf-70882c3428b9
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-88cd-51aaf8c719f3
00010000-5665-491e-8a03-0c155164b58e	00020000-5665-491e-b74f-702d3d9a76cc
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-df1f-320d58cbad99
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-113e-774ab0810ec1
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-88cd-51aaf8c719f3
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-ce5c-6f62b46932a2
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-fd0b-439eed848e21
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-2cf2-404c7fe7ea8f
00010000-5665-491e-95e7-075d9f075ea6	00020000-5665-491e-b74f-702d3d9a76cc
00010000-5665-491e-ad01-a059c2d58a7a	00020000-5665-491e-df1f-320d58cbad99
00010000-5665-491e-ad01-a059c2d58a7a	00020000-5665-491e-113e-774ab0810ec1
00010000-5665-491e-ad01-a059c2d58a7a	00020000-5665-491e-88cd-51aaf8c719f3
00010000-5665-491e-ad01-a059c2d58a7a	00020000-5665-491e-ce5c-6f62b46932a2
00010000-5665-491e-ad01-a059c2d58a7a	00020000-5665-491e-623f-c7780593e730
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-113e-774ab0810ec1
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-03fc-96e1aa1b3676
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-3912-2db5a9ed351c
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-1b13-df074e159d49
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-623f-c7780593e730
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-f275-6004cc470024
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-fd0b-439eed848e21
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-38a6-d1601eb9eb11
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-b74f-702d3d9a76cc
00010000-5665-491e-2b42-cec64f9b74cb	00020000-5665-491e-8ee7-4f6262a594a3
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-113e-774ab0810ec1
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-03fc-96e1aa1b3676
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-7021-204e4eac6383
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-3912-2db5a9ed351c
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-1b13-df074e159d49
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-623f-c7780593e730
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-f275-6004cc470024
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-fd0b-439eed848e21
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-38a6-d1601eb9eb11
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-ab39-bcfdf9567c90
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-b74f-702d3d9a76cc
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-8ee7-4f6262a594a3
00010000-5665-491e-a734-2db616a1ee69	00020000-5665-491e-bdd6-fbc60f041a2d
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-113e-774ab0810ec1
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-88cd-51aaf8c719f3
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-03fc-96e1aa1b3676
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-a57b-ad5f07cc2df9
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-7021-204e4eac6383
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-f4c9-7283fba05dd5
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-3912-2db5a9ed351c
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-1b13-df074e159d49
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-623f-c7780593e730
00010000-5665-491e-0c1d-0d5e65e02384	00020000-5665-491e-f275-6004cc470024
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-df1f-320d58cbad99
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-ce5c-6f62b46932a2
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-f4c9-7283fba05dd5
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-5c5a-f1df0b691448
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-623f-c7780593e730
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-fd0b-439eed848e21
00010000-5665-491e-b83c-baff3abc5c4e	00020000-5665-491e-c9cf-70882c3428b9
00010000-5665-491e-1d97-ace7e32dda21	00020000-5665-491e-7685-12b4bc879441
\.


--
-- TOC entry 3146 (class 0 OID 30913392)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 30913330)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30913276)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5665-491e-2fa2-98e9e0e3782c	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5665-491e-f1ed-5113fe749276	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5665-491e-a041-168c44254ee3	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3097 (class 0 OID 30912898)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5665-491c-df10-9612507a996f	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5665-491c-77c7-587619a876a5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5665-491c-5f56-a9bb43e6ed39	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5665-491c-72f6-57a0e713a2bc	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5665-491c-5ae3-11ea1142da05	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3096 (class 0 OID 30912890)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5665-491c-e1f1-b41de848acb3	00230000-5665-491c-72f6-57a0e713a2bc	popa
00240000-5665-491c-2909-ec16c7f3c1a5	00230000-5665-491c-72f6-57a0e713a2bc	oseba
00240000-5665-491c-8a26-d745ce22382f	00230000-5665-491c-72f6-57a0e713a2bc	tippopa
00240000-5665-491c-eb24-11360e69ca39	00230000-5665-491c-72f6-57a0e713a2bc	organizacijskaenota
00240000-5665-491c-2ac8-0582969a58f8	00230000-5665-491c-72f6-57a0e713a2bc	sezona
00240000-5665-491c-2333-9c56c16ac80f	00230000-5665-491c-72f6-57a0e713a2bc	tipvaje
00240000-5665-491c-30b5-bc4905653f0d	00230000-5665-491c-77c7-587619a876a5	prostor
00240000-5665-491c-f858-a6728ec92d59	00230000-5665-491c-72f6-57a0e713a2bc	besedilo
00240000-5665-491c-27b6-f6efa41da5d3	00230000-5665-491c-72f6-57a0e713a2bc	uprizoritev
00240000-5665-491c-203a-fb58d992bb21	00230000-5665-491c-72f6-57a0e713a2bc	funkcija
00240000-5665-491c-caf8-1104746544bb	00230000-5665-491c-72f6-57a0e713a2bc	tipfunkcije
00240000-5665-491c-5123-177a22b635a1	00230000-5665-491c-72f6-57a0e713a2bc	alternacija
00240000-5665-491c-ecc8-f0df0bb49dc6	00230000-5665-491c-df10-9612507a996f	pogodba
00240000-5665-491c-b37a-e6ccc8903790	00230000-5665-491c-72f6-57a0e713a2bc	zaposlitev
00240000-5665-491c-16d0-688c6796e4d7	00230000-5665-491c-72f6-57a0e713a2bc	zvrstuprizoritve
00240000-5665-491c-c602-6595d2d39251	00230000-5665-491c-df10-9612507a996f	programdela
00240000-5665-491c-6a18-df003851cc6c	00230000-5665-491c-72f6-57a0e713a2bc	zapis
\.


--
-- TOC entry 3095 (class 0 OID 30912885)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
6c3b4d19-7c4e-479d-9264-f3d3211151f6	00240000-5665-491c-e1f1-b41de848acb3	0	1001
\.


--
-- TOC entry 3152 (class 0 OID 30913457)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5665-491f-ca86-2291291e75ae	000e0000-5665-491f-778b-f566463c3b44	00080000-5665-491e-f6f8-065c5fbb5ec8	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5665-491c-e1fb-3f66e35e1ad3
00270000-5665-491f-d2fc-506787ca62ec	000e0000-5665-491f-778b-f566463c3b44	00080000-5665-491e-f6f8-065c5fbb5ec8	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5665-491c-e1fb-3f66e35e1ad3
\.


--
-- TOC entry 3111 (class 0 OID 30913034)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 30913286)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5665-491f-33ae-4048b874a667	00180000-5665-491f-a9c3-c97d4d7c8def	000c0000-5665-491f-35b2-8b776ee6f2e5	00090000-5665-491e-b9a0-2a29b96abab8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-491f-08d3-87437cd90be2	00180000-5665-491f-a9c3-c97d4d7c8def	000c0000-5665-491f-df1e-8e746ed3cf89	00090000-5665-491e-d85f-772fef0a3534	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-491f-4831-905705087010	00180000-5665-491f-a9c3-c97d4d7c8def	000c0000-5665-491f-2fbf-139ab644dc22	00090000-5665-491e-ce79-eb0cb435494b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-491f-4f54-92e1c097aa25	00180000-5665-491f-a9c3-c97d4d7c8def	000c0000-5665-491f-3ce5-bb36e90a801e	00090000-5665-491e-2e39-678258ca8b5f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-491f-b83b-249479aa7a8d	00180000-5665-491f-a9c3-c97d4d7c8def	000c0000-5665-491f-bfc2-1b35001f4729	00090000-5665-491e-63f8-31a5fe03c00c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5665-491f-c285-f269ac645e91	00180000-5665-491f-e58c-713f305d8694	\N	00090000-5665-491e-63f8-31a5fe03c00c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5665-491f-9928-a8ba5fd9bd51	00180000-5665-491f-e58c-713f305d8694	\N	00090000-5665-491e-d85f-772fef0a3534	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3155 (class 0 OID 30913498)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5665-491c-bc5f-21efc4bc124e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5665-491c-c1ee-45e8854b2547	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5665-491c-c91d-25ffc936cfc9	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5665-491c-2c9c-5d8cefa46d4f	04	Režija	Režija	Režija	umetnik	30
000f0000-5665-491c-a077-97143ec56b2a	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5665-491c-95b8-494642e8a8fb	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5665-491c-0588-a559db22fa3d	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5665-491c-0ce7-b692e48e809c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5665-491c-f210-1e9c680e59af	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5665-491c-911e-32ebb93d8b44	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5665-491c-ce82-270e9dca7476	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5665-491c-dc91-a51bae06aeed	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5665-491c-b4df-04f0e014c674	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5665-491c-c957-1640efe501b9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5665-491c-aabe-0029297d6b58	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5665-491c-a8fa-1d06170982dc	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5665-491c-05e1-49a735262b63	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5665-491c-f02c-0b30a5c1305a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3108 (class 0 OID 30912984)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5665-491e-35b2-b80b8c06421b	0001	šola	osnovna ali srednja šola
00400000-5665-491e-d74f-ffa249fdd5fc	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5665-491e-cca2-ebcb331c4156	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3168 (class 0 OID 30913793)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5665-491c-46d2-62f128ba9c34	01	Velika predstava	f	1.00	1.00
002b0000-5665-491c-8aef-157c7242a250	02	Mala predstava	f	0.50	0.50
002b0000-5665-491c-e90c-548e2d4a6a59	03	Mala koprodukcija	t	0.40	1.00
002b0000-5665-491c-6a02-b38cef83d265	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5665-491c-dd21-77eb6e365f8e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3131 (class 0 OID 30913266)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5665-491c-a34a-554e95ae4ddf	0001	prva vaja	prva vaja
00420000-5665-491c-f61e-b66b823690af	0002	tehnična vaja	tehnična vaja
00420000-5665-491c-e3d5-2887c12f27d0	0003	lučna vaja	lučna vaja
00420000-5665-491c-d7f4-748f973e3cd5	0004	kostumska vaja	kostumska vaja
00420000-5665-491c-e310-caf3c1fdbd8b	0005	foto vaja	foto vaja
00420000-5665-491c-0a86-7aeadfe380c8	0006	1. glavna vaja	1. glavna vaja
00420000-5665-491c-34d9-e695a5c059d2	0007	2. glavna vaja	2. glavna vaja
00420000-5665-491c-e174-197e1b48cc7d	0008	1. generalka	1. generalka
00420000-5665-491c-3cf5-b76e86e7f1d4	0009	2. generalka	2. generalka
00420000-5665-491c-839e-11568e1aea47	0010	odprta generalka	odprta generalka
00420000-5665-491c-10e4-d3a5ff961ed5	0011	obnovitvena vaja	obnovitvena vaja
00420000-5665-491c-9e20-c85c3aac59f1	0012	pevska vaja	pevska vaja
00420000-5665-491c-abc9-5b10a3b9ae65	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5665-491c-6fd7-129d2163940f	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3117 (class 0 OID 30913107)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 30912920)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5665-491c-4e2d-acb93f693530	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROZcsGPyYwFGQQphN1Mfu7gbOydickNIG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5665-491e-79fa-25370c7eead6	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5665-491e-1303-be327c5c6155	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5665-491e-e34d-828f6bc77fae	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5665-491e-cb13-458f42b0c5c5	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5665-491e-1f67-019d6dc08911	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5665-491e-c4c8-7647ec2dfecf	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5665-491e-6a51-a7e0379b4cf7	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5665-491e-0df7-dca6e0bd7885	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5665-491e-7f19-ba927902229f	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5665-491e-bbc5-b08be9cedd85	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5665-491e-ab9f-92017e61bb9e	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5665-491e-8a03-0c155164b58e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5665-491e-95e7-075d9f075ea6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5665-491e-ad01-a059c2d58a7a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5665-491e-2b42-cec64f9b74cb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5665-491e-a734-2db616a1ee69	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5665-491e-0c1d-0d5e65e02384	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5665-491e-b83c-baff3abc5c4e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5665-491e-1d97-ace7e32dda21	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5665-491c-bbb2-36557471b71a	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3159 (class 0 OID 30913548)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5665-491f-a1c8-a27f294f8283	00160000-5665-491e-f08d-c07d223de7e4	\N	00140000-5665-491c-acb3-dc5933577949	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5665-491e-a5f5-b14cb3ada13d
000e0000-5665-491f-778b-f566463c3b44	00160000-5665-491e-c531-a0153ebd1151	\N	00140000-5665-491c-5935-f3ba82a1164e	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5665-491e-f0ff-faeabcd066f9
000e0000-5665-491f-f902-41e6c288b97e	\N	\N	00140000-5665-491c-5935-f3ba82a1164e	00190000-5665-491e-74f6-93d4265ad758	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5665-491e-a5f5-b14cb3ada13d
000e0000-5665-491f-9a19-0e2a2b2a48be	\N	\N	00140000-5665-491c-5935-f3ba82a1164e	00190000-5665-491e-74f6-93d4265ad758	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5665-491e-a5f5-b14cb3ada13d
000e0000-5665-491f-7ed6-59ff27abfe10	\N	\N	00140000-5665-491c-5935-f3ba82a1164e	00190000-5665-491e-74f6-93d4265ad758	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5665-491e-e3b8-ab14de772523
000e0000-5665-491f-a7ec-7cf15e2ddd4c	\N	\N	00140000-5665-491c-5935-f3ba82a1164e	00190000-5665-491e-74f6-93d4265ad758	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5665-491e-e3b8-ab14de772523
\.


--
-- TOC entry 3125 (class 0 OID 30913206)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5665-491f-0e2a-54f8b352c6f1	\N	000e0000-5665-491f-778b-f566463c3b44	1	
00200000-5665-491f-068a-23105589b26e	\N	000e0000-5665-491f-778b-f566463c3b44	2	
00200000-5665-491f-2809-9eb009241af8	\N	000e0000-5665-491f-778b-f566463c3b44	3	
00200000-5665-491f-fff3-5171af3c2c49	\N	000e0000-5665-491f-778b-f566463c3b44	4	
00200000-5665-491f-c73b-bd913b9c49c8	\N	000e0000-5665-491f-778b-f566463c3b44	5	
\.


--
-- TOC entry 3142 (class 0 OID 30913357)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 30913471)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5665-491c-4c9e-da03cf66903c	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5665-491c-2f36-8349ccb66d1a	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5665-491c-0839-380ec01b3ee5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5665-491c-2fda-9a67346c80aa	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5665-491c-aa01-11a736d21406	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5665-491c-d3f7-7833e93ddde4	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5665-491c-f952-a7145ae2941a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5665-491c-5345-d25a372e3b02	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5665-491c-e1fb-3f66e35e1ad3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5665-491c-584e-c087eba3ab33	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5665-491c-a41f-95c6ca877e96	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5665-491c-35b0-716bc8473eaa	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5665-491c-82b3-fae434e9afe9	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5665-491c-ab38-11e9346dcdb1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5665-491c-55c7-98dfcef23d66	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5665-491c-43dd-e27b4bf8ac0b	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5665-491c-16ad-ae8841da285e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5665-491c-ffda-8c8fbc5ba316	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5665-491c-6b91-2a7d9dc635e3	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5665-491c-5521-d0f0762d0e24	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5665-491c-826e-a0401754599b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5665-491c-0aca-20704c9f2d71	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5665-491c-915f-d48e6ed3070a	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5665-491c-ccfd-7753b5f2a051	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5665-491c-e59a-1b548f8fbbad	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5665-491c-ad62-d326c8d906a2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5665-491c-baa9-5e61380ab9e8	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5665-491c-d73a-3e240e442cf9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3171 (class 0 OID 30913843)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30913812)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 30913855)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 30913429)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5665-491e-59eb-fe40b3deecfc	00090000-5665-491e-d85f-772fef0a3534	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-491e-3c31-68a8ea86852b	00090000-5665-491e-ce79-eb0cb435494b	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-491e-ec7f-ed72e1c3a9d8	00090000-5665-491e-dae2-0042cb3292cd	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-491e-54b6-7814f5371d5d	00090000-5665-491e-6d79-168cbcf185fc	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-491e-8d6f-80be583aa8f2	00090000-5665-491e-a3d8-3ad87a86002e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5665-491e-f86b-2304b931b89f	00090000-5665-491e-9419-36fb83f79a72	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3128 (class 0 OID 30913250)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 30913538)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5665-491c-acb3-dc5933577949	01	Drama	drama (SURS 01)
00140000-5665-491c-62fb-03a187079668	02	Opera	opera (SURS 02)
00140000-5665-491c-605f-db3b801bafc7	03	Balet	balet (SURS 03)
00140000-5665-491c-ee9b-1c58b7d5fbac	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5665-491c-965a-ac0384227505	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5665-491c-5935-f3ba82a1164e	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5665-491c-29a7-5ae20c3a51ec	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3148 (class 0 OID 30913419)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2590 (class 2606 OID 30912983)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2809 (class 2606 OID 30913597)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2805 (class 2606 OID 30913587)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 30912974)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2768 (class 2606 OID 30913454)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 30913496)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2866 (class 2606 OID 30913896)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 30913238)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30913260)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30913265)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2842 (class 2606 OID 30913810)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 30913133)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 30913666)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 30913415)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 30913204)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2652 (class 2606 OID 30913171)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 30913147)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 30913322)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 30913873)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30913880)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2871 (class 2606 OID 30913904)
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
-- TOC entry 2728 (class 2606 OID 30913349)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 30913105)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2598 (class 2606 OID 30913003)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 30913067)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 30913030)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30912963)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2579 (class 2606 OID 30912948)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 30913355)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 30913391)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 30913533)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 30913058)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2625 (class 2606 OID 30913093)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 30913761)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30913328)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30913083)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30913223)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30913192)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2657 (class 2606 OID 30913184)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2726 (class 2606 OID 30913340)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30913770)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2832 (class 2606 OID 30913778)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2823 (class 2606 OID 30913748)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30913791)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 30913373)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30913313)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 30913304)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 30913520)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30913447)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 30913159)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30912919)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30913382)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 30912937)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2581 (class 2606 OID 30912957)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30913400)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 30913335)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 30913284)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2568 (class 2606 OID 30912907)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 30912895)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 30912889)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30913467)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 30913039)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 30913295)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 30913507)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 30912991)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2839 (class 2606 OID 30913803)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 30913273)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30913118)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 30912932)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30913566)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30913213)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 30913363)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30913479)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 30913853)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 30913837)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2856 (class 2606 OID 30913861)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 30913437)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30913254)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2795 (class 2606 OID 30913546)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 30913427)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 1259 OID 30913248)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2674 (class 1259 OID 30913249)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2675 (class 1259 OID 30913247)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2676 (class 1259 OID 30913246)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2677 (class 1259 OID 30913245)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2771 (class 1259 OID 30913468)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2772 (class 1259 OID 30913469)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2773 (class 1259 OID 30913470)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2857 (class 1259 OID 30913875)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2858 (class 1259 OID 30913874)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2608 (class 1259 OID 30913060)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2609 (class 1259 OID 30913061)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 30913356)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2844 (class 1259 OID 30913841)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2845 (class 1259 OID 30913840)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2846 (class 1259 OID 30913842)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2847 (class 1259 OID 30913839)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2848 (class 1259 OID 30913838)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2723 (class 1259 OID 30913342)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2724 (class 1259 OID 30913341)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2665 (class 1259 OID 30913214)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2666 (class 1259 OID 30913215)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2753 (class 1259 OID 30913416)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2754 (class 1259 OID 30913418)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2755 (class 1259 OID 30913417)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2640 (class 1259 OID 30913149)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2641 (class 1259 OID 30913148)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2835 (class 1259 OID 30913792)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2787 (class 1259 OID 30913535)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2788 (class 1259 OID 30913536)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2789 (class 1259 OID 30913537)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2854 (class 1259 OID 30913862)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2796 (class 1259 OID 30913571)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2797 (class 1259 OID 30913568)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2798 (class 1259 OID 30913572)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2799 (class 1259 OID 30913570)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2800 (class 1259 OID 30913569)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2630 (class 1259 OID 30913120)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 30913119)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2599 (class 1259 OID 30913033)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2741 (class 1259 OID 30913383)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2583 (class 1259 OID 30912964)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2584 (class 1259 OID 30912965)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2746 (class 1259 OID 30913403)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 30913402)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2748 (class 1259 OID 30913401)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2613 (class 1259 OID 30913070)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2614 (class 1259 OID 30913069)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2615 (class 1259 OID 30913071)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2653 (class 1259 OID 30913187)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2654 (class 1259 OID 30913185)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 30913186)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2563 (class 1259 OID 30912897)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2703 (class 1259 OID 30913308)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2704 (class 1259 OID 30913306)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2705 (class 1259 OID 30913305)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2706 (class 1259 OID 30913307)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2574 (class 1259 OID 30912938)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2575 (class 1259 OID 30912939)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2732 (class 1259 OID 30913364)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2867 (class 1259 OID 30913897)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2769 (class 1259 OID 30913456)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2770 (class 1259 OID 30913455)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2868 (class 1259 OID 30913905)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2869 (class 1259 OID 30913906)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2718 (class 1259 OID 30913329)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2763 (class 1259 OID 30913448)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2764 (class 1259 OID 30913449)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2817 (class 1259 OID 30913671)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2818 (class 1259 OID 30913670)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2819 (class 1259 OID 30913667)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2820 (class 1259 OID 30913668)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2821 (class 1259 OID 30913669)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2619 (class 1259 OID 30913085)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2620 (class 1259 OID 30913084)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2621 (class 1259 OID 30913086)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2735 (class 1259 OID 30913377)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2736 (class 1259 OID 30913376)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 30913771)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2828 (class 1259 OID 30913772)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2810 (class 1259 OID 30913601)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2811 (class 1259 OID 30913602)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2812 (class 1259 OID 30913599)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2813 (class 1259 OID 30913600)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2759 (class 1259 OID 30913438)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2760 (class 1259 OID 30913439)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2709 (class 1259 OID 30913317)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2710 (class 1259 OID 30913316)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2711 (class 1259 OID 30913314)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2712 (class 1259 OID 30913315)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2806 (class 1259 OID 30913589)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2807 (class 1259 OID 30913588)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2644 (class 1259 OID 30913160)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2647 (class 1259 OID 30913174)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2648 (class 1259 OID 30913173)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2649 (class 1259 OID 30913172)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2650 (class 1259 OID 30913175)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2664 (class 1259 OID 30913205)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2658 (class 1259 OID 30913193)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2659 (class 1259 OID 30913194)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2824 (class 1259 OID 30913762)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2843 (class 1259 OID 30913811)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2861 (class 1259 OID 30913881)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2862 (class 1259 OID 30913882)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2595 (class 1259 OID 30913005)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2596 (class 1259 OID 30913004)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2604 (class 1259 OID 30913040)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2605 (class 1259 OID 30913041)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2684 (class 1259 OID 30913255)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2698 (class 1259 OID 30913298)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2699 (class 1259 OID 30913297)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2700 (class 1259 OID 30913296)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2678 (class 1259 OID 30913240)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2679 (class 1259 OID 30913241)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2680 (class 1259 OID 30913244)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2681 (class 1259 OID 30913239)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2682 (class 1259 OID 30913243)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2683 (class 1259 OID 30913242)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2612 (class 1259 OID 30913059)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 30912992)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2594 (class 1259 OID 30912993)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2636 (class 1259 OID 30913134)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 30913136)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2638 (class 1259 OID 30913135)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2639 (class 1259 OID 30913137)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2717 (class 1259 OID 30913323)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2792 (class 1259 OID 30913534)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2801 (class 1259 OID 30913567)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2783 (class 1259 OID 30913508)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2784 (class 1259 OID 30913509)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2602 (class 1259 OID 30913031)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2603 (class 1259 OID 30913032)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2756 (class 1259 OID 30913428)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2569 (class 1259 OID 30912908)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2629 (class 1259 OID 30913106)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2618 (class 1259 OID 30913068)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2566 (class 1259 OID 30912896)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2840 (class 1259 OID 30913804)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2739 (class 1259 OID 30913375)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2740 (class 1259 OID 30913374)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2693 (class 1259 OID 30913274)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 30913275)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2814 (class 1259 OID 30913598)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 30913094)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2793 (class 1259 OID 30913547)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2851 (class 1259 OID 30913854)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2833 (class 1259 OID 30913779)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2834 (class 1259 OID 30913780)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2780 (class 1259 OID 30913497)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2697 (class 1259 OID 30913285)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2582 (class 1259 OID 30912958)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2906 (class 2606 OID 30914077)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2907 (class 2606 OID 30914082)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2912 (class 2606 OID 30914107)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2910 (class 2606 OID 30914097)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2905 (class 2606 OID 30914072)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2909 (class 2606 OID 30914092)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2911 (class 2606 OID 30914102)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2908 (class 2606 OID 30914087)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 30914277)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2947 (class 2606 OID 30914282)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 30914287)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 30914452)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2980 (class 2606 OID 30914447)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2883 (class 2606 OID 30913962)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2884 (class 2606 OID 30913967)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30914192)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2977 (class 2606 OID 30914432)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2976 (class 2606 OID 30914427)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 30914437)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 30914422)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2974 (class 2606 OID 30914417)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2928 (class 2606 OID 30914187)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2927 (class 2606 OID 30914182)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2903 (class 2606 OID 30914062)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2904 (class 2606 OID 30914067)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30914232)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2939 (class 2606 OID 30914242)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2938 (class 2606 OID 30914237)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2894 (class 2606 OID 30914017)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 30914012)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 30914172)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2972 (class 2606 OID 30914407)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 30914292)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2950 (class 2606 OID 30914297)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2951 (class 2606 OID 30914302)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2979 (class 2606 OID 30914442)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2955 (class 2606 OID 30914322)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2952 (class 2606 OID 30914307)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2956 (class 2606 OID 30914327)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 30914317)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 30914312)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2892 (class 2606 OID 30914007)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 30914002)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2880 (class 2606 OID 30913947)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2879 (class 2606 OID 30913942)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2933 (class 2606 OID 30914212)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2875 (class 2606 OID 30913922)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2876 (class 2606 OID 30913927)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2936 (class 2606 OID 30914227)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2935 (class 2606 OID 30914222)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 30914217)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2886 (class 2606 OID 30913977)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 30913972)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2887 (class 2606 OID 30913982)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2899 (class 2606 OID 30914042)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 30914032)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2898 (class 2606 OID 30914037)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2872 (class 2606 OID 30913907)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2920 (class 2606 OID 30914147)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2918 (class 2606 OID 30914137)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2917 (class 2606 OID 30914132)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2919 (class 2606 OID 30914142)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 30913912)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2874 (class 2606 OID 30913917)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2930 (class 2606 OID 30914197)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2984 (class 2606 OID 30914467)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2945 (class 2606 OID 30914272)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 30914267)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2985 (class 2606 OID 30914472)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2986 (class 2606 OID 30914477)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2926 (class 2606 OID 30914177)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2942 (class 2606 OID 30914257)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2943 (class 2606 OID 30914262)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2967 (class 2606 OID 30914382)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 30914377)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2963 (class 2606 OID 30914362)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 30914367)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2965 (class 2606 OID 30914372)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2889 (class 2606 OID 30913992)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 30913987)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 30913997)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2932 (class 2606 OID 30914207)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2931 (class 2606 OID 30914202)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2969 (class 2606 OID 30914392)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2970 (class 2606 OID 30914397)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2961 (class 2606 OID 30914352)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2962 (class 2606 OID 30914357)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2959 (class 2606 OID 30914342)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2960 (class 2606 OID 30914347)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2940 (class 2606 OID 30914247)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2941 (class 2606 OID 30914252)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 30914167)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2923 (class 2606 OID 30914162)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2921 (class 2606 OID 30914152)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2922 (class 2606 OID 30914157)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2958 (class 2606 OID 30914337)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 30914332)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2895 (class 2606 OID 30914022)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2896 (class 2606 OID 30914027)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2902 (class 2606 OID 30914057)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2900 (class 2606 OID 30914047)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2901 (class 2606 OID 30914052)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2968 (class 2606 OID 30914387)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2971 (class 2606 OID 30914402)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2973 (class 2606 OID 30914412)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2982 (class 2606 OID 30914457)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2983 (class 2606 OID 30914462)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2878 (class 2606 OID 30913937)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2877 (class 2606 OID 30913932)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2881 (class 2606 OID 30913952)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2882 (class 2606 OID 30913957)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2913 (class 2606 OID 30914112)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2916 (class 2606 OID 30914127)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2915 (class 2606 OID 30914122)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 30914117)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-07 09:53:54 CET

--
-- PostgreSQL database dump complete
--

