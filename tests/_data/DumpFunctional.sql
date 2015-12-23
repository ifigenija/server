--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-23 13:47:04 CET

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
-- TOC entry 183 (class 1259 OID 32864569)
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
-- TOC entry 237 (class 1259 OID 32865184)
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
-- TOC entry 236 (class 1259 OID 32865167)
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
-- TOC entry 182 (class 1259 OID 32864562)
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
-- TOC entry 181 (class 1259 OID 32864560)
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
-- TOC entry 227 (class 1259 OID 32865044)
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
-- TOC entry 230 (class 1259 OID 32865074)
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
-- TOC entry 251 (class 1259 OID 32865487)
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
-- TOC entry 203 (class 1259 OID 32864817)
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
-- TOC entry 205 (class 1259 OID 32864849)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 32864854)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 32865409)
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
-- TOC entry 194 (class 1259 OID 32864714)
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
-- TOC entry 238 (class 1259 OID 32865197)
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
-- TOC entry 223 (class 1259 OID 32864997)
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
-- TOC entry 200 (class 1259 OID 32864788)
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
-- TOC entry 197 (class 1259 OID 32864754)
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
-- TOC entry 195 (class 1259 OID 32864731)
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
-- TOC entry 212 (class 1259 OID 32864911)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 32865467)
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
-- TOC entry 250 (class 1259 OID 32865480)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 32865502)
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
-- TOC entry 216 (class 1259 OID 32864936)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 32864688)
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
-- TOC entry 185 (class 1259 OID 32864588)
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
-- TOC entry 189 (class 1259 OID 32864655)
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
-- TOC entry 186 (class 1259 OID 32864599)
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
-- TOC entry 178 (class 1259 OID 32864534)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 32864553)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 32864943)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 32864977)
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
-- TOC entry 233 (class 1259 OID 32865115)
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
-- TOC entry 188 (class 1259 OID 32864635)
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
-- TOC entry 191 (class 1259 OID 32864680)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 32865353)
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
-- TOC entry 213 (class 1259 OID 32864917)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 32864665)
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
-- TOC entry 202 (class 1259 OID 32864809)
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
-- TOC entry 198 (class 1259 OID 32864769)
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
-- TOC entry 199 (class 1259 OID 32864781)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 32864929)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 32865367)
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
-- TOC entry 242 (class 1259 OID 32865377)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 32865266)
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
-- TOC entry 243 (class 1259 OID 32865385)
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
-- TOC entry 219 (class 1259 OID 32864958)
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
-- TOC entry 211 (class 1259 OID 32864902)
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
-- TOC entry 210 (class 1259 OID 32864892)
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
-- TOC entry 232 (class 1259 OID 32865104)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 32865034)
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
-- TOC entry 196 (class 1259 OID 32864743)
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
-- TOC entry 175 (class 1259 OID 32864505)
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
-- TOC entry 174 (class 1259 OID 32864503)
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
-- TOC entry 220 (class 1259 OID 32864971)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 32864543)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 32864527)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 32864985)
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
-- TOC entry 214 (class 1259 OID 32864923)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 32864869)
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
-- TOC entry 173 (class 1259 OID 32864492)
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
-- TOC entry 172 (class 1259 OID 32864484)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 32864479)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 32865051)
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
-- TOC entry 187 (class 1259 OID 32864627)
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
-- TOC entry 209 (class 1259 OID 32864879)
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
-- TOC entry 231 (class 1259 OID 32865092)
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
-- TOC entry 184 (class 1259 OID 32864578)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 32865397)
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
-- TOC entry 207 (class 1259 OID 32864859)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 32864700)
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
-- TOC entry 176 (class 1259 OID 32864514)
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
-- TOC entry 235 (class 1259 OID 32865142)
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
-- TOC entry 201 (class 1259 OID 32864799)
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
-- TOC entry 218 (class 1259 OID 32864950)
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
-- TOC entry 229 (class 1259 OID 32865065)
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
-- TOC entry 247 (class 1259 OID 32865447)
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
-- TOC entry 246 (class 1259 OID 32865416)
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
-- TOC entry 248 (class 1259 OID 32865459)
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
-- TOC entry 225 (class 1259 OID 32865023)
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
-- TOC entry 204 (class 1259 OID 32864843)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 32865132)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 32865013)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 32864565)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 32864508)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 32864569)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-567a-97c5-2e46-8e8bafb336be	10	30	Otroci	Abonma za otroke	200
000a0000-567a-97c5-059f-bab0ef6da0a1	20	60	Mladina	Abonma za mladino	400
000a0000-567a-97c5-ae36-2cd4591246c9	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 32865184)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-567a-97c5-cd95-ef4eee5f4aa9	000d0000-567a-97c5-593f-f49ad4df4ab2	\N	00090000-567a-97c5-4021-0041e60bda79	000b0000-567a-97c5-3c0d-e989c1fb7708	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-567a-97c5-8aa5-946c01c7c96a	000d0000-567a-97c5-7df6-b4818f33ebf6	00100000-567a-97c5-1e17-99dcde1144e2	00090000-567a-97c5-654a-4ef020ba6f9b	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-567a-97c5-104a-aa1ed095d3fd	000d0000-567a-97c5-050c-023f361595fa	00100000-567a-97c5-7361-e445ef22d352	00090000-567a-97c5-3a07-f75ce4c16323	\N	0003	t	\N	2015-12-23	\N	2	t	\N	f	f
000c0000-567a-97c5-7b2e-ef43b45b9848	000d0000-567a-97c5-5079-467d2aa16503	\N	00090000-567a-97c5-85f1-eb5adb1abfb3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-567a-97c5-cc78-922fb9ccde27	000d0000-567a-97c5-a737-bb99c8380034	\N	00090000-567a-97c5-6347-e8393b641664	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-567a-97c5-2e47-3ccde003ec15	000d0000-567a-97c5-ce9a-6bf03cd49a79	\N	00090000-567a-97c5-1acb-615d60391b50	000b0000-567a-97c5-4353-9ac2aec76034	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-567a-97c5-4a2e-a3a6cb81ce6e	000d0000-567a-97c5-2044-d9bb2beb4c7c	00100000-567a-97c5-8e0e-d01a32bb3c46	00090000-567a-97c5-e18c-287ffca7c94e	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-567a-97c5-020a-0672fc46ff0e	000d0000-567a-97c5-d367-d8093fa17cba	\N	00090000-567a-97c5-3e6d-0452bc06d039	000b0000-567a-97c5-f59b-3c29551d1e42	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-567a-97c5-be21-9152e9b87f18	000d0000-567a-97c5-2044-d9bb2beb4c7c	00100000-567a-97c5-2239-7d3718c5cc52	00090000-567a-97c5-b63c-7003c360a4ca	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-567a-97c5-43e8-a241caa2e49e	000d0000-567a-97c5-2044-d9bb2beb4c7c	00100000-567a-97c5-ff94-2668d675e282	00090000-567a-97c5-7ce7-b0a6e6659e2f	\N	0010	t	\N	2015-12-23	\N	16	f	\N	f	t
000c0000-567a-97c5-26b1-e9c737d281be	000d0000-567a-97c5-2044-d9bb2beb4c7c	00100000-567a-97c5-c4f5-c633f80275b1	00090000-567a-97c5-4966-854d4c8ce29b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-567a-97c5-18d5-eeb5ac52466e	000d0000-567a-97c5-98e5-870b5d277e3b	00100000-567a-97c5-1e17-99dcde1144e2	00090000-567a-97c5-654a-4ef020ba6f9b	000b0000-567a-97c5-b7aa-4194f263b6fd	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 32865167)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 32864562)
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
-- TOC entry 3162 (class 0 OID 32865044)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-567a-97c5-b491-8b917033c7b3	00160000-567a-97c4-6b6d-23f14e37494c	00090000-567a-97c5-4281-cccf26b2cf84	aizv	10	t
003d0000-567a-97c5-1b42-f15e1c668090	00160000-567a-97c4-6b6d-23f14e37494c	00090000-567a-97c5-af4a-53cd7747d432	apri	14	t
003d0000-567a-97c5-63e7-b9c79c8c3680	00160000-567a-97c4-de6c-1423ef47da7d	00090000-567a-97c5-defc-8007684fd2a7	aizv	11	t
003d0000-567a-97c5-792a-8e58293a8de9	00160000-567a-97c4-cf42-c91af27b6331	00090000-567a-97c5-f4ae-c1860eeadd28	aizv	12	t
003d0000-567a-97c5-0cac-91a1bbfd5e35	00160000-567a-97c4-6b6d-23f14e37494c	00090000-567a-97c5-2354-f3d8b32140ea	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 32865074)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-567a-97c4-6b6d-23f14e37494c	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-567a-97c4-de6c-1423ef47da7d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-567a-97c4-cf42-c91af27b6331	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 32865487)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 32864817)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-567a-97c5-54b8-a5e3ee6867b3	\N	\N	00200000-567a-97c5-8692-c944b2477b86	\N	\N	\N	00220000-567a-97c4-c8f7-f70e3d31da93	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-567a-97c5-ac70-6c51674cd4d0	\N	\N	00200000-567a-97c5-9bcd-1a01b4f56105	\N	\N	\N	00220000-567a-97c4-c8f7-f70e3d31da93	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-567a-97c5-8df3-de78e924c5de	\N	\N	00200000-567a-97c5-2e02-84e1221eb464	\N	\N	\N	00220000-567a-97c4-4320-e0f2560b9629	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-567a-97c5-d1df-69f678f79d37	\N	\N	00200000-567a-97c5-8b4a-902f568f72cd	\N	\N	\N	00220000-567a-97c4-f357-cc221c817616	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-567a-97c5-e045-0de2361d54a0	\N	\N	00200000-567a-97c5-e0c4-d1c9c2143b52	\N	\N	\N	00220000-567a-97c4-623c-8a2da87d0431	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 32864849)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 32864854)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 32865409)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 32864714)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-567a-97c1-53cd-ba208c5b2530	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-567a-97c1-ea14-9654d2f47afc	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-567a-97c1-0eed-cc235fe96a98	AL	ALB	008	Albania 	Albanija	\N
00040000-567a-97c1-5fa1-bf4c023b10fd	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-567a-97c1-2b56-eb373dc9093a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-567a-97c1-949d-008762138ae0	AD	AND	020	Andorra 	Andora	\N
00040000-567a-97c1-dd4d-89c33ae6e6cc	AO	AGO	024	Angola 	Angola	\N
00040000-567a-97c1-9416-3d594c8343f1	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-567a-97c1-3bf7-1c3fb0d73785	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-567a-97c1-852e-8b1d2b57db91	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-567a-97c1-dee3-eef7c9962078	AR	ARG	032	Argentina 	Argenitna	\N
00040000-567a-97c1-e150-499ad7f05e0e	AM	ARM	051	Armenia 	Armenija	\N
00040000-567a-97c1-3910-687bf5e870f3	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-567a-97c1-1e67-95c62f4f224d	AU	AUS	036	Australia 	Avstralija	\N
00040000-567a-97c1-3e4f-eb5651587ab1	AT	AUT	040	Austria 	Avstrija	\N
00040000-567a-97c1-57bb-98595b82f1f2	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-567a-97c1-8f5a-b69bd06c242d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-567a-97c1-f5fe-fec7dc7c84cc	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-567a-97c1-5617-236a3ed305f9	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-567a-97c1-bffb-2002cddcd7a5	BB	BRB	052	Barbados 	Barbados	\N
00040000-567a-97c1-6335-bc242cc4cc24	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-567a-97c1-8d4e-5b1028ea5e98	BE	BEL	056	Belgium 	Belgija	\N
00040000-567a-97c1-6d55-3b6e89c03ebe	BZ	BLZ	084	Belize 	Belize	\N
00040000-567a-97c1-27a9-bf737c4934fa	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-567a-97c1-43b6-4dbcff1ae1dc	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-567a-97c1-54a9-1b662b585a3c	BT	BTN	064	Bhutan 	Butan	\N
00040000-567a-97c1-b5cc-71bc519d7547	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-567a-97c1-ed93-88cf939c5c8e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-567a-97c1-8723-035b6c78d5c5	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-567a-97c1-c794-6ba49306d003	BW	BWA	072	Botswana 	Bocvana	\N
00040000-567a-97c1-461e-6c637ef8be28	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-567a-97c1-4f51-1b54ca706c6c	BR	BRA	076	Brazil 	Brazilija	\N
00040000-567a-97c1-876b-2d33669cb704	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-567a-97c1-36c8-0eae84e0f183	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-567a-97c1-278c-a8ad1f908367	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-567a-97c1-df51-10f25d6a9d49	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-567a-97c1-1cbb-6203b3b8d325	BI	BDI	108	Burundi 	Burundi 	\N
00040000-567a-97c1-172e-e597e3a537fd	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-567a-97c1-9f5a-f8bdca3c0f3d	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-567a-97c1-4970-208f6176db97	CA	CAN	124	Canada 	Kanada	\N
00040000-567a-97c1-96f9-42d9cb8a860f	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-567a-97c1-a45c-cc5e08270ee4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-567a-97c1-de9d-b6ec415965ef	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-567a-97c1-3ea7-6b4b92e7f323	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-567a-97c1-8f9d-740d3e3af3d7	CL	CHL	152	Chile 	Čile	\N
00040000-567a-97c1-9c01-6b42fb4aba31	CN	CHN	156	China 	Kitajska	\N
00040000-567a-97c1-55ac-8a547a183c54	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-567a-97c1-009e-e23204de9ab6	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-567a-97c1-e9a7-0601d005601d	CO	COL	170	Colombia 	Kolumbija	\N
00040000-567a-97c1-2d53-c62eaea911ff	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-567a-97c1-428d-8948a31a158a	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-567a-97c1-4e33-994d52065282	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-567a-97c1-3d09-56f19087fb97	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-567a-97c1-22f1-802e01792d7d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-567a-97c1-1c4c-cd32c32ae425	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-567a-97c1-1c4d-89f3bd277215	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-567a-97c1-91e7-50a5f36e246f	CU	CUB	192	Cuba 	Kuba	\N
00040000-567a-97c1-971c-7cae41bbcbbd	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-567a-97c1-2c39-b44005920db6	CY	CYP	196	Cyprus 	Ciper	\N
00040000-567a-97c1-d317-88d2eefeee2f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-567a-97c1-ec92-1b1dc8bac578	DK	DNK	208	Denmark 	Danska	\N
00040000-567a-97c1-311a-5942ea203324	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-567a-97c1-cef5-2c7277f617f6	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-567a-97c1-dbeb-af99b3a74d4a	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-567a-97c1-83cd-ca6c3da4ee38	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-567a-97c1-b58e-5b0192b8979b	EG	EGY	818	Egypt 	Egipt	\N
00040000-567a-97c1-965d-47ff9e79b865	SV	SLV	222	El Salvador 	Salvador	\N
00040000-567a-97c1-056f-d983908fd08e	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-567a-97c1-bbad-57ec0071e3e2	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-567a-97c1-736b-612a01b92ec9	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-567a-97c1-146e-eaa25e5dfd41	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-567a-97c1-f428-d3d8a1d56a05	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-567a-97c1-205f-78a6d36029d7	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-567a-97c1-eefa-b368e88cdfaa	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-567a-97c1-3eec-63e21f9695c0	FI	FIN	246	Finland 	Finska	\N
00040000-567a-97c1-7f76-f91e52a48898	FR	FRA	250	France 	Francija	\N
00040000-567a-97c1-8c97-1f6ebcc63711	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-567a-97c1-e06b-eadddf1892e3	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-567a-97c1-3a1b-50697f020c13	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-567a-97c1-9cf5-2dac9f32746d	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-567a-97c1-9d70-89f222c1fbb6	GA	GAB	266	Gabon 	Gabon	\N
00040000-567a-97c1-873f-13775370e804	GM	GMB	270	Gambia 	Gambija	\N
00040000-567a-97c1-e8c2-07716a3fef98	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-567a-97c1-028a-a37f6e1a75f1	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-567a-97c1-c7f3-a7f8f2c76f24	GH	GHA	288	Ghana 	Gana	\N
00040000-567a-97c1-7607-295b64de6055	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-567a-97c1-64a4-9951755991c9	GR	GRC	300	Greece 	Grčija	\N
00040000-567a-97c1-4c6b-24e010be5643	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-567a-97c1-62de-4d39fe04c6da	GD	GRD	308	Grenada 	Grenada	\N
00040000-567a-97c1-0f40-b40cae192185	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-567a-97c1-b470-adf2208a6b9b	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-567a-97c1-4197-16c9a2084d23	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-567a-97c1-c67d-5a3a8897e284	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-567a-97c1-f529-7fee83b4ca78	GN	GIN	324	Guinea 	Gvineja	\N
00040000-567a-97c1-0437-c9be8bdc21e3	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-567a-97c1-39f3-97096a501b7a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-567a-97c1-b4cb-fb9d50ce5e5f	HT	HTI	332	Haiti 	Haiti	\N
00040000-567a-97c1-2df2-5a9c6f91de26	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-567a-97c1-8b8d-15d2a85553fe	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-567a-97c1-5e04-30252d53dc0f	HN	HND	340	Honduras 	Honduras	\N
00040000-567a-97c1-9029-f742267011e4	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-567a-97c1-a17e-df1eda6ed9bf	HU	HUN	348	Hungary 	Madžarska	\N
00040000-567a-97c1-c459-d5203e7d8519	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-567a-97c1-aa4d-3688641cefe7	IN	IND	356	India 	Indija	\N
00040000-567a-97c1-f8bc-5a0b68e7d58f	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-567a-97c1-8b83-16fd6b913347	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-567a-97c1-85c8-16059664a3a9	IQ	IRQ	368	Iraq 	Irak	\N
00040000-567a-97c1-7a35-1eab3906d33b	IE	IRL	372	Ireland 	Irska	\N
00040000-567a-97c1-9435-459fe85cf7d9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-567a-97c1-e658-a78484d0f70a	IL	ISR	376	Israel 	Izrael	\N
00040000-567a-97c1-2a92-f124522439bf	IT	ITA	380	Italy 	Italija	\N
00040000-567a-97c1-c86c-baa834bc3f9e	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-567a-97c1-5be0-497537de83f9	JP	JPN	392	Japan 	Japonska	\N
00040000-567a-97c1-4888-5359a983a14e	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-567a-97c1-ac12-9a8d07144da4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-567a-97c1-599b-e4c3e5f95263	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-567a-97c1-6751-776567ab89cf	KE	KEN	404	Kenya 	Kenija	\N
00040000-567a-97c1-46b9-44955f350c55	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-567a-97c1-6543-83c781696a7b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-567a-97c1-94a0-d780ac32d9c0	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-567a-97c1-e840-5e24988ed1ec	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-567a-97c1-3a29-d3507f48a8cc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-567a-97c1-e336-ba54ad96b2db	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-567a-97c1-81f4-8eba4960c8a2	LV	LVA	428	Latvia 	Latvija	\N
00040000-567a-97c1-feeb-a3c040992e3b	LB	LBN	422	Lebanon 	Libanon	\N
00040000-567a-97c1-ad83-a9b885b2171b	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-567a-97c1-65b4-276cb38d3a59	LR	LBR	430	Liberia 	Liberija	\N
00040000-567a-97c1-19a4-1ad20bc287c7	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-567a-97c1-5f67-348bffcba698	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-567a-97c1-7309-9bd4b4556a8e	LT	LTU	440	Lithuania 	Litva	\N
00040000-567a-97c1-b987-ffda45c160a7	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-567a-97c1-d9db-50f17e538cf2	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-567a-97c1-9004-9efb9b27c114	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-567a-97c1-b9e3-68799dd2335f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-567a-97c1-0f6c-a4180e09be14	MW	MWI	454	Malawi 	Malavi	\N
00040000-567a-97c1-5862-198b59974e6d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-567a-97c1-e352-cd0d872bb1fa	MV	MDV	462	Maldives 	Maldivi	\N
00040000-567a-97c1-1b64-6385937a54aa	ML	MLI	466	Mali 	Mali	\N
00040000-567a-97c1-c912-437417776e00	MT	MLT	470	Malta 	Malta	\N
00040000-567a-97c1-9028-5f109dbdd3ef	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-567a-97c1-c4d4-ad5692a6bde6	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-567a-97c1-c661-78e33235d071	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-567a-97c1-6e69-de9c6f8e3480	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-567a-97c1-87c1-6450d6590ef0	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-567a-97c1-b69e-e4e6873c9487	MX	MEX	484	Mexico 	Mehika	\N
00040000-567a-97c1-4422-6b9209024b13	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-567a-97c1-5e87-6c64b5075e6e	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-567a-97c1-cde5-1f03d80e16e3	MC	MCO	492	Monaco 	Monako	\N
00040000-567a-97c1-83c9-3a3cdd494666	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-567a-97c1-e57f-fb33eae07117	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-567a-97c1-9f54-4ba78d902c95	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-567a-97c1-6669-caa46ee679a2	MA	MAR	504	Morocco 	Maroko	\N
00040000-567a-97c1-d408-e93997befc4b	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-567a-97c1-5404-31aa05d0295b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-567a-97c1-ecb6-2adcbe5eb961	NA	NAM	516	Namibia 	Namibija	\N
00040000-567a-97c1-acc2-1e8226f4a3db	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-567a-97c1-ac1f-26cb239e7271	NP	NPL	524	Nepal 	Nepal	\N
00040000-567a-97c1-dd8e-7fcc56093161	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-567a-97c1-f625-d165e1f662ea	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-567a-97c1-6c60-aa277ecb2ad3	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-567a-97c1-9be6-14af097937e9	NE	NER	562	Niger 	Niger 	\N
00040000-567a-97c1-6351-9c022107a38a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-567a-97c1-7f07-fb52d6f4aa40	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-567a-97c1-4c3c-47b0be26ea55	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-567a-97c1-49a6-494b8978bcde	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-567a-97c1-46d1-bac1e797dc6d	NO	NOR	578	Norway 	Norveška	\N
00040000-567a-97c1-4189-c6e45a9e2ba4	OM	OMN	512	Oman 	Oman	\N
00040000-567a-97c1-770c-c52337b0c83c	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-567a-97c1-65bb-a3f853fbc9e4	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-567a-97c1-c181-05d71729fa5d	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-567a-97c1-c874-405a555216da	PA	PAN	591	Panama 	Panama	\N
00040000-567a-97c1-404c-86cfb881a823	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-567a-97c1-e6ec-6f46f635ca97	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-567a-97c1-2b6c-5598fcdafeba	PE	PER	604	Peru 	Peru	\N
00040000-567a-97c1-c3c3-19cfdf9e7bc9	PH	PHL	608	Philippines 	Filipini	\N
00040000-567a-97c1-785b-124d55f59f52	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-567a-97c1-a5cd-9f31ff1b8109	PL	POL	616	Poland 	Poljska	\N
00040000-567a-97c1-e0ce-b0fea45b1b01	PT	PRT	620	Portugal 	Portugalska	\N
00040000-567a-97c1-f626-7eddb1dbf930	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-567a-97c1-a374-fe8ec5246ef2	QA	QAT	634	Qatar 	Katar	\N
00040000-567a-97c1-35d3-2afe820eaa35	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-567a-97c1-9942-aa8a33a1215e	RO	ROU	642	Romania 	Romunija	\N
00040000-567a-97c1-7b0c-e53d2b4809b7	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-567a-97c1-4fee-8ec191a432e3	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-567a-97c1-a5d8-7827cf67c6aa	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-567a-97c1-1680-c845ced38c4d	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-567a-97c1-a04b-ec72335b188d	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-567a-97c1-a08a-5b851db8a8c2	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-567a-97c1-0f50-567b9287d556	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-567a-97c1-5d31-e5b98551d8d9	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-567a-97c1-37f3-256c9b4e6fe5	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-567a-97c1-1e3d-fc2e965462d0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-567a-97c1-fc9e-43e8315d233a	SM	SMR	674	San Marino 	San Marino	\N
00040000-567a-97c1-62a2-8c65924b7f68	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-567a-97c1-92bc-76afd1009f78	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-567a-97c1-1385-3c3b2d6b7516	SN	SEN	686	Senegal 	Senegal	\N
00040000-567a-97c1-de93-ae4fb89c8d94	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-567a-97c1-0478-c6a13b15e520	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-567a-97c1-3c98-8632d35679b3	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-567a-97c1-b90c-3f66a72fa785	SG	SGP	702	Singapore 	Singapur	\N
00040000-567a-97c1-0985-395b02cc08ee	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-567a-97c1-3466-cb4552acdf59	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-567a-97c1-c0d8-10e07035cad6	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-567a-97c1-b675-f8d8665617f1	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-567a-97c1-5829-e79c34e60419	SO	SOM	706	Somalia 	Somalija	\N
00040000-567a-97c1-a8ab-d0d78b265e92	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-567a-97c1-41db-16dace4d6ae8	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-567a-97c1-8a64-7ad172d26973	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-567a-97c1-3cb8-e52c16bd3c63	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-567a-97c1-4396-58a8b242373f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-567a-97c1-28c8-01dc245719f3	SD	SDN	729	Sudan 	Sudan	\N
00040000-567a-97c1-74c7-f18afdd3c717	SR	SUR	740	Suriname 	Surinam	\N
00040000-567a-97c1-dc75-6534f8f6cd57	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-567a-97c1-89ce-7a09ebe09beb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-567a-97c1-3ec0-a7bbd9123411	SE	SWE	752	Sweden 	Švedska	\N
00040000-567a-97c1-248d-4d63e0b8ab96	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-567a-97c1-fdf5-6b99345aef82	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-567a-97c1-5432-330f1a986b9b	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-567a-97c1-b28d-606004b7aa06	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-567a-97c1-bc71-e7c4aef56488	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-567a-97c1-fef2-d4056a19a688	TH	THA	764	Thailand 	Tajska	\N
00040000-567a-97c1-af2d-3674f632b852	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-567a-97c1-2f12-9776abf82c5e	TG	TGO	768	Togo 	Togo	\N
00040000-567a-97c1-c516-7efa8f340535	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-567a-97c1-b167-03c2055a7b27	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-567a-97c1-7d1b-b9b12c2d676a	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-567a-97c1-0897-97c226c58f70	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-567a-97c1-fa12-da913d86ec31	TR	TUR	792	Turkey 	Turčija	\N
00040000-567a-97c1-4739-a98551c41fa5	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-567a-97c1-dce3-6f1d78acb362	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-567a-97c1-dee3-a7d1f93ec2d8	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-567a-97c1-10c6-6f91e888327b	UG	UGA	800	Uganda 	Uganda	\N
00040000-567a-97c1-2889-5631a3cffcbf	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-567a-97c1-02d7-6ade368e1dcc	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-567a-97c1-45ac-738beb147b5d	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-567a-97c1-9858-880294666def	US	USA	840	United States 	Združene države Amerike	\N
00040000-567a-97c1-68c3-d17cb57d1e13	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-567a-97c1-539b-e46bbe70e4d0	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-567a-97c1-3641-d58006748868	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-567a-97c1-a9ff-6dfd6148f5ea	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-567a-97c1-c1a5-76853df3a88e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-567a-97c1-a176-a32b19ccf124	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-567a-97c1-946d-f4df8c178ac3	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-567a-97c1-1345-6a8d5bab2525	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-567a-97c1-4506-40f89a80335e	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-567a-97c1-eeec-9f8b4e8957a1	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-567a-97c1-d57b-8a9b174e06d1	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-567a-97c1-f3f6-4b4640f37c25	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-567a-97c1-06bb-ec9c2790a082	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 32865197)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-567a-97c5-9629-10a0534ddfb0	000e0000-567a-97c5-b657-72f5a97dc1d4	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-567a-97c1-132b-835e641ff81e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-567a-97c5-d9d1-24859cbf7a8c	000e0000-567a-97c5-6e34-2f0fcc7518a9	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-567a-97c1-4047-e438b7c3ea40	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-567a-97c5-96ec-90e8113d6df9	000e0000-567a-97c5-0d0d-052b3830038b	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-567a-97c1-132b-835e641ff81e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-567a-97c5-a1e2-a792f5528ce8	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-567a-97c5-e3fb-da1ce0d43f4f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 32864997)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-567a-97c5-593f-f49ad4df4ab2	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-cd95-ef4eee5f4aa9	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-567a-97c1-962f-0674f9f4c00f
000d0000-567a-97c5-7df6-b4818f33ebf6	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-8aa5-946c01c7c96a	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-567a-97c1-a440-112fe8924e37
000d0000-567a-97c5-050c-023f361595fa	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-104a-aa1ed095d3fd	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-567a-97c1-d3f8-07aaab26b578
000d0000-567a-97c5-5079-467d2aa16503	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-7b2e-ef43b45b9848	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-567a-97c1-dd8a-490c2c808049
000d0000-567a-97c5-a737-bb99c8380034	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-cc78-922fb9ccde27	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-567a-97c1-dd8a-490c2c808049
000d0000-567a-97c5-ce9a-6bf03cd49a79	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-2e47-3ccde003ec15	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-567a-97c1-962f-0674f9f4c00f
000d0000-567a-97c5-2044-d9bb2beb4c7c	000e0000-567a-97c5-6e34-2f0fcc7518a9	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-567a-97c1-962f-0674f9f4c00f
000d0000-567a-97c5-d367-d8093fa17cba	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-020a-0672fc46ff0e	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-567a-97c1-192c-5b531013bdcb
000d0000-567a-97c5-98e5-870b5d277e3b	000e0000-567a-97c5-6e34-2f0fcc7518a9	000c0000-567a-97c5-18d5-eeb5ac52466e	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-567a-97c1-f966-a2d35e5e35ac
\.


