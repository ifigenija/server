--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-20 11:50:17 CET

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
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 38354950)
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
-- TOC entry 241 (class 1259 OID 38355568)
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
-- TOC entry 240 (class 1259 OID 38355552)
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
-- TOC entry 184 (class 1259 OID 38354943)
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
-- TOC entry 183 (class 1259 OID 38354941)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 38355429)
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
-- TOC entry 234 (class 1259 OID 38355459)
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
-- TOC entry 255 (class 1259 OID 38355871)
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
-- TOC entry 212 (class 1259 OID 38355265)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 38355191)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
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
-- TOC entry 206 (class 1259 OID 38355216)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 38355221)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 38355793)
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
-- TOC entry 196 (class 1259 OID 38355095)
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
-- TOC entry 242 (class 1259 OID 38355581)
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
-- TOC entry 227 (class 1259 OID 38355387)
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
-- TOC entry 202 (class 1259 OID 38355165)
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
-- TOC entry 199 (class 1259 OID 38355135)
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
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 38355112)
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
-- TOC entry 216 (class 1259 OID 38355301)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 38355851)
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
-- TOC entry 254 (class 1259 OID 38355864)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 38355886)
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
-- TOC entry 220 (class 1259 OID 38355326)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 38355069)
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
-- TOC entry 187 (class 1259 OID 38354969)
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
-- TOC entry 191 (class 1259 OID 38355036)
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
-- TOC entry 188 (class 1259 OID 38354980)
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
-- TOC entry 180 (class 1259 OID 38354915)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 38354934)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 38355333)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 38355367)
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
-- TOC entry 237 (class 1259 OID 38355500)
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
-- TOC entry 190 (class 1259 OID 38355016)
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
-- TOC entry 193 (class 1259 OID 38355061)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 38355737)
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
-- TOC entry 217 (class 1259 OID 38355307)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 38355046)
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
-- TOC entry 204 (class 1259 OID 38355183)
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
-- TOC entry 200 (class 1259 OID 38355150)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


--
-- TOC entry 201 (class 1259 OID 38355158)
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
-- TOC entry 219 (class 1259 OID 38355319)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 38355751)
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
-- TOC entry 246 (class 1259 OID 38355761)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 38355650)
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
-- TOC entry 247 (class 1259 OID 38355769)
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
-- TOC entry 223 (class 1259 OID 38355348)
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
-- TOC entry 215 (class 1259 OID 38355292)
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
-- TOC entry 214 (class 1259 OID 38355282)
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
-- TOC entry 236 (class 1259 OID 38355489)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 38355419)
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
-- TOC entry 198 (class 1259 OID 38355124)
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
-- TOC entry 177 (class 1259 OID 38354886)
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
-- TOC entry 176 (class 1259 OID 38354884)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 38355361)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 38354924)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 38354908)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 38355375)
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
-- TOC entry 218 (class 1259 OID 38355313)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 38355236)
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
-- TOC entry 175 (class 1259 OID 38354873)
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
-- TOC entry 174 (class 1259 OID 38354865)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 38354860)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 38355436)
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
-- TOC entry 189 (class 1259 OID 38355008)
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
-- TOC entry 211 (class 1259 OID 38355255)
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
    sodelujoc boolean,
    zasedenost boolean,
    virtzasedenost boolean
);


--
-- TOC entry 213 (class 1259 OID 38355272)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 38355477)
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
-- TOC entry 186 (class 1259 OID 38354959)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 38355781)
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
-- TOC entry 208 (class 1259 OID 38355226)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 38355081)
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
-- TOC entry 178 (class 1259 OID 38354895)
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
-- TOC entry 239 (class 1259 OID 38355527)
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
-- TOC entry 210 (class 1259 OID 38355246)
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
-- TOC entry 203 (class 1259 OID 38355176)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 38355340)
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
-- TOC entry 233 (class 1259 OID 38355450)
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
-- TOC entry 251 (class 1259 OID 38355831)
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
-- TOC entry 250 (class 1259 OID 38355800)
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
-- TOC entry 252 (class 1259 OID 38355843)
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
-- TOC entry 229 (class 1259 OID 38355412)
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
-- TOC entry 172 (class 1259 OID 37017863)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 238 (class 1259 OID 38355517)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 38355402)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 38354946)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 38354889)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3146 (class 0 OID 38354950)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-569f-6666-2ea2-dd4b8df34eee	10	30	Otroci	Abonma za otroke	200
000a0000-569f-6666-7eb9-783af41b28bc	20	60	Mladina	Abonma za mladino	400
000a0000-569f-6666-82a6-dc1d871083c8	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3202 (class 0 OID 38355568)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-569f-6666-9819-50f698be5ce9	000d0000-569f-6666-c064-d91e677d763f	\N	00090000-569f-6666-ea27-6b82c1985c5a	000b0000-569f-6666-89b6-e956d312bcdd	0001	f	\N	\N	\N	3	t	t	t
000c0000-569f-6666-2816-a8ae3682a02a	000d0000-569f-6666-48bc-691e499d150c	00100000-569f-6666-b595-48b5079084e3	00090000-569f-6666-1f8f-717e9f3e3388	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-569f-6666-b07f-967d16cfec5b	000d0000-569f-6666-3e8f-aab97069d0cd	00100000-569f-6666-afa6-523baf1cfe86	00090000-569f-6666-5a00-25527881351d	\N	0003	t	\N	2016-01-20	\N	2	t	f	f
000c0000-569f-6666-57e6-195cc43967fe	000d0000-569f-6666-cbb1-dee7e699c362	\N	00090000-569f-6666-f285-7779a2a8fcac	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	f	f
000c0000-569f-6666-33a4-d91a7e10903d	000d0000-569f-6666-743f-63bbce4ca227	\N	00090000-569f-6666-06d5-e7eaf1f7b756	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-569f-6666-8be1-100e45cf3236	000d0000-569f-6666-1f25-d60b49836a18	\N	00090000-569f-6666-bf09-59e792677f19	000b0000-569f-6666-0526-5f2a3f890ce3	0006	f	2016-01-01	2016-01-01	\N	1	t	t	t
000c0000-569f-6666-52b1-4c37c1bf433b	000d0000-569f-6666-9e32-d596a3f33508	00100000-569f-6666-d680-74802a0a8a5d	00090000-569f-6666-28d6-43abbeec0672	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	f	t
000c0000-569f-6666-ab30-119099a61257	000d0000-569f-6666-afe0-0119f60a514f	\N	00090000-569f-6666-da20-df8285971943	000b0000-569f-6666-f6d5-df229db8ed8c	0008	f	2016-01-01	2016-01-01	\N	12	t	t	t
000c0000-569f-6666-a46a-63ce4e707a35	000d0000-569f-6666-9e32-d596a3f33508	00100000-569f-6666-eac4-866181b4179f	00090000-569f-6666-a1b0-eb6a6f47e648	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-569f-6666-6298-705d8a4d146d	000d0000-569f-6666-9e32-d596a3f33508	00100000-569f-6666-ae81-c15746594c81	00090000-569f-6666-d94e-a197943d51d9	\N	0010	t	\N	2016-01-20	\N	16	f	f	t
000c0000-569f-6666-f93d-93940a56d691	000d0000-569f-6666-9e32-d596a3f33508	00100000-569f-6666-2746-0e87e6fc4e4d	00090000-569f-6666-8bea-0de83c52cbf5	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-569f-6666-379d-9aabba57a4f5	000d0000-569f-6666-f0fa-c063eede02ed	00100000-569f-6666-b595-48b5079084e3	00090000-569f-6666-1f8f-717e9f3e3388	000b0000-569f-6666-fd56-c5375f134b61	0012	t	\N	\N	\N	2	t	t	t
000c0000-569f-6666-e7c1-4eb2aae90975	000d0000-569f-6666-ce12-7570b7f4445a	\N	00090000-569f-6666-da20-df8285971943	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-d399-15ebd2179ad5	000d0000-569f-6666-ce12-7570b7f4445a	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-569f-6666-bf97-48e896dd13bb	000d0000-569f-6666-6d50-a15d075873e8	00100000-569f-6666-afa6-523baf1cfe86	00090000-569f-6666-5a00-25527881351d	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-569f-6666-53bf-58b466d2acb4	000d0000-569f-6666-6d50-a15d075873e8	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-569f-6666-ae05-4a42f45557fd	000d0000-569f-6666-8565-8905713ac441	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-4538-63e8c2d1ce67	000d0000-569f-6666-8565-8905713ac441	\N	00090000-569f-6666-da20-df8285971943	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-569f-6666-f582-0059a63685d1	000d0000-569f-6666-79c2-a2a77a9d1cab	00100000-569f-6666-d680-74802a0a8a5d	00090000-569f-6666-28d6-43abbeec0672	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-569f-6666-838f-886543db7547	000d0000-569f-6666-79c2-a2a77a9d1cab	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-569f-6666-c1ef-93c26c098705	000d0000-569f-6666-f4a1-8ac2714c895a	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-5d3f-86ae94af7177	000d0000-569f-6666-f4a1-8ac2714c895a	00100000-569f-6666-d680-74802a0a8a5d	00090000-569f-6666-28d6-43abbeec0672	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-569f-6666-a9e4-504a87c242f8	000d0000-569f-6666-f7da-c7dafa5be896	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-4e11-67440209f0af	000d0000-569f-6666-f105-310d87bbe424	\N	00090000-569f-6666-da20-df8285971943	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-8903-06fd61a7a2e7	000d0000-569f-6666-e6e3-6f09f2422062	\N	00090000-569f-6666-da20-df8285971943	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-ba87-e05d1c26a378	000d0000-569f-6666-e6e3-6f09f2422062	00100000-569f-6666-afa6-523baf1cfe86	00090000-569f-6666-5a00-25527881351d	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-569f-6666-acab-5a4a601eacc7	000d0000-569f-6666-a779-50ca50b76830	\N	00090000-569f-6666-a68b-282905491ed9	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-569f-6666-9906-0343ec284a8c	000d0000-569f-6666-a779-50ca50b76830	\N	00090000-569f-6666-b306-6cebbe6f1287	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-569f-6666-d13c-acaaa188847b	000d0000-569f-6666-b87f-505b68647fc4	\N	00090000-569f-6666-da20-df8285971943	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-569f-6666-807d-c2c74d6992a9	000d0000-569f-6666-b87f-505b68647fc4	00100000-569f-6666-afa6-523baf1cfe86	00090000-569f-6666-5a00-25527881351d	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-569f-6666-0b24-e6aff62dbeab	000d0000-569f-6666-b87f-505b68647fc4	\N	00090000-569f-6666-b306-6cebbe6f1287	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-569f-6666-ce64-0e3664b68a0e	000d0000-569f-6666-b87f-505b68647fc4	\N	00090000-569f-6666-a68b-282905491ed9	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-569f-6666-2ad3-5469fe7b7854	000d0000-569f-6666-8c86-f72b2c09a570	\N	00090000-569f-6666-da20-df8285971943	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-569f-6666-9937-854d061b7a03	000d0000-569f-6666-0bcd-945058cb748f	00100000-569f-6666-afa6-523baf1cfe86	00090000-569f-6666-5a00-25527881351d	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-569f-6666-1200-aa6695458c12	000d0000-569f-6666-0bcd-945058cb748f	\N	00090000-569f-6666-bc02-a230f618a9fd	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3201 (class 0 OID 38355552)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 38354943)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3192 (class 0 OID 38355429)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-569f-6666-cb06-07c628bb752d	00160000-569f-6665-7b88-92d528ec4a6e	00090000-569f-6666-b306-6cebbe6f1287	aizv	10	t
003d0000-569f-6666-1f44-352040cea99f	00160000-569f-6665-7b88-92d528ec4a6e	00090000-569f-6666-5a00-0a4d7e1d26a1	apri	14	t
003d0000-569f-6666-8d1c-88024529f3b6	00160000-569f-6665-4ccc-23b9c54c1daf	00090000-569f-6666-a68b-282905491ed9	aizv	11	t
003d0000-569f-6666-4599-aacf91990cff	00160000-569f-6665-c398-59d94c892b92	00090000-569f-6666-31ce-45ef539f9e57	aizv	12	t
003d0000-569f-6666-c87f-46a202624086	00160000-569f-6665-7b88-92d528ec4a6e	00090000-569f-6666-bc02-a230f618a9fd	apri	18	f
\.


--
-- TOC entry 3195 (class 0 OID 38355459)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-569f-6665-7b88-92d528ec4a6e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-569f-6665-4ccc-23b9c54c1daf	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-569f-6665-c398-59d94c892b92	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3216 (class 0 OID 38355871)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3173 (class 0 OID 38355265)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 38355191)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-569f-6666-221f-88f5a76ce9f1	\N	00200000-569f-6666-a1ce-e219eb3a7b03	\N	\N	\N	00220000-569f-6665-09a3-01907cc5cfac	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-569f-6666-25ac-64e125729779	\N	00200000-569f-6666-0bb3-e390fb848cd8	\N	\N	\N	00220000-569f-6665-09a3-01907cc5cfac	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2
00180000-569f-6666-cc1a-42dd0b5693dc	\N	00200000-569f-6666-e736-8192d07f7ce8	\N	\N	\N	00220000-569f-6665-f016-5e8bf842ce7f	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-569f-6666-5931-8af28dc0e940	\N	00200000-569f-6666-7e84-0909da1218d9	\N	\N	\N	00220000-569f-6665-b9a1-92f7a8037f62	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4
00180000-569f-6666-de5c-876a278195ba	\N	00200000-569f-6666-1b7f-362c55688c90	\N	\N	\N	00220000-569f-6665-6f26-8113199d28ab	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
00180000-569f-6666-0c30-a28594fe29bd	001b0000-569f-6666-7863-55a23c374501	\N	\N	\N	\N	00220000-569f-6665-a4ae-04fedd6a7205	\N	f	2014-05-10 23:00:00	2014-05-10 23:00:00	200s	100s	\N	Predstava 1
\.


