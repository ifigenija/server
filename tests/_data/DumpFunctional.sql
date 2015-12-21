--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-21 09:29:58 CET

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
-- TOC entry 183 (class 1259 OID 32854887)
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
-- TOC entry 237 (class 1259 OID 32855502)
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
-- TOC entry 236 (class 1259 OID 32855485)
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
-- TOC entry 182 (class 1259 OID 32854880)
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
-- TOC entry 181 (class 1259 OID 32854878)
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
-- TOC entry 227 (class 1259 OID 32855362)
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
-- TOC entry 230 (class 1259 OID 32855392)
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
-- TOC entry 251 (class 1259 OID 32855805)
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
-- TOC entry 203 (class 1259 OID 32855135)
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
-- TOC entry 205 (class 1259 OID 32855167)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32855172)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32855727)
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
-- TOC entry 194 (class 1259 OID 32855032)
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
-- TOC entry 238 (class 1259 OID 32855515)
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
-- TOC entry 223 (class 1259 OID 32855315)
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
-- TOC entry 200 (class 1259 OID 32855106)
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
-- TOC entry 197 (class 1259 OID 32855072)
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
-- TOC entry 195 (class 1259 OID 32855049)
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
-- TOC entry 212 (class 1259 OID 32855229)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32855785)
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
-- TOC entry 250 (class 1259 OID 32855798)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32855820)
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
-- TOC entry 170 (class 1259 OID 32822013)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 32855254)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32855006)
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
-- TOC entry 185 (class 1259 OID 32854906)
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
-- TOC entry 189 (class 1259 OID 32854973)
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
-- TOC entry 186 (class 1259 OID 32854917)
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
-- TOC entry 178 (class 1259 OID 32854852)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32854871)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32855261)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32855295)
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
-- TOC entry 233 (class 1259 OID 32855433)
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
-- TOC entry 188 (class 1259 OID 32854953)
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
-- TOC entry 191 (class 1259 OID 32854998)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32855671)
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
-- TOC entry 213 (class 1259 OID 32855235)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32854983)
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
-- TOC entry 202 (class 1259 OID 32855127)
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
-- TOC entry 198 (class 1259 OID 32855087)
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
-- TOC entry 199 (class 1259 OID 32855099)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32855247)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32855685)
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
-- TOC entry 242 (class 1259 OID 32855695)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32855584)
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
-- TOC entry 243 (class 1259 OID 32855703)
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
-- TOC entry 219 (class 1259 OID 32855276)
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
-- TOC entry 211 (class 1259 OID 32855220)
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
-- TOC entry 210 (class 1259 OID 32855210)
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
-- TOC entry 232 (class 1259 OID 32855422)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32855352)
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
-- TOC entry 196 (class 1259 OID 32855061)
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
-- TOC entry 175 (class 1259 OID 32854823)
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
-- TOC entry 174 (class 1259 OID 32854821)
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
-- TOC entry 220 (class 1259 OID 32855289)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32854861)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32854845)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32855303)
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
-- TOC entry 214 (class 1259 OID 32855241)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32855187)
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
-- TOC entry 173 (class 1259 OID 32854810)
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
-- TOC entry 172 (class 1259 OID 32854802)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32854797)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32855369)
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
-- TOC entry 187 (class 1259 OID 32854945)
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
-- TOC entry 209 (class 1259 OID 32855197)
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
-- TOC entry 231 (class 1259 OID 32855410)
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
-- TOC entry 184 (class 1259 OID 32854896)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32855715)
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
-- TOC entry 207 (class 1259 OID 32855177)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32855018)
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
-- TOC entry 176 (class 1259 OID 32854832)
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
-- TOC entry 235 (class 1259 OID 32855460)
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
-- TOC entry 201 (class 1259 OID 32855117)
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
-- TOC entry 218 (class 1259 OID 32855268)
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
-- TOC entry 229 (class 1259 OID 32855383)
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
-- TOC entry 247 (class 1259 OID 32855765)
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
-- TOC entry 246 (class 1259 OID 32855734)
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
-- TOC entry 248 (class 1259 OID 32855777)
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
-- TOC entry 225 (class 1259 OID 32855341)
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
-- TOC entry 204 (class 1259 OID 32855161)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32855450)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32855331)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32854883)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32854826)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32854887)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5677-b882-40ca-124b526aca9c	10	30	Otroci	Abonma za otroke	200
000a0000-5677-b882-c9b6-b79431be52ba	20	60	Mladina	Abonma za mladino	400
000a0000-5677-b882-3d9f-1c8288d2dafa	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32855502)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5677-b883-17ec-377c24ef3f15	000d0000-5677-b883-fc11-aa7fc2fff6fc	\N	00090000-5677-b883-d78e-7c99203ca372	000b0000-5677-b883-8e0b-b8c81e8d04b9	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5677-b883-0505-b4ac95023090	000d0000-5677-b883-8741-b4af315eab2d	00100000-5677-b883-0e15-8e6162835f35	00090000-5677-b883-5b55-59e69ea93662	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5677-b883-2937-d451731e6fe2	000d0000-5677-b883-eca6-5c8808007b38	00100000-5677-b883-5136-e61707f9a58c	00090000-5677-b883-7fb3-82ce54432497	\N	0003	t	\N	2015-12-21	\N	2	t	\N	f	f
000c0000-5677-b883-ab50-66d8dde31197	000d0000-5677-b883-2b4f-e219bfb00a78	\N	00090000-5677-b883-ef5f-0e420df0e9c8	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5677-b883-081f-902b118099da	000d0000-5677-b883-c755-e946f6afbba2	\N	00090000-5677-b883-fc5a-f370ac770645	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5677-b883-684c-1decaa22bca4	000d0000-5677-b883-ff8a-f55d267a7c3d	\N	00090000-5677-b883-0a7d-56f2c77d31b3	000b0000-5677-b883-8b52-6dc050e3cee7	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5677-b883-71ed-455e7267da24	000d0000-5677-b883-05f1-943391413f38	00100000-5677-b883-fa94-fb697b3e2bca	00090000-5677-b883-7723-a71bc46e474e	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5677-b883-9a99-6fb29fd439d9	000d0000-5677-b883-7870-a67adcd3cb3a	\N	00090000-5677-b883-2eb7-b8a55cdd20ed	000b0000-5677-b883-178f-bbc0366e29ab	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5677-b883-0257-6f8227f3bbe0	000d0000-5677-b883-05f1-943391413f38	00100000-5677-b883-a673-525ec5e00967	00090000-5677-b883-e231-64d816c4eb5b	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5677-b883-b3d6-1d1f2863b126	000d0000-5677-b883-05f1-943391413f38	00100000-5677-b883-77e3-d83c882426a9	00090000-5677-b883-f36f-578bfb5779ea	\N	0010	t	\N	2015-12-21	\N	16	f	\N	f	t
000c0000-5677-b883-ec9d-7d3c71248fe6	000d0000-5677-b883-05f1-943391413f38	00100000-5677-b883-9545-504d009240ba	00090000-5677-b883-51da-29c860e1521d	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5677-b883-b066-4efee3dc115d	000d0000-5677-b883-3175-2dd2425a1b00	00100000-5677-b883-0e15-8e6162835f35	00090000-5677-b883-5b55-59e69ea93662	000b0000-5677-b883-5dfa-d5353568a513	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32855485)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32854880)
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
-- TOC entry 3162 (class 0 OID 32855362)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5677-b883-2bf3-b7decc59cfad	00160000-5677-b882-6bec-5e4458a2dd4e	00090000-5677-b883-2e62-67c487d56e3c	aizv	10	t
003d0000-5677-b883-148f-30c0ab2a042d	00160000-5677-b882-6bec-5e4458a2dd4e	00090000-5677-b883-5a86-e270581a1038	apri	14	t
003d0000-5677-b883-58dd-b9ac2c74e3b5	00160000-5677-b882-7dc3-2476d147f371	00090000-5677-b883-c624-6fe9aa0f490f	aizv	11	t
003d0000-5677-b883-a8f3-ad9f20f91b88	00160000-5677-b882-4b17-6246cb8cb9ed	00090000-5677-b883-3343-a24d4108cdd1	aizv	12	t
003d0000-5677-b883-8cf3-582b94111c97	00160000-5677-b882-6bec-5e4458a2dd4e	00090000-5677-b883-fb4d-47cd8cbf58c6	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32855392)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5677-b882-6bec-5e4458a2dd4e	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5677-b882-7dc3-2476d147f371	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5677-b882-4b17-6246cb8cb9ed	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32855805)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32855135)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5677-b883-7de8-a29865b9fd3c	\N	\N	00200000-5677-b883-1956-092be55c1190	\N	\N	\N	00220000-5677-b882-0f93-1a658ccf502a	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5677-b883-9a8d-279201f91b03	\N	\N	00200000-5677-b883-4421-1acaf5eeb2f7	\N	\N	\N	00220000-5677-b882-0f93-1a658ccf502a	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5677-b883-1afa-da7c791473ce	\N	\N	00200000-5677-b883-0dde-bc79f2229de5	\N	\N	\N	00220000-5677-b882-8de8-bc075a816cb7	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5677-b883-b65f-7f2d9d448da9	\N	\N	00200000-5677-b883-79f2-8eda0eb044f2	\N	\N	\N	00220000-5677-b882-76bc-39e5f634a171	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5677-b883-7896-509f687768a1	\N	\N	00200000-5677-b883-fdff-7fc873805db3	\N	\N	\N	00220000-5677-b882-3cd8-f2eb172cdbc6	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32855167)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32855172)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32855727)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32855032)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5677-b880-cf1e-83ce1ec205f6	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5677-b880-32a8-5aa108c04610	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5677-b880-c778-d3b650fb5db0	AL	ALB	008	Albania 	Albanija	\N
00040000-5677-b880-02cd-aafc3a153154	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5677-b880-2037-96d55692f54b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5677-b880-1f65-3437cda9ecf4	AD	AND	020	Andorra 	Andora	\N
00040000-5677-b880-ab98-320bc1f10787	AO	AGO	024	Angola 	Angola	\N
00040000-5677-b880-d7c3-7788d77d7884	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5677-b880-4030-a8a2fc9b9480	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5677-b880-6ca6-a6261b5de288	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5677-b880-e1a4-05f9de0becbd	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5677-b880-29f3-c955b89a862b	AM	ARM	051	Armenia 	Armenija	\N
00040000-5677-b880-9504-a5ef77ed38d5	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5677-b880-8ced-2235b55fdba7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5677-b880-3746-09e76190c941	AT	AUT	040	Austria 	Avstrija	\N
00040000-5677-b880-eff9-89db6d20aaa0	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5677-b880-6742-ab2239d3e82f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5677-b880-cd00-c194ae134c77	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5677-b880-93e5-bd71efdb649c	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5677-b880-40bc-223aba1cc8f4	BB	BRB	052	Barbados 	Barbados	\N
00040000-5677-b880-ebea-7de4f0383eb5	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5677-b880-7d90-deb209c05adf	BE	BEL	056	Belgium 	Belgija	\N
00040000-5677-b880-53e6-9667ca491722	BZ	BLZ	084	Belize 	Belize	\N
00040000-5677-b880-d0fb-c18c8778a89f	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5677-b880-bb36-10d0d5bfafb7	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5677-b880-355c-de8aef1314eb	BT	BTN	064	Bhutan 	Butan	\N
00040000-5677-b880-ae5d-2f01be6b9f41	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5677-b880-66f9-0f5479d26030	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5677-b880-7c57-9e2fed04391d	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5677-b880-46bc-ebcf33dd2d98	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5677-b880-2634-ef6936c1bca9	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5677-b880-a050-218b0259f55c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5677-b880-b5ad-f5ea57711800	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5677-b880-9656-c9a9920b48c5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5677-b880-735e-b478019c518b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5677-b880-dbda-8c4414e68bd1	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5677-b880-88f2-41f2c8a0cf09	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5677-b880-671f-6b9f0fcca599	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5677-b880-b3e8-6c8069a4e411	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5677-b880-676f-a5a0bf9f0d4f	CA	CAN	124	Canada 	Kanada	\N
00040000-5677-b880-5fe0-2a55a6165402	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5677-b880-12c6-6b44885adc8d	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5677-b880-de5d-145a232f2718	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5677-b880-e577-e671e83384f1	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5677-b880-6c2d-db32c8021998	CL	CHL	152	Chile 	Čile	\N
00040000-5677-b880-71ee-9ccfdfa4435d	CN	CHN	156	China 	Kitajska	\N
00040000-5677-b880-492d-e01fe5cd7866	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5677-b880-5944-a173ec3b487d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5677-b880-7f3a-437961ee63a9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5677-b880-ff3b-b824d47dda1f	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5677-b880-3cfe-c9d2dec2c589	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5677-b880-2ff1-124e36fd7ddf	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5677-b880-e9f3-6c765cc4d557	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5677-b880-56c9-274e5c4b27f5	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5677-b880-2444-d308c05fd0ab	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5677-b880-4608-ed43624481a3	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5677-b880-bf60-bb19c150782f	CU	CUB	192	Cuba 	Kuba	\N
00040000-5677-b880-f4d6-1eace9f4dc8a	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5677-b880-5621-2650e2291b3a	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5677-b880-bd24-55a33053c8f8	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5677-b880-bf82-c6c1512d2d91	DK	DNK	208	Denmark 	Danska	\N
00040000-5677-b880-17f8-e896a82daafe	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5677-b880-748b-b2d74080f571	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5677-b880-d0b5-b637e9ccb499	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5677-b880-36b2-9abff88268e9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5677-b880-6192-c2b81a10842a	EG	EGY	818	Egypt 	Egipt	\N
00040000-5677-b880-97a6-f4ca08e8a0d7	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5677-b880-4e2f-9b684f118f50	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5677-b880-193c-4f8ce662db54	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5677-b880-6e92-9520981b7035	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5677-b880-7ee2-755d30c0848f	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5677-b880-acef-fe856cac5cd6	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5677-b880-e3dd-99f984c0042a	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5677-b880-e98f-cbe02ee60b24	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5677-b880-a60a-91542c66398b	FI	FIN	246	Finland 	Finska	\N
00040000-5677-b880-c25f-e38e2125448e	FR	FRA	250	France 	Francija	\N
00040000-5677-b880-8f93-e2b372a73750	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5677-b880-e7f3-48e0cf678978	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5677-b880-1662-5ea4e007c8ce	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5677-b880-a943-0a8b155e21c5	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5677-b880-16c0-b489ab56185d	GA	GAB	266	Gabon 	Gabon	\N
00040000-5677-b880-e595-1c84db7e2b2e	GM	GMB	270	Gambia 	Gambija	\N
00040000-5677-b880-39a1-e14a4b6c56f0	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5677-b880-2d94-ad63bf37eed6	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5677-b880-d5b1-cc457f5c03d8	GH	GHA	288	Ghana 	Gana	\N
00040000-5677-b880-f2e3-3ef130dc479a	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5677-b880-a694-46acd2fcf729	GR	GRC	300	Greece 	Grčija	\N
00040000-5677-b880-17bf-d7e08aa229b4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5677-b880-d47e-be88ff2644f0	GD	GRD	308	Grenada 	Grenada	\N
00040000-5677-b880-2d69-eb31e15a0429	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5677-b880-4a45-a1b06a97d4ac	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5677-b880-c3f1-3267614e225f	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5677-b880-9624-063cdf2839e8	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5677-b880-3f25-949df45d2507	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5677-b880-7ef3-b40ca23b945b	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5677-b880-fd8c-ba4567801cd8	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5677-b880-3cbe-b6c50c6d8c47	HT	HTI	332	Haiti 	Haiti	\N
00040000-5677-b880-111c-173ddc03c9bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5677-b880-5ce6-52c42103b25e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5677-b880-3137-88e294d3f1e8	HN	HND	340	Honduras 	Honduras	\N
00040000-5677-b880-c42d-8ffbaab10451	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5677-b880-7294-9794cf8c8457	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5677-b880-308f-cd0620d4820f	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5677-b880-b23a-c182f208dd59	IN	IND	356	India 	Indija	\N
00040000-5677-b880-4f51-be92591014a9	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5677-b880-19bc-5ae917e70f8a	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5677-b880-1ab7-76c582c72a20	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5677-b880-29ef-4bc5744b6a28	IE	IRL	372	Ireland 	Irska	\N
00040000-5677-b880-0a97-536316d930f7	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5677-b880-2225-656b30f8350f	IL	ISR	376	Israel 	Izrael	\N
00040000-5677-b880-1833-619d1efe75c1	IT	ITA	380	Italy 	Italija	\N
00040000-5677-b880-cb3f-4741bfee5b75	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5677-b880-c1f3-14ab57ae48d5	JP	JPN	392	Japan 	Japonska	\N
00040000-5677-b880-d905-671e9e646e07	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5677-b880-b34c-728a79a7289a	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5677-b880-2008-beb4462c43d2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5677-b880-7583-fa5c2462dfa2	KE	KEN	404	Kenya 	Kenija	\N
00040000-5677-b880-7fab-85aa503ecc17	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5677-b880-48b0-c8ce7b8cb0d3	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5677-b880-d30c-7a37466a9228	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5677-b880-5490-534581edbf5e	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5677-b880-184a-295fa0659abc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5677-b880-732f-4f7174fff044	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5677-b880-3ea0-685ba33f03b9	LV	LVA	428	Latvia 	Latvija	\N
00040000-5677-b880-5edd-0cb90326708b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5677-b880-46ee-a544ec13f607	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5677-b880-b373-73e101760cff	LR	LBR	430	Liberia 	Liberija	\N
00040000-5677-b880-3761-b7c618d077f0	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5677-b880-5302-efe8d52ae111	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5677-b880-aaaf-a27e98cc25c0	LT	LTU	440	Lithuania 	Litva	\N
00040000-5677-b880-a935-d5eb8e48a8d5	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5677-b880-570d-c6da65062ca4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5677-b880-9d55-2bf56f6dc112	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5677-b880-1ee8-3f4d5e826115	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5677-b880-42c9-4fc04a476bf3	MW	MWI	454	Malawi 	Malavi	\N
00040000-5677-b880-1250-f98982a0326a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5677-b880-cac8-4976ac32849a	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5677-b880-efd9-38b59c1b2b01	ML	MLI	466	Mali 	Mali	\N
00040000-5677-b880-5422-bc8b337585bb	MT	MLT	470	Malta 	Malta	\N
00040000-5677-b880-1db3-aa5a9c4d5593	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5677-b880-6560-8d7a1c305bc1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5677-b880-bcdb-f533b7acfa11	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5677-b880-5ca0-284e9cf948f2	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5677-b880-2277-25940aeae87a	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5677-b880-e532-d189ae8594c1	MX	MEX	484	Mexico 	Mehika	\N
00040000-5677-b880-20ce-305368ed875d	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5677-b880-ae68-fce3afe5280c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5677-b880-c1d2-d714e39cc7af	MC	MCO	492	Monaco 	Monako	\N
00040000-5677-b880-9f24-0110e1b99b4e	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5677-b880-1b33-7a30c92acd1a	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5677-b880-7722-6794eb279df5	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5677-b880-786f-10c5fa48624b	MA	MAR	504	Morocco 	Maroko	\N
00040000-5677-b880-6b18-57708ffdad52	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5677-b880-49fc-eebafb3a0105	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5677-b880-e0fb-07bf6695407b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5677-b880-1f0b-7e15355773ef	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5677-b880-2e23-cf3cbb085fe5	NP	NPL	524	Nepal 	Nepal	\N
00040000-5677-b880-1b9b-9c7d80c45c95	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5677-b880-999e-6caf812aa92a	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5677-b880-7868-843d433c7e13	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5677-b880-4fc7-c5825265d167	NE	NER	562	Niger 	Niger 	\N
00040000-5677-b880-7fc0-098b90615859	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5677-b880-83c9-fface51c5e8f	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5677-b880-8bbc-d06c22759780	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5677-b880-d38b-742d123ccefc	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5677-b880-d6bc-730fd5cec088	NO	NOR	578	Norway 	Norveška	\N
00040000-5677-b880-ade0-333aef49fc05	OM	OMN	512	Oman 	Oman	\N
00040000-5677-b880-a891-3a1326c22a7c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5677-b880-0c08-2ed952b87100	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5677-b880-7cc0-604ac148ae99	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5677-b880-51c3-0d22e0407a2c	PA	PAN	591	Panama 	Panama	\N
00040000-5677-b880-8c73-f8206879cf5c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5677-b880-8ae6-600331db05fd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5677-b880-0b16-f9a1aa4f475b	PE	PER	604	Peru 	Peru	\N
00040000-5677-b880-1933-f3d72d1279d3	PH	PHL	608	Philippines 	Filipini	\N
00040000-5677-b880-4012-f04918bddad8	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5677-b880-2283-5ab06ab3b934	PL	POL	616	Poland 	Poljska	\N
00040000-5677-b880-7391-8cb1116fb98c	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5677-b880-c871-6aef8cd1465f	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5677-b880-1645-21fff6f38b7e	QA	QAT	634	Qatar 	Katar	\N
00040000-5677-b880-6981-a18b38c5c0ab	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5677-b880-a726-24f80ce59872	RO	ROU	642	Romania 	Romunija	\N
00040000-5677-b880-539b-d9d378cc9a7c	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5677-b880-987d-b22b0d0383dd	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5677-b880-17b2-46d52fe8db09	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5677-b880-b0ad-85fdcd5cad99	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5677-b880-4863-2631d05f9e77	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5677-b880-c64a-024f250ce013	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5677-b880-5e96-8924f9cbc590	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5677-b880-6c45-dd7226bbe33b	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5677-b880-526d-9a4b5f42d5bb	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5677-b880-d6d9-c71eb07d83e1	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5677-b880-72a7-6cda8fb8558c	SM	SMR	674	San Marino 	San Marino	\N
00040000-5677-b880-6d61-083861c9c6a2	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5677-b880-0986-2ea0df96c1a0	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5677-b880-33ee-128ebfe6f06f	SN	SEN	686	Senegal 	Senegal	\N
00040000-5677-b880-722f-b24bb853eb69	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5677-b880-ecf6-7bdb2c34b560	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5677-b880-d223-73902c503163	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5677-b880-0f61-78d3e879c5a6	SG	SGP	702	Singapore 	Singapur	\N
00040000-5677-b880-4ef6-3256b9a7119c	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5677-b880-2270-89f14696d08e	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5677-b880-ec95-5d582dcc76e6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5677-b880-6190-ff77037b47c5	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5677-b880-efc2-55d1cb5edee6	SO	SOM	706	Somalia 	Somalija	\N
00040000-5677-b880-0d81-dc07d2308d65	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5677-b880-f013-1f492796d082	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5677-b880-32e0-8e8f43b822de	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5677-b880-3456-7a1ba884b0b7	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5677-b880-b896-8b1b2125518e	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5677-b880-1fe9-e74ea7d0ff0f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5677-b880-c819-b8cebaff6145	SR	SUR	740	Suriname 	Surinam	\N
00040000-5677-b880-4cc3-a5abf25dd92d	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5677-b880-0a3a-967e5c580f4d	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5677-b880-d462-590e5d730644	SE	SWE	752	Sweden 	Švedska	\N
00040000-5677-b880-09a0-52c05b054583	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5677-b880-90ca-43a5638666af	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5677-b880-43de-07ed03a85e0e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5677-b880-5b98-5195fa172a54	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5677-b880-a415-eb773c0b5591	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5677-b880-9829-e7becf4ecbc5	TH	THA	764	Thailand 	Tajska	\N
00040000-5677-b880-3842-4b4eb0062d2a	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5677-b880-1277-80a1c5be254f	TG	TGO	768	Togo 	Togo	\N
00040000-5677-b880-fed1-651bae51cff0	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5677-b880-421a-0a093fcdbcb4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5677-b880-394a-295d175e08fb	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5677-b880-e640-62b2a9a02191	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5677-b880-45a2-9991d607d0e3	TR	TUR	792	Turkey 	Turčija	\N
00040000-5677-b880-5f31-690697d36e5a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5677-b880-8a80-1f399eb2bf40	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5677-b880-e061-d5831a28d07e	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5677-b880-2512-86c3f9696781	UG	UGA	800	Uganda 	Uganda	\N
00040000-5677-b880-3f62-5142a187b95a	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5677-b880-6f45-870270fd392c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5677-b880-1308-f47c03067ae7	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5677-b880-2ab4-a99fafa24ae6	US	USA	840	United States 	Združene države Amerike	\N
00040000-5677-b880-04d6-79c5cfb7776b	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5677-b880-1ee0-9182cc3ad678	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5677-b880-8db3-4a9831185a86	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5677-b880-2022-94548293fb7b	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5677-b880-485b-1e35a7e59a4d	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5677-b880-cd5c-ba89f06c7a4a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5677-b880-6d6c-2b8712cd7e4e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5677-b880-0fdc-d208a433003d	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5677-b880-48be-5a271f11da52	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5677-b880-a330-fbe0c973aad0	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5677-b880-7f34-49064b5eed5d	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5677-b880-25a5-722759e379a1	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5677-b880-5a63-c2e4c80686a6	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32855515)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5677-b883-6d71-eeec88a7b754	000e0000-5677-b883-9e44-227cdce81ebb	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5677-b880-42b8-51333c9fc0cd	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5677-b883-28f5-ee98b98f4f13	000e0000-5677-b883-ffad-0a2c03c7b8bb	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5677-b880-0e47-c497164f739c	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5677-b883-c4c0-4ffbdb4b15d2	000e0000-5677-b883-2efd-ba508766c47d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5677-b880-42b8-51333c9fc0cd	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5677-b883-b776-b62938b632da	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5677-b883-2d08-3dc036d38bef	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32855315)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5677-b883-fc11-aa7fc2fff6fc	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-17ec-377c24ef3f15	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5677-b880-1840-494de3fe9c47
000d0000-5677-b883-8741-b4af315eab2d	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-0505-b4ac95023090	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5677-b880-3beb-70291523a4c0
000d0000-5677-b883-eca6-5c8808007b38	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-2937-d451731e6fe2	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5677-b880-a37d-4f441e4f5297
000d0000-5677-b883-2b4f-e219bfb00a78	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-ab50-66d8dde31197	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5677-b880-8a05-b54ef4820be5
000d0000-5677-b883-c755-e946f6afbba2	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-081f-902b118099da	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5677-b880-8a05-b54ef4820be5
000d0000-5677-b883-ff8a-f55d267a7c3d	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-684c-1decaa22bca4	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5677-b880-1840-494de3fe9c47
000d0000-5677-b883-05f1-943391413f38	000e0000-5677-b883-ffad-0a2c03c7b8bb	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5677-b880-1840-494de3fe9c47
000d0000-5677-b883-7870-a67adcd3cb3a	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-9a99-6fb29fd439d9	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5677-b880-0266-6f3b52cf0673
000d0000-5677-b883-3175-2dd2425a1b00	000e0000-5677-b883-ffad-0a2c03c7b8bb	000c0000-5677-b883-b066-4efee3dc115d	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5677-b880-c849-a580a68e5f99
\.


