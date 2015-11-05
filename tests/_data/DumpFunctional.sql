--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-05 10:25:34 CET

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
-- TOC entry 183 (class 1259 OID 25227133)
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
-- TOC entry 237 (class 1259 OID 25227747)
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
-- TOC entry 236 (class 1259 OID 25227730)
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
-- TOC entry 182 (class 1259 OID 25227126)
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
-- TOC entry 181 (class 1259 OID 25227124)
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
-- TOC entry 227 (class 1259 OID 25227607)
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
-- TOC entry 230 (class 1259 OID 25227637)
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
-- TOC entry 251 (class 1259 OID 25228034)
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
-- TOC entry 203 (class 1259 OID 25227381)
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
-- TOC entry 205 (class 1259 OID 25227413)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25227418)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25227960)
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
-- TOC entry 194 (class 1259 OID 25227278)
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
-- TOC entry 238 (class 1259 OID 25227760)
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
-- TOC entry 223 (class 1259 OID 25227561)
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
-- TOC entry 200 (class 1259 OID 25227352)
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
-- TOC entry 197 (class 1259 OID 25227318)
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
-- TOC entry 195 (class 1259 OID 25227295)
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
-- TOC entry 212 (class 1259 OID 25227475)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25228015)
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
-- TOC entry 250 (class 1259 OID 25228027)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25228049)
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
-- TOC entry 170 (class 1259 OID 25157733)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 25227500)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25227252)
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
-- TOC entry 185 (class 1259 OID 25227152)
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
-- TOC entry 189 (class 1259 OID 25227219)
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
-- TOC entry 186 (class 1259 OID 25227163)
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
-- TOC entry 178 (class 1259 OID 25227098)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25227117)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25227507)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25227541)
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
-- TOC entry 233 (class 1259 OID 25227678)
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
-- TOC entry 188 (class 1259 OID 25227199)
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
-- TOC entry 191 (class 1259 OID 25227244)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25227905)
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
-- TOC entry 213 (class 1259 OID 25227481)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25227229)
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
-- TOC entry 202 (class 1259 OID 25227373)
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
-- TOC entry 198 (class 1259 OID 25227333)
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
-- TOC entry 199 (class 1259 OID 25227345)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25227493)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25227919)
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
-- TOC entry 242 (class 1259 OID 25227929)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25227828)
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
-- TOC entry 243 (class 1259 OID 25227937)
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
-- TOC entry 219 (class 1259 OID 25227522)
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
-- TOC entry 211 (class 1259 OID 25227466)
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
-- TOC entry 210 (class 1259 OID 25227456)
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
-- TOC entry 232 (class 1259 OID 25227667)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25227597)
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
-- TOC entry 196 (class 1259 OID 25227307)
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
-- TOC entry 175 (class 1259 OID 25227069)
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
-- TOC entry 174 (class 1259 OID 25227067)
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
-- TOC entry 220 (class 1259 OID 25227535)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25227107)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25227091)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25227549)
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
-- TOC entry 214 (class 1259 OID 25227487)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25227433)
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
-- TOC entry 173 (class 1259 OID 25227056)
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
-- TOC entry 172 (class 1259 OID 25227048)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25227043)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25227614)
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
-- TOC entry 187 (class 1259 OID 25227191)
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
-- TOC entry 209 (class 1259 OID 25227443)
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
-- TOC entry 231 (class 1259 OID 25227655)
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
-- TOC entry 184 (class 1259 OID 25227142)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25227948)
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
-- TOC entry 207 (class 1259 OID 25227423)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25227264)
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
-- TOC entry 176 (class 1259 OID 25227078)
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
-- TOC entry 235 (class 1259 OID 25227705)
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
-- TOC entry 201 (class 1259 OID 25227363)
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
-- TOC entry 218 (class 1259 OID 25227514)
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
-- TOC entry 229 (class 1259 OID 25227628)
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
-- TOC entry 247 (class 1259 OID 25227995)
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
-- TOC entry 246 (class 1259 OID 25227967)
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
-- TOC entry 248 (class 1259 OID 25228007)
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
-- TOC entry 225 (class 1259 OID 25227586)
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
-- TOC entry 204 (class 1259 OID 25227407)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25227695)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25227576)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25227129)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25227072)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25227133)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-563b-208a-56a2-0d0c76ec5d35	10	30	Otroci	Abonma za otroke	200
000a0000-563b-208a-c97b-0daf8db84ad2	20	60	Mladina	Abonma za mladino	400
000a0000-563b-208a-a5b8-96c47a644db6	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25227747)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-563b-208b-1ff3-582ab94b9ade	000d0000-563b-208b-b1bd-b97e4548a434	\N	00090000-563b-208b-1eca-782335b7ac7f	000b0000-563b-208b-b8da-ea5694436258	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-563b-208b-8e4b-cd2b3c07af6c	000d0000-563b-208b-d642-f8b00f1d7517	00100000-563b-208b-a757-49576434c36f	00090000-563b-208b-4983-4be5169eb48b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-563b-208b-ada6-36cf364bc0b4	000d0000-563b-208b-316a-1a8c2f08c440	00100000-563b-208b-ac52-7914aaa1e406	00090000-563b-208b-78fd-78d141f006f8	\N	0003	t	\N	2015-11-05	\N	2	t	\N	f	f
000c0000-563b-208b-4c49-efdc02173353	000d0000-563b-208b-69fa-db422919639a	\N	00090000-563b-208b-340b-e4aeff7b3cd3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-563b-208b-fc44-d1d1fc8d5ef4	000d0000-563b-208b-38bb-353c896cc977	\N	00090000-563b-208b-5697-345049f6b13f	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-563b-208b-bb5c-e40e66fd48c1	000d0000-563b-208b-d080-2fb8192d3ea2	\N	00090000-563b-208b-9e51-af8a8907666e	000b0000-563b-208b-65c5-9e563af09c58	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-563b-208b-07fc-43ef115c12ca	000d0000-563b-208b-154e-c35640a17d12	00100000-563b-208b-5307-e1f23c2891ef	00090000-563b-208b-6849-18c14ea3615a	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-563b-208b-d748-6f2e9359930f	000d0000-563b-208b-2661-c116c23d1362	\N	00090000-563b-208b-2bb4-4b29295821df	000b0000-563b-208b-cc35-fa1db1f75405	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-563b-208b-b35f-c5b0c38976e1	000d0000-563b-208b-154e-c35640a17d12	00100000-563b-208b-203f-60664846df1f	00090000-563b-208b-3f57-01de36aac5bb	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-563b-208b-602e-500777f6c3d0	000d0000-563b-208b-154e-c35640a17d12	00100000-563b-208b-8a43-edb3ad6b9953	00090000-563b-208b-1fda-4794736f3c5b	\N	0010	t	\N	2015-11-05	\N	16	f	\N	f	t
000c0000-563b-208b-c4c0-4f618ae14ac4	000d0000-563b-208b-154e-c35640a17d12	00100000-563b-208b-acc9-8703516cf844	00090000-563b-208b-e039-ff53e3db9720	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-563b-208b-778c-1b57c4f6eec7	000d0000-563b-208b-a237-fe05b57c3ca4	00100000-563b-208b-a757-49576434c36f	00090000-563b-208b-4983-4be5169eb48b	000b0000-563b-208b-d5df-59b800be12c9	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25227730)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25227126)
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
-- TOC entry 3145 (class 0 OID 25227607)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-563b-208b-7e49-5277c7669332	00160000-563b-208a-c509-2abcb8bbc154	00090000-563b-208b-3e8b-9025fed8578d	aizv	10	t
003d0000-563b-208b-538a-2cc5891b2675	00160000-563b-208a-c509-2abcb8bbc154	00090000-563b-208b-f946-60176ce49671	apri	14	t
003d0000-563b-208b-408d-c46ca76222aa	00160000-563b-208a-6091-6df54e7ffcae	00090000-563b-208b-52cf-87b42767ec3d	aizv	11	t
003d0000-563b-208b-2e7b-4e877c0bd8e1	00160000-563b-208a-9e93-ae3112e89057	00090000-563b-208b-9419-63b3e1f1eace	aizv	12	t
003d0000-563b-208b-d13e-4bd4e411ac02	00160000-563b-208a-c509-2abcb8bbc154	00090000-563b-208b-5130-a79d84f29d44	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25227637)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-563b-208a-c509-2abcb8bbc154	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-563b-208a-6091-6df54e7ffcae	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-563b-208a-9e93-ae3112e89057	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25228034)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25227381)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-563b-208b-5071-fdc308fb07a5	\N	\N	00200000-563b-208b-95bf-72ecd3273b18	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-563b-208b-ba4e-86de2ae6c481	\N	\N	00200000-563b-208b-893f-99c960d88167	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-563b-208b-19ec-00055e488f28	\N	\N	00200000-563b-208b-d00a-4a27637a66ab	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-563b-208b-e27b-c4b28046e4b2	\N	\N	00200000-563b-208b-1fa9-5de42b280d79	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-563b-208b-c1ac-72cc348791c4	\N	\N	00200000-563b-208b-d5d9-273a9e2809a4	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25227413)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25227418)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25227960)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25227278)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-563b-2088-91d5-3316e2e6481b	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-563b-2088-5a56-d69457ed67ed	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-563b-2088-cb8b-4ce92c833ed5	AL	ALB	008	Albania 	Albanija	\N
00040000-563b-2088-ab91-57e8290219a1	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-563b-2088-20fa-319eb82e6aef	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-563b-2088-ea5e-f829b9ee0bdc	AD	AND	020	Andorra 	Andora	\N
00040000-563b-2088-4616-52e011301f56	AO	AGO	024	Angola 	Angola	\N
00040000-563b-2088-a00f-982932cc8c02	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-563b-2088-64d0-17c161b38e9c	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-563b-2088-3015-d9055f4780d2	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-563b-2088-618c-ed5d17d84bf1	AR	ARG	032	Argentina 	Argenitna	\N
00040000-563b-2088-c0f5-c9409f0b6ab5	AM	ARM	051	Armenia 	Armenija	\N
00040000-563b-2088-552f-8cb1fb3e05fb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-563b-2088-8ef1-96196d857824	AU	AUS	036	Australia 	Avstralija	\N
00040000-563b-2088-342c-672f17568591	AT	AUT	040	Austria 	Avstrija	\N
00040000-563b-2088-992c-c75e3dd04262	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-563b-2088-97be-3af2fcf1b6c8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-563b-2088-3c14-f36d00a76de9	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-563b-2088-45e9-145e6aec4840	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-563b-2088-79fb-2c61e80421e6	BB	BRB	052	Barbados 	Barbados	\N
00040000-563b-2088-57f3-92fd95bb2d42	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-563b-2088-996e-aabd33611d04	BE	BEL	056	Belgium 	Belgija	\N
00040000-563b-2088-8c22-2ec745dea33b	BZ	BLZ	084	Belize 	Belize	\N
00040000-563b-2088-7dcc-97ee03808ec6	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-563b-2088-323c-12868bed67c9	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-563b-2088-da14-78fb78b60747	BT	BTN	064	Bhutan 	Butan	\N
00040000-563b-2088-129a-f37da9d829bc	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-563b-2088-87c9-ce0302ec6a0b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-563b-2088-b69a-75ae2027c569	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-563b-2088-c9cf-fb67c4128093	BW	BWA	072	Botswana 	Bocvana	\N
00040000-563b-2088-c5ee-5636509df94f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-563b-2088-acfd-e3068592c87b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-563b-2088-b7da-411f1bace687	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-563b-2088-2680-137bc5ff2044	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-563b-2088-832d-4e23f0500416	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-563b-2088-bf7c-a0ed1a6ef812	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-563b-2088-b29b-30b625028079	BI	BDI	108	Burundi 	Burundi 	\N
00040000-563b-2088-f4ad-a8ee0ebd3417	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-563b-2088-12e2-8f795c318ca0	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-563b-2088-3be5-d25bf87bd83f	CA	CAN	124	Canada 	Kanada	\N
00040000-563b-2088-20bf-2ae0fa4701fa	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-563b-2088-5cde-adcadadc7e6c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-563b-2088-2db4-a93ab01270e4	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-563b-2088-b506-bedc9d917eec	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-563b-2088-b47e-2855a359d83b	CL	CHL	152	Chile 	Čile	\N
00040000-563b-2088-f4be-58cca2aedbee	CN	CHN	156	China 	Kitajska	\N
00040000-563b-2088-ad79-6469c52c7c30	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-563b-2088-81cd-7660a785a24b	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-563b-2088-10e0-9995dbeb07a6	CO	COL	170	Colombia 	Kolumbija	\N
00040000-563b-2088-efe6-30fc5124caaa	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-563b-2088-eba4-82c912f21b7a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-563b-2088-71f6-5610a586b113	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-563b-2088-ca96-6dca40f1d46d	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-563b-2088-38b7-504e67cf9c6a	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-563b-2088-852b-05c676b3de02	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-563b-2088-b602-8cc88f65c08d	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-563b-2088-de83-ce7a10bbda2a	CU	CUB	192	Cuba 	Kuba	\N
00040000-563b-2088-dd6e-8cc5072c4cbd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-563b-2088-662b-e4366b4c411a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-563b-2088-8a89-92022d50ec2e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-563b-2088-2971-e08a5fed61d2	DK	DNK	208	Denmark 	Danska	\N
00040000-563b-2088-f3ed-65513f4d85b2	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-563b-2088-d062-558443969258	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-563b-2088-cb9a-fe374322dd16	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-563b-2088-6768-ed7033cf7fae	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-563b-2088-cb72-69f29d8ba236	EG	EGY	818	Egypt 	Egipt	\N
00040000-563b-2088-4dac-3fdc3d28a80a	SV	SLV	222	El Salvador 	Salvador	\N
00040000-563b-2088-a761-4bd2e1261a02	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-563b-2088-5033-252bbc27ea58	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-563b-2088-b7c4-1f8f9080d491	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-563b-2088-0178-99852cab28d7	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-563b-2088-2603-bdb95a0bfd1c	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-563b-2088-5d77-6aad1afac49b	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-563b-2088-3fc3-cf5930452e6d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-563b-2088-9475-d97e7f390d92	FI	FIN	246	Finland 	Finska	\N
00040000-563b-2088-f257-6f135d091e4f	FR	FRA	250	France 	Francija	\N
00040000-563b-2088-15e1-350915e30efb	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-563b-2089-60f4-202b3d2153c6	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-563b-2088-9f56-f0c967688942	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-563b-2088-8190-11fff782dd12	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-563b-2088-0168-ded77b454449	GA	GAB	266	Gabon 	Gabon	\N
00040000-563b-2088-3f75-42debe2e1826	GM	GMB	270	Gambia 	Gambija	\N
00040000-563b-2088-c9e7-151e2e77255c	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-563b-2088-c396-f2af97d0260b	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-563b-2088-0cea-1d6e0e3837cc	GH	GHA	288	Ghana 	Gana	\N
00040000-563b-2088-c135-9c1b43fc8587	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-563b-2088-9257-0ab15acca09d	GR	GRC	300	Greece 	Grčija	\N
00040000-563b-2088-9bca-6a4b3cdf3e8d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-563b-2088-1689-80ad90f1697c	GD	GRD	308	Grenada 	Grenada	\N
00040000-563b-2088-4849-889a8c5fb7c2	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-563b-2088-339b-7616db4b37e7	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-563b-2088-3bf1-a48ba06d03dd	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-563b-2088-4dd5-18d9625f39be	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-563b-2088-e1e3-46a871e458ea	GN	GIN	324	Guinea 	Gvineja	\N
00040000-563b-2088-e627-e3209e17fab5	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-563b-2088-0457-7b55e4053567	GY	GUY	328	Guyana 	Gvajana	\N
00040000-563b-2088-bfd1-e43f336c5721	HT	HTI	332	Haiti 	Haiti	\N
00040000-563b-2088-b37c-305d527e2025	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-563b-2088-4bde-aa75776a4e99	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-563b-2088-6521-9c9dd747a928	HN	HND	340	Honduras 	Honduras	\N
00040000-563b-2088-bdea-410281952148	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-563b-2088-10f7-6c1b46c222f6	HU	HUN	348	Hungary 	Madžarska	\N
00040000-563b-2088-1b22-6654b48da2e2	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-563b-2088-fa4e-b96460fc556b	IN	IND	356	India 	Indija	\N
00040000-563b-2088-71b8-d8f2410a5d5f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-563b-2088-b8a9-62eda849d0f1	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-563b-2088-8ffb-d8a399907ac7	IQ	IRQ	368	Iraq 	Irak	\N
00040000-563b-2088-6345-f7f081cf219d	IE	IRL	372	Ireland 	Irska	\N
00040000-563b-2088-fa0e-45acfbd151d5	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-563b-2088-12ca-8186fb524b09	IL	ISR	376	Israel 	Izrael	\N
00040000-563b-2088-4672-f4f37b3f4b56	IT	ITA	380	Italy 	Italija	\N
00040000-563b-2088-e165-9c57d6caa0d1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-563b-2088-2211-224990167de8	JP	JPN	392	Japan 	Japonska	\N
00040000-563b-2088-6373-253523c1e77f	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-563b-2088-226f-209bf5025310	JO	JOR	400	Jordan 	Jordanija	\N
00040000-563b-2088-611b-e368b561e1e8	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-563b-2088-618e-69e1ac3d3530	KE	KEN	404	Kenya 	Kenija	\N
00040000-563b-2088-eedb-1ffc08910dec	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-563b-2088-9fd4-3db300b52192	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-563b-2088-8cdd-7c2f17719d7a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-563b-2088-0db9-4a0403ece97d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-563b-2088-b782-db3985061b16	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-563b-2088-910f-c75ec06cae82	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-563b-2088-84f2-09002a26cbc3	LV	LVA	428	Latvia 	Latvija	\N
00040000-563b-2088-88e1-4b8b4dbed990	LB	LBN	422	Lebanon 	Libanon	\N
00040000-563b-2088-1c61-b8c64fb4d6b4	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-563b-2088-61c7-ad4416822ec5	LR	LBR	430	Liberia 	Liberija	\N
00040000-563b-2088-0aa6-b49999025a86	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-563b-2088-97e8-2b1078920856	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-563b-2088-0c6d-ff447c716100	LT	LTU	440	Lithuania 	Litva	\N
00040000-563b-2088-94a7-1d51eef5cf43	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-563b-2088-32d6-f03e29e98c3b	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-563b-2088-055b-392eee50f42c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-563b-2088-a2c0-f32bb269f54f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-563b-2088-dbfe-773a39560a71	MW	MWI	454	Malawi 	Malavi	\N
00040000-563b-2088-11d4-cae1cb4b7a71	MY	MYS	458	Malaysia 	Malezija	\N
00040000-563b-2088-e8ed-70f4ddf5d25a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-563b-2088-4f3d-7723f9a755c0	ML	MLI	466	Mali 	Mali	\N
00040000-563b-2088-75be-0669cc18bbf8	MT	MLT	470	Malta 	Malta	\N
00040000-563b-2088-46b5-de8fda3b198f	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-563b-2088-6fc2-f904a5eaae1d	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-563b-2088-f978-a98ecdcf96a9	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-563b-2089-b2dd-7958d5edbee1	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-563b-2089-97eb-09ba52cf283d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-563b-2089-69d9-93ce9e4efacd	MX	MEX	484	Mexico 	Mehika	\N
00040000-563b-2089-91cc-8cfff269c7b9	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-563b-2089-534f-15e8a26a21b8	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-563b-2089-d6eb-4f4c29ac3893	MC	MCO	492	Monaco 	Monako	\N
00040000-563b-2089-43e9-42551e3c34ef	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-563b-2089-ba48-b379404046ea	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-563b-2089-2f9c-c28fcf49e516	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-563b-2089-51eb-78b0148c27c0	MA	MAR	504	Morocco 	Maroko	\N
00040000-563b-2089-b4fe-77a3c32e2d6d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-563b-2089-c9c5-8ed9eaea83c7	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-563b-2089-a0e8-e4561790b651	NA	NAM	516	Namibia 	Namibija	\N
00040000-563b-2089-1461-a863f0556190	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-563b-2089-a1f3-bf78c8829e4c	NP	NPL	524	Nepal 	Nepal	\N
00040000-563b-2089-d429-30e8d56aee92	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-563b-2089-ab60-bebacc228af1	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-563b-2089-8540-9a971d592ffe	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-563b-2089-2ef4-ba8a884c82b6	NE	NER	562	Niger 	Niger 	\N
00040000-563b-2089-5106-2f8cc192654c	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-563b-2089-596a-1603f90fc78a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-563b-2089-8aaa-144afb9c5031	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-563b-2089-b691-0a1b0471a56d	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-563b-2089-51ab-fe58ef1f3a0f	NO	NOR	578	Norway 	Norveška	\N
00040000-563b-2089-ef58-3bbadacf8529	OM	OMN	512	Oman 	Oman	\N
00040000-563b-2089-88cf-202e5fb85f50	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-563b-2089-5248-555530717c43	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-563b-2089-e6f8-b4928135755a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-563b-2089-70d4-0717c9b122e6	PA	PAN	591	Panama 	Panama	\N
00040000-563b-2089-ae1c-a5eef8c8bd84	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-563b-2089-a7fb-fb393fb59f80	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-563b-2089-357c-149e8f2114ed	PE	PER	604	Peru 	Peru	\N
00040000-563b-2089-7a01-61ed242055c9	PH	PHL	608	Philippines 	Filipini	\N
00040000-563b-2089-e8a2-09ac5fcf6d15	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-563b-2089-ba89-c94adf352f2f	PL	POL	616	Poland 	Poljska	\N
00040000-563b-2089-b614-0fe983f40813	PT	PRT	620	Portugal 	Portugalska	\N
00040000-563b-2089-a6c0-15aa39cffe3c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-563b-2089-14e1-0e7782cd51a1	QA	QAT	634	Qatar 	Katar	\N
00040000-563b-2089-ff3b-4d53d9f781c8	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-563b-2089-49e2-df1a0cc3c68f	RO	ROU	642	Romania 	Romunija	\N
00040000-563b-2089-25c8-958f03704fef	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-563b-2089-2283-5b98e0d58059	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-563b-2089-a1ed-0222b8188a32	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-563b-2089-eee7-7a693e077ccd	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-563b-2089-d100-0dc6673216e1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-563b-2089-0b0b-fc8f2fe1d45f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-563b-2089-7532-a10c2c4220a4	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-563b-2089-559b-1fd8dd238f0d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-563b-2089-63a2-3faab1ae9b64	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-563b-2089-4baa-81ccb6102eb8	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-563b-2089-57fe-2d6882f054b0	SM	SMR	674	San Marino 	San Marino	\N
00040000-563b-2089-f60a-69be5841cc26	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-563b-2089-0bf3-ca90be9845f7	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-563b-2089-80f1-a45ee502bd4a	SN	SEN	686	Senegal 	Senegal	\N
00040000-563b-2089-ba47-bfd3e952b20a	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-563b-2089-772e-642d429ce728	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-563b-2089-f2c5-73663e91420e	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-563b-2089-d662-2832c12c801d	SG	SGP	702	Singapore 	Singapur	\N
00040000-563b-2089-2150-3f0c00d9f47f	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-563b-2089-3092-e648ef46425d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-563b-2089-6ff6-cf8cceaf4371	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-563b-2089-77d5-e00c9cb86fee	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-563b-2089-eb34-da49617f0c4f	SO	SOM	706	Somalia 	Somalija	\N
00040000-563b-2089-1b3c-a9bcb1c9250a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-563b-2089-aab9-f03e21b7e47c	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-563b-2089-ca33-3645bf4f9a09	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-563b-2089-f36b-d8160d9c6d56	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-563b-2089-7736-43626b7d2f70	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-563b-2089-a21d-de388d9429ce	SD	SDN	729	Sudan 	Sudan	\N
00040000-563b-2089-8f5e-6a168dc201cf	SR	SUR	740	Suriname 	Surinam	\N
00040000-563b-2089-514d-a52e1a12a890	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-563b-2089-77da-5fd254f956e0	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-563b-2089-f462-8d0f7f3fc9ce	SE	SWE	752	Sweden 	Švedska	\N
00040000-563b-2089-ff1f-abee5e56939e	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-563b-2089-50e5-11ede95c8f97	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-563b-2089-33b7-f9ee0d1c7669	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-563b-2089-c031-3f30199898b1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-563b-2089-50c6-41a76aac775a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-563b-2089-f30f-f0a75238547a	TH	THA	764	Thailand 	Tajska	\N
00040000-563b-2089-ed4d-ed20c093bc31	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-563b-2089-228c-f55d9a4b5d8b	TG	TGO	768	Togo 	Togo	\N
00040000-563b-2089-0f9f-3451a3657072	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-563b-2089-2da0-f7285de22c7e	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-563b-2089-edf8-3f57d99b25e0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-563b-2089-d749-b25d06bb78bd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-563b-2089-18dc-7373e1734018	TR	TUR	792	Turkey 	Turčija	\N
00040000-563b-2089-5d78-94a2384f6c2f	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-563b-2089-ddf5-36e303a494f5	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563b-2089-c1e4-e386c018b374	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-563b-2089-37f6-7a37441e9cf3	UG	UGA	800	Uganda 	Uganda	\N
00040000-563b-2089-6ed9-f1765217901d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-563b-2089-e8bb-b942162ca005	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-563b-2089-5246-87550a45c883	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-563b-2089-e4f4-6bca7e62c1be	US	USA	840	United States 	Združene države Amerike	\N
00040000-563b-2089-14dd-a9fc46274233	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-563b-2089-3b0c-05efc4b09b37	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-563b-2089-afc5-fa35b7cf053c	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-563b-2089-11ee-b8203873a64c	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-563b-2089-4367-e68d14fc5659	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-563b-2089-3685-e993b1b3f1a5	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-563b-2089-7536-7c772f75f201	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563b-2089-8321-d0b8a5d6cdc7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-563b-2089-f36e-360618c78687	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-563b-2089-b6fa-da17f023d27b	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-563b-2089-f5f0-a27c89e98edd	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-563b-2089-ef78-6f8478a535ae	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-563b-2089-3ef9-310f830782dd	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25227760)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-563b-208b-0168-ad51e68a26b5	000e0000-563b-208b-e48a-1b1a0975927c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563b-2088-b604-c7b9c4bfd330	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563b-208b-8098-f3c978401fb6	000e0000-563b-208b-347c-a9ec4f3607b0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563b-2088-1512-4925306bc9e4	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563b-208b-d560-a85ee20d17ab	000e0000-563b-208b-0c49-ba508f94d502	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563b-2088-b604-c7b9c4bfd330	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563b-208b-7b9e-fd845e9e4bee	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563b-208b-bfc4-265ca9cab9f7	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25227561)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-563b-208b-154e-c35640a17d12	000e0000-563b-208b-347c-a9ec4f3607b0	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-563b-2088-ad36-de73a8d1f92e
000d0000-563b-208b-b1bd-b97e4548a434	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-1ff3-582ab94b9ade	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-563b-2088-ad36-de73a8d1f92e
000d0000-563b-208b-d642-f8b00f1d7517	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-8e4b-cd2b3c07af6c	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-563b-2088-2305-a4de46bd4204
000d0000-563b-208b-316a-1a8c2f08c440	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-ada6-36cf364bc0b4	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-563b-2088-d7a5-3cb65c657525
000d0000-563b-208b-69fa-db422919639a	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-4c49-efdc02173353	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-563b-2088-703f-83b8ab27a653
000d0000-563b-208b-38bb-353c896cc977	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-fc44-d1d1fc8d5ef4	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-563b-2088-703f-83b8ab27a653
000d0000-563b-208b-d080-2fb8192d3ea2	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-bb5c-e40e66fd48c1	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-563b-2088-ad36-de73a8d1f92e
000d0000-563b-208b-2661-c116c23d1362	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-d748-6f2e9359930f	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-563b-2088-3aa5-4a4052e800a4
000d0000-563b-208b-a237-fe05b57c3ca4	000e0000-563b-208b-347c-a9ec4f3607b0	000c0000-563b-208b-778c-1b57c4f6eec7	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-563b-2088-b7bd-5abca31dead5
\.