--
-- TOC entry 3167 (class 0 OID 38355216)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 38355221)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 38355793)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 38355095)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-569f-6663-011a-ebda590fdf3c	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-569f-6663-18e0-411481bece07	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-569f-6663-d0e2-b5d4ca2c11e0	AL	ALB	008	Albania 	Albanija	\N
00040000-569f-6663-3d13-64f1304c74b6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-569f-6663-f38e-9c48db757ba6	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-569f-6663-4e6f-22ef1dfdcb5b	AD	AND	020	Andorra 	Andora	\N
00040000-569f-6663-91d9-def85e99af8f	AO	AGO	024	Angola 	Angola	\N
00040000-569f-6663-03be-9b4fc7c00459	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-569f-6663-caac-ddcc16f6e457	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-569f-6663-5e1d-f3821010a7d0	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-6663-52df-2e9b5d2c4508	AR	ARG	032	Argentina 	Argenitna	\N
00040000-569f-6663-a621-8d262445a506	AM	ARM	051	Armenia 	Armenija	\N
00040000-569f-6663-2b2b-532aa8d591fb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-569f-6663-200f-6dfc2736e80b	AU	AUS	036	Australia 	Avstralija	\N
00040000-569f-6663-adbd-95a196772ccc	AT	AUT	040	Austria 	Avstrija	\N
00040000-569f-6663-397b-8cb9fd24fc6d	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-569f-6663-365e-25f79dfdb4e1	BS	BHS	044	Bahamas 	Bahami	\N
00040000-569f-6663-fc5d-23fabf81d994	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-569f-6663-fffa-ce0f70c361be	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-569f-6663-a8b8-ee9984069415	BB	BRB	052	Barbados 	Barbados	\N
00040000-569f-6663-5513-f03ca4f0749c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-569f-6663-7208-b9cb4dab4db7	BE	BEL	056	Belgium 	Belgija	\N
00040000-569f-6663-5b8f-525b245a526e	BZ	BLZ	084	Belize 	Belize	\N
00040000-569f-6663-fd2e-f66752dbc48d	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-569f-6663-d9dc-78b6929abf64	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-569f-6663-71fd-dd1246e8c4be	BT	BTN	064	Bhutan 	Butan	\N
00040000-569f-6663-1595-6e61ad8360e7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-569f-6663-668c-c57d2c293f16	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-569f-6663-6fd3-5b2d38c44b56	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-569f-6663-4514-1f1d2fa118cf	BW	BWA	072	Botswana 	Bocvana	\N
00040000-569f-6663-1c5e-1b21cc9cca94	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-569f-6663-de77-ead887c07b4e	BR	BRA	076	Brazil 	Brazilija	\N
00040000-569f-6663-5189-c79120ac3b5f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-569f-6663-69fb-8d0458b6dc07	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-569f-6663-c810-3fcd5a70ea82	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-569f-6663-e64d-32d3e603d4bd	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-569f-6663-d965-f62ffb9f95a5	BI	BDI	108	Burundi 	Burundi 	\N
00040000-569f-6663-8c43-0fb05d515875	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-569f-6663-9b05-97451164ec22	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-569f-6663-ddf5-fb2cbfe912b5	CA	CAN	124	Canada 	Kanada	\N
00040000-569f-6663-9dae-bbcd93156e8a	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-569f-6663-bc3f-3e346383ed67	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-569f-6663-1665-b2af407fbcaf	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-569f-6663-c5b9-6fa896b87807	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-569f-6663-7682-13a3cea5e6a3	CL	CHL	152	Chile 	Čile	\N
00040000-569f-6663-00ca-934e07888ca1	CN	CHN	156	China 	Kitajska	\N
00040000-569f-6663-8c6b-80e1a77eb4e9	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-569f-6663-6b3c-26143ff0adb0	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-569f-6663-2f6b-7fa318915cfe	CO	COL	170	Colombia 	Kolumbija	\N
00040000-569f-6663-825e-72ecd3e0c44e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-569f-6663-d6bb-c72555b2f71d	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-569f-6663-5a01-c6803dfe6590	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-569f-6663-2abd-a8bb1ccd17ac	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-569f-6663-9a0c-f95d70c0e651	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-569f-6663-b43e-97ab818d7cea	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-569f-6663-4f61-2af5f65e7fe4	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-569f-6663-24fc-d19261ae4592	CU	CUB	192	Cuba 	Kuba	\N
00040000-569f-6663-62ff-0dc5efa9761b	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-569f-6663-d97c-20609886c40f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-569f-6663-916d-6bd342793cb3	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-569f-6663-7bda-e37ca0b89313	DK	DNK	208	Denmark 	Danska	\N
00040000-569f-6663-6d96-109d49855010	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-569f-6663-dc28-431f1223897f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-569f-6663-c789-e67bb9341a4c	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-569f-6663-42ad-84cb6d3eb608	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-569f-6663-0f7c-1de936d4ad03	EG	EGY	818	Egypt 	Egipt	\N
00040000-569f-6663-24af-8713664a0aac	SV	SLV	222	El Salvador 	Salvador	\N
00040000-569f-6663-e46e-16aff019d94f	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-569f-6663-19ee-5edf7edf3651	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-569f-6663-5ff7-1c0fb098c9a4	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-569f-6663-9d04-c98d07e8628f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-569f-6663-70cd-60aac27d5c33	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-569f-6663-0f62-68e26d7e3eab	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-569f-6663-abf3-e65a5bb45171	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-569f-6663-4bd9-2d5ffe9344ed	FI	FIN	246	Finland 	Finska	\N
00040000-569f-6663-3dc7-710c56b3630b	FR	FRA	250	France 	Francija	\N
00040000-569f-6663-9ca9-c50113cafeb8	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-569f-6663-8667-cf3b4dd9299e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-569f-6663-d001-e2ab4555f4ff	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-569f-6663-9883-d38e8cd4aa39	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-569f-6663-1fb9-86802b79f30a	GA	GAB	266	Gabon 	Gabon	\N
00040000-569f-6663-383e-13d0c742556f	GM	GMB	270	Gambia 	Gambija	\N
00040000-569f-6663-80a7-b8c81fc700ad	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-569f-6663-a7fd-0771caf04bc6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-569f-6663-a2b5-0620fe06240c	GH	GHA	288	Ghana 	Gana	\N
00040000-569f-6663-cc58-c8ab097405cc	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-569f-6663-7271-cb2f65a20cc7	GR	GRC	300	Greece 	Grčija	\N
00040000-569f-6663-8eee-393b9e46d94e	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-569f-6663-6cea-12a707b5c544	GD	GRD	308	Grenada 	Grenada	\N
00040000-569f-6663-f022-e8eefbc45eb9	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-569f-6663-5292-dae8d1d4281b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-569f-6663-befb-c3ba8d824f1b	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-569f-6663-7f1b-a260fee79481	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-569f-6663-9520-2eb9320d15a3	GN	GIN	324	Guinea 	Gvineja	\N
00040000-569f-6663-2174-ceb6c762c3ce	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-569f-6663-6c81-fd9386d33d57	GY	GUY	328	Guyana 	Gvajana	\N
00040000-569f-6663-00f2-dcd1a90b0f5d	HT	HTI	332	Haiti 	Haiti	\N
00040000-569f-6663-9d62-8fd5f5e7b060	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-569f-6663-704a-5397161048e1	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-569f-6663-f43d-4386850bf4c9	HN	HND	340	Honduras 	Honduras	\N
00040000-569f-6663-edeb-06a19dfc3d62	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-569f-6663-7bdc-a52388596ff4	HU	HUN	348	Hungary 	Madžarska	\N
00040000-569f-6663-9b2d-9017ccb872e3	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-569f-6663-bb52-bfd383f86fbc	IN	IND	356	India 	Indija	\N
00040000-569f-6663-052e-0ffd04dc60e5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-569f-6663-eacf-7ac821dc2f79	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-569f-6663-8475-718d9e1a6a14	IQ	IRQ	368	Iraq 	Irak	\N
00040000-569f-6663-9882-71668f5d3168	IE	IRL	372	Ireland 	Irska	\N
00040000-569f-6663-9003-376c900d6678	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-569f-6663-f61d-2e8fad1f6ff7	IL	ISR	376	Israel 	Izrael	\N
00040000-569f-6663-eef3-f2596f2df6d3	IT	ITA	380	Italy 	Italija	\N
00040000-569f-6663-3977-101e8eaac5b2	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-569f-6663-c2e9-496e7d1d8f3b	JP	JPN	392	Japan 	Japonska	\N
00040000-569f-6663-3d71-dffe6798b834	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-569f-6663-3bf8-f696159284a1	JO	JOR	400	Jordan 	Jordanija	\N
00040000-569f-6663-a7a7-bc0a338f2db6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-569f-6663-2527-046fb81ce007	KE	KEN	404	Kenya 	Kenija	\N
00040000-569f-6663-f732-4e481172dec9	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-569f-6663-dc93-f2c6ac0a4a34	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-569f-6663-b5bf-17b0b7331c0c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-569f-6663-82d8-65299884fddf	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-569f-6663-2da7-8679ce725a70	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-569f-6663-5334-7c381bb3b3ec	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-569f-6663-9eec-309c3204432e	LV	LVA	428	Latvia 	Latvija	\N
00040000-569f-6663-af69-aae875a6ceeb	LB	LBN	422	Lebanon 	Libanon	\N
00040000-569f-6663-1200-e13e5e7c8eda	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-569f-6663-a52e-f3d09ed77be7	LR	LBR	430	Liberia 	Liberija	\N
00040000-569f-6663-b7a0-1fbb1b8efa1e	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-569f-6663-5759-08fbf7298586	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-569f-6663-b843-8075db5eed8c	LT	LTU	440	Lithuania 	Litva	\N
00040000-569f-6663-58a9-7e049b9950c1	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-569f-6663-9e50-9103170e1525	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-569f-6663-e36d-7f16cc807e50	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-569f-6663-a0e0-3e1cb9280feb	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-569f-6663-d09a-b095e6a46526	MW	MWI	454	Malawi 	Malavi	\N
00040000-569f-6663-d624-812e2442ca9d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-569f-6663-fc28-93853fb83056	MV	MDV	462	Maldives 	Maldivi	\N
00040000-569f-6663-2524-a15dd3cbc42d	ML	MLI	466	Mali 	Mali	\N
00040000-569f-6663-3bba-60caf1d4005b	MT	MLT	470	Malta 	Malta	\N
00040000-569f-6663-1604-1c9a49a32cc9	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-569f-6663-92ca-4b70a23f5c8a	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-569f-6663-2df4-4346bb35803e	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-569f-6663-7911-b1a286987f6f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-569f-6663-78d7-1e1ffe54c0a3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-569f-6663-b0c6-3214f56be54b	MX	MEX	484	Mexico 	Mehika	\N
00040000-569f-6663-2ccf-ce70647dad83	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-569f-6663-fba9-e5e980a731a0	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-569f-6663-47d1-28c4fc3774b5	MC	MCO	492	Monaco 	Monako	\N
00040000-569f-6663-efe1-e40da39e760f	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-569f-6663-7d05-3b11794bedee	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-569f-6663-7304-6fd0e0d0abcb	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-569f-6663-931f-7777fd44953d	MA	MAR	504	Morocco 	Maroko	\N
00040000-569f-6663-7f25-ff4c433cf150	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-569f-6663-edce-e3d895535805	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-569f-6663-446e-bd62f2d81707	NA	NAM	516	Namibia 	Namibija	\N
00040000-569f-6663-95ba-0f8226eafae1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-569f-6663-9874-86a455ddf9b3	NP	NPL	524	Nepal 	Nepal	\N
00040000-569f-6663-28f4-1f30f4a51920	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-569f-6663-122d-e0cefd03f6e5	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-569f-6663-c481-6e5c2704335b	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-569f-6663-649b-dcb99c4ee425	NE	NER	562	Niger 	Niger 	\N
00040000-569f-6663-64be-51dfd3c7290f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-569f-6663-1a0b-f80c8d1c3344	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-569f-6663-f838-f3356bedb5c5	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-569f-6663-5e62-e4d70b9707e7	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-569f-6663-0397-147100f28b20	NO	NOR	578	Norway 	Norveška	\N
00040000-569f-6663-4b46-dcb2ebfc1076	OM	OMN	512	Oman 	Oman	\N
00040000-569f-6663-5144-589610668de9	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-569f-6663-423c-d41b10a1d6e2	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-569f-6663-0ee3-32c3d7d22e06	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-569f-6663-98ae-9c8fa20b3276	PA	PAN	591	Panama 	Panama	\N
00040000-569f-6663-91dc-83ae80b5307e	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-569f-6663-ac3f-cae95cf5cc49	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-569f-6663-6e0f-b828aa1b247e	PE	PER	604	Peru 	Peru	\N
00040000-569f-6663-99aa-43d8989b42c6	PH	PHL	608	Philippines 	Filipini	\N
00040000-569f-6663-e967-0b7d2c717e50	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-569f-6663-3345-8bc6fae2b577	PL	POL	616	Poland 	Poljska	\N
00040000-569f-6663-5df6-bab0e41ddc58	PT	PRT	620	Portugal 	Portugalska	\N
00040000-569f-6663-950f-a4bdfcdef0eb	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-569f-6663-85e1-b2bc29ca39c4	QA	QAT	634	Qatar 	Katar	\N
00040000-569f-6663-d0ab-cd70166cf5cb	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-569f-6663-0828-32ce0456d621	RO	ROU	642	Romania 	Romunija	\N
00040000-569f-6663-8c1f-5b5715a316a7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-569f-6663-117d-eba818c89cd9	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-569f-6663-3eb9-f3e7c0fccab4	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-569f-6663-68cb-1d050f9f1724	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-569f-6663-1bc4-1421b9129824	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-569f-6663-368c-69d7bd77b57d	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-569f-6663-72b7-6e609c4fb893	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-569f-6663-42b7-472c36f74558	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-569f-6663-3f44-d07d45916323	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-569f-6663-c5e7-7275459149b0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-569f-6663-6aa2-e69da7747370	SM	SMR	674	San Marino 	San Marino	\N
00040000-569f-6663-d131-db59e411402b	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-569f-6663-afff-c1f1907163f2	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-569f-6663-30d5-ac366f602fb1	SN	SEN	686	Senegal 	Senegal	\N
00040000-569f-6663-1f06-8cca539eb27f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-569f-6663-b3cf-388ead53ece5	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-569f-6663-9308-7778b65f3903	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-569f-6663-383f-cbd737688010	SG	SGP	702	Singapore 	Singapur	\N
00040000-569f-6663-a446-c1fc1972b94e	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-569f-6663-d1fb-2d6fe8fe807d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-569f-6663-718d-f7254ae80150	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-569f-6663-ec69-a3c9d4078c82	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-569f-6663-fe71-325997e29187	SO	SOM	706	Somalia 	Somalija	\N
00040000-569f-6663-6b8e-e1c0e7a168e6	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-569f-6663-cd00-5b317f76079e	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-569f-6663-5236-ad3d0b3d3470	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-569f-6663-8d62-a8b511a06a13	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-569f-6663-611a-77bdc7c8ab05	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-569f-6663-8100-d191daedbc50	SD	SDN	729	Sudan 	Sudan	\N
00040000-569f-6663-de9d-897b5f510d4f	SR	SUR	740	Suriname 	Surinam	\N
00040000-569f-6663-65eb-9e2bdecef033	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-569f-6663-f335-64325da5bccb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-569f-6663-49a6-876460a0b66a	SE	SWE	752	Sweden 	Švedska	\N
00040000-569f-6663-2e28-3a5c116bc202	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-569f-6663-4550-ec3c718a5473	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-569f-6663-3e2d-310def2ef6fe	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-569f-6663-2471-06bdef4224a3	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-569f-6663-0625-9c4a9202c470	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-569f-6663-5758-0a3f54bf2c9b	TH	THA	764	Thailand 	Tajska	\N
00040000-569f-6663-5fa1-f29fa7f5628b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-569f-6663-5122-aa6e8b3dafa5	TG	TGO	768	Togo 	Togo	\N
00040000-569f-6663-e639-cd0fd2282d12	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-569f-6663-f59d-d89c44ff574f	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-569f-6663-bd66-29ea8ab73ad4	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-569f-6663-5ddf-204e3262217e	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-569f-6663-c1f3-9c78a05bd497	TR	TUR	792	Turkey 	Turčija	\N
00040000-569f-6663-0065-1ee89b5aaad6	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-569f-6663-833a-ebb047e50098	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-6663-bef3-f32382c694e6	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-569f-6663-2dbe-f87fdf33b257	UG	UGA	800	Uganda 	Uganda	\N
00040000-569f-6663-065e-9ed04a05c1d5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-569f-6663-1735-7fd3f5f886a4	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-569f-6663-c11a-60839d73d09e	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-569f-6663-3add-170c88ce1ab0	US	USA	840	United States 	Združene države Amerike	\N
00040000-569f-6663-6d0c-46143bd8725d	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-569f-6663-b728-446ba2fa17e5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-569f-6663-11b2-7cfe45d4125f	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-569f-6663-723c-0a6b23719cd0	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-569f-6663-9dc3-6b0b510d5192	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-569f-6663-ace0-b4a81ad2aec7	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-569f-6663-a78a-74532cf61e76	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-569f-6663-1238-56fc22c78a02	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-569f-6663-8f63-c5ee33673e04	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-569f-6663-08d8-463ca49209a3	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-569f-6663-cccb-e652533eff86	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-569f-6663-d72d-bc701396ca4b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-569f-6663-a9cf-06d70fb99e36	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3203 (class 0 OID 38355581)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-569f-6666-dff5-753c374fc9f8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-569f-6666-357c-fed1aa084f15	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-6666-11e0-12496674a921	000e0000-569f-6666-8976-518f18c8dcd8	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-6663-e972-87784a426960	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-6666-1dfd-4ab07b764ed0	000e0000-569f-6666-8f65-85e37f4b94a9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-6663-6ffa-a27bb672cadd	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-569f-6666-45af-4981622ea2d7	000e0000-569f-6666-2e88-9ec809931587	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-569f-6663-e972-87784a426960	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3188 (class 0 OID 38355387)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-569f-6666-c3db-875080003def	000e0000-569f-6666-8f65-85e37f4b94a9	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-569f-6663-0188-cb0144f3064e
000d0000-569f-6666-8578-5ec1ef138867	000e0000-569f-6666-0979-c59cef2717c8	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-6663-460b-27bf67e4208e
000d0000-569f-6666-17a8-31db3e54d4f3	000e0000-569f-6666-0979-c59cef2717c8	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-c064-d91e677d763f	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-9819-50f698be5ce9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-6663-460b-27bf67e4208e
000d0000-569f-6666-48bc-691e499d150c	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-2816-a8ae3682a02a	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-3e8f-aab97069d0cd	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-b07f-967d16cfec5b	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-569f-6663-3a2f-3962954f7f3c
000d0000-569f-6666-cbb1-dee7e699c362	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-57e6-195cc43967fe	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-569f-6663-0188-cb0144f3064e
000d0000-569f-6666-743f-63bbce4ca227	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-33a4-d91a7e10903d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-569f-6663-0188-cb0144f3064e
000d0000-569f-6666-1f25-d60b49836a18	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-8be1-100e45cf3236	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-569f-6663-460b-27bf67e4208e
000d0000-569f-6666-9e32-d596a3f33508	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-a46a-63ce4e707a35	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-569f-6663-460b-27bf67e4208e
000d0000-569f-6666-afe0-0119f60a514f	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-ab30-119099a61257	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-569f-6663-d0d0-29ef23dfb350
000d0000-569f-6666-f0fa-c063eede02ed	000e0000-569f-6666-8f65-85e37f4b94a9	000c0000-569f-6666-379d-9aabba57a4f5	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-569f-6663-1792-dd48e744a9a4
000d0000-569f-6666-ce12-7570b7f4445a	000e0000-569f-6666-8426-e3a632a7e623	000c0000-569f-6666-e7c1-4eb2aae90975	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-6d50-a15d075873e8	000e0000-569f-6666-1d48-012bbb9f1e66	000c0000-569f-6666-bf97-48e896dd13bb	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-8565-8905713ac441	000e0000-569f-6666-1d48-012bbb9f1e66	000c0000-569f-6666-ae05-4a42f45557fd	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-79c2-a2a77a9d1cab	000e0000-569f-6666-b202-c915344e2681	000c0000-569f-6666-f582-0059a63685d1	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-f4a1-8ac2714c895a	000e0000-569f-6666-5ca4-f529251eef3c	000c0000-569f-6666-c1ef-93c26c098705	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-f7da-c7dafa5be896	000e0000-569f-6666-a75c-0697e49dd66d	000c0000-569f-6666-a9e4-504a87c242f8	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-f105-310d87bbe424	000e0000-569f-6666-3865-b47a85c0c410	000c0000-569f-6666-4e11-67440209f0af	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-e6e3-6f09f2422062	000e0000-569f-6666-1e7c-aee969047e84	000c0000-569f-6666-8903-06fd61a7a2e7	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-a779-50ca50b76830	000e0000-569f-6666-0181-497c79fced41	000c0000-569f-6666-acab-5a4a601eacc7	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-b87f-505b68647fc4	000e0000-569f-6666-0181-497c79fced41	000c0000-569f-6666-d13c-acaaa188847b	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-8c86-f72b2c09a570	000e0000-569f-6666-c649-64e92a37982d	000c0000-569f-6666-2ad3-5469fe7b7854	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
000d0000-569f-6666-0bcd-945058cb748f	000e0000-569f-6666-c649-64e92a37982d	000c0000-569f-6666-9937-854d061b7a03	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-569f-6663-e8fc-cf964619c043
\.


--
-- TOC entry 3163 (class 0 OID 38355165)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 38355135)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 38355112)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-569f-6666-cbf8-6bb878ea4fce	00080000-569f-6666-bf2d-057c0dcb3942	00090000-569f-6666-d94e-a197943d51d9	AK		igralka
\.


--
-- TOC entry 3177 (class 0 OID 38355301)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3214 (class 0 OID 38355851)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-569f-6666-9a67-3e732318a812	00010000-569f-6664-d98f-d6ffe6cdaf99	\N	Prva mapa	Root mapa	2016-01-20 11:50:14	2016-01-20 11:50:14	R	\N	\N
\.


--
-- TOC entry 3215 (class 0 OID 38355864)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3217 (class 0 OID 38355886)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 34548309)
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
-- TOC entry 3181 (class 0 OID 38355326)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 38355069)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-569f-6664-9883-b847acbe3a34	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-569f-6664-cd42-b0dfeecd02dd	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-569f-6664-ce51-d1d140ed8815	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-569f-6664-7855-a38fa8eeb78d	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-569f-6664-c3e1-e23a34657ffc	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Odobren";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-569f-6664-bf74-663e5f6ae1d1	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-569f-6664-0db6-3e5c09ea6c55	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-569f-6664-4851-51dba222bf70	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-569f-6664-8105-0e590b4b00d5	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-569f-6664-35b0-ad409f08f30a	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-6664-8cec-f42fde7558dd	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-569f-6664-157c-d00d398f18f5	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-569f-6664-5172-ea4626b20780	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-569f-6664-d87d-d1613a9ad417	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-569f-6664-fb0c-f5d5f4b49942	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-569f-6664-95f6-e61c329ba4b7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-569f-6665-ebc5-9b99752de17c	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-569f-6665-aa83-20f7b5a8dfb0	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-569f-6665-abb9-b25ad25f4c3e	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-569f-6665-b994-9ec7ea1f46a2	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-569f-6665-685f-106d3c302b95	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-569f-6668-6d9a-8fd3aee15ebd	application.tenant.maticnopodjetje	string	s:36:"00080000-569f-6668-1cce-ccfb73e62907";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3148 (class 0 OID 38354969)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-569f-6665-461c-19d03fad6c17	00000000-569f-6665-ebc5-9b99752de17c	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-569f-6665-2e93-3b60c91966f4	00000000-569f-6665-ebc5-9b99752de17c	00010000-569f-6664-d98f-d6ffe6cdaf99	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-569f-6665-660d-3215f849971f	00000000-569f-6665-aa83-20f7b5a8dfb0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3152 (class 0 OID 38355036)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-569f-6666-bcab-a4ca21074617	\N	00100000-569f-6666-b595-48b5079084e3	00100000-569f-6666-afa6-523baf1cfe86	01	Gledališče Nimbis
00410000-569f-6666-53d1-983b34faf14f	00410000-569f-6666-bcab-a4ca21074617	00100000-569f-6666-b595-48b5079084e3	00100000-569f-6666-afa6-523baf1cfe86	02	Tehnika
\.