--
-- TOC entry 3135 (class 0 OID 32855106)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32855072)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32855049)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5677-b883-2d8c-10d4a37fd2d6	00080000-5677-b883-624e-07707265a449	00090000-5677-b883-f36f-578bfb5779ea	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32855229)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32855785)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5677-b883-9568-99df4bce83a7	00010000-5677-b881-ce0f-d841752054d1	\N	Prva mapa	Root mapa	2015-12-21 09:29:55	2015-12-21 09:29:55	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32855798)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32855820)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3105 (class 0 OID 32822013)
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
\.


--
-- TOC entry 3151 (class 0 OID 32855254)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32855006)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5677-b881-5b64-e23425b4e966	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5677-b881-e9fc-8fae13e5abc0	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5677-b881-aca2-8646d94d1cae	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5677-b881-f13b-973425a72547	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5677-b881-c6e5-c3c85835d823	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5677-b881-b677-d63275009463	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5677-b881-149c-ef7de5e44e1a	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5677-b881-37cc-6e07fc800563	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5677-b881-0905-f5d06337155e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5677-b881-32d5-873c3a4c75c2	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5677-b881-8952-fd412c7f5117	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5677-b881-05e9-f9f284ed630d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5677-b881-3558-c64be5bb8c1d	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5677-b881-b555-c5e3cfec75e3	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5677-b882-c649-bcf726b3ad41	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5677-b882-aedc-ecbbc99014c7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5677-b882-bddd-2b13990ab637	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5677-b882-6dfe-cb2310c2998a	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5677-b882-f22e-8f6ef1012d6b	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5677-b884-93a5-be7030e41936	application.tenant.maticnopodjetje	string	s:36:"00080000-5677-b884-dc07-c32faa40631d";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32854906)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5677-b882-dd27-8e5a07cc2b40	00000000-5677-b882-c649-bcf726b3ad41	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5677-b882-0fd1-4e66cf6772e3	00000000-5677-b882-c649-bcf726b3ad41	00010000-5677-b881-ce0f-d841752054d1	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5677-b882-84fd-ed3595d0b81a	00000000-5677-b882-aedc-ecbbc99014c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32854973)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5677-b883-2795-036bf518f22b	\N	00100000-5677-b883-0e15-8e6162835f35	00100000-5677-b883-5136-e61707f9a58c	01	Gledališče Nimbis
00410000-5677-b883-723f-8cf57860e0f0	00410000-5677-b883-2795-036bf518f22b	00100000-5677-b883-0e15-8e6162835f35	00100000-5677-b883-5136-e61707f9a58c	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32854917)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5677-b883-d78e-7c99203ca372	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5677-b883-ef5f-0e420df0e9c8	00010000-5677-b882-974c-7770fbd68683	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5677-b883-7fb3-82ce54432497	00010000-5677-b882-8491-8838d4a34301	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5677-b883-e231-64d816c4eb5b	00010000-5677-b883-39ed-11752a7111d4	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5677-b883-eeba-2c68906fca7e	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5677-b883-0a7d-56f2c77d31b3	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5677-b883-51da-29c860e1521d	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5677-b883-7723-a71bc46e474e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5677-b883-f36f-578bfb5779ea	00010000-5677-b883-87c9-556d0d73c095	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5677-b883-5b55-59e69ea93662	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5677-b883-c84d-c49f817e9554	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5677-b883-fc5a-f370ac770645	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5677-b883-2eb7-b8a55cdd20ed	00010000-5677-b883-7f7d-39d236c64651	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5677-b883-2e62-67c487d56e3c	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5677-b883-5a86-e270581a1038	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5677-b883-c624-6fe9aa0f490f	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5677-b883-3343-a24d4108cdd1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5677-b883-fb4d-47cd8cbf58c6	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5677-b883-5b30-9b45a5911ec8	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5677-b883-c5ea-162641954d35	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5677-b883-5f92-afd636ec8975	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32854852)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5677-b880-6629-f322128cf46d	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5677-b880-816a-123c729e4438	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5677-b880-d50e-2220428d363b	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5677-b880-331d-a5b92ba8a3c0	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5677-b880-4eb4-b272c89970fb	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5677-b880-9168-fb347d0b6da4	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5677-b880-7d04-0c80429fa3a2	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5677-b880-a8c3-e8b306a82017	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5677-b880-47ee-c6c4c65eb228	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5677-b880-74d2-64bea3e8c2de	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5677-b880-6913-98aa571a257a	Abonma-read	Abonma - branje	t
00030000-5677-b880-5b8f-f22d672ac9b5	Abonma-write	Abonma - spreminjanje	t
00030000-5677-b880-2c2e-f3b84e7f8179	Alternacija-read	Alternacija - branje	t
00030000-5677-b880-24be-0be72d3b09c1	Alternacija-write	Alternacija - spreminjanje	t
00030000-5677-b880-72ec-ab8fb8101977	Arhivalija-read	Arhivalija - branje	t
00030000-5677-b880-b8c1-e4074cfcb54c	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5677-b880-ece4-ca3ddf8160e1	AuthStorage-read	AuthStorage - branje	t
00030000-5677-b880-741b-131b00c09aa1	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5677-b880-f429-7a0eb82a7a5e	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5677-b880-f2d4-bf21f244aa35	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5677-b880-e09a-3678b0f2acb7	Besedilo-read	Besedilo - branje	t
00030000-5677-b880-3332-e44e8d81c476	Besedilo-write	Besedilo - spreminjanje	t
00030000-5677-b880-7232-3aa6daa1ecc5	Dogodek-read	Dogodek - branje	t
00030000-5677-b880-5634-9a25c3a62169	Dogodek-write	Dogodek - spreminjanje	t
00030000-5677-b880-e82b-c0a80b8d010e	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5677-b880-f234-46dff6a8ac25	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5677-b880-9a2e-f675955d275d	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5677-b880-e49d-25482c57181e	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5677-b880-9628-83cd25ce503d	DogodekTrait-read	DogodekTrait - branje	t
00030000-5677-b880-8214-3a0b7489adc7	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5677-b880-746a-6618a7e5729a	DrugiVir-read	DrugiVir - branje	t
00030000-5677-b880-94f2-8b26ea90face	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5677-b880-954c-30734e177b57	Drzava-read	Drzava - branje	t
00030000-5677-b880-1af7-b208f6ce4d50	Drzava-write	Drzava - spreminjanje	t
00030000-5677-b880-16f0-d25f879872d5	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5677-b880-3d4b-d818ba877db4	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5677-b880-e960-82deae8de185	Funkcija-read	Funkcija - branje	t
00030000-5677-b880-db9e-f7c6a30a9ea9	Funkcija-write	Funkcija - spreminjanje	t
00030000-5677-b880-cc71-7cd76e2dfdda	Gostovanje-read	Gostovanje - branje	t
00030000-5677-b880-a371-34420d33f495	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5677-b880-0b74-2aecfe62faf2	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5677-b880-d48b-57a17ace9716	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5677-b880-62e4-2f40381e8ae4	Kupec-read	Kupec - branje	t
00030000-5677-b880-cf55-478ca141a3c1	Kupec-write	Kupec - spreminjanje	t
00030000-5677-b880-a8ba-7e48d48539ad	NacinPlacina-read	NacinPlacina - branje	t
00030000-5677-b880-108e-2e8c39e4d834	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5677-b880-75c1-cef92f98ebb2	Option-read	Option - branje	t
00030000-5677-b880-32e4-765ca0fa2533	Option-write	Option - spreminjanje	t
00030000-5677-b880-9a41-fbe9d99096b1	OptionValue-read	OptionValue - branje	t
00030000-5677-b880-a980-a7baf5dae6ea	OptionValue-write	OptionValue - spreminjanje	t
00030000-5677-b880-964f-f880bfd0ee3e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5677-b880-c027-3eaee896a70b	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5677-b880-1ab9-2816403bdce1	Oseba-read	Oseba - branje	t
00030000-5677-b880-e9f2-b7d54ff7f9e9	Oseba-write	Oseba - spreminjanje	t
00030000-5677-b880-c395-72b0e68a565a	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5677-b880-6fc5-2b91b004b3d4	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5677-b880-f079-76873d2fd1cb	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5677-b880-b0d6-29f706ec39e3	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5677-b880-7ca4-96687635ded4	Pogodba-read	Pogodba - branje	t
00030000-5677-b880-d750-ad7cc574c268	Pogodba-write	Pogodba - spreminjanje	t
00030000-5677-b880-85af-4d97b74fa6f8	Popa-read	Popa - branje	t
00030000-5677-b880-ab56-f3238ffe2f5c	Popa-write	Popa - spreminjanje	t
00030000-5677-b880-e469-81f2e9e138fa	Posta-read	Posta - branje	t
00030000-5677-b880-e10a-d54ac59a4cc5	Posta-write	Posta - spreminjanje	t
00030000-5677-b880-d2b1-91fc124148ba	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5677-b880-8cf0-e0e7a663fef5	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5677-b880-29c0-36c51796dc51	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5677-b880-de91-933521f77f48	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5677-b880-4962-f2de22f7c550	PostniNaslov-read	PostniNaslov - branje	t
00030000-5677-b880-611d-6497d7d4d371	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5677-b880-c134-556b75d76575	Praznik-read	Praznik - branje	t
00030000-5677-b880-beff-61940fd31d38	Praznik-write	Praznik - spreminjanje	t
00030000-5677-b880-29c7-726acd404ef1	Predstava-read	Predstava - branje	t
00030000-5677-b880-ac52-e8f02cffc4f3	Predstava-write	Predstava - spreminjanje	t
00030000-5677-b880-267e-8246d589efe8	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5677-b880-773a-44d29162e9ae	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5677-b880-a22d-4f922977128f	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5677-b880-aa8e-caf6b1a94102	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5677-b880-1cdc-68c029060c56	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5677-b880-e925-ecbc8d7636f3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5677-b880-5b63-69d4df3ef680	ProgramDela-read	ProgramDela - branje	t
00030000-5677-b880-1f50-91bc831dfe0c	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5677-b880-7565-640801253d14	ProgramFestival-read	ProgramFestival - branje	t
00030000-5677-b880-15f4-fdfc714be2fa	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5677-b880-cec4-e34804324aa7	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5677-b880-7721-f0c0f00f06a4	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5677-b880-9016-043d3eafa094	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5677-b880-28cc-ca1b807e663b	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5677-b880-f226-8c9031768c23	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5677-b880-66d3-c75dd263db88	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5677-b880-2416-c6da8fb2b556	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5677-b880-0e5c-afa22cce6003	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5677-b880-f9a2-fc45d63a0ac8	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5677-b880-59bb-a2fc90cd72e7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5677-b880-49d4-4d92020586ac	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5677-b880-ff39-6aadb139e4fa	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5677-b880-a2e9-466f36186626	ProgramRazno-read	ProgramRazno - branje	t
00030000-5677-b880-a6cf-e25f3411a014	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5677-b880-356d-2d28442216b7	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5677-b880-95f7-ad0dab409532	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5677-b880-b97a-8b02961f65d5	Prostor-read	Prostor - branje	t
00030000-5677-b880-ab94-7bec633416a9	Prostor-write	Prostor - spreminjanje	t
00030000-5677-b880-45fb-a203cdbf5662	Racun-read	Racun - branje	t
00030000-5677-b880-6daa-098bf7179632	Racun-write	Racun - spreminjanje	t
00030000-5677-b880-9d54-bacb8affa39d	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5677-b880-bfa1-df22127c8660	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5677-b880-c5db-0efa13f7c53f	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5677-b880-4595-a595dac3ebb9	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5677-b880-f83a-9ce5de25c590	Rekvizit-read	Rekvizit - branje	t
00030000-5677-b880-0080-eaaf1832cc3f	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5677-b880-1d2a-6b1d39f8f9c3	Revizija-read	Revizija - branje	t
00030000-5677-b880-9989-ac9594576463	Revizija-write	Revizija - spreminjanje	t
00030000-5677-b880-b6f4-a7153702f58b	Rezervacija-read	Rezervacija - branje	t
00030000-5677-b880-0a1f-374276bea865	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5677-b880-c2b6-696b8f1a326d	SedezniRed-read	SedezniRed - branje	t
00030000-5677-b880-543f-fc0399a2aea0	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5677-b880-5916-564373433094	Sedez-read	Sedez - branje	t
00030000-5677-b880-7f9e-6d98480eb6ca	Sedez-write	Sedez - spreminjanje	t
00030000-5677-b880-82be-36fb261bbd86	Sezona-read	Sezona - branje	t
00030000-5677-b880-3d19-5324da8e4c61	Sezona-write	Sezona - spreminjanje	t
00030000-5677-b880-d4c8-a28433bf812d	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5677-b880-f39e-292620818e08	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5677-b880-a7d8-aa35fa7e9e3e	Telefonska-read	Telefonska - branje	t
00030000-5677-b880-284b-afc20cc34903	Telefonska-write	Telefonska - spreminjanje	t
00030000-5677-b880-c4e7-881476a2cc3f	TerminStoritve-read	TerminStoritve - branje	t
00030000-5677-b880-c30d-ac4d365ff83d	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5677-b880-f616-4596d1cdf738	TipFunkcije-read	TipFunkcije - branje	t
00030000-5677-b880-0c22-12b3e7a5a60f	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5677-b880-0b46-351f28be1dd5	TipPopa-read	TipPopa - branje	t
00030000-5677-b880-f23f-db756486cddd	TipPopa-write	TipPopa - spreminjanje	t
00030000-5677-b880-8f25-c68514d74801	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5677-b880-8dba-2e03d788a50c	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5677-b880-fdca-19aba66d2395	TipVaje-read	TipVaje - branje	t
00030000-5677-b880-39b7-04d089255211	TipVaje-write	TipVaje - spreminjanje	t
00030000-5677-b880-63d9-791b2d50b24a	Trr-read	Trr - branje	t
00030000-5677-b880-21f3-a9a6447ea97c	Trr-write	Trr - spreminjanje	t
00030000-5677-b880-ab70-d672dfea20f9	Uprizoritev-read	Uprizoritev - branje	t
00030000-5677-b880-fa6c-ed5d733f7be5	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5677-b880-627a-cbd840d18787	Vaja-read	Vaja - branje	t
00030000-5677-b880-b95d-fce3d68f752b	Vaja-write	Vaja - spreminjanje	t
00030000-5677-b880-82c7-e83f4e172096	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5677-b880-e4dc-38ec5ff435bb	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5677-b880-94cf-b6eff6a0a97d	VrstaStroska-read	VrstaStroska - branje	t
00030000-5677-b880-5b53-bb58a2432458	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5677-b880-daea-10e3541ebc9b	Zaposlitev-read	Zaposlitev - branje	t
00030000-5677-b880-a67e-e39d510d49de	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5677-b880-2dcb-93091ff8e354	Zasedenost-read	Zasedenost - branje	t
00030000-5677-b880-a152-0f3b503c5eb5	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5677-b880-fdb7-2c7ccb280618	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5677-b880-5737-5837bbf33900	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5677-b880-3f14-959e8e4e799a	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5677-b880-6b36-35ef86cd4cc4	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5677-b880-c2d4-f52b81b0ee6a	Job-read	Branje opravil - samo zase - branje	t
00030000-5677-b880-cd8b-40313377a0ec	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5677-b880-ce32-3f71d691b510	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5677-b880-4477-361e65c89ecb	Report-read	Report - branje	t
00030000-5677-b880-1a40-70b5b8f8c98f	Report-write	Report - spreminjanje	t
00030000-5677-b880-4ad6-8cde88315f64	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5677-b880-5e07-cae353fc7d6b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5677-b880-480f-ad4e8fd63fc0	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5677-b880-82ec-70ec156c0eaa	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5677-b880-81c2-b16735d81ba7	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5677-b880-47be-71f98c9b553c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5677-b880-2060-4512ff937a03	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5677-b880-8504-7e9426e16bea	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5677-b880-d1b1-9f9a7f29e2dc	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5677-b880-efa4-5197b0382ea1	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5677-b880-b23c-0d4e9490ae71	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5677-b880-9568-9ee732862686	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5677-b880-0358-6342c5a81be2	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5677-b880-8f95-da8705850478	Datoteka-write	Datoteka - spreminjanje	t
00030000-5677-b880-b5f9-be90b71fd654	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32854871)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5677-b880-558e-57f01158f43a	00030000-5677-b880-816a-123c729e4438
00020000-5677-b880-558e-57f01158f43a	00030000-5677-b880-6629-f322128cf46d
00020000-5677-b880-874b-71ae49d0ef06	00030000-5677-b880-954c-30734e177b57
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-8f95-da8705850478
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b880-d029-6c2423180960	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b880-8635-f4fac6a46fea	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b880-8635-f4fac6a46fea	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b880-8635-f4fac6a46fea	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b880-8635-f4fac6a46fea	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b880-8635-f4fac6a46fea	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b880-8635-f4fac6a46fea	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-a67e-e39d510d49de
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b880-e102-838ad54ed858	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b880-1d93-6385c5662025	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b880-1d93-6385c5662025	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b880-1d93-6385c5662025	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-8f95-da8705850478
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b880-2528-e38666b99bad	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-3dea-c9b4485d0549	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-3dea-c9b4485d0549	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-3dea-c9b4485d0549	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-3dea-c9b4485d0549	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-bfb3-624ad0e10254	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-797c-6f05d6786a22	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-ab56-f3238ffe2f5c
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-d48b-57a17ace9716
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-e925-ecbc8d7636f3
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-dfb7-27295a521d94	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-ce44-2252b86fa2f7	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-2fdc-f6a2adb1bf70	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-2fdc-f6a2adb1bf70	00030000-5677-b880-f23f-db756486cddd
00020000-5677-b881-691b-bc264731489d	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-3833-e77abd4dde26	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-3833-e77abd4dde26	00030000-5677-b880-e10a-d54ac59a4cc5
00020000-5677-b881-e32a-a09dbf737ad8	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-3fc3-02150bc1f124	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-3fc3-02150bc1f124	00030000-5677-b880-1af7-b208f6ce4d50
00020000-5677-b881-1df4-4e92a7073417	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-7ef9-8d625045f98e	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-7ef9-8d625045f98e	00030000-5677-b880-6b36-35ef86cd4cc4
00020000-5677-b881-22f4-33bba25c3ba5	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-22eb-4547d79efccc	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-22eb-4547d79efccc	00030000-5677-b880-5737-5837bbf33900
00020000-5677-b881-978c-27471ef12d52	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-9d99-4f2db58ca1be	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-9d99-4f2db58ca1be	00030000-5677-b880-5b8f-f22d672ac9b5
00020000-5677-b881-1a83-601e005b8efc	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-a505-5fd753dd267c	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-a505-5fd753dd267c	00030000-5677-b880-ab94-7bec633416a9
00020000-5677-b881-a505-5fd753dd267c	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-a505-5fd753dd267c	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-a505-5fd753dd267c	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b881-a505-5fd753dd267c	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-d26a-474d42ca9cd1	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-d26a-474d42ca9cd1	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-d26a-474d42ca9cd1	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-6107-5043b4784ada	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-6107-5043b4784ada	00030000-5677-b880-5b53-bb58a2432458
00020000-5677-b881-43ff-79666602955d	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-c027-3eaee896a70b
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-b554-3895c6d95f86	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-b027-efd4764422b4	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-b027-efd4764422b4	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-b027-efd4764422b4	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-b027-efd4764422b4	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-b027-efd4764422b4	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-808f-00572fea7014	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-808f-00572fea7014	00030000-5677-b880-39b7-04d089255211
00020000-5677-b881-cb9f-5f69626b6530	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-7d04-0c80429fa3a2
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-a8c3-e8b306a82017
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-5b63-69d4df3ef680
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-1f50-91bc831dfe0c
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-7565-640801253d14
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-15f4-fdfc714be2fa
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-cec4-e34804324aa7
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-7721-f0c0f00f06a4
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-9016-043d3eafa094
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-28cc-ca1b807e663b
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-f226-8c9031768c23
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-66d3-c75dd263db88
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-2416-c6da8fb2b556
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-0e5c-afa22cce6003
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-f9a2-fc45d63a0ac8
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-59bb-a2fc90cd72e7
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-49d4-4d92020586ac
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-ff39-6aadb139e4fa
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-a2e9-466f36186626
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-a6cf-e25f3411a014
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-356d-2d28442216b7
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-95f7-ad0dab409532
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-aa8e-caf6b1a94102
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-94f2-8b26ea90face
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-8cf0-e0e7a663fef5
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-cd8b-40313377a0ec
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-746a-6618a7e5729a
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-a22d-4f922977128f
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-d2b1-91fc124148ba
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-c2d4-f52b81b0ee6a
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-5f7d-6870bc263517	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-5b63-69d4df3ef680
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-7565-640801253d14
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-cec4-e34804324aa7
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-9016-043d3eafa094
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-f226-8c9031768c23
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-2416-c6da8fb2b556
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-f9a2-fc45d63a0ac8
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-49d4-4d92020586ac
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-a2e9-466f36186626
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-356d-2d28442216b7
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-a22d-4f922977128f
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-746a-6618a7e5729a
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-d2b1-91fc124148ba
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-c2d4-f52b81b0ee6a
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-8dea-31fefef45c4a	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-74d2-64bea3e8c2de
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-0d5d-0492bf094683	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-5163-45fd2b773f2c	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-8459-d17787e99019	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-d750-ad7cc574c268
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-f39e-292620818e08
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-eda7-cb6d01eb003d	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-9098-53de9f57690e	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-913f-de97ea952a0e	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-106b-ab82d562c44c	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-106b-ab82d562c44c	00030000-5677-b880-f39e-292620818e08
00020000-5677-b881-106b-ab82d562c44c	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-106b-ab82d562c44c	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-06ee-38e6b8fa377d	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-06ee-38e6b8fa377d	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-746a-6618a7e5729a
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-94f2-8b26ea90face
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-74d2-64bea3e8c2de
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-c2d4-f52b81b0ee6a
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-cd8b-40313377a0ec
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-d750-ad7cc574c268
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-d2b1-91fc124148ba
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-8cf0-e0e7a663fef5
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-a22d-4f922977128f
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-aa8e-caf6b1a94102
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-7d04-0c80429fa3a2
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-5b63-69d4df3ef680
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-a8c3-e8b306a82017
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-1f50-91bc831dfe0c
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-7565-640801253d14
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-15f4-fdfc714be2fa
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-cec4-e34804324aa7
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-7721-f0c0f00f06a4
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-9016-043d3eafa094
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-28cc-ca1b807e663b
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-f226-8c9031768c23
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-66d3-c75dd263db88
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-2416-c6da8fb2b556
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-0e5c-afa22cce6003
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-f9a2-fc45d63a0ac8
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-59bb-a2fc90cd72e7
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-49d4-4d92020586ac
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-ff39-6aadb139e4fa
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-a2e9-466f36186626
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-a6cf-e25f3411a014
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-356d-2d28442216b7
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-95f7-ad0dab409532
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-f39e-292620818e08
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-9d5c-4312ba6b4537	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-400e-9a6e63e81518	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-74d2-64bea3e8c2de
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-17e4-0c6e1e76695a	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-746a-6618a7e5729a
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-94f2-8b26ea90face
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-74d2-64bea3e8c2de
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-c2d4-f52b81b0ee6a
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-cd8b-40313377a0ec
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-d48b-57a17ace9716
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-d750-ad7cc574c268
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-ab56-f3238ffe2f5c
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-d2b1-91fc124148ba
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-8cf0-e0e7a663fef5
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-a22d-4f922977128f
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-aa8e-caf6b1a94102
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-e925-ecbc8d7636f3
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-7d04-0c80429fa3a2
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-5b63-69d4df3ef680
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-a8c3-e8b306a82017
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-1f50-91bc831dfe0c
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-7565-640801253d14
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-15f4-fdfc714be2fa
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-cec4-e34804324aa7
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-7721-f0c0f00f06a4
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-9016-043d3eafa094
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-28cc-ca1b807e663b
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-f226-8c9031768c23
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-66d3-c75dd263db88
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-2416-c6da8fb2b556
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-0e5c-afa22cce6003
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-f9a2-fc45d63a0ac8
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-59bb-a2fc90cd72e7
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-49d4-4d92020586ac
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-ff39-6aadb139e4fa
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-a2e9-466f36186626
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-a6cf-e25f3411a014
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-356d-2d28442216b7
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-95f7-ad0dab409532
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-f39e-292620818e08
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-a67e-e39d510d49de
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-dbe6-de6bf505c024	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-74d2-64bea3e8c2de
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-d48b-57a17ace9716
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-ab56-f3238ffe2f5c
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-e925-ecbc8d7636f3
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-a67e-e39d510d49de
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-f192-48de0d51e897	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-ba47-bb8ffffc8372	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-8f95-da8705850478
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-746a-6618a7e5729a
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-94f2-8b26ea90face
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-954c-30734e177b57
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-e960-82deae8de185
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-c2d4-f52b81b0ee6a
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-cd8b-40313377a0ec
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-d48b-57a17ace9716
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-c027-3eaee896a70b
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-d750-ad7cc574c268
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-ab56-f3238ffe2f5c
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-d2b1-91fc124148ba
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-8cf0-e0e7a663fef5
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-a22d-4f922977128f
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-aa8e-caf6b1a94102
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-e925-ecbc8d7636f3
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-7d04-0c80429fa3a2
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-5b63-69d4df3ef680
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-a8c3-e8b306a82017
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-1f50-91bc831dfe0c
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-7565-640801253d14
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-15f4-fdfc714be2fa
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-cec4-e34804324aa7
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-7721-f0c0f00f06a4
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-9016-043d3eafa094
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-28cc-ca1b807e663b
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-f226-8c9031768c23
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-66d3-c75dd263db88
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-2416-c6da8fb2b556
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-0e5c-afa22cce6003
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-f9a2-fc45d63a0ac8
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-59bb-a2fc90cd72e7
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-49d4-4d92020586ac
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-ff39-6aadb139e4fa
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-a2e9-466f36186626
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-a6cf-e25f3411a014
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-356d-2d28442216b7
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-95f7-ad0dab409532
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-f39e-292620818e08
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-5b53-bb58a2432458
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-a67e-e39d510d49de
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b881-c356-1c27d9f4a489	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-6629-f322128cf46d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-816a-123c729e4438
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-6913-98aa571a257a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5b8f-f22d672ac9b5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-72ec-ab8fb8101977
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b8c1-e4074cfcb54c
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ece4-ca3ddf8160e1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-741b-131b00c09aa1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f429-7a0eb82a7a5e
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f2d4-bf21f244aa35
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e09a-3678b0f2acb7
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-3332-e44e8d81c476
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-8f95-da8705850478
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-7232-3aa6daa1ecc5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-331d-a5b92ba8a3c0
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e82b-c0a80b8d010e
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f234-46dff6a8ac25
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9a2e-f675955d275d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e49d-25482c57181e
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9628-83cd25ce503d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-8214-3a0b7489adc7
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5634-9a25c3a62169
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-746a-6618a7e5729a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-94f2-8b26ea90face
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-954c-30734e177b57
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-1af7-b208f6ce4d50
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-16f0-d25f879872d5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-3d4b-d818ba877db4
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e960-82deae8de185
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-74d2-64bea3e8c2de
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-cc71-7cd76e2dfdda
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a371-34420d33f495
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ce32-3f71d691b510
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c2d4-f52b81b0ee6a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-cd8b-40313377a0ec
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0b74-2aecfe62faf2
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-d48b-57a17ace9716
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-62e4-2f40381e8ae4
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-cf55-478ca141a3c1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-2060-4512ff937a03
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-47be-71f98c9b553c
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5e07-cae353fc7d6b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-480f-ad4e8fd63fc0
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-82ec-70ec156c0eaa
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-81c2-b16735d81ba7
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a8ba-7e48d48539ad
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-108e-2e8c39e4d834
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-75c1-cef92f98ebb2
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9a41-fbe9d99096b1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a980-a7baf5dae6ea
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-32e4-765ca0fa2533
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-964f-f880bfd0ee3e
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c027-3eaee896a70b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c395-72b0e68a565a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-6fc5-2b91b004b3d4
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f079-76873d2fd1cb
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b0d6-29f706ec39e3
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-d750-ad7cc574c268
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ab56-f3238ffe2f5c
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e469-81f2e9e138fa
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-d2b1-91fc124148ba
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-8cf0-e0e7a663fef5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-29c0-36c51796dc51
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-de91-933521f77f48
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e10a-d54ac59a4cc5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c134-556b75d76575
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-beff-61940fd31d38
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-29c7-726acd404ef1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ac52-e8f02cffc4f3
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-267e-8246d589efe8
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-773a-44d29162e9ae
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a22d-4f922977128f
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-aa8e-caf6b1a94102
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-1cdc-68c029060c56
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e925-ecbc8d7636f3
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-7d04-0c80429fa3a2
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5b63-69d4df3ef680
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a8c3-e8b306a82017
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-1f50-91bc831dfe0c
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-7565-640801253d14
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-15f4-fdfc714be2fa
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-cec4-e34804324aa7
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-7721-f0c0f00f06a4
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9016-043d3eafa094
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-28cc-ca1b807e663b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f226-8c9031768c23
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-66d3-c75dd263db88
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-2416-c6da8fb2b556
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0e5c-afa22cce6003
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f9a2-fc45d63a0ac8
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-59bb-a2fc90cd72e7
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-49d4-4d92020586ac
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ff39-6aadb139e4fa
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a2e9-466f36186626
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a6cf-e25f3411a014
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-356d-2d28442216b7
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-95f7-ad0dab409532
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b97a-8b02961f65d5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ab94-7bec633416a9
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-45fb-a203cdbf5662
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-6daa-098bf7179632
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9d54-bacb8affa39d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-bfa1-df22127c8660
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c5db-0efa13f7c53f
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-4595-a595dac3ebb9
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f83a-9ce5de25c590
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0080-eaaf1832cc3f
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-4477-361e65c89ecb
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-1a40-70b5b8f8c98f
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-1d2a-6b1d39f8f9c3
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9989-ac9594576463
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b6f4-a7153702f58b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0a1f-374276bea865
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c2b6-696b8f1a326d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-543f-fc0399a2aea0
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5916-564373433094
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-7f9e-6d98480eb6ca
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-82be-36fb261bbd86
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-3d19-5324da8e4c61
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-4ad6-8cde88315f64
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f39e-292620818e08
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c4e7-881476a2cc3f
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-d50e-2220428d363b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-c30d-ac4d365ff83d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f616-4596d1cdf738
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0c22-12b3e7a5a60f
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0b46-351f28be1dd5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-f23f-db756486cddd
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-8f25-c68514d74801
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-8dba-2e03d788a50c
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-fdca-19aba66d2395
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-39b7-04d089255211
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-627a-cbd840d18787
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b95d-fce3d68f752b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-82c7-e83f4e172096
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-e4dc-38ec5ff435bb
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-94cf-b6eff6a0a97d
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5b53-bb58a2432458
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-0358-6342c5a81be2
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-9568-9ee732862686
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a67e-e39d510d49de
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-2dcb-93091ff8e354
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-a152-0f3b503c5eb5
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-fdb7-2c7ccb280618
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-5737-5837bbf33900
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-3f14-959e8e4e799a
00020000-5677-b882-8b76-3474a7b2f457	00030000-5677-b880-6b36-35ef86cd4cc4
00020000-5677-b882-00df-c0ad5a154ef1	00030000-5677-b880-b23c-0d4e9490ae71
00020000-5677-b882-d9bf-3a41858a746c	00030000-5677-b880-efa4-5197b0382ea1
00020000-5677-b882-6592-5d3f61cbdbe8	00030000-5677-b880-fa6c-ed5d733f7be5
00020000-5677-b882-c025-ec9d8ed0e0b5	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b882-5026-37a7f933a489	00030000-5677-b880-480f-ad4e8fd63fc0
00020000-5677-b882-5e90-04d3df08ac8d	00030000-5677-b880-82ec-70ec156c0eaa
00020000-5677-b882-6f3f-92c4bc001b2e	00030000-5677-b880-81c2-b16735d81ba7
00020000-5677-b882-4cb8-b64bf9d00363	00030000-5677-b880-5e07-cae353fc7d6b
00020000-5677-b882-9686-2b8b63ce14e2	00030000-5677-b880-2060-4512ff937a03
00020000-5677-b882-0e4e-5eacbf38d6c6	00030000-5677-b880-47be-71f98c9b553c
00020000-5677-b882-4505-00a026723d98	00030000-5677-b880-d1b1-9f9a7f29e2dc
00020000-5677-b882-73b1-f35bde6ead82	00030000-5677-b880-8504-7e9426e16bea
00020000-5677-b882-6b75-70bb4737ebca	00030000-5677-b880-1ab9-2816403bdce1
00020000-5677-b882-9a10-2f6aa67e7215	00030000-5677-b880-e9f2-b7d54ff7f9e9
00020000-5677-b882-c615-3a4b203e426f	00030000-5677-b880-4eb4-b272c89970fb
00020000-5677-b882-22fb-9fe227bc0e92	00030000-5677-b880-9168-fb347d0b6da4
00020000-5677-b882-99af-b8daed2871b2	00030000-5677-b880-8f95-da8705850478
00020000-5677-b882-a38e-0acea305daae	00030000-5677-b880-b5f9-be90b71fd654
00020000-5677-b882-7bf4-013f0cb1c76c	00030000-5677-b880-85af-4d97b74fa6f8
00020000-5677-b882-7bf4-013f0cb1c76c	00030000-5677-b880-ab56-f3238ffe2f5c
00020000-5677-b882-7bf4-013f0cb1c76c	00030000-5677-b880-ab70-d672dfea20f9
00020000-5677-b882-26e1-7b663b22c3b1	00030000-5677-b880-63d9-791b2d50b24a
00020000-5677-b882-3627-4e127fa3a6c0	00030000-5677-b880-21f3-a9a6447ea97c
00020000-5677-b882-d553-0667d8810860	00030000-5677-b880-4ad6-8cde88315f64
00020000-5677-b882-6d0c-a1dfbb42da98	00030000-5677-b880-a7d8-aa35fa7e9e3e
00020000-5677-b882-9a7e-fc900e05b3be	00030000-5677-b880-284b-afc20cc34903
00020000-5677-b882-58bc-42bbb92a80a5	00030000-5677-b880-4962-f2de22f7c550
00020000-5677-b882-f879-536d358a2814	00030000-5677-b880-611d-6497d7d4d371
00020000-5677-b882-f25a-f630394f3f15	00030000-5677-b880-daea-10e3541ebc9b
00020000-5677-b882-13e8-0f31f6bd6501	00030000-5677-b880-a67e-e39d510d49de
00020000-5677-b882-2457-2906bdaa90c1	00030000-5677-b880-7ca4-96687635ded4
00020000-5677-b882-d28b-e9dd36186af6	00030000-5677-b880-d750-ad7cc574c268
00020000-5677-b882-ae30-a36d63074f17	00030000-5677-b880-d4c8-a28433bf812d
00020000-5677-b882-6aa6-0b507c98f599	00030000-5677-b880-f39e-292620818e08
00020000-5677-b882-d147-167bb7855b86	00030000-5677-b880-2c2e-f3b84e7f8179
00020000-5677-b882-9eeb-fab1ad204f54	00030000-5677-b880-24be-0be72d3b09c1
00020000-5677-b882-4071-64306ec958d8	00030000-5677-b880-47ee-c6c4c65eb228
00020000-5677-b882-ae7f-a34e0c0a70ca	00030000-5677-b880-e960-82deae8de185
00020000-5677-b882-0602-12f3c343a28a	00030000-5677-b880-db9e-f7c6a30a9ea9
00020000-5677-b882-5711-f580ffad9c2a	00030000-5677-b880-74d2-64bea3e8c2de
\.