--
-- TOC entry 3118 (class 0 OID 25227352)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25227318)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25227295)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-563b-208b-2314-23e6c186b20e	00080000-563b-208b-f97f-69a767c61092	00090000-563b-208b-1fda-4794736f3c5b	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25227475)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25228015)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25228027)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25228049)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3088 (class 0 OID 25157733)
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
\.


--
-- TOC entry 3134 (class 0 OID 25227500)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25227252)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-563b-2089-2923-1bf3a215389b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-563b-2089-ebad-9a6c7d7a4209	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-563b-2089-a381-f9de46baf5d2	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-563b-2089-d857-46d773759973	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-563b-2089-1c1b-eb71d2548c08	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-563b-2089-3698-49b840cdc50e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-563b-2089-3c15-e17c06147634	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-563b-2089-9dd8-b89e723e6ae0	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563b-2089-c238-122ce7164a1f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563b-2089-ec6a-ce315bda33d4	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-563b-2089-7019-451090389191	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-563b-2089-416f-106e731c7281	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-563b-2089-d0cd-95637ca5fdb9	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-563b-2089-b5a4-855301b54e1a	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-563b-2089-bd63-2b964c29ca44	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-563b-208a-4e5d-3c6cc4fba2ca	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-563b-208a-6497-720ba88d65aa	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-563b-208a-b974-08fdca6d495c	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-563b-208a-5ce5-acfebcf33db4	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-563b-208a-3773-3388aed1a5ea	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-563b-208c-ea3a-6760a33e0bc0	application.tenant.maticnopodjetje	string	s:36:"00080000-563b-208c-6f90-59b17e72e738";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25227152)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-563b-208a-789e-b1319077a964	00000000-563b-208a-4e5d-3c6cc4fba2ca	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-563b-208a-8d5e-d0f5197d56d8	00000000-563b-208a-4e5d-3c6cc4fba2ca	00010000-563b-2089-29e6-933fdaa75228	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-563b-208a-5c92-a705034d80db	00000000-563b-208a-6497-720ba88d65aa	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25227219)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-563b-208b-e8cc-2cb68693dd82	\N	00100000-563b-208b-a757-49576434c36f	00100000-563b-208b-ac52-7914aaa1e406	01	Gledališče Nimbis
00410000-563b-208b-0df6-72ce54b9774c	00410000-563b-208b-e8cc-2cb68693dd82	00100000-563b-208b-a757-49576434c36f	00100000-563b-208b-ac52-7914aaa1e406	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25227163)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-563b-208b-1eca-782335b7ac7f	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-563b-208b-340b-e4aeff7b3cd3	00010000-563b-208b-ff40-31e0d9ed21a6	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-563b-208b-78fd-78d141f006f8	00010000-563b-208b-0bf1-c566656f1f60	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-563b-208b-3f57-01de36aac5bb	00010000-563b-208b-3f23-a9b8df439fc6	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-563b-208b-aa02-ae6862f4de49	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-563b-208b-9e51-af8a8907666e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-563b-208b-e039-ff53e3db9720	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-563b-208b-6849-18c14ea3615a	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-563b-208b-1fda-4794736f3c5b	00010000-563b-208b-ec96-b00f8b3b3f07	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-563b-208b-4983-4be5169eb48b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-563b-208b-af2e-8123380c2d97	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563b-208b-5697-345049f6b13f	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-563b-208b-2bb4-4b29295821df	00010000-563b-208b-aa3d-dd386fbf740b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563b-208b-3e8b-9025fed8578d	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-563b-208b-f946-60176ce49671	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-563b-208b-52cf-87b42767ec3d	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-563b-208b-9419-63b3e1f1eace	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563b-208b-5130-a79d84f29d44	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563b-208b-6da1-676c507d0379	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-563b-208b-82f3-11231facd9bf	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-563b-208b-5486-2a4f57b99ca9	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25227098)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-563b-2089-2950-28eb156bf4cf	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-563b-2089-febe-ec8dfda1d740	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-563b-2089-942e-c14268f1397e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-563b-2089-d0d9-a5d5918ae7c8	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-563b-2089-6d87-fd9c5e8821f6	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-563b-2089-a5c3-7b49c61279d6	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-563b-2089-dee7-295dfbdff16d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-563b-2089-fe8c-3358fdf7a8ee	Abonma-read	Abonma - branje	t
00030000-563b-2089-5934-26703275dc1f	Abonma-write	Abonma - spreminjanje	t
00030000-563b-2089-b260-d4745c0c27c0	Alternacija-read	Alternacija - branje	t
00030000-563b-2089-be7a-75b16d10e83e	Alternacija-write	Alternacija - spreminjanje	t
00030000-563b-2089-ea21-70caeec26b11	Arhivalija-read	Arhivalija - branje	t
00030000-563b-2089-2db9-5b07a953c761	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-563b-2089-64c3-edd4ce5862d8	AuthStorage-read	AuthStorage - branje	t
00030000-563b-2089-598d-b71b5f79fa59	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-563b-2089-dd5a-43b8515b4490	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-563b-2089-0e16-da51c217ffad	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-563b-2089-7b08-59ccac1e75f0	Besedilo-read	Besedilo - branje	t
00030000-563b-2089-a6bb-3622a152d84f	Besedilo-write	Besedilo - spreminjanje	t
00030000-563b-2089-7cbe-5777331cb531	Dogodek-read	Dogodek - branje	t
00030000-563b-2089-7f0f-20595d2c3759	Dogodek-write	Dogodek - spreminjanje	t
00030000-563b-2089-db6e-f1280aa3e2dc	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-563b-2089-2bc8-e9b1bf4e7f5f	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-563b-2089-03fb-f6c107b9db3d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-563b-2089-5c58-a3dd2aeb3274	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-563b-2089-ad6c-96b283461bc9	DogodekTrait-read	DogodekTrait - branje	t
00030000-563b-2089-9ed1-d5f59c91e412	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-563b-2089-1d39-aa9924bff0b2	DrugiVir-read	DrugiVir - branje	t
00030000-563b-2089-4a04-ee5c765a6c5c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-563b-2089-3683-531ef3d488c0	Drzava-read	Drzava - branje	t
00030000-563b-2089-6320-12bcc81fd649	Drzava-write	Drzava - spreminjanje	t
00030000-563b-2089-5809-77d830d2e1f5	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-563b-2089-4a25-30b70df3b1ec	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-563b-2089-0ea5-0729397848a1	Funkcija-read	Funkcija - branje	t
00030000-563b-2089-c2eb-60ce881b18be	Funkcija-write	Funkcija - spreminjanje	t
00030000-563b-2089-a633-67e3c14e75f8	Gostovanje-read	Gostovanje - branje	t
00030000-563b-2089-414f-d90140a8c87c	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-563b-2089-dad8-81084bf6c71f	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-563b-2089-7819-738e53343eac	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-563b-2089-cabb-44e4a9a5836f	Kupec-read	Kupec - branje	t
00030000-563b-2089-1131-7ea60d7752c5	Kupec-write	Kupec - spreminjanje	t
00030000-563b-2089-7767-0f2aff695f98	NacinPlacina-read	NacinPlacina - branje	t
00030000-563b-2089-c8ee-b82d63e9f675	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-563b-2089-b134-c5a4e719ea2d	Option-read	Option - branje	t
00030000-563b-2089-85bf-52fe44d89a00	Option-write	Option - spreminjanje	t
00030000-563b-2089-15f7-9f2a2bf40b0d	OptionValue-read	OptionValue - branje	t
00030000-563b-2089-7286-333cc5a1165e	OptionValue-write	OptionValue - spreminjanje	t
00030000-563b-2089-a853-7ee6cbbaa8ca	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-563b-2089-6cab-fc5413c92186	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-563b-2089-e59a-a88442584b9e	Oseba-read	Oseba - branje	t
00030000-563b-2089-36b3-525b62745ba7	Oseba-write	Oseba - spreminjanje	t
00030000-563b-2089-d702-38f02c2f9e95	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-563b-2089-b1ad-22dd89fd8824	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-563b-2089-c815-8ace330a3dd6	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-563b-2089-97c2-b7253bae976b	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-563b-2089-ce10-9a0f82168217	Pogodba-read	Pogodba - branje	t
00030000-563b-2089-2cdc-2ec48801f45e	Pogodba-write	Pogodba - spreminjanje	t
00030000-563b-2089-7ddc-4577a61c78ba	Popa-read	Popa - branje	t
00030000-563b-2089-171c-59c018f4fa90	Popa-write	Popa - spreminjanje	t
00030000-563b-2089-7bdb-dca199012739	Posta-read	Posta - branje	t
00030000-563b-2089-3a29-b92193ffcc81	Posta-write	Posta - spreminjanje	t
00030000-563b-2089-3500-6de6004b3597	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-563b-2089-383a-3492aa267317	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-563b-2089-a92c-102ddc34a203	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-563b-2089-63a8-d90aa022f67f	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-563b-2089-bdad-fb4079421b76	PostniNaslov-read	PostniNaslov - branje	t
00030000-563b-2089-d971-3eb5adc3a1c0	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-563b-2089-db42-55aa1b5cd9ef	Praznik-read	Praznik - branje	t
00030000-563b-2089-7bfc-8f12f0f6cd4b	Praznik-write	Praznik - spreminjanje	t
00030000-563b-2089-b52d-6334db5aa459	Predstava-read	Predstava - branje	t
00030000-563b-2089-016d-a8b381331162	Predstava-write	Predstava - spreminjanje	t
00030000-563b-2089-0405-fb8a8cbbe0af	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-563b-2089-6c44-fed97efbdf1c	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-563b-2089-07ea-c0e4ec7bddba	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-563b-2089-846f-0fecb2aad5c2	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-563b-2089-39cb-3f866a3602b3	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-563b-2089-055e-fa48ab6e88ff	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-563b-2089-b20f-806e603a3c8a	ProgramDela-read	ProgramDela - branje	t
00030000-563b-2089-e41c-6238ab66bc77	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-563b-2089-8f70-7cc7fad82062	ProgramFestival-read	ProgramFestival - branje	t
00030000-563b-2089-cf30-e4cd3b301d7f	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-563b-2089-dc32-2211c89f9ceb	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-563b-2089-e0a3-2a8f9f14bba4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-563b-2089-2e26-54775ff087fa	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-563b-2089-cddc-b9f1c4296540	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-563b-2089-3926-712e93c83ba3	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-563b-2089-c9db-71f7935efa52	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-563b-2089-1514-139336abe434	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-563b-2089-eea8-bb07b7faf391	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-563b-2089-078f-b0427799d788	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-563b-2089-ae5e-94c2b68c45cd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-563b-2089-fc48-165d14663ea7	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-563b-2089-5089-639333704b03	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-563b-2089-9a78-3adc93e9e3d4	ProgramRazno-read	ProgramRazno - branje	t
00030000-563b-2089-84b8-c3cd07fade31	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-563b-2089-945c-47a1c85d42d0	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-563b-2089-5329-7e34b27941da	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-563b-2089-059c-6671abde0b06	Prostor-read	Prostor - branje	t
00030000-563b-2089-492c-3adfa27f24c2	Prostor-write	Prostor - spreminjanje	t
00030000-563b-2089-1825-ac6483d1e189	Racun-read	Racun - branje	t
00030000-563b-2089-1580-29b71fd8e664	Racun-write	Racun - spreminjanje	t
00030000-563b-2089-f81e-707c0f94ec67	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-563b-2089-2d17-7847158c4bd0	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-563b-2089-9f0d-3c5d89f6a25a	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-563b-2089-822c-032e8bbdb4fd	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-563b-2089-f8c0-1be5f44a2ca5	Rekvizit-read	Rekvizit - branje	t
00030000-563b-2089-0a61-b9044aa6d1eb	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-563b-2089-4728-8ebf86e13fad	Revizija-read	Revizija - branje	t
00030000-563b-2089-87a0-378653f08d32	Revizija-write	Revizija - spreminjanje	t
00030000-563b-2089-e54d-3ba3fccac4f0	Rezervacija-read	Rezervacija - branje	t
00030000-563b-2089-ec0a-a79c90e47d54	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-563b-2089-aca3-b5e4c43853a0	SedezniRed-read	SedezniRed - branje	t
00030000-563b-2089-38f0-272d52c5af30	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-563b-2089-ecdd-083113952f3c	Sedez-read	Sedez - branje	t
00030000-563b-2089-e66d-32c566156646	Sedez-write	Sedez - spreminjanje	t
00030000-563b-2089-35b8-41fa69fad818	Sezona-read	Sezona - branje	t
00030000-563b-2089-5043-4412c8772c6b	Sezona-write	Sezona - spreminjanje	t
00030000-563b-2089-1587-15391e2f4fbf	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-563b-2089-b506-47dc4f92f6db	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-563b-2089-8dd7-71b11a0cbfd1	Stevilcenje-read	Stevilcenje - branje	t
00030000-563b-2089-ac40-f8028635cfce	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-563b-2089-5025-2203e577c740	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-563b-2089-0ba8-2380ad8f2a64	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-563b-2089-ede6-559bc7600584	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-563b-2089-19bd-6fe0a568661d	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-563b-2089-f3b8-6595e72fd19a	Telefonska-read	Telefonska - branje	t
00030000-563b-2089-5a8a-2ad65d81571a	Telefonska-write	Telefonska - spreminjanje	t
00030000-563b-2089-09fc-8d9abaca700b	TerminStoritve-read	TerminStoritve - branje	t
00030000-563b-2089-0c44-ce8435d9e747	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-563b-2089-d4bf-eea3c925ec0a	TipFunkcije-read	TipFunkcije - branje	t
00030000-563b-2089-983a-66fc4f257c51	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-563b-2089-6263-4ffc5a769e2e	TipPopa-read	TipPopa - branje	t
00030000-563b-2089-4195-12ba422fc71d	TipPopa-write	TipPopa - spreminjanje	t
00030000-563b-2089-2471-15229c58ced2	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-563b-2089-e800-429f1a21b869	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-563b-2089-0ce2-c388d8638544	TipVaje-read	TipVaje - branje	t
00030000-563b-2089-d935-7b1805d0762d	TipVaje-write	TipVaje - spreminjanje	t
00030000-563b-2089-a12e-5b71751f9ae9	Trr-read	Trr - branje	t
00030000-563b-2089-1989-438740bb98bf	Trr-write	Trr - spreminjanje	t
00030000-563b-2089-617f-c8d0d2390506	Uprizoritev-read	Uprizoritev - branje	t
00030000-563b-2089-5dde-df8dd3493e4f	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-563b-2089-1231-0d03115a7adc	Vaja-read	Vaja - branje	t
00030000-563b-2089-71e6-77b512b66a7e	Vaja-write	Vaja - spreminjanje	t
00030000-563b-2089-48e6-8976c5797aca	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-563b-2089-5f96-ece8156bedf6	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-563b-2089-51e3-476b4d1522e2	VrstaStroska-read	VrstaStroska - branje	t
00030000-563b-2089-36b2-228b0ed17b54	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-563b-2089-9166-ccc0d2f75a2c	Zaposlitev-read	Zaposlitev - branje	t
00030000-563b-2089-1338-cb90a160ad31	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-563b-2089-2ffb-691c6989a6dd	Zasedenost-read	Zasedenost - branje	t
00030000-563b-2089-29b7-cd2ce73f4783	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-563b-2089-07c5-0aa0d51e4892	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-563b-2089-78d3-35c00e1af486	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-563b-2089-47d8-84435bfec5fd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-563b-2089-ff38-330977872e4e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-563b-2089-21d5-e0eaae9caf63	Job-read	Branje opravil - samo zase - branje	t
00030000-563b-2089-f646-5daec3ee9e9e	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-563b-2089-e6a0-3c6e606aef2a	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-563b-2089-d068-547641851d5f	Report-read	Report - branje	t
00030000-563b-2089-7faf-97edca3e107d	Report-write	Report - spreminjanje	t
00030000-563b-2089-0eae-f0552b34ba3a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-563b-2089-1655-6d87b64f2feb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-563b-2089-34b3-3f6d8137405b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-563b-2089-e534-e16b6ab84ff3	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-563b-2089-21a8-aea127ef7818	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-563b-2089-270f-d9e377a6c24a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-563b-2089-eb7c-99cbfec67f99	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563b-2089-d168-fd32db362783	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563b-2089-d543-70095eb7da76	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-563b-2089-f5a8-aedee0b44f3e	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-563b-2089-58f8-59b6a3dd48fc	Datoteka-write	Datoteka - spreminjanje	t
00030000-563b-2089-103f-f4f735ed1bd7	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25227117)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-563b-2089-52d1-3e9e09d659f1	00030000-563b-2089-febe-ec8dfda1d740
00020000-563b-2089-e050-83dc776c7efb	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-fe8c-3358fdf7a8ee
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-5934-26703275dc1f
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-b260-d4745c0c27c0
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-be7a-75b16d10e83e
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-ea21-70caeec26b11
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-7cbe-5777331cb531
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-d0d9-a5d5918ae7c8
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-7f0f-20595d2c3759
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-6320-12bcc81fd649
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-0ea5-0729397848a1
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-c2eb-60ce881b18be
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-a633-67e3c14e75f8
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-414f-d90140a8c87c
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-dad8-81084bf6c71f
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-7819-738e53343eac
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-b134-c5a4e719ea2d
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-15f7-9f2a2bf40b0d
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-e59a-a88442584b9e
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-36b3-525b62745ba7
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-7ddc-4577a61c78ba
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-171c-59c018f4fa90
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-7bdb-dca199012739
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-3a29-b92193ffcc81
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-bdad-fb4079421b76
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-d971-3eb5adc3a1c0
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-b52d-6334db5aa459
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-016d-a8b381331162
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-39cb-3f866a3602b3
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-055e-fa48ab6e88ff
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-059c-6671abde0b06
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-492c-3adfa27f24c2
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-9f0d-3c5d89f6a25a
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-822c-032e8bbdb4fd
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-f8c0-1be5f44a2ca5
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-0a61-b9044aa6d1eb
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-35b8-41fa69fad818
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-5043-4412c8772c6b
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-d4bf-eea3c925ec0a
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-617f-c8d0d2390506
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-5dde-df8dd3493e4f
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-1231-0d03115a7adc
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-71e6-77b512b66a7e
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-2ffb-691c6989a6dd
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-29b7-cd2ce73f4783
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-07c5-0aa0d51e4892
00020000-563b-2089-b03e-58a0b50e529f	00030000-563b-2089-47d8-84435bfec5fd
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-fe8c-3358fdf7a8ee
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-ea21-70caeec26b11
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-7cbe-5777331cb531
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-a633-67e3c14e75f8
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-dad8-81084bf6c71f
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-7819-738e53343eac
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-b134-c5a4e719ea2d
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-15f7-9f2a2bf40b0d
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-e59a-a88442584b9e
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-36b3-525b62745ba7
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-7ddc-4577a61c78ba
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-7bdb-dca199012739
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-bdad-fb4079421b76
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-d971-3eb5adc3a1c0
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-b52d-6334db5aa459
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-059c-6671abde0b06
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-9f0d-3c5d89f6a25a
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-f8c0-1be5f44a2ca5
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-35b8-41fa69fad818
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-f3b8-6595e72fd19a
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-5a8a-2ad65d81571a
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-a12e-5b71751f9ae9
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-1989-438740bb98bf
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-9166-ccc0d2f75a2c
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-1338-cb90a160ad31
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-07c5-0aa0d51e4892
00020000-563b-2089-038c-d1f2fd4e37b4	00030000-563b-2089-47d8-84435bfec5fd
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-fe8c-3358fdf7a8ee
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-b260-d4745c0c27c0
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-ea21-70caeec26b11
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-2db9-5b07a953c761
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-7b08-59ccac1e75f0
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-db6e-f1280aa3e2dc
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-7cbe-5777331cb531
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-0ea5-0729397848a1
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-a633-67e3c14e75f8
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-dad8-81084bf6c71f
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-b134-c5a4e719ea2d
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-15f7-9f2a2bf40b0d
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-e59a-a88442584b9e
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-7ddc-4577a61c78ba
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-7bdb-dca199012739
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-b52d-6334db5aa459
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-39cb-3f866a3602b3
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-059c-6671abde0b06
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-9f0d-3c5d89f6a25a
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-f8c0-1be5f44a2ca5
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-35b8-41fa69fad818
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-d4bf-eea3c925ec0a
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-1231-0d03115a7adc
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-2ffb-691c6989a6dd
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-07c5-0aa0d51e4892
00020000-563b-2089-a82f-3e866670606c	00030000-563b-2089-47d8-84435bfec5fd
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-fe8c-3358fdf7a8ee
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-5934-26703275dc1f
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-be7a-75b16d10e83e
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-ea21-70caeec26b11
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-7cbe-5777331cb531
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-a633-67e3c14e75f8
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-b134-c5a4e719ea2d
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-15f7-9f2a2bf40b0d
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-7ddc-4577a61c78ba
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-7bdb-dca199012739
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-b52d-6334db5aa459
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-059c-6671abde0b06
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-9f0d-3c5d89f6a25a
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-f8c0-1be5f44a2ca5
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-35b8-41fa69fad818
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-d4bf-eea3c925ec0a
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-07c5-0aa0d51e4892
00020000-563b-2089-e04a-6a8bdfe245f8	00030000-563b-2089-47d8-84435bfec5fd
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-fe8c-3358fdf7a8ee
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-ea21-70caeec26b11
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-7cbe-5777331cb531
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-a633-67e3c14e75f8
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-b134-c5a4e719ea2d
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-15f7-9f2a2bf40b0d
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-7ddc-4577a61c78ba
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-7bdb-dca199012739
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-b52d-6334db5aa459
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-059c-6671abde0b06
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-9f0d-3c5d89f6a25a
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-f8c0-1be5f44a2ca5
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-35b8-41fa69fad818
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-09fc-8d9abaca700b
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-942e-c14268f1397e
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-d4bf-eea3c925ec0a
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-07c5-0aa0d51e4892
00020000-563b-2089-6603-8d886b0621df	00030000-563b-2089-47d8-84435bfec5fd
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2950-28eb156bf4cf
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-febe-ec8dfda1d740
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-fe8c-3358fdf7a8ee
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5934-26703275dc1f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-b260-d4745c0c27c0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-be7a-75b16d10e83e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ea21-70caeec26b11
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2db9-5b07a953c761
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-dd5a-43b8515b4490
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0e16-da51c217ffad
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7b08-59ccac1e75f0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-a6bb-3622a152d84f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-db6e-f1280aa3e2dc
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2bc8-e9b1bf4e7f5f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7cbe-5777331cb531
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-d0d9-a5d5918ae7c8
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7f0f-20595d2c3759
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1d39-aa9924bff0b2
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-4a04-ee5c765a6c5c
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-3683-531ef3d488c0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-6320-12bcc81fd649
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5809-77d830d2e1f5
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-4a25-30b70df3b1ec
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0ea5-0729397848a1
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-c2eb-60ce881b18be
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-a633-67e3c14e75f8
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-414f-d90140a8c87c
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-dad8-81084bf6c71f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7819-738e53343eac
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-cabb-44e4a9a5836f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1131-7ea60d7752c5
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7767-0f2aff695f98
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-c8ee-b82d63e9f675
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-b134-c5a4e719ea2d
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-15f7-9f2a2bf40b0d
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7286-333cc5a1165e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-85bf-52fe44d89a00
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-a853-7ee6cbbaa8ca
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-6cab-fc5413c92186
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-e59a-a88442584b9e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-6d87-fd9c5e8821f6
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-36b3-525b62745ba7
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-d702-38f02c2f9e95
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-b1ad-22dd89fd8824
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-c815-8ace330a3dd6
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-97c2-b7253bae976b
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ce10-9a0f82168217
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2cdc-2ec48801f45e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7ddc-4577a61c78ba
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-171c-59c018f4fa90
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7bdb-dca199012739
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-3500-6de6004b3597
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-383a-3492aa267317
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-a92c-102ddc34a203
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-63a8-d90aa022f67f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-3a29-b92193ffcc81
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-bdad-fb4079421b76
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-d971-3eb5adc3a1c0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-db42-55aa1b5cd9ef
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-7bfc-8f12f0f6cd4b
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-b52d-6334db5aa459
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-016d-a8b381331162
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0405-fb8a8cbbe0af
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-6c44-fed97efbdf1c
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-07ea-c0e4ec7bddba
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-846f-0fecb2aad5c2
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-39cb-3f866a3602b3
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-055e-fa48ab6e88ff
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-a5c3-7b49c61279d6
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-b20f-806e603a3c8a
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-dee7-295dfbdff16d
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-e41c-6238ab66bc77
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-8f70-7cc7fad82062
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-cf30-e4cd3b301d7f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-dc32-2211c89f9ceb
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-e0a3-2a8f9f14bba4
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2e26-54775ff087fa
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-cddc-b9f1c4296540
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-3926-712e93c83ba3
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-c9db-71f7935efa52
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1514-139336abe434
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-eea8-bb07b7faf391
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-078f-b0427799d788
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ae5e-94c2b68c45cd
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-fc48-165d14663ea7
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5089-639333704b03
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-9a78-3adc93e9e3d4
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-84b8-c3cd07fade31
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-945c-47a1c85d42d0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5329-7e34b27941da
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-059c-6671abde0b06
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-492c-3adfa27f24c2
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1825-ac6483d1e189
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1580-29b71fd8e664
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-f81e-707c0f94ec67
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2d17-7847158c4bd0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-9f0d-3c5d89f6a25a
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-822c-032e8bbdb4fd
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-f8c0-1be5f44a2ca5
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0a61-b9044aa6d1eb
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-4728-8ebf86e13fad
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-87a0-378653f08d32
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-e54d-3ba3fccac4f0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ec0a-a79c90e47d54
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-aca3-b5e4c43853a0
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-38f0-272d52c5af30
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ecdd-083113952f3c
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-e66d-32c566156646
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-35b8-41fa69fad818
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5043-4412c8772c6b
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1587-15391e2f4fbf
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-b506-47dc4f92f6db
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-8dd7-71b11a0cbfd1
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5025-2203e577c740
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0ba8-2380ad8f2a64
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ac40-f8028635cfce
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ede6-559bc7600584
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-19bd-6fe0a568661d
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-f3b8-6595e72fd19a
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5a8a-2ad65d81571a
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-09fc-8d9abaca700b
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-942e-c14268f1397e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0c44-ce8435d9e747
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-d4bf-eea3c925ec0a
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-983a-66fc4f257c51
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-6263-4ffc5a769e2e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-4195-12ba422fc71d
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2471-15229c58ced2
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-e800-429f1a21b869
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-0ce2-c388d8638544
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-d935-7b1805d0762d
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-a12e-5b71751f9ae9
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1989-438740bb98bf
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-617f-c8d0d2390506
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5dde-df8dd3493e4f
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1231-0d03115a7adc
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-71e6-77b512b66a7e
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-48e6-8976c5797aca
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-5f96-ece8156bedf6
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-51e3-476b4d1522e2
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-36b2-228b0ed17b54
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-9166-ccc0d2f75a2c
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-1338-cb90a160ad31
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-2ffb-691c6989a6dd
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-29b7-cd2ce73f4783
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-07c5-0aa0d51e4892
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-78d3-35c00e1af486
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-47d8-84435bfec5fd
00020000-563b-208b-8447-84fd3ab05c1c	00030000-563b-2089-ff38-330977872e4e
\.