--
-- TOC entry 3135 (class 0 OID 32864788)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 32864754)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 32864731)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-567a-97c5-944f-b7e03fd41f13	00080000-567a-97c5-1208-db23f832983c	00090000-567a-97c5-7ce7-b0a6e6659e2f	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 32864911)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 32865467)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-567a-97c5-9662-4e82bb5998cd	00010000-567a-97c2-6408-1fad6e4f064c	\N	Prva mapa	Root mapa	2015-12-23 13:47:01	2015-12-23 13:47:01	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 32865480)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 32865502)
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
-- TOC entry 3151 (class 0 OID 32864936)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 32864688)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-567a-97c3-7e20-52a987d10c7b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-567a-97c3-477c-ae20fa3b41fa	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-567a-97c3-cb41-194f186c114f	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-567a-97c3-95cb-55fec8aa0637	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-567a-97c3-50b1-8da80be8076e	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-567a-97c3-c90f-75eb8943cb65	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-567a-97c3-63fb-2c26fdd32b37	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-567a-97c3-aa9d-ddd299f276f2	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-567a-97c3-868d-39821b98d058	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-567a-97c3-3893-377074d71510	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-567a-97c3-9917-17ece8700e60	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-567a-97c3-d504-fddcd117ceb2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-567a-97c3-f16a-7cdd16984c91	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-567a-97c3-9ef8-097e0b859e07	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-567a-97c4-ca65-bc279020baa6	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-567a-97c4-07ce-643eb6cc026a	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-567a-97c4-c817-b253875d0407	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-567a-97c4-8964-54f94f31c4be	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-567a-97c4-d562-5d0b3f822b2c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-567a-97c7-e373-b3f4c67c2b3b	application.tenant.maticnopodjetje	string	s:36:"00080000-567a-97c7-a0bb-ae7c1c7880e8";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 32864588)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-567a-97c4-418e-7b1e8828a2ab	00000000-567a-97c4-ca65-bc279020baa6	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-567a-97c4-ce8e-4cc32513cbc8	00000000-567a-97c4-ca65-bc279020baa6	00010000-567a-97c2-6408-1fad6e4f064c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-567a-97c4-4803-faae71a699b0	00000000-567a-97c4-07ce-643eb6cc026a	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 32864655)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-567a-97c5-14e3-f7a705e9117d	\N	00100000-567a-97c5-1e17-99dcde1144e2	00100000-567a-97c5-7361-e445ef22d352	01	Gledališče Nimbis
00410000-567a-97c5-e2d7-b4c506b963b9	00410000-567a-97c5-14e3-f7a705e9117d	00100000-567a-97c5-1e17-99dcde1144e2	00100000-567a-97c5-7361-e445ef22d352	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 32864599)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-567a-97c5-4021-0041e60bda79	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-567a-97c5-85f1-eb5adb1abfb3	00010000-567a-97c5-c82c-9cd940cecd38	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-567a-97c5-3a07-f75ce4c16323	00010000-567a-97c5-f573-d4ed74b6d2a1	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-567a-97c5-b63c-7003c360a4ca	00010000-567a-97c5-075f-339affd4ff15	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-567a-97c5-1534-059149fd9f39	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-567a-97c5-1acb-615d60391b50	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-567a-97c5-4966-854d4c8ce29b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-567a-97c5-e18c-287ffca7c94e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-567a-97c5-7ce7-b0a6e6659e2f	00010000-567a-97c5-c838-4b10940244a8	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-567a-97c5-654a-4ef020ba6f9b	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-567a-97c5-5fc4-2e90e8f6cc40	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-567a-97c5-6347-e8393b641664	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-567a-97c5-3e6d-0452bc06d039	00010000-567a-97c5-1840-0897d30cd601	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-567a-97c5-4281-cccf26b2cf84	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-567a-97c5-af4a-53cd7747d432	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-567a-97c5-defc-8007684fd2a7	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-567a-97c5-f4ae-c1860eeadd28	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-567a-97c5-2354-f3d8b32140ea	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-567a-97c5-cb1b-cdcf41e8b7a3	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-567a-97c5-8923-9ca14e166823	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-567a-97c5-6b60-ece200f0a79d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 32864534)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-567a-97c1-de20-2eb498adaf31	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-567a-97c1-5593-4db7ec54726d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-567a-97c1-f5fe-65e877a717db	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-567a-97c1-9778-d3c3a923e648	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-567a-97c1-db2c-2ab390bce3a5	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-567a-97c1-25bd-e15101ba96e3	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-567a-97c1-c033-2bdce190e385	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-567a-97c1-a7d9-7d3e7d396bfc	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-567a-97c1-9f56-6a78eee38b72	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-567a-97c1-7c14-65744f3c757c	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-567a-97c1-28a9-ec5735a3c225	Abonma-read	Abonma - branje	t
00030000-567a-97c1-3fce-bd7d8ea558d4	Abonma-write	Abonma - spreminjanje	t
00030000-567a-97c1-c8e8-3c55f9ee82b4	Alternacija-read	Alternacija - branje	t
00030000-567a-97c1-57bb-4b0d6462b9d8	Alternacija-write	Alternacija - spreminjanje	t
00030000-567a-97c1-e7df-aec03e27c527	Arhivalija-read	Arhivalija - branje	t
00030000-567a-97c1-88d3-7f76d3c2ff88	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-567a-97c1-a302-4f51f6c6d5f3	AuthStorage-read	AuthStorage - branje	t
00030000-567a-97c1-1a26-dc0508722623	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-567a-97c1-6deb-4eff7bf5e7e1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-567a-97c1-d500-484872c2e9c8	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-567a-97c1-3ad9-8eb6019e060d	Besedilo-read	Besedilo - branje	t
00030000-567a-97c1-0907-86ec4703a44d	Besedilo-write	Besedilo - spreminjanje	t
00030000-567a-97c1-ce3d-176df93acfea	Dogodek-read	Dogodek - branje	t
00030000-567a-97c1-799d-8b0b069eec50	Dogodek-write	Dogodek - spreminjanje	t
00030000-567a-97c1-3649-94c7d01a7cfe	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-567a-97c1-8e52-e5ea920291a6	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-567a-97c1-0fec-f69f31dbf2d6	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-567a-97c1-6e86-37d2c9074208	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-567a-97c1-bd71-728d2648d80d	DogodekTrait-read	DogodekTrait - branje	t
00030000-567a-97c1-b6ca-cff3be65afb0	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-567a-97c1-55aa-1b6f5157245c	DrugiVir-read	DrugiVir - branje	t
00030000-567a-97c1-86f2-3ffb1669ed7c	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-567a-97c1-59a4-8fb13012b49e	Drzava-read	Drzava - branje	t
00030000-567a-97c1-5581-aaf65683fffb	Drzava-write	Drzava - spreminjanje	t
00030000-567a-97c1-9330-f3b0195104e9	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-567a-97c1-7a65-09ae8c201b8f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-567a-97c1-9913-0922b19c9947	Funkcija-read	Funkcija - branje	t
00030000-567a-97c1-93f9-196b111c2874	Funkcija-write	Funkcija - spreminjanje	t
00030000-567a-97c1-805c-4bef1a7d4b51	Gostovanje-read	Gostovanje - branje	t
00030000-567a-97c1-28c8-4d0b981239da	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-567a-97c1-ac6b-6a984865a8b9	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-567a-97c1-f4d5-e5e5739b2184	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-567a-97c1-849e-f3e42c8a1c5d	Kupec-read	Kupec - branje	t
00030000-567a-97c1-cfb5-b548b7a32fd5	Kupec-write	Kupec - spreminjanje	t
00030000-567a-97c1-63e5-0238e78fe17e	NacinPlacina-read	NacinPlacina - branje	t
00030000-567a-97c1-aa37-c85fc3dd6cc4	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-567a-97c1-b30d-07ea8fbf3a91	Option-read	Option - branje	t
00030000-567a-97c1-0a72-0710eca4fd8c	Option-write	Option - spreminjanje	t
00030000-567a-97c1-74af-4f57ba46203a	OptionValue-read	OptionValue - branje	t
00030000-567a-97c1-e4f7-90b05992d2f1	OptionValue-write	OptionValue - spreminjanje	t
00030000-567a-97c1-df72-8adc1e23afc8	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-567a-97c1-3f6d-e0c043e82522	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-567a-97c1-cb3b-434c8743b7a8	Oseba-read	Oseba - branje	t
00030000-567a-97c1-46d4-16fe1a23dacc	Oseba-write	Oseba - spreminjanje	t
00030000-567a-97c1-63d7-1705c981aec6	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-567a-97c1-5258-9722fdf6c703	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-567a-97c1-34bf-f13cf3a98633	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-567a-97c1-1f95-b8b5e1d9b9a6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-567a-97c1-422b-57f0466963c8	Pogodba-read	Pogodba - branje	t
00030000-567a-97c1-8200-0dadde619a20	Pogodba-write	Pogodba - spreminjanje	t
00030000-567a-97c1-68ed-7c543372fc20	Popa-read	Popa - branje	t
00030000-567a-97c1-2afb-645ed9090914	Popa-write	Popa - spreminjanje	t
00030000-567a-97c1-7b0b-3bf84aa62775	Posta-read	Posta - branje	t
00030000-567a-97c1-4146-d28b7826b9d6	Posta-write	Posta - spreminjanje	t
00030000-567a-97c1-bfea-5890c5bf1929	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-567a-97c1-8f03-fcfe146c1c09	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-567a-97c1-9731-8d934d48cef8	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-567a-97c1-6294-300bca272e98	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-567a-97c1-eb31-19ceec24a480	PostniNaslov-read	PostniNaslov - branje	t
00030000-567a-97c1-668e-847a9f23ed6c	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-567a-97c1-1fcd-52932559373d	Praznik-read	Praznik - branje	t
00030000-567a-97c1-91ba-a08f3f95f80d	Praznik-write	Praznik - spreminjanje	t
00030000-567a-97c1-d619-52eeec5553c0	Predstava-read	Predstava - branje	t
00030000-567a-97c1-68b7-14a12be97e6e	Predstava-write	Predstava - spreminjanje	t
00030000-567a-97c1-d494-c622397b6720	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-567a-97c1-5278-9958e6946562	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-567a-97c1-4fb7-49ce9ba5c4ff	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-567a-97c1-cc62-a8fa5294fb8f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-567a-97c1-d604-d8afe6aa827d	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-567a-97c1-2055-7dcff65b3119	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-567a-97c1-e8f9-716f2c536a8e	ProgramDela-read	ProgramDela - branje	t
00030000-567a-97c1-82fb-01d97ff42f8b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-567a-97c1-ff10-e371775c31ee	ProgramFestival-read	ProgramFestival - branje	t
00030000-567a-97c1-4f2b-41bd34ddefb9	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-567a-97c1-2721-46a2c67716ba	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-567a-97c1-37dd-2e3b82f0fbc2	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-567a-97c1-f626-72c6016d73f1	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-567a-97c1-4607-a049aaaa76c9	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-567a-97c1-3f2f-f1f4a55ff541	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-567a-97c1-47a3-35044cd3d20a	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-567a-97c1-1ebe-7a3c91fa4bb8	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-567a-97c1-48d2-ef12f64a6aff	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-567a-97c1-72a0-94422a82c635	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-567a-97c1-eec2-e8c971cba2ca	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-567a-97c1-96e5-8e2e60a22d28	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-567a-97c1-317f-800bd385b72c	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-567a-97c1-cc26-40662eaf80f9	ProgramRazno-read	ProgramRazno - branje	t
00030000-567a-97c1-95a7-0fd066c5a570	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-567a-97c1-2fb2-9ee86e4843af	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-567a-97c1-b2f4-5c81104ae532	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-567a-97c1-0bf0-332aa86709e8	Prostor-read	Prostor - branje	t
00030000-567a-97c1-dc36-41b7d6f554bb	Prostor-write	Prostor - spreminjanje	t
00030000-567a-97c1-160f-5a7fdaf26134	Racun-read	Racun - branje	t
00030000-567a-97c1-69aa-63fb98b9af91	Racun-write	Racun - spreminjanje	t
00030000-567a-97c1-552f-ab752451474a	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-567a-97c1-ed98-a551b1779f3e	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-567a-97c1-4c50-c44300051c03	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-567a-97c1-9be1-89dada1e9a4c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-567a-97c1-8c33-c9f768bf960c	Rekvizit-read	Rekvizit - branje	t
00030000-567a-97c1-dce1-29d72dff5dd3	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-567a-97c1-a160-e24572233de8	Revizija-read	Revizija - branje	t
00030000-567a-97c1-0fb4-3bfd277f4c05	Revizija-write	Revizija - spreminjanje	t
00030000-567a-97c1-8ec6-587d631ccd71	Rezervacija-read	Rezervacija - branje	t
00030000-567a-97c1-ed20-4838f45d37b1	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-567a-97c1-687e-bf91a0c3283e	SedezniRed-read	SedezniRed - branje	t
00030000-567a-97c1-4330-f5b92e2d4697	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-567a-97c1-e4a4-345fc58e77db	Sedez-read	Sedez - branje	t
00030000-567a-97c1-afcc-1e3c333e296f	Sedez-write	Sedez - spreminjanje	t
00030000-567a-97c1-54dc-9a7a3437d876	Sezona-read	Sezona - branje	t
00030000-567a-97c1-0893-ce9185df8226	Sezona-write	Sezona - spreminjanje	t
00030000-567a-97c1-df68-c68dddc4fcec	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-567a-97c1-7c71-3df3211e8b88	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-567a-97c1-6a1a-f7126321a790	Telefonska-read	Telefonska - branje	t
00030000-567a-97c1-5f96-c78dacb16c77	Telefonska-write	Telefonska - spreminjanje	t
00030000-567a-97c1-575c-e57ed21c6b87	TerminStoritve-read	TerminStoritve - branje	t
00030000-567a-97c1-3849-951c08896354	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-567a-97c1-827a-442ef08e2040	TipFunkcije-read	TipFunkcije - branje	t
00030000-567a-97c1-4ba1-2c45a7033941	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-567a-97c1-0601-3de2837ffeaf	TipPopa-read	TipPopa - branje	t
00030000-567a-97c1-89c7-88b927f67774	TipPopa-write	TipPopa - spreminjanje	t
00030000-567a-97c1-cfb7-38a90d0f0626	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-567a-97c1-8cd4-531c09b625a5	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-567a-97c1-20b4-b98583ffddb1	TipVaje-read	TipVaje - branje	t
00030000-567a-97c1-ce22-5761972df10a	TipVaje-write	TipVaje - spreminjanje	t
00030000-567a-97c1-d351-d59f674dafd4	Trr-read	Trr - branje	t
00030000-567a-97c1-9cc4-d6be647bf27b	Trr-write	Trr - spreminjanje	t
00030000-567a-97c1-3f9e-15c65bbcc535	Uprizoritev-read	Uprizoritev - branje	t
00030000-567a-97c1-26ac-1251ceb120e3	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-567a-97c1-e4d0-a1f5e52380d9	Vaja-read	Vaja - branje	t
00030000-567a-97c1-2156-999354f1fde7	Vaja-write	Vaja - spreminjanje	t
00030000-567a-97c1-3a28-7b7eca9d0719	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-567a-97c1-d8f6-fc1ef8082b0d	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-567a-97c1-5a15-2630fd9a00e4	VrstaStroska-read	VrstaStroska - branje	t
00030000-567a-97c1-62fa-55322782f498	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-567a-97c1-53dc-99e3f41918d6	Zaposlitev-read	Zaposlitev - branje	t
00030000-567a-97c1-dd2c-e2f526469b21	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-567a-97c1-b1a6-bce26ea6e0aa	Zasedenost-read	Zasedenost - branje	t
00030000-567a-97c1-9f45-265ec5384291	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-567a-97c1-9a3b-3111ad9dd17f	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-567a-97c1-531e-54fc0e6aff69	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-567a-97c1-e40a-02d7634748d3	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-567a-97c1-8cdd-c06fb0aad9bb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-567a-97c1-3b49-b39058342e78	Job-read	Branje opravil - samo zase - branje	t
00030000-567a-97c1-2abe-6c699f70735d	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-567a-97c1-f692-aba9101339ab	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-567a-97c1-c527-8885fef69f0f	Report-read	Report - branje	t
00030000-567a-97c1-55c9-0e9e993a248e	Report-write	Report - spreminjanje	t
00030000-567a-97c1-a42f-4e8836dd71aa	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-567a-97c1-9661-1d8107255b34	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-567a-97c1-fd62-5a60cd0ada04	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-567a-97c1-1dcf-24ebeaeabc40	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-567a-97c1-a4f4-aefa7cdd1164	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-567a-97c1-231f-3d8b843473ac	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-567a-97c1-89f7-14b850754fc2	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-567a-97c1-0fec-2b761f2db238	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-567a-97c1-b727-913819655919	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-567a-97c1-015a-3b0124805d01	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-567a-97c1-457c-5e551e045198	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-567a-97c1-0f67-27f40e6c4b4d	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-567a-97c1-b37c-7e6a73b82d74	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-567a-97c1-d57f-3e2ff081af14	Datoteka-write	Datoteka - spreminjanje	t
00030000-567a-97c1-448d-70c3f0d9359e	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 32864553)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-567a-97c2-610b-7dabf7b8f563	00030000-567a-97c1-5593-4db7ec54726d
00020000-567a-97c2-610b-7dabf7b8f563	00030000-567a-97c1-de20-2eb498adaf31
00020000-567a-97c2-a2cb-f0e1382beeaa	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-78d1-bf46cde4c9cb	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-82c3-0b50571d9717	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-82c3-0b50571d9717	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-82c3-0b50571d9717	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-82c3-0b50571d9717	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-82c3-0b50571d9717	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-82c3-0b50571d9717	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-dd2c-e2f526469b21
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-ecb6-621694aac50a	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-7fbd-5e285dc90eb0	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-7fbd-5e285dc90eb0	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-7fbd-5e285dc90eb0	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-9757-a4b70c80949c	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-d1e9-2f41f4318e18	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-d1e9-2f41f4318e18	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-d1e9-2f41f4318e18	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-d1e9-2f41f4318e18	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-6677-855e56add2f8	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-ba94-fab15e9154d1	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-2afb-645ed9090914
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-f4d5-e5e5739b2184
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-2055-7dcff65b3119
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-430e-3092cd178133	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-99a1-f2933fa8d676	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-d357-defeb4a965fa	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-d357-defeb4a965fa	00030000-567a-97c1-89c7-88b927f67774
00020000-567a-97c2-4781-b37a11842a6c	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-7469-bde08e707746	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-7469-bde08e707746	00030000-567a-97c1-4146-d28b7826b9d6
00020000-567a-97c2-0fd7-0b2519ebe442	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-0e3d-bdf4d4d2f277	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-0e3d-bdf4d4d2f277	00030000-567a-97c1-5581-aaf65683fffb
00020000-567a-97c2-625c-054ba8ccac1d	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-9e30-b8fe60abf10f	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-9e30-b8fe60abf10f	00030000-567a-97c1-8cdd-c06fb0aad9bb
00020000-567a-97c2-0fd9-eb9f592cacd3	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-9bec-acf093e3df35	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-9bec-acf093e3df35	00030000-567a-97c1-531e-54fc0e6aff69
00020000-567a-97c2-80ba-64444fe3a7d5	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-d0c2-1dc87413b064	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-d0c2-1dc87413b064	00030000-567a-97c1-3fce-bd7d8ea558d4
00020000-567a-97c2-bf09-4203f55a80ac	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-1b86-dd10bdf8fa48	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-1b86-dd10bdf8fa48	00030000-567a-97c1-dc36-41b7d6f554bb
00020000-567a-97c2-1b86-dd10bdf8fa48	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-1b86-dd10bdf8fa48	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-1b86-dd10bdf8fa48	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c2-1b86-dd10bdf8fa48	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-4221-7ef1b609c442	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-4221-7ef1b609c442	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-4221-7ef1b609c442	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-2239-394332f6e857	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-2239-394332f6e857	00030000-567a-97c1-62fa-55322782f498
00020000-567a-97c2-45e4-f33ade469448	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-3f6d-e0c043e82522
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-b394-6b57a7e6a2f8	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-e88c-98e11bbc927a	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-e88c-98e11bbc927a	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-e88c-98e11bbc927a	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-e88c-98e11bbc927a	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-e88c-98e11bbc927a	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-f460-a9b538fd13f9	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-f460-a9b538fd13f9	00030000-567a-97c1-ce22-5761972df10a
00020000-567a-97c2-74fe-9fe3cb644288	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-c033-2bdce190e385
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-a7d9-7d3e7d396bfc
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-e8f9-716f2c536a8e
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-82fb-01d97ff42f8b
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-ff10-e371775c31ee
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-4f2b-41bd34ddefb9
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-2721-46a2c67716ba
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-37dd-2e3b82f0fbc2
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-f626-72c6016d73f1
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-4607-a049aaaa76c9
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-3f2f-f1f4a55ff541
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-47a3-35044cd3d20a
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-1ebe-7a3c91fa4bb8
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-48d2-ef12f64a6aff
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-72a0-94422a82c635
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-eec2-e8c971cba2ca
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-96e5-8e2e60a22d28
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-317f-800bd385b72c
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-cc26-40662eaf80f9
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-95a7-0fd066c5a570
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-2fb2-9ee86e4843af
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-b2f4-5c81104ae532
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-cc62-a8fa5294fb8f
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-86f2-3ffb1669ed7c
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-8f03-fcfe146c1c09
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-2abe-6c699f70735d
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-55aa-1b6f5157245c
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-4fb7-49ce9ba5c4ff
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-bfea-5890c5bf1929
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-3b49-b39058342e78
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-8f9e-038545bf7830	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-e8f9-716f2c536a8e
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-ff10-e371775c31ee
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-2721-46a2c67716ba
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-f626-72c6016d73f1
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-3f2f-f1f4a55ff541
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-1ebe-7a3c91fa4bb8
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-72a0-94422a82c635
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-96e5-8e2e60a22d28
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-cc26-40662eaf80f9
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-2fb2-9ee86e4843af
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-4fb7-49ce9ba5c4ff
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-55aa-1b6f5157245c
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-bfea-5890c5bf1929
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-3b49-b39058342e78
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-6a44-c7e0bb1a08ba	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-7c14-65744f3c757c
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-0273-aa1eadee04e8	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-5e9b-eac501a60129	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-8d56-4e016957a19c	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-8200-0dadde619a20
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-4296-42ee1daa7717	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-1aa9-f62bb1ef8c1f	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-3b80-a56332e51900	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-4083-f3e183f4587c	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-4083-f3e183f4587c	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c2-4083-f3e183f4587c	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-4083-f3e183f4587c	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-63b9-90ce7427696b	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-63b9-90ce7427696b	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-55aa-1b6f5157245c
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-86f2-3ffb1669ed7c
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-7c14-65744f3c757c
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-3b49-b39058342e78
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-2abe-6c699f70735d
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-8200-0dadde619a20
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-bfea-5890c5bf1929
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-8f03-fcfe146c1c09
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-4fb7-49ce9ba5c4ff
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-cc62-a8fa5294fb8f
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-c033-2bdce190e385
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-e8f9-716f2c536a8e
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-a7d9-7d3e7d396bfc
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-82fb-01d97ff42f8b
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-ff10-e371775c31ee
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-4f2b-41bd34ddefb9
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-2721-46a2c67716ba
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-37dd-2e3b82f0fbc2
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-f626-72c6016d73f1
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-4607-a049aaaa76c9
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-3f2f-f1f4a55ff541
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-47a3-35044cd3d20a
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-1ebe-7a3c91fa4bb8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-48d2-ef12f64a6aff
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-72a0-94422a82c635
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-eec2-e8c971cba2ca
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-96e5-8e2e60a22d28
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-317f-800bd385b72c
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-cc26-40662eaf80f9
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-95a7-0fd066c5a570
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-2fb2-9ee86e4843af
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-b2f4-5c81104ae532
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-240b-69aeb0715e55	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-1f75-a152a42c9a74	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-7c14-65744f3c757c
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-5845-f3d846b08fa5	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-55aa-1b6f5157245c
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-86f2-3ffb1669ed7c
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-7c14-65744f3c757c
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-3b49-b39058342e78
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-2abe-6c699f70735d
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-f4d5-e5e5739b2184
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-8200-0dadde619a20
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-2afb-645ed9090914
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-bfea-5890c5bf1929
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-8f03-fcfe146c1c09
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-4fb7-49ce9ba5c4ff
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-cc62-a8fa5294fb8f
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-2055-7dcff65b3119
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-c033-2bdce190e385
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-e8f9-716f2c536a8e
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-a7d9-7d3e7d396bfc
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-82fb-01d97ff42f8b
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-ff10-e371775c31ee
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-4f2b-41bd34ddefb9
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-2721-46a2c67716ba
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-37dd-2e3b82f0fbc2
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-f626-72c6016d73f1
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-4607-a049aaaa76c9
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-3f2f-f1f4a55ff541
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-47a3-35044cd3d20a
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-1ebe-7a3c91fa4bb8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-48d2-ef12f64a6aff
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-72a0-94422a82c635
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-eec2-e8c971cba2ca
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-96e5-8e2e60a22d28
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-317f-800bd385b72c
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-cc26-40662eaf80f9
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-95a7-0fd066c5a570
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-2fb2-9ee86e4843af
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-b2f4-5c81104ae532
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-dd2c-e2f526469b21
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-d5b8-e206f14bf440	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-7c14-65744f3c757c
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-f4d5-e5e5739b2184
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-2afb-645ed9090914
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-2055-7dcff65b3119
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-dd2c-e2f526469b21
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-b625-bbea506ef3ca	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-7bf6-b2ce6749061c	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-55aa-1b6f5157245c
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-86f2-3ffb1669ed7c
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-3b49-b39058342e78
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-2abe-6c699f70735d
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-f4d5-e5e5739b2184
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-3f6d-e0c043e82522
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-8200-0dadde619a20
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-2afb-645ed9090914
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-bfea-5890c5bf1929
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-8f03-fcfe146c1c09
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-4fb7-49ce9ba5c4ff
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-cc62-a8fa5294fb8f
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-2055-7dcff65b3119
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-c033-2bdce190e385
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-e8f9-716f2c536a8e
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-a7d9-7d3e7d396bfc
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-82fb-01d97ff42f8b
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-ff10-e371775c31ee
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-4f2b-41bd34ddefb9
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-2721-46a2c67716ba
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-37dd-2e3b82f0fbc2
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-f626-72c6016d73f1
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-4607-a049aaaa76c9
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-3f2f-f1f4a55ff541
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-47a3-35044cd3d20a
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-1ebe-7a3c91fa4bb8
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-48d2-ef12f64a6aff
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-72a0-94422a82c635
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-eec2-e8c971cba2ca
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-96e5-8e2e60a22d28
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-317f-800bd385b72c
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-cc26-40662eaf80f9
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-95a7-0fd066c5a570
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-2fb2-9ee86e4843af
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-b2f4-5c81104ae532
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-62fa-55322782f498
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-b727-913819655919
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-dd2c-e2f526469b21
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c2-1a0a-f98e62dc4bd8	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-de20-2eb498adaf31
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-5593-4db7ec54726d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-28a9-ec5735a3c225
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3fce-bd7d8ea558d4
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-e7df-aec03e27c527
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-88d3-7f76d3c2ff88
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-a302-4f51f6c6d5f3
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-1a26-dc0508722623
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-6deb-4eff7bf5e7e1
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d500-484872c2e9c8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3ad9-8eb6019e060d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0907-86ec4703a44d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-ce3d-176df93acfea
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9778-d3c3a923e648
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3649-94c7d01a7cfe
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8e52-e5ea920291a6
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0fec-f69f31dbf2d6
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-6e86-37d2c9074208
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-bd71-728d2648d80d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-b6ca-cff3be65afb0
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-799d-8b0b069eec50
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-55aa-1b6f5157245c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-86f2-3ffb1669ed7c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-59a4-8fb13012b49e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-5581-aaf65683fffb
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9330-f3b0195104e9
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-7a65-09ae8c201b8f
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-7c14-65744f3c757c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-805c-4bef1a7d4b51
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-28c8-4d0b981239da
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-f692-aba9101339ab
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3b49-b39058342e78
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-2abe-6c699f70735d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-ac6b-6a984865a8b9
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-f4d5-e5e5739b2184
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-849e-f3e42c8a1c5d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-cfb5-b548b7a32fd5
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-89f7-14b850754fc2
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-231f-3d8b843473ac
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9661-1d8107255b34
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-fd62-5a60cd0ada04
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-1dcf-24ebeaeabc40
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-a4f4-aefa7cdd1164
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-63e5-0238e78fe17e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-aa37-c85fc3dd6cc4
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-b30d-07ea8fbf3a91
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-74af-4f57ba46203a
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-e4f7-90b05992d2f1
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0a72-0710eca4fd8c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-df72-8adc1e23afc8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3f6d-e0c043e82522
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-63d7-1705c981aec6
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-5258-9722fdf6c703
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-34bf-f13cf3a98633
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-1f95-b8b5e1d9b9a6
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8200-0dadde619a20
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-2afb-645ed9090914
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-7b0b-3bf84aa62775
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-bfea-5890c5bf1929
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8f03-fcfe146c1c09
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9731-8d934d48cef8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-6294-300bca272e98
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4146-d28b7826b9d6
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-1fcd-52932559373d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-91ba-a08f3f95f80d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d619-52eeec5553c0
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-68b7-14a12be97e6e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d494-c622397b6720
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-5278-9958e6946562
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4fb7-49ce9ba5c4ff
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-cc62-a8fa5294fb8f
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d604-d8afe6aa827d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-2055-7dcff65b3119
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-c033-2bdce190e385
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-e8f9-716f2c536a8e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-a7d9-7d3e7d396bfc
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-82fb-01d97ff42f8b
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-ff10-e371775c31ee
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4f2b-41bd34ddefb9
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-2721-46a2c67716ba
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-37dd-2e3b82f0fbc2
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-f626-72c6016d73f1
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4607-a049aaaa76c9
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3f2f-f1f4a55ff541
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-47a3-35044cd3d20a
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-1ebe-7a3c91fa4bb8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-48d2-ef12f64a6aff
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-72a0-94422a82c635
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-eec2-e8c971cba2ca
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-96e5-8e2e60a22d28
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-317f-800bd385b72c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-cc26-40662eaf80f9
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-95a7-0fd066c5a570
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-2fb2-9ee86e4843af
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-b2f4-5c81104ae532
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0bf0-332aa86709e8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-dc36-41b7d6f554bb
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-160f-5a7fdaf26134
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-69aa-63fb98b9af91
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-552f-ab752451474a
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-ed98-a551b1779f3e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4c50-c44300051c03
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9be1-89dada1e9a4c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8c33-c9f768bf960c
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-dce1-29d72dff5dd3
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-c527-8885fef69f0f
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-55c9-0e9e993a248e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-a160-e24572233de8
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0fb4-3bfd277f4c05
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8ec6-587d631ccd71
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-ed20-4838f45d37b1
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-687e-bf91a0c3283e
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4330-f5b92e2d4697
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-e4a4-345fc58e77db
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-afcc-1e3c333e296f
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-54dc-9a7a3437d876
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0893-ce9185df8226
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-a42f-4e8836dd71aa
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-575c-e57ed21c6b87
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-f5fe-65e877a717db
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3849-951c08896354
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-827a-442ef08e2040
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-4ba1-2c45a7033941
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0601-3de2837ffeaf
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-89c7-88b927f67774
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-cfb7-38a90d0f0626
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8cd4-531c09b625a5
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-20b4-b98583ffddb1
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-ce22-5761972df10a
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-e4d0-a1f5e52380d9
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-2156-999354f1fde7
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-3a28-7b7eca9d0719
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-d8f6-fc1ef8082b0d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-5a15-2630fd9a00e4
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-62fa-55322782f498
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-b37c-7e6a73b82d74
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0f67-27f40e6c4b4d
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-b727-913819655919
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-dd2c-e2f526469b21
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-b1a6-bce26ea6e0aa
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9f45-265ec5384291
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-9a3b-3111ad9dd17f
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-531e-54fc0e6aff69
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-e40a-02d7634748d3
00020000-567a-97c5-aacc-eeabdc4a17cf	00030000-567a-97c1-8cdd-c06fb0aad9bb
00020000-567a-97c5-0255-c73622b393fd	00030000-567a-97c1-457c-5e551e045198
00020000-567a-97c5-7a75-aed9957dd912	00030000-567a-97c1-015a-3b0124805d01
00020000-567a-97c5-8bb3-bec8b725ce35	00030000-567a-97c1-26ac-1251ceb120e3
00020000-567a-97c5-230f-6a5556f8e557	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c5-7041-910385c3db23	00030000-567a-97c1-fd62-5a60cd0ada04
00020000-567a-97c5-2d1a-c18927b2f530	00030000-567a-97c1-1dcf-24ebeaeabc40
00020000-567a-97c5-864d-778df1e10917	00030000-567a-97c1-a4f4-aefa7cdd1164
00020000-567a-97c5-2e03-120ffe52e4f2	00030000-567a-97c1-9661-1d8107255b34
00020000-567a-97c5-7965-f1991f46384e	00030000-567a-97c1-89f7-14b850754fc2
00020000-567a-97c5-ddec-7113459b415c	00030000-567a-97c1-231f-3d8b843473ac
00020000-567a-97c5-487b-0d26a6599260	00030000-567a-97c1-b727-913819655919
00020000-567a-97c5-fa8e-4ae6aa97f161	00030000-567a-97c1-0fec-2b761f2db238
00020000-567a-97c5-783b-ea6296e25637	00030000-567a-97c1-cb3b-434c8743b7a8
00020000-567a-97c5-991d-127f89a577a5	00030000-567a-97c1-46d4-16fe1a23dacc
00020000-567a-97c5-1185-cbc82aaff840	00030000-567a-97c1-db2c-2ab390bce3a5
00020000-567a-97c5-1e9c-7aa329b53ec4	00030000-567a-97c1-25bd-e15101ba96e3
00020000-567a-97c5-a9d4-c447b695d050	00030000-567a-97c1-d57f-3e2ff081af14
00020000-567a-97c5-4bde-a82921c7a941	00030000-567a-97c1-448d-70c3f0d9359e
00020000-567a-97c5-03d2-64a82022e277	00030000-567a-97c1-68ed-7c543372fc20
00020000-567a-97c5-03d2-64a82022e277	00030000-567a-97c1-2afb-645ed9090914
00020000-567a-97c5-03d2-64a82022e277	00030000-567a-97c1-3f9e-15c65bbcc535
00020000-567a-97c5-89c7-1100b594c238	00030000-567a-97c1-d351-d59f674dafd4
00020000-567a-97c5-17cb-d17ab30ed12a	00030000-567a-97c1-9cc4-d6be647bf27b
00020000-567a-97c5-6846-c366597027d8	00030000-567a-97c1-a42f-4e8836dd71aa
00020000-567a-97c5-aaf8-f3b145f41e49	00030000-567a-97c1-6a1a-f7126321a790
00020000-567a-97c5-bcd7-fdd6961330e2	00030000-567a-97c1-5f96-c78dacb16c77
00020000-567a-97c5-bbda-3d26b0c3f037	00030000-567a-97c1-eb31-19ceec24a480
00020000-567a-97c5-cdcb-8cc918967838	00030000-567a-97c1-668e-847a9f23ed6c
00020000-567a-97c5-14c3-e51ccf7a6f93	00030000-567a-97c1-53dc-99e3f41918d6
00020000-567a-97c5-c713-39a58de7f425	00030000-567a-97c1-dd2c-e2f526469b21
00020000-567a-97c5-b370-177ecbecd09b	00030000-567a-97c1-422b-57f0466963c8
00020000-567a-97c5-8cab-e5be00e80cb5	00030000-567a-97c1-8200-0dadde619a20
00020000-567a-97c5-09b2-50de1cd7869c	00030000-567a-97c1-df68-c68dddc4fcec
00020000-567a-97c5-82db-178879bc3d47	00030000-567a-97c1-7c71-3df3211e8b88
00020000-567a-97c5-8b33-cc198f8ddd21	00030000-567a-97c1-c8e8-3c55f9ee82b4
00020000-567a-97c5-c4a1-2f5bf2899c30	00030000-567a-97c1-57bb-4b0d6462b9d8
00020000-567a-97c5-49b0-cfd076fcc77b	00030000-567a-97c1-9f56-6a78eee38b72
00020000-567a-97c5-feed-dd2ff5d3e043	00030000-567a-97c1-9913-0922b19c9947
00020000-567a-97c5-4ca9-2f62e3231b11	00030000-567a-97c1-93f9-196b111c2874
00020000-567a-97c5-343e-6d723ddcd944	00030000-567a-97c1-7c14-65744f3c757c
\.