--
-- TOC entry 3152 (class 0 OID 32855261)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32855295)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32855433)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5677-b883-8e0b-b8c81e8d04b9	00090000-5677-b883-d78e-7c99203ca372	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5677-b883-8b52-6dc050e3cee7	00090000-5677-b883-0a7d-56f2c77d31b3	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5677-b883-178f-bbc0366e29ab	00090000-5677-b883-2eb7-b8a55cdd20ed	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5677-b883-5dfa-d5353568a513	00090000-5677-b883-5b55-59e69ea93662	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32854953)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5677-b883-624e-07707265a449	\N	00040000-5677-b880-ec95-5d582dcc76e6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-d57f-d788498c4abf	\N	00040000-5677-b880-ec95-5d582dcc76e6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5677-b883-d650-15b8c78825ad	\N	00040000-5677-b880-ec95-5d582dcc76e6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-8eeb-58764086a537	\N	00040000-5677-b880-ec95-5d582dcc76e6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-87bc-d84da270ff8b	\N	00040000-5677-b880-ec95-5d582dcc76e6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-5168-5ccc57822805	\N	00040000-5677-b880-e1a4-05f9de0becbd	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-23fc-0cbce7001181	\N	00040000-5677-b880-4608-ed43624481a3	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-f61f-b993bcc076e5	\N	00040000-5677-b880-3746-09e76190c941	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b883-8f13-1273bbf50e39	\N	00040000-5677-b880-2d94-ad63bf37eed6	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5677-b884-dc07-c32faa40631d	\N	00040000-5677-b880-ec95-5d582dcc76e6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32854998)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5677-b880-39d0-70e90a269165	8341	Adlešiči
00050000-5677-b880-f2e9-6c1a16b3c333	5270	Ajdovščina
00050000-5677-b880-7451-edc2abe6fa9d	6280	Ankaran/Ancarano
00050000-5677-b880-ee76-8599d4a4db7d	9253	Apače
00050000-5677-b880-503c-62a10771d154	8253	Artiče
00050000-5677-b880-dd75-208e4dfd92be	4275	Begunje na Gorenjskem
00050000-5677-b880-cc16-1a0714a835cc	1382	Begunje pri Cerknici
00050000-5677-b880-2c06-f4fb9f8c3604	9231	Beltinci
00050000-5677-b880-321e-a4701994f1ea	2234	Benedikt
00050000-5677-b880-77a0-78206c9f304c	2345	Bistrica ob Dravi
00050000-5677-b880-1a0f-b795fc1d82a6	3256	Bistrica ob Sotli
00050000-5677-b880-c524-5df7caa04c81	8259	Bizeljsko
00050000-5677-b880-1dca-12c794da4d30	1223	Blagovica
00050000-5677-b880-7ad1-5bc1b3627804	8283	Blanca
00050000-5677-b880-cc0d-65acbd3592e8	4260	Bled
00050000-5677-b880-4d93-e1a46bda7322	4273	Blejska Dobrava
00050000-5677-b880-53eb-26016fbd928a	9265	Bodonci
00050000-5677-b880-ec21-bbb68a95231a	9222	Bogojina
00050000-5677-b880-a03a-fc4c31ad1df1	4263	Bohinjska Bela
00050000-5677-b880-a18a-27b654b081e2	4264	Bohinjska Bistrica
00050000-5677-b880-4418-2b5ec54b11ac	4265	Bohinjsko jezero
00050000-5677-b880-420a-922b2875b282	1353	Borovnica
00050000-5677-b880-61e2-073c3ab45b50	8294	Boštanj
00050000-5677-b880-2e3d-311cda338589	5230	Bovec
00050000-5677-b880-ef10-92eeb2f96dce	5295	Branik
00050000-5677-b880-d916-1da38713a4fb	3314	Braslovče
00050000-5677-b880-f677-4ba300b40445	5223	Breginj
00050000-5677-b880-957c-f3a7480fc8e6	8280	Brestanica
00050000-5677-b880-952b-f83c78e28e4e	2354	Bresternica
00050000-5677-b880-20af-2723b67a1ddd	4243	Brezje
00050000-5677-b880-3759-19b6adfc994c	1351	Brezovica pri Ljubljani
00050000-5677-b880-d23e-fcf11b338dfb	8250	Brežice
00050000-5677-b880-dfed-b07c2c88372a	4210	Brnik - Aerodrom
00050000-5677-b880-ff02-08d78a724fb2	8321	Brusnice
00050000-5677-b880-8e8c-838f3dd013e5	3255	Buče
00050000-5677-b880-22f9-2873db316fdd	8276	Bučka 
00050000-5677-b880-db15-a81e9bbd74f5	9261	Cankova
00050000-5677-b880-e3fd-bca0120c6e76	3000	Celje 
00050000-5677-b880-a2dd-42a25653372e	3001	Celje - poštni predali
00050000-5677-b880-8719-6d4ce36f3031	4207	Cerklje na Gorenjskem
00050000-5677-b880-7d06-dd2138860e0c	8263	Cerklje ob Krki
00050000-5677-b880-8234-44c82fce13fb	1380	Cerknica
00050000-5677-b880-6659-c9cf551c4797	5282	Cerkno
00050000-5677-b880-4a38-5f7f1cea9e72	2236	Cerkvenjak
00050000-5677-b880-503f-9b910f2c597b	2215	Ceršak
00050000-5677-b880-69f2-dac7dad73446	2326	Cirkovce
00050000-5677-b880-fe2b-be2f65e04844	2282	Cirkulane
00050000-5677-b880-f26f-02604979bce1	5273	Col
00050000-5677-b880-d94f-d345175103e4	8251	Čatež ob Savi
00050000-5677-b880-6cf1-88a4e3b89e93	1413	Čemšenik
00050000-5677-b880-e477-366fc6221c80	5253	Čepovan
00050000-5677-b880-3135-b7c3ae37fe74	9232	Črenšovci
00050000-5677-b880-c4bd-f1bb5a50bba4	2393	Črna na Koroškem
00050000-5677-b880-b7bb-d7ff0602d248	6275	Črni Kal
00050000-5677-b880-3fbb-6356439ed2cf	5274	Črni Vrh nad Idrijo
00050000-5677-b880-a11f-ac24b87ed74d	5262	Črniče
00050000-5677-b880-5ad9-387081a22176	8340	Črnomelj
00050000-5677-b880-a6a2-4d7db1e9e97d	6271	Dekani
00050000-5677-b880-49f1-126946a71f39	5210	Deskle
00050000-5677-b880-2356-527f184161ab	2253	Destrnik
00050000-5677-b880-4792-b8cf5e539124	6215	Divača
00050000-5677-b880-a54e-e8800a3ec875	1233	Dob
00050000-5677-b880-f48c-0f509f6dc6b1	3224	Dobje pri Planini
00050000-5677-b880-7cf3-4bd89f50dcbd	8257	Dobova
00050000-5677-b880-7887-1276222f5002	1423	Dobovec
00050000-5677-b880-31e4-c9f45f8f4451	5263	Dobravlje
00050000-5677-b880-66a9-c353b8990dac	3204	Dobrna
00050000-5677-b880-7f43-f9b94fa916b8	8211	Dobrnič
00050000-5677-b880-2309-b2549af6868f	1356	Dobrova
00050000-5677-b880-1332-19f284580eea	9223	Dobrovnik/Dobronak 
00050000-5677-b880-0f28-c291f405fc0c	5212	Dobrovo v Brdih
00050000-5677-b880-8c1b-a9fbb1752f9f	1431	Dol pri Hrastniku
00050000-5677-b880-9edb-2edec23186dd	1262	Dol pri Ljubljani
00050000-5677-b880-bc1c-b0724b793967	1273	Dole pri Litiji
00050000-5677-b880-e492-39bbd1b860a9	1331	Dolenja vas
00050000-5677-b880-308c-7d8bf4412b43	8350	Dolenjske Toplice
00050000-5677-b880-a0a2-54106c19c7c4	1230	Domžale
00050000-5677-b880-e404-8cb73cdda0aa	2252	Dornava
00050000-5677-b880-1183-6fcea3f1f118	5294	Dornberk
00050000-5677-b880-e56d-a6070b8ffb2c	1319	Draga
00050000-5677-b880-42a3-92412960f706	8343	Dragatuš
00050000-5677-b880-8950-c59be416db10	3222	Dramlje
00050000-5677-b880-0f78-d586dd1ba7cd	2370	Dravograd
00050000-5677-b880-1ae1-36652958c85e	4203	Duplje
00050000-5677-b880-07aa-92e29cedda92	6221	Dutovlje
00050000-5677-b880-cbc9-800c96c34bc2	8361	Dvor
00050000-5677-b880-5a47-861441cdaea2	2343	Fala
00050000-5677-b880-d31a-6920f9a74d31	9208	Fokovci
00050000-5677-b880-21a3-5adcb1e8fb89	2313	Fram
00050000-5677-b880-ec4f-c6c0e84b770b	3213	Frankolovo
00050000-5677-b880-1105-1803c9513b99	1274	Gabrovka
00050000-5677-b880-8d11-23e36a31bf24	8254	Globoko
00050000-5677-b880-96f2-ffd327733d28	5275	Godovič
00050000-5677-b880-52a4-5c64b48f661f	4204	Golnik
00050000-5677-b880-b9dc-913a0305899a	3303	Gomilsko
00050000-5677-b880-b06a-264141390560	4224	Gorenja vas
00050000-5677-b880-4262-049a42231167	3263	Gorica pri Slivnici
00050000-5677-b880-3668-63a6a39f1db2	2272	Gorišnica
00050000-5677-b880-74a0-d62108aaaeba	9250	Gornja Radgona
00050000-5677-b880-ad38-95f628548fc5	3342	Gornji Grad
00050000-5677-b880-01d7-86235ebad518	4282	Gozd Martuljek
00050000-5677-b880-9523-4f53fa65ebf6	6272	Gračišče
00050000-5677-b880-dace-7ba3f834a21b	9264	Grad
00050000-5677-b880-fc75-6ce1eb50da10	8332	Gradac
00050000-5677-b880-93de-f689c704a5fe	1384	Grahovo
00050000-5677-b880-0895-351ff5b9a974	5242	Grahovo ob Bači
00050000-5677-b880-1a24-cea7265c2c3b	5251	Grgar
00050000-5677-b880-6796-897d2bc506f8	3302	Griže
00050000-5677-b880-866b-a3dc8ae5d026	3231	Grobelno
00050000-5677-b880-5cd3-c341338167d2	1290	Grosuplje
00050000-5677-b880-0f77-eef57c4d92f3	2288	Hajdina
00050000-5677-b880-6c09-ca7822081d9d	8362	Hinje
00050000-5677-b880-c61b-b9d4b39d91cb	2311	Hoče
00050000-5677-b880-7645-c17328adf76b	9205	Hodoš/Hodos
00050000-5677-b880-228e-2be07fbbe949	1354	Horjul
00050000-5677-b880-b7ae-f1f9397dff05	1372	Hotedršica
00050000-5677-b880-be38-e9584e02d89d	1430	Hrastnik
00050000-5677-b880-9082-74e05e10cb65	6225	Hruševje
00050000-5677-b880-8f5b-d50c0d98d867	4276	Hrušica
00050000-5677-b880-067d-868a8e4f23b2	5280	Idrija
00050000-5677-b880-f5e7-d749975e1d35	1292	Ig
00050000-5677-b880-c0de-951a53c476cf	6250	Ilirska Bistrica
00050000-5677-b880-192a-daa4b7556df0	6251	Ilirska Bistrica-Trnovo
00050000-5677-b880-b47d-cb7d3f590d3a	1295	Ivančna Gorica
00050000-5677-b880-f9a9-426f82e672ef	2259	Ivanjkovci
00050000-5677-b880-6488-875f7a7c46ce	1411	Izlake
00050000-5677-b880-ea93-3cd9f5af73be	6310	Izola/Isola
00050000-5677-b880-8884-2ef10e91f4f3	2222	Jakobski Dol
00050000-5677-b880-16ff-21b638d25620	2221	Jarenina
00050000-5677-b880-d48f-d645a8f8748f	6254	Jelšane
00050000-5677-b880-53e2-bcf9095570fc	4270	Jesenice
00050000-5677-b880-edf9-30b4eb9861f6	8261	Jesenice na Dolenjskem
00050000-5677-b880-e723-7e8dba9b479f	3273	Jurklošter
00050000-5677-b880-26b0-5a760c58242c	2223	Jurovski Dol
00050000-5677-b880-e5b2-b1275b615fc6	2256	Juršinci
00050000-5677-b880-7856-e853c616b1b8	5214	Kal nad Kanalom
00050000-5677-b880-bacb-4947bc6be97b	3233	Kalobje
00050000-5677-b880-b500-f5fa0cb72cd6	4246	Kamna Gorica
00050000-5677-b880-7dea-53540de9dd80	2351	Kamnica
00050000-5677-b880-4936-1030111c8318	1241	Kamnik
00050000-5677-b880-bb3b-74c61d2b60af	5213	Kanal
00050000-5677-b880-8516-c3850250e607	8258	Kapele
00050000-5677-b880-f283-032cba7c107c	2362	Kapla
00050000-5677-b880-fb47-7d08ab105a51	2325	Kidričevo
00050000-5677-b880-0e65-e188b314801e	1412	Kisovec
00050000-5677-b880-7d85-1ce8c2fee4a3	6253	Knežak
00050000-5677-b880-d446-88127fe75ce6	5222	Kobarid
00050000-5677-b880-ee56-b60f6aa3f2c3	9227	Kobilje
00050000-5677-b880-5531-b978e30ec89e	1330	Kočevje
00050000-5677-b880-3720-539326d83706	1338	Kočevska Reka
00050000-5677-b880-a216-459527e1ae0d	2276	Kog
00050000-5677-b880-0ad5-c6f968eb7167	5211	Kojsko
00050000-5677-b880-2430-4fbc4074b24b	6223	Komen
00050000-5677-b880-6ee0-d5816087b434	1218	Komenda
00050000-5677-b880-567d-4db799ca6d7c	6000	Koper/Capodistria 
00050000-5677-b880-0caf-c92dcfc50675	6001	Koper/Capodistria - poštni predali
00050000-5677-b880-8686-323f8ee830e8	8282	Koprivnica
00050000-5677-b880-f39c-458f29ac4b56	5296	Kostanjevica na Krasu
00050000-5677-b880-091f-19601f4f6c6c	8311	Kostanjevica na Krki
00050000-5677-b880-426d-9eb817383f72	1336	Kostel
00050000-5677-b880-3cbd-ebec848b785a	6256	Košana
00050000-5677-b880-42a1-2dc0dea8269c	2394	Kotlje
00050000-5677-b880-e7cc-556ab0dcf53c	6240	Kozina
00050000-5677-b880-c0f0-c36fd73c0511	3260	Kozje
00050000-5677-b880-0bb1-4b908275a1fb	4000	Kranj 
00050000-5677-b880-0f59-616b7f1a6076	4001	Kranj - poštni predali
00050000-5677-b880-9a16-19da1ae5a560	4280	Kranjska Gora
00050000-5677-b880-70c9-cd9a2cbc50ca	1281	Kresnice
00050000-5677-b880-8cc6-a9d4edc4c311	4294	Križe
00050000-5677-b880-a2d1-cd81b72b5de4	9206	Križevci
00050000-5677-b880-6dc9-f234afce04c1	9242	Križevci pri Ljutomeru
00050000-5677-b880-e6dc-e00bc3288e62	1301	Krka
00050000-5677-b880-0af2-c4ce119f2dbb	8296	Krmelj
00050000-5677-b880-f96b-ee32611d084c	4245	Kropa
00050000-5677-b880-982f-719819cc5425	8262	Krška vas
00050000-5677-b880-b934-acf09f277e70	8270	Krško
00050000-5677-b880-42a6-e2616e215548	9263	Kuzma
00050000-5677-b880-7a4f-d75e36d5e4d7	2318	Laporje
00050000-5677-b880-26c4-2f9447a34c19	3270	Laško
00050000-5677-b880-3673-d943d144d941	1219	Laze v Tuhinju
00050000-5677-b880-8c03-7032d76aae20	2230	Lenart v Slovenskih goricah
00050000-5677-b880-409f-dbaf3ba7dca0	9220	Lendava/Lendva
00050000-5677-b880-5531-91fc400cf174	4248	Lesce
00050000-5677-b880-3386-399087b9fa73	3261	Lesično
00050000-5677-b880-a2a5-38fc6e2ba529	8273	Leskovec pri Krškem
00050000-5677-b880-bb7c-cd9c75a5f624	2372	Libeliče
00050000-5677-b880-7cb1-be78c8fc5880	2341	Limbuš
00050000-5677-b880-1194-0abd9e254448	1270	Litija
00050000-5677-b880-70a3-e54fd3753649	3202	Ljubečna
00050000-5677-b880-0977-9515dbcd4814	1000	Ljubljana 
00050000-5677-b880-1f88-5969ea08188d	1001	Ljubljana - poštni predali
00050000-5677-b880-1954-89e6df39c6e8	1231	Ljubljana - Črnuče
00050000-5677-b880-ecd2-08b60b1e0432	1261	Ljubljana - Dobrunje
00050000-5677-b880-5dac-0d5a367b97a1	1260	Ljubljana - Polje
00050000-5677-b880-bec2-f8ecdfa667da	1210	Ljubljana - Šentvid
00050000-5677-b880-395c-6d71caeedd2a	1211	Ljubljana - Šmartno
00050000-5677-b880-c7ad-b2e38d5909c2	3333	Ljubno ob Savinji
00050000-5677-b880-ad19-e71c4b589505	9240	Ljutomer
00050000-5677-b880-ea6a-5db24204a218	3215	Loče
00050000-5677-b880-4ded-850020941bcc	5231	Log pod Mangartom
00050000-5677-b880-28d4-6363a99430de	1358	Log pri Brezovici
00050000-5677-b880-2796-18599227e01b	1370	Logatec
00050000-5677-b880-df1a-c4d3fc4ff3dd	1371	Logatec
00050000-5677-b880-0a7f-25667d87a08b	1434	Loka pri Zidanem Mostu
00050000-5677-b880-db92-64e0a2ff95dc	3223	Loka pri Žusmu
00050000-5677-b880-dad8-7baa722addf1	6219	Lokev
00050000-5677-b880-ee38-99d60e10a1e3	1318	Loški Potok
00050000-5677-b880-2490-1a13c76be815	2324	Lovrenc na Dravskem polju
00050000-5677-b880-c59c-f3a023ef868e	2344	Lovrenc na Pohorju
00050000-5677-b880-19ca-88bab24462b9	3334	Luče
00050000-5677-b880-81d6-22c751205a96	1225	Lukovica
00050000-5677-b880-818b-575534c3298b	9202	Mačkovci
00050000-5677-b880-f876-be26bc955c9b	2322	Majšperk
00050000-5677-b880-5163-531d4a775005	2321	Makole
00050000-5677-b880-e4a1-9dbc07d35b45	9243	Mala Nedelja
00050000-5677-b880-9875-7abca134ff58	2229	Malečnik
00050000-5677-b880-c697-b558114e3d7e	6273	Marezige
00050000-5677-b880-6ac2-e097d9800834	2000	Maribor 
00050000-5677-b880-fc10-58d6c2c50985	2001	Maribor - poštni predali
00050000-5677-b880-c7e9-e4b1d81341cc	2206	Marjeta na Dravskem polju
00050000-5677-b880-d047-976b1706e62f	2281	Markovci
00050000-5677-b880-856e-71ae3d7b7ab6	9221	Martjanci
00050000-5677-b880-b4fc-0965a9f16962	6242	Materija
00050000-5677-b880-2058-8bcf300b834b	4211	Mavčiče
00050000-5677-b880-4568-eda3b31b2c7d	1215	Medvode
00050000-5677-b880-a698-d0870e718ee3	1234	Mengeš
00050000-5677-b880-58ec-8419064fbd5d	8330	Metlika
00050000-5677-b880-245a-eaeac393305a	2392	Mežica
00050000-5677-b880-7030-5d4b75f72bf8	2204	Miklavž na Dravskem polju
00050000-5677-b880-b5c6-689c8907ecfb	2275	Miklavž pri Ormožu
00050000-5677-b880-ffcd-f43147695c0e	5291	Miren
00050000-5677-b880-dc6c-5fefe0fc21d3	8233	Mirna
00050000-5677-b880-dffc-3c7ed5e66bf2	8216	Mirna Peč
00050000-5677-b880-d98e-e0338a7bd2ed	2382	Mislinja
00050000-5677-b880-d06f-2ff10110dcac	4281	Mojstrana
00050000-5677-b880-4d32-7cf861fd9b1f	8230	Mokronog
00050000-5677-b880-014f-46f5c1b8aed1	1251	Moravče
00050000-5677-b880-da01-5d26fd7ff754	9226	Moravske Toplice
00050000-5677-b880-9f53-a216452a5cdc	5216	Most na Soči
00050000-5677-b880-ff49-c9772aa47b04	1221	Motnik
00050000-5677-b880-7343-1ecf2056bbb9	3330	Mozirje
00050000-5677-b880-6650-81954a3685dd	9000	Murska Sobota 
00050000-5677-b880-3388-dbbd0733fdba	9001	Murska Sobota - poštni predali
00050000-5677-b880-a139-940b133a27a3	2366	Muta
00050000-5677-b880-4d5a-4d6405715b86	4202	Naklo
00050000-5677-b880-223d-f4f9d98d2018	3331	Nazarje
00050000-5677-b880-7e90-06e4f6a477de	1357	Notranje Gorice
00050000-5677-b880-612e-fcaeec3d2572	3203	Nova Cerkev
00050000-5677-b880-6e18-1d4e815d12d6	5000	Nova Gorica 
00050000-5677-b880-52c4-45e7d607f879	5001	Nova Gorica - poštni predali
00050000-5677-b880-5ed3-b94b5309c5c7	1385	Nova vas
00050000-5677-b880-d69f-91a684f79458	8000	Novo mesto
00050000-5677-b880-6a67-5f362baf9da4	8001	Novo mesto - poštni predali
00050000-5677-b880-75c0-651e7b41ccd9	6243	Obrov
00050000-5677-b880-4526-cddb5f0ff029	9233	Odranci
00050000-5677-b880-d73f-62bd0ff5837b	2317	Oplotnica
00050000-5677-b880-c9f8-98fa9c83953f	2312	Orehova vas
00050000-5677-b880-0bd5-fdc053f6caf6	2270	Ormož
00050000-5677-b880-953e-b57e62cbb7e6	1316	Ortnek
00050000-5677-b880-2be8-e3ea65557fa0	1337	Osilnica
00050000-5677-b880-0066-50436e531666	8222	Otočec
00050000-5677-b880-2460-1129e24cc6a0	2361	Ožbalt
00050000-5677-b880-d238-4b6a935fc879	2231	Pernica
00050000-5677-b880-585e-448974862eed	2211	Pesnica pri Mariboru
00050000-5677-b880-45a0-6740448626c2	9203	Petrovci
00050000-5677-b880-77a8-a01ed446a836	3301	Petrovče
00050000-5677-b880-962e-41cc7deca030	6330	Piran/Pirano
00050000-5677-b880-9edc-37df070eb51e	8255	Pišece
00050000-5677-b880-d7bc-eeae0e8297c1	6257	Pivka
00050000-5677-b880-e581-7cf2a90619b5	6232	Planina
00050000-5677-b880-183b-b399087facf5	3225	Planina pri Sevnici
00050000-5677-b880-13e5-686eb8df3ea3	6276	Pobegi
00050000-5677-b880-f828-c2dbe7b0751b	8312	Podbočje
00050000-5677-b880-67a1-9ea4c53309b8	5243	Podbrdo
00050000-5677-b880-3ff4-9b9435b146c7	3254	Podčetrtek
00050000-5677-b880-83ac-863c7a4cd9bd	2273	Podgorci
00050000-5677-b880-45d9-2452546f5b4c	6216	Podgorje
00050000-5677-b880-6d58-a7abc0a23430	2381	Podgorje pri Slovenj Gradcu
00050000-5677-b880-177c-8fa4e5703ca7	6244	Podgrad
00050000-5677-b880-97af-8e74366c9a12	1414	Podkum
00050000-5677-b880-06a5-56ad62559553	2286	Podlehnik
00050000-5677-b880-a443-6c0d636e3503	5272	Podnanos
00050000-5677-b880-1c40-1261ee52b0bf	4244	Podnart
00050000-5677-b880-4683-6c210a350eca	3241	Podplat
00050000-5677-b880-4b55-e8865f64fff0	3257	Podsreda
00050000-5677-b880-7a97-563e343de4dc	2363	Podvelka
00050000-5677-b880-4674-f7d498b990e8	2208	Pohorje
00050000-5677-b880-e4fd-67d983b1f299	2257	Polenšak
00050000-5677-b880-fbdd-b1231eef767f	1355	Polhov Gradec
00050000-5677-b880-2e7d-a7ea2eb4b2a4	4223	Poljane nad Škofjo Loko
00050000-5677-b880-ab0b-e25e03dfec7f	2319	Poljčane
00050000-5677-b880-745e-39e27df449cd	1272	Polšnik
00050000-5677-b880-240c-1637dd68f58f	3313	Polzela
00050000-5677-b880-85d8-95db9a427dfc	3232	Ponikva
00050000-5677-b880-6802-6022b54c889a	6320	Portorož/Portorose
00050000-5677-b880-34dc-6953f06f1836	6230	Postojna
00050000-5677-b880-88f5-2d87978deb6a	2331	Pragersko
00050000-5677-b880-d909-a5a7088b95d1	3312	Prebold
00050000-5677-b880-c687-a05a98ad145f	4205	Preddvor
00050000-5677-b880-fb08-700b732e7dbc	6255	Prem
00050000-5677-b880-82ae-a6252e00b36d	1352	Preserje
00050000-5677-b880-c849-5432049d02a5	6258	Prestranek
00050000-5677-b880-26f1-b0b7c336be82	2391	Prevalje
00050000-5677-b880-3bb5-a379a5c5bbb0	3262	Prevorje
00050000-5677-b880-432d-e80fed6d0a54	1276	Primskovo 
00050000-5677-b880-186d-535fe4cfc178	3253	Pristava pri Mestinju
00050000-5677-b880-aebd-e10ca851fb98	9207	Prosenjakovci/Partosfalva
00050000-5677-b880-f86d-cc6de0821a61	5297	Prvačina
00050000-5677-b880-7493-03cfe412fcf7	2250	Ptuj
00050000-5677-b880-8e06-0964780dc9ee	2323	Ptujska Gora
00050000-5677-b880-13a3-b1f8d193c5a8	9201	Puconci
00050000-5677-b880-3b55-f5744bf49411	2327	Rače
00050000-5677-b880-fe59-03bc0f3e2ec4	1433	Radeče
00050000-5677-b880-6e4d-b23fec0ba3b0	9252	Radenci
00050000-5677-b880-a49d-1f1d4a13272a	2360	Radlje ob Dravi
00050000-5677-b880-220a-afade56d036d	1235	Radomlje
00050000-5677-b880-28a7-096b3e96d2f0	4240	Radovljica
00050000-5677-b880-e254-0e90fadf7a1b	8274	Raka
00050000-5677-b880-d234-9fb493ff92cc	1381	Rakek
00050000-5677-b880-2ab6-c59994db615c	4283	Rateče - Planica
00050000-5677-b880-1f1d-5775e970e94a	2390	Ravne na Koroškem
00050000-5677-b880-4ce5-ba25455a39a7	9246	Razkrižje
00050000-5677-b880-d984-8544055fb649	3332	Rečica ob Savinji
00050000-5677-b880-d93d-f865f35539db	5292	Renče
00050000-5677-b880-5e95-1f9d7da3f275	1310	Ribnica
00050000-5677-b880-3737-ed1fce9e5ed4	2364	Ribnica na Pohorju
00050000-5677-b880-0f2a-8cf30f7cead5	3272	Rimske Toplice
00050000-5677-b880-2fac-4016f4689ce0	1314	Rob
00050000-5677-b880-214a-98457b2d0c8a	5215	Ročinj
00050000-5677-b880-8d01-b23eee94e28f	3250	Rogaška Slatina
00050000-5677-b880-be2e-e462c6a5214f	9262	Rogašovci
00050000-5677-b880-723b-38dbb7467c87	3252	Rogatec
00050000-5677-b880-bdb4-58aca32c863f	1373	Rovte
00050000-5677-b880-1037-c55e7ae81813	2342	Ruše
00050000-5677-b880-e198-6ffe3908ed8d	1282	Sava
00050000-5677-b880-c242-13ccd2a8dd42	6333	Sečovlje/Sicciole
00050000-5677-b880-d820-d722d4fa409e	4227	Selca
00050000-5677-b880-cd36-b5d51e4a50d7	2352	Selnica ob Dravi
00050000-5677-b880-2595-f9d4731aa9ad	8333	Semič
00050000-5677-b880-54a4-2512abeaaaba	8281	Senovo
00050000-5677-b880-afa7-25c7cef27702	6224	Senožeče
00050000-5677-b880-d227-95f71eb50693	8290	Sevnica
00050000-5677-b880-8993-e44df2e18ac8	6210	Sežana
00050000-5677-b880-cf6b-d8daed4b787e	2214	Sladki Vrh
00050000-5677-b880-ea0b-4cbae185894f	5283	Slap ob Idrijci
00050000-5677-b880-9755-d29fbe7b7027	2380	Slovenj Gradec
00050000-5677-b880-4c4c-c0235ffe1cfa	2310	Slovenska Bistrica
00050000-5677-b880-b3e8-ddc9718c62b1	3210	Slovenske Konjice
00050000-5677-b880-184b-14a2b4b6bb07	1216	Smlednik
00050000-5677-b880-6015-4035cca69272	5232	Soča
00050000-5677-b880-fa46-42355c658b7f	1317	Sodražica
00050000-5677-b880-141f-88736ba2861c	3335	Solčava
00050000-5677-b880-be69-3a99d7b00abe	5250	Solkan
00050000-5677-b880-093d-053fdd8cdccf	4229	Sorica
00050000-5677-b880-ce2b-402a6d2f7316	4225	Sovodenj
00050000-5677-b880-11a2-a27922e35669	5281	Spodnja Idrija
00050000-5677-b880-41bd-e108530d8932	2241	Spodnji Duplek
00050000-5677-b880-5866-f47dbe4889db	9245	Spodnji Ivanjci
00050000-5677-b880-9ffb-18abe5ccdf21	2277	Središče ob Dravi
00050000-5677-b880-7e00-dff7d600134c	4267	Srednja vas v Bohinju
00050000-5677-b880-fb93-443d3fca023c	8256	Sromlje 
00050000-5677-b880-1a68-91530d641383	5224	Srpenica
00050000-5677-b880-2154-125af3fc73d6	1242	Stahovica
00050000-5677-b880-259a-aee00e594d7b	1332	Stara Cerkev
00050000-5677-b880-2b7f-9d2f9ff0d247	8342	Stari trg ob Kolpi
00050000-5677-b880-e2f3-2e2e2e781093	1386	Stari trg pri Ložu
00050000-5677-b880-c27b-cba600fee18f	2205	Starše
00050000-5677-b880-938b-a1cb97257735	2289	Stoperce
00050000-5677-b880-0317-965a85cc45da	8322	Stopiče
00050000-5677-b880-9f60-67c5b163c265	3206	Stranice
00050000-5677-b880-b599-f29f3d062b09	8351	Straža
00050000-5677-b880-65be-8b077f8cd3af	1313	Struge
00050000-5677-b880-d560-8406d56510f3	8293	Studenec
00050000-5677-b880-5d6d-8394f3b81589	8331	Suhor
00050000-5677-b880-6dbb-8d31fd2dde31	2233	Sv. Ana v Slovenskih goricah
00050000-5677-b880-9a5a-ad74558829e9	2235	Sv. Trojica v Slovenskih goricah
00050000-5677-b880-c93c-7996cb884547	2353	Sveti Duh na Ostrem Vrhu
00050000-5677-b880-0287-a775cce796ca	9244	Sveti Jurij ob Ščavnici
00050000-5677-b880-586c-e9f95d481547	3264	Sveti Štefan
00050000-5677-b880-e229-b2440b68d75c	2258	Sveti Tomaž
00050000-5677-b880-021e-e65bec7018af	9204	Šalovci
00050000-5677-b880-0ffe-dd22215a5156	5261	Šempas
00050000-5677-b880-f930-65b55a387038	5290	Šempeter pri Gorici
00050000-5677-b880-e06d-bf6a53292df8	3311	Šempeter v Savinjski dolini
00050000-5677-b880-442f-19936bcec2c2	4208	Šenčur
00050000-5677-b880-436d-61e223a7a2c3	2212	Šentilj v Slovenskih goricah
00050000-5677-b880-0960-5df8e8460972	8297	Šentjanž
00050000-5677-b880-0268-213f16101501	2373	Šentjanž pri Dravogradu
00050000-5677-b880-37c3-b830f9aca8c2	8310	Šentjernej
00050000-5677-b880-b85f-98c77ba34c5d	3230	Šentjur
00050000-5677-b880-0921-a3c6d535a9a1	3271	Šentrupert
00050000-5677-b880-a384-446fb2f1ea89	8232	Šentrupert
00050000-5677-b880-4568-970605c29e73	1296	Šentvid pri Stični
00050000-5677-b880-8849-f5aaaa9166ea	8275	Škocjan
00050000-5677-b880-7acb-6919ad1d6c5d	6281	Škofije
00050000-5677-b880-d672-b62f5e2d7c15	4220	Škofja Loka
00050000-5677-b880-7549-877ae2e9143e	3211	Škofja vas
00050000-5677-b880-e209-d1fcb5260430	1291	Škofljica
00050000-5677-b880-f233-1f248328ca17	6274	Šmarje
00050000-5677-b880-4d1b-d31e4549c114	1293	Šmarje - Sap
00050000-5677-b880-351b-2b41a186e452	3240	Šmarje pri Jelšah
00050000-5677-b880-8506-436cd6c5c06f	8220	Šmarješke Toplice
00050000-5677-b880-38e8-758332ae0e4f	2315	Šmartno na Pohorju
00050000-5677-b880-e1b9-07502981c894	3341	Šmartno ob Dreti
00050000-5677-b880-256a-8be697f68a4a	3327	Šmartno ob Paki
00050000-5677-b880-91b0-640a30951f2a	1275	Šmartno pri Litiji
00050000-5677-b880-4714-fe71b12afe91	2383	Šmartno pri Slovenj Gradcu
00050000-5677-b880-911d-e9588d83658d	3201	Šmartno v Rožni dolini
00050000-5677-b880-2b5b-5581460e8559	3325	Šoštanj
00050000-5677-b880-1ece-af3893d0f436	6222	Štanjel
00050000-5677-b880-7c77-21454188e101	3220	Štore
00050000-5677-b880-7261-61f8fd504d6d	3304	Tabor
00050000-5677-b880-a513-45f00c8d7a72	3221	Teharje
00050000-5677-b880-bc2b-87d547886f86	9251	Tišina
00050000-5677-b880-085c-245ed06229f0	5220	Tolmin
00050000-5677-b880-7d3b-f40430f89aba	3326	Topolšica
00050000-5677-b880-2d67-d66c14aee506	2371	Trbonje
00050000-5677-b880-8c03-035f75243192	1420	Trbovlje
00050000-5677-b880-0d58-d57f29df3431	8231	Trebelno 
00050000-5677-b880-3ec8-5c053146ea22	8210	Trebnje
00050000-5677-b880-842b-6dd7f07d3825	5252	Trnovo pri Gorici
00050000-5677-b880-8a8b-093138444fef	2254	Trnovska vas
00050000-5677-b880-8eba-fb3437ab4236	1222	Trojane
00050000-5677-b880-a4eb-05351e5759dc	1236	Trzin
00050000-5677-b880-f106-9e947f2414f1	4290	Tržič
00050000-5677-b880-87b3-fdbe3ee49cd3	8295	Tržišče
00050000-5677-b880-c679-9b9e2b3a1b97	1311	Turjak
00050000-5677-b880-a20b-fa53312515f0	9224	Turnišče
00050000-5677-b880-76c0-0a1fe785b467	8323	Uršna sela
00050000-5677-b880-bc54-bc5dccefd55b	1252	Vače
00050000-5677-b880-fbfb-83925b0f202e	3320	Velenje 
00050000-5677-b880-9627-8494e8d3d5c4	3322	Velenje - poštni predali
00050000-5677-b880-3dc0-856017635f25	8212	Velika Loka
00050000-5677-b880-a77d-4a9eebf3a358	2274	Velika Nedelja
00050000-5677-b880-57f9-17805c9c23fa	9225	Velika Polana
00050000-5677-b880-424d-9ceebcdc5855	1315	Velike Lašče
00050000-5677-b880-c8c8-68c73774c692	8213	Veliki Gaber
00050000-5677-b880-1b73-9b19a478d65a	9241	Veržej
00050000-5677-b880-df56-054d11fb4097	1312	Videm - Dobrepolje
00050000-5677-b880-9a37-93db8f8c217c	2284	Videm pri Ptuju
00050000-5677-b880-b2b6-c852e19adca7	8344	Vinica
00050000-5677-b880-49ae-c38a6b954afb	5271	Vipava
00050000-5677-b880-f7b3-61a1260a3b9c	4212	Visoko
00050000-5677-b880-afe9-2191d89d9aed	1294	Višnja Gora
00050000-5677-b880-c076-328f4bf30c39	3205	Vitanje
00050000-5677-b880-626e-f588c45adc57	2255	Vitomarci
00050000-5677-b880-3283-3be69c36d815	1217	Vodice
00050000-5677-b880-3fe8-07dbf74550ab	3212	Vojnik\t
00050000-5677-b880-818a-ad13df2482d6	5293	Volčja Draga
00050000-5677-b880-9b73-c89c93889cff	2232	Voličina
00050000-5677-b880-89ef-4550bf1301d5	3305	Vransko
00050000-5677-b880-1173-d37a930844d7	6217	Vremski Britof
00050000-5677-b880-0137-dcf5a7a2f6f7	1360	Vrhnika
00050000-5677-b880-c92f-89003f7dd60f	2365	Vuhred
00050000-5677-b880-fc42-e48f4397587e	2367	Vuzenica
00050000-5677-b880-9e46-f799dd765457	8292	Zabukovje 
00050000-5677-b880-e757-a59585eab9ba	1410	Zagorje ob Savi
00050000-5677-b880-1612-d51ec192222a	1303	Zagradec
00050000-5677-b880-5840-d5f4a878c244	2283	Zavrč
00050000-5677-b880-c71c-6256ae888118	8272	Zdole 
00050000-5677-b880-7e0b-bab8e39a43f5	4201	Zgornja Besnica
00050000-5677-b880-91ba-9f94414e1bf6	2242	Zgornja Korena
00050000-5677-b880-7304-83afe2f2e71f	2201	Zgornja Kungota
00050000-5677-b880-348b-37c3f0c91d05	2316	Zgornja Ložnica
00050000-5677-b880-b6d2-02ff430bbf1a	2314	Zgornja Polskava
00050000-5677-b880-e768-ddf67dcade94	2213	Zgornja Velka
00050000-5677-b880-3a0c-905bb83c8bc1	4247	Zgornje Gorje
00050000-5677-b880-9a08-bc895c81e49c	4206	Zgornje Jezersko
00050000-5677-b880-1b40-2f7a23511be4	2285	Zgornji Leskovec
00050000-5677-b880-8236-ad3a5f2a4817	1432	Zidani Most
00050000-5677-b880-4db7-1e41b05155d5	3214	Zreče
00050000-5677-b880-1d03-f6d81a88c8bf	4209	Žabnica
00050000-5677-b880-0067-699a3ba6a3fd	3310	Žalec
00050000-5677-b880-64e2-85125f0b659c	4228	Železniki
00050000-5677-b880-885e-991ad5799735	2287	Žetale
00050000-5677-b880-6e85-42e24faea117	4226	Žiri
00050000-5677-b880-c730-bbd7fd4110c9	4274	Žirovnica
00050000-5677-b880-36d1-97f8002a5473	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32855671)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32855235)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32854983)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5677-b883-fe06-1c9ac35d32dc	00080000-5677-b883-624e-07707265a449	\N	00040000-5677-b880-ec95-5d582dcc76e6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5677-b883-e112-92667f9a26be	00080000-5677-b883-624e-07707265a449	\N	00040000-5677-b880-ec95-5d582dcc76e6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5677-b883-8ef1-d530d8f9c602	00080000-5677-b883-d57f-d788498c4abf	\N	00040000-5677-b880-ec95-5d582dcc76e6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32855127)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5677-b880-68ab-f83f6c823982	novo leto	1	1	\N	t
00430000-5677-b880-bace-b23e73ff772b	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5677-b880-52df-074d0dcc90c7	dan upora proti okupatorju	27	4	\N	t
00430000-5677-b880-e84e-acd34ed75ba4	praznik dela	1	5	\N	t
00430000-5677-b880-1b89-00a66c9d91c1	praznik dela	2	5	\N	t
00430000-5677-b880-a7f7-7cd67687a00f	dan Primoža Trubarja	8	6	\N	f
00430000-5677-b880-72c5-9c96161354d5	dan državnosti	25	6	\N	t
00430000-5677-b880-d2f0-5b5bbdf796de	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5677-b880-a40a-53a419e32f98	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5677-b880-c057-0b4f55f96f68	dan suverenosti	25	10	\N	f
00430000-5677-b880-a076-a13e1f67418d	dan spomina na mrtve	1	11	\N	t
00430000-5677-b880-a82a-07cc4a3fabb0	dan Rudolfa Maistra	23	11	\N	f
00430000-5677-b880-b166-250079f0d515	božič	25	12	\N	t
00430000-5677-b880-1b21-dd3e2126a2f9	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5677-b880-aad0-3ea8fb0523f6	Marijino vnebovzetje	15	8	\N	t
00430000-5677-b880-2f32-264c546fdb84	dan reformacije	31	10	\N	t
00430000-5677-b880-e978-d919c598fe6c	velikonočna nedelja	27	3	2016	t
00430000-5677-b880-6751-5216e11fae5f	velikonočna nedelja	16	4	2017	t
00430000-5677-b880-d51a-fb87b21df460	velikonočna nedelja	1	4	2018	t
00430000-5677-b880-1d66-1768f1bf3276	velikonočna nedelja	21	4	2019	t
00430000-5677-b880-1570-53e579c75bd4	velikonočna nedelja	12	4	2020	t
00430000-5677-b880-4356-86f66aafc38a	velikonočna nedelja	4	4	2021	t
00430000-5677-b880-aa0c-f929aeb993f0	velikonočna nedelja	17	4	2022	t
00430000-5677-b880-9450-3b4d667ce169	velikonočna nedelja	9	4	2023	t
00430000-5677-b880-1f1b-95de1f866d1f	velikonočna nedelja	31	3	2024	t
00430000-5677-b880-2a36-8225ebb7453c	velikonočna nedelja	20	4	2025	t
00430000-5677-b880-5903-02ffde0ce0f1	velikonočna nedelja	5	4	2026	t
00430000-5677-b880-96f4-317a0ada5e26	velikonočna nedelja	28	3	2027	t
00430000-5677-b880-40cb-ea310dd59720	velikonočna nedelja	16	4	2028	t
00430000-5677-b880-59fe-7abc9c8022b7	velikonočna nedelja	1	4	2029	t
00430000-5677-b880-1eb7-5fa48900ce6b	velikonočna nedelja	21	4	2030	t
00430000-5677-b880-2bfa-41fbea93400b	velikonočni ponedeljek	28	3	2016	t
00430000-5677-b880-0632-ef2c59997b16	velikonočni ponedeljek	17	4	2017	t
00430000-5677-b880-ad11-705ab133c8bf	velikonočni ponedeljek	2	4	2018	t
00430000-5677-b880-a445-aef17ad6aec9	velikonočni ponedeljek	22	4	2019	t
00430000-5677-b880-9993-d7065d79d322	velikonočni ponedeljek	13	4	2020	t
00430000-5677-b880-868f-f24888308a81	velikonočni ponedeljek	5	4	2021	t
00430000-5677-b880-74d5-a51cefeae27f	velikonočni ponedeljek	18	4	2022	t
00430000-5677-b880-77c9-e11ef8067bb2	velikonočni ponedeljek	10	4	2023	t
00430000-5677-b880-3a4f-f3b738a498a9	velikonočni ponedeljek	1	4	2024	t
00430000-5677-b880-f41e-9c023b3983c3	velikonočni ponedeljek	21	4	2025	t
00430000-5677-b880-f14e-e0b95ec25a92	velikonočni ponedeljek	6	4	2026	t
00430000-5677-b880-8711-ae39c9e91161	velikonočni ponedeljek	29	3	2027	t
00430000-5677-b880-7c11-a143bd82d6e7	velikonočni ponedeljek	17	4	2028	t
00430000-5677-b880-5519-8129da55f783	velikonočni ponedeljek	2	4	2029	t
00430000-5677-b880-39ad-da19be6207e8	velikonočni ponedeljek	22	4	2030	t
00430000-5677-b880-edc0-b4c40d4f3bc5	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5677-b880-7040-88d2f1e44562	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5677-b880-93b4-024beed7c18f	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5677-b880-c7ea-857e33569ac1	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5677-b880-2e09-c38de0fe23ea	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5677-b880-93f8-03bccf69b18e	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5677-b880-fdd0-822dce5b231a	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5677-b880-7da2-4eea2baae718	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5677-b880-6cc0-8751625c816d	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5677-b880-727f-769fb2ec7975	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5677-b880-45d8-e6743230921b	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5677-b880-0c41-8fef5411c7b9	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5677-b880-4e53-ee991a766e3c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5677-b880-4430-9b0f63572f83	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5677-b880-bfcb-e5c39adacb58	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32855087)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32855099)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32855247)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32855685)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32855695)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5677-b883-ce2a-3d00d8145575	00080000-5677-b883-d650-15b8c78825ad	0987	AK
00190000-5677-b883-9587-743b3d67dd6b	00080000-5677-b883-d57f-d788498c4abf	0989	AK
00190000-5677-b883-544b-ae4262d46332	00080000-5677-b883-8eeb-58764086a537	0986	AK
00190000-5677-b883-ff54-1e3e519819de	00080000-5677-b883-5168-5ccc57822805	0984	AK
00190000-5677-b883-62d3-51ed613b0bc4	00080000-5677-b883-23fc-0cbce7001181	0983	AK
00190000-5677-b883-f163-35d3b8daaa75	00080000-5677-b883-f61f-b993bcc076e5	0982	AK
00190000-5677-b884-180c-6790047f38c6	00080000-5677-b884-dc07-c32faa40631d	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32855584)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5677-b883-47ff-1ed98f84b2e4	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32855703)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32855276)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5677-b882-8b3a-e6415273e989	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5677-b882-8de8-bc075a816cb7	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5677-b882-76bc-39e5f634a171	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5677-b882-75bf-7f746ddee355	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5677-b882-0f93-1a658ccf502a	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5677-b882-3cd8-f2eb172cdbc6	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5677-b882-a468-9b97ba1b0030	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32855220)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32855210)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32855422)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32855352)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32855061)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32854823)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5677-b884-dc07-c32faa40631d	00010000-5677-b881-5376-b568754978c7	2015-12-21 09:29:56	INS	a:0:{}
2	App\\Entity\\Option	00000000-5677-b884-93a5-be7030e41936	00010000-5677-b881-5376-b568754978c7	2015-12-21 09:29:56	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5677-b884-180c-6790047f38c6	00010000-5677-b881-5376-b568754978c7	2015-12-21 09:29:56	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32855289)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32854861)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5677-b880-558e-57f01158f43a	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5677-b880-874b-71ae49d0ef06	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5677-b880-30de-87346a6edd3d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5677-b880-d129-a3865ae53824	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5677-b880-d029-6c2423180960	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5677-b880-8635-f4fac6a46fea	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5677-b880-e102-838ad54ed858	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5677-b880-1d93-6385c5662025	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5677-b880-2528-e38666b99bad	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5677-b881-3dea-c9b4485d0549	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5677-b881-bfb3-624ad0e10254	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5677-b881-797c-6f05d6786a22	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5677-b881-dfb7-27295a521d94	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5677-b881-ce44-2252b86fa2f7	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5677-b881-2fdc-f6a2adb1bf70	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5677-b881-691b-bc264731489d	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5677-b881-3833-e77abd4dde26	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5677-b881-e32a-a09dbf737ad8	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5677-b881-3fc3-02150bc1f124	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5677-b881-1df4-4e92a7073417	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5677-b881-7ef9-8d625045f98e	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5677-b881-22f4-33bba25c3ba5	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5677-b881-22eb-4547d79efccc	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5677-b881-978c-27471ef12d52	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5677-b881-9d99-4f2db58ca1be	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5677-b881-1a83-601e005b8efc	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5677-b881-a505-5fd753dd267c	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5677-b881-d26a-474d42ca9cd1	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5677-b881-6107-5043b4784ada	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5677-b881-43ff-79666602955d	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5677-b881-b554-3895c6d95f86	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5677-b881-b027-efd4764422b4	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5677-b881-808f-00572fea7014	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5677-b881-cb9f-5f69626b6530	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5677-b881-5f7d-6870bc263517	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5677-b881-8dea-31fefef45c4a	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5677-b881-0d5d-0492bf094683	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5677-b881-5163-45fd2b773f2c	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5677-b881-8459-d17787e99019	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5677-b881-eda7-cb6d01eb003d	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5677-b881-9098-53de9f57690e	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5677-b881-913f-de97ea952a0e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5677-b881-106b-ab82d562c44c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5677-b881-06ee-38e6b8fa377d	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5677-b881-9d5c-4312ba6b4537	direktor	minimalne pravice za direktorja	t
00020000-5677-b881-400e-9a6e63e81518	arhivar	arhivar	t
00020000-5677-b881-17e4-0c6e1e76695a	dramaturg	dramaturg	t
00020000-5677-b881-dbe6-de6bf505c024	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5677-b881-f192-48de0d51e897	poslovni-sekretar	poslovni sekretar	t
00020000-5677-b881-ba47-bb8ffffc8372	vodja-tehnike	vodja tehnike	t
00020000-5677-b881-c356-1c27d9f4a489	racunovodja	računovodja	t
00020000-5677-b882-8b76-3474a7b2f457	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5677-b882-00df-c0ad5a154ef1	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-d9bf-3a41858a746c	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-6592-5d3f61cbdbe8	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-c025-ec9d8ed0e0b5	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-5026-37a7f933a489	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-5e90-04d3df08ac8d	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-6f3f-92c4bc001b2e	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5677-b882-4cb8-b64bf9d00363	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5677-b882-9686-2b8b63ce14e2	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-0e4e-5eacbf38d6c6	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-4505-00a026723d98	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-73b1-f35bde6ead82	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-6b75-70bb4737ebca	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-9a10-2f6aa67e7215	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-c615-3a4b203e426f	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-22fb-9fe227bc0e92	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-99af-b8daed2871b2	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-a38e-0acea305daae	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-7bf4-013f0cb1c76c	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5677-b882-26e1-7b663b22c3b1	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-3627-4e127fa3a6c0	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-d553-0667d8810860	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-6d0c-a1dfbb42da98	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-9a7e-fc900e05b3be	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-58bc-42bbb92a80a5	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-f879-536d358a2814	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-f25a-f630394f3f15	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-13e8-0f31f6bd6501	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-2457-2906bdaa90c1	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-d28b-e9dd36186af6	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-ae30-a36d63074f17	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-6aa6-0b507c98f599	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-d147-167bb7855b86	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-9eeb-fab1ad204f54	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-4071-64306ec958d8	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5677-b882-ae7f-a34e0c0a70ca	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5677-b882-0602-12f3c343a28a	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5677-b882-5711-f580ffad9c2a	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32854845)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5677-b881-ce0f-d841752054d1	00020000-5677-b880-30de-87346a6edd3d
00010000-5677-b881-5376-b568754978c7	00020000-5677-b880-30de-87346a6edd3d
00010000-5677-b883-eaff-3faa129366dd	00020000-5677-b882-8b76-3474a7b2f457
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-00df-c0ad5a154ef1
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-5026-37a7f933a489
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-9686-2b8b63ce14e2
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-4505-00a026723d98
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-6b75-70bb4737ebca
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-a38e-0acea305daae
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-6592-5d3f61cbdbe8
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-26e1-7b663b22c3b1
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-6d0c-a1dfbb42da98
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-58bc-42bbb92a80a5
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-f25a-f630394f3f15
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-2457-2906bdaa90c1
00010000-5677-b883-6648-9058398560c2	00020000-5677-b882-d147-167bb7855b86
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-00df-c0ad5a154ef1
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-d9bf-3a41858a746c
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-6592-5d3f61cbdbe8
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-c025-ec9d8ed0e0b5
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-6b75-70bb4737ebca
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-22fb-9fe227bc0e92
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-26e1-7b663b22c3b1
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-6d0c-a1dfbb42da98
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-58bc-42bbb92a80a5
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-f25a-f630394f3f15
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-2457-2906bdaa90c1
00010000-5677-b883-8fc4-f9d5283f8ce0	00020000-5677-b882-d147-167bb7855b86
00010000-5677-b883-83fd-be254f9515fa	00020000-5677-b882-00df-c0ad5a154ef1
00010000-5677-b883-83fd-be254f9515fa	00020000-5677-b882-d9bf-3a41858a746c
00010000-5677-b883-83fd-be254f9515fa	00020000-5677-b882-6592-5d3f61cbdbe8
00010000-5677-b883-83fd-be254f9515fa	00020000-5677-b882-c025-ec9d8ed0e0b5
00010000-5677-b883-83fd-be254f9515fa	00020000-5677-b882-4505-00a026723d98
00010000-5677-b883-83fd-be254f9515fa	00020000-5677-b882-6b75-70bb4737ebca
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-d9bf-3a41858a746c
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-5e90-04d3df08ac8d
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-0e4e-5eacbf38d6c6
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-73b1-f35bde6ead82
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-4505-00a026723d98
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-99af-b8daed2871b2
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-6b75-70bb4737ebca
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-9a10-2f6aa67e7215
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-26e1-7b663b22c3b1
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-3627-4e127fa3a6c0
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-6d0c-a1dfbb42da98
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-9a7e-fc900e05b3be
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-58bc-42bbb92a80a5
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-f879-536d358a2814
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-f25a-f630394f3f15
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-13e8-0f31f6bd6501
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-2457-2906bdaa90c1
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-d28b-e9dd36186af6
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-d147-167bb7855b86
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-9eeb-fab1ad204f54
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-ae7f-a34e0c0a70ca
00010000-5677-b883-589f-ebbaa973e4ac	00020000-5677-b882-0602-12f3c343a28a
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-d9bf-3a41858a746c
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-5e90-04d3df08ac8d
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-4cb8-b64bf9d00363
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-0e4e-5eacbf38d6c6
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-73b1-f35bde6ead82
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-4505-00a026723d98
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-99af-b8daed2871b2
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-6b75-70bb4737ebca
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-9a10-2f6aa67e7215
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-c615-3a4b203e426f
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-26e1-7b663b22c3b1
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-3627-4e127fa3a6c0
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-d553-0667d8810860
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-6d0c-a1dfbb42da98
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-9a7e-fc900e05b3be
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-58bc-42bbb92a80a5
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-f879-536d358a2814
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-f25a-f630394f3f15
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-13e8-0f31f6bd6501
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-2457-2906bdaa90c1
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-d28b-e9dd36186af6
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-d147-167bb7855b86
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-9eeb-fab1ad204f54
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-4071-64306ec958d8
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-ae7f-a34e0c0a70ca
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-0602-12f3c343a28a
00010000-5677-b883-84a9-4781fa7032c2	00020000-5677-b882-5711-f580ffad9c2a
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-d9bf-3a41858a746c
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-6592-5d3f61cbdbe8
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-5e90-04d3df08ac8d
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-6f3f-92c4bc001b2e
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-4cb8-b64bf9d00363
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-5026-37a7f933a489
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-0e4e-5eacbf38d6c6
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-73b1-f35bde6ead82
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-4505-00a026723d98
00010000-5677-b883-9b2f-f6c46b58c3f2	00020000-5677-b882-99af-b8daed2871b2
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-00df-c0ad5a154ef1
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-c025-ec9d8ed0e0b5
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-5026-37a7f933a489
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-9686-2b8b63ce14e2
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-4505-00a026723d98
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-6b75-70bb4737ebca
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-a38e-0acea305daae
00010000-5677-b883-0b28-cf61c4191b8c	00020000-5677-b882-ae30-a36d63074f17
00010000-5677-b883-f3af-c62de4ec4336	00020000-5677-b882-7bf4-013f0cb1c76c
00010000-5677-b883-e257-77bebecb54a2	00020000-5677-b881-9d5c-4312ba6b4537
00010000-5677-b883-c45d-a0b4ab29b54f	00020000-5677-b881-400e-9a6e63e81518
00010000-5677-b883-60ea-9f28fafc770a	00020000-5677-b881-17e4-0c6e1e76695a
00010000-5677-b883-1535-d6c9c3482319	00020000-5677-b881-dbe6-de6bf505c024
00010000-5677-b883-6a2b-6789c9437f27	00020000-5677-b881-f192-48de0d51e897
00010000-5677-b883-653f-1ca015e34d08	00020000-5677-b881-ba47-bb8ffffc8372
00010000-5677-b883-82ee-a3cf24ffb864	00020000-5677-b881-c356-1c27d9f4a489
\.