--
-- TOC entry 3135 (class 0 OID 25227507)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25227541)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25227678)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-563b-208b-b8da-ea5694436258	00090000-563b-208b-1eca-782335b7ac7f	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-563b-208b-65c5-9e563af09c58	00090000-563b-208b-9e51-af8a8907666e	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-563b-208b-cc35-fa1db1f75405	00090000-563b-208b-2bb4-4b29295821df	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-563b-208b-d5df-59b800be12c9	00090000-563b-208b-4983-4be5169eb48b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25227199)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-563b-208b-f97f-69a767c61092	\N	00040000-563b-2089-6ff6-cf8cceaf4371	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-78e4-f433931659a1	\N	00040000-563b-2089-6ff6-cf8cceaf4371	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-563b-208b-8f9a-6f27bf950216	\N	00040000-563b-2089-6ff6-cf8cceaf4371	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-f582-86a962612c79	\N	00040000-563b-2089-6ff6-cf8cceaf4371	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-76d9-9d6cb1b2658e	\N	00040000-563b-2089-6ff6-cf8cceaf4371	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-2ec0-764e380cb984	\N	00040000-563b-2088-618c-ed5d17d84bf1	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-5bd0-ef182282947d	\N	00040000-563b-2088-b602-8cc88f65c08d	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-9ad0-900fc9943eae	\N	00040000-563b-2088-342c-672f17568591	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208b-9779-32664250c21e	\N	00040000-563b-2088-c396-f2af97d0260b	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563b-208c-6f90-59b17e72e738	\N	00040000-563b-2089-6ff6-cf8cceaf4371	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25227244)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-563b-2088-60f0-b00c97bf0b86	8341	Adlešiči
00050000-563b-2088-8be1-da34133ffcd7	5270	Ajdovščina
00050000-563b-2088-b227-d52f2b06f479	6280	Ankaran/Ancarano
00050000-563b-2088-3904-bddceb54bcbc	9253	Apače
00050000-563b-2088-0dc8-0f03e9c6d345	8253	Artiče
00050000-563b-2088-b2e4-96ccf62b5b53	4275	Begunje na Gorenjskem
00050000-563b-2088-76a5-a88d6d83ceb8	1382	Begunje pri Cerknici
00050000-563b-2088-ac8a-099da521f864	9231	Beltinci
00050000-563b-2088-917c-fced0e252687	2234	Benedikt
00050000-563b-2088-aad3-68b03c5799ad	2345	Bistrica ob Dravi
00050000-563b-2088-7eb5-341ca71adbfa	3256	Bistrica ob Sotli
00050000-563b-2088-4596-7b0fe83079a5	8259	Bizeljsko
00050000-563b-2088-82e8-b51f7607bd5a	1223	Blagovica
00050000-563b-2088-8346-8c064bae3c42	8283	Blanca
00050000-563b-2088-272b-e15382c4ed28	4260	Bled
00050000-563b-2088-7418-0f65256d94f5	4273	Blejska Dobrava
00050000-563b-2088-a6ae-0feefad11b59	9265	Bodonci
00050000-563b-2088-ed8e-e48a6cb30da4	9222	Bogojina
00050000-563b-2088-6372-eab7dd8a5653	4263	Bohinjska Bela
00050000-563b-2088-016c-372b747ca23f	4264	Bohinjska Bistrica
00050000-563b-2088-cbc2-c935cae8e82c	4265	Bohinjsko jezero
00050000-563b-2088-23e8-ea8f4b10f097	1353	Borovnica
00050000-563b-2088-25e7-f3bb6a9f4c97	8294	Boštanj
00050000-563b-2088-dc24-7018b501dcca	5230	Bovec
00050000-563b-2088-a0c7-2185da273451	5295	Branik
00050000-563b-2088-ba50-90585f79eedb	3314	Braslovče
00050000-563b-2088-ba9e-4ef75d2798a6	5223	Breginj
00050000-563b-2088-e5b6-456f1b4f3d50	8280	Brestanica
00050000-563b-2088-65a8-1c6f1307fb72	2354	Bresternica
00050000-563b-2088-5611-e662931f0768	4243	Brezje
00050000-563b-2088-ffae-0ff2694f4beb	1351	Brezovica pri Ljubljani
00050000-563b-2088-bebc-59d753ec66d2	8250	Brežice
00050000-563b-2088-db75-1c95833b130d	4210	Brnik - Aerodrom
00050000-563b-2088-a03d-9673af93358e	8321	Brusnice
00050000-563b-2088-3a76-b3915b963265	3255	Buče
00050000-563b-2088-cc15-46d1e4a11a8d	8276	Bučka 
00050000-563b-2088-9391-05c96f2b8d28	9261	Cankova
00050000-563b-2088-d260-56537ec28804	3000	Celje 
00050000-563b-2088-22f4-4f153cf16079	3001	Celje - poštni predali
00050000-563b-2088-fc1e-d91ad2e2e328	4207	Cerklje na Gorenjskem
00050000-563b-2088-aed6-965e68252592	8263	Cerklje ob Krki
00050000-563b-2088-1006-242f80ec1994	1380	Cerknica
00050000-563b-2088-57d7-715e0514b48f	5282	Cerkno
00050000-563b-2088-974c-7e97cb0c5602	2236	Cerkvenjak
00050000-563b-2088-1b55-61a270d8d752	2215	Ceršak
00050000-563b-2088-a3f8-c30db316d276	2326	Cirkovce
00050000-563b-2088-9076-caf5f3207a98	2282	Cirkulane
00050000-563b-2088-9fb3-0d694096f093	5273	Col
00050000-563b-2088-f271-3dba97db17bd	8251	Čatež ob Savi
00050000-563b-2088-ffbf-f557526e0fea	1413	Čemšenik
00050000-563b-2088-b379-84e883bbd8ca	5253	Čepovan
00050000-563b-2088-7628-9b26b50cd12f	9232	Črenšovci
00050000-563b-2088-6bde-529a96c02db8	2393	Črna na Koroškem
00050000-563b-2088-32ab-755c9d0c8fb0	6275	Črni Kal
00050000-563b-2088-dfbc-5b90bd59eb44	5274	Črni Vrh nad Idrijo
00050000-563b-2088-53c7-dc4f72e1dc03	5262	Črniče
00050000-563b-2088-d408-a78efe1c1e30	8340	Črnomelj
00050000-563b-2088-f3af-c058e06887cc	6271	Dekani
00050000-563b-2088-0d53-992624e054bd	5210	Deskle
00050000-563b-2088-5a43-1439d8216b36	2253	Destrnik
00050000-563b-2088-70c1-ba8053b23107	6215	Divača
00050000-563b-2088-c4eb-f49f9bd699dd	1233	Dob
00050000-563b-2088-07f0-4523f191ac4a	3224	Dobje pri Planini
00050000-563b-2088-089b-9fe48e2071cc	8257	Dobova
00050000-563b-2088-2e2e-2a2e0adaf8bd	1423	Dobovec
00050000-563b-2088-7fb4-10daa55d6813	5263	Dobravlje
00050000-563b-2088-2062-423181e7e137	3204	Dobrna
00050000-563b-2088-a955-1783a73c2d5c	8211	Dobrnič
00050000-563b-2088-b980-a29a45e0f217	1356	Dobrova
00050000-563b-2088-98fd-d690d6e1f7b7	9223	Dobrovnik/Dobronak 
00050000-563b-2088-824c-3edefabb1cbc	5212	Dobrovo v Brdih
00050000-563b-2088-39d5-a400c7b81b85	1431	Dol pri Hrastniku
00050000-563b-2088-5b67-26a1f3e67f6b	1262	Dol pri Ljubljani
00050000-563b-2088-7063-f47834ad665f	1273	Dole pri Litiji
00050000-563b-2088-aace-aa521cab4726	1331	Dolenja vas
00050000-563b-2088-f8c3-205172204a81	8350	Dolenjske Toplice
00050000-563b-2088-1be0-71fbf33afa4b	1230	Domžale
00050000-563b-2088-244c-8314458975e7	2252	Dornava
00050000-563b-2088-3a77-935577e4642c	5294	Dornberk
00050000-563b-2088-5006-d3a9bcdf6821	1319	Draga
00050000-563b-2088-438d-19fb87aae250	8343	Dragatuš
00050000-563b-2088-5aff-4a0d7677b8ad	3222	Dramlje
00050000-563b-2088-7fce-a66d1bd0ed63	2370	Dravograd
00050000-563b-2088-8b1a-8c929f038841	4203	Duplje
00050000-563b-2088-e96d-c1fb280454eb	6221	Dutovlje
00050000-563b-2088-8b97-baa44f977f41	8361	Dvor
00050000-563b-2088-4f22-097b2919643c	2343	Fala
00050000-563b-2088-fcd0-9a79768b8b99	9208	Fokovci
00050000-563b-2088-d9d2-b6452af0adcb	2313	Fram
00050000-563b-2088-e25a-db70f3462d59	3213	Frankolovo
00050000-563b-2088-e2bc-bee549c02a46	1274	Gabrovka
00050000-563b-2088-4ff5-566b63729116	8254	Globoko
00050000-563b-2088-ab18-fdbfd42a0e4f	5275	Godovič
00050000-563b-2088-3c13-706de2113571	4204	Golnik
00050000-563b-2088-0954-6d599d0cdae3	3303	Gomilsko
00050000-563b-2088-976f-af1a79026da5	4224	Gorenja vas
00050000-563b-2088-fddf-968b087b62ba	3263	Gorica pri Slivnici
00050000-563b-2088-f51b-30e9ec173326	2272	Gorišnica
00050000-563b-2088-bf4f-af0f3f3c23bd	9250	Gornja Radgona
00050000-563b-2088-a130-cc16bd04ea2f	3342	Gornji Grad
00050000-563b-2088-52db-dbc18a8e7526	4282	Gozd Martuljek
00050000-563b-2088-750a-f47d3e20ae15	6272	Gračišče
00050000-563b-2088-ab39-f9fca3237aef	9264	Grad
00050000-563b-2088-f520-0d4e4f1413bd	8332	Gradac
00050000-563b-2088-d26f-23fdfa945fe1	1384	Grahovo
00050000-563b-2088-0ff0-aa91daf9e23a	5242	Grahovo ob Bači
00050000-563b-2088-fc19-7dc98ad7b529	5251	Grgar
00050000-563b-2088-d339-6ba464d40ee2	3302	Griže
00050000-563b-2088-b703-151c8938c05e	3231	Grobelno
00050000-563b-2088-f1bc-b6cf3cf82afd	1290	Grosuplje
00050000-563b-2088-d17f-0d8a72824a0a	2288	Hajdina
00050000-563b-2088-36a9-0beb69f81795	8362	Hinje
00050000-563b-2088-b299-d8dce339310c	2311	Hoče
00050000-563b-2088-ff8d-1988f5ed0381	9205	Hodoš/Hodos
00050000-563b-2088-712c-229a0306a75e	1354	Horjul
00050000-563b-2088-3715-deb9e6013ab8	1372	Hotedršica
00050000-563b-2088-ce8e-9a3d264033a8	1430	Hrastnik
00050000-563b-2088-6ca1-9f7732a775cc	6225	Hruševje
00050000-563b-2088-7398-fad38953f86d	4276	Hrušica
00050000-563b-2088-4417-6419c0bc3dde	5280	Idrija
00050000-563b-2088-415d-82c27e3ee51c	1292	Ig
00050000-563b-2088-dd20-e75b2d4de00f	6250	Ilirska Bistrica
00050000-563b-2088-e3be-24703fa3b301	6251	Ilirska Bistrica-Trnovo
00050000-563b-2088-f272-a49e269b01e6	1295	Ivančna Gorica
00050000-563b-2088-3c59-c743a4af4f49	2259	Ivanjkovci
00050000-563b-2088-83dd-c73330f63b19	1411	Izlake
00050000-563b-2088-c131-748c1bc0ebf5	6310	Izola/Isola
00050000-563b-2088-cd04-3d76334ee36f	2222	Jakobski Dol
00050000-563b-2088-9e54-ddc3ddd10dfd	2221	Jarenina
00050000-563b-2088-a587-7c947ebad99a	6254	Jelšane
00050000-563b-2088-01a6-e5bd490beb03	4270	Jesenice
00050000-563b-2088-1b5e-dbdccaf8ab02	8261	Jesenice na Dolenjskem
00050000-563b-2088-3ba7-6ed5c16851f0	3273	Jurklošter
00050000-563b-2088-0c1e-633fd43bec2a	2223	Jurovski Dol
00050000-563b-2088-ae90-66f3282b85ec	2256	Juršinci
00050000-563b-2088-28c9-d5ad2de4d811	5214	Kal nad Kanalom
00050000-563b-2088-b703-34dfbdbc8a8d	3233	Kalobje
00050000-563b-2088-6e6f-8a687b3a89a5	4246	Kamna Gorica
00050000-563b-2088-6253-045944135aff	2351	Kamnica
00050000-563b-2088-cf26-5ca1dc42ef42	1241	Kamnik
00050000-563b-2088-ca1f-ae6b0dc34e64	5213	Kanal
00050000-563b-2088-558f-0981764cbf92	8258	Kapele
00050000-563b-2088-743c-7d8501b2ac82	2362	Kapla
00050000-563b-2088-6d1e-540c486ffc82	2325	Kidričevo
00050000-563b-2088-3dba-379aae303383	1412	Kisovec
00050000-563b-2088-1d60-1605b0b8ecd5	6253	Knežak
00050000-563b-2088-bb79-20e0e36e2857	5222	Kobarid
00050000-563b-2088-3f2e-de52108586e4	9227	Kobilje
00050000-563b-2088-f6b2-2f45eaf62fee	1330	Kočevje
00050000-563b-2088-24cc-f380da47b036	1338	Kočevska Reka
00050000-563b-2088-9389-aac6cccccd7a	2276	Kog
00050000-563b-2088-ff90-8df2e57f99fa	5211	Kojsko
00050000-563b-2088-67a1-61a8280da440	6223	Komen
00050000-563b-2088-85c0-8e08d5e9e677	1218	Komenda
00050000-563b-2088-ba65-272cc8cb0fb4	6000	Koper/Capodistria 
00050000-563b-2088-dfb1-92cac7727a49	6001	Koper/Capodistria - poštni predali
00050000-563b-2088-19fe-316c138c6145	8282	Koprivnica
00050000-563b-2088-1650-c00aa8bf719d	5296	Kostanjevica na Krasu
00050000-563b-2088-8be5-e66f31618db2	8311	Kostanjevica na Krki
00050000-563b-2088-d9d0-df9bbef84769	1336	Kostel
00050000-563b-2088-63df-479d0bac7ad6	6256	Košana
00050000-563b-2088-c97e-d3decef368ed	2394	Kotlje
00050000-563b-2088-6f66-271e1450a8c4	6240	Kozina
00050000-563b-2088-9de2-4b084c38aa2a	3260	Kozje
00050000-563b-2088-d236-2b326c160b7b	4000	Kranj 
00050000-563b-2088-5469-854ab60e2918	4001	Kranj - poštni predali
00050000-563b-2088-cb90-cec79368d1c2	4280	Kranjska Gora
00050000-563b-2088-05dc-3e45d27ef7cc	1281	Kresnice
00050000-563b-2088-b4c1-27cf4c42c559	4294	Križe
00050000-563b-2088-18d1-22f8a87a53f3	9206	Križevci
00050000-563b-2088-888b-c73cb8800171	9242	Križevci pri Ljutomeru
00050000-563b-2088-e69f-da49ab8e2c99	1301	Krka
00050000-563b-2088-1579-836e7317ecd4	8296	Krmelj
00050000-563b-2088-4bb3-59946d6fc72b	4245	Kropa
00050000-563b-2088-2a94-10b5e1b89501	8262	Krška vas
00050000-563b-2088-0832-02fa94118c2c	8270	Krško
00050000-563b-2088-d5c6-313b7ff82988	9263	Kuzma
00050000-563b-2088-14ac-e88a96e7d116	2318	Laporje
00050000-563b-2088-44b1-7eceb56b934a	3270	Laško
00050000-563b-2088-f0af-e50136522ec6	1219	Laze v Tuhinju
00050000-563b-2088-ed4a-56ec99b6e5e0	2230	Lenart v Slovenskih goricah
00050000-563b-2088-3220-8d1c9d7ba0bd	9220	Lendava/Lendva
00050000-563b-2088-17b1-090443a802da	4248	Lesce
00050000-563b-2088-3dfc-9ac8306c25dd	3261	Lesično
00050000-563b-2088-b1c7-8937ebe4acad	8273	Leskovec pri Krškem
00050000-563b-2088-d4d8-b16c7f8343fb	2372	Libeliče
00050000-563b-2088-c3cc-8b5ba8284c94	2341	Limbuš
00050000-563b-2088-d946-abd5e441081f	1270	Litija
00050000-563b-2088-daa1-33dc98abab35	3202	Ljubečna
00050000-563b-2088-d89d-3ae948392212	1000	Ljubljana 
00050000-563b-2088-0d10-b3cb8c99c4f6	1001	Ljubljana - poštni predali
00050000-563b-2088-6b91-7c1b3aa950a0	1231	Ljubljana - Črnuče
00050000-563b-2088-b59e-0ea8fbec88ad	1261	Ljubljana - Dobrunje
00050000-563b-2088-73c5-6be276ad3489	1260	Ljubljana - Polje
00050000-563b-2088-00e4-43f295cc8472	1210	Ljubljana - Šentvid
00050000-563b-2088-42dd-9c781066e32c	1211	Ljubljana - Šmartno
00050000-563b-2088-78e9-f1ea4ba1974f	3333	Ljubno ob Savinji
00050000-563b-2088-6bf0-c9511eceadbd	9240	Ljutomer
00050000-563b-2088-82a0-744202f3d466	3215	Loče
00050000-563b-2088-dfb5-ed45becf852d	5231	Log pod Mangartom
00050000-563b-2088-276f-d43ccaec969e	1358	Log pri Brezovici
00050000-563b-2088-ac3c-518ce78b97ca	1370	Logatec
00050000-563b-2088-e770-8d2364db1019	1371	Logatec
00050000-563b-2088-31eb-9480fbcca796	1434	Loka pri Zidanem Mostu
00050000-563b-2088-8d04-798f32ac0ef8	3223	Loka pri Žusmu
00050000-563b-2088-852a-bbc42f5b8897	6219	Lokev
00050000-563b-2088-d41c-38b54e3630ad	1318	Loški Potok
00050000-563b-2088-626d-184e1a5dd204	2324	Lovrenc na Dravskem polju
00050000-563b-2088-acf5-6d2d20f931a3	2344	Lovrenc na Pohorju
00050000-563b-2088-bfe5-b3b78a0b3e7d	3334	Luče
00050000-563b-2088-4c61-1a9bf9338874	1225	Lukovica
00050000-563b-2088-b669-86e5e4e0aae2	9202	Mačkovci
00050000-563b-2088-9b04-ddf67f63ecef	2322	Majšperk
00050000-563b-2088-052d-76dd0f11db46	2321	Makole
00050000-563b-2088-4844-34bc4a0b433c	9243	Mala Nedelja
00050000-563b-2088-bdb2-adc9084ce3e5	2229	Malečnik
00050000-563b-2088-1eb4-7399513471dd	6273	Marezige
00050000-563b-2088-7166-69cade137d48	2000	Maribor 
00050000-563b-2088-31e6-8dbc32bf4c7e	2001	Maribor - poštni predali
00050000-563b-2088-0987-09d1f511fb04	2206	Marjeta na Dravskem polju
00050000-563b-2088-0683-5aaac5e25286	2281	Markovci
00050000-563b-2088-bd4b-14dc3517d90a	9221	Martjanci
00050000-563b-2088-b917-5310da6bf046	6242	Materija
00050000-563b-2088-6c4b-59919a459c1b	4211	Mavčiče
00050000-563b-2088-9270-837e9b99d560	1215	Medvode
00050000-563b-2088-c076-49f8d9c14b16	1234	Mengeš
00050000-563b-2088-0b15-e0be1aae05f6	8330	Metlika
00050000-563b-2088-a8f0-88a02a2d6f86	2392	Mežica
00050000-563b-2088-4f0e-17d2be7e813d	2204	Miklavž na Dravskem polju
00050000-563b-2088-a047-fbec1863da92	2275	Miklavž pri Ormožu
00050000-563b-2088-2578-d6ffe7420ea2	5291	Miren
00050000-563b-2088-2ada-407db6d7e546	8233	Mirna
00050000-563b-2088-8ceb-a063669265a3	8216	Mirna Peč
00050000-563b-2088-927a-ee9aa4db682a	2382	Mislinja
00050000-563b-2088-ca3a-4d26009a2c86	4281	Mojstrana
00050000-563b-2088-2efb-dfbd747cd13b	8230	Mokronog
00050000-563b-2088-f7b9-cdb87ec11058	1251	Moravče
00050000-563b-2088-ea96-7848fb3f713d	9226	Moravske Toplice
00050000-563b-2088-7742-081622d12073	5216	Most na Soči
00050000-563b-2088-6baa-984afdda7695	1221	Motnik
00050000-563b-2088-88fa-8d157d18e25c	3330	Mozirje
00050000-563b-2088-8490-8ed743c2af66	9000	Murska Sobota 
00050000-563b-2088-45af-cc5649b28b45	9001	Murska Sobota - poštni predali
00050000-563b-2088-054b-a158f1b57c76	2366	Muta
00050000-563b-2088-43e8-3a1a19f85624	4202	Naklo
00050000-563b-2088-f56e-4ae147a46ea0	3331	Nazarje
00050000-563b-2088-33be-31b031b4e536	1357	Notranje Gorice
00050000-563b-2088-7425-0386bd19beb9	3203	Nova Cerkev
00050000-563b-2088-e17b-3253b3fe5840	5000	Nova Gorica 
00050000-563b-2088-9122-892f46a36c02	5001	Nova Gorica - poštni predali
00050000-563b-2088-16ba-a13231d15532	1385	Nova vas
00050000-563b-2088-e9c0-f0cd8ce0de77	8000	Novo mesto
00050000-563b-2088-b7f8-d7e68ea049c1	8001	Novo mesto - poštni predali
00050000-563b-2088-a6f6-b1be2f65764b	6243	Obrov
00050000-563b-2088-4d63-2b1056630412	9233	Odranci
00050000-563b-2088-3472-2693e283af8e	2317	Oplotnica
00050000-563b-2088-5197-431af953b0d2	2312	Orehova vas
00050000-563b-2088-7c71-c69750ef99d9	2270	Ormož
00050000-563b-2088-dfba-c12d8a981261	1316	Ortnek
00050000-563b-2088-4200-0e4be628e53f	1337	Osilnica
00050000-563b-2088-87d6-20cc1128e9d2	8222	Otočec
00050000-563b-2088-4f27-71367ce97ef5	2361	Ožbalt
00050000-563b-2088-638f-d1026ee171d9	2231	Pernica
00050000-563b-2088-3bfa-71fb18bdce17	2211	Pesnica pri Mariboru
00050000-563b-2088-ede6-5cf30819cd28	9203	Petrovci
00050000-563b-2088-144a-cec7a99583fb	3301	Petrovče
00050000-563b-2088-34fa-149d4ec0e8cd	6330	Piran/Pirano
00050000-563b-2088-ccf2-4103feb7bebc	8255	Pišece
00050000-563b-2088-509c-085433104c44	6257	Pivka
00050000-563b-2088-d2a6-ffdb0e6917a9	6232	Planina
00050000-563b-2088-e522-796d0d3820d6	3225	Planina pri Sevnici
00050000-563b-2088-ee37-67d810a2eefe	6276	Pobegi
00050000-563b-2088-9793-2cb978b3b4a6	8312	Podbočje
00050000-563b-2088-567f-77704e7e935d	5243	Podbrdo
00050000-563b-2088-18ee-f6c5913f4078	3254	Podčetrtek
00050000-563b-2088-ff10-f3a316d30e35	2273	Podgorci
00050000-563b-2088-38af-6cd1709b17e3	6216	Podgorje
00050000-563b-2088-251f-096509bc2165	2381	Podgorje pri Slovenj Gradcu
00050000-563b-2088-d7f7-9d05f1577925	6244	Podgrad
00050000-563b-2088-7fd3-5a0429b5d45d	1414	Podkum
00050000-563b-2088-828b-f2dc7478f0c9	2286	Podlehnik
00050000-563b-2088-492d-228edfe1d212	5272	Podnanos
00050000-563b-2088-2927-c6d5e3ff7e21	4244	Podnart
00050000-563b-2088-29dc-72c31adc42f2	3241	Podplat
00050000-563b-2088-fa69-48790d7f5d19	3257	Podsreda
00050000-563b-2088-611a-d7b9b2bb65e3	2363	Podvelka
00050000-563b-2088-a2e3-3b37875d704f	2208	Pohorje
00050000-563b-2088-b20f-01c06907917f	2257	Polenšak
00050000-563b-2088-1087-01837d6e6be6	1355	Polhov Gradec
00050000-563b-2088-da43-2dac0ac92f1d	4223	Poljane nad Škofjo Loko
00050000-563b-2088-93d9-0bcd2e3776b8	2319	Poljčane
00050000-563b-2088-1b3a-5c720b517ff8	1272	Polšnik
00050000-563b-2088-9559-4f67c99c514b	3313	Polzela
00050000-563b-2088-87a3-c589e9d1fe2f	3232	Ponikva
00050000-563b-2088-1354-a7aa9c169bb3	6320	Portorož/Portorose
00050000-563b-2088-6b0e-0d1729554bbe	6230	Postojna
00050000-563b-2088-d8b3-d19870ab2a1e	2331	Pragersko
00050000-563b-2088-02f3-f515289be3fe	3312	Prebold
00050000-563b-2088-aa7e-734e85c8388f	4205	Preddvor
00050000-563b-2088-1883-276d398d944c	6255	Prem
00050000-563b-2088-8f04-ad1c447ed133	1352	Preserje
00050000-563b-2088-d0b6-3ef906d6cb3c	6258	Prestranek
00050000-563b-2088-1c30-c5b3c9d5700a	2391	Prevalje
00050000-563b-2088-cda7-5f4a9445e89b	3262	Prevorje
00050000-563b-2088-9d99-9686d327f39b	1276	Primskovo 
00050000-563b-2088-20ac-ee4f44353afe	3253	Pristava pri Mestinju
00050000-563b-2088-c023-03dd6c3942d7	9207	Prosenjakovci/Partosfalva
00050000-563b-2088-9a26-93e314c011c0	5297	Prvačina
00050000-563b-2088-f99b-dff9fdcf957d	2250	Ptuj
00050000-563b-2088-ea19-7d734aa9166b	2323	Ptujska Gora
00050000-563b-2088-3442-e6c7ab614a13	9201	Puconci
00050000-563b-2088-012a-0f5556f40755	2327	Rače
00050000-563b-2088-2233-b263c644df2b	1433	Radeče
00050000-563b-2088-aa2a-a0d66a821257	9252	Radenci
00050000-563b-2088-c165-91078c09dccb	2360	Radlje ob Dravi
00050000-563b-2088-4d41-ee209175923f	1235	Radomlje
00050000-563b-2088-0c55-da86df28c2cb	4240	Radovljica
00050000-563b-2088-6d7c-47de874f7d5c	8274	Raka
00050000-563b-2088-bca2-9cda24db98e2	1381	Rakek
00050000-563b-2088-7def-34d997308034	4283	Rateče - Planica
00050000-563b-2088-d280-4c8428ce358f	2390	Ravne na Koroškem
00050000-563b-2088-f179-0163965010c1	9246	Razkrižje
00050000-563b-2088-d34c-410a4f69bbf9	3332	Rečica ob Savinji
00050000-563b-2088-1161-9f8f9616acca	5292	Renče
00050000-563b-2088-cf60-2d6cca92722d	1310	Ribnica
00050000-563b-2088-c765-40e82c50abe7	2364	Ribnica na Pohorju
00050000-563b-2088-71b2-9cf81e636274	3272	Rimske Toplice
00050000-563b-2088-9237-dac209f048c2	1314	Rob
00050000-563b-2088-95c0-b71c49c1724d	5215	Ročinj
00050000-563b-2088-7e56-895d0cefa95a	3250	Rogaška Slatina
00050000-563b-2088-1157-77dbd854add6	9262	Rogašovci
00050000-563b-2088-d4f3-c5cbf5e80606	3252	Rogatec
00050000-563b-2088-fcc2-4c4f230df1f4	1373	Rovte
00050000-563b-2088-047a-67c0b259f5e1	2342	Ruše
00050000-563b-2088-c098-c224cf4868b6	1282	Sava
00050000-563b-2088-b66c-3b48129c3042	6333	Sečovlje/Sicciole
00050000-563b-2088-8d83-83783c9ae6ec	4227	Selca
00050000-563b-2088-e27b-663c9d788c4e	2352	Selnica ob Dravi
00050000-563b-2088-28f7-7b305df9b93f	8333	Semič
00050000-563b-2088-24b6-2697ff2b96d4	8281	Senovo
00050000-563b-2088-243e-a3c9610bf744	6224	Senožeče
00050000-563b-2088-3c25-ba626af8aa0a	8290	Sevnica
00050000-563b-2088-65da-38eb686165fe	6210	Sežana
00050000-563b-2088-8213-37100def8ca7	2214	Sladki Vrh
00050000-563b-2088-1b19-d33095773f6d	5283	Slap ob Idrijci
00050000-563b-2088-0f7e-8f6be5c9715e	2380	Slovenj Gradec
00050000-563b-2088-f8ee-c17328454db8	2310	Slovenska Bistrica
00050000-563b-2088-5766-36d8140a6989	3210	Slovenske Konjice
00050000-563b-2088-ff7e-573b616390a4	1216	Smlednik
00050000-563b-2088-c067-f590aa947362	5232	Soča
00050000-563b-2088-5ffa-4d9b32d38c27	1317	Sodražica
00050000-563b-2088-2d7c-f81aeec0ee3c	3335	Solčava
00050000-563b-2088-baf2-8ffce5b54ebe	5250	Solkan
00050000-563b-2088-86e0-2a6903290c25	4229	Sorica
00050000-563b-2088-6bdd-a8351ae9b94c	4225	Sovodenj
00050000-563b-2088-c54b-471617a08ae6	5281	Spodnja Idrija
00050000-563b-2088-0a66-89808b84af81	2241	Spodnji Duplek
00050000-563b-2088-b0c5-c8d56ff9a951	9245	Spodnji Ivanjci
00050000-563b-2088-d9e0-6ea1608680db	2277	Središče ob Dravi
00050000-563b-2088-720c-5640b9b22e56	4267	Srednja vas v Bohinju
00050000-563b-2088-0fc2-5358de655136	8256	Sromlje 
00050000-563b-2088-3c30-eb1856eb5bc7	5224	Srpenica
00050000-563b-2088-ec0c-ede8be25b130	1242	Stahovica
00050000-563b-2088-aa69-da8e74c8cdcc	1332	Stara Cerkev
00050000-563b-2088-9ae9-a938a4462d67	8342	Stari trg ob Kolpi
00050000-563b-2088-982a-33ebbe487973	1386	Stari trg pri Ložu
00050000-563b-2088-3c5b-70a91ae918eb	2205	Starše
00050000-563b-2088-5ed2-0e7cfd2c1e63	2289	Stoperce
00050000-563b-2088-71d8-d514bf79f5d3	8322	Stopiče
00050000-563b-2088-59cd-c059777bf8c2	3206	Stranice
00050000-563b-2088-20bd-5d4918bbad6b	8351	Straža
00050000-563b-2088-12ea-aa2f3867aa4d	1313	Struge
00050000-563b-2088-2e93-e757002ef204	8293	Studenec
00050000-563b-2088-b168-3d0ffb8f232b	8331	Suhor
00050000-563b-2088-7a0e-2f4b441eca27	2233	Sv. Ana v Slovenskih goricah
00050000-563b-2088-e9a1-a0ffb6b1e4dd	2235	Sv. Trojica v Slovenskih goricah
00050000-563b-2088-6756-96c06aa92298	2353	Sveti Duh na Ostrem Vrhu
00050000-563b-2088-c673-2da727218911	9244	Sveti Jurij ob Ščavnici
00050000-563b-2088-3560-8707b51962b3	3264	Sveti Štefan
00050000-563b-2088-b790-346d314cfed9	2258	Sveti Tomaž
00050000-563b-2088-9712-7fb555060469	9204	Šalovci
00050000-563b-2088-0b90-cdcafcc35719	5261	Šempas
00050000-563b-2088-8f39-c33cd1b12b63	5290	Šempeter pri Gorici
00050000-563b-2088-969c-22c563a2fbb0	3311	Šempeter v Savinjski dolini
00050000-563b-2088-42d6-f74ef1b1338a	4208	Šenčur
00050000-563b-2088-c869-7905d4627984	2212	Šentilj v Slovenskih goricah
00050000-563b-2088-1c9d-172e65ee1e39	8297	Šentjanž
00050000-563b-2088-a7b7-445621b83370	2373	Šentjanž pri Dravogradu
00050000-563b-2088-22e2-344c0a668910	8310	Šentjernej
00050000-563b-2088-203e-4d81dbb5f682	3230	Šentjur
00050000-563b-2088-2917-0a49565143d2	3271	Šentrupert
00050000-563b-2088-dc00-f0dd4b2376dd	8232	Šentrupert
00050000-563b-2088-cb85-cadcd6ce3dad	1296	Šentvid pri Stični
00050000-563b-2088-611c-fc154790eb55	8275	Škocjan
00050000-563b-2088-675e-8a890acd0891	6281	Škofije
00050000-563b-2088-c494-661a7eb9e7b4	4220	Škofja Loka
00050000-563b-2088-ad1a-2f4fc9db0b25	3211	Škofja vas
00050000-563b-2088-d145-7a500c28af7b	1291	Škofljica
00050000-563b-2088-09e4-97753049169e	6274	Šmarje
00050000-563b-2088-f08b-1ad9a89df774	1293	Šmarje - Sap
00050000-563b-2088-9d31-135de2f1912b	3240	Šmarje pri Jelšah
00050000-563b-2088-7df4-8bfad6f8ffcd	8220	Šmarješke Toplice
00050000-563b-2088-415c-74e4c29d40bc	2315	Šmartno na Pohorju
00050000-563b-2088-3f74-beba9c93c32a	3341	Šmartno ob Dreti
00050000-563b-2088-e40a-133e1da2e178	3327	Šmartno ob Paki
00050000-563b-2088-b9af-b909f6d18102	1275	Šmartno pri Litiji
00050000-563b-2088-f285-9161cad46fe7	2383	Šmartno pri Slovenj Gradcu
00050000-563b-2088-d1d7-e1c58bb3c306	3201	Šmartno v Rožni dolini
00050000-563b-2088-e32e-4f8c9f7acf0f	3325	Šoštanj
00050000-563b-2088-45b4-79ccf01375e0	6222	Štanjel
00050000-563b-2088-b352-8070042daaa5	3220	Štore
00050000-563b-2088-ebe4-8b1aab393187	3304	Tabor
00050000-563b-2088-a18f-56c2afb0b80f	3221	Teharje
00050000-563b-2088-9cd5-55393d1bef40	9251	Tišina
00050000-563b-2088-df3b-dc9165204e77	5220	Tolmin
00050000-563b-2088-ab83-94025c35b16f	3326	Topolšica
00050000-563b-2088-53dc-5ad7abef536c	2371	Trbonje
00050000-563b-2088-5166-47d9ca62b829	1420	Trbovlje
00050000-563b-2088-b9da-4cddc89f8140	8231	Trebelno 
00050000-563b-2088-5ad9-cdfcb5f85ba9	8210	Trebnje
00050000-563b-2088-40e3-2ca07604de84	5252	Trnovo pri Gorici
00050000-563b-2088-5554-855d15e076cb	2254	Trnovska vas
00050000-563b-2088-e44c-b1bf85b024e7	1222	Trojane
00050000-563b-2088-c3c4-31c6e212638d	1236	Trzin
00050000-563b-2088-c38b-adc16948ecbb	4290	Tržič
00050000-563b-2088-2686-3ea6f0ce0296	8295	Tržišče
00050000-563b-2088-25a0-c0ee2dfdf82e	1311	Turjak
00050000-563b-2088-216e-4260befc9e13	9224	Turnišče
00050000-563b-2088-32ec-b4acc0465e6f	8323	Uršna sela
00050000-563b-2088-e857-2a125fe3d58c	1252	Vače
00050000-563b-2088-4076-16bc634fc4ef	3320	Velenje 
00050000-563b-2088-2b59-1c6da96aa5cf	3322	Velenje - poštni predali
00050000-563b-2088-b6ea-1144fa054df3	8212	Velika Loka
00050000-563b-2088-7a19-2932005597c9	2274	Velika Nedelja
00050000-563b-2088-1b35-7c8f414a753a	9225	Velika Polana
00050000-563b-2088-1305-4666cc419ad9	1315	Velike Lašče
00050000-563b-2088-c184-754f1e5e5c02	8213	Veliki Gaber
00050000-563b-2088-ed5a-25e136b81483	9241	Veržej
00050000-563b-2088-57ea-52388f3085bf	1312	Videm - Dobrepolje
00050000-563b-2088-7c65-683a4017916a	2284	Videm pri Ptuju
00050000-563b-2088-88a9-f250ceb31d70	8344	Vinica
00050000-563b-2088-5a01-22336424c6a9	5271	Vipava
00050000-563b-2088-e1b9-f3db8cd9c2af	4212	Visoko
00050000-563b-2088-dfc6-7072406754e2	1294	Višnja Gora
00050000-563b-2088-6201-1d148f8cb2bc	3205	Vitanje
00050000-563b-2088-b063-5c061e1b8f10	2255	Vitomarci
00050000-563b-2088-cd0b-0e468144c422	1217	Vodice
00050000-563b-2088-7d3b-8c978f3533b7	3212	Vojnik\t
00050000-563b-2088-3740-04eda65a8610	5293	Volčja Draga
00050000-563b-2088-e9d1-4affad516e6a	2232	Voličina
00050000-563b-2088-e6c8-d936d57d21bd	3305	Vransko
00050000-563b-2088-8b79-b628ca50bbc0	6217	Vremski Britof
00050000-563b-2088-fa1f-d10505f77dc8	1360	Vrhnika
00050000-563b-2088-48db-3cf76f3f40df	2365	Vuhred
00050000-563b-2088-30c1-09c894e29196	2367	Vuzenica
00050000-563b-2088-c00e-dfbdc2622fba	8292	Zabukovje 
00050000-563b-2088-5bb8-73003b08fd83	1410	Zagorje ob Savi
00050000-563b-2088-9e3c-9500a848a1c4	1303	Zagradec
00050000-563b-2088-a1c4-bc3c44bfd136	2283	Zavrč
00050000-563b-2088-a066-601888f2d954	8272	Zdole 
00050000-563b-2088-c3a0-76f749c8c5c0	4201	Zgornja Besnica
00050000-563b-2088-fede-dc571f947c9a	2242	Zgornja Korena
00050000-563b-2088-58ff-f81e84753151	2201	Zgornja Kungota
00050000-563b-2088-b868-e60e443be35c	2316	Zgornja Ložnica
00050000-563b-2088-fbbb-6b14f3e72b7d	2314	Zgornja Polskava
00050000-563b-2088-eec1-1b220da6763e	2213	Zgornja Velka
00050000-563b-2088-8017-814289966fe3	4247	Zgornje Gorje
00050000-563b-2088-714b-402467ca4fea	4206	Zgornje Jezersko
00050000-563b-2088-9b8c-c7aa99dcec0d	2285	Zgornji Leskovec
00050000-563b-2088-3371-df162b070f17	1432	Zidani Most
00050000-563b-2088-176d-ece8bc5feb39	3214	Zreče
00050000-563b-2088-43f3-5c944f5d4d41	4209	Žabnica
00050000-563b-2088-ae57-61296abd6581	3310	Žalec
00050000-563b-2088-2380-aa8e04431608	4228	Železniki
00050000-563b-2088-419f-6684f2add78e	2287	Žetale
00050000-563b-2088-5ed3-4e3b05954345	4226	Žiri
00050000-563b-2088-8dd5-1036e4bc807f	4274	Žirovnica
00050000-563b-2088-9cc7-2002b27000c9	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25227905)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25227481)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25227229)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-563b-208b-0a8d-632c7bc41380	00080000-563b-208b-f97f-69a767c61092	\N	00040000-563b-2089-6ff6-cf8cceaf4371	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-563b-208b-9309-dbe5d92cfc0a	00080000-563b-208b-f97f-69a767c61092	\N	00040000-563b-2089-6ff6-cf8cceaf4371	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-563b-208b-b4ee-8c78e44edefa	00080000-563b-208b-78e4-f433931659a1	\N	00040000-563b-2089-6ff6-cf8cceaf4371	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25227373)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-563b-2089-aad5-beac1598b5d7	novo leto	1	1	\N	t
00430000-563b-2089-eb25-18da753f8eb5	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-563b-2089-1d63-58db2da98a56	dan upora proti okupatorju	27	4	\N	t
00430000-563b-2089-a118-2ad6260944c0	praznik dela	1	5	\N	t
00430000-563b-2089-1980-ba44556474a7	praznik dela	2	5	\N	t
00430000-563b-2089-7d84-53cfeec18b4c	dan Primoža Trubarja	8	6	\N	f
00430000-563b-2089-c76a-d9fbfc9619d8	dan državnosti	25	6	\N	t
00430000-563b-2089-6a6b-7d7ec620812b	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-563b-2089-af03-dacd1db54df4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-563b-2089-f644-9078d1495f77	dan suverenosti	25	10	\N	f
00430000-563b-2089-fe1a-ebbc059cba24	dan spomina na mrtve	1	11	\N	t
00430000-563b-2089-30f6-8a269968675d	dan Rudolfa Maistra	23	11	\N	f
00430000-563b-2089-3eb7-4d6190a0e6c2	božič	25	12	\N	t
00430000-563b-2089-ea93-ee9ef2fcca53	dan samostojnosti in enotnosti	26	12	\N	t
00430000-563b-2089-3e1b-bd61c5b3d371	Marijino vnebovzetje	15	8	\N	t
00430000-563b-2089-4e37-3d135f496eaf	dan reformacije	31	10	\N	t
00430000-563b-2089-8e79-5f3b5fc62091	velikonočna nedelja	27	3	2016	t
00430000-563b-2089-36fb-49b23f755be2	velikonočna nedelja	16	4	2017	t
00430000-563b-2089-e5b1-3d0737f1bf6a	velikonočna nedelja	1	4	2018	t
00430000-563b-2089-9710-881671943ba3	velikonočna nedelja	21	4	2019	t
00430000-563b-2089-8679-2347a6a76de9	velikonočna nedelja	12	4	2020	t
00430000-563b-2089-538b-765f6c3e224b	velikonočna nedelja	4	4	2021	t
00430000-563b-2089-36cc-e2bdefdc5d18	velikonočna nedelja	17	4	2022	t
00430000-563b-2089-be02-6d9e4c3c69a8	velikonočna nedelja	9	4	2023	t
00430000-563b-2089-4703-06ee0a79abfb	velikonočna nedelja	31	3	2024	t
00430000-563b-2089-f18e-d2003dbc6517	velikonočna nedelja	20	4	2025	t
00430000-563b-2089-e396-4c94760cb7ef	velikonočna nedelja	5	4	2026	t
00430000-563b-2089-34d5-89807bf2796f	velikonočna nedelja	28	3	2027	t
00430000-563b-2089-ca6b-fc71f3fb5e28	velikonočna nedelja	16	4	2028	t
00430000-563b-2089-2b9f-ae8313f3aa43	velikonočna nedelja	1	4	2029	t
00430000-563b-2089-1043-98557765d770	velikonočna nedelja	21	4	2030	t
00430000-563b-2089-5f8e-f9058165c7dc	velikonočni ponedeljek	28	3	2016	t
00430000-563b-2089-f981-d88c10519de1	velikonočni ponedeljek	17	4	2017	t
00430000-563b-2089-4438-d9bf5f4f4764	velikonočni ponedeljek	2	4	2018	t
00430000-563b-2089-6546-f49d25ae2a80	velikonočni ponedeljek	22	4	2019	t
00430000-563b-2089-0132-45c8f289e38d	velikonočni ponedeljek	13	4	2020	t
00430000-563b-2089-bb73-d5c94016f8af	velikonočni ponedeljek	5	4	2021	t
00430000-563b-2089-389b-f3c0912f4322	velikonočni ponedeljek	18	4	2022	t
00430000-563b-2089-e5ec-36172151ffd5	velikonočni ponedeljek	10	4	2023	t
00430000-563b-2089-3787-b00ca188fb6e	velikonočni ponedeljek	1	4	2024	t
00430000-563b-2089-361e-3840b76a5803	velikonočni ponedeljek	21	4	2025	t
00430000-563b-2089-e37c-ff0dc177d832	velikonočni ponedeljek	6	4	2026	t
00430000-563b-2089-592c-4cd408417618	velikonočni ponedeljek	29	3	2027	t
00430000-563b-2089-5bf3-eb44717dd7cf	velikonočni ponedeljek	17	4	2028	t
00430000-563b-2089-f801-b19c67525c0f	velikonočni ponedeljek	2	4	2029	t
00430000-563b-2089-1838-39fab2b96102	velikonočni ponedeljek	22	4	2030	t
00430000-563b-2089-86aa-cd216ea29f52	binkoštna nedelja - binkošti	15	5	2016	t
00430000-563b-2089-7cac-6b408859b9f3	binkoštna nedelja - binkošti	4	6	2017	t
00430000-563b-2089-86ea-df49b094aa22	binkoštna nedelja - binkošti	20	5	2018	t
00430000-563b-2089-4833-7780bd412ab7	binkoštna nedelja - binkošti	9	6	2019	t
00430000-563b-2089-144f-764d4402df32	binkoštna nedelja - binkošti	31	5	2020	t
00430000-563b-2089-411d-bcba80f37406	binkoštna nedelja - binkošti	23	5	2021	t
00430000-563b-2089-7918-f22d7ede1977	binkoštna nedelja - binkošti	5	6	2022	t
00430000-563b-2089-e6f4-572011c50381	binkoštna nedelja - binkošti	28	5	2023	t
00430000-563b-2089-9273-d75a82730d50	binkoštna nedelja - binkošti	19	5	2024	t
00430000-563b-2089-5249-994e8edf3fc0	binkoštna nedelja - binkošti	8	6	2025	t
00430000-563b-2089-3707-9a0fc1851a8d	binkoštna nedelja - binkošti	24	5	2026	t
00430000-563b-2089-17f9-e2c8b83a998b	binkoštna nedelja - binkošti	16	5	2027	t
00430000-563b-2089-488f-5a1a490803db	binkoštna nedelja - binkošti	4	6	2028	t
00430000-563b-2089-06d1-1839af761a52	binkoštna nedelja - binkošti	20	5	2029	t
00430000-563b-2089-ac62-84d702375bea	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25227333)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25227345)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25227493)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25227919)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25227929)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-563b-208b-2022-eb9d04db510f	00080000-563b-208b-8f9a-6f27bf950216	0987	AK
00190000-563b-208b-4538-20442921a1d3	00080000-563b-208b-78e4-f433931659a1	0989	AK
00190000-563b-208b-a868-08978a7c076b	00080000-563b-208b-f582-86a962612c79	0986	AK
00190000-563b-208b-c5d3-3ec8b2741a85	00080000-563b-208b-2ec0-764e380cb984	0984	AK
00190000-563b-208b-9b20-86bc8f0af05a	00080000-563b-208b-5bd0-ef182282947d	0983	AK
00190000-563b-208b-ea5e-b319ba6cc39e	00080000-563b-208b-9ad0-900fc9943eae	0982	AK
00190000-563b-208c-24f2-e7dacc325958	00080000-563b-208c-6f90-59b17e72e738	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25227828)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-563b-208b-2f8b-eacd504ab916	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25227937)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25227522)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-563b-208a-0116-54f6c85dc7ca	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-563b-208a-ef18-8fc80de578d3	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-563b-208a-0649-fb313ff772cb	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-563b-208a-01e4-5135aea85088	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-563b-208a-fdff-a1379095a5ac	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-563b-208a-48d2-1496a5d4abb5	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-563b-208a-c832-5e0e8cdf04d6	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25227466)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25227456)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25227667)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25227597)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25227307)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25227069)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-563b-208c-6f90-59b17e72e738	00010000-563b-2089-b235-c2687fecc4f2	2015-11-05 10:25:32	INS	a:0:{}
2	App\\Entity\\Option	00000000-563b-208c-ea3a-6760a33e0bc0	00010000-563b-2089-b235-c2687fecc4f2	2015-11-05 10:25:32	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-563b-208c-24f2-e7dacc325958	00010000-563b-2089-b235-c2687fecc4f2	2015-11-05 10:25:32	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25227535)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25227107)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-563b-2089-52d1-3e9e09d659f1	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-563b-2089-e050-83dc776c7efb	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-563b-2089-c5f7-22220e4f895c	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-563b-2089-cb6f-ab8187585a20	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-563b-2089-b03e-58a0b50e529f	planer	Planer dogodkov v koledarju	t
00020000-563b-2089-038c-d1f2fd4e37b4	kadrovska	Kadrovska služba	t
00020000-563b-2089-a82f-3e866670606c	arhivar	Ažuriranje arhivalij	t
00020000-563b-2089-e04a-6a8bdfe245f8	igralec	Igralec	t
00020000-563b-2089-6603-8d886b0621df	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-563b-208b-8447-84fd3ab05c1c	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3095 (class 0 OID 25227091)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-563b-2089-29e6-933fdaa75228	00020000-563b-2089-c5f7-22220e4f895c
00010000-563b-2089-b235-c2687fecc4f2	00020000-563b-2089-c5f7-22220e4f895c
00010000-563b-208b-7acd-625b77078743	00020000-563b-208b-8447-84fd3ab05c1c
\.