--
-- TOC entry 3149 (class 0 OID 38354980)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-569f-6666-ea27-6b82c1985c5a	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-569f-6666-f285-7779a2a8fcac	00010000-569f-6666-8d28-b20a22bfbedc	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-569f-6666-5a00-25527881351d	00010000-569f-6666-2f8d-15e346676683	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-569f-6666-a1b0-eb6a6f47e648	00010000-569f-6666-1214-3386cd4a3919	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-569f-6666-7e1d-a35fe86fb47b	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-569f-6666-bf09-59e792677f19	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-569f-6666-8bea-0de83c52cbf5	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-569f-6666-28d6-43abbeec0672	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-569f-6666-d94e-a197943d51d9	00010000-569f-6666-5f28-5f12f47e7aa0	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-569f-6666-1f8f-717e9f3e3388	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-569f-6666-874b-bd70966ebd9f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-6666-06d5-e7eaf1f7b756	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-569f-6666-da20-df8285971943	00010000-569f-6666-444f-16a0e2337794	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-569f-6666-b306-6cebbe6f1287	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-6666-5a00-0a4d7e1d26a1	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-6666-a68b-282905491ed9	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-6666-31ce-45ef539f9e57	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-6666-bc02-a230f618a9fd	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-569f-6666-875b-329bf9b876e4	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-6666-73d9-7f31668b0a7b	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-569f-6666-1396-7a41ea2264ba	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 38354915)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-569f-6663-b321-68cf728f8a22	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-569f-6663-e7be-68a74ea5193b	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-569f-6663-e5db-751283771dbf	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-569f-6663-b144-01fb85acf2b3	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-569f-6663-8fde-7c381dad294c	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-569f-6663-7af8-3b597d17e89d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-569f-6663-2fcd-4eee9e859bdd	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-569f-6663-760c-48ed6e623c48	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-569f-6663-cccc-622cacd0bd86	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-569f-6663-5bbf-7505d3f719e8	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-569f-6663-31df-e1d250e44f5e	Abonma-read	Abonma - branje	t
00030000-569f-6663-7510-3b9ce1199aa5	Abonma-write	Abonma - spreminjanje	t
00030000-569f-6663-f46a-85eedf7f4c60	Alternacija-read	Alternacija - branje	t
00030000-569f-6663-954c-83adfd2604bd	Alternacija-write	Alternacija - spreminjanje	t
00030000-569f-6663-5acb-a1cade5d4705	Arhivalija-read	Arhivalija - branje	t
00030000-569f-6663-1f5e-0a6343fb6c3f	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-569f-6663-cab0-0d9bbd801ec4	AuthStorage-read	AuthStorage - branje	t
00030000-569f-6663-0895-90a82f2d221f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-569f-6663-622c-ab24e55603ff	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-569f-6663-a02f-5652467dbe71	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-569f-6663-051e-083241f7b06e	Besedilo-read	Besedilo - branje	t
00030000-569f-6663-68f2-946d22c3502f	Besedilo-write	Besedilo - spreminjanje	t
00030000-569f-6663-50fd-d6751a1b8a2f	Dodatek-read	Dodatek - branje	t
00030000-569f-6663-3b07-e13d896897be	Dodatek-write	Dodatek - spreminjanje	t
00030000-569f-6663-8e96-63ba097956cc	Dogodek-read	Dogodek - branje	t
00030000-569f-6663-8748-71edd9c1e9d7	Dogodek-write	Dogodek - spreminjanje	t
00030000-569f-6663-f3fc-8bd2653242bc	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-569f-6663-20d7-f8eedd50774a	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-569f-6663-3ec1-01a3af79961f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-569f-6663-2e25-777bab510b21	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-569f-6663-68cf-1f7cfab6fdb6	DogodekTrait-read	DogodekTrait - branje	t
00030000-569f-6663-9c6d-ec20194def5f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-569f-6663-b6e0-1d4194137a3a	DrugiVir-read	DrugiVir - branje	t
00030000-569f-6663-af94-2701848c0923	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-569f-6663-448d-2a58ba83d843	Drzava-read	Drzava - branje	t
00030000-569f-6663-f81f-1731ce12e3d5	Drzava-write	Drzava - spreminjanje	t
00030000-569f-6663-453f-8b6add927fc0	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-569f-6663-f466-586c80446daa	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-569f-6663-5f54-b0122f889757	Funkcija-read	Funkcija - branje	t
00030000-569f-6663-8649-e4f2d79a67ad	Funkcija-write	Funkcija - spreminjanje	t
00030000-569f-6663-86ce-c6b23ee24b9f	Gostovanje-read	Gostovanje - branje	t
00030000-569f-6663-9232-a11426e86ad3	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-569f-6663-a1fa-f01136e55fcd	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-569f-6663-3050-05217ec0d423	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-569f-6663-48d2-c8881b06300a	Kupec-read	Kupec - branje	t
00030000-569f-6663-8047-a29ef8c5cda4	Kupec-write	Kupec - spreminjanje	t
00030000-569f-6663-e96f-35047f3f141c	NacinPlacina-read	NacinPlacina - branje	t
00030000-569f-6663-2e9e-9d71a2331c79	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-569f-6663-f2b5-f7e489e13765	Option-read	Option - branje	t
00030000-569f-6663-5d9e-64c613ff1fa9	Option-write	Option - spreminjanje	t
00030000-569f-6663-3eca-b45224485a94	OptionValue-read	OptionValue - branje	t
00030000-569f-6663-5e45-ac982c3ab168	OptionValue-write	OptionValue - spreminjanje	t
00030000-569f-6663-03a7-a41442463f78	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-569f-6663-aed6-0f224e405099	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-569f-6663-8678-5a33a5415e48	Oseba-read	Oseba - branje	t
00030000-569f-6663-8396-4b36f793497c	Oseba-write	Oseba - spreminjanje	t
00030000-569f-6663-7b00-8179248fafee	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-569f-6663-1f49-acec01c00ee2	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-569f-6663-76b8-de1fcabd9abe	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-569f-6663-8368-e4882f52c025	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-569f-6663-21f2-c475505c01dc	Pogodba-read	Pogodba - branje	t
00030000-569f-6663-10b4-3c54d8826888	Pogodba-write	Pogodba - spreminjanje	t
00030000-569f-6663-9bf7-e405a393770b	Popa-read	Popa - branje	t
00030000-569f-6663-eac8-1e581c99ae01	Popa-write	Popa - spreminjanje	t
00030000-569f-6663-156a-42eb9beede78	Posta-read	Posta - branje	t
00030000-569f-6663-1287-2b1f3d84a600	Posta-write	Posta - spreminjanje	t
00030000-569f-6663-6d3a-ac4bb7826ba5	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-569f-6663-abe7-44c9010dddca	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-569f-6663-1548-fe9347f820d5	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-569f-6663-94a4-c6cffa070be4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-569f-6663-70c2-a1ae235205d9	PostniNaslov-read	PostniNaslov - branje	t
00030000-569f-6663-afae-496435f13b4b	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-569f-6663-b16c-2fb70d901bb1	Praznik-read	Praznik - branje	t
00030000-569f-6663-98cb-68ea6928b189	Praznik-write	Praznik - spreminjanje	t
00030000-569f-6663-eabc-466aa079a103	Predstava-read	Predstava - branje	t
00030000-569f-6663-465d-3aaf106d1874	Predstava-write	Predstava - spreminjanje	t
00030000-569f-6663-0ec6-bb319b47a72a	Ura-read	Ura - branje	t
00030000-569f-6663-c02e-c13a73a9525e	Ura-write	Ura - spreminjanje	t
00030000-569f-6663-6064-37d5795587c0	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-569f-6663-9512-3896628f4162	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-569f-6663-ed3b-a9b97497006d	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-569f-6663-ee4d-0c4ee0b1d2d5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-569f-6663-deb8-f6bd38f1df75	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-569f-6663-4e7c-4d8598a80b67	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-569f-6663-20ba-c88ff786b801	ProgramDela-read	ProgramDela - branje	t
00030000-569f-6663-8154-90b3557c50d9	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-569f-6663-a4e6-c37217fdb5e4	ProgramFestival-read	ProgramFestival - branje	t
00030000-569f-6663-2d7c-6cb81d9b326d	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-569f-6663-bf62-26f9029e9415	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-569f-6663-69ae-b51909cef754	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-569f-6663-f6e5-483316b17e68	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-569f-6663-55e7-bcfc82483a36	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-569f-6663-7d57-a2fb72008955	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-569f-6663-6302-2a93eae35139	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-569f-6663-7d81-546e01a119df	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-569f-6663-7497-4310a91b6bef	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-569f-6663-0f38-71f231b3ba00	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-569f-6663-87aa-fd2b48d9613b	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-569f-6663-3b98-7dadd0422da5	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-569f-6663-721e-c64f42b3c142	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-569f-6663-bac9-77a6af28a7e3	ProgramRazno-read	ProgramRazno - branje	t
00030000-569f-6663-8b35-496eda55cf5e	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-569f-6663-f1cd-c1c517e5a076	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-569f-6663-089d-dbc27e50b946	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-569f-6663-1284-18a7138ae634	Prostor-read	Prostor - branje	t
00030000-569f-6663-e344-41b781adfb8a	Prostor-write	Prostor - spreminjanje	t
00030000-569f-6663-5f24-cea38511997c	Racun-read	Racun - branje	t
00030000-569f-6663-d58c-cdc09bbfc9ed	Racun-write	Racun - spreminjanje	t
00030000-569f-6663-7184-ac58165086fb	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-569f-6663-0a9c-713f807614b6	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-569f-6663-1c15-ec5dfbbee356	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-569f-6663-f690-97caaef842a7	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-569f-6663-6f77-8a74a7e1e4af	Rekvizit-read	Rekvizit - branje	t
00030000-569f-6663-ab56-a0f25fc36d63	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-569f-6663-867e-b9e1f28419b9	Revizija-read	Revizija - branje	t
00030000-569f-6663-3f01-b23bf30911d5	Revizija-write	Revizija - spreminjanje	t
00030000-569f-6663-0642-c7a68d0aa18a	Rezervacija-read	Rezervacija - branje	t
00030000-569f-6663-e4b7-7068c8642785	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-569f-6663-0a7f-b85aa03ee432	SedezniRed-read	SedezniRed - branje	t
00030000-569f-6663-fb11-bb0b6807c400	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-569f-6663-ad79-c75269091871	Sedez-read	Sedez - branje	t
00030000-569f-6663-8fff-266613834576	Sedez-write	Sedez - spreminjanje	t
00030000-569f-6663-bcc7-7ff320fa690e	Sezona-read	Sezona - branje	t
00030000-569f-6663-c5af-76803493e4ca	Sezona-write	Sezona - spreminjanje	t
00030000-569f-6663-27bc-5fbc97422770	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-569f-6663-5a64-89d6a45248e3	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-569f-6663-a95a-db4767c0c3bf	Telefonska-read	Telefonska - branje	t
00030000-569f-6663-4df7-273f182ce9bf	Telefonska-write	Telefonska - spreminjanje	t
00030000-569f-6663-e23f-8f675b58c57c	TerminStoritve-read	TerminStoritve - branje	t
00030000-569f-6663-f862-39874ed6c006	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-569f-6663-ed6a-b81c0d47224c	TipDodatka-read	TipDodatka - branje	t
00030000-569f-6663-45a2-fc4852cac32e	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-569f-6663-d853-3c1054a6bb94	TipFunkcije-read	TipFunkcije - branje	t
00030000-569f-6663-8a5b-b05f3dfff2e0	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-569f-6663-ba80-d1b5bf0e3f73	TipPopa-read	TipPopa - branje	t
00030000-569f-6663-d95b-a8a2deed01cc	TipPopa-write	TipPopa - spreminjanje	t
00030000-569f-6663-8efd-58d9b0006db3	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-569f-6663-b4c2-e04afd5d2c30	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-569f-6663-189c-7a954f501ff9	TipVaje-read	TipVaje - branje	t
00030000-569f-6663-321a-a0ac7a249df1	TipVaje-write	TipVaje - spreminjanje	t
00030000-569f-6663-bd51-5fe257943199	Trr-read	Trr - branje	t
00030000-569f-6663-064d-18508e0bdd79	Trr-write	Trr - spreminjanje	t
00030000-569f-6663-47a5-6be6d7f612c4	Uprizoritev-read	Uprizoritev - branje	t
00030000-569f-6663-5f33-74c00dc1fdba	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-569f-6663-e4f7-e15a619f1733	Vaja-read	Vaja - branje	t
00030000-569f-6663-fba2-7379801f1ba5	Vaja-write	Vaja - spreminjanje	t
00030000-569f-6663-6a8f-0f52ee6b38e1	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-569f-6663-3518-bb9907ef46ae	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-569f-6663-cc27-35b13e275754	VrstaStroska-read	VrstaStroska - branje	t
00030000-569f-6663-6924-c4a306c951df	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-569f-6663-0612-787284efda7f	Zaposlitev-read	Zaposlitev - branje	t
00030000-569f-6663-823e-39056c3a3897	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-569f-6663-2a76-f6ae51a53c78	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-569f-6663-1c9a-13953fbede68	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-569f-6663-892a-de48761bb54d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-569f-6663-e9d6-6a95d1bdb61b	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-569f-6663-6d57-bc8f11946a65	Job-read	Branje opravil - samo zase - branje	t
00030000-569f-6663-eb4d-450312316977	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-569f-6663-b8c3-c7caeb6d5295	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-569f-6663-c79d-ecca2a061918	Report-read	Report - branje	t
00030000-569f-6663-6d0c-37974945feed	Report-write	Report - spreminjanje	t
00030000-569f-6663-7421-9f4ae83a4886	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-569f-6663-74d5-871b6efd90c9	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-569f-6663-daf0-057fb0e44e0f	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-569f-6663-33e0-0b43d5b6e676	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-569f-6663-108e-524e1b0522c9	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-569f-6663-b94e-015b46645613	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-569f-6663-3ed4-f84cd124f1a5	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-569f-6663-6169-f7aec6ec11b9	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-6663-c344-ed4cda6e11d2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-569f-6663-f8b7-112be857cc33	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-6663-6caf-30a1df01223c	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-569f-6663-eb07-24330b8e5bba	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-569f-6663-28ce-0f9bf1007ae2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-569f-6663-943b-7a169b805576	Datoteka-write	Datoteka - spreminjanje	t
00030000-569f-6663-f954-bd84f8ec5b2e	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3143 (class 0 OID 38354934)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-569f-6663-9450-28bf82296f6c	00030000-569f-6663-e7be-68a74ea5193b
00020000-569f-6663-9450-28bf82296f6c	00030000-569f-6663-b321-68cf728f8a22
00020000-569f-6663-25a8-b57f7f0ee374	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-69ef-fb02d4f08696	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-b5a8-768e48b628e5	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6663-b5a8-768e48b628e5	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6663-b5a8-768e48b628e5	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-b5a8-768e48b628e5	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-b5a8-768e48b628e5	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-b5a8-768e48b628e5	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-823e-39056c3a3897
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6663-e51b-0fb39ac526da	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6663-2bee-d6eaaf1644c8	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-2bee-d6eaaf1644c8	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-2bee-d6eaaf1644c8	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-3c00-4cbe1c0628a0	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-c455-c1369a8ae28f	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-c455-c1369a8ae28f	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-c455-c1369a8ae28f	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-c455-c1369a8ae28f	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-cb39-35767761e4a6	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-9c40-b6f6e622e062	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-eac8-1e581c99ae01
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-3050-05217ec0d423
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-4e7c-4d8598a80b67
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-5149-6c4ca48227e4	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-c385-e0eb10930f09	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6663-7f1d-6d3d580b3b7d	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6663-7f1d-6d3d580b3b7d	00030000-569f-6663-d95b-a8a2deed01cc
00020000-569f-6663-83b9-e9bd44f11903	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6663-ee23-34d7ff29d916	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6663-ee23-34d7ff29d916	00030000-569f-6663-1287-2b1f3d84a600
00020000-569f-6663-5e98-c8752125c7ef	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6663-95bf-9aab9a868cb8	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-95bf-9aab9a868cb8	00030000-569f-6663-f81f-1731ce12e3d5
00020000-569f-6663-8fd3-9cbc572eb5ae	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-ea3f-317f8985e9ee	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6663-ea3f-317f8985e9ee	00030000-569f-6663-e9d6-6a95d1bdb61b
00020000-569f-6663-01da-c02476a8e395	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6663-c622-a53bebb542e0	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6663-c622-a53bebb542e0	00030000-569f-6663-1c9a-13953fbede68
00020000-569f-6663-4174-1605ec53324d	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6663-d326-0ce8722b54e9	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6663-d326-0ce8722b54e9	00030000-569f-6663-7510-3b9ce1199aa5
00020000-569f-6663-8016-056921d256d0	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6663-977e-09fe53bc98f3	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6663-977e-09fe53bc98f3	00030000-569f-6663-e344-41b781adfb8a
00020000-569f-6663-977e-09fe53bc98f3	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-977e-09fe53bc98f3	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-977e-09fe53bc98f3	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6663-977e-09fe53bc98f3	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-9673-3804667e3bce	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6663-9673-3804667e3bce	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-9673-3804667e3bce	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-70db-77be3f2d45de	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6663-70db-77be3f2d45de	00030000-569f-6663-6924-c4a306c951df
00020000-569f-6663-1f5b-b4fe31e24b62	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-aed6-0f224e405099
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-cd96-3226c9b70652	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-86c5-f5908f052a86	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6663-86c5-f5908f052a86	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-86c5-f5908f052a86	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-86c5-f5908f052a86	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-86c5-f5908f052a86	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-ca78-6ff03d986355	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6663-ca78-6ff03d986355	00030000-569f-6663-321a-a0ac7a249df1
00020000-569f-6663-6df6-ef29d4f09b02	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-2fcd-4eee9e859bdd
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-760c-48ed6e623c48
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-20ba-c88ff786b801
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-8154-90b3557c50d9
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-a4e6-c37217fdb5e4
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-2d7c-6cb81d9b326d
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-bf62-26f9029e9415
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-69ae-b51909cef754
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-f6e5-483316b17e68
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-55e7-bcfc82483a36
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-7d57-a2fb72008955
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-6302-2a93eae35139
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-7d81-546e01a119df
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-7497-4310a91b6bef
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-0f38-71f231b3ba00
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-87aa-fd2b48d9613b
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-3b98-7dadd0422da5
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-721e-c64f42b3c142
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-bac9-77a6af28a7e3
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-8b35-496eda55cf5e
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-f1cd-c1c517e5a076
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-089d-dbc27e50b946
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-ee4d-0c4ee0b1d2d5
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-af94-2701848c0923
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-abe7-44c9010dddca
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-eb4d-450312316977
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-b6e0-1d4194137a3a
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-ed3b-a9b97497006d
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-6d3a-ac4bb7826ba5
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-6d57-bc8f11946a65
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-bb13-095c975208c0	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-20ba-c88ff786b801
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-a4e6-c37217fdb5e4
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-bf62-26f9029e9415
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-f6e5-483316b17e68
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-7d57-a2fb72008955
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-7d81-546e01a119df
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-0f38-71f231b3ba00
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-3b98-7dadd0422da5
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-bac9-77a6af28a7e3
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-f1cd-c1c517e5a076
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-ed3b-a9b97497006d
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-b6e0-1d4194137a3a
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-6d3a-ac4bb7826ba5
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-6d57-bc8f11946a65
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-b7df-c59aca7502eb	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-5bbf-7505d3f719e8
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-5a16-78a0326972ce	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-4a9e-087e06b1b921	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-dc6f-6626cb631761	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-10b4-3c54d8826888
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-3703-913fcbcc6c25	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-e885-449fed95167f	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-c6bc-ae66c76edbcb	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-43fa-c83099729a20	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-43fa-c83099729a20	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6663-43fa-c83099729a20	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-43fa-c83099729a20	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-7fcf-96d6fec4224a	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-7fcf-96d6fec4224a	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-943b-7a169b805576
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-b6e0-1d4194137a3a
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-af94-2701848c0923
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-5bbf-7505d3f719e8
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-6d57-bc8f11946a65
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-eb4d-450312316977
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-10b4-3c54d8826888
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-6d3a-ac4bb7826ba5
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-abe7-44c9010dddca
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-ed3b-a9b97497006d
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-ee4d-0c4ee0b1d2d5
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-2fcd-4eee9e859bdd
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-20ba-c88ff786b801
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-760c-48ed6e623c48
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-8154-90b3557c50d9
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-a4e6-c37217fdb5e4
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-2d7c-6cb81d9b326d
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-bf62-26f9029e9415
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-69ae-b51909cef754
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-f6e5-483316b17e68
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-55e7-bcfc82483a36
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-7d57-a2fb72008955
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-6302-2a93eae35139
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-7d81-546e01a119df
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-7497-4310a91b6bef
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-0f38-71f231b3ba00
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-87aa-fd2b48d9613b
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-3b98-7dadd0422da5
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-721e-c64f42b3c142
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-bac9-77a6af28a7e3
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-8b35-496eda55cf5e
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-f1cd-c1c517e5a076
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-089d-dbc27e50b946
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-0612-787284efda7f
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6663-bc8a-f311c64e0c3b	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-943b-7a169b805576
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-0612-787284efda7f
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6664-bc94-c4f6013f9a92	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-943b-7a169b805576
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-5bbf-7505d3f719e8
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-0612-787284efda7f
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6664-c7b0-9353c37a0830	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-943b-7a169b805576
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-b6e0-1d4194137a3a
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-af94-2701848c0923
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-5bbf-7505d3f719e8
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-6d57-bc8f11946a65
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-eb4d-450312316977
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-3050-05217ec0d423
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-10b4-3c54d8826888
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-eac8-1e581c99ae01
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-6d3a-ac4bb7826ba5
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-abe7-44c9010dddca
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-ed3b-a9b97497006d
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-ee4d-0c4ee0b1d2d5
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-4e7c-4d8598a80b67
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-2fcd-4eee9e859bdd
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-20ba-c88ff786b801
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-760c-48ed6e623c48
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-8154-90b3557c50d9
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-a4e6-c37217fdb5e4
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-2d7c-6cb81d9b326d
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-bf62-26f9029e9415
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-69ae-b51909cef754
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-f6e5-483316b17e68
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-55e7-bcfc82483a36
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-7d57-a2fb72008955
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-6302-2a93eae35139
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-7d81-546e01a119df
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-7497-4310a91b6bef
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-0f38-71f231b3ba00
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-87aa-fd2b48d9613b
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-3b98-7dadd0422da5
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-721e-c64f42b3c142
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-bac9-77a6af28a7e3
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-8b35-496eda55cf5e
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-f1cd-c1c517e5a076
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-089d-dbc27e50b946
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-0612-787284efda7f
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-823e-39056c3a3897
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6664-8f43-4f7d46477b31	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-943b-7a169b805576
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-5bbf-7505d3f719e8
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-3050-05217ec0d423
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-eac8-1e581c99ae01
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-4e7c-4d8598a80b67
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-0612-787284efda7f
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-823e-39056c3a3897
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6664-e762-994effbad2ac	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-0612-787284efda7f
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6664-199c-5f61602e9a47	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-943b-7a169b805576
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-b6e0-1d4194137a3a
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-af94-2701848c0923
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-6d57-bc8f11946a65
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-eb4d-450312316977
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-3050-05217ec0d423
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-aed6-0f224e405099
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-10b4-3c54d8826888
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-eac8-1e581c99ae01
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-6d3a-ac4bb7826ba5
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-abe7-44c9010dddca
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-ed3b-a9b97497006d
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-ee4d-0c4ee0b1d2d5
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-4e7c-4d8598a80b67
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-2fcd-4eee9e859bdd
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-20ba-c88ff786b801
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-760c-48ed6e623c48
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-8154-90b3557c50d9
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-a4e6-c37217fdb5e4
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-2d7c-6cb81d9b326d
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-bf62-26f9029e9415
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-69ae-b51909cef754
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-f6e5-483316b17e68
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-55e7-bcfc82483a36
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-7d57-a2fb72008955
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-6302-2a93eae35139
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-7d81-546e01a119df
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-7497-4310a91b6bef
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-0f38-71f231b3ba00
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-87aa-fd2b48d9613b
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-3b98-7dadd0422da5
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-721e-c64f42b3c142
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-bac9-77a6af28a7e3
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-8b35-496eda55cf5e
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-f1cd-c1c517e5a076
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-089d-dbc27e50b946
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-6924-c4a306c951df
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-0612-787284efda7f
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-823e-39056c3a3897
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6664-c195-8fb5c34caca7	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b321-68cf728f8a22
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e7be-68a74ea5193b
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-31df-e1d250e44f5e
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7510-3b9ce1199aa5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5acb-a1cade5d4705
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1f5e-0a6343fb6c3f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-cab0-0d9bbd801ec4
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-0895-90a82f2d221f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-622c-ab24e55603ff
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-a02f-5652467dbe71
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-051e-083241f7b06e
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-68f2-946d22c3502f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-943b-7a169b805576
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8e96-63ba097956cc
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b144-01fb85acf2b3
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f3fc-8bd2653242bc
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-20d7-f8eedd50774a
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3ec1-01a3af79961f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-2e25-777bab510b21
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-68cf-1f7cfab6fdb6
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-9c6d-ec20194def5f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8748-71edd9c1e9d7
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b6e0-1d4194137a3a
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-af94-2701848c0923
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-448d-2a58ba83d843
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f81f-1731ce12e3d5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-453f-8b6add927fc0
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f466-586c80446daa
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5bbf-7505d3f719e8
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-86ce-c6b23ee24b9f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-9232-a11426e86ad3
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b8c3-c7caeb6d5295
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6d57-bc8f11946a65
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-eb4d-450312316977
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-a1fa-f01136e55fcd
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3050-05217ec0d423
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-48d2-c8881b06300a
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8047-a29ef8c5cda4
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3ed4-f84cd124f1a5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b94e-015b46645613
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-74d5-871b6efd90c9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-daf0-057fb0e44e0f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-33e0-0b43d5b6e676
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-108e-524e1b0522c9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e96f-35047f3f141c
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-2e9e-9d71a2331c79
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f2b5-f7e489e13765
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3eca-b45224485a94
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5e45-ac982c3ab168
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5d9e-64c613ff1fa9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-03a7-a41442463f78
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-aed6-0f224e405099
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7b00-8179248fafee
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1f49-acec01c00ee2
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-76b8-de1fcabd9abe
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8368-e4882f52c025
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-10b4-3c54d8826888
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-eac8-1e581c99ae01
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-156a-42eb9beede78
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6d3a-ac4bb7826ba5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-abe7-44c9010dddca
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1548-fe9347f820d5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-94a4-c6cffa070be4
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1287-2b1f3d84a600
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b16c-2fb70d901bb1
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-98cb-68ea6928b189
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-eabc-466aa079a103
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-465d-3aaf106d1874
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6064-37d5795587c0
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-9512-3896628f4162
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-ed3b-a9b97497006d
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-ee4d-0c4ee0b1d2d5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-deb8-f6bd38f1df75
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-4e7c-4d8598a80b67
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-2fcd-4eee9e859bdd
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-20ba-c88ff786b801
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-760c-48ed6e623c48
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8154-90b3557c50d9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-a4e6-c37217fdb5e4
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-2d7c-6cb81d9b326d
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-bf62-26f9029e9415
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-69ae-b51909cef754
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f6e5-483316b17e68
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-55e7-bcfc82483a36
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7d57-a2fb72008955
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6302-2a93eae35139
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7d81-546e01a119df
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7497-4310a91b6bef
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-0f38-71f231b3ba00
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-87aa-fd2b48d9613b
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3b98-7dadd0422da5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-721e-c64f42b3c142
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-bac9-77a6af28a7e3
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8b35-496eda55cf5e
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f1cd-c1c517e5a076
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-089d-dbc27e50b946
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1284-18a7138ae634
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e344-41b781adfb8a
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5f24-cea38511997c
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-d58c-cdc09bbfc9ed
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7184-ac58165086fb
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-0a9c-713f807614b6
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1c15-ec5dfbbee356
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f690-97caaef842a7
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6f77-8a74a7e1e4af
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-ab56-a0f25fc36d63
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-c79d-ecca2a061918
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6d0c-37974945feed
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-867e-b9e1f28419b9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3f01-b23bf30911d5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-0642-c7a68d0aa18a
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e4b7-7068c8642785
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-0a7f-b85aa03ee432
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-fb11-bb0b6807c400
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-ad79-c75269091871
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8fff-266613834576
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-bcc7-7ff320fa690e
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-c5af-76803493e4ca
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-7421-9f4ae83a4886
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e23f-8f675b58c57c
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e5db-751283771dbf
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f862-39874ed6c006
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-d853-3c1054a6bb94
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8a5b-b05f3dfff2e0
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-ba80-d1b5bf0e3f73
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-d95b-a8a2deed01cc
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-8efd-58d9b0006db3
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-b4c2-e04afd5d2c30
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-189c-7a954f501ff9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-321a-a0ac7a249df1
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e4f7-e15a619f1733
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-fba2-7379801f1ba5
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6a8f-0f52ee6b38e1
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-3518-bb9907ef46ae
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-cc27-35b13e275754
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6924-c4a306c951df
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-28ce-0f9bf1007ae2
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-eb07-24330b8e5bba
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-0612-787284efda7f
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-823e-39056c3a3897
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-2a76-f6ae51a53c78
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-1c9a-13953fbede68
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-892a-de48761bb54d
00020000-569f-6666-ae71-95c14be17e22	00030000-569f-6663-e9d6-6a95d1bdb61b
00020000-569f-6666-62c3-c0bc0c051e32	00030000-569f-6663-6caf-30a1df01223c
00020000-569f-6666-41e3-aa511e80691f	00030000-569f-6663-f8b7-112be857cc33
00020000-569f-6666-74ec-0cddf77a2a63	00030000-569f-6663-5f33-74c00dc1fdba
00020000-569f-6666-c64b-1b01f000291e	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6666-a9ba-8441f1f73306	00030000-569f-6663-daf0-057fb0e44e0f
00020000-569f-6666-45b2-c89452f13474	00030000-569f-6663-33e0-0b43d5b6e676
00020000-569f-6666-1a05-e180402ec133	00030000-569f-6663-108e-524e1b0522c9
00020000-569f-6666-89c8-79120048fb68	00030000-569f-6663-74d5-871b6efd90c9
00020000-569f-6666-63dc-c22ab63c1eab	00030000-569f-6663-3ed4-f84cd124f1a5
00020000-569f-6666-9ecb-6acc28d8799f	00030000-569f-6663-b94e-015b46645613
00020000-569f-6666-fe6c-1e59aecd5f81	00030000-569f-6663-c344-ed4cda6e11d2
00020000-569f-6666-3ae3-afd8af7864b7	00030000-569f-6663-6169-f7aec6ec11b9
00020000-569f-6666-ed81-cf72dc14b3b7	00030000-569f-6663-8678-5a33a5415e48
00020000-569f-6666-db32-83581e909ae4	00030000-569f-6663-8396-4b36f793497c
00020000-569f-6666-3029-0cd36ef8e3cd	00030000-569f-6663-8fde-7c381dad294c
00020000-569f-6666-8282-c66906995858	00030000-569f-6663-7af8-3b597d17e89d
00020000-569f-6666-279f-30f8031f5d4b	00030000-569f-6663-943b-7a169b805576
00020000-569f-6666-a9f8-94301dd039b1	00030000-569f-6663-f954-bd84f8ec5b2e
00020000-569f-6666-ab46-3feebebef6c2	00030000-569f-6663-9bf7-e405a393770b
00020000-569f-6666-ab46-3feebebef6c2	00030000-569f-6663-eac8-1e581c99ae01
00020000-569f-6666-ab46-3feebebef6c2	00030000-569f-6663-47a5-6be6d7f612c4
00020000-569f-6666-faf6-1509e6dae82e	00030000-569f-6663-bd51-5fe257943199
00020000-569f-6666-d09f-10732c529534	00030000-569f-6663-064d-18508e0bdd79
00020000-569f-6666-ad06-a2bb5be808f1	00030000-569f-6663-7421-9f4ae83a4886
00020000-569f-6666-04a7-faf14dab5dab	00030000-569f-6663-a95a-db4767c0c3bf
00020000-569f-6666-657f-307672da84bb	00030000-569f-6663-4df7-273f182ce9bf
00020000-569f-6666-7425-b96731d7c42e	00030000-569f-6663-70c2-a1ae235205d9
00020000-569f-6666-50f5-667ce100cceb	00030000-569f-6663-afae-496435f13b4b
00020000-569f-6666-41b1-8de51651e5b5	00030000-569f-6663-0612-787284efda7f
00020000-569f-6666-ac7b-df2416d1faef	00030000-569f-6663-823e-39056c3a3897
00020000-569f-6666-8198-be274d14393c	00030000-569f-6663-21f2-c475505c01dc
00020000-569f-6666-9d42-2a2f518bb807	00030000-569f-6663-10b4-3c54d8826888
00020000-569f-6666-74e5-85166ac1b58e	00030000-569f-6663-27bc-5fbc97422770
00020000-569f-6666-1f01-c101bed64f27	00030000-569f-6663-5a64-89d6a45248e3
00020000-569f-6666-3c44-6b46fe46a17a	00030000-569f-6663-f46a-85eedf7f4c60
00020000-569f-6666-5123-de7cff3b78a0	00030000-569f-6663-954c-83adfd2604bd
00020000-569f-6666-48ca-14cdd2a4a910	00030000-569f-6663-cccc-622cacd0bd86
00020000-569f-6666-6504-1775cde65114	00030000-569f-6663-5f54-b0122f889757
00020000-569f-6666-aa78-7b51de46ba0a	00030000-569f-6663-8649-e4f2d79a67ad
00020000-569f-6666-9dbd-73da3f0ac744	00030000-569f-6663-5bbf-7505d3f719e8
\.