--
-- TOC entry 3152 (class 0 OID 32864943)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 32864977)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 32865115)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-567a-97c5-3c0d-e989c1fb7708	00090000-567a-97c5-4021-0041e60bda79	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-567a-97c5-4353-9ac2aec76034	00090000-567a-97c5-1acb-615d60391b50	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-567a-97c5-f59b-3c29551d1e42	00090000-567a-97c5-3e6d-0452bc06d039	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-567a-97c5-b7aa-4194f263b6fd	00090000-567a-97c5-654a-4ef020ba6f9b	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 32864635)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-567a-97c5-1208-db23f832983c	\N	00040000-567a-97c1-c0d8-10e07035cad6	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-ad8b-75b5cecd4598	\N	00040000-567a-97c1-c0d8-10e07035cad6	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-567a-97c5-beb7-2837ae61f71c	\N	00040000-567a-97c1-c0d8-10e07035cad6	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-fe31-ab46c8d41b1e	\N	00040000-567a-97c1-c0d8-10e07035cad6	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-f1d4-f2814b17433b	\N	00040000-567a-97c1-c0d8-10e07035cad6	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-c108-dfa58915b112	\N	00040000-567a-97c1-dee3-eef7c9962078	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-c6cf-c3b293b42d36	\N	00040000-567a-97c1-1c4d-89f3bd277215	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-837e-68086102f1b1	\N	00040000-567a-97c1-3e4f-eb5651587ab1	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c5-2b32-0036bd14a86e	\N	00040000-567a-97c1-028a-a37f6e1a75f1	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-567a-97c7-a0bb-ae7c1c7880e8	\N	00040000-567a-97c1-c0d8-10e07035cad6	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 32864680)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-567a-97c0-d595-69f599f3fb50	8341	Adlešiči
00050000-567a-97c0-7859-bf820828b933	5270	Ajdovščina
00050000-567a-97c0-8435-683e1c6ccd68	6280	Ankaran/Ancarano
00050000-567a-97c0-39e8-1e1954a57d90	9253	Apače
00050000-567a-97c0-d189-4407212e9045	8253	Artiče
00050000-567a-97c0-d66d-c9f64f3a73ca	4275	Begunje na Gorenjskem
00050000-567a-97c0-2982-3068fb2d05b9	1382	Begunje pri Cerknici
00050000-567a-97c0-1862-20e1982ec47b	9231	Beltinci
00050000-567a-97c0-ac29-1767c4941f36	2234	Benedikt
00050000-567a-97c0-f239-7292629e688e	2345	Bistrica ob Dravi
00050000-567a-97c0-6b26-c93ba944a270	3256	Bistrica ob Sotli
00050000-567a-97c0-8224-a542470de20d	8259	Bizeljsko
00050000-567a-97c0-7125-531a52a160bc	1223	Blagovica
00050000-567a-97c0-f981-e1dd0fa62393	8283	Blanca
00050000-567a-97c0-27fa-cc0d70a0a6ed	4260	Bled
00050000-567a-97c0-85da-872e8c1fed48	4273	Blejska Dobrava
00050000-567a-97c0-c810-03b2994f84ac	9265	Bodonci
00050000-567a-97c0-c530-72121357ebdc	9222	Bogojina
00050000-567a-97c0-5325-cf9439efdc00	4263	Bohinjska Bela
00050000-567a-97c0-3abb-5fac3e9d1137	4264	Bohinjska Bistrica
00050000-567a-97c0-de46-c4dc48d91585	4265	Bohinjsko jezero
00050000-567a-97c0-3f54-4e003ec21cd3	1353	Borovnica
00050000-567a-97c0-fef6-6ef2d65b15e6	8294	Boštanj
00050000-567a-97c0-a6c0-4826ef551889	5230	Bovec
00050000-567a-97c0-17f7-6032a542a226	5295	Branik
00050000-567a-97c0-0243-0e3a025da381	3314	Braslovče
00050000-567a-97c0-4e13-1933246ea191	5223	Breginj
00050000-567a-97c0-47f3-d0e5ed35113e	8280	Brestanica
00050000-567a-97c0-1224-1d5e4d531c13	2354	Bresternica
00050000-567a-97c0-22d2-f713c6c517e0	4243	Brezje
00050000-567a-97c0-150f-9d15f711c65c	1351	Brezovica pri Ljubljani
00050000-567a-97c0-af57-c456ab70a1d6	8250	Brežice
00050000-567a-97c0-3b0c-d893875cb8ca	4210	Brnik - Aerodrom
00050000-567a-97c0-0b62-60515f03da85	8321	Brusnice
00050000-567a-97c0-5b5e-0ffc1ae35c7f	3255	Buče
00050000-567a-97c0-2556-d19a802bae0f	8276	Bučka 
00050000-567a-97c1-4237-72e7c641bc0b	9261	Cankova
00050000-567a-97c1-dd89-957609ddf8d3	3000	Celje 
00050000-567a-97c1-fca5-2cb3491fb672	3001	Celje - poštni predali
00050000-567a-97c1-8e78-8f20871d43d6	4207	Cerklje na Gorenjskem
00050000-567a-97c1-694f-be539f42e67b	8263	Cerklje ob Krki
00050000-567a-97c1-72bf-88541f25bced	1380	Cerknica
00050000-567a-97c1-3897-842b61a28aa3	5282	Cerkno
00050000-567a-97c1-3c63-5b0bfce11ed1	2236	Cerkvenjak
00050000-567a-97c1-d185-71c112a8d99b	2215	Ceršak
00050000-567a-97c1-0cfa-89ed6dd0cedd	2326	Cirkovce
00050000-567a-97c1-016c-f80191cb9cd7	2282	Cirkulane
00050000-567a-97c1-0c30-19b48567f6ea	5273	Col
00050000-567a-97c1-7d61-e8d05bf391f0	8251	Čatež ob Savi
00050000-567a-97c1-c684-fa5e651ae378	1413	Čemšenik
00050000-567a-97c1-48da-6a6012c0818f	5253	Čepovan
00050000-567a-97c1-0e8f-9459e4a57b90	9232	Črenšovci
00050000-567a-97c1-7f6a-95bef8955c0a	2393	Črna na Koroškem
00050000-567a-97c1-be36-2e3d3b77708f	6275	Črni Kal
00050000-567a-97c1-95b7-7d1b94bd873b	5274	Črni Vrh nad Idrijo
00050000-567a-97c1-a033-7e1cfbf95e53	5262	Črniče
00050000-567a-97c1-3a3b-d8d03c18883f	8340	Črnomelj
00050000-567a-97c1-ab49-4ef6b58a2d59	6271	Dekani
00050000-567a-97c1-10b7-13cf43ebf1e1	5210	Deskle
00050000-567a-97c1-80d9-403180b4712b	2253	Destrnik
00050000-567a-97c1-4f44-82541a0c063f	6215	Divača
00050000-567a-97c1-6b4e-168e0e67ba9f	1233	Dob
00050000-567a-97c1-5d09-84b0cbececf8	3224	Dobje pri Planini
00050000-567a-97c1-18fb-6b47c02b8bbe	8257	Dobova
00050000-567a-97c1-24e3-6206352686cc	1423	Dobovec
00050000-567a-97c1-a540-2bb297ba31ea	5263	Dobravlje
00050000-567a-97c1-f160-31a67c71aa68	3204	Dobrna
00050000-567a-97c1-3af2-d49756102431	8211	Dobrnič
00050000-567a-97c1-e83f-304b7f01a6ad	1356	Dobrova
00050000-567a-97c1-8a58-453de55fa13c	9223	Dobrovnik/Dobronak 
00050000-567a-97c1-66d2-e37c211617a1	5212	Dobrovo v Brdih
00050000-567a-97c1-91d1-a3633331e6c0	1431	Dol pri Hrastniku
00050000-567a-97c1-a2a7-76ae5d5ff69d	1262	Dol pri Ljubljani
00050000-567a-97c1-5a5b-a56d2ad5dc57	1273	Dole pri Litiji
00050000-567a-97c1-4e2e-78cb3d88e2c5	1331	Dolenja vas
00050000-567a-97c1-2b49-ced0608195b8	8350	Dolenjske Toplice
00050000-567a-97c1-223f-60a1e1ab4cb2	1230	Domžale
00050000-567a-97c1-d594-dfe3737db0c8	2252	Dornava
00050000-567a-97c1-446c-e0cbade6431f	5294	Dornberk
00050000-567a-97c1-eb47-8bbc9b20f016	1319	Draga
00050000-567a-97c1-3883-aaded6d7e30e	8343	Dragatuš
00050000-567a-97c1-7935-8197bf5ab0d6	3222	Dramlje
00050000-567a-97c1-61f9-139431cc1bba	2370	Dravograd
00050000-567a-97c1-e8af-fe001554ad63	4203	Duplje
00050000-567a-97c1-4931-29d4f1db93b7	6221	Dutovlje
00050000-567a-97c1-2e8d-4e1d0d1aae5c	8361	Dvor
00050000-567a-97c1-eef8-1dc01cf494f1	2343	Fala
00050000-567a-97c1-9ad1-8c5667691f07	9208	Fokovci
00050000-567a-97c1-fcc6-17a95303de60	2313	Fram
00050000-567a-97c1-6ff6-d473d207cbfe	3213	Frankolovo
00050000-567a-97c1-04a5-63046d035b56	1274	Gabrovka
00050000-567a-97c1-1e91-8c5ebda0f0d8	8254	Globoko
00050000-567a-97c1-90d4-fd8a1d460c02	5275	Godovič
00050000-567a-97c1-e36d-44a1183c8f6f	4204	Golnik
00050000-567a-97c1-2e4b-b43196c0aa87	3303	Gomilsko
00050000-567a-97c1-d041-6d6b0e4d9be1	4224	Gorenja vas
00050000-567a-97c1-3374-e110d6e82ee0	3263	Gorica pri Slivnici
00050000-567a-97c1-3168-bf2d7577f023	2272	Gorišnica
00050000-567a-97c1-3783-098ab6882278	9250	Gornja Radgona
00050000-567a-97c1-a319-a25d4bf8f78f	3342	Gornji Grad
00050000-567a-97c1-8b40-0c8e4b778ec3	4282	Gozd Martuljek
00050000-567a-97c1-3562-740d1a2d8b99	6272	Gračišče
00050000-567a-97c1-2b3a-1d86eaacb76b	9264	Grad
00050000-567a-97c1-0021-b5adda860260	8332	Gradac
00050000-567a-97c1-6477-1d01e8e40638	1384	Grahovo
00050000-567a-97c1-a2f5-f5127c501591	5242	Grahovo ob Bači
00050000-567a-97c1-ba67-e6857bd10fdf	5251	Grgar
00050000-567a-97c1-9ae6-7115cd214379	3302	Griže
00050000-567a-97c1-daad-5b4d32bbb2eb	3231	Grobelno
00050000-567a-97c1-6d98-2b7401d2aa90	1290	Grosuplje
00050000-567a-97c1-6e1d-e69bec9bace1	2288	Hajdina
00050000-567a-97c1-94c9-c7fff2a2cfd1	8362	Hinje
00050000-567a-97c1-289f-a59bf36a4d39	2311	Hoče
00050000-567a-97c1-01e9-2f60c71f8652	9205	Hodoš/Hodos
00050000-567a-97c1-6a5b-1ed44e799f7f	1354	Horjul
00050000-567a-97c1-335f-7a3041dd1738	1372	Hotedršica
00050000-567a-97c1-9584-4388a5af5137	1430	Hrastnik
00050000-567a-97c1-f588-4991977ddafe	6225	Hruševje
00050000-567a-97c1-8fa6-08725ff92ec3	4276	Hrušica
00050000-567a-97c1-f1f2-09efe5cfe5ba	5280	Idrija
00050000-567a-97c1-b003-1c5a96f4df87	1292	Ig
00050000-567a-97c1-757f-47f331260d1f	6250	Ilirska Bistrica
00050000-567a-97c1-51d6-9cc64f027131	6251	Ilirska Bistrica-Trnovo
00050000-567a-97c1-4cc6-d75c41f732f0	1295	Ivančna Gorica
00050000-567a-97c1-2fd8-057ecef1f7e3	2259	Ivanjkovci
00050000-567a-97c1-30f9-54d36a4d302b	1411	Izlake
00050000-567a-97c1-c543-b888c60010fc	6310	Izola/Isola
00050000-567a-97c1-3942-9ba559c2c681	2222	Jakobski Dol
00050000-567a-97c1-2e42-0c7910878cae	2221	Jarenina
00050000-567a-97c1-c7b6-326579a9496c	6254	Jelšane
00050000-567a-97c1-564b-2f747188cdb3	4270	Jesenice
00050000-567a-97c1-d5ba-3af631527456	8261	Jesenice na Dolenjskem
00050000-567a-97c1-c0d7-df399c1346cd	3273	Jurklošter
00050000-567a-97c1-12d8-0a43f7470b97	2223	Jurovski Dol
00050000-567a-97c1-e8b1-4ae7c900c25c	2256	Juršinci
00050000-567a-97c1-7d01-151a6d0c18b4	5214	Kal nad Kanalom
00050000-567a-97c1-05bf-fdf0984cc62d	3233	Kalobje
00050000-567a-97c1-0922-9cb461898d72	4246	Kamna Gorica
00050000-567a-97c1-f776-5706cccc80c9	2351	Kamnica
00050000-567a-97c1-a3b2-77757a5ee658	1241	Kamnik
00050000-567a-97c1-7eca-2c336a49ff4b	5213	Kanal
00050000-567a-97c1-b3a9-1e30ca074821	8258	Kapele
00050000-567a-97c1-2577-14591150a429	2362	Kapla
00050000-567a-97c1-6c84-21cfa4789f51	2325	Kidričevo
00050000-567a-97c1-1451-65a5fdb7cd47	1412	Kisovec
00050000-567a-97c1-8a88-b4d33d3c4b12	6253	Knežak
00050000-567a-97c1-34a4-d1c55ddc4706	5222	Kobarid
00050000-567a-97c1-8ab2-25fc3d0f6e36	9227	Kobilje
00050000-567a-97c1-55ef-d4de3273c2a4	1330	Kočevje
00050000-567a-97c1-4a41-3cee63991cfb	1338	Kočevska Reka
00050000-567a-97c1-3b47-56ef50f96a09	2276	Kog
00050000-567a-97c1-1dfd-621ec232b4c4	5211	Kojsko
00050000-567a-97c1-b939-68fb956c1d4b	6223	Komen
00050000-567a-97c1-dc2c-afaefe66415c	1218	Komenda
00050000-567a-97c1-9699-e7b59076f9df	6000	Koper/Capodistria 
00050000-567a-97c1-2e9d-09974d6c22ff	6001	Koper/Capodistria - poštni predali
00050000-567a-97c1-445d-df147e997703	8282	Koprivnica
00050000-567a-97c1-b4e1-a418e48b2f8a	5296	Kostanjevica na Krasu
00050000-567a-97c1-21ff-3765cadc9c18	8311	Kostanjevica na Krki
00050000-567a-97c1-669a-4f8bdba122eb	1336	Kostel
00050000-567a-97c1-ed7f-06ff06ff6fb1	6256	Košana
00050000-567a-97c1-f152-9ae5b3d639c4	2394	Kotlje
00050000-567a-97c1-4eb1-5a857157d420	6240	Kozina
00050000-567a-97c1-424f-4bb9326e0bab	3260	Kozje
00050000-567a-97c1-aa2b-147dd8b09c3f	4000	Kranj 
00050000-567a-97c1-caef-172539ca3452	4001	Kranj - poštni predali
00050000-567a-97c1-448f-10521357a9ab	4280	Kranjska Gora
00050000-567a-97c1-5960-de11594ad0df	1281	Kresnice
00050000-567a-97c1-e8e1-ff1a9be1a8c2	4294	Križe
00050000-567a-97c1-3940-8ed1890e3612	9206	Križevci
00050000-567a-97c1-0b47-22b4fcc22b95	9242	Križevci pri Ljutomeru
00050000-567a-97c1-96a6-62c4f5046225	1301	Krka
00050000-567a-97c1-5a7f-fe6bc7a7682b	8296	Krmelj
00050000-567a-97c1-e31c-29bac3aadaf2	4245	Kropa
00050000-567a-97c1-82d3-bb87d0a054b1	8262	Krška vas
00050000-567a-97c1-d317-bed340759e6c	8270	Krško
00050000-567a-97c1-4f20-0e5c62978114	9263	Kuzma
00050000-567a-97c1-38bb-839ec1980465	2318	Laporje
00050000-567a-97c1-ec9c-4bab1b065590	3270	Laško
00050000-567a-97c1-d9f0-a3299a9e2550	1219	Laze v Tuhinju
00050000-567a-97c1-d24e-9364daad7501	2230	Lenart v Slovenskih goricah
00050000-567a-97c1-1832-af30a85454f6	9220	Lendava/Lendva
00050000-567a-97c1-3151-2b69cb2aa9d6	4248	Lesce
00050000-567a-97c1-0a60-74334d7608c1	3261	Lesično
00050000-567a-97c1-6515-d38b90015c44	8273	Leskovec pri Krškem
00050000-567a-97c1-d363-e1030924f339	2372	Libeliče
00050000-567a-97c1-dc38-55660f272692	2341	Limbuš
00050000-567a-97c1-1bcb-9b1f43279ac1	1270	Litija
00050000-567a-97c1-90a8-a36ae9f4e158	3202	Ljubečna
00050000-567a-97c1-0d61-19b3726fadb1	1000	Ljubljana 
00050000-567a-97c1-f1d3-789fa1ff18e2	1001	Ljubljana - poštni predali
00050000-567a-97c1-46b1-6aac88d54824	1231	Ljubljana - Črnuče
00050000-567a-97c1-3764-84c36efc9622	1261	Ljubljana - Dobrunje
00050000-567a-97c1-9330-f52d9d9ee1cb	1260	Ljubljana - Polje
00050000-567a-97c1-f4e1-1201f0a279fc	1210	Ljubljana - Šentvid
00050000-567a-97c1-5c36-fa862be2f0d2	1211	Ljubljana - Šmartno
00050000-567a-97c1-143c-ce9e0fdc2076	3333	Ljubno ob Savinji
00050000-567a-97c1-68ec-dcb327584d0c	9240	Ljutomer
00050000-567a-97c1-046f-90d69b125c23	3215	Loče
00050000-567a-97c1-a764-572944db6dd9	5231	Log pod Mangartom
00050000-567a-97c1-09bc-b6b4f1e78094	1358	Log pri Brezovici
00050000-567a-97c1-f08b-95046a1e13ed	1370	Logatec
00050000-567a-97c1-976d-ee33b53c0ed7	1371	Logatec
00050000-567a-97c1-edf3-a71619e25b45	1434	Loka pri Zidanem Mostu
00050000-567a-97c1-46ef-0ebf725868bc	3223	Loka pri Žusmu
00050000-567a-97c1-4199-4487fa3aa9c4	6219	Lokev
00050000-567a-97c1-6502-ab3cec9cd9dc	1318	Loški Potok
00050000-567a-97c1-1dab-002aba8af241	2324	Lovrenc na Dravskem polju
00050000-567a-97c1-0a09-497932cbdf27	2344	Lovrenc na Pohorju
00050000-567a-97c1-5975-119ff1594475	3334	Luče
00050000-567a-97c1-5003-057e0f0be8ef	1225	Lukovica
00050000-567a-97c1-aeb6-23ddebcad0b0	9202	Mačkovci
00050000-567a-97c1-cd3b-35157f1d4e61	2322	Majšperk
00050000-567a-97c1-a52e-cc6c41e3ccb9	2321	Makole
00050000-567a-97c1-1f81-b99338c37c48	9243	Mala Nedelja
00050000-567a-97c1-db82-cbb8463a02cc	2229	Malečnik
00050000-567a-97c1-8236-818065cdba65	6273	Marezige
00050000-567a-97c1-eda8-30c407cc168c	2000	Maribor 
00050000-567a-97c1-824c-503793ff96a8	2001	Maribor - poštni predali
00050000-567a-97c1-2f5a-a5abf8180096	2206	Marjeta na Dravskem polju
00050000-567a-97c1-535a-8e1b4fe62289	2281	Markovci
00050000-567a-97c1-a45f-c630b9e2657d	9221	Martjanci
00050000-567a-97c1-0dcf-a69063f33669	6242	Materija
00050000-567a-97c1-a5c1-cf45da4fe46f	4211	Mavčiče
00050000-567a-97c1-f308-d8bb2ab9b514	1215	Medvode
00050000-567a-97c1-b58d-6b88e0fb412f	1234	Mengeš
00050000-567a-97c1-40a3-68a715ecfb06	8330	Metlika
00050000-567a-97c1-cfdf-989b583d03d9	2392	Mežica
00050000-567a-97c1-ecad-9550a5d17b9e	2204	Miklavž na Dravskem polju
00050000-567a-97c1-44bf-d6b4510774a0	2275	Miklavž pri Ormožu
00050000-567a-97c1-c3bd-982da204c917	5291	Miren
00050000-567a-97c1-ef2f-cecb653c9911	8233	Mirna
00050000-567a-97c1-2e2b-37ce20d17bf5	8216	Mirna Peč
00050000-567a-97c1-314b-0173f95632cd	2382	Mislinja
00050000-567a-97c1-aaab-9aa2793658d8	4281	Mojstrana
00050000-567a-97c1-ec1e-12652286e2e2	8230	Mokronog
00050000-567a-97c1-28f8-8195fe9e8022	1251	Moravče
00050000-567a-97c1-ac98-49511240c3b0	9226	Moravske Toplice
00050000-567a-97c1-3fb6-bafcb0a71a38	5216	Most na Soči
00050000-567a-97c1-2f05-39955e345a3e	1221	Motnik
00050000-567a-97c1-1a44-cab5645219cc	3330	Mozirje
00050000-567a-97c1-4556-85a59abed892	9000	Murska Sobota 
00050000-567a-97c1-a557-ea2a97250109	9001	Murska Sobota - poštni predali
00050000-567a-97c1-1816-467057e95ecf	2366	Muta
00050000-567a-97c1-1c07-411c9fbc1b2e	4202	Naklo
00050000-567a-97c1-f129-037e783e3281	3331	Nazarje
00050000-567a-97c1-9202-f07c8a5bd6ac	1357	Notranje Gorice
00050000-567a-97c1-ceab-e4bdab9a4c97	3203	Nova Cerkev
00050000-567a-97c1-4e4c-877ebfc9690e	5000	Nova Gorica 
00050000-567a-97c1-8b2c-d04fe765c8dc	5001	Nova Gorica - poštni predali
00050000-567a-97c1-479b-fd32fff9485e	1385	Nova vas
00050000-567a-97c1-deb2-45fc80a6e6b3	8000	Novo mesto
00050000-567a-97c1-0431-17e6d70813c0	8001	Novo mesto - poštni predali
00050000-567a-97c1-356e-7f5a271ccac1	6243	Obrov
00050000-567a-97c1-18af-e268178e835e	9233	Odranci
00050000-567a-97c1-f629-2747fdc0155f	2317	Oplotnica
00050000-567a-97c1-5df7-819df21ec82b	2312	Orehova vas
00050000-567a-97c1-3d84-16eeab7e682c	2270	Ormož
00050000-567a-97c1-b937-9b8832f33f44	1316	Ortnek
00050000-567a-97c1-a6fa-70d926bec4ad	1337	Osilnica
00050000-567a-97c1-d0af-86b52bb79a1e	8222	Otočec
00050000-567a-97c1-b2d2-59cfe4cabd35	2361	Ožbalt
00050000-567a-97c1-0d26-fb0936bcf2cf	2231	Pernica
00050000-567a-97c1-cc3f-c6319cd14de9	2211	Pesnica pri Mariboru
00050000-567a-97c1-523a-c0869beed7eb	9203	Petrovci
00050000-567a-97c1-7e8c-d5a96026dbdc	3301	Petrovče
00050000-567a-97c1-28c6-1bc40100a418	6330	Piran/Pirano
00050000-567a-97c1-9b07-7b018eb4fe69	8255	Pišece
00050000-567a-97c1-9e22-3d98e8e98fa7	6257	Pivka
00050000-567a-97c1-2cad-8efe467f6d19	6232	Planina
00050000-567a-97c1-48ee-f83ed38503f5	3225	Planina pri Sevnici
00050000-567a-97c1-8b48-83faf07760c5	6276	Pobegi
00050000-567a-97c1-898b-f97d944270ef	8312	Podbočje
00050000-567a-97c1-991a-73e7c2858354	5243	Podbrdo
00050000-567a-97c1-b4c8-57cf5e1ebdac	3254	Podčetrtek
00050000-567a-97c1-fe57-069694a2d123	2273	Podgorci
00050000-567a-97c1-3ed2-cc1dd69c84cb	6216	Podgorje
00050000-567a-97c1-51cd-094edbac6cc1	2381	Podgorje pri Slovenj Gradcu
00050000-567a-97c1-6aeb-f72087278d1b	6244	Podgrad
00050000-567a-97c1-448c-694df47d8336	1414	Podkum
00050000-567a-97c1-3ced-20cc56f9f59a	2286	Podlehnik
00050000-567a-97c1-906c-3583df35750c	5272	Podnanos
00050000-567a-97c1-232d-3226fe346b09	4244	Podnart
00050000-567a-97c1-6f75-4e8421c7b246	3241	Podplat
00050000-567a-97c1-a817-efe3c9fd966c	3257	Podsreda
00050000-567a-97c1-2c85-101d42e881c2	2363	Podvelka
00050000-567a-97c1-2773-af281f2d701e	2208	Pohorje
00050000-567a-97c1-7c24-e119d6855334	2257	Polenšak
00050000-567a-97c1-86d6-21d3ce918e8f	1355	Polhov Gradec
00050000-567a-97c1-3c9f-980518dfe6cf	4223	Poljane nad Škofjo Loko
00050000-567a-97c1-1274-0ba7c4a8ec17	2319	Poljčane
00050000-567a-97c1-e993-c1033dd316f4	1272	Polšnik
00050000-567a-97c1-1cc5-c5d2aad5e3db	3313	Polzela
00050000-567a-97c1-1b21-aee15af630f2	3232	Ponikva
00050000-567a-97c1-9f32-d6e9f550631a	6320	Portorož/Portorose
00050000-567a-97c1-07a6-cf92499ca43d	6230	Postojna
00050000-567a-97c1-13f5-b6bf5d9063ca	2331	Pragersko
00050000-567a-97c1-c532-d55d7cac4b3a	3312	Prebold
00050000-567a-97c1-83b8-362108ebaebc	4205	Preddvor
00050000-567a-97c1-ade0-f28977b72b9b	6255	Prem
00050000-567a-97c1-b615-4e448984fdc4	1352	Preserje
00050000-567a-97c1-624d-7581dd77c068	6258	Prestranek
00050000-567a-97c1-bdc4-fe2ce2eb71fe	2391	Prevalje
00050000-567a-97c1-e67d-bcef19ac2cec	3262	Prevorje
00050000-567a-97c1-3089-c68ff9d4ee03	1276	Primskovo 
00050000-567a-97c1-7557-14821e563417	3253	Pristava pri Mestinju
00050000-567a-97c1-80eb-64437de4bedb	9207	Prosenjakovci/Partosfalva
00050000-567a-97c1-2567-b3674756e53f	5297	Prvačina
00050000-567a-97c1-07ed-8cd68aa8380f	2250	Ptuj
00050000-567a-97c1-f2b2-3a104d905e81	2323	Ptujska Gora
00050000-567a-97c1-539a-2b31760b2693	9201	Puconci
00050000-567a-97c1-4d83-6d47e08b889d	2327	Rače
00050000-567a-97c1-a8d0-3d5eba8c6f29	1433	Radeče
00050000-567a-97c1-a6b0-c983f0061506	9252	Radenci
00050000-567a-97c1-6348-89adbfc96088	2360	Radlje ob Dravi
00050000-567a-97c1-2641-be0b2abfebb5	1235	Radomlje
00050000-567a-97c1-32a7-01a5de756131	4240	Radovljica
00050000-567a-97c1-2b68-ef346c44ad46	8274	Raka
00050000-567a-97c1-cc7f-29d5be66b826	1381	Rakek
00050000-567a-97c1-ad1f-ab23486a61c3	4283	Rateče - Planica
00050000-567a-97c1-a08c-9441a0aaf632	2390	Ravne na Koroškem
00050000-567a-97c1-5229-53106c78585f	9246	Razkrižje
00050000-567a-97c1-4012-8c5ee6e5a8b3	3332	Rečica ob Savinji
00050000-567a-97c1-01b4-b9108dc64f24	5292	Renče
00050000-567a-97c1-23b2-7978a7107ef6	1310	Ribnica
00050000-567a-97c1-acc1-7f39e1b12eeb	2364	Ribnica na Pohorju
00050000-567a-97c1-0b65-164124c3623c	3272	Rimske Toplice
00050000-567a-97c1-bcb1-d0bfa92b620e	1314	Rob
00050000-567a-97c1-e802-87386195d4bd	5215	Ročinj
00050000-567a-97c1-479c-2458ccce40c9	3250	Rogaška Slatina
00050000-567a-97c1-b23c-60d947600345	9262	Rogašovci
00050000-567a-97c1-0575-1d5716c37171	3252	Rogatec
00050000-567a-97c1-4036-60a77de6cc72	1373	Rovte
00050000-567a-97c1-2337-a05fc8fee0fd	2342	Ruše
00050000-567a-97c1-5c8b-95261cf83f8f	1282	Sava
00050000-567a-97c1-2448-05943d2f0623	6333	Sečovlje/Sicciole
00050000-567a-97c1-b8f9-a7195f3dfece	4227	Selca
00050000-567a-97c1-1b01-55750bfab8fb	2352	Selnica ob Dravi
00050000-567a-97c1-9dac-afba9b9b0f8b	8333	Semič
00050000-567a-97c1-795a-366f64c27e49	8281	Senovo
00050000-567a-97c1-5267-5a26e8493150	6224	Senožeče
00050000-567a-97c1-b229-f6bb6fa9f3de	8290	Sevnica
00050000-567a-97c1-c1ed-67e809bd92fd	6210	Sežana
00050000-567a-97c1-0ca8-0150ecb66da6	2214	Sladki Vrh
00050000-567a-97c1-26cf-3e2a8c0618d5	5283	Slap ob Idrijci
00050000-567a-97c1-9c6c-7b9d93b18b12	2380	Slovenj Gradec
00050000-567a-97c1-48cc-ebdcf0726924	2310	Slovenska Bistrica
00050000-567a-97c1-3f5a-9a2bc552adb3	3210	Slovenske Konjice
00050000-567a-97c1-a7ca-f056c7a30d18	1216	Smlednik
00050000-567a-97c1-bf3e-4a89dba721e6	5232	Soča
00050000-567a-97c1-a360-21137a97aa94	1317	Sodražica
00050000-567a-97c1-d48c-4d8ee6f289ae	3335	Solčava
00050000-567a-97c1-6fdd-a71d812e0ad7	5250	Solkan
00050000-567a-97c1-05e5-bce01db161cb	4229	Sorica
00050000-567a-97c1-cc51-f118d143270b	4225	Sovodenj
00050000-567a-97c1-4dc6-e524de689834	5281	Spodnja Idrija
00050000-567a-97c1-2d90-a74529740aab	2241	Spodnji Duplek
00050000-567a-97c1-10d0-409ca6183e32	9245	Spodnji Ivanjci
00050000-567a-97c1-0fb7-239bccd9baa3	2277	Središče ob Dravi
00050000-567a-97c1-99ff-5f80b69e200f	4267	Srednja vas v Bohinju
00050000-567a-97c1-d003-47cad7d180cc	8256	Sromlje 
00050000-567a-97c1-8e44-3656f03808d3	5224	Srpenica
00050000-567a-97c1-5032-bb218b4a297d	1242	Stahovica
00050000-567a-97c1-969a-2ec21ed12427	1332	Stara Cerkev
00050000-567a-97c1-7d0d-f93c0e0210eb	8342	Stari trg ob Kolpi
00050000-567a-97c1-d691-f9bdaf277652	1386	Stari trg pri Ložu
00050000-567a-97c1-4b3a-2efeaae5eb24	2205	Starše
00050000-567a-97c1-de12-f8021cf9c9f2	2289	Stoperce
00050000-567a-97c1-a3f0-70f01ec866e7	8322	Stopiče
00050000-567a-97c1-54cd-8380cfda0c26	3206	Stranice
00050000-567a-97c1-3bee-5a16f15bc78c	8351	Straža
00050000-567a-97c1-48df-edf69bf166d6	1313	Struge
00050000-567a-97c1-c73b-66fa2f179d8c	8293	Studenec
00050000-567a-97c1-cfed-1652e541edce	8331	Suhor
00050000-567a-97c1-7e92-46f2579feef2	2233	Sv. Ana v Slovenskih goricah
00050000-567a-97c1-acda-eaff0efdfd7f	2235	Sv. Trojica v Slovenskih goricah
00050000-567a-97c1-4686-a3a8b37a187f	2353	Sveti Duh na Ostrem Vrhu
00050000-567a-97c1-c02e-ed7950eea6fa	9244	Sveti Jurij ob Ščavnici
00050000-567a-97c1-6eff-8030e58c16ee	3264	Sveti Štefan
00050000-567a-97c1-9d16-79444221ec9b	2258	Sveti Tomaž
00050000-567a-97c1-e01d-63260155d881	9204	Šalovci
00050000-567a-97c1-fc82-b56030c808ed	5261	Šempas
00050000-567a-97c1-34c2-8554bc0b1aea	5290	Šempeter pri Gorici
00050000-567a-97c1-9467-9ca0f5afe07e	3311	Šempeter v Savinjski dolini
00050000-567a-97c1-22ef-c6c3c8236425	4208	Šenčur
00050000-567a-97c1-6eb0-f463c63b87be	2212	Šentilj v Slovenskih goricah
00050000-567a-97c1-2f6f-9be86fe40066	8297	Šentjanž
00050000-567a-97c1-f67b-865850f52bea	2373	Šentjanž pri Dravogradu
00050000-567a-97c1-531c-6f4f7ef2221d	8310	Šentjernej
00050000-567a-97c1-64db-2630af7ade4a	3230	Šentjur
00050000-567a-97c1-7f7e-77eb303f79c0	3271	Šentrupert
00050000-567a-97c1-c736-454c88d176de	8232	Šentrupert
00050000-567a-97c1-4046-afe389cf32b7	1296	Šentvid pri Stični
00050000-567a-97c1-39b4-1dfca1090b3d	8275	Škocjan
00050000-567a-97c1-250c-7610dfa277b8	6281	Škofije
00050000-567a-97c1-b991-d65072ecfd2e	4220	Škofja Loka
00050000-567a-97c1-ed0a-233e2f8c194f	3211	Škofja vas
00050000-567a-97c1-228a-62da4a453198	1291	Škofljica
00050000-567a-97c1-d36f-2856b2d2298f	6274	Šmarje
00050000-567a-97c1-dbeb-9ed84f72096e	1293	Šmarje - Sap
00050000-567a-97c1-afa6-a6f4687dcac8	3240	Šmarje pri Jelšah
00050000-567a-97c1-822a-89eff9e9216d	8220	Šmarješke Toplice
00050000-567a-97c1-8515-e45bb4e357b3	2315	Šmartno na Pohorju
00050000-567a-97c1-53b9-1d6015d2bdd0	3341	Šmartno ob Dreti
00050000-567a-97c1-c3a0-4efabece0bf4	3327	Šmartno ob Paki
00050000-567a-97c1-f2a7-39e2a365674f	1275	Šmartno pri Litiji
00050000-567a-97c1-d6cf-5bd2f45f5ef1	2383	Šmartno pri Slovenj Gradcu
00050000-567a-97c1-09f8-869b9c05c3fc	3201	Šmartno v Rožni dolini
00050000-567a-97c1-747b-58177b659bcd	3325	Šoštanj
00050000-567a-97c1-e777-4c3f695fb8cb	6222	Štanjel
00050000-567a-97c1-33b5-9ac3140a0d14	3220	Štore
00050000-567a-97c1-e88c-df212d02dd99	3304	Tabor
00050000-567a-97c1-a9a7-a66f55ea9614	3221	Teharje
00050000-567a-97c1-7eea-baf9381ea359	9251	Tišina
00050000-567a-97c1-8fb9-e605e482ef0c	5220	Tolmin
00050000-567a-97c1-a6a3-e2828ffe2736	3326	Topolšica
00050000-567a-97c1-e737-c3541ebed466	2371	Trbonje
00050000-567a-97c1-8b7f-bca0251f1b6c	1420	Trbovlje
00050000-567a-97c1-79e9-f05c643a8037	8231	Trebelno 
00050000-567a-97c1-e2e1-8419cf5a5301	8210	Trebnje
00050000-567a-97c1-23c2-f82cb530845e	5252	Trnovo pri Gorici
00050000-567a-97c1-f515-ef7a4fa9ec8a	2254	Trnovska vas
00050000-567a-97c1-07e0-ac5348c37c3d	1222	Trojane
00050000-567a-97c1-7138-ef0d91c57c03	1236	Trzin
00050000-567a-97c1-23f8-382ba5d57689	4290	Tržič
00050000-567a-97c1-f02b-46078018c4e4	8295	Tržišče
00050000-567a-97c1-7de8-f84a42423959	1311	Turjak
00050000-567a-97c1-f388-d007cf507ea0	9224	Turnišče
00050000-567a-97c1-b6e8-b5c4ccead478	8323	Uršna sela
00050000-567a-97c1-76c0-0284d66c0a33	1252	Vače
00050000-567a-97c1-b854-22aae7052046	3320	Velenje 
00050000-567a-97c1-5a74-cd19f2bf538a	3322	Velenje - poštni predali
00050000-567a-97c1-e6b6-51500900abc1	8212	Velika Loka
00050000-567a-97c1-faba-86cbc1ca8b9f	2274	Velika Nedelja
00050000-567a-97c1-f1cd-a0c52427cc40	9225	Velika Polana
00050000-567a-97c1-e108-5defa5834425	1315	Velike Lašče
00050000-567a-97c1-8db6-d07730a04d79	8213	Veliki Gaber
00050000-567a-97c1-8ad0-326b2aa95b01	9241	Veržej
00050000-567a-97c1-f1ff-3f3636a7ad7b	1312	Videm - Dobrepolje
00050000-567a-97c1-fb62-b1180c9f334a	2284	Videm pri Ptuju
00050000-567a-97c1-036b-7115e9121bf9	8344	Vinica
00050000-567a-97c1-b979-d046d5dd030a	5271	Vipava
00050000-567a-97c1-3526-7829a33b200c	4212	Visoko
00050000-567a-97c1-85c2-73fc227acdcb	1294	Višnja Gora
00050000-567a-97c1-8d1d-656301faabbc	3205	Vitanje
00050000-567a-97c1-fead-6798d18c9d57	2255	Vitomarci
00050000-567a-97c1-057f-1621c3e07aee	1217	Vodice
00050000-567a-97c1-d57a-60b89ce16472	3212	Vojnik\t
00050000-567a-97c1-68d8-ea4010c04b2a	5293	Volčja Draga
00050000-567a-97c1-5f15-90e5671e282f	2232	Voličina
00050000-567a-97c1-297e-9be582e2d895	3305	Vransko
00050000-567a-97c1-2f25-6f42df358c28	6217	Vremski Britof
00050000-567a-97c1-2c63-60c2892ac226	1360	Vrhnika
00050000-567a-97c1-1938-7a6b3698b942	2365	Vuhred
00050000-567a-97c1-796e-f12af57d1bf1	2367	Vuzenica
00050000-567a-97c1-900f-559423296feb	8292	Zabukovje 
00050000-567a-97c1-579c-577767f906ac	1410	Zagorje ob Savi
00050000-567a-97c1-e987-559db197507f	1303	Zagradec
00050000-567a-97c1-4a44-2fbd6b61a9a0	2283	Zavrč
00050000-567a-97c1-c8fc-f2b72fcb5cdb	8272	Zdole 
00050000-567a-97c1-9d30-69442a386876	4201	Zgornja Besnica
00050000-567a-97c1-a0ca-45030dc0f179	2242	Zgornja Korena
00050000-567a-97c1-a30f-7c2b2bd0b266	2201	Zgornja Kungota
00050000-567a-97c1-de85-a453ffebb2ef	2316	Zgornja Ložnica
00050000-567a-97c1-06c0-a40acb16da50	2314	Zgornja Polskava
00050000-567a-97c1-7569-a056b22312cd	2213	Zgornja Velka
00050000-567a-97c1-fa77-298d1a4bc0d6	4247	Zgornje Gorje
00050000-567a-97c1-7522-d5b2e7642fa3	4206	Zgornje Jezersko
00050000-567a-97c1-e0f1-c8a557e0084e	2285	Zgornji Leskovec
00050000-567a-97c1-afb9-a1b04cea8d80	1432	Zidani Most
00050000-567a-97c1-0605-0b63838a4c8c	3214	Zreče
00050000-567a-97c1-607d-777e3c2b2c07	4209	Žabnica
00050000-567a-97c1-deb8-21450aab96f6	3310	Žalec
00050000-567a-97c1-e6a1-dec476219567	4228	Železniki
00050000-567a-97c1-3a5f-65a593f1eaa4	2287	Žetale
00050000-567a-97c1-22ef-887ae42112fb	4226	Žiri
00050000-567a-97c1-ef4b-efb89f09a673	4274	Žirovnica
00050000-567a-97c1-62b3-a75adf4a71ea	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 32865353)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 32864917)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 32864665)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-567a-97c5-8867-4b85dfe30efc	00080000-567a-97c5-1208-db23f832983c	\N	00040000-567a-97c1-c0d8-10e07035cad6	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-567a-97c5-07ac-1ab48109412c	00080000-567a-97c5-1208-db23f832983c	\N	00040000-567a-97c1-c0d8-10e07035cad6	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-567a-97c5-4b74-04658f6f1c9f	00080000-567a-97c5-ad8b-75b5cecd4598	\N	00040000-567a-97c1-c0d8-10e07035cad6	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 32864809)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-567a-97c1-e64d-86af9cbefb9e	novo leto	1	1	\N	t
00430000-567a-97c1-f09f-c1ff0f28b47b	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-567a-97c1-45ad-4059f22ef8ab	dan upora proti okupatorju	27	4	\N	t
00430000-567a-97c1-bcfe-42386a740268	praznik dela	1	5	\N	t
00430000-567a-97c1-bd7d-3cd876f60cad	praznik dela	2	5	\N	t
00430000-567a-97c1-336a-07caf658b97b	dan Primoža Trubarja	8	6	\N	f
00430000-567a-97c1-7a62-ab7817f80774	dan državnosti	25	6	\N	t
00430000-567a-97c1-6353-718d9c65f749	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-567a-97c1-86ce-d39f36572f43	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-567a-97c1-d713-49c18bb19b0f	dan suverenosti	25	10	\N	f
00430000-567a-97c1-ea97-a5696b692033	dan spomina na mrtve	1	11	\N	t
00430000-567a-97c1-3a49-556cb8724e94	dan Rudolfa Maistra	23	11	\N	f
00430000-567a-97c1-3f8d-da013312adc4	božič	25	12	\N	t
00430000-567a-97c1-2011-bb3db7f1cebc	dan samostojnosti in enotnosti	26	12	\N	t
00430000-567a-97c1-7f67-e6ef05981b26	Marijino vnebovzetje	15	8	\N	t
00430000-567a-97c1-d8be-eb55d4d4369c	dan reformacije	31	10	\N	t
00430000-567a-97c1-29d7-25527c350031	velikonočna nedelja	27	3	2016	t
00430000-567a-97c1-a76f-925826c43800	velikonočna nedelja	16	4	2017	t
00430000-567a-97c1-43b2-831c064dd918	velikonočna nedelja	1	4	2018	t
00430000-567a-97c1-52a1-49d9c74ad858	velikonočna nedelja	21	4	2019	t
00430000-567a-97c1-f0a3-02f55dedb766	velikonočna nedelja	12	4	2020	t
00430000-567a-97c1-6e10-8c42092c418c	velikonočna nedelja	4	4	2021	t
00430000-567a-97c1-b24b-a8b5b5e4aa3b	velikonočna nedelja	17	4	2022	t
00430000-567a-97c1-a089-25316299f64c	velikonočna nedelja	9	4	2023	t
00430000-567a-97c1-9b38-8c6975c526a4	velikonočna nedelja	31	3	2024	t
00430000-567a-97c1-0411-561e81f19b7c	velikonočna nedelja	20	4	2025	t
00430000-567a-97c1-1400-82dab5157c34	velikonočna nedelja	5	4	2026	t
00430000-567a-97c1-b24a-7bc0033566a0	velikonočna nedelja	28	3	2027	t
00430000-567a-97c1-2c56-6b4790c78fd5	velikonočna nedelja	16	4	2028	t
00430000-567a-97c1-adcc-f5826e3f46cc	velikonočna nedelja	1	4	2029	t
00430000-567a-97c1-2930-75b862960e50	velikonočna nedelja	21	4	2030	t
00430000-567a-97c1-0a45-f4d8811c3ecb	velikonočni ponedeljek	28	3	2016	t
00430000-567a-97c1-3531-97bdd70a5ff7	velikonočni ponedeljek	17	4	2017	t
00430000-567a-97c1-4e2b-c2b9171cbeaa	velikonočni ponedeljek	2	4	2018	t
00430000-567a-97c1-0ce8-e9c7934120e4	velikonočni ponedeljek	22	4	2019	t
00430000-567a-97c1-40b3-43fb50cbd07a	velikonočni ponedeljek	13	4	2020	t
00430000-567a-97c1-c10e-4796a5b4c7a7	velikonočni ponedeljek	5	4	2021	t
00430000-567a-97c1-b68e-1c16b2c53783	velikonočni ponedeljek	18	4	2022	t
00430000-567a-97c1-cfd5-634be7cc9fea	velikonočni ponedeljek	10	4	2023	t
00430000-567a-97c1-4cdd-c89078cbb3ee	velikonočni ponedeljek	1	4	2024	t
00430000-567a-97c1-1830-db495ecc6776	velikonočni ponedeljek	21	4	2025	t
00430000-567a-97c1-5968-89f7147b1bfc	velikonočni ponedeljek	6	4	2026	t
00430000-567a-97c1-e335-778c632f9436	velikonočni ponedeljek	29	3	2027	t
00430000-567a-97c1-2fb6-d3c5e13a1cdf	velikonočni ponedeljek	17	4	2028	t
00430000-567a-97c1-0c5e-185652613d67	velikonočni ponedeljek	2	4	2029	t
00430000-567a-97c1-aae8-af906545f078	velikonočni ponedeljek	22	4	2030	t
00430000-567a-97c1-b064-a88d03805ff7	binkoštna nedelja - binkošti	15	5	2016	t
00430000-567a-97c1-a18c-35d5d0e37264	binkoštna nedelja - binkošti	4	6	2017	t
00430000-567a-97c1-5c0f-8fd09b81d10a	binkoštna nedelja - binkošti	20	5	2018	t
00430000-567a-97c1-f40f-10f761fda2dc	binkoštna nedelja - binkošti	9	6	2019	t
00430000-567a-97c1-049a-8d10d6989ffa	binkoštna nedelja - binkošti	31	5	2020	t
00430000-567a-97c1-dffc-2e96575fd424	binkoštna nedelja - binkošti	23	5	2021	t
00430000-567a-97c1-4756-a64928befbc0	binkoštna nedelja - binkošti	5	6	2022	t
00430000-567a-97c1-624a-2439308eeb68	binkoštna nedelja - binkošti	28	5	2023	t
00430000-567a-97c1-19ba-c7ad827d0517	binkoštna nedelja - binkošti	19	5	2024	t
00430000-567a-97c1-86cf-5e40c28c9005	binkoštna nedelja - binkošti	8	6	2025	t
00430000-567a-97c1-04de-254ea0deb3d0	binkoštna nedelja - binkošti	24	5	2026	t
00430000-567a-97c1-6ebc-6e2d424e1a3f	binkoštna nedelja - binkošti	16	5	2027	t
00430000-567a-97c1-310a-c775410b0d6c	binkoštna nedelja - binkošti	4	6	2028	t
00430000-567a-97c1-e0f2-c67bd6b5a81e	binkoštna nedelja - binkošti	20	5	2029	t
00430000-567a-97c1-eacf-4ca54199209b	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 32864769)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 32864781)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 32864929)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 32865367)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 32865377)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-567a-97c5-24ce-4efff1ca7d46	00080000-567a-97c5-beb7-2837ae61f71c	0987	AK
00190000-567a-97c5-5375-66c413aeb87a	00080000-567a-97c5-ad8b-75b5cecd4598	0989	AK
00190000-567a-97c5-e31b-0df4185426ad	00080000-567a-97c5-fe31-ab46c8d41b1e	0986	AK
00190000-567a-97c5-8b34-0f4844fe930a	00080000-567a-97c5-c108-dfa58915b112	0984	AK
00190000-567a-97c5-14f0-9ea560288df1	00080000-567a-97c5-c6cf-c3b293b42d36	0983	AK
00190000-567a-97c5-7ddc-0cacd20f805d	00080000-567a-97c5-837e-68086102f1b1	0982	AK
00190000-567a-97c7-250b-27123e6f41ff	00080000-567a-97c7-a0bb-ae7c1c7880e8	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 32865266)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-567a-97c5-dc32-fc88ab73587e	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 32865385)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 32864958)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-567a-97c4-89c2-6da8d149d107	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-567a-97c4-4320-e0f2560b9629	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-567a-97c4-f357-cc221c817616	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-567a-97c4-7dd3-0684cc7c1f32	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-567a-97c4-c8f7-f70e3d31da93	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-567a-97c4-623c-8a2da87d0431	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-567a-97c4-7188-bfbea17dd3f8	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 32864902)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 32864892)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 32865104)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 32865034)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 32864743)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 32864505)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-567a-97c7-a0bb-ae7c1c7880e8	00010000-567a-97c3-929a-ce1ec5296d21	2015-12-23 13:47:03	INS	a:0:{}
2	App\\Entity\\Option	00000000-567a-97c7-e373-b3f4c67c2b3b	00010000-567a-97c3-929a-ce1ec5296d21	2015-12-23 13:47:03	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-567a-97c7-250b-27123e6f41ff	00010000-567a-97c3-929a-ce1ec5296d21	2015-12-23 13:47:03	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 32864971)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 32864543)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-567a-97c2-610b-7dabf7b8f563	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-567a-97c2-a2cb-f0e1382beeaa	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-567a-97c2-6e24-6e0da7738ce1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-567a-97c2-c86f-74cf9eafc7ef	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-567a-97c2-78d1-bf46cde4c9cb	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-567a-97c2-82c3-0b50571d9717	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-567a-97c2-ecb6-621694aac50a	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-567a-97c2-7fbd-5e285dc90eb0	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-567a-97c2-9757-a4b70c80949c	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-567a-97c2-d1e9-2f41f4318e18	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-567a-97c2-6677-855e56add2f8	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-567a-97c2-ba94-fab15e9154d1	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-567a-97c2-430e-3092cd178133	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-567a-97c2-99a1-f2933fa8d676	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-567a-97c2-d357-defeb4a965fa	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-567a-97c2-4781-b37a11842a6c	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-567a-97c2-7469-bde08e707746	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-567a-97c2-0fd7-0b2519ebe442	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-567a-97c2-0e3d-bdf4d4d2f277	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-567a-97c2-625c-054ba8ccac1d	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-567a-97c2-9e30-b8fe60abf10f	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-567a-97c2-0fd9-eb9f592cacd3	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-567a-97c2-9bec-acf093e3df35	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-567a-97c2-80ba-64444fe3a7d5	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-567a-97c2-d0c2-1dc87413b064	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-567a-97c2-bf09-4203f55a80ac	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-567a-97c2-1b86-dd10bdf8fa48	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-567a-97c2-4221-7ef1b609c442	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-567a-97c2-2239-394332f6e857	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-567a-97c2-45e4-f33ade469448	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-567a-97c2-b394-6b57a7e6a2f8	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-567a-97c2-e88c-98e11bbc927a	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-567a-97c2-f460-a9b538fd13f9	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-567a-97c2-74fe-9fe3cb644288	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-567a-97c2-8f9e-038545bf7830	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-567a-97c2-6a44-c7e0bb1a08ba	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-567a-97c2-0273-aa1eadee04e8	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-567a-97c2-5e9b-eac501a60129	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-567a-97c2-8d56-4e016957a19c	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-567a-97c2-4296-42ee1daa7717	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-567a-97c2-1aa9-f62bb1ef8c1f	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-567a-97c2-3b80-a56332e51900	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-567a-97c2-4083-f3e183f4587c	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-567a-97c2-63b9-90ce7427696b	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-567a-97c2-240b-69aeb0715e55	direktor	minimalne pravice za direktorja	t
00020000-567a-97c2-1f75-a152a42c9a74	arhivar	arhivar	t
00020000-567a-97c2-5845-f3d846b08fa5	dramaturg	dramaturg	t
00020000-567a-97c2-d5b8-e206f14bf440	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-567a-97c2-b625-bbea506ef3ca	poslovni-sekretar	poslovni sekretar	t
00020000-567a-97c2-7bf6-b2ce6749061c	vodja-tehnike	vodja tehnike	t
00020000-567a-97c2-1a0a-f98e62dc4bd8	racunovodja	računovodja	t
00020000-567a-97c5-aacc-eeabdc4a17cf	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-567a-97c5-0255-c73622b393fd	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-7a75-aed9957dd912	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-8bb3-bec8b725ce35	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-230f-6a5556f8e557	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-7041-910385c3db23	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-2d1a-c18927b2f530	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-864d-778df1e10917	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-2e03-120ffe52e4f2	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-7965-f1991f46384e	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-ddec-7113459b415c	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-487b-0d26a6599260	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-fa8e-4ae6aa97f161	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-783b-ea6296e25637	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-991d-127f89a577a5	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-1185-cbc82aaff840	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-1e9c-7aa329b53ec4	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-a9d4-c447b695d050	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-4bde-a82921c7a941	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-03d2-64a82022e277	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-567a-97c5-89c7-1100b594c238	Trr-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-17cb-d17ab30ed12a	Trr-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-6846-c366597027d8	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-aaf8-f3b145f41e49	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-bcd7-fdd6961330e2	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-bbda-3d26b0c3f037	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-cdcb-8cc918967838	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-14c3-e51ccf7a6f93	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-c713-39a58de7f425	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-b370-177ecbecd09b	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-8cab-e5be00e80cb5	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-09b2-50de1cd7869c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-82db-178879bc3d47	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-8b33-cc198f8ddd21	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-c4a1-2f5bf2899c30	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-49b0-cfd076fcc77b	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-feed-dd2ff5d3e043	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-4ca9-2f62e3231b11	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-567a-97c5-343e-6d723ddcd944	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 32864527)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-567a-97c2-6408-1fad6e4f064c	00020000-567a-97c2-6e24-6e0da7738ce1
00010000-567a-97c3-929a-ce1ec5296d21	00020000-567a-97c2-6e24-6e0da7738ce1
00010000-567a-97c5-3314-fab411e87fdf	00020000-567a-97c5-aacc-eeabdc4a17cf
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-0255-c73622b393fd
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-7041-910385c3db23
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-7965-f1991f46384e
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-487b-0d26a6599260
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-783b-ea6296e25637
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-4bde-a82921c7a941
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-8bb3-bec8b725ce35
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-89c7-1100b594c238
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-aaf8-f3b145f41e49
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-bbda-3d26b0c3f037
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-14c3-e51ccf7a6f93
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-b370-177ecbecd09b
00010000-567a-97c5-b2f7-1ce709f62d96	00020000-567a-97c5-8b33-cc198f8ddd21
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-0255-c73622b393fd
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-7a75-aed9957dd912
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-8bb3-bec8b725ce35
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-230f-6a5556f8e557
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-783b-ea6296e25637
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-1e9c-7aa329b53ec4
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-89c7-1100b594c238
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-aaf8-f3b145f41e49
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-bbda-3d26b0c3f037
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-14c3-e51ccf7a6f93
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-b370-177ecbecd09b
00010000-567a-97c5-7e17-a64738420291	00020000-567a-97c5-8b33-cc198f8ddd21
00010000-567a-97c5-319b-70552800bd29	00020000-567a-97c5-0255-c73622b393fd
00010000-567a-97c5-319b-70552800bd29	00020000-567a-97c5-7a75-aed9957dd912
00010000-567a-97c5-319b-70552800bd29	00020000-567a-97c5-8bb3-bec8b725ce35
00010000-567a-97c5-319b-70552800bd29	00020000-567a-97c5-230f-6a5556f8e557
00010000-567a-97c5-319b-70552800bd29	00020000-567a-97c5-487b-0d26a6599260
00010000-567a-97c5-319b-70552800bd29	00020000-567a-97c5-783b-ea6296e25637
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-7a75-aed9957dd912
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-2d1a-c18927b2f530
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-ddec-7113459b415c
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-fa8e-4ae6aa97f161
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-487b-0d26a6599260
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-a9d4-c447b695d050
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-783b-ea6296e25637
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-991d-127f89a577a5
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-89c7-1100b594c238
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-17cb-d17ab30ed12a
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-aaf8-f3b145f41e49
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-bcd7-fdd6961330e2
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-bbda-3d26b0c3f037
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-cdcb-8cc918967838
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-14c3-e51ccf7a6f93
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-c713-39a58de7f425
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-b370-177ecbecd09b
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-8cab-e5be00e80cb5
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-8b33-cc198f8ddd21
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-c4a1-2f5bf2899c30
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-feed-dd2ff5d3e043
00010000-567a-97c5-c3ac-9c0b853daed9	00020000-567a-97c5-4ca9-2f62e3231b11
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-7a75-aed9957dd912
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-2d1a-c18927b2f530
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-2e03-120ffe52e4f2
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-ddec-7113459b415c
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-fa8e-4ae6aa97f161
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-487b-0d26a6599260
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-a9d4-c447b695d050
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-783b-ea6296e25637
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-991d-127f89a577a5
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-1185-cbc82aaff840
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-89c7-1100b594c238
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-17cb-d17ab30ed12a
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-6846-c366597027d8
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-aaf8-f3b145f41e49
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-bcd7-fdd6961330e2
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-bbda-3d26b0c3f037
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-cdcb-8cc918967838
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-14c3-e51ccf7a6f93
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-c713-39a58de7f425
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-b370-177ecbecd09b
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-8cab-e5be00e80cb5
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-8b33-cc198f8ddd21
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-c4a1-2f5bf2899c30
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-49b0-cfd076fcc77b
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-feed-dd2ff5d3e043
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-4ca9-2f62e3231b11
00010000-567a-97c5-b9b6-b078aa84a518	00020000-567a-97c5-343e-6d723ddcd944
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-7a75-aed9957dd912
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-8bb3-bec8b725ce35
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-2d1a-c18927b2f530
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-864d-778df1e10917
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-2e03-120ffe52e4f2
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-7041-910385c3db23
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-ddec-7113459b415c
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-fa8e-4ae6aa97f161
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-487b-0d26a6599260
00010000-567a-97c5-f24c-04e8289bce27	00020000-567a-97c5-a9d4-c447b695d050
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-0255-c73622b393fd
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-230f-6a5556f8e557
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-7041-910385c3db23
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-7965-f1991f46384e
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-487b-0d26a6599260
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-783b-ea6296e25637
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-4bde-a82921c7a941
00010000-567a-97c5-14b7-d840bd961a68	00020000-567a-97c5-09b2-50de1cd7869c
00010000-567a-97c5-6af3-d5daccb7d09a	00020000-567a-97c5-03d2-64a82022e277
00010000-567a-97c5-d96c-51eb3dab3d1d	00020000-567a-97c2-240b-69aeb0715e55
00010000-567a-97c5-c0a9-6bc911bcc940	00020000-567a-97c2-1f75-a152a42c9a74
00010000-567a-97c5-241d-38a22aabbeea	00020000-567a-97c2-5845-f3d846b08fa5
00010000-567a-97c5-fe3d-62f9cd8dc2d4	00020000-567a-97c2-d5b8-e206f14bf440
00010000-567a-97c5-f368-23e16e71aecc	00020000-567a-97c2-b625-bbea506ef3ca
00010000-567a-97c5-47d5-b8b9d75dbf5e	00020000-567a-97c2-7bf6-b2ce6749061c
00010000-567a-97c5-f3cf-ed848fac4f75	00020000-567a-97c2-1a0a-f98e62dc4bd8
\.