--
-- TOC entry 3140 (class 0 OID 25227549)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25227487)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25227433)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-563b-208a-ba4b-2b586a615e66	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-563b-208a-e941-1909c8d5899c	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-563b-208a-e9fd-78e501354d74	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25227056)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-563b-2088-cc72-9ebd20767f81	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-563b-2088-38f8-fd2078745961	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-563b-2088-0f83-050d5e571163	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-563b-2088-6d68-d622c2489fac	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-563b-2088-a617-f64aef8915b0	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25227048)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-563b-2088-9d60-ae972384ed49	00230000-563b-2088-6d68-d622c2489fac	popa
00240000-563b-2088-d58d-d6d26c37e219	00230000-563b-2088-6d68-d622c2489fac	oseba
00240000-563b-2088-631c-21115df6e1bb	00230000-563b-2088-6d68-d622c2489fac	tippopa
00240000-563b-2088-5e7b-baab7f4a3051	00230000-563b-2088-6d68-d622c2489fac	organizacijskaenota
00240000-563b-2088-296b-61a2bb05de88	00230000-563b-2088-6d68-d622c2489fac	sezona
00240000-563b-2088-e186-bd5d593f06b7	00230000-563b-2088-6d68-d622c2489fac	tipvaje
00240000-563b-2088-7cd2-2e64a80bc02b	00230000-563b-2088-38f8-fd2078745961	prostor
00240000-563b-2088-a7a9-a89a81243730	00230000-563b-2088-6d68-d622c2489fac	besedilo
00240000-563b-2088-297c-3bcb8f912670	00230000-563b-2088-6d68-d622c2489fac	uprizoritev
00240000-563b-2088-ae5a-a43290e9389b	00230000-563b-2088-6d68-d622c2489fac	funkcija
00240000-563b-2088-5340-2b7ec649b962	00230000-563b-2088-6d68-d622c2489fac	tipfunkcije
00240000-563b-2088-383d-683468d18408	00230000-563b-2088-6d68-d622c2489fac	alternacija
00240000-563b-2088-87c6-7ebcdc8f0609	00230000-563b-2088-cc72-9ebd20767f81	pogodba
00240000-563b-2088-b643-455a72386a24	00230000-563b-2088-6d68-d622c2489fac	zaposlitev
00240000-563b-2088-e445-589ef8b4471c	00230000-563b-2088-6d68-d622c2489fac	zvrstuprizoritve
00240000-563b-2088-60e5-7d3c9060bbab	00230000-563b-2088-cc72-9ebd20767f81	programdela
00240000-563b-2088-521f-eebbefb9c5a0	00230000-563b-2088-6d68-d622c2489fac	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25227043)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
995e5d0a-93e2-4a9f-9cd3-8f93cd6c5c85	00240000-563b-2088-9d60-ae972384ed49	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25227614)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-563b-208b-e820-7d0a86377f2b	000e0000-563b-208b-347c-a9ec4f3607b0	00080000-563b-208b-f97f-69a767c61092	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-563b-2089-ef5d-deb348d7ba44
00270000-563b-208b-6090-32e9a5cd65c0	000e0000-563b-208b-347c-a9ec4f3607b0	00080000-563b-208b-f97f-69a767c61092	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-563b-2089-ef5d-deb348d7ba44
\.