--
-- TOC entry 3182 (class 0 OID 38355333)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3186 (class 0 OID 38355367)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 38355500)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-569f-6666-89b6-e956d312bcdd	00090000-569f-6666-ea27-6b82c1985c5a	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-569f-6666-0526-5f2a3f890ce3	00090000-569f-6666-bf09-59e792677f19	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-569f-6666-f6d5-df229db8ed8c	00090000-569f-6666-da20-df8285971943	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-569f-6666-fd56-c5375f134b61	00090000-569f-6666-1f8f-717e9f3e3388	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3151 (class 0 OID 38355016)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-569f-6666-bf2d-057c0dcb3942	\N	00040000-569f-6663-718d-f7254ae80150	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-e2d7-5517087b4368	\N	00040000-569f-6663-718d-f7254ae80150	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-569f-6666-9980-a0220ad64b5c	\N	00040000-569f-6663-718d-f7254ae80150	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-a361-9ccb965a54ce	\N	00040000-569f-6663-718d-f7254ae80150	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-db54-b1a5ab8dcd12	\N	00040000-569f-6663-718d-f7254ae80150	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-53cb-a91a4dff4c2a	\N	00040000-569f-6663-52df-2e9b5d2c4508	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-6cc9-0533b874afee	\N	00040000-569f-6663-4f61-2af5f65e7fe4	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-39bb-4a3363509ceb	\N	00040000-569f-6663-adbd-95a196772ccc	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6666-7f45-2fea9c532529	\N	00040000-569f-6663-a7fd-0771caf04bc6	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-569f-6668-1cce-ccfb73e62907	\N	00040000-569f-6663-718d-f7254ae80150	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3154 (class 0 OID 38355061)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-569f-6662-263d-0b19d7cebebf	8341	Adlešiči
00050000-569f-6662-f543-df80fb1bde97	5270	Ajdovščina
00050000-569f-6662-6ba0-fc7611eac6d0	6280	Ankaran/Ancarano
00050000-569f-6662-510e-3b309d60dcbb	9253	Apače
00050000-569f-6662-fe34-64c55d7f3789	8253	Artiče
00050000-569f-6662-0afa-cbad0d983942	4275	Begunje na Gorenjskem
00050000-569f-6662-cb6f-36b7ad74cd71	1382	Begunje pri Cerknici
00050000-569f-6662-efca-550beb8d86a1	9231	Beltinci
00050000-569f-6662-a52f-26aab590a388	2234	Benedikt
00050000-569f-6662-868d-03e0fa72af19	2345	Bistrica ob Dravi
00050000-569f-6662-e15c-3591af596feb	3256	Bistrica ob Sotli
00050000-569f-6662-7655-afc741736cf9	8259	Bizeljsko
00050000-569f-6662-07e8-d08a20c925ed	1223	Blagovica
00050000-569f-6662-92e5-d789eaee5d76	8283	Blanca
00050000-569f-6662-5ea2-64038a4af428	4260	Bled
00050000-569f-6662-5e20-a5ae5686da85	4273	Blejska Dobrava
00050000-569f-6662-b15e-86369cd66e82	9265	Bodonci
00050000-569f-6662-12d0-aaa84c0c6311	9222	Bogojina
00050000-569f-6662-2a74-35f6c04e8dce	4263	Bohinjska Bela
00050000-569f-6662-86f8-48a610367ce7	4264	Bohinjska Bistrica
00050000-569f-6662-f48a-61815b7075eb	4265	Bohinjsko jezero
00050000-569f-6662-a963-75d75b50ceb4	1353	Borovnica
00050000-569f-6662-3349-364505e47a19	8294	Boštanj
00050000-569f-6662-7041-63d1c2e6458e	5230	Bovec
00050000-569f-6662-05d0-d998f72bb444	5295	Branik
00050000-569f-6662-23fb-fc54e5f9c1fb	3314	Braslovče
00050000-569f-6662-a4b0-6c7c9d0da02a	5223	Breginj
00050000-569f-6662-33ec-b0371c1d8cde	8280	Brestanica
00050000-569f-6662-3488-cef7abc0ac22	2354	Bresternica
00050000-569f-6662-a950-b38b5a8d5eb6	4243	Brezje
00050000-569f-6662-ca5b-dee5e7ed80b2	1351	Brezovica pri Ljubljani
00050000-569f-6662-4d68-da16e2f36a7b	8250	Brežice
00050000-569f-6662-2e8a-db0dbb35e467	4210	Brnik - Aerodrom
00050000-569f-6662-deba-2d62030955be	8321	Brusnice
00050000-569f-6662-d38d-4da4367334bf	3255	Buče
00050000-569f-6662-2f46-234d1516e273	8276	Bučka 
00050000-569f-6662-241e-0629b071f36e	9261	Cankova
00050000-569f-6662-1bd4-ac296814b1ba	3000	Celje 
00050000-569f-6662-6141-39611f6015a4	3001	Celje - poštni predali
00050000-569f-6662-4b32-ae144f424e23	4207	Cerklje na Gorenjskem
00050000-569f-6662-c08a-d251b71fbd6d	8263	Cerklje ob Krki
00050000-569f-6662-f14f-2ba617a088a6	1380	Cerknica
00050000-569f-6662-ccee-74aaf58ebf78	5282	Cerkno
00050000-569f-6662-0459-16fe5cad333e	2236	Cerkvenjak
00050000-569f-6662-75a7-bafd3846d88f	2215	Ceršak
00050000-569f-6662-62d7-82e95e588e60	2326	Cirkovce
00050000-569f-6662-a2dd-cbc9dbab5723	2282	Cirkulane
00050000-569f-6662-21ca-322ad97721e8	5273	Col
00050000-569f-6662-1da7-704813f4fce0	8251	Čatež ob Savi
00050000-569f-6662-6dd6-4315e2147333	1413	Čemšenik
00050000-569f-6662-d0b2-6de65d425cf7	5253	Čepovan
00050000-569f-6662-4c59-26dd5400195a	9232	Črenšovci
00050000-569f-6662-6c0b-ad4a0762bc09	2393	Črna na Koroškem
00050000-569f-6662-e517-24ee15a65993	6275	Črni Kal
00050000-569f-6662-96c0-69a564fed77c	5274	Črni Vrh nad Idrijo
00050000-569f-6662-1a07-187b3be7abb7	5262	Črniče
00050000-569f-6662-b158-65d3bd92e5cd	8340	Črnomelj
00050000-569f-6662-9e1f-d06a817ec54f	6271	Dekani
00050000-569f-6662-7c04-63b4a483439e	5210	Deskle
00050000-569f-6662-c821-61444417efa1	2253	Destrnik
00050000-569f-6662-d824-e393368ba082	6215	Divača
00050000-569f-6662-9468-5a1ff461cdd8	1233	Dob
00050000-569f-6662-13d1-4a85a1eaa3e8	3224	Dobje pri Planini
00050000-569f-6662-7b4b-835c76737223	8257	Dobova
00050000-569f-6662-6842-9ee5506d0119	1423	Dobovec
00050000-569f-6662-1a52-6912e0bdc38b	5263	Dobravlje
00050000-569f-6662-22e0-6bcd3966abc8	3204	Dobrna
00050000-569f-6662-5425-700d74850383	8211	Dobrnič
00050000-569f-6662-6d1f-8ead24b71dab	1356	Dobrova
00050000-569f-6662-1b09-50e89f0ed792	9223	Dobrovnik/Dobronak 
00050000-569f-6662-5cb0-6f002d8c01d7	5212	Dobrovo v Brdih
00050000-569f-6662-f0e5-f8f0c02a0030	1431	Dol pri Hrastniku
00050000-569f-6662-cafa-91ad0a9db222	1262	Dol pri Ljubljani
00050000-569f-6662-d734-8c41e31f577a	1273	Dole pri Litiji
00050000-569f-6662-1cf2-1bbc96ff0da8	1331	Dolenja vas
00050000-569f-6662-0f20-aac3abb44ca6	8350	Dolenjske Toplice
00050000-569f-6662-b32e-44492feb9547	1230	Domžale
00050000-569f-6662-d284-a5e9f0d7d405	2252	Dornava
00050000-569f-6662-a7de-0bbec73a7814	5294	Dornberk
00050000-569f-6662-ddc2-204c3d5d47b2	1319	Draga
00050000-569f-6662-c27c-64eb9cd67cab	8343	Dragatuš
00050000-569f-6662-c7eb-8231003cc82f	3222	Dramlje
00050000-569f-6662-ed62-19b0ec491993	2370	Dravograd
00050000-569f-6662-cf5b-c324a651aa48	4203	Duplje
00050000-569f-6662-2c0d-5422bb1319b0	6221	Dutovlje
00050000-569f-6662-2236-a7c228d439a1	8361	Dvor
00050000-569f-6662-4d90-a72af74b8aa0	2343	Fala
00050000-569f-6662-ace0-0eb25d5b1d6d	9208	Fokovci
00050000-569f-6662-fd3d-c3f7f9cc8626	2313	Fram
00050000-569f-6662-e9b4-4a44a055a876	3213	Frankolovo
00050000-569f-6662-bd41-131e2d6143ac	1274	Gabrovka
00050000-569f-6662-1037-a31e33642d5d	8254	Globoko
00050000-569f-6662-627b-2a3505e53d2f	5275	Godovič
00050000-569f-6662-54a9-29309e011a25	4204	Golnik
00050000-569f-6662-cc30-98f9261706a3	3303	Gomilsko
00050000-569f-6662-1cb2-989cc31984c3	4224	Gorenja vas
00050000-569f-6662-d095-7b3f92af8cb8	3263	Gorica pri Slivnici
00050000-569f-6662-1911-0e601808b793	2272	Gorišnica
00050000-569f-6662-2c92-2574efa72226	9250	Gornja Radgona
00050000-569f-6662-2c13-6f29034b8f31	3342	Gornji Grad
00050000-569f-6662-465b-f5a730c3ea93	4282	Gozd Martuljek
00050000-569f-6662-1741-228f259e2ae2	6272	Gračišče
00050000-569f-6662-c3ec-41da7896d075	9264	Grad
00050000-569f-6662-4f28-a70c9ad5ccc7	8332	Gradac
00050000-569f-6662-6dd9-fd9adf093b25	1384	Grahovo
00050000-569f-6662-79ba-b7c2a8e85c7f	5242	Grahovo ob Bači
00050000-569f-6662-7d53-92b4be3171be	5251	Grgar
00050000-569f-6662-e97b-cd554bc15ae2	3302	Griže
00050000-569f-6662-30e6-d0d120a67e60	3231	Grobelno
00050000-569f-6662-b62d-f7e2d0ae0ede	1290	Grosuplje
00050000-569f-6662-1350-559c86c339ec	2288	Hajdina
00050000-569f-6662-5f70-ce09b9bef4ad	8362	Hinje
00050000-569f-6662-0070-3e9c728644b9	2311	Hoče
00050000-569f-6662-5146-327b073df4d7	9205	Hodoš/Hodos
00050000-569f-6662-77b0-f7659c87b91c	1354	Horjul
00050000-569f-6662-79a0-05084a300e0f	1372	Hotedršica
00050000-569f-6662-e1e2-0416c87f3248	1430	Hrastnik
00050000-569f-6662-47fe-d49366b53290	6225	Hruševje
00050000-569f-6662-60ba-5790ede32204	4276	Hrušica
00050000-569f-6662-72fd-8afacfdd270c	5280	Idrija
00050000-569f-6662-d992-1c1272f79bbc	1292	Ig
00050000-569f-6662-5bf2-d51f54b4db0f	6250	Ilirska Bistrica
00050000-569f-6662-50a7-31bef03ecceb	6251	Ilirska Bistrica-Trnovo
00050000-569f-6662-c2a3-18dfb609b526	1295	Ivančna Gorica
00050000-569f-6662-551f-1e7d5fc2f4f2	2259	Ivanjkovci
00050000-569f-6662-4c89-24539efc4c38	1411	Izlake
00050000-569f-6662-353c-2d4ad0d448bb	6310	Izola/Isola
00050000-569f-6662-765d-0c430ca78a05	2222	Jakobski Dol
00050000-569f-6662-f06d-0adf943e723a	2221	Jarenina
00050000-569f-6662-6ee2-ebccf372262c	6254	Jelšane
00050000-569f-6662-796c-c106e36b5244	4270	Jesenice
00050000-569f-6662-c295-00bd3260d17e	8261	Jesenice na Dolenjskem
00050000-569f-6662-7aa6-390fcd919dc5	3273	Jurklošter
00050000-569f-6662-7afa-37836a35126f	2223	Jurovski Dol
00050000-569f-6662-d09a-8df057cd2518	2256	Juršinci
00050000-569f-6662-90ff-95fd50221f31	5214	Kal nad Kanalom
00050000-569f-6662-67e7-4723dc65499e	3233	Kalobje
00050000-569f-6662-5ff3-6dc522cc1fd0	4246	Kamna Gorica
00050000-569f-6662-efd3-b4a15917e4ef	2351	Kamnica
00050000-569f-6662-b5e0-d2973baf9918	1241	Kamnik
00050000-569f-6662-bb7c-e127375361ca	5213	Kanal
00050000-569f-6662-1154-a2fb5c5b9de5	8258	Kapele
00050000-569f-6662-9b6c-a3c05556cc65	2362	Kapla
00050000-569f-6662-2720-fb669bfb7313	2325	Kidričevo
00050000-569f-6662-141c-a9f2685acbae	1412	Kisovec
00050000-569f-6662-1e2b-57702c11bbb6	6253	Knežak
00050000-569f-6662-5a6b-b9b993b91541	5222	Kobarid
00050000-569f-6662-d175-72bea11aae2d	9227	Kobilje
00050000-569f-6662-99ee-38cd3f2df898	1330	Kočevje
00050000-569f-6662-01b4-ce5ef673f8f7	1338	Kočevska Reka
00050000-569f-6662-4020-3cb68851224b	2276	Kog
00050000-569f-6662-32f8-f9ae6565da67	5211	Kojsko
00050000-569f-6662-7aaf-3ce3b2bb6ede	6223	Komen
00050000-569f-6662-2208-4d29a7e53480	1218	Komenda
00050000-569f-6662-f0a0-c89c0a6aefb4	6000	Koper/Capodistria 
00050000-569f-6662-0e56-ee66b73beeff	6001	Koper/Capodistria - poštni predali
00050000-569f-6662-0dd7-c09553a0e769	8282	Koprivnica
00050000-569f-6662-65af-6c50adebfd9e	5296	Kostanjevica na Krasu
00050000-569f-6662-3813-f3e628318d3f	8311	Kostanjevica na Krki
00050000-569f-6662-81cd-d3e50356f5d7	1336	Kostel
00050000-569f-6662-15ae-ff0cb61b2a4d	6256	Košana
00050000-569f-6662-dc25-72d4cb3b9782	2394	Kotlje
00050000-569f-6662-f0cc-6dc75520a872	6240	Kozina
00050000-569f-6662-26e9-0f38eee537af	3260	Kozje
00050000-569f-6662-a2f2-6206f232d3de	4000	Kranj 
00050000-569f-6662-ff96-5421c7ac80cd	4001	Kranj - poštni predali
00050000-569f-6662-ccdf-19996b996bc5	4280	Kranjska Gora
00050000-569f-6662-54d9-d976fe08e795	1281	Kresnice
00050000-569f-6662-1a3d-85b6485f3058	4294	Križe
00050000-569f-6662-aabb-bc474a395cc8	9206	Križevci
00050000-569f-6662-0933-ef5af5bc2c8b	9242	Križevci pri Ljutomeru
00050000-569f-6662-edfe-93b77d1c4b78	1301	Krka
00050000-569f-6662-4454-db99978a9d21	8296	Krmelj
00050000-569f-6662-eb85-b91120a398a3	4245	Kropa
00050000-569f-6662-c2c7-6c304ee45509	8262	Krška vas
00050000-569f-6662-2dc3-8f8b26a20166	8270	Krško
00050000-569f-6662-6cb5-44905d07a7d4	9263	Kuzma
00050000-569f-6662-1f73-4b9b877a2259	2318	Laporje
00050000-569f-6662-84a5-9b1fbc2b1664	3270	Laško
00050000-569f-6662-83ef-4988ba346432	1219	Laze v Tuhinju
00050000-569f-6662-42f3-add63bb7e783	2230	Lenart v Slovenskih goricah
00050000-569f-6662-53bb-448162c4b83f	9220	Lendava/Lendva
00050000-569f-6662-a131-95c550fae92b	4248	Lesce
00050000-569f-6662-73a8-639b80879d0d	3261	Lesično
00050000-569f-6662-0930-8d03ab2e6ee2	8273	Leskovec pri Krškem
00050000-569f-6662-dd05-1dfe29cb8c62	2372	Libeliče
00050000-569f-6662-75f2-4b1d6ff81910	2341	Limbuš
00050000-569f-6662-1fbe-2a33fc6db73e	1270	Litija
00050000-569f-6662-e479-f95186e9c5b7	3202	Ljubečna
00050000-569f-6662-55a4-51ac08cfd71d	1000	Ljubljana 
00050000-569f-6662-f121-cfcb4bd44d17	1001	Ljubljana - poštni predali
00050000-569f-6662-f0e5-89d667f05015	1231	Ljubljana - Črnuče
00050000-569f-6662-740d-c0384c82f746	1261	Ljubljana - Dobrunje
00050000-569f-6662-26fb-9974dc37b2eb	1260	Ljubljana - Polje
00050000-569f-6662-0621-abf8fbad10b0	1210	Ljubljana - Šentvid
00050000-569f-6662-e540-c327520042ee	1211	Ljubljana - Šmartno
00050000-569f-6662-5369-17506a9b56ff	3333	Ljubno ob Savinji
00050000-569f-6662-6582-47e1e267108d	9240	Ljutomer
00050000-569f-6662-ce05-4dc06348df39	3215	Loče
00050000-569f-6662-9f59-88851c57fee1	5231	Log pod Mangartom
00050000-569f-6662-606e-dbd6142c781c	1358	Log pri Brezovici
00050000-569f-6662-1263-475dedac1fe6	1370	Logatec
00050000-569f-6662-6759-a24503cedd8b	1371	Logatec
00050000-569f-6662-9767-c7dcb2653210	1434	Loka pri Zidanem Mostu
00050000-569f-6662-1acf-88eb27f926f6	3223	Loka pri Žusmu
00050000-569f-6662-3937-fdd6d378d43e	6219	Lokev
00050000-569f-6662-4644-9faa5ac6e81b	1318	Loški Potok
00050000-569f-6662-be58-1d5b3491fec4	2324	Lovrenc na Dravskem polju
00050000-569f-6662-4955-33f46a5cc766	2344	Lovrenc na Pohorju
00050000-569f-6662-59e5-682ad6ab7d91	3334	Luče
00050000-569f-6662-5b8f-3b45baa26e55	1225	Lukovica
00050000-569f-6662-af4a-94f174338ab0	9202	Mačkovci
00050000-569f-6662-224b-d332afdf7039	2322	Majšperk
00050000-569f-6662-528f-bd5601cf4b3a	2321	Makole
00050000-569f-6662-4126-300a43c778c0	9243	Mala Nedelja
00050000-569f-6662-d3d0-86dc4a19df86	2229	Malečnik
00050000-569f-6662-d316-1519211c6d78	6273	Marezige
00050000-569f-6662-5042-59f296c3f763	2000	Maribor 
00050000-569f-6662-83af-58185409962f	2001	Maribor - poštni predali
00050000-569f-6662-d346-8310c8ea0d53	2206	Marjeta na Dravskem polju
00050000-569f-6662-72b4-de616ceb67ca	2281	Markovci
00050000-569f-6662-e3f3-8bf9c6de6985	9221	Martjanci
00050000-569f-6662-03b4-43ab2ad66319	6242	Materija
00050000-569f-6662-6dd7-3402ace38728	4211	Mavčiče
00050000-569f-6662-2125-9043bf419bf6	1215	Medvode
00050000-569f-6662-db6b-15a0bab35de4	1234	Mengeš
00050000-569f-6662-a087-d5af2774cf26	8330	Metlika
00050000-569f-6662-089b-0f13fd5a7436	2392	Mežica
00050000-569f-6662-ab86-69f2ddbd825f	2204	Miklavž na Dravskem polju
00050000-569f-6662-6874-f767cbc5ef92	2275	Miklavž pri Ormožu
00050000-569f-6662-8f44-0dfe3683d1cd	5291	Miren
00050000-569f-6662-a7e4-1d5ce3ba7fda	8233	Mirna
00050000-569f-6662-33d4-f4cfb25d5e3d	8216	Mirna Peč
00050000-569f-6662-39b5-0d83547c356b	2382	Mislinja
00050000-569f-6662-8117-9b22fdf44560	4281	Mojstrana
00050000-569f-6662-cfbf-7714df599029	8230	Mokronog
00050000-569f-6662-43cd-734eb08bdec9	1251	Moravče
00050000-569f-6662-051a-38fcafcf3a20	9226	Moravske Toplice
00050000-569f-6662-1e1c-2336eb7e6a4c	5216	Most na Soči
00050000-569f-6662-1dfa-7e0ce18141e1	1221	Motnik
00050000-569f-6662-8358-a25b4fc14cdb	3330	Mozirje
00050000-569f-6662-dae3-8f20da05b943	9000	Murska Sobota 
00050000-569f-6662-5a23-975960758a09	9001	Murska Sobota - poštni predali
00050000-569f-6662-0a75-1041b76e1664	2366	Muta
00050000-569f-6662-59d6-a78ce285444a	4202	Naklo
00050000-569f-6662-d903-4f0876c79710	3331	Nazarje
00050000-569f-6662-a0b2-a6b1f14bb57c	1357	Notranje Gorice
00050000-569f-6662-6f8e-febdd01797ac	3203	Nova Cerkev
00050000-569f-6662-faf2-0c13e782e571	5000	Nova Gorica 
00050000-569f-6662-14dd-3b9965f96d16	5001	Nova Gorica - poštni predali
00050000-569f-6662-c5cc-e93e005f0e6a	1385	Nova vas
00050000-569f-6662-df8b-afd6e172599e	8000	Novo mesto
00050000-569f-6662-a6af-e9e0962a757f	8001	Novo mesto - poštni predali
00050000-569f-6662-b33a-495d93b2010e	6243	Obrov
00050000-569f-6662-407f-7384bf565679	9233	Odranci
00050000-569f-6662-011e-90c4c28acf11	2317	Oplotnica
00050000-569f-6662-2306-6202ddb213dd	2312	Orehova vas
00050000-569f-6662-3fcf-0dcf2c24503d	2270	Ormož
00050000-569f-6662-12fa-35e5919b3485	1316	Ortnek
00050000-569f-6662-82e6-c04cecb4045e	1337	Osilnica
00050000-569f-6662-6d5d-9c7fc12ac0f4	8222	Otočec
00050000-569f-6662-c34b-e6d8c657bf6d	2361	Ožbalt
00050000-569f-6662-fc1b-72703b79d3b5	2231	Pernica
00050000-569f-6662-f427-e7b5b82d8eda	2211	Pesnica pri Mariboru
00050000-569f-6662-87e1-ccdeaa7f22ea	9203	Petrovci
00050000-569f-6662-3c12-925163f53240	3301	Petrovče
00050000-569f-6662-6927-0a7f66c70a14	6330	Piran/Pirano
00050000-569f-6662-548b-172b3102df72	8255	Pišece
00050000-569f-6662-9fac-6ad65fcfeb1b	6257	Pivka
00050000-569f-6662-abc6-c09eaa5b35f4	6232	Planina
00050000-569f-6662-b4c1-72997ae4110d	3225	Planina pri Sevnici
00050000-569f-6662-1540-2149b0002318	6276	Pobegi
00050000-569f-6662-b8b3-4223c53ce051	8312	Podbočje
00050000-569f-6662-5713-e1c561922621	5243	Podbrdo
00050000-569f-6662-9767-9fa39d5f4886	3254	Podčetrtek
00050000-569f-6662-6eb4-9079f213a563	2273	Podgorci
00050000-569f-6662-5b85-94fa6731c7fc	6216	Podgorje
00050000-569f-6662-ba51-012bb4133466	2381	Podgorje pri Slovenj Gradcu
00050000-569f-6662-ca47-00bbc1ce79fc	6244	Podgrad
00050000-569f-6662-b99e-863d2200b0aa	1414	Podkum
00050000-569f-6662-6f4f-68f58be6c8a0	2286	Podlehnik
00050000-569f-6662-6906-2621476b6d44	5272	Podnanos
00050000-569f-6662-7e8d-f74fc4fd97d7	4244	Podnart
00050000-569f-6662-4cce-9e93af100ef4	3241	Podplat
00050000-569f-6662-61b6-d27c1e84e29c	3257	Podsreda
00050000-569f-6662-e6c1-0c2be0ddb999	2363	Podvelka
00050000-569f-6662-bc50-31620344f517	2208	Pohorje
00050000-569f-6662-fb2a-404bae3eb4f7	2257	Polenšak
00050000-569f-6662-b0a2-70e90b03e087	1355	Polhov Gradec
00050000-569f-6662-d192-5dad15098f37	4223	Poljane nad Škofjo Loko
00050000-569f-6662-2ee5-62c3649d0598	2319	Poljčane
00050000-569f-6662-1578-dcec12f95205	1272	Polšnik
00050000-569f-6662-69d6-9c146f02f043	3313	Polzela
00050000-569f-6662-d725-8d769582147c	3232	Ponikva
00050000-569f-6662-ad8d-a67a21ca8a0d	6320	Portorož/Portorose
00050000-569f-6662-8428-5d17aca98c7b	6230	Postojna
00050000-569f-6662-4cda-57fab0f53ed2	2331	Pragersko
00050000-569f-6662-c9a4-e706b1a389ca	3312	Prebold
00050000-569f-6662-23a7-c8287617bb11	4205	Preddvor
00050000-569f-6662-3222-c710fa7128b0	6255	Prem
00050000-569f-6662-960d-b877189cec34	1352	Preserje
00050000-569f-6662-a258-9ffea5517e8a	6258	Prestranek
00050000-569f-6662-90a2-14ed55229520	2391	Prevalje
00050000-569f-6662-c29c-b1b5088a63be	3262	Prevorje
00050000-569f-6662-bbef-0d9a36cf6d46	1276	Primskovo 
00050000-569f-6662-015f-ca6c459d7acd	3253	Pristava pri Mestinju
00050000-569f-6662-afb7-ef24191a3cb4	9207	Prosenjakovci/Partosfalva
00050000-569f-6662-29a0-2a74df1de0ac	5297	Prvačina
00050000-569f-6662-6391-0952a4d98b5c	2250	Ptuj
00050000-569f-6662-5570-991f9cd781dd	2323	Ptujska Gora
00050000-569f-6662-e568-f881c41afffd	9201	Puconci
00050000-569f-6662-b6da-35b19fbeb11b	2327	Rače
00050000-569f-6662-da19-81f954bded44	1433	Radeče
00050000-569f-6662-a1db-49cf6fc98d6d	9252	Radenci
00050000-569f-6662-0d56-a3cc1bd8204e	2360	Radlje ob Dravi
00050000-569f-6662-801b-1396050e53dc	1235	Radomlje
00050000-569f-6662-bf78-8cf2c54ab5d0	4240	Radovljica
00050000-569f-6662-9161-15e401b47c75	8274	Raka
00050000-569f-6662-cd7c-8ee48fad90e0	1381	Rakek
00050000-569f-6662-566e-fd6e81ba9efa	4283	Rateče - Planica
00050000-569f-6662-90c5-e15a36e812c7	2390	Ravne na Koroškem
00050000-569f-6662-b140-3d95de03e140	9246	Razkrižje
00050000-569f-6662-df63-74706d1456a4	3332	Rečica ob Savinji
00050000-569f-6662-efb6-fea6101b1350	5292	Renče
00050000-569f-6662-6b9a-303c5de403d0	1310	Ribnica
00050000-569f-6662-8df7-414eb2ca0005	2364	Ribnica na Pohorju
00050000-569f-6662-5fb0-0edde7602f68	3272	Rimske Toplice
00050000-569f-6662-4c52-e3802cc6981e	1314	Rob
00050000-569f-6662-a4ab-64816797058f	5215	Ročinj
00050000-569f-6662-9102-c386c04b71e2	3250	Rogaška Slatina
00050000-569f-6662-457a-38bd0a1df701	9262	Rogašovci
00050000-569f-6662-d8f4-fb462d4da59f	3252	Rogatec
00050000-569f-6662-a72d-02bb549848b1	1373	Rovte
00050000-569f-6662-7d2f-51c163ac31c5	2342	Ruše
00050000-569f-6662-9759-cb6c83245770	1282	Sava
00050000-569f-6662-0bee-5aa7b8a8316b	6333	Sečovlje/Sicciole
00050000-569f-6662-d554-80c32ba5b6bb	4227	Selca
00050000-569f-6662-82c3-c1caf13936f7	2352	Selnica ob Dravi
00050000-569f-6662-1b62-ce62c9540985	8333	Semič
00050000-569f-6662-cbf6-1650541a80c0	8281	Senovo
00050000-569f-6662-2a1b-4adbb9018250	6224	Senožeče
00050000-569f-6662-9af7-75f602b509dc	8290	Sevnica
00050000-569f-6662-2c23-137d7b3fd9df	6210	Sežana
00050000-569f-6662-e568-76f477893f9b	2214	Sladki Vrh
00050000-569f-6662-423c-871bcb1d86ff	5283	Slap ob Idrijci
00050000-569f-6662-5b86-f70a67d04f17	2380	Slovenj Gradec
00050000-569f-6662-5ed4-0c6699a1a10a	2310	Slovenska Bistrica
00050000-569f-6662-f3f0-1370c50613bd	3210	Slovenske Konjice
00050000-569f-6662-d5d3-284fcf96599a	1216	Smlednik
00050000-569f-6662-2927-09028f25bc8d	5232	Soča
00050000-569f-6662-2a54-deca211cd53f	1317	Sodražica
00050000-569f-6662-c4b6-865e8a3a582f	3335	Solčava
00050000-569f-6662-b677-cc5d8e4de128	5250	Solkan
00050000-569f-6662-4ad1-060a7197fd76	4229	Sorica
00050000-569f-6662-d954-61fa9d85b3f8	4225	Sovodenj
00050000-569f-6662-9c6b-00050f9db448	5281	Spodnja Idrija
00050000-569f-6662-c9b3-6ac44c693db6	2241	Spodnji Duplek
00050000-569f-6662-a226-5b5a55909894	9245	Spodnji Ivanjci
00050000-569f-6662-90e6-c5257cf5b3ab	2277	Središče ob Dravi
00050000-569f-6662-3bdb-65496884a972	4267	Srednja vas v Bohinju
00050000-569f-6662-c140-a7e29e77e8fd	8256	Sromlje 
00050000-569f-6662-baf5-8bc894e7f55e	5224	Srpenica
00050000-569f-6662-2404-fc243433c69e	1242	Stahovica
00050000-569f-6662-1cc6-f8d5aec71112	1332	Stara Cerkev
00050000-569f-6662-d7dc-1cb4ac3d4ac4	8342	Stari trg ob Kolpi
00050000-569f-6662-22d4-f086634eba16	1386	Stari trg pri Ložu
00050000-569f-6662-62b7-ef8742d21fd1	2205	Starše
00050000-569f-6662-c128-d69a86a39da2	2289	Stoperce
00050000-569f-6662-2cc7-ea9b64143d7b	8322	Stopiče
00050000-569f-6662-0c7d-22e84fcc77f4	3206	Stranice
00050000-569f-6662-7479-74fad516f002	8351	Straža
00050000-569f-6662-74db-ca508808adc6	1313	Struge
00050000-569f-6662-1853-8869c1ce0463	8293	Studenec
00050000-569f-6662-0bc3-3f27c62a8e37	8331	Suhor
00050000-569f-6662-6a82-fb5d467ed1f3	2233	Sv. Ana v Slovenskih goricah
00050000-569f-6662-c95b-a5cf6e0c9a48	2235	Sv. Trojica v Slovenskih goricah
00050000-569f-6662-21cf-63d84e3dee1d	2353	Sveti Duh na Ostrem Vrhu
00050000-569f-6662-79fa-b9b5a19950fb	9244	Sveti Jurij ob Ščavnici
00050000-569f-6662-bf64-a7fffc32f2ed	3264	Sveti Štefan
00050000-569f-6662-0e95-2d9d19b3089c	2258	Sveti Tomaž
00050000-569f-6662-63bd-4957a93029f3	9204	Šalovci
00050000-569f-6662-320d-926dbbcdc1b5	5261	Šempas
00050000-569f-6662-be3d-2a7aec3762e3	5290	Šempeter pri Gorici
00050000-569f-6662-8e99-e3389fd637b4	3311	Šempeter v Savinjski dolini
00050000-569f-6662-50fb-984aa46b4916	4208	Šenčur
00050000-569f-6662-54bb-586c62c3d221	2212	Šentilj v Slovenskih goricah
00050000-569f-6662-72df-9e04fec5825f	8297	Šentjanž
00050000-569f-6662-abfb-174ae67890d2	2373	Šentjanž pri Dravogradu
00050000-569f-6662-08c5-29832001df58	8310	Šentjernej
00050000-569f-6662-6fb8-28d72dd8f213	3230	Šentjur
00050000-569f-6662-0152-6c997e5c6826	3271	Šentrupert
00050000-569f-6662-9d3f-5467beebb5ce	8232	Šentrupert
00050000-569f-6662-f667-f39e3971a535	1296	Šentvid pri Stični
00050000-569f-6662-7fd4-02a39edaa740	8275	Škocjan
00050000-569f-6662-1df0-3aa8a492b91a	6281	Škofije
00050000-569f-6662-19e7-785ffcd53e91	4220	Škofja Loka
00050000-569f-6662-55af-e6b5f405d9e5	3211	Škofja vas
00050000-569f-6662-b80f-4d48b3d68d7e	1291	Škofljica
00050000-569f-6662-5268-615909894598	6274	Šmarje
00050000-569f-6662-4c61-6a5c0a84306a	1293	Šmarje - Sap
00050000-569f-6662-f65c-5eca6d10aad2	3240	Šmarje pri Jelšah
00050000-569f-6662-265d-aed6284da40e	8220	Šmarješke Toplice
00050000-569f-6662-89de-6af238645b90	2315	Šmartno na Pohorju
00050000-569f-6662-2f27-53dddb91ab45	3341	Šmartno ob Dreti
00050000-569f-6662-f333-7680c8cf1df0	3327	Šmartno ob Paki
00050000-569f-6662-61bd-776cf126b786	1275	Šmartno pri Litiji
00050000-569f-6662-e4c9-04622ada20ae	2383	Šmartno pri Slovenj Gradcu
00050000-569f-6662-7202-5157c09bef9b	3201	Šmartno v Rožni dolini
00050000-569f-6662-d46c-51b58760c423	3325	Šoštanj
00050000-569f-6662-f018-0ae5265f1b34	6222	Štanjel
00050000-569f-6662-3549-78279f144e42	3220	Štore
00050000-569f-6662-2d70-fe6fcb362bbf	3304	Tabor
00050000-569f-6662-6b78-a35a2f3edcf3	3221	Teharje
00050000-569f-6662-3acc-ca80cedfb26f	9251	Tišina
00050000-569f-6662-94d5-5f7639a40dce	5220	Tolmin
00050000-569f-6662-3946-9a43080aea47	3326	Topolšica
00050000-569f-6662-37ce-73776f1a3044	2371	Trbonje
00050000-569f-6662-1b7b-3fc450ac7263	1420	Trbovlje
00050000-569f-6662-4f4d-1b7d9244c6d5	8231	Trebelno 
00050000-569f-6662-590f-77dadf272710	8210	Trebnje
00050000-569f-6662-b8cb-e9c58cf1f631	5252	Trnovo pri Gorici
00050000-569f-6662-b5eb-1af40033b443	2254	Trnovska vas
00050000-569f-6662-2a45-5ba10ac5a62e	1222	Trojane
00050000-569f-6662-0153-622b3dd743e6	1236	Trzin
00050000-569f-6662-b14d-98928e2fbbbc	4290	Tržič
00050000-569f-6662-87a0-52a2cd28ef7c	8295	Tržišče
00050000-569f-6662-001e-cbba81c56b22	1311	Turjak
00050000-569f-6662-ccc8-6b42153b57a2	9224	Turnišče
00050000-569f-6662-1cde-b757d9a80c27	8323	Uršna sela
00050000-569f-6662-f4fb-d3e3d61822ef	1252	Vače
00050000-569f-6662-76b5-7a74a01821ef	3320	Velenje 
00050000-569f-6662-5751-df881ed176b2	3322	Velenje - poštni predali
00050000-569f-6662-8181-abb5f00d398f	8212	Velika Loka
00050000-569f-6662-4883-0d7147a599b5	2274	Velika Nedelja
00050000-569f-6662-de0c-3c14e1423dfa	9225	Velika Polana
00050000-569f-6662-a04e-16546e67159c	1315	Velike Lašče
00050000-569f-6662-c7c3-8aad3c74f06c	8213	Veliki Gaber
00050000-569f-6662-6cad-7e2f2ea80781	9241	Veržej
00050000-569f-6662-f270-fca789c8602f	1312	Videm - Dobrepolje
00050000-569f-6662-a0a9-1f949b6ec6aa	2284	Videm pri Ptuju
00050000-569f-6662-0adf-7cff21dec09b	8344	Vinica
00050000-569f-6662-53a3-68ae7c8d6b35	5271	Vipava
00050000-569f-6662-5dba-5c178fddf1a9	4212	Visoko
00050000-569f-6662-8c6d-1c73cb3de6f5	1294	Višnja Gora
00050000-569f-6662-75a2-683ff33c916b	3205	Vitanje
00050000-569f-6662-31e2-f92c5c97f864	2255	Vitomarci
00050000-569f-6662-8796-8965e964958f	1217	Vodice
00050000-569f-6662-45af-906192261eac	3212	Vojnik\t
00050000-569f-6662-99f1-5cc46134abbf	5293	Volčja Draga
00050000-569f-6662-0c71-d2c543ad5118	2232	Voličina
00050000-569f-6662-d631-668ef3fc4856	3305	Vransko
00050000-569f-6662-ee1e-3c66ac79db99	6217	Vremski Britof
00050000-569f-6662-a45a-a56083008ebd	1360	Vrhnika
00050000-569f-6662-bdec-41a94b1b21d1	2365	Vuhred
00050000-569f-6662-7735-b8c9c51f7ff6	2367	Vuzenica
00050000-569f-6662-288c-a3bdb5d5b488	8292	Zabukovje 
00050000-569f-6662-645a-aa9d45e9329d	1410	Zagorje ob Savi
00050000-569f-6662-1aca-b514eb4148d7	1303	Zagradec
00050000-569f-6662-3260-e712b1f78176	2283	Zavrč
00050000-569f-6662-6f9e-28003db40b77	8272	Zdole 
00050000-569f-6662-8c98-586f169c9ac3	4201	Zgornja Besnica
00050000-569f-6662-8f24-f0225dcd5667	2242	Zgornja Korena
00050000-569f-6662-defd-4f01d6a73bdf	2201	Zgornja Kungota
00050000-569f-6662-0a90-1bc84290f40d	2316	Zgornja Ložnica
00050000-569f-6662-b4ab-2ed327485438	2314	Zgornja Polskava
00050000-569f-6662-b434-572623849ab2	2213	Zgornja Velka
00050000-569f-6662-83b1-b1ff5d7e66b6	4247	Zgornje Gorje
00050000-569f-6662-de33-d8049d72580a	4206	Zgornje Jezersko
00050000-569f-6662-8986-b0af9c977de5	2285	Zgornji Leskovec
00050000-569f-6662-3c8b-e3bde1353ed8	1432	Zidani Most
00050000-569f-6662-da58-8406f64c1081	3214	Zreče
00050000-569f-6662-0e87-43920e120073	4209	Žabnica
00050000-569f-6662-f1f8-4113930764d2	3310	Žalec
00050000-569f-6662-584c-020be1738926	4228	Železniki
00050000-569f-6662-ed56-c8c56e0b34b9	2287	Žetale
00050000-569f-6662-d491-90c72dc8c4a7	4226	Žiri
00050000-569f-6662-3b56-57f08890ba78	4274	Žirovnica
00050000-569f-6662-d293-6c678fe20f7f	8360	Žužemberk
\.