--
-- TOC entry 3157 (class 0 OID 32864985)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 32864923)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 32864869)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-567a-97c5-d16e-8cda6e8b20bf	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-567a-97c5-0e8d-13d4bed1878a	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-567a-97c5-f193-828f4917562a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 32864492)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-567a-97c1-2e44-ab5c25bc088a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-567a-97c1-626f-47774de9b3bf	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-567a-97c1-7fb9-05c57b56d217	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-567a-97c1-67d5-03f24d7b389a	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-567a-97c1-7f76-06c64621ca82	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 32864484)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-567a-97c1-3024-147dbee8666c	00230000-567a-97c1-67d5-03f24d7b389a	popa
00240000-567a-97c1-5821-cb5387e0798d	00230000-567a-97c1-67d5-03f24d7b389a	oseba
00240000-567a-97c1-2cc7-b271e3bb06e0	00230000-567a-97c1-67d5-03f24d7b389a	tippopa
00240000-567a-97c1-a21f-75c2cb9367f8	00230000-567a-97c1-67d5-03f24d7b389a	organizacijskaenota
00240000-567a-97c1-b654-63c1ef4ec35d	00230000-567a-97c1-67d5-03f24d7b389a	sezona
00240000-567a-97c1-cfcd-895a931df3a8	00230000-567a-97c1-67d5-03f24d7b389a	tipvaje
00240000-567a-97c1-a3ea-32970af3bc52	00230000-567a-97c1-626f-47774de9b3bf	prostor
00240000-567a-97c1-af2e-1db8ac839aac	00230000-567a-97c1-67d5-03f24d7b389a	besedilo
00240000-567a-97c1-7e58-ff09e3b18841	00230000-567a-97c1-67d5-03f24d7b389a	uprizoritev
00240000-567a-97c1-2440-a2a59e43a1a7	00230000-567a-97c1-67d5-03f24d7b389a	funkcija
00240000-567a-97c1-d87e-6735b01bad8e	00230000-567a-97c1-67d5-03f24d7b389a	tipfunkcije
00240000-567a-97c1-2dc0-e7ea96bcac61	00230000-567a-97c1-67d5-03f24d7b389a	alternacija
00240000-567a-97c1-8572-d2f6e9750cf0	00230000-567a-97c1-2e44-ab5c25bc088a	pogodba
00240000-567a-97c1-7b71-2e925bda5cb9	00230000-567a-97c1-67d5-03f24d7b389a	zaposlitev
00240000-567a-97c1-1ee0-ec32fbe1d220	00230000-567a-97c1-67d5-03f24d7b389a	zvrstuprizoritve
00240000-567a-97c1-a5e1-b1b723877ad6	00230000-567a-97c1-2e44-ab5c25bc088a	programdela
00240000-567a-97c1-8eea-4a467862d0cb	00230000-567a-97c1-67d5-03f24d7b389a	zapis
\.