--
-- TOC entry 3157 (class 0 OID 32855303)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32855241)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32855187)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5677-b882-ce3d-98dde4954aa5	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5677-b882-3e20-dd9dc7f8066f	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5677-b882-2aa7-09814e4e4a53	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32854810)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5677-b880-b799-80b854751b7c	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5677-b880-f78a-5ff3b6d8e9ef	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5677-b880-5392-cb395c58ddbb	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5677-b880-121e-d1414eed8216	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5677-b880-e31c-d66bddc911c8	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32854802)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5677-b880-e89c-af6776e758ce	00230000-5677-b880-121e-d1414eed8216	popa
00240000-5677-b880-e209-c35f1037060f	00230000-5677-b880-121e-d1414eed8216	oseba
00240000-5677-b880-106c-a4aab05206b5	00230000-5677-b880-121e-d1414eed8216	tippopa
00240000-5677-b880-2192-6cfe8a5bc132	00230000-5677-b880-121e-d1414eed8216	organizacijskaenota
00240000-5677-b880-e32e-52bc0682ba0e	00230000-5677-b880-121e-d1414eed8216	sezona
00240000-5677-b880-505e-532a73121227	00230000-5677-b880-121e-d1414eed8216	tipvaje
00240000-5677-b880-5ecf-e8fa840de36a	00230000-5677-b880-f78a-5ff3b6d8e9ef	prostor
00240000-5677-b880-77c0-a5bc461b3fad	00230000-5677-b880-121e-d1414eed8216	besedilo
00240000-5677-b880-5e80-d60bd9b7ca16	00230000-5677-b880-121e-d1414eed8216	uprizoritev
00240000-5677-b880-af32-f4cf092127ea	00230000-5677-b880-121e-d1414eed8216	funkcija
00240000-5677-b880-59de-6fc798124849	00230000-5677-b880-121e-d1414eed8216	tipfunkcije
00240000-5677-b880-2565-ad182610a7ca	00230000-5677-b880-121e-d1414eed8216	alternacija
00240000-5677-b880-a476-554d8d40f54f	00230000-5677-b880-b799-80b854751b7c	pogodba
00240000-5677-b880-aa5e-993b9142dd18	00230000-5677-b880-121e-d1414eed8216	zaposlitev
00240000-5677-b880-6d16-f2732c10fca0	00230000-5677-b880-121e-d1414eed8216	zvrstuprizoritve
00240000-5677-b880-675c-ecdb10d149c0	00230000-5677-b880-b799-80b854751b7c	programdela
00240000-5677-b880-bb11-d38984e35162	00230000-5677-b880-121e-d1414eed8216	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32854797)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
e309f803-211b-46f0-98b0-6ced2a511e63	00240000-5677-b880-e89c-af6776e758ce	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32855369)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5677-b883-bdfd-8eede6e87a99	000e0000-5677-b883-ffad-0a2c03c7b8bb	00080000-5677-b883-624e-07707265a449	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5677-b880-0152-45cb80d4daf2
00270000-5677-b883-0792-57d8e413503c	000e0000-5677-b883-ffad-0a2c03c7b8bb	00080000-5677-b883-624e-07707265a449	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5677-b880-0152-45cb80d4daf2
\.