--
-- TOC entry 3205 (class 0 OID 38355737)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 38355307)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3153 (class 0 OID 38355046)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-569f-6666-832d-37f887f0758b	00080000-569f-6666-bf2d-057c0dcb3942	\N	00040000-569f-6663-718d-f7254ae80150	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-569f-6666-14d3-3b03c8c8f0d6	00080000-569f-6666-bf2d-057c0dcb3942	\N	00040000-569f-6663-718d-f7254ae80150	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-569f-6666-68ec-f00ba00b222d	00080000-569f-6666-e2d7-5517087b4368	\N	00040000-569f-6663-718d-f7254ae80150	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3165 (class 0 OID 38355183)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-569f-6663-b2cc-f8dad11b05a4	novo leto	1	1	\N	t
00430000-569f-6663-c919-9273f8ae1f77	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-569f-6663-b4eb-514eab84d06a	dan upora proti okupatorju	27	4	\N	t
00430000-569f-6663-7688-63a55da70ee2	praznik dela	1	5	\N	t
00430000-569f-6663-fa8c-6a80ce7e3dde	praznik dela	2	5	\N	t
00430000-569f-6663-bc3a-73b65e8f2d7b	dan Primoža Trubarja	8	6	\N	f
00430000-569f-6663-7a40-a227ed818c98	dan državnosti	25	6	\N	t
00430000-569f-6663-0af5-0a2109cdb9a4	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-569f-6663-be5f-e19280530343	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-569f-6663-1b99-9425c9c6e8b8	dan suverenosti	25	10	\N	f
00430000-569f-6663-03d5-32a69ac07da6	dan spomina na mrtve	1	11	\N	t
00430000-569f-6663-d118-469587458b32	dan Rudolfa Maistra	23	11	\N	f
00430000-569f-6663-c1af-cc69e94df36c	božič	25	12	\N	t
00430000-569f-6663-33d6-e49ebd00bfc0	dan samostojnosti in enotnosti	26	12	\N	t
00430000-569f-6663-b4fa-1bec23d3dfb7	Marijino vnebovzetje	15	8	\N	t
00430000-569f-6663-7acd-51e1ff7030f4	dan reformacije	31	10	\N	t
00430000-569f-6663-0f29-9295cf4c7ed1	velikonočna nedelja	27	3	2016	t
00430000-569f-6663-ed05-d652a5f9cb6b	velikonočna nedelja	16	4	2017	t
00430000-569f-6663-eb35-8da1867f7730	velikonočna nedelja	1	4	2018	t
00430000-569f-6663-0adc-6259da9ba37e	velikonočna nedelja	21	4	2019	t
00430000-569f-6663-d116-1cb35ecddd73	velikonočna nedelja	12	4	2020	t
00430000-569f-6663-4813-9ce241a71d6b	velikonočna nedelja	4	4	2021	t
00430000-569f-6663-875a-6c7bcda4a686	velikonočna nedelja	17	4	2022	t
00430000-569f-6663-065c-e6d81c89fc87	velikonočna nedelja	9	4	2023	t
00430000-569f-6663-5692-7325d62920aa	velikonočna nedelja	31	3	2024	t
00430000-569f-6663-9807-8529fe6de3c8	velikonočna nedelja	20	4	2025	t
00430000-569f-6663-61e2-69ef54be4f6d	velikonočna nedelja	5	4	2026	t
00430000-569f-6663-08b6-9a2b35294fe1	velikonočna nedelja	28	3	2027	t
00430000-569f-6663-8ba0-467a7e8607c0	velikonočna nedelja	16	4	2028	t
00430000-569f-6663-f028-3420a8a00b90	velikonočna nedelja	1	4	2029	t
00430000-569f-6663-8357-435f83324dd5	velikonočna nedelja	21	4	2030	t
00430000-569f-6663-0648-049c5be2ed87	velikonočni ponedeljek	28	3	2016	t
00430000-569f-6663-f484-6ac7a2e0c3b0	velikonočni ponedeljek	17	4	2017	t
00430000-569f-6663-43e1-d6574948a9b1	velikonočni ponedeljek	2	4	2018	t
00430000-569f-6663-9857-a1db6854bd3f	velikonočni ponedeljek	22	4	2019	t
00430000-569f-6663-da43-2190f402b4e2	velikonočni ponedeljek	13	4	2020	t
00430000-569f-6663-aa54-efc5a105c086	velikonočni ponedeljek	5	4	2021	t
00430000-569f-6663-fff3-a1b53dd9fe7e	velikonočni ponedeljek	18	4	2022	t
00430000-569f-6663-2ecd-4f7fa9aeb687	velikonočni ponedeljek	10	4	2023	t
00430000-569f-6663-5173-556322f8a757	velikonočni ponedeljek	1	4	2024	t
00430000-569f-6663-8623-dc6edb9a4778	velikonočni ponedeljek	21	4	2025	t
00430000-569f-6663-acfc-fde00356bbbc	velikonočni ponedeljek	6	4	2026	t
00430000-569f-6663-46c3-fb8b79a6a85b	velikonočni ponedeljek	29	3	2027	t
00430000-569f-6663-b8f1-8f7e0492c1d5	velikonočni ponedeljek	17	4	2028	t
00430000-569f-6663-9408-8c76323eb755	velikonočni ponedeljek	2	4	2029	t
00430000-569f-6663-fc32-e9b2a24ff4f2	velikonočni ponedeljek	22	4	2030	t
00430000-569f-6663-5be8-f54030759678	binkoštna nedelja - binkošti	15	5	2016	t
00430000-569f-6663-354b-9b1e8551dce1	binkoštna nedelja - binkošti	4	6	2017	t
00430000-569f-6663-8ac0-a3680a23c5d5	binkoštna nedelja - binkošti	20	5	2018	t
00430000-569f-6663-16be-9ebe0816d797	binkoštna nedelja - binkošti	9	6	2019	t
00430000-569f-6663-deb6-783fc9f67012	binkoštna nedelja - binkošti	31	5	2020	t
00430000-569f-6663-cf1b-d9425cd29252	binkoštna nedelja - binkošti	23	5	2021	t
00430000-569f-6663-509f-446972ed6502	binkoštna nedelja - binkošti	5	6	2022	t
00430000-569f-6663-8195-aafc656d325e	binkoštna nedelja - binkošti	28	5	2023	t
00430000-569f-6663-2f81-d4b02316a60c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-569f-6663-487b-31f103113244	binkoštna nedelja - binkošti	8	6	2025	t
00430000-569f-6663-c4c5-486455bee04a	binkoštna nedelja - binkošti	24	5	2026	t
00430000-569f-6663-6100-69bcd83568f3	binkoštna nedelja - binkošti	16	5	2027	t
00430000-569f-6663-225f-991d512cac12	binkoštna nedelja - binkošti	4	6	2028	t
00430000-569f-6663-f1a0-3bb93526415c	binkoštna nedelja - binkošti	20	5	2029	t
00430000-569f-6663-4a92-b8951bad4aed	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3161 (class 0 OID 38355150)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez, objavljenzacetek) FROM stdin;
001b0000-569f-6666-7863-55a23c374501	000e0000-569f-6666-8f65-85e37f4b94a9	\N	1	\N	\N
\.