--
-- TOC entry 3106 (class 0 OID 32864479)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
f3ad16b8-311e-409c-9ebe-1fdc36d690ed	00240000-567a-97c1-3024-147dbee8666c	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 32865051)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-567a-97c5-8d49-4aee1231c605	000e0000-567a-97c5-6e34-2f0fcc7518a9	00080000-567a-97c5-1208-db23f832983c	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-567a-97c1-d9c2-fe8818ea147a
00270000-567a-97c5-a538-c787b30bd10f	000e0000-567a-97c5-6e34-2f0fcc7518a9	00080000-567a-97c5-1208-db23f832983c	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-567a-97c1-d9c2-fe8818ea147a
\.


--
-- TOC entry 3122 (class 0 OID 32864627)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 32864879)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-567a-97c5-e381-ad1d06496b5f	00180000-567a-97c5-54b8-a5e3ee6867b3	000c0000-567a-97c5-cd95-ef4eee5f4aa9	00090000-567a-97c5-4021-0041e60bda79	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567a-97c5-b22b-697802fbebc2	00180000-567a-97c5-54b8-a5e3ee6867b3	000c0000-567a-97c5-8aa5-946c01c7c96a	00090000-567a-97c5-654a-4ef020ba6f9b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567a-97c5-8bf4-44ac0ddf4bd8	00180000-567a-97c5-54b8-a5e3ee6867b3	000c0000-567a-97c5-104a-aa1ed095d3fd	00090000-567a-97c5-3a07-f75ce4c16323	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567a-97c5-75a0-1de372c2f581	00180000-567a-97c5-54b8-a5e3ee6867b3	000c0000-567a-97c5-7b2e-ef43b45b9848	00090000-567a-97c5-85f1-eb5adb1abfb3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567a-97c5-1206-3281ff67a654	00180000-567a-97c5-54b8-a5e3ee6867b3	000c0000-567a-97c5-cc78-922fb9ccde27	00090000-567a-97c5-6347-e8393b641664	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-567a-97c5-18ca-cd36beebff0a	00180000-567a-97c5-8df3-de78e924c5de	\N	00090000-567a-97c5-6347-e8393b641664	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-567a-97c5-399c-60ef69d1d0ef	00180000-567a-97c5-8df3-de78e924c5de	\N	00090000-567a-97c5-654a-4ef020ba6f9b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 32865092)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-567a-97c1-f966-a2d35e5e35ac	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-567a-97c1-eb2c-11baf25fc3af	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-567a-97c1-28d7-e983c1de0778	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-567a-97c1-a440-112fe8924e37	04	Režija	Režija	Režija	umetnik	30
000f0000-567a-97c1-91d9-4173c7578edf	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-567a-97c1-33a1-af084a240814	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-567a-97c1-fdf0-8f00a2356824	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-567a-97c1-2d93-768ea49b831e	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-567a-97c1-3428-ac3b61a342be	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-567a-97c1-46d9-3f239f10bfe6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-567a-97c1-192c-5b531013bdcb	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-567a-97c1-6e84-0d242bcf4219	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-567a-97c1-08c2-409daf2d1fe2	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-567a-97c1-2906-e2492d35a929	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-567a-97c1-962f-0674f9f4c00f	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-567a-97c1-8840-a73b909f00c3	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-567a-97c1-dd8a-490c2c808049	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-567a-97c1-d3f8-07aaab26b578	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 32864578)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-567a-97c4-f9c0-8ffb430a6cc9	0001	šola	osnovna ali srednja šola
00400000-567a-97c4-3c0f-61c6957a6586	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-567a-97c4-3c6f-e10343c86b79	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 32865397)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-567a-97c1-3457-7756cf2f5623	01	Velika predstava	f	1.00	1.00
002b0000-567a-97c1-0477-d453a1d220db	02	Mala predstava	f	0.50	0.50
002b0000-567a-97c1-ed03-09d4c3f97757	03	Mala koprodukcija	t	0.40	1.00
002b0000-567a-97c1-132b-835e641ff81e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-567a-97c1-4047-e438b7c3ea40	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 32864859)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-567a-97c1-a6b6-07079d4c14b6	0001	prva vaja	prva vaja
00420000-567a-97c1-73d4-e4143ea2c0f5	0002	tehnična vaja	tehnična vaja
00420000-567a-97c1-b897-82be6967ce7c	0003	lučna vaja	lučna vaja
00420000-567a-97c1-b4a6-f925cecdc7cb	0004	kostumska vaja	kostumska vaja
00420000-567a-97c1-3f9e-cc25066c22fa	0005	foto vaja	foto vaja
00420000-567a-97c1-c8d3-1b595777d9bd	0006	1. glavna vaja	1. glavna vaja
00420000-567a-97c1-ed5f-ad11c6353b96	0007	2. glavna vaja	2. glavna vaja
00420000-567a-97c1-1b27-c5c357697e09	0008	1. generalka	1. generalka
00420000-567a-97c1-f105-fe1a9c97577b	0009	2. generalka	2. generalka
00420000-567a-97c1-19b1-d37da1c5bf77	0010	odprta generalka	odprta generalka
00420000-567a-97c1-b924-b7ae1d161daa	0011	obnovitvena vaja	obnovitvena vaja
00420000-567a-97c1-3bc1-238dcda15fe0	0012	italijanka	krajša "obnovitvena" vaja
00420000-567a-97c1-eff9-3038da08ee6f	0013	pevska vaja	pevska vaja
00420000-567a-97c1-8cc5-e295e97f4663	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-567a-97c1-2edd-c2ca7a96e729	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 32864700)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 32864514)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-567a-97c3-929a-ce1ec5296d21	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRO4utYP0JQwmoLPlfh4L/i16aDYC4t7aS	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-567a-97c5-f573-d4ed74b6d2a1	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-567a-97c5-c82c-9cd940cecd38	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-567a-97c5-c838-4b10940244a8	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-567a-97c5-1840-0897d30cd601	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-567a-97c5-075f-339affd4ff15	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-567a-97c5-b525-eaca7c9c3541	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-567a-97c5-1703-236744d0f89d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-567a-97c5-679b-eea1c8a7e8c8	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-567a-97c5-62bb-61761329282e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-567a-97c5-3314-fab411e87fdf	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-567a-97c5-a129-b253c35de1d7	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-567a-97c5-b2f7-1ce709f62d96	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-567a-97c5-7e17-a64738420291	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-567a-97c5-319b-70552800bd29	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-567a-97c5-c3ac-9c0b853daed9	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-567a-97c5-b9b6-b078aa84a518	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-567a-97c5-f24c-04e8289bce27	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-567a-97c5-14b7-d840bd961a68	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-567a-97c5-6af3-d5daccb7d09a	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-567a-97c5-d96c-51eb3dab3d1d	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-567a-97c5-c0a9-6bc911bcc940	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-567a-97c5-241d-38a22aabbeea	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-567a-97c5-fe3d-62f9cd8dc2d4	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-567a-97c5-f368-23e16e71aecc	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-567a-97c5-47d5-b8b9d75dbf5e	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-567a-97c5-f3cf-ed848fac4f75	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-567a-97c2-6408-1fad6e4f064c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 32865142)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-567a-97c5-b657-72f5a97dc1d4	00160000-567a-97c4-6b6d-23f14e37494c	\N	00140000-567a-97c1-ae4c-e4ff2b93c81f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-567a-97c4-c8f7-f70e3d31da93
000e0000-567a-97c5-6e34-2f0fcc7518a9	00160000-567a-97c4-cf42-c91af27b6331	\N	00140000-567a-97c1-9a01-7ad8b90ee21b	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-567a-97c4-623c-8a2da87d0431
000e0000-567a-97c5-0d0d-052b3830038b	\N	\N	00140000-567a-97c1-9a01-7ad8b90ee21b	00190000-567a-97c5-24ce-4efff1ca7d46	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-567a-97c4-c8f7-f70e3d31da93
000e0000-567a-97c5-2ca5-f197ed48c12f	\N	\N	00140000-567a-97c1-9a01-7ad8b90ee21b	00190000-567a-97c5-24ce-4efff1ca7d46	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-567a-97c4-c8f7-f70e3d31da93
000e0000-567a-97c5-963e-ea92aba2742e	\N	\N	00140000-567a-97c1-9a01-7ad8b90ee21b	00190000-567a-97c5-24ce-4efff1ca7d46	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-567a-97c4-89c2-6da8d149d107
000e0000-567a-97c5-3cb3-c1dcdcf6fb7c	\N	\N	00140000-567a-97c1-9a01-7ad8b90ee21b	00190000-567a-97c5-24ce-4efff1ca7d46	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-567a-97c4-89c2-6da8d149d107
\.