--
-- TOC entry 3105 (class 0 OID 25227191)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25227443)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-563b-208b-37dc-e24cb1d892d7	00180000-563b-208b-5071-fdc308fb07a5	000c0000-563b-208b-1ff3-582ab94b9ade	00090000-563b-208b-1eca-782335b7ac7f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563b-208b-eba2-0fa5c5913bd4	00180000-563b-208b-5071-fdc308fb07a5	000c0000-563b-208b-8e4b-cd2b3c07af6c	00090000-563b-208b-4983-4be5169eb48b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563b-208b-a01a-c2eaa847b6f7	00180000-563b-208b-5071-fdc308fb07a5	000c0000-563b-208b-ada6-36cf364bc0b4	00090000-563b-208b-78fd-78d141f006f8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563b-208b-4db4-0384024375c9	00180000-563b-208b-5071-fdc308fb07a5	000c0000-563b-208b-4c49-efdc02173353	00090000-563b-208b-340b-e4aeff7b3cd3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563b-208b-ee2b-c4e1d7ad5d2e	00180000-563b-208b-5071-fdc308fb07a5	000c0000-563b-208b-fc44-d1d1fc8d5ef4	00090000-563b-208b-5697-345049f6b13f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563b-208b-63e5-efda0574f9bf	00180000-563b-208b-19ec-00055e488f28	\N	00090000-563b-208b-5697-345049f6b13f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-563b-208b-0da3-49d0ba5dca6a	00180000-563b-208b-19ec-00055e488f28	\N	00090000-563b-208b-4983-4be5169eb48b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25227655)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-563b-2088-b7bd-5abca31dead5	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-563b-2088-002c-ae9ccbc2b667	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-563b-2088-5018-3a82d810d296	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-563b-2088-2305-a4de46bd4204	04	Režija	Režija	Režija	umetnik	30
000f0000-563b-2088-735d-58b6a24a7114	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-563b-2088-c4f5-4e9424048bd8	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-563b-2088-8179-ae35f90d375e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-563b-2088-4d99-44152b3ba894	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-563b-2088-5a38-8bb9b9436c5b	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-563b-2088-b89e-0d28d8ed170f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-563b-2088-3aa5-4a4052e800a4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-563b-2088-de4d-0687d309dc47	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-563b-2088-4e97-e81d122b00e4	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-563b-2088-4e52-b1fc1c3412fa	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-563b-2088-ad36-de73a8d1f92e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-563b-2088-a8b7-42bdc77351c7	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-563b-2088-703f-83b8ab27a653	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-563b-2088-d7a5-3cb65c657525	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25227142)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-563b-208a-68fc-202045c89ab5	0001	šola	osnovna ali srednja šola
00400000-563b-208a-199e-f43498761b2d	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-563b-208a-c629-b9148a5c2fdd	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25227948)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-563b-2088-c8ff-b5b2f8817d40	01	Velika predstava	f	1.00	1.00
002b0000-563b-2088-76ba-2f49c7feb82c	02	Mala predstava	f	0.50	0.50
002b0000-563b-2088-1b0f-b718e6ad059a	03	Mala koprodukcija	t	0.40	1.00
002b0000-563b-2088-b604-c7b9c4bfd330	04	Srednja koprodukcija	t	0.70	2.00
002b0000-563b-2088-1512-4925306bc9e4	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25227423)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-563b-2088-6c1c-a1ed2536b2b5	0001	prva vaja	prva vaja
00420000-563b-2088-1fcc-3502fd348ba5	0002	tehnična vaja	tehnična vaja
00420000-563b-2088-bf19-64fdcf45523e	0003	lučna vaja	lučna vaja
00420000-563b-2088-0414-5d335dd8211e	0004	kostumska vaja	kostumska vaja
00420000-563b-2088-e333-230a0275f4e4	0005	foto vaja	foto vaja
00420000-563b-2088-7957-fdf70351c30b	0006	1. glavna vaja	1. glavna vaja
00420000-563b-2088-53f8-f01629e5211a	0007	2. glavna vaja	2. glavna vaja
00420000-563b-2088-ca51-22b7652e2c1f	0008	1. generalka	1. generalka
00420000-563b-2088-df6a-705a2943c4c5	0009	2. generalka	2. generalka
00420000-563b-2088-1c0e-6e11b8fea368	0010	odprta generalka	odprta generalka
00420000-563b-2088-9020-1131de8661ae	0011	obnovitvena vaja	obnovitvena vaja
00420000-563b-2088-7023-25883fef0092	0012	pevska vaja	pevska vaja
00420000-563b-2088-a7c9-bfd885552217	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-563b-2088-1483-e7003557682b	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25227264)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25227078)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-563b-2089-b235-c2687fecc4f2	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRORiiJYIJ8pP1ZUBqtGzpItgS1QEoKuDa	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-563b-208b-0bf1-c566656f1f60	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-563b-208b-ff40-31e0d9ed21a6	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-563b-208b-ec96-b00f8b3b3f07	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-563b-208b-aa3d-dd386fbf740b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-563b-208b-3f23-a9b8df439fc6	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-563b-208b-37f9-a28c8514c1cf	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-563b-208b-6040-555aac6bd27d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-563b-208b-3f9b-26115bb4478f	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-563b-208b-1712-327d4630b40e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-563b-208b-7acd-625b77078743	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-563b-2089-29e6-933fdaa75228	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25227705)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-563b-208b-e48a-1b1a0975927c	00160000-563b-208a-c509-2abcb8bbc154	\N	00140000-563b-2088-3a63-7cf402e38a12	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-563b-208a-fdff-a1379095a5ac
000e0000-563b-208b-347c-a9ec4f3607b0	00160000-563b-208a-9e93-ae3112e89057	\N	00140000-563b-2088-c774-205cf4701a91	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-563b-208a-48d2-1496a5d4abb5
000e0000-563b-208b-0c49-ba508f94d502	\N	\N	00140000-563b-2088-c774-205cf4701a91	00190000-563b-208b-2022-eb9d04db510f	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563b-208a-fdff-a1379095a5ac
000e0000-563b-208b-63e2-5b366d083cbf	\N	\N	00140000-563b-2088-c774-205cf4701a91	00190000-563b-208b-2022-eb9d04db510f	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563b-208a-fdff-a1379095a5ac
000e0000-563b-208b-78be-1649cd2f8ce7	\N	\N	00140000-563b-2088-c774-205cf4701a91	00190000-563b-208b-2022-eb9d04db510f	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-563b-208a-0116-54f6c85dc7ca
000e0000-563b-208b-60bc-b82606f779d2	\N	\N	00140000-563b-2088-c774-205cf4701a91	00190000-563b-208b-2022-eb9d04db510f	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-563b-208a-0116-54f6c85dc7ca
\.