--
-- TOC entry 3162 (class 0 OID 38355158)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 38355319)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 38355751)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3207 (class 0 OID 38355761)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-569f-6666-44ec-0ddd75dbb5c9	00080000-569f-6666-9980-a0220ad64b5c	0987	AK
00190000-569f-6666-2985-89dfaed55624	00080000-569f-6666-e2d7-5517087b4368	0989	AK
00190000-569f-6666-c25c-7f755efcec2f	00080000-569f-6666-a361-9ccb965a54ce	0986	AK
00190000-569f-6666-ebd9-02d8bcdb2e4f	00080000-569f-6666-53cb-a91a4dff4c2a	0984	AK
00190000-569f-6666-9309-5c62b286be7f	00080000-569f-6666-6cc9-0533b874afee	0983	AK
00190000-569f-6666-7d95-40fd30297373	00080000-569f-6666-39bb-4a3363509ceb	0982	AK
00190000-569f-6668-079d-28a35f5a418e	00080000-569f-6668-1cce-ccfb73e62907	1001	AK
\.


--
-- TOC entry 3204 (class 0 OID 38355650)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-569f-6666-a95e-409f88215125	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3208 (class 0 OID 38355769)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 38355348)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-569f-6665-a4ae-04fedd6a7205	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-569f-6665-f016-5e8bf842ce7f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-569f-6665-b9a1-92f7a8037f62	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-569f-6665-652c-c17a7018b876	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-569f-6665-09a3-01907cc5cfac	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-569f-6665-6f26-8113199d28ab	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-569f-6665-5b91-316d627005b3	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3176 (class 0 OID 38355292)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3175 (class 0 OID 38355282)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 38355489)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3191 (class 0 OID 38355419)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 38355124)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 38354886)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-569f-6668-1cce-ccfb73e62907	00010000-569f-6664-72a6-b986a24bdc6b	2016-01-20 11:50:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-569f-6668-6d9a-8fd3aee15ebd	00010000-569f-6664-72a6-b986a24bdc6b	2016-01-20 11:50:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-569f-6668-079d-28a35f5a418e	00010000-569f-6664-72a6-b986a24bdc6b	2016-01-20 11:50:16	INS	a:0:{}
\.