--
-- TOC entry 3122 (class 0 OID 32854945)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32855197)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5677-b883-64ae-5b3e244606dd	00180000-5677-b883-7de8-a29865b9fd3c	000c0000-5677-b883-17ec-377c24ef3f15	00090000-5677-b883-d78e-7c99203ca372	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5677-b883-9736-d666b1f2a2fc	00180000-5677-b883-7de8-a29865b9fd3c	000c0000-5677-b883-0505-b4ac95023090	00090000-5677-b883-5b55-59e69ea93662	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5677-b883-f748-dcd7d2091c2d	00180000-5677-b883-7de8-a29865b9fd3c	000c0000-5677-b883-2937-d451731e6fe2	00090000-5677-b883-7fb3-82ce54432497	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5677-b883-7f0b-00cb757551a5	00180000-5677-b883-7de8-a29865b9fd3c	000c0000-5677-b883-ab50-66d8dde31197	00090000-5677-b883-ef5f-0e420df0e9c8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5677-b883-d004-3ee9d5fe5e37	00180000-5677-b883-7de8-a29865b9fd3c	000c0000-5677-b883-081f-902b118099da	00090000-5677-b883-fc5a-f370ac770645	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5677-b883-e06e-787ffdd91c2e	00180000-5677-b883-1afa-da7c791473ce	\N	00090000-5677-b883-fc5a-f370ac770645	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5677-b883-d16d-1c322b586425	00180000-5677-b883-1afa-da7c791473ce	\N	00090000-5677-b883-5b55-59e69ea93662	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32855410)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5677-b880-c849-a580a68e5f99	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5677-b880-9040-56857307a739	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5677-b880-9cc6-dcce5c304be2	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5677-b880-3beb-70291523a4c0	04	Režija	Režija	Režija	umetnik	30
000f0000-5677-b880-136a-f7ff40ec713c	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5677-b880-50f0-5c1a7b7a099c	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5677-b880-1bc2-005ce3035e14	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5677-b880-2b99-09ad125449e8	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5677-b880-2745-78c4ea745199	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5677-b880-b0e0-7ebc7a82b395	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5677-b880-0266-6f3b52cf0673	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5677-b880-b159-44c519e6f511	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5677-b880-0002-a81586099698	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5677-b880-e8a2-f27f5065224d	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5677-b880-1840-494de3fe9c47	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5677-b880-deb0-ad5b59603cac	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5677-b880-8a05-b54ef4820be5	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5677-b880-a37d-4f441e4f5297	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32854896)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5677-b882-5863-94a800104dc7	0001	šola	osnovna ali srednja šola
00400000-5677-b882-ed30-30a819723e58	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5677-b882-5877-e87e1260a52b	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32855715)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5677-b880-1767-0fe984acda2d	01	Velika predstava	f	1.00	1.00
002b0000-5677-b880-6019-face68230ffa	02	Mala predstava	f	0.50	0.50
002b0000-5677-b880-1f70-b28af17e0e74	03	Mala koprodukcija	t	0.40	1.00
002b0000-5677-b880-42b8-51333c9fc0cd	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5677-b880-0e47-c497164f739c	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32855177)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5677-b880-9447-d836f472a711	0001	prva vaja	prva vaja
00420000-5677-b880-2c6c-80cc1e5be227	0002	tehnična vaja	tehnična vaja
00420000-5677-b880-e9d9-a1ed13402d69	0003	lučna vaja	lučna vaja
00420000-5677-b880-06e1-0c2299f3a959	0004	kostumska vaja	kostumska vaja
00420000-5677-b880-5e4d-5c42334b9b05	0005	foto vaja	foto vaja
00420000-5677-b880-608e-2cba245cf267	0006	1. glavna vaja	1. glavna vaja
00420000-5677-b880-78cd-51eda07ac6b1	0007	2. glavna vaja	2. glavna vaja
00420000-5677-b880-8b48-69d44dca1821	0008	1. generalka	1. generalka
00420000-5677-b880-ef2a-697d5214eec6	0009	2. generalka	2. generalka
00420000-5677-b880-8c0a-e0dc1745a977	0010	odprta generalka	odprta generalka
00420000-5677-b880-7dbb-1e0a72f369a6	0011	obnovitvena vaja	obnovitvena vaja
00420000-5677-b880-cdd7-3e9c02731e9f	0012	italijanka	krajša "obnovitvena" vaja
00420000-5677-b880-e514-b202d941b70c	0013	pevska vaja	pevska vaja
00420000-5677-b880-ac08-1ad4b65ad1d1	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5677-b880-9295-93b132b2c84e	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32855018)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32854832)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5677-b881-5376-b568754978c7	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROXowmzIM/yd8ym13ENTQd1qF.jhS2/V6	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5677-b882-8491-8838d4a34301	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5677-b882-974c-7770fbd68683	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5677-b883-87c9-556d0d73c095	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5677-b883-7f7d-39d236c64651	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5677-b883-39ed-11752a7111d4	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5677-b883-f958-1675277bc428	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5677-b883-0895-9ba72ec52206	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5677-b883-f73f-becdae8ee04e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5677-b883-8722-aaaab757e37d	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5677-b883-eaff-3faa129366dd	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5677-b883-a470-b9f3a9c03452	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5677-b883-6648-9058398560c2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5677-b883-8fc4-f9d5283f8ce0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5677-b883-83fd-be254f9515fa	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5677-b883-589f-ebbaa973e4ac	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5677-b883-84a9-4781fa7032c2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5677-b883-9b2f-f6c46b58c3f2	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5677-b883-0b28-cf61c4191b8c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5677-b883-f3af-c62de4ec4336	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5677-b883-e257-77bebecb54a2	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5677-b883-c45d-a0b4ab29b54f	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5677-b883-60ea-9f28fafc770a	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5677-b883-1535-d6c9c3482319	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5677-b883-6a2b-6789c9437f27	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5677-b883-653f-1ca015e34d08	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5677-b883-82ee-a3cf24ffb864	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5677-b881-ce0f-d841752054d1	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32855460)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5677-b883-9e44-227cdce81ebb	00160000-5677-b882-6bec-5e4458a2dd4e	\N	00140000-5677-b880-2f61-170c7300519c	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5677-b882-0f93-1a658ccf502a
000e0000-5677-b883-ffad-0a2c03c7b8bb	00160000-5677-b882-4b17-6246cb8cb9ed	\N	00140000-5677-b880-4bd5-00e3c386df16	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5677-b882-3cd8-f2eb172cdbc6
000e0000-5677-b883-2efd-ba508766c47d	\N	\N	00140000-5677-b880-4bd5-00e3c386df16	00190000-5677-b883-ce2a-3d00d8145575	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5677-b882-0f93-1a658ccf502a
000e0000-5677-b883-c529-d44f57a2aa24	\N	\N	00140000-5677-b880-4bd5-00e3c386df16	00190000-5677-b883-ce2a-3d00d8145575	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5677-b882-0f93-1a658ccf502a
000e0000-5677-b883-1358-97b359d8b72d	\N	\N	00140000-5677-b880-4bd5-00e3c386df16	00190000-5677-b883-ce2a-3d00d8145575	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5677-b882-8b3a-e6415273e989
000e0000-5677-b883-badf-3b34a71123c5	\N	\N	00140000-5677-b880-4bd5-00e3c386df16	00190000-5677-b883-ce2a-3d00d8145575	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5677-b882-8b3a-e6415273e989
\.