--
-- TOC entry 3136 (class 0 OID 32864799)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-567a-97c5-8692-c944b2477b86	\N	000e0000-567a-97c5-6e34-2f0fcc7518a9	1	
00200000-567a-97c5-9bcd-1a01b4f56105	\N	000e0000-567a-97c5-6e34-2f0fcc7518a9	2	
00200000-567a-97c5-2e02-84e1221eb464	\N	000e0000-567a-97c5-6e34-2f0fcc7518a9	3	
00200000-567a-97c5-8b4a-902f568f72cd	\N	000e0000-567a-97c5-6e34-2f0fcc7518a9	4	
00200000-567a-97c5-e0c4-d1c9c2143b52	\N	000e0000-567a-97c5-6e34-2f0fcc7518a9	5	
\.


--
-- TOC entry 3153 (class 0 OID 32864950)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 32865065)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-567a-97c1-4d4d-478e15252971	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-567a-97c1-f69b-4cd6f3526349	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-567a-97c1-4cbd-3c6ed3f1f5e1	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-567a-97c1-dfcb-1e781c3af01d	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-567a-97c1-3a18-bd230ca759e0	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-567a-97c1-3a8e-922f9c48b68f	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-567a-97c1-1c23-44af9d67d6e6	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-567a-97c1-ab0d-f9ef7ae6ba33	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-567a-97c1-d9c2-fe8818ea147a	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-567a-97c1-229e-1c1a2a28c984	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-567a-97c1-d1b6-314b31e62f94	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-567a-97c1-7196-7df86f0ddfaa	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-567a-97c1-6230-a3c56b19bccb	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-567a-97c1-87f6-9b7889527c5f	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-567a-97c1-233c-58b308c984dc	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-567a-97c1-1ade-616a7eaebfc9	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-567a-97c1-0fe4-5ad3ca6b664a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-567a-97c1-04a1-6cf2a09de6bc	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-567a-97c1-d243-4b6dc6c1ed20	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-567a-97c1-51c0-015c632b97e5	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-567a-97c1-d232-6e0cb03873f9	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-567a-97c1-fb1b-f956c06732d6	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-567a-97c1-f5df-b23343748b2e	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-567a-97c1-770f-8d96630cc3a2	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-567a-97c1-09fb-cd9b5b8dbfc4	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-567a-97c1-5483-2d85475cf4df	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-567a-97c1-ed91-355b4345f48d	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-567a-97c1-e2c3-1f6cc06918ad	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 32865447)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 32865416)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 32865459)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 32865023)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-567a-97c5-1e17-99dcde1144e2	00090000-567a-97c5-654a-4ef020ba6f9b	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567a-97c5-7361-e445ef22d352	00090000-567a-97c5-3a07-f75ce4c16323	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567a-97c5-8e0e-d01a32bb3c46	00090000-567a-97c5-e18c-287ffca7c94e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567a-97c5-2239-7d3718c5cc52	00090000-567a-97c5-b63c-7003c360a4ca	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567a-97c5-ff94-2668d675e282	00090000-567a-97c5-7ce7-b0a6e6659e2f	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-567a-97c5-c4f5-c633f80275b1	00090000-567a-97c5-4966-854d4c8ce29b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 32864843)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 32865132)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-567a-97c1-ae4c-e4ff2b93c81f	01	Drama	drama (SURS 01)
00140000-567a-97c1-05fc-d565d0803f27	02	Opera	opera (SURS 02)
00140000-567a-97c1-1dab-fd6a9c73dd33	03	Balet	balet (SURS 03)
00140000-567a-97c1-548b-48b2e50c7934	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-567a-97c1-f5ec-adcfc829dab6	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-567a-97c1-9a01-7ad8b90ee21b	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-567a-97c1-0232-a070afe67a75	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 32865013)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 32864577)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 32865191)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 32865181)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 32864568)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 32865048)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 32865090)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 32865500)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 32864831)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 32864853)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 32864858)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 32865414)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 32864726)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 32865260)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 32865009)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 32864797)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 32864764)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 32864740)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 32864915)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 32865477)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 32865484)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 32865508)
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
-- TOC entry 2739 (class 2606 OID 32864942)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 32864698)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 32864596)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 32864660)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 32864623)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 32864557)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 32864542)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 32864948)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 32864984)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 32865127)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 32864651)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 32864686)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 32865365)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 32864921)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 32864676)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 32864816)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 32864785)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 32864777)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 32864933)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 32865374)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 32865382)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 32865352)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 32865395)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 32864966)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 32864906)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 32864897)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 32865114)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 32865041)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 32864752)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 32864513)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 32864975)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 32864531)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 32864551)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 32864993)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 32864928)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 32864877)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 32864501)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 32864489)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 32864483)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 32865061)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 32864632)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 32864888)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 32865101)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 32864585)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 32865407)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 32864866)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 32864711)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 32864526)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 32865160)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 32864806)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 32864956)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 32865073)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 32865457)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 32865441)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 32865465)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 32865031)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 32864847)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 32865140)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 32865021)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 32864841)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 32864842)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 32864840)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 32864839)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 32864838)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 32865062)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 32865063)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 32865064)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 32865479)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 32865478)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 32864653)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 32864654)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 32864949)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 32865445)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 32865444)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 32865446)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 32865443)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 32865442)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 32864935)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 32864934)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 32864807)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 32864808)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 32865010)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 32865012)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 32865011)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 32864742)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 32864741)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 32865396)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 32865129)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 32865130)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 32865131)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 32865466)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 32865165)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 32865162)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 32865166)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 32865164)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 32865163)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 32864713)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 32864712)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 32864626)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 32864976)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 32864558)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 32864559)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 32864996)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 32864995)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 32864994)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 32864663)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 32864662)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 32864664)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 32864780)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 32864778)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 32864779)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 32864491)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 32864901)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 32864899)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 32864898)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 32864900)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 32864532)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 32864533)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 32864957)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 32865501)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 32865050)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 32865049)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 32865509)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 32865510)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 32864922)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 32865042)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 32865043)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 32865265)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 32865264)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 32865261)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 32865262)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 32865263)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 32864678)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 32864677)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 32864679)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 32864970)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 32864969)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 32865375)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 32865376)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 32865195)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 32865196)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 32865193)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 32865194)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 32865032)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 32865033)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 32864910)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 32864909)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 32864907)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 32864908)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 32865183)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 32865182)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 32864753)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 32864767)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 32864766)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 32864765)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 32864768)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 32864798)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 32864786)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 32864787)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 32865366)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 32865415)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 32865485)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 32865486)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 32864598)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 32864597)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 32864633)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 32864634)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 32864848)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 32864891)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 32864890)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 32864889)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 32864833)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 32864834)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 32864837)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 32864832)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 32864836)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 32864835)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 32864652)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 32864586)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 32864587)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 32864727)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 32864729)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 32864728)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 32864730)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 32864916)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 32865128)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 32865161)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 32865102)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 32865103)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 32864624)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 32864625)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 32865022)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 32864502)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 32864699)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 32864661)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 32864490)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 32865408)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 32864968)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 32864967)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 32864867)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 32864868)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 32865192)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 32864687)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 32865141)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 32865458)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 32865383)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 32865384)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 32865091)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 32864878)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 32864552)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2917 (class 2606 OID 32865681)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2918 (class 2606 OID 32865686)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2923 (class 2606 OID 32865711)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2921 (class 2606 OID 32865701)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2916 (class 2606 OID 32865676)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2920 (class 2606 OID 32865696)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2922 (class 2606 OID 32865706)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2919 (class 2606 OID 32865691)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2957 (class 2606 OID 32865881)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 32865886)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2959 (class 2606 OID 32865891)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2992 (class 2606 OID 32866056)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2991 (class 2606 OID 32866051)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2894 (class 2606 OID 32865566)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2895 (class 2606 OID 32865571)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 32865796)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2988 (class 2606 OID 32866036)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 32866031)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2989 (class 2606 OID 32866041)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2986 (class 2606 OID 32866026)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2985 (class 2606 OID 32866021)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2939 (class 2606 OID 32865791)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2938 (class 2606 OID 32865786)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2914 (class 2606 OID 32865666)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2915 (class 2606 OID 32865671)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 32865836)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 32865846)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 32865841)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2905 (class 2606 OID 32865621)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2904 (class 2606 OID 32865616)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 32865776)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 32866011)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2960 (class 2606 OID 32865896)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 32865901)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 32865906)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 32866046)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2966 (class 2606 OID 32865926)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2963 (class 2606 OID 32865911)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2967 (class 2606 OID 32865931)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 32865921)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2964 (class 2606 OID 32865916)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2903 (class 2606 OID 32865611)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2902 (class 2606 OID 32865606)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2891 (class 2606 OID 32865551)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2890 (class 2606 OID 32865546)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 32865816)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2886 (class 2606 OID 32865526)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2887 (class 2606 OID 32865531)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2947 (class 2606 OID 32865831)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 32865826)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2945 (class 2606 OID 32865821)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 32865581)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2896 (class 2606 OID 32865576)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2898 (class 2606 OID 32865586)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2910 (class 2606 OID 32865646)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 32865636)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 32865641)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 32865511)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2931 (class 2606 OID 32865751)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2929 (class 2606 OID 32865741)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2928 (class 2606 OID 32865736)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2930 (class 2606 OID 32865746)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2884 (class 2606 OID 32865516)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2885 (class 2606 OID 32865521)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 32865801)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 32866071)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2956 (class 2606 OID 32865876)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2955 (class 2606 OID 32865871)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2996 (class 2606 OID 32866076)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2997 (class 2606 OID 32866081)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 32865781)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2953 (class 2606 OID 32865861)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2954 (class 2606 OID 32865866)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2978 (class 2606 OID 32865986)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2977 (class 2606 OID 32865981)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2974 (class 2606 OID 32865966)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2975 (class 2606 OID 32865971)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 32865976)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 32865596)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2899 (class 2606 OID 32865591)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2901 (class 2606 OID 32865601)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2943 (class 2606 OID 32865811)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2942 (class 2606 OID 32865806)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2980 (class 2606 OID 32865996)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 32866001)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2972 (class 2606 OID 32865956)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2973 (class 2606 OID 32865961)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2970 (class 2606 OID 32865946)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2971 (class 2606 OID 32865951)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2951 (class 2606 OID 32865851)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2952 (class 2606 OID 32865856)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2935 (class 2606 OID 32865771)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2934 (class 2606 OID 32865766)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2932 (class 2606 OID 32865756)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2933 (class 2606 OID 32865761)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2969 (class 2606 OID 32865941)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2968 (class 2606 OID 32865936)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 32865626)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 32865631)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 32865661)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2911 (class 2606 OID 32865651)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2912 (class 2606 OID 32865656)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 32865991)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 32866006)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 32866016)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2993 (class 2606 OID 32866061)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2994 (class 2606 OID 32866066)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2889 (class 2606 OID 32865541)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2888 (class 2606 OID 32865536)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2892 (class 2606 OID 32865556)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 32865561)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 32865716)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 32865731)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 32865726)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2925 (class 2606 OID 32865721)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-23 13:47:05 CET

--
-- PostgreSQL database dump complete
--