--
-- TOC entry 3229 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3185 (class 0 OID 38355361)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3142 (class 0 OID 38354924)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-569f-6663-9450-28bf82296f6c	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-569f-6663-25a8-b57f7f0ee374	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-569f-6663-a0d5-7db6459162f7	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-569f-6663-9761-7ac15fdd3b8d	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-569f-6663-69ef-fb02d4f08696	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-569f-6663-b5a8-768e48b628e5	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-569f-6663-e51b-0fb39ac526da	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-569f-6663-2bee-d6eaaf1644c8	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-569f-6663-3c00-4cbe1c0628a0	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-6663-c455-c1369a8ae28f	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-6663-cb39-35767761e4a6	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-6663-9c40-b6f6e622e062	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-569f-6663-5149-6c4ca48227e4	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-6663-c385-e0eb10930f09	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-569f-6663-7f1d-6d3d580b3b7d	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-6663-83b9-e9bd44f11903	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-569f-6663-ee23-34d7ff29d916	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-569f-6663-5e98-c8752125c7ef	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-569f-6663-95bf-9aab9a868cb8	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-569f-6663-8fd3-9cbc572eb5ae	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-569f-6663-ea3f-317f8985e9ee	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-6663-01da-c02476a8e395	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-569f-6663-c622-a53bebb542e0	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-6663-4174-1605ec53324d	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-569f-6663-d326-0ce8722b54e9	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-569f-6663-8016-056921d256d0	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-569f-6663-977e-09fe53bc98f3	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-569f-6663-9673-3804667e3bce	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-569f-6663-70db-77be3f2d45de	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-569f-6663-1f5b-b4fe31e24b62	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-569f-6663-cd96-3226c9b70652	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-6663-86c5-f5908f052a86	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-569f-6663-ca78-6ff03d986355	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-569f-6663-6df6-ef29d4f09b02	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-569f-6663-bb13-095c975208c0	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-569f-6663-b7df-c59aca7502eb	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-569f-6663-5a16-78a0326972ce	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-6663-4a9e-087e06b1b921	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-569f-6663-dc6f-6626cb631761	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-569f-6663-3703-913fcbcc6c25	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-6663-e885-449fed95167f	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-569f-6663-c6bc-ae66c76edbcb	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-569f-6663-43fa-c83099729a20	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-6663-7fcf-96d6fec4224a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-569f-6663-bc8a-f311c64e0c3b	direktor	minimalne pravice za direktorja	t
00020000-569f-6664-bc94-c4f6013f9a92	arhivar	arhivar	t
00020000-569f-6664-c7b0-9353c37a0830	dramaturg	dramaturg	t
00020000-569f-6664-8f43-4f7d46477b31	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-569f-6664-e762-994effbad2ac	poslovni-sekretar	poslovni sekretar	t
00020000-569f-6664-199c-5f61602e9a47	vodja-tehnike	vodja tehnike	t
00020000-569f-6664-c195-8fb5c34caca7	racunovodja	računovodja	t
00020000-569f-6666-ae71-95c14be17e22	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-569f-6666-62c3-c0bc0c051e32	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-41e3-aa511e80691f	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-74ec-0cddf77a2a63	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-c64b-1b01f000291e	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-a9ba-8441f1f73306	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-45b2-c89452f13474	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-1a05-e180402ec133	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-569f-6666-89c8-79120048fb68	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-569f-6666-63dc-c22ab63c1eab	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-9ecb-6acc28d8799f	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-fe6c-1e59aecd5f81	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-3ae3-afd8af7864b7	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-ed81-cf72dc14b3b7	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-db32-83581e909ae4	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-3029-0cd36ef8e3cd	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-8282-c66906995858	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-279f-30f8031f5d4b	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-a9f8-94301dd039b1	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-ab46-3feebebef6c2	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-569f-6666-faf6-1509e6dae82e	Trr-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-d09f-10732c529534	Trr-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-ad06-a2bb5be808f1	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-04a7-faf14dab5dab	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-657f-307672da84bb	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-7425-b96731d7c42e	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-50f5-667ce100cceb	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-41b1-8de51651e5b5	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-ac7b-df2416d1faef	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-8198-be274d14393c	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-9d42-2a2f518bb807	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-74e5-85166ac1b58e	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-1f01-c101bed64f27	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-3c44-6b46fe46a17a	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-5123-de7cff3b78a0	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-48ca-14cdd2a4a910	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-569f-6666-6504-1775cde65114	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-569f-6666-aa78-7b51de46ba0a	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-569f-6666-9dbd-73da3f0ac744	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3140 (class 0 OID 38354908)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-569f-6664-d98f-d6ffe6cdaf99	00020000-569f-6663-a0d5-7db6459162f7
00010000-569f-6664-72a6-b986a24bdc6b	00020000-569f-6663-a0d5-7db6459162f7
00010000-569f-6666-91a1-d739fd9b1dc1	00020000-569f-6666-ae71-95c14be17e22
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-62c3-c0bc0c051e32
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-a9ba-8441f1f73306
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-63dc-c22ab63c1eab
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-fe6c-1e59aecd5f81
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-ed81-cf72dc14b3b7
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-a9f8-94301dd039b1
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-74ec-0cddf77a2a63
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-faf6-1509e6dae82e
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-04a7-faf14dab5dab
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-7425-b96731d7c42e
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-41b1-8de51651e5b5
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-8198-be274d14393c
00010000-569f-6666-18c0-011761a671b0	00020000-569f-6666-3c44-6b46fe46a17a
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-62c3-c0bc0c051e32
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-41e3-aa511e80691f
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-74ec-0cddf77a2a63
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-c64b-1b01f000291e
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-ed81-cf72dc14b3b7
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-8282-c66906995858
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-faf6-1509e6dae82e
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-04a7-faf14dab5dab
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-7425-b96731d7c42e
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-41b1-8de51651e5b5
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-8198-be274d14393c
00010000-569f-6666-b5b7-b587a7df85c6	00020000-569f-6666-3c44-6b46fe46a17a
00010000-569f-6666-4bfa-375ff995de60	00020000-569f-6666-62c3-c0bc0c051e32
00010000-569f-6666-4bfa-375ff995de60	00020000-569f-6666-41e3-aa511e80691f
00010000-569f-6666-4bfa-375ff995de60	00020000-569f-6666-74ec-0cddf77a2a63
00010000-569f-6666-4bfa-375ff995de60	00020000-569f-6666-c64b-1b01f000291e
00010000-569f-6666-4bfa-375ff995de60	00020000-569f-6666-fe6c-1e59aecd5f81
00010000-569f-6666-4bfa-375ff995de60	00020000-569f-6666-ed81-cf72dc14b3b7
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-41e3-aa511e80691f
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-45b2-c89452f13474
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-9ecb-6acc28d8799f
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-3ae3-afd8af7864b7
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-fe6c-1e59aecd5f81
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-279f-30f8031f5d4b
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-ed81-cf72dc14b3b7
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-db32-83581e909ae4
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-faf6-1509e6dae82e
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-d09f-10732c529534
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-04a7-faf14dab5dab
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-657f-307672da84bb
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-7425-b96731d7c42e
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-50f5-667ce100cceb
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-41b1-8de51651e5b5
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-ac7b-df2416d1faef
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-8198-be274d14393c
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-9d42-2a2f518bb807
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-3c44-6b46fe46a17a
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-5123-de7cff3b78a0
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-6504-1775cde65114
00010000-569f-6666-3da7-0f6e71e9a32f	00020000-569f-6666-aa78-7b51de46ba0a
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-41e3-aa511e80691f
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-45b2-c89452f13474
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-89c8-79120048fb68
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-9ecb-6acc28d8799f
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-3ae3-afd8af7864b7
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-fe6c-1e59aecd5f81
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-279f-30f8031f5d4b
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-ed81-cf72dc14b3b7
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-db32-83581e909ae4
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-3029-0cd36ef8e3cd
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-faf6-1509e6dae82e
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-d09f-10732c529534
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-ad06-a2bb5be808f1
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-04a7-faf14dab5dab
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-657f-307672da84bb
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-7425-b96731d7c42e
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-50f5-667ce100cceb
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-41b1-8de51651e5b5
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-ac7b-df2416d1faef
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-8198-be274d14393c
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-9d42-2a2f518bb807
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-3c44-6b46fe46a17a
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-5123-de7cff3b78a0
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-48ca-14cdd2a4a910
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-6504-1775cde65114
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-aa78-7b51de46ba0a
00010000-569f-6666-dbf1-12644f3408e0	00020000-569f-6666-9dbd-73da3f0ac744
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-41e3-aa511e80691f
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-74ec-0cddf77a2a63
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-45b2-c89452f13474
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-1a05-e180402ec133
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-89c8-79120048fb68
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-a9ba-8441f1f73306
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-9ecb-6acc28d8799f
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-3ae3-afd8af7864b7
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-fe6c-1e59aecd5f81
00010000-569f-6666-1829-b010923d8686	00020000-569f-6666-279f-30f8031f5d4b
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-62c3-c0bc0c051e32
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-c64b-1b01f000291e
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-a9ba-8441f1f73306
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-63dc-c22ab63c1eab
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-fe6c-1e59aecd5f81
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-ed81-cf72dc14b3b7
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-a9f8-94301dd039b1
00010000-569f-6666-aa62-cc2290ccfdeb	00020000-569f-6666-74e5-85166ac1b58e
00010000-569f-6666-863b-881e8e90d5da	00020000-569f-6666-ab46-3feebebef6c2
00010000-569f-6666-604a-7065128f4a54	00020000-569f-6663-bc8a-f311c64e0c3b
00010000-569f-6666-f5d4-3e61877cc226	00020000-569f-6664-bc94-c4f6013f9a92
00010000-569f-6666-ad6d-3ac764d58f15	00020000-569f-6664-c7b0-9353c37a0830
00010000-569f-6666-0f32-959449e4c49a	00020000-569f-6664-8f43-4f7d46477b31
00010000-569f-6666-f851-d9b36f4c8291	00020000-569f-6664-e762-994effbad2ac
00010000-569f-6666-9b14-9ae333f730e3	00020000-569f-6664-199c-5f61602e9a47
00010000-569f-6666-24f9-44d52d2dfb81	00020000-569f-6664-c195-8fb5c34caca7
\.


--
-- TOC entry 3187 (class 0 OID 38355375)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 38355313)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 38355236)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-569f-6665-49e3-5078f5dc47dc	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-569f-6665-7f79-1420bd3b7dd1	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-569f-6665-cee2-53faa287004c	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3136 (class 0 OID 38354873)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-569f-6663-05ba-158cd9928b54	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-569f-6663-8175-3654f8b19df0	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-569f-6663-01fb-2eec0e3c7394	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-569f-6663-d14f-f8bff65df1d0	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-569f-6663-9c21-c288087326a5	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3135 (class 0 OID 38354865)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-569f-6663-f30c-aaf1a04955ec	00230000-569f-6663-d14f-f8bff65df1d0	popa
00240000-569f-6663-f70c-32378d2979ec	00230000-569f-6663-d14f-f8bff65df1d0	oseba
00240000-569f-6663-85c9-120315d760cf	00230000-569f-6663-d14f-f8bff65df1d0	tippopa
00240000-569f-6663-cfb4-f52f5f8f4453	00230000-569f-6663-d14f-f8bff65df1d0	organizacijskaenota
00240000-569f-6663-c86a-71a1250f15f3	00230000-569f-6663-d14f-f8bff65df1d0	sezona
00240000-569f-6663-fdf8-6e17c850b0de	00230000-569f-6663-d14f-f8bff65df1d0	tipvaje
00240000-569f-6663-cb17-3e3ae64fe423	00230000-569f-6663-d14f-f8bff65df1d0	tipdodatka
00240000-569f-6663-58c1-11c82749369f	00230000-569f-6663-8175-3654f8b19df0	prostor
00240000-569f-6663-a0f6-06cd4c4cfa68	00230000-569f-6663-d14f-f8bff65df1d0	besedilo
00240000-569f-6663-2bea-27e7d5b51698	00230000-569f-6663-d14f-f8bff65df1d0	uprizoritev
00240000-569f-6663-a1ee-27c988906bc9	00230000-569f-6663-d14f-f8bff65df1d0	funkcija
00240000-569f-6663-f02e-acfe30db5585	00230000-569f-6663-d14f-f8bff65df1d0	tipfunkcije
00240000-569f-6663-9905-d74ed9c0ce10	00230000-569f-6663-d14f-f8bff65df1d0	alternacija
00240000-569f-6663-6bf7-daf4a85736c9	00230000-569f-6663-05ba-158cd9928b54	pogodba
00240000-569f-6663-87c9-a775334d739d	00230000-569f-6663-d14f-f8bff65df1d0	zaposlitev
00240000-569f-6663-208f-3d628b9b6022	00230000-569f-6663-d14f-f8bff65df1d0	zvrstuprizoritve
00240000-569f-6663-25ba-5b42dfdf17d0	00230000-569f-6663-05ba-158cd9928b54	programdela
00240000-569f-6663-73ef-041db2c96428	00230000-569f-6663-d14f-f8bff65df1d0	zapis
\.


--
-- TOC entry 3134 (class 0 OID 38354860)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
010b8cbb-4dd5-47eb-8fd5-9b5834fdface	00240000-569f-6663-f30c-aaf1a04955ec	0	1001
\.


--
-- TOC entry 3193 (class 0 OID 38355436)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-569f-6666-2adc-840799e0227b	000e0000-569f-6666-8f65-85e37f4b94a9	00080000-569f-6666-bf2d-057c0dcb3942	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-569f-6663-0a09-f947a9d62f28
00270000-569f-6666-8213-95105c0d4283	000e0000-569f-6666-8f65-85e37f4b94a9	00080000-569f-6666-bf2d-057c0dcb3942	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-569f-6663-0a09-f947a9d62f28
\.