--
-- TOC entry 3136 (class 0 OID 32855117)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5677-b883-1956-092be55c1190	\N	000e0000-5677-b883-ffad-0a2c03c7b8bb	1	
00200000-5677-b883-4421-1acaf5eeb2f7	\N	000e0000-5677-b883-ffad-0a2c03c7b8bb	2	
00200000-5677-b883-0dde-bc79f2229de5	\N	000e0000-5677-b883-ffad-0a2c03c7b8bb	3	
00200000-5677-b883-79f2-8eda0eb044f2	\N	000e0000-5677-b883-ffad-0a2c03c7b8bb	4	
00200000-5677-b883-fdff-7fc873805db3	\N	000e0000-5677-b883-ffad-0a2c03c7b8bb	5	
\.


--
-- TOC entry 3153 (class 0 OID 32855268)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32855383)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5677-b880-c939-f568b74576c1	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5677-b880-3bcc-b2a2269766b8	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5677-b880-ad07-a20cc86da8a9	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5677-b880-84b8-0cfa4bf6f682	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5677-b880-4a5a-6e599c72284d	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5677-b880-c6d0-89f9e04fe9b1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5677-b880-b155-f03666e13f2f	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5677-b880-0606-6c11a845c826	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5677-b880-0152-45cb80d4daf2	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5677-b880-21d9-3b392be4504b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5677-b880-2153-5959defbc4fb	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5677-b880-7507-ede15a6bb6a8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5677-b880-1d4d-20f2841dca68	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5677-b880-257a-7c6eca2cd67e	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5677-b880-f362-6184d5f27269	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5677-b880-216e-9c3b350511e8	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5677-b880-ab26-736d9fdc9ff9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5677-b880-4f68-c3bf85b0ffe0	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5677-b880-e6ba-4fe997825826	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5677-b880-343c-039fbe23b417	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5677-b880-1236-8814b2782b63	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5677-b880-1c1e-f70de9bad5a0	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5677-b880-81d9-af96d3fe0153	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5677-b880-2fd3-5fee666ff66b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5677-b880-d1c2-e0283107fdab	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5677-b880-a4fb-221e3b2be836	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5677-b880-d897-6a520e49f17f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5677-b880-87b1-84c5b60984f0	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32855765)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32855734)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32855777)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32855341)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5677-b883-0e15-8e6162835f35	00090000-5677-b883-5b55-59e69ea93662	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5677-b883-5136-e61707f9a58c	00090000-5677-b883-7fb3-82ce54432497	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5677-b883-fa94-fb697b3e2bca	00090000-5677-b883-7723-a71bc46e474e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5677-b883-a673-525ec5e00967	00090000-5677-b883-e231-64d816c4eb5b	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5677-b883-77e3-d83c882426a9	00090000-5677-b883-f36f-578bfb5779ea	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5677-b883-9545-504d009240ba	00090000-5677-b883-51da-29c860e1521d	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32855161)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32855450)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5677-b880-2f61-170c7300519c	01	Drama	drama (SURS 01)
00140000-5677-b880-5ba6-cce10fd05188	02	Opera	opera (SURS 02)
00140000-5677-b880-c030-6fc485506d4b	03	Balet	balet (SURS 03)
00140000-5677-b880-5e92-c2a3c21feea1	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5677-b880-526c-0a1f17c92680	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5677-b880-4bd5-00e3c386df16	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5677-b880-a35a-16b5cef190ef	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32855331)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32854895)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32855509)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32855499)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32854886)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32855366)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32855408)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32855818)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32855149)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32855171)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32855176)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32855732)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32855044)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32855578)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32855327)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32855115)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32855082)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32855058)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32855233)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32855795)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32855802)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32855826)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 32822017)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2739 (class 2606 OID 32855260)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32855016)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32854914)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32854978)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32854941)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32854875)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32854860)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32855266)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32855302)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32855445)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32854969)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32855004)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32855683)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32855239)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32854994)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32855134)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32855103)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32855095)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32855251)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32855692)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32855700)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32855670)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32855713)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32855284)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32855224)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32855215)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32855432)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32855359)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32855070)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32854831)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32855293)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32854849)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32854869)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32855311)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32855246)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32855195)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32854819)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32854807)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32854801)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32855379)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32854950)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32855206)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32855419)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32854903)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32855725)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32855184)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32855029)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32854844)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32855478)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32855124)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32855274)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32855391)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32855775)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32855759)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32855783)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32855349)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32855165)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32855458)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32855339)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32855159)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32855160)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32855158)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32855157)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32855156)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32855380)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32855381)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32855382)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32855797)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32855796)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32854971)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32854972)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32855267)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32855763)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32855762)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32855764)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32855761)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32855760)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32855253)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32855252)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32855125)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32855126)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32855328)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32855330)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32855329)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32855060)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32855059)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32855714)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32855447)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32855448)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32855449)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32855784)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32855483)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32855480)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32855484)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32855482)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32855481)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32855031)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32855030)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32854944)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32855294)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32854876)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32854877)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32855314)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32855313)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32855312)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32854981)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32854980)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32854982)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32855098)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32855096)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32855097)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32854809)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32855219)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32855217)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32855216)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32855218)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32854850)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32854851)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32855275)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32855819)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32855368)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32855367)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32855827)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32855828)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32855240)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32855360)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32855361)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32855583)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32855582)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32855579)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32855580)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32855581)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32854996)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32854995)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32854997)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32855288)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32855287)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32855693)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32855694)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32855513)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32855514)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32855511)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32855512)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32855350)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32855351)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32855228)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32855227)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32855225)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32855226)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32855501)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32855500)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32855071)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32855085)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32855084)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32855083)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32855086)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32855116)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32855104)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32855105)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32855684)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32855733)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32855803)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32855804)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32854916)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32854915)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32854951)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32854952)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32855166)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32855209)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32855208)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32855207)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32855151)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32855152)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32855155)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32855150)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32855154)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32855153)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32854970)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32854904)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32854905)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32855045)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32855047)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32855046)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32855048)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32855234)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32855446)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32855479)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32855420)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32855421)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32854942)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32854943)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32855340)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32854820)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32855017)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32854979)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32854808)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32855726)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32855286)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32855285)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32855185)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32855186)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32855510)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32855005)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32855459)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32855776)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32855701)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32855702)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32855409)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32855196)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32854870)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2917 (class 2606 OID 32855999)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2918 (class 2606 OID 32856004)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2923 (class 2606 OID 32856029)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2921 (class 2606 OID 32856019)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2916 (class 2606 OID 32855994)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2920 (class 2606 OID 32856014)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2922 (class 2606 OID 32856024)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2919 (class 2606 OID 32856009)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 32856199)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32856204)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 32856209)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 32856374)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2991 (class 2606 OID 32856369)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2894 (class 2606 OID 32855884)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2895 (class 2606 OID 32855889)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32856114)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2988 (class 2606 OID 32856354)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32856349)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2989 (class 2606 OID 32856359)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 32856344)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2985 (class 2606 OID 32856339)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2939 (class 2606 OID 32856109)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2938 (class 2606 OID 32856104)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2914 (class 2606 OID 32855984)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2915 (class 2606 OID 32855989)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32856154)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32856164)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32856159)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2905 (class 2606 OID 32855939)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 32855934)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32856094)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32856329)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 32856214)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32856219)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 32856224)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32856364)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2966 (class 2606 OID 32856244)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2963 (class 2606 OID 32856229)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2967 (class 2606 OID 32856249)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32856239)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 32856234)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2903 (class 2606 OID 32855929)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 32855924)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 32855869)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 32855864)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32856134)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 32855844)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 32855849)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2947 (class 2606 OID 32856149)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32856144)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 32856139)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32855899)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 32855894)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2898 (class 2606 OID 32855904)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 32855964)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 32855954)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32855959)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32855829)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2931 (class 2606 OID 32856069)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2929 (class 2606 OID 32856059)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2928 (class 2606 OID 32856054)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2930 (class 2606 OID 32856064)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2884 (class 2606 OID 32855834)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 32855839)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32856119)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32856389)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2956 (class 2606 OID 32856194)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 32856189)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2996 (class 2606 OID 32856394)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2997 (class 2606 OID 32856399)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32856099)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2953 (class 2606 OID 32856179)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2954 (class 2606 OID 32856184)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 32856304)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 32856299)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 32856284)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 32856289)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32856294)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32855914)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32855909)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 32855919)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2943 (class 2606 OID 32856129)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2942 (class 2606 OID 32856124)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32856314)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 32856319)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2972 (class 2606 OID 32856274)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 32856279)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2970 (class 2606 OID 32856264)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2971 (class 2606 OID 32856269)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 32856169)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2952 (class 2606 OID 32856174)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2935 (class 2606 OID 32856089)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2934 (class 2606 OID 32856084)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 32856074)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2933 (class 2606 OID 32856079)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2969 (class 2606 OID 32856259)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 32856254)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32855944)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32855949)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32855979)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2911 (class 2606 OID 32855969)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 32855974)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32856309)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32856324)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32856334)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2993 (class 2606 OID 32856379)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2994 (class 2606 OID 32856384)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 32855859)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 32855854)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2892 (class 2606 OID 32855874)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 32855879)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32856034)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 32856049)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32856044)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 32856039)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-21 09:29:58 CET

--
-- PostgreSQL database dump complete
--