--
-- TOC entry 3119 (class 0 OID 25227363)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-563b-208b-95bf-72ecd3273b18	\N	000e0000-563b-208b-347c-a9ec4f3607b0	1	
00200000-563b-208b-893f-99c960d88167	\N	000e0000-563b-208b-347c-a9ec4f3607b0	2	
00200000-563b-208b-d00a-4a27637a66ab	\N	000e0000-563b-208b-347c-a9ec4f3607b0	3	
00200000-563b-208b-1fa9-5de42b280d79	\N	000e0000-563b-208b-347c-a9ec4f3607b0	4	
00200000-563b-208b-d5d9-273a9e2809a4	\N	000e0000-563b-208b-347c-a9ec4f3607b0	5	
\.


--
-- TOC entry 3136 (class 0 OID 25227514)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25227628)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-563b-2089-2ddb-4b2fb061ad1b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-563b-2089-c83e-730d1af59d8e	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-563b-2089-a861-c6d425fe2eb8	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-563b-2089-ac47-5d0e9b3da088	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-563b-2089-2628-fd1e652b4805	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-563b-2089-1755-99844b120014	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-563b-2089-c5ee-3d9d023f36b5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-563b-2089-dc9f-d64b04015098	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-563b-2089-ef5d-deb348d7ba44	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-563b-2089-5215-0bb5630b988a	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-563b-2089-190e-c8a396eed48f	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-563b-2089-d408-83d2a12ad9ae	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-563b-2089-8322-e0398c13c147	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-563b-2089-c73c-2f974903d710	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-563b-2089-7929-4bdb6e9f294b	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-563b-2089-715d-449b516fce18	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-563b-2089-4a65-1ff4982bd414	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-563b-2089-5c0d-98650bf8b18b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-563b-2089-ab21-e94b2e8c6a32	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-563b-2089-10db-1291d584f201	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-563b-2089-7329-8205dcc76a9b	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-563b-2089-9f98-4b164995a557	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-563b-2089-35f7-5b23bd6241c9	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-563b-2089-8874-fdab05000c77	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-563b-2089-de87-6e886c888bea	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-563b-2089-c9e4-a885551178ed	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-563b-2089-c49f-6a7b94152ad9	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-563b-2089-149b-ea16d234de21	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25227995)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25227967)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25228007)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25227586)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-563b-208b-a757-49576434c36f	00090000-563b-208b-4983-4be5169eb48b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563b-208b-ac52-7914aaa1e406	00090000-563b-208b-78fd-78d141f006f8	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563b-208b-5307-e1f23c2891ef	00090000-563b-208b-6849-18c14ea3615a	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563b-208b-203f-60664846df1f	00090000-563b-208b-3f57-01de36aac5bb	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563b-208b-8a43-edb3ad6b9953	00090000-563b-208b-1fda-4794736f3c5b	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563b-208b-acc9-8703516cf844	00090000-563b-208b-e039-ff53e3db9720	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25227407)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25227695)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-563b-2088-3a63-7cf402e38a12	01	Drama	drama (SURS 01)
00140000-563b-2088-8940-926f347a5980	02	Opera	opera (SURS 02)
00140000-563b-2088-a8c1-e8d93abbaa91	03	Balet	balet (SURS 03)
00140000-563b-2088-0454-b732e9e18a44	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-563b-2088-b36f-016264bd4085	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-563b-2088-c774-205cf4701a91	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-563b-2088-2af6-d3f1261bb4e5	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25227576)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25227141)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25227754)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25227744)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25227132)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25227611)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25227653)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25228047)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25227395)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25227417)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25227422)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25227965)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25227290)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25227822)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25227572)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25227361)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25227328)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25227304)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25227479)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25228024)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25228031)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25228055)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 25157737)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2722 (class 2606 OID 25227506)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25227262)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25227160)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25227224)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25227187)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25227121)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25227106)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25227512)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25227548)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25227690)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25227215)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25227250)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25227917)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25227485)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25227240)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25227380)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25227349)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25227341)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25227497)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25227926)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25227934)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25227904)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25227946)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25227530)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25227470)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25227461)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25227677)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25227604)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25227316)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25227077)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25227539)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25227095)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25227115)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25227557)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25227492)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25227441)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25227065)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25227053)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25227047)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25227624)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25227196)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25227452)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25227664)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25227149)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25227958)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25227430)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25227275)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25227090)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25227723)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25227370)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25227520)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25227636)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25228005)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25227989)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25228013)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25227594)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25227411)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25227703)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25227584)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25227405)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25227406)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25227404)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25227403)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25227402)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25227625)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25227626)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25227627)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25228026)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25228025)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25227217)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25227218)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25227513)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25227993)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25227992)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25227994)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25227991)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25227990)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25227499)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25227498)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25227371)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25227372)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25227573)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25227575)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25227574)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25227306)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25227305)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25227947)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25227692)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25227693)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25227694)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25228014)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25227728)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25227725)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25227729)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25227727)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25227726)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25227277)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25227276)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25227190)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25227540)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25227122)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25227123)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25227560)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25227559)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25227558)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25227227)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25227226)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25227228)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25227344)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25227342)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25227343)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25227055)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25227465)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25227463)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25227462)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25227464)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25227096)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25227097)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25227521)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25228048)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25227613)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25227612)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25228056)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25228057)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25227486)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25227605)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25227606)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25227827)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25227826)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25227823)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25227824)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25227825)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25227242)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25227241)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25227243)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25227534)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25227533)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25227927)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25227928)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25227758)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25227759)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25227756)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25227757)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25227595)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25227596)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25227474)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25227473)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25227471)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25227472)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25227746)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25227745)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25227317)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25227331)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25227330)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25227329)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25227332)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25227362)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25227350)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25227351)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25227918)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25227966)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25228032)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25228033)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25227162)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25227161)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25227197)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25227198)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25227412)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25227455)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25227454)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25227453)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25227397)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25227398)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25227401)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25227396)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25227400)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25227399)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25227216)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25227150)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25227151)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25227291)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25227293)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25227292)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25227294)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25227480)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25227691)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25227724)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25227665)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25227666)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25227188)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25227189)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25227585)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25227066)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25227263)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25227225)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25227054)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25227959)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25227532)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25227531)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25227431)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25227432)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25227755)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25227251)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25227704)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25228006)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25227935)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25227936)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25227654)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25227442)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25227116)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25228228)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25228233)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25228258)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25228248)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25228223)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25228243)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25228253)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25228238)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25228428)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25228433)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25228438)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25228603)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25228598)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25228113)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25228118)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25228343)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25228583)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25228578)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25228588)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25228573)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25228568)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25228338)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25228333)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25228213)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25228218)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25228383)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25228393)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25228388)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25228168)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25228163)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25228323)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25228558)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25228443)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25228448)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25228453)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25228593)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25228473)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25228458)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25228478)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25228468)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25228463)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25228158)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25228153)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25228098)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25228093)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25228363)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25228073)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25228078)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25228378)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25228373)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25228368)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25228128)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25228123)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25228133)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25228193)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25228183)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25228188)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25228058)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25228298)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25228288)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25228283)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25228293)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25228063)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25228068)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25228348)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25228618)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25228423)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25228418)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25228623)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25228628)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25228328)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25228408)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25228413)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25228533)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25228528)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25228513)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25228518)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25228523)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25228143)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25228138)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25228148)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25228358)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25228353)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25228543)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25228548)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25228503)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25228508)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25228493)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25228498)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25228398)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25228403)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25228318)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25228313)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25228303)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25228308)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25228488)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25228483)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25228173)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25228178)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25228208)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25228198)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25228203)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25228538)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25228553)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25228563)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25228608)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25228613)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25228088)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25228083)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25228103)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25228108)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25228263)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25228278)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25228273)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25228268)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-05 10:25:34 CET

--
-- PostgreSQL database dump complete
--