--
-- TOC entry 3150 (class 0 OID 38355008)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 38355255)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-569f-6666-b7a7-be2757db949c	00180000-569f-6666-221f-88f5a76ce9f1	000c0000-569f-6666-9819-50f698be5ce9	00090000-569f-6666-ea27-6b82c1985c5a	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-6666-2ac2-768361a4fd46	00180000-569f-6666-221f-88f5a76ce9f1	000c0000-569f-6666-2816-a8ae3682a02a	00090000-569f-6666-1f8f-717e9f3e3388	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-6666-bac3-a3d12c87309b	00180000-569f-6666-221f-88f5a76ce9f1	000c0000-569f-6666-b07f-967d16cfec5b	00090000-569f-6666-5a00-25527881351d	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-6666-a195-e4fd4c9a6c04	00180000-569f-6666-221f-88f5a76ce9f1	000c0000-569f-6666-57e6-195cc43967fe	00090000-569f-6666-f285-7779a2a8fcac	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-6666-1b0e-0946276bc89f	00180000-569f-6666-221f-88f5a76ce9f1	000c0000-569f-6666-33a4-d91a7e10903d	00090000-569f-6666-06d5-e7eaf1f7b756	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-569f-6666-0651-1fbfa28f2a20	00180000-569f-6666-0c30-a28594fe29bd	\N	00090000-569f-6666-06d5-e7eaf1f7b756	644940	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-569f-6666-d0f4-75fc76dde9c2	00180000-569f-6666-cc1a-42dd0b5693dc	\N	00090000-569f-6666-1f8f-717e9f3e3388	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-569f-6666-e7e1-c75b7493598e	00180000-569f-6666-221f-88f5a76ce9f1	\N	00090000-569f-6666-b306-6cebbe6f1287	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3174 (class 0 OID 38355272)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-569f-6663-740c-08eaabd60caa	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-569f-6663-1ebc-54e8a0e31a20	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-569f-6663-750f-fcba70e1f939	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-569f-6663-ec89-243a47184ac5	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-569f-6663-cbb8-00e179c513db	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-569f-6663-c7db-d3417e7cb898	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3196 (class 0 OID 38355477)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-569f-6663-1792-dd48e744a9a4	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-569f-6663-f500-7102d2deb4ee	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-569f-6663-4f60-5986000bbc7b	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-569f-6663-e8fc-cf964619c043	04	Režija	Režija	Režija	umetnik	30
000f0000-569f-6663-0559-e5fd3ff6c44e	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-569f-6663-d292-a923f616d95e	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-569f-6663-39d6-0b940974cd45	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-569f-6663-448f-b6a26899f56c	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-569f-6663-4922-14c12c9ab55c	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-569f-6663-33ba-d077b1b1a113	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-569f-6663-d0d0-29ef23dfb350	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-569f-6663-acca-68d5aaa4204c	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-569f-6663-4dd1-d0266fb67268	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-569f-6663-9bd6-37e5a946cf30	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-569f-6663-460b-27bf67e4208e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-569f-6663-c81a-c846d9df756b	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-569f-6663-0188-cb0144f3064e	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-569f-6663-3a2f-3962954f7f3c	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-569f-6663-5758-b84fd83d9eae	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3147 (class 0 OID 38354959)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-569f-6665-22b8-89200069bdd2	0001	šola	osnovna ali srednja šola
00400000-569f-6665-3487-15239d587fae	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-569f-6665-2564-a1d3094ba992	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3209 (class 0 OID 38355781)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-569f-6663-0c87-23a02c8cd006	01	Velika predstava	f	1.00	1.00
002b0000-569f-6663-bfa6-aa2557d04c84	02	Mala predstava	f	0.50	0.50
002b0000-569f-6663-82da-655a392c7142	03	Mala koprodukcija	t	0.40	1.00
002b0000-569f-6663-e972-87784a426960	04	Srednja koprodukcija	t	0.70	2.00
002b0000-569f-6663-6ffa-a27bb672cadd	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3169 (class 0 OID 38355226)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-569f-6663-f8b5-42f0acc9519e	0001	prva vaja	prva vaja
00420000-569f-6663-b134-10235f1e207d	0002	tehnična vaja	tehnična vaja
00420000-569f-6663-2209-e5f8728bc8b2	0003	lučna vaja	lučna vaja
00420000-569f-6663-6788-cb934d3d5437	0004	kostumska vaja	kostumska vaja
00420000-569f-6663-a376-e89467e3bf7b	0005	foto vaja	foto vaja
00420000-569f-6663-cd09-306a3f3017c9	0006	1. glavna vaja	1. glavna vaja
00420000-569f-6663-847c-e541254770b4	0007	2. glavna vaja	2. glavna vaja
00420000-569f-6663-b171-fdba01e601a4	0008	1. generalka	1. generalka
00420000-569f-6663-814b-4a5184158cdd	0009	2. generalka	2. generalka
00420000-569f-6663-661b-b456387c2386	0010	odprta generalka	odprta generalka
00420000-569f-6663-f233-17d6db95b871	0011	obnovitvena vaja	obnovitvena vaja
00420000-569f-6663-6c77-0c0013f263f6	0012	italijanka	krajša "obnovitvena" vaja
00420000-569f-6663-3a83-02148ff4afb6	0013	pevska vaja	pevska vaja
00420000-569f-6663-5f06-441310ec3f87	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-569f-6663-263e-a258e64ee3bd	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-569f-6663-dc8f-dcd43da4da5b	0016	orientacijska vaja	orientacijska vaja
00420000-569f-6663-9865-4f66020f2f9b	0017	situacijska vaja	situacijska vaja
00420000-569f-6663-d337-5f84e1492b78	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3156 (class 0 OID 38355081)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 38354895)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-569f-6664-72a6-b986a24bdc6b	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROcFQlWCx.vJtG3Rom.VsZnL8yUM0QJ0C	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-569f-6666-2f8d-15e346676683	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-569f-6666-8d28-b20a22bfbedc	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-569f-6666-5f28-5f12f47e7aa0	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-569f-6666-444f-16a0e2337794	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-569f-6666-1214-3386cd4a3919	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-569f-6666-8a26-503d0ec3be92	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-569f-6666-4624-073745a808b0	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-569f-6666-95e2-c51ece15919b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-569f-6666-58e3-3e0df9407d10	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-569f-6666-91a1-d739fd9b1dc1	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-569f-6666-cbf2-5fcd63425436	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-569f-6666-18c0-011761a671b0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-569f-6666-b5b7-b587a7df85c6	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-569f-6666-4bfa-375ff995de60	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-569f-6666-3da7-0f6e71e9a32f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-569f-6666-dbf1-12644f3408e0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-569f-6666-1829-b010923d8686	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-569f-6666-aa62-cc2290ccfdeb	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-569f-6666-863b-881e8e90d5da	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-569f-6666-604a-7065128f4a54	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-569f-6666-f5d4-3e61877cc226	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-569f-6666-ad6d-3ac764d58f15	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-569f-6666-0f32-959449e4c49a	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-569f-6666-f851-d9b36f4c8291	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-569f-6666-9b14-9ae333f730e3	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-569f-6666-24f9-44d52d2dfb81	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-569f-6664-d98f-d6ffe6cdaf99	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3200 (class 0 OID 38355527)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-569f-6666-8976-518f18c8dcd8	00160000-569f-6665-7b88-92d528ec4a6e	\N	00140000-569f-6663-9f92-19721fb46878	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-569f-6665-09a3-01907cc5cfac
000e0000-569f-6666-8f65-85e37f4b94a9	00160000-569f-6665-c398-59d94c892b92	\N	00140000-569f-6663-2264-986127ea4b82	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-569f-6665-6f26-8113199d28ab
000e0000-569f-6666-2e88-9ec809931587	\N	\N	00140000-569f-6663-2264-986127ea4b82	00190000-569f-6666-44ec-0ddd75dbb5c9	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-6665-09a3-01907cc5cfac
000e0000-569f-6666-34fd-01b875bba677	\N	\N	00140000-569f-6663-2264-986127ea4b82	00190000-569f-6666-44ec-0ddd75dbb5c9	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-569f-6665-09a3-01907cc5cfac
000e0000-569f-6666-0979-c59cef2717c8	\N	\N	00140000-569f-6663-2264-986127ea4b82	00190000-569f-6666-44ec-0ddd75dbb5c9	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-be02-aa6ab308b4ec	\N	\N	00140000-569f-6663-2264-986127ea4b82	00190000-569f-6666-44ec-0ddd75dbb5c9	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-8426-e3a632a7e623	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-1d48-012bbb9f1e66	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-b202-c915344e2681	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-5ca4-f529251eef3c	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-a75c-0697e49dd66d	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-3865-b47a85c0c410	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-1e7c-aee969047e84	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-0181-497c79fced41	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
000e0000-569f-6666-c649-64e92a37982d	\N	\N	00140000-569f-6663-0f8c-ab69ac196bbf	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-569f-6665-a4ae-04fedd6a7205
\.


--
-- TOC entry 3171 (class 0 OID 38355246)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 38355176)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-569f-6666-a1ce-e219eb3a7b03	\N	000e0000-569f-6666-8f65-85e37f4b94a9	1
00200000-569f-6666-0bb3-e390fb848cd8	\N	000e0000-569f-6666-8f65-85e37f4b94a9	2
00200000-569f-6666-e736-8192d07f7ce8	\N	000e0000-569f-6666-8f65-85e37f4b94a9	3
00200000-569f-6666-7e84-0909da1218d9	\N	000e0000-569f-6666-8f65-85e37f4b94a9	4
00200000-569f-6666-1b7f-362c55688c90	\N	000e0000-569f-6666-8f65-85e37f4b94a9	5
\.


--
-- TOC entry 3183 (class 0 OID 38355340)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3194 (class 0 OID 38355450)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-569f-6663-21aa-a9b1d372e2b8	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-569f-6663-0384-1fef03978506	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-569f-6663-f176-cdf14ff320a4	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-569f-6663-85b7-a3a9b1f01133	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-569f-6663-ca90-57470a76d081	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-569f-6663-23b9-b6958e16add1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-569f-6663-60b8-cdde78f812c6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-569f-6663-c37f-0ec8102b6b65	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-569f-6663-0a09-f947a9d62f28	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-569f-6663-d51a-5ff0ab2abef9	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-569f-6663-6ffc-aa68a89473d9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-569f-6663-d42a-e9a063996dcf	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-569f-6663-b744-a5ac95323654	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-569f-6663-dfde-ce4a3312c42c	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-569f-6663-9532-143bb3505f34	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-569f-6663-d624-3a14a3db5258	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-569f-6663-10ab-9766974663da	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-569f-6663-1c34-60072fd620a0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-569f-6663-6fdf-ee889b1d6228	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-569f-6663-12f8-e06e9506e8b8	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-569f-6663-240d-0a0de123fac7	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-569f-6663-47d7-33ef46c4643a	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-569f-6663-6739-066621a6b425	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-569f-6663-b827-78cc69990bf5	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-569f-6663-732a-7531d50ad2d0	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-569f-6663-0fed-62bf83d02525	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-569f-6663-66e8-0de239c7937a	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-569f-6663-68bb-e817258f8164	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3212 (class 0 OID 38355831)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3211 (class 0 OID 38355800)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 38355843)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 38355412)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-569f-6666-b595-48b5079084e3	00090000-569f-6666-1f8f-717e9f3e3388	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-6666-afa6-523baf1cfe86	00090000-569f-6666-5a00-25527881351d	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-6666-d680-74802a0a8a5d	00090000-569f-6666-28d6-43abbeec0672	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-6666-eac4-866181b4179f	00090000-569f-6666-a1b0-eb6a6f47e648	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-6666-ae81-c15746594c81	00090000-569f-6666-d94e-a197943d51d9	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-569f-6666-2746-0e87e6fc4e4d	00090000-569f-6666-8bea-0de83c52cbf5	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3133 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3199 (class 0 OID 38355517)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-569f-6663-9f92-19721fb46878	01	Drama	drama (SURS 01)
00140000-569f-6663-c1df-6e0378e539da	02	Opera	opera (SURS 02)
00140000-569f-6663-0ab4-d7459ece385a	03	Balet	balet (SURS 03)
00140000-569f-6663-3dca-fbfaf1204f7a	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-569f-6663-0f8c-ab69ac196bbf	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-569f-6663-2264-986127ea4b82	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-569f-6663-a483-aa7917680ae3	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3189 (class 0 OID 38355402)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2621 (class 2606 OID 38354958)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 38355575)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 38355566)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 38354949)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 38355433)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 38355475)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 38355884)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 38355269)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 38355205)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 38355220)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 38355225)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 38355798)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 38355107)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 38355644)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 38355398)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2693 (class 2606 OID 38355174)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 38355145)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 38355121)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 38355305)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 38355861)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 38355868)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 38355892)
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
-- TOC entry 2766 (class 2606 OID 38355332)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 38355079)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 38354977)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 38355041)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2632 (class 2606 OID 38355004)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 38354938)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2610 (class 2606 OID 38354923)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 38355338)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 38355374)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 38355512)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 38355032)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2656 (class 2606 OID 38355067)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 38355749)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2758 (class 2606 OID 38355311)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 38355057)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 38355190)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 38355162)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2687 (class 2606 OID 38355155)
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
-- TOC entry 2764 (class 2606 OID 38355323)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 38355758)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 38355766)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 38355736)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 38355779)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 38355356)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 38355296)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 38355287)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 38355499)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 38355426)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 38355133)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2602 (class 2606 OID 38354894)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 38355365)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2608 (class 2606 OID 38354912)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2612 (class 2606 OID 38354932)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 38355383)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 38355318)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 38355244)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 38354882)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 38354870)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 38354864)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 38355446)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2638 (class 2606 OID 38355013)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 38355261)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 38355279)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 38355486)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 38354966)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 38355791)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 38355233)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 38355092)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2604 (class 2606 OID 38354907)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 38355545)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 38355252)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 38355180)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 38355346)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 38355458)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 38355841)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 38355825)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 38355849)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 38355416)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 38355525)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 38355410)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 1259 OID 38355214)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2704 (class 1259 OID 38355215)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2705 (class 1259 OID 38355213)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2706 (class 1259 OID 38355212)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2707 (class 1259 OID 38355211)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 38355447)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 38355448)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 38355449)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 38355863)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 38355862)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2639 (class 1259 OID 38355034)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2640 (class 1259 OID 38355035)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 38355339)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 38355829)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 38355828)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 38355830)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 38355827)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 38355826)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2761 (class 1259 OID 38355325)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2762 (class 1259 OID 38355324)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2695 (class 1259 OID 38355181)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2696 (class 1259 OID 38355182)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 38355399)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 38355401)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 38355400)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2671 (class 1259 OID 38355123)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2672 (class 1259 OID 38355122)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 38355780)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 38355514)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 38355515)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 38355516)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 38355850)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 38355550)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 38355547)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 38355551)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 38355549)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 38355548)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2661 (class 1259 OID 38355094)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2662 (class 1259 OID 38355093)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2630 (class 1259 OID 38355007)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 38355366)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2614 (class 1259 OID 38354939)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 38354940)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 38355386)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 38355385)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 38355384)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2644 (class 1259 OID 38355044)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2645 (class 1259 OID 38355043)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2646 (class 1259 OID 38355045)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2684 (class 1259 OID 38355156)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 38355157)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2594 (class 1259 OID 38354872)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2741 (class 1259 OID 38355291)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2742 (class 1259 OID 38355289)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2743 (class 1259 OID 38355288)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2744 (class 1259 OID 38355290)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2605 (class 1259 OID 38354913)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2606 (class 1259 OID 38354914)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 38355347)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 38355885)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 38355435)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 38355434)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 38355893)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 38355894)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2756 (class 1259 OID 38355312)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 38355427)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 38355428)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 38355649)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 38355648)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 38355645)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 38355646)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 38355647)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2650 (class 1259 OID 38355059)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2651 (class 1259 OID 38355058)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2652 (class 1259 OID 38355060)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 38355360)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 38355359)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 38355759)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 38355760)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 38355579)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 38355580)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 38355577)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 38355578)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2585 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2735 (class 1259 OID 38355270)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2736 (class 1259 OID 38355271)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 38355417)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 38355418)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2724 (class 1259 OID 38355253)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2747 (class 1259 OID 38355300)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2748 (class 1259 OID 38355299)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2749 (class 1259 OID 38355297)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2750 (class 1259 OID 38355298)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 38355567)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2675 (class 1259 OID 38355134)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2678 (class 1259 OID 38355148)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2679 (class 1259 OID 38355147)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2680 (class 1259 OID 38355146)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2681 (class 1259 OID 38355149)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2694 (class 1259 OID 38355175)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2688 (class 1259 OID 38355163)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2689 (class 1259 OID 38355164)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 38355750)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 38355799)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 38355869)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 38355870)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2626 (class 1259 OID 38354979)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2627 (class 1259 OID 38354978)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2635 (class 1259 OID 38355014)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2636 (class 1259 OID 38355015)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2589 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2728 (class 1259 OID 38355264)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 38355263)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2730 (class 1259 OID 38355262)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2708 (class 1259 OID 38355207)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2709 (class 1259 OID 38355210)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2710 (class 1259 OID 38355206)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2711 (class 1259 OID 38355209)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2712 (class 1259 OID 38355208)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2643 (class 1259 OID 38355033)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 38354967)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 38354968)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2667 (class 1259 OID 38355108)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2668 (class 1259 OID 38355110)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2669 (class 1259 OID 38355109)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2670 (class 1259 OID 38355111)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2755 (class 1259 OID 38355306)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 38355513)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 38355546)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 38355487)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 38355488)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2633 (class 1259 OID 38355005)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2634 (class 1259 OID 38355006)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2739 (class 1259 OID 38355280)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2740 (class 1259 OID 38355281)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 38355411)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2600 (class 1259 OID 38354883)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2660 (class 1259 OID 38355080)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2649 (class 1259 OID 38355042)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 38354871)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 38355792)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 38355358)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 38355357)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2719 (class 1259 OID 38355234)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 38355235)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 38355576)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2725 (class 1259 OID 38355254)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2657 (class 1259 OID 38355068)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 38355526)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 38355842)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 38355767)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 38355768)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 38355476)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2723 (class 1259 OID 38355245)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2613 (class 1259 OID 38354933)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2942 (class 2606 OID 38356060)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2947 (class 2606 OID 38356085)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2945 (class 2606 OID 38356075)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2941 (class 2606 OID 38356055)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 38356070)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2946 (class 2606 OID 38356080)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2943 (class 2606 OID 38356065)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2984 (class 2606 OID 38356270)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2985 (class 2606 OID 38356275)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2986 (class 2606 OID 38356280)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3018 (class 2606 OID 38356440)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 38356435)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2920 (class 2606 OID 38355950)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2921 (class 2606 OID 38355955)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2967 (class 2606 OID 38356185)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3014 (class 2606 OID 38356420)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 38356415)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3015 (class 2606 OID 38356425)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 38356410)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3011 (class 2606 OID 38356405)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2966 (class 2606 OID 38356180)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2965 (class 2606 OID 38356175)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2939 (class 2606 OID 38356045)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2940 (class 2606 OID 38356050)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 38356225)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 38356235)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2976 (class 2606 OID 38356230)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2931 (class 2606 OID 38356005)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2930 (class 2606 OID 38356000)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 38356165)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 38356395)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2987 (class 2606 OID 38356285)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2988 (class 2606 OID 38356290)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2989 (class 2606 OID 38356295)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3016 (class 2606 OID 38356430)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2993 (class 2606 OID 38356315)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2990 (class 2606 OID 38356300)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2994 (class 2606 OID 38356320)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2992 (class 2606 OID 38356310)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2991 (class 2606 OID 38356305)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2929 (class 2606 OID 38355995)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2928 (class 2606 OID 38355990)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2917 (class 2606 OID 38355935)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2916 (class 2606 OID 38355930)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 38356205)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2912 (class 2606 OID 38355910)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2913 (class 2606 OID 38355915)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2974 (class 2606 OID 38356220)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2973 (class 2606 OID 38356215)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2972 (class 2606 OID 38356210)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 38355965)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2922 (class 2606 OID 38355960)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2924 (class 2606 OID 38355970)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2934 (class 2606 OID 38356020)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 38356025)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 38355895)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2958 (class 2606 OID 38356140)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2956 (class 2606 OID 38356130)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2955 (class 2606 OID 38356125)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2957 (class 2606 OID 38356135)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2910 (class 2606 OID 38355900)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2911 (class 2606 OID 38355905)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2968 (class 2606 OID 38356190)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3021 (class 2606 OID 38356455)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2983 (class 2606 OID 38356265)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 38356260)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 38356460)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3023 (class 2606 OID 38356465)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 38356170)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 38356250)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2981 (class 2606 OID 38356255)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3004 (class 2606 OID 38356370)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3003 (class 2606 OID 38356365)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3000 (class 2606 OID 38356350)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3001 (class 2606 OID 38356355)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3002 (class 2606 OID 38356360)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 38355980)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 38355975)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2927 (class 2606 OID 38355985)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2970 (class 2606 OID 38356200)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 38356195)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 38356380)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3007 (class 2606 OID 38356385)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2998 (class 2606 OID 38356340)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2999 (class 2606 OID 38356345)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2996 (class 2606 OID 38356330)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 38356335)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2953 (class 2606 OID 38356115)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2954 (class 2606 OID 38356120)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 38356240)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2979 (class 2606 OID 38356245)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2948 (class 2606 OID 38356090)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2949 (class 2606 OID 38356095)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2962 (class 2606 OID 38356160)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2961 (class 2606 OID 38356155)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2959 (class 2606 OID 38356145)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2960 (class 2606 OID 38356150)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2995 (class 2606 OID 38356325)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 38356010)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 38356015)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 38356040)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2936 (class 2606 OID 38356030)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2937 (class 2606 OID 38356035)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3005 (class 2606 OID 38356375)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3008 (class 2606 OID 38356390)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3010 (class 2606 OID 38356400)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 38356445)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3020 (class 2606 OID 38356450)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2915 (class 2606 OID 38355925)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2914 (class 2606 OID 38355920)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2918 (class 2606 OID 38355940)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2919 (class 2606 OID 38355945)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2952 (class 2606 OID 38356110)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 38356105)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2950 (class 2606 OID 38356100)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-20 11:50:17 CET

--
-- PostgreSQL database dump complete
--

