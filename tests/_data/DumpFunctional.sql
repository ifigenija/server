--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-26 13:44:04 CET

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
-- TOC entry 3181 (class 0 OID 0)
-- Dependencies: 253
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 29625349)
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
-- TOC entry 237 (class 1259 OID 29625963)
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
-- TOC entry 236 (class 1259 OID 29625946)
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
-- TOC entry 182 (class 1259 OID 29625342)
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
-- TOC entry 181 (class 1259 OID 29625340)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 227 (class 1259 OID 29625823)
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
-- TOC entry 230 (class 1259 OID 29625853)
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
-- TOC entry 251 (class 1259 OID 29626254)
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
-- TOC entry 203 (class 1259 OID 29625597)
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
-- TOC entry 205 (class 1259 OID 29625629)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29625634)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29626176)
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
-- TOC entry 194 (class 1259 OID 29625494)
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
-- TOC entry 238 (class 1259 OID 29625976)
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
-- TOC entry 223 (class 1259 OID 29625777)
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
-- TOC entry 200 (class 1259 OID 29625568)
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
-- TOC entry 197 (class 1259 OID 29625534)
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
-- TOC entry 3183 (class 0 OID 0)
-- Dependencies: 197
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 195 (class 1259 OID 29625511)
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
-- TOC entry 212 (class 1259 OID 29625691)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29626234)
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
-- TOC entry 250 (class 1259 OID 29626247)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29626269)
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
-- TOC entry 216 (class 1259 OID 29625716)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29625468)
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
-- TOC entry 185 (class 1259 OID 29625368)
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
-- TOC entry 189 (class 1259 OID 29625435)
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
-- TOC entry 186 (class 1259 OID 29625379)
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
-- TOC entry 178 (class 1259 OID 29625314)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29625333)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29625723)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29625757)
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
-- TOC entry 233 (class 1259 OID 29625894)
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
-- TOC entry 188 (class 1259 OID 29625415)
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
-- TOC entry 191 (class 1259 OID 29625460)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29626121)
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
-- TOC entry 213 (class 1259 OID 29625697)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29625445)
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
-- TOC entry 202 (class 1259 OID 29625589)
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
-- TOC entry 198 (class 1259 OID 29625549)
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
-- TOC entry 199 (class 1259 OID 29625561)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29625709)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29626135)
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
-- TOC entry 242 (class 1259 OID 29626145)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29626044)
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
-- TOC entry 243 (class 1259 OID 29626153)
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
-- TOC entry 219 (class 1259 OID 29625738)
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
-- TOC entry 211 (class 1259 OID 29625682)
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
-- TOC entry 210 (class 1259 OID 29625672)
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
-- TOC entry 232 (class 1259 OID 29625883)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29625813)
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
-- TOC entry 196 (class 1259 OID 29625523)
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
-- TOC entry 175 (class 1259 OID 29625285)
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
-- TOC entry 174 (class 1259 OID 29625283)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3184 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 220 (class 1259 OID 29625751)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29625323)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29625307)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29625765)
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
-- TOC entry 214 (class 1259 OID 29625703)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29625649)
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
-- TOC entry 173 (class 1259 OID 29625272)
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
-- TOC entry 172 (class 1259 OID 29625264)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29625259)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29625830)
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
-- TOC entry 187 (class 1259 OID 29625407)
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
-- TOC entry 209 (class 1259 OID 29625659)
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
-- TOC entry 231 (class 1259 OID 29625871)
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
-- TOC entry 184 (class 1259 OID 29625358)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29626164)
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
-- TOC entry 207 (class 1259 OID 29625639)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29625480)
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
-- TOC entry 176 (class 1259 OID 29625294)
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
-- TOC entry 235 (class 1259 OID 29625921)
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
-- TOC entry 201 (class 1259 OID 29625579)
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
-- TOC entry 218 (class 1259 OID 29625730)
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
-- TOC entry 229 (class 1259 OID 29625844)
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
-- TOC entry 247 (class 1259 OID 29626214)
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
-- TOC entry 246 (class 1259 OID 29626183)
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
-- TOC entry 248 (class 1259 OID 29626226)
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
-- TOC entry 225 (class 1259 OID 29625802)
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
-- TOC entry 204 (class 1259 OID 29625623)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29625911)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29625792)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29625345)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29625288)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29625349)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5656-fe91-78ba-e90308c03fef	10	30	Otroci	Abonma za otroke	200
000a0000-5656-fe91-a6ba-d2b54732b174	20	60	Mladina	Abonma za mladino	400
000a0000-5656-fe91-78cc-021538bf097a	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29625963)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5656-fe91-c513-e7c23d8ef9c7	000d0000-5656-fe91-3aac-a58e527179ec	\N	00090000-5656-fe91-ab46-4a4c120d9413	000b0000-5656-fe91-0820-de0e80df7f08	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5656-fe91-8f31-a4638b672ffa	000d0000-5656-fe91-f240-3e26b003ceb7	00100000-5656-fe91-7806-0b82427f92f7	00090000-5656-fe91-bda0-43863f9631d0	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5656-fe91-7b1b-04c9ba395784	000d0000-5656-fe91-5167-471967c0d6ee	00100000-5656-fe91-15c7-adbca6d8a0cb	00090000-5656-fe91-a390-60ddf86c1d88	\N	0003	t	\N	2015-11-26	\N	2	t	\N	f	f
000c0000-5656-fe91-f483-df91ce3ffb87	000d0000-5656-fe91-6cc1-056038bd41e3	\N	00090000-5656-fe91-0de2-c5c14a8b8717	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5656-fe91-fac5-68d1a9086172	000d0000-5656-fe91-f923-da89c0f81a7c	\N	00090000-5656-fe91-c1c4-ec63e303470b	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5656-fe91-5457-989d7aafc748	000d0000-5656-fe91-7d7d-8b612bd275d5	\N	00090000-5656-fe91-ce27-5232baa6430c	000b0000-5656-fe91-9e34-f48e29737506	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5656-fe91-aa14-19a7f2f87776	000d0000-5656-fe91-e9a4-a01fedf090b4	00100000-5656-fe91-a6ca-b5f3a2e6f246	00090000-5656-fe91-35bc-4d0f6ec42cc6	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5656-fe91-8ac1-2235053821d4	000d0000-5656-fe91-12d0-6a8af293053a	\N	00090000-5656-fe91-fbc3-aa84bc700a29	000b0000-5656-fe91-b37c-b2601e3459b2	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5656-fe91-0663-c4e4d4032819	000d0000-5656-fe91-e9a4-a01fedf090b4	00100000-5656-fe91-ac11-c86568839d65	00090000-5656-fe91-787a-cd07f6875508	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5656-fe91-8a90-9a2cd3d4821b	000d0000-5656-fe91-e9a4-a01fedf090b4	00100000-5656-fe91-f6e1-3964dedb34f6	00090000-5656-fe91-77b5-f58c5caf913a	\N	0010	t	\N	2015-11-26	\N	16	f	\N	f	t
000c0000-5656-fe91-d8e7-ea9b397e9040	000d0000-5656-fe91-e9a4-a01fedf090b4	00100000-5656-fe91-e99f-c5a3ff3b24b2	00090000-5656-fe91-5421-949b2029ac7b	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5656-fe91-e0db-fb6878e92c47	000d0000-5656-fe91-9dd1-8b1473f5998e	00100000-5656-fe91-7806-0b82427f92f7	00090000-5656-fe91-bda0-43863f9631d0	000b0000-5656-fe91-1d73-8e7ca1c99e4d	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29625946)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29625342)
-- Dependencies: 182
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 0)
-- Dependencies: 181
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3149 (class 0 OID 29625823)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5656-fe91-7363-dc8e5579e50e	00160000-5656-fe91-d17f-a52b2e649a41	00090000-5656-fe91-a985-2328ffffddc3	aizv	10	t
003d0000-5656-fe91-5a46-48dd88a1c593	00160000-5656-fe91-d17f-a52b2e649a41	00090000-5656-fe91-9927-f53a04950023	apri	14	t
003d0000-5656-fe91-6923-aa79d3fd7474	00160000-5656-fe91-df34-bc5f92b359b3	00090000-5656-fe91-417c-469d3306c8eb	aizv	11	t
003d0000-5656-fe91-1d25-e49159a9651d	00160000-5656-fe91-0bda-3af2a1de27ed	00090000-5656-fe91-1573-1787ef54c1e0	aizv	12	t
003d0000-5656-fe91-1a33-bfd9633b5dcd	00160000-5656-fe91-d17f-a52b2e649a41	00090000-5656-fe91-c4e3-71bb74f5ae29	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29625853)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5656-fe91-d17f-a52b2e649a41	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5656-fe91-df34-bc5f92b359b3	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5656-fe91-0bda-3af2a1de27ed	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29626254)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29625597)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5656-fe91-9148-9793a95edb62	\N	\N	00200000-5656-fe91-9137-98eafb70ea25	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5656-fe91-2cdf-c4be4a9f2e0d	\N	\N	00200000-5656-fe91-3aed-0c8267ea2596	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5656-fe91-e85e-db4881b78882	\N	\N	00200000-5656-fe91-9563-e1ccd90b7ce6	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5656-fe91-a5bc-88571ba1883d	\N	\N	00200000-5656-fe91-ab3b-232ec8c17980	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5656-fe91-77a6-2356f8ef4f2b	\N	\N	00200000-5656-fe91-770e-fd5627519cd4	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29625629)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29625634)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29626176)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29625494)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5656-fe8f-48d2-9ff472bc0408	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5656-fe8f-70e1-9816cf0cf55c	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5656-fe8f-e608-d98ff150f676	AL	ALB	008	Albania 	Albanija	\N
00040000-5656-fe8f-4fcc-5d03b77bff4a	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5656-fe8f-cb21-5c6813ffd602	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5656-fe8f-eb3f-ab4951a4c4ef	AD	AND	020	Andorra 	Andora	\N
00040000-5656-fe8f-50fe-9f33f76f6d7d	AO	AGO	024	Angola 	Angola	\N
00040000-5656-fe8f-2904-b529ae76252f	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5656-fe8f-a5f4-bcbc5eb2cd72	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5656-fe8f-111d-087bff682a10	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5656-fe8f-5d06-4829cd384299	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5656-fe8f-5bb7-ec28cff02442	AM	ARM	051	Armenia 	Armenija	\N
00040000-5656-fe8f-9077-e1856d73dc9d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5656-fe8f-a4c3-e453ddf6c0a7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5656-fe8f-7b60-1d3d944941fe	AT	AUT	040	Austria 	Avstrija	\N
00040000-5656-fe8f-7a9b-10baddfbfa38	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5656-fe8f-9d3a-d85c5ec75e86	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5656-fe8f-c2c9-1f3fe19012e4	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5656-fe8f-72dc-0d80dd9c4cb5	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5656-fe8f-a4a2-f7ec895f2721	BB	BRB	052	Barbados 	Barbados	\N
00040000-5656-fe8f-89af-f929a1cc46fd	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5656-fe8f-644c-7d02eaf27612	BE	BEL	056	Belgium 	Belgija	\N
00040000-5656-fe8f-c681-ba2cbf54c43a	BZ	BLZ	084	Belize 	Belize	\N
00040000-5656-fe8f-05f3-14ce912ec84b	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5656-fe8f-235a-3c03d4a93eb6	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5656-fe8f-ac79-5bee5282888d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5656-fe8f-1399-515f2eed58d9	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5656-fe8f-fd08-51d4dea653df	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5656-fe8f-5284-3ceec76b8fe2	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5656-fe8f-1304-3869a615eba4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5656-fe8f-b24e-44b383f2a878	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5656-fe8f-9481-3b8e435c3a29	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5656-fe8f-a442-8623ca8ef7d4	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5656-fe8f-62e9-d4bc6ec069d8	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5656-fe8f-e0e6-018470142b8b	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5656-fe8f-6a0c-b355d0ed3b8d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5656-fe8f-4dae-90baf14e2cbc	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5656-fe8f-facc-5e2bc0d0324d	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5656-fe8f-eb73-ea05a7afdf29	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5656-fe8f-6fce-28db5aba26cd	CA	CAN	124	Canada 	Kanada	\N
00040000-5656-fe8f-685d-0077b4e87034	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5656-fe8f-9722-083084a517de	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5656-fe8f-06ad-0e0b85b5e9bb	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5656-fe8f-7ad9-2cd77f42093c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5656-fe8f-a1b4-6b2c00b55347	CL	CHL	152	Chile 	Čile	\N
00040000-5656-fe8f-cfa8-185b646063fe	CN	CHN	156	China 	Kitajska	\N
00040000-5656-fe8f-b50e-26c9d4e61fd5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5656-fe8f-2f63-01c8bded800d	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5656-fe8f-7c3a-a39b127d1206	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5656-fe8f-cd7b-3ae1e7c17cae	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5656-fe8f-d0f8-9712a9ef8ca5	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5656-fe8f-bfca-00c5de1226fd	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5656-fe8f-7ef2-ed1fea9a308f	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5656-fe8f-8ace-4156de8042be	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5656-fe8f-ccd1-d7de31c5fe00	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5656-fe8f-80a3-924f743dbd26	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5656-fe8f-d8f9-b50de47c5894	CU	CUB	192	Cuba 	Kuba	\N
00040000-5656-fe8f-74eb-bbe21dc4ab22	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5656-fe8f-d627-4529da78f638	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5656-fe8f-6c22-366bf4f7311f	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5656-fe8f-47c0-0eafbd34331e	DK	DNK	208	Denmark 	Danska	\N
00040000-5656-fe8f-4cc6-c0b738696296	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5656-fe8f-d7c9-86cb9d58edd7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5656-fe8f-cfb2-78b3ef0f9fb2	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5656-fe8f-87d3-d74d5511ab0b	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5656-fe8f-7784-c13964abb91f	EG	EGY	818	Egypt 	Egipt	\N
00040000-5656-fe8f-ad39-ab8305bfba02	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5656-fe8f-1a62-ea51c51e4e41	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5656-fe8f-1fcf-ad337d30b57b	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5656-fe8f-184e-5f1555ca1884	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5656-fe8f-5afe-e782e5b9f6aa	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5656-fe8f-47bc-b9d571846be2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5656-fe8f-59c4-35260224c1fd	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5656-fe8f-7566-db731792ecd2	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5656-fe8f-11e0-df9058880207	FI	FIN	246	Finland 	Finska	\N
00040000-5656-fe8f-ddc5-4060f0150226	FR	FRA	250	France 	Francija	\N
00040000-5656-fe8f-f80f-0c28a196fc13	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5656-fe8f-5132-4ecde11d4323	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5656-fe8f-97bc-dc513d0d8ab3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5656-fe8f-81e4-fe41e251a3c9	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5656-fe8f-1cc4-30dc6ba47f2a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5656-fe8f-3afb-d5f7f26847a6	GM	GMB	270	Gambia 	Gambija	\N
00040000-5656-fe8f-9e9b-ee8c51af0363	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5656-fe8f-6bee-41d475c4f750	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5656-fe8f-5f33-16e4b52eeffc	GH	GHA	288	Ghana 	Gana	\N
00040000-5656-fe8f-5ae2-2f77fbec79a6	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5656-fe8f-b58c-d428553d7c98	GR	GRC	300	Greece 	Grčija	\N
00040000-5656-fe8f-9b3d-fb0615f6c92d	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5656-fe8f-fb93-e6031ac00847	GD	GRD	308	Grenada 	Grenada	\N
00040000-5656-fe8f-9f31-674d10ecca58	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5656-fe8f-4262-37ed381fbd47	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5656-fe8f-8349-fbf9b73efb8d	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5656-fe8f-e5a0-55f5b5efcf95	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5656-fe8f-dc6f-4ce2d3e07839	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5656-fe8f-c689-49b7b47bf8bb	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5656-fe8f-d3d2-629b67d5e72b	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5656-fe8f-6bac-5926b4345a82	HT	HTI	332	Haiti 	Haiti	\N
00040000-5656-fe8f-551f-feb5cdd99258	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5656-fe8f-7d8e-9ec8d40e10cc	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5656-fe8f-b098-04daa121c3e9	HN	HND	340	Honduras 	Honduras	\N
00040000-5656-fe8f-bb8d-825638729daa	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5656-fe8f-69d7-d1e00c4e2d9c	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5656-fe8f-dce0-51af4c74fb25	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5656-fe8f-478f-997791a00d47	IN	IND	356	India 	Indija	\N
00040000-5656-fe8f-5f36-baa67ec3e844	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5656-fe8f-474e-5b11735ef670	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5656-fe8f-9408-4cd2d8276c34	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5656-fe8f-0bb2-1b673f45393f	IE	IRL	372	Ireland 	Irska	\N
00040000-5656-fe8f-5302-414c0d72d763	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5656-fe8f-9d5b-22cdcb700e90	IL	ISR	376	Israel 	Izrael	\N
00040000-5656-fe8f-d996-81648529ac94	IT	ITA	380	Italy 	Italija	\N
00040000-5656-fe8f-c033-3528ae39e932	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5656-fe8f-386a-e6b9f5abe3ea	JP	JPN	392	Japan 	Japonska	\N
00040000-5656-fe8f-0e08-b00d7dc42d01	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5656-fe8f-e4f3-e33e275e4951	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5656-fe8f-097d-24af79769207	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5656-fe8f-d739-ab8565a676b3	KE	KEN	404	Kenya 	Kenija	\N
00040000-5656-fe8f-9dc9-580c019084da	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5656-fe8f-114e-7d333771fa6e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5656-fe8f-04ed-a1cc10cf9fc3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5656-fe8f-2259-44699b4bbee0	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5656-fe8f-a5c0-b0ab24725a29	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5656-fe8f-1fd5-80b973460965	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5656-fe8f-8d88-f36a71da6836	LV	LVA	428	Latvia 	Latvija	\N
00040000-5656-fe8f-e978-f5618ca0f164	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5656-fe8f-ad9c-80e22e6ee07d	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5656-fe8f-5902-8b57fb9485f6	LR	LBR	430	Liberia 	Liberija	\N
00040000-5656-fe8f-1170-bb446ed3d93f	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5656-fe8f-ff1a-4566f11dfeef	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5656-fe8f-5522-6bd2397f003e	LT	LTU	440	Lithuania 	Litva	\N
00040000-5656-fe8f-a6b3-aadf1e3c0690	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5656-fe8f-fae2-b217d2877e0d	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5656-fe8f-74ac-460aeed1cd65	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5656-fe8f-74d4-ea8e34d4d1de	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5656-fe8f-0d0c-37c078b3b13f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5656-fe8f-306d-87931cf66b61	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5656-fe8f-574c-0689360f3475	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5656-fe8f-1636-80fe5088e126	ML	MLI	466	Mali 	Mali	\N
00040000-5656-fe8f-53da-24be3cbac704	MT	MLT	470	Malta 	Malta	\N
00040000-5656-fe8f-a5d4-4e3105df44b1	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5656-fe8f-7a1d-951fa5f25788	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5656-fe8f-256b-45e716076949	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5656-fe8f-999e-1a37123a9b83	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5656-fe8f-83e8-10417ccf79d2	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5656-fe8f-0bc9-23570fa96d8b	MX	MEX	484	Mexico 	Mehika	\N
00040000-5656-fe8f-b918-79fd7a1b0137	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5656-fe8f-78b2-a34efc483dc6	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5656-fe8f-a2c1-880a7f1759bd	MC	MCO	492	Monaco 	Monako	\N
00040000-5656-fe8f-6a44-d41e2ae4b14b	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5656-fe8f-03f4-d0d37b2c6ce9	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5656-fe8f-71f2-cb1569e3ee9c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5656-fe8f-ae18-dafac0649fc0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5656-fe8f-d5c0-a6ce536cd564	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5656-fe8f-70be-ffd71223c0df	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5656-fe8f-cd90-1bbe357c3ec4	NA	NAM	516	Namibia 	Namibija	\N
00040000-5656-fe8f-5306-acf2df303bf1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5656-fe8f-364d-d3b4ef8a0440	NP	NPL	524	Nepal 	Nepal	\N
00040000-5656-fe8f-ee1a-5db88e3a7a14	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5656-fe8f-e0f4-5d770925ada4	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5656-fe8f-0b85-a00bd19b53dc	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5656-fe8f-cc23-f9d7c9087b8a	NE	NER	562	Niger 	Niger 	\N
00040000-5656-fe8f-ef67-5b0ba52792ff	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5656-fe8f-b82c-1c55c025f1ad	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5656-fe8f-bf87-514d57c98866	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5656-fe8f-707c-dc8c5ca0b45c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5656-fe8f-a08e-e848bfed62e5	NO	NOR	578	Norway 	Norveška	\N
00040000-5656-fe8f-a8cd-00531b2ac39c	OM	OMN	512	Oman 	Oman	\N
00040000-5656-fe8f-8120-612587fa8a22	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5656-fe8f-2835-97257a913216	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5656-fe8f-ea36-73ea4dfdd2e0	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5656-fe8f-7407-4f8446be67a2	PA	PAN	591	Panama 	Panama	\N
00040000-5656-fe8f-6965-7db115f55f62	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5656-fe8f-914e-ce41a61d18da	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5656-fe8f-9871-4e0777e13a2d	PE	PER	604	Peru 	Peru	\N
00040000-5656-fe8f-c28c-ff95248da6e5	PH	PHL	608	Philippines 	Filipini	\N
00040000-5656-fe8f-50b8-0e6e4283b86b	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5656-fe8f-ca33-4338094b8e37	PL	POL	616	Poland 	Poljska	\N
00040000-5656-fe8f-d700-e2fe42bf20d4	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5656-fe8f-62e0-bb944337cfd1	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5656-fe8f-76be-a71f872e5a76	QA	QAT	634	Qatar 	Katar	\N
00040000-5656-fe8f-b0c8-63cdee605aef	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5656-fe8f-637f-580da359417f	RO	ROU	642	Romania 	Romunija	\N
00040000-5656-fe8f-5787-732ff4976d41	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5656-fe8f-a1be-8fbce310c975	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5656-fe8f-2fd7-c95afe4b7ca1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5656-fe8f-1be6-49ef545bf3ce	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5656-fe8f-083c-444b2e353a2a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5656-fe8f-2cc5-22b8db7be47a	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5656-fe8f-21ef-5b6c36a1cc67	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5656-fe8f-2841-fbfbf44b84e0	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5656-fe8f-c5f0-c350219d9ad2	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5656-fe8f-7309-5b060bf2829c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5656-fe8f-68f4-d2f27115c705	SM	SMR	674	San Marino 	San Marino	\N
00040000-5656-fe8f-be75-f60f43d2bc54	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5656-fe8f-afb0-dce01498a956	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5656-fe8f-46fa-c7a1f3ad3564	SN	SEN	686	Senegal 	Senegal	\N
00040000-5656-fe8f-565f-9bb8b3298d22	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5656-fe8f-f47d-fe29a845c246	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5656-fe8f-a3fd-aa62c6a9d78b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5656-fe8f-4d74-d597ecdbcf55	SG	SGP	702	Singapore 	Singapur	\N
00040000-5656-fe8f-9d2c-739817a49ac1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5656-fe8f-14ad-33ec40aeda4a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5656-fe8f-f492-422f18a96187	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5656-fe8f-f3e6-e1b1f85b5b8e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5656-fe8f-9a65-ba9331c2cab2	SO	SOM	706	Somalia 	Somalija	\N
00040000-5656-fe8f-3f89-7c17fe946850	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5656-fe8f-fd32-fe2ad0a88166	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5656-fe8f-b39f-a79537b7ced4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5656-fe8f-e321-9f6d139ec389	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5656-fe8f-fb26-4b8eda4fe7bc	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5656-fe8f-d12d-580a7c10e4f2	SD	SDN	729	Sudan 	Sudan	\N
00040000-5656-fe8f-b153-cd7da1f2a18f	SR	SUR	740	Suriname 	Surinam	\N
00040000-5656-fe8f-0da6-3815d41f945c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5656-fe8f-dafc-7222fa530cbf	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5656-fe8f-ef88-cb3985e2b7b7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5656-fe8f-8166-aa193e232902	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5656-fe8f-6bbd-ce6c8d7aae7f	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5656-fe8f-27a2-94023b34db66	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5656-fe8f-6d77-06d0b31c0cae	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5656-fe8f-53cc-4bae7ca1b3b9	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5656-fe8f-11e1-5b1f9cc8268e	TH	THA	764	Thailand 	Tajska	\N
00040000-5656-fe8f-fe15-b77d521698fd	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5656-fe8f-34c5-810399705cb1	TG	TGO	768	Togo 	Togo	\N
00040000-5656-fe8f-cbe6-ccb11bfa0ea1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5656-fe8f-9a2d-a0860027b3a6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5656-fe8f-9fad-ac1aac45a856	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5656-fe8f-cdef-b809a0e2bb54	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5656-fe8f-2eb5-6997249323a6	TR	TUR	792	Turkey 	Turčija	\N
00040000-5656-fe8f-ef6d-9832e01ebafb	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5656-fe8f-790e-bfcbf19e90aa	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5656-fe8f-ba38-7e6374425bed	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5656-fe8f-16f1-005b7c086172	UG	UGA	800	Uganda 	Uganda	\N
00040000-5656-fe8f-7011-809c2206d679	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5656-fe8f-ece8-e0d64944aeb1	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5656-fe8f-8419-ff0e68fefeb4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5656-fe8f-6b12-ea1d4fc3c45f	US	USA	840	United States 	Združene države Amerike	\N
00040000-5656-fe8f-0331-34cc6b77b3eb	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5656-fe8f-5545-68c74597dbd3	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5656-fe8f-ffd5-dc878e69254a	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5656-fe8f-5669-84de6f3033fe	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5656-fe8f-8518-878d4a27813a	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5656-fe8f-bf2d-b254caee3dc1	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5656-fe8f-3ca1-09eb42b68f41	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5656-fe8f-5ba5-193d4e1f73d6	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5656-fe8f-5261-0c6266d107d0	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5656-fe8f-99df-bbe547a5a911	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5656-fe8f-a73d-c0fd1665a490	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5656-fe8f-12e1-218f63aed92e	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5656-fe8f-857b-01ce962c2c43	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29625976)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5656-fe91-8369-f4cfab43e953	000e0000-5656-fe91-a61c-6d1935ea96f7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5656-fe8f-8810-3091128365f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5656-fe91-2f00-2f6684e46e7c	000e0000-5656-fe91-f310-44409a61f07e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5656-fe8f-301c-b2981ab060c2	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5656-fe91-3d38-a9752ce03803	000e0000-5656-fe91-9c65-64005abb3207	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5656-fe8f-8810-3091128365f6	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5656-fe91-a66b-c7ee81bbe17b	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5656-fe91-5923-c55c163a6620	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29625777)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5656-fe91-e9a4-a01fedf090b4	000e0000-5656-fe91-f310-44409a61f07e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5656-fe8f-d21e-03cf18cc7d70
000d0000-5656-fe91-3aac-a58e527179ec	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-c513-e7c23d8ef9c7	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5656-fe8f-d21e-03cf18cc7d70
000d0000-5656-fe91-f240-3e26b003ceb7	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-8f31-a4638b672ffa	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5656-fe8f-6c0e-8f35b9dda019
000d0000-5656-fe91-5167-471967c0d6ee	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-7b1b-04c9ba395784	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5656-fe8f-ee72-ed1f764b1403
000d0000-5656-fe91-6cc1-056038bd41e3	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-f483-df91ce3ffb87	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5656-fe8f-e972-0de428eca810
000d0000-5656-fe91-f923-da89c0f81a7c	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-fac5-68d1a9086172	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5656-fe8f-e972-0de428eca810
000d0000-5656-fe91-7d7d-8b612bd275d5	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-5457-989d7aafc748	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5656-fe8f-d21e-03cf18cc7d70
000d0000-5656-fe91-12d0-6a8af293053a	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-8ac1-2235053821d4	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5656-fe8f-5b7a-49e8efb393e9
000d0000-5656-fe91-9dd1-8b1473f5998e	000e0000-5656-fe91-f310-44409a61f07e	000c0000-5656-fe91-e0db-fb6878e92c47	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5656-fe8f-26d3-dd9bd2427f62
\.


--
-- TOC entry 3122 (class 0 OID 29625568)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29625534)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29625511)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5656-fe91-1bff-3308cb454605	00080000-5656-fe91-fc42-7cdcd86ca07a	00090000-5656-fe91-77b5-f58c5caf913a	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29625691)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29626234)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5656-fe91-5fd9-ce08f8d26c7b	00010000-5656-fe8f-95ea-7e0bcc446325	\N	Prva mapa	Root mapa	2015-11-26 13:44:01	2015-11-26 13:44:01	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29626247)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29626269)
-- Dependencies: 252
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3092 (class 0 OID 25231831)
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
-- TOC entry 3138 (class 0 OID 29625716)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29625468)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5656-fe8f-6274-0644dedd610c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5656-fe8f-5d0c-63cc20fde95e	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5656-fe8f-6233-871fd828b07a	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5656-fe8f-5f70-774a51b36b3a	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5656-fe8f-4f5b-12aecbba9f15	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5656-fe8f-0f4b-fbb464259667	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5656-fe8f-075b-50bc46b40f02	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5656-fe8f-7af5-4ed2f029c07f	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5656-fe8f-e455-3a9ded4cda95	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5656-fe8f-b110-5db5265025ff	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5656-fe8f-5bff-322b08eae378	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5656-fe8f-df69-cb0e701804c7	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5656-fe8f-840b-18df9251c0ee	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5656-fe8f-bb1e-45cacd574261	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5656-fe91-79fc-fc570f93d047	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5656-fe91-3ba7-974563defd77	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5656-fe91-6faa-6c1da566dc5b	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5656-fe91-7c2a-ec8b7c520c9f	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5656-fe91-ceef-310141bc0468	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5656-fe93-2c2e-784f8447a048	application.tenant.maticnopodjetje	string	s:36:"00080000-5656-fe93-b829-2bc6f2a95157";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29625368)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5656-fe91-48e8-9b2917312c25	00000000-5656-fe91-79fc-fc570f93d047	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5656-fe91-d0e5-c17100d64873	00000000-5656-fe91-79fc-fc570f93d047	00010000-5656-fe8f-95ea-7e0bcc446325	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5656-fe91-eff5-96f6a62acbc6	00000000-5656-fe91-3ba7-974563defd77	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29625435)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5656-fe91-b1b6-a70870d27af2	\N	00100000-5656-fe91-7806-0b82427f92f7	00100000-5656-fe91-15c7-adbca6d8a0cb	01	Gledališče Nimbis
00410000-5656-fe91-5987-02ab6a6029ec	00410000-5656-fe91-b1b6-a70870d27af2	00100000-5656-fe91-7806-0b82427f92f7	00100000-5656-fe91-15c7-adbca6d8a0cb	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29625379)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5656-fe91-ab46-4a4c120d9413	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5656-fe91-0de2-c5c14a8b8717	00010000-5656-fe91-7697-4d32dc627f79	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5656-fe91-a390-60ddf86c1d88	00010000-5656-fe91-2c25-8a5984ed4f91	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5656-fe91-787a-cd07f6875508	00010000-5656-fe91-a2c8-d18f26fe55f8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5656-fe91-c207-16fdd8559502	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5656-fe91-ce27-5232baa6430c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5656-fe91-5421-949b2029ac7b	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5656-fe91-35bc-4d0f6ec42cc6	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5656-fe91-77b5-f58c5caf913a	00010000-5656-fe91-493e-259bc90db2d9	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5656-fe91-bda0-43863f9631d0	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5656-fe91-c022-36a057293db0	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5656-fe91-c1c4-ec63e303470b	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5656-fe91-fbc3-aa84bc700a29	00010000-5656-fe91-6bb4-872af9e87c91	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5656-fe91-a985-2328ffffddc3	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5656-fe91-9927-f53a04950023	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5656-fe91-417c-469d3306c8eb	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5656-fe91-1573-1787ef54c1e0	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5656-fe91-c4e3-71bb74f5ae29	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5656-fe91-619e-ad490a1cb4d2	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5656-fe91-b58d-17ca4a064d13	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5656-fe91-8d3d-afe401ddb1cf	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29625314)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5656-fe8f-02f1-40ecbf3db043	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5656-fe8f-b4b9-604a2018a0c2	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5656-fe8f-37ce-4bbd1e9dbd08	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5656-fe8f-2f91-bca2b933abf2	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5656-fe8f-7922-20151c054831	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5656-fe8f-6312-8039543dd828	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5656-fe8f-6025-138edf3d879e	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5656-fe8f-34c7-95c31b1b6258	Abonma-read	Abonma - branje	t
00030000-5656-fe8f-184c-35a5ca32060b	Abonma-write	Abonma - spreminjanje	t
00030000-5656-fe8f-be6d-639bf84083de	Alternacija-read	Alternacija - branje	t
00030000-5656-fe8f-e8e7-2e0784566667	Alternacija-write	Alternacija - spreminjanje	t
00030000-5656-fe8f-9c24-3855f64263d2	Arhivalija-read	Arhivalija - branje	t
00030000-5656-fe8f-a11f-eab04793710b	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5656-fe8f-2b8a-ae6f9a06b0ba	AuthStorage-read	AuthStorage - branje	t
00030000-5656-fe8f-62e9-ff03c74a4671	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5656-fe8f-5d15-429f19813704	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5656-fe8f-3fcb-92c8b44f6a96	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5656-fe8f-b120-cc497bd134e2	Besedilo-read	Besedilo - branje	t
00030000-5656-fe8f-d0d2-b0712119e22a	Besedilo-write	Besedilo - spreminjanje	t
00030000-5656-fe8f-da69-4043488fc5ef	Dogodek-read	Dogodek - branje	t
00030000-5656-fe8f-5a24-a7fb73bf8f22	Dogodek-write	Dogodek - spreminjanje	t
00030000-5656-fe8f-f479-ff92a1a9976a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5656-fe8f-e088-dcc52fbe2ba1	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5656-fe8f-e418-00ecb0fcc1e4	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5656-fe8f-dda2-fe671ba9cd9c	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5656-fe8f-93af-84f43a41322e	DogodekTrait-read	DogodekTrait - branje	t
00030000-5656-fe8f-9446-e01915096b8a	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5656-fe8f-c33e-b4f380dd79b7	DrugiVir-read	DrugiVir - branje	t
00030000-5656-fe8f-e208-41a1d8cccb97	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5656-fe8f-e297-6ab1fc944cfe	Drzava-read	Drzava - branje	t
00030000-5656-fe8f-6361-a44c2fe4aaf8	Drzava-write	Drzava - spreminjanje	t
00030000-5656-fe8f-53bb-36925533bf2e	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5656-fe8f-0955-4da2651fde23	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5656-fe8f-26c1-4091d2e319b8	Funkcija-read	Funkcija - branje	t
00030000-5656-fe8f-bbca-115c9b96b568	Funkcija-write	Funkcija - spreminjanje	t
00030000-5656-fe8f-eac7-8bb6fe0fb3bc	Gostovanje-read	Gostovanje - branje	t
00030000-5656-fe8f-32d4-c4878b7fc3ad	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5656-fe8f-0df9-b69dd6722339	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5656-fe8f-7963-214a9eb3fc40	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5656-fe8f-5eff-ca4f7a187ba8	Kupec-read	Kupec - branje	t
00030000-5656-fe8f-619b-0d2b814edef4	Kupec-write	Kupec - spreminjanje	t
00030000-5656-fe8f-e3bb-e5dd86083f77	NacinPlacina-read	NacinPlacina - branje	t
00030000-5656-fe8f-f7cc-6955073c9abb	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5656-fe8f-03d0-12aa4de01af6	Option-read	Option - branje	t
00030000-5656-fe8f-f054-a0a558dead84	Option-write	Option - spreminjanje	t
00030000-5656-fe8f-123c-90fe6644f0d8	OptionValue-read	OptionValue - branje	t
00030000-5656-fe8f-5983-3009406b0532	OptionValue-write	OptionValue - spreminjanje	t
00030000-5656-fe8f-81ab-280fdf51f449	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5656-fe8f-a91e-6130c096a1c3	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5656-fe8f-90df-cb5e99d3b134	Oseba-read	Oseba - branje	t
00030000-5656-fe8f-abb7-ee3550fccb2c	Oseba-write	Oseba - spreminjanje	t
00030000-5656-fe8f-16f6-5deeec54f286	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5656-fe8f-449c-8063eb7512fb	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5656-fe8f-dabd-841352864e89	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5656-fe8f-4be4-d864fba28b9a	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5656-fe8f-1c74-78a3634bc5b0	Pogodba-read	Pogodba - branje	t
00030000-5656-fe8f-ed13-a2d4991c9ff3	Pogodba-write	Pogodba - spreminjanje	t
00030000-5656-fe8f-f32a-50aa47b586a7	Popa-read	Popa - branje	t
00030000-5656-fe8f-4be0-9f13dc3f3b88	Popa-write	Popa - spreminjanje	t
00030000-5656-fe8f-c925-eb2ab505cc17	Posta-read	Posta - branje	t
00030000-5656-fe8f-6018-9af56c6159e4	Posta-write	Posta - spreminjanje	t
00030000-5656-fe8f-b579-9424d92ac7a7	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5656-fe8f-0759-128c78564da2	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5656-fe8f-9607-4720f5947417	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5656-fe8f-aa6a-d1fbf9fb9d77	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5656-fe8f-3ec9-cb5d356cdd2c	PostniNaslov-read	PostniNaslov - branje	t
00030000-5656-fe8f-42fa-bda1d9884acf	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5656-fe8f-5e6d-e2ae1106ee3c	Praznik-read	Praznik - branje	t
00030000-5656-fe8f-393e-407e414b229d	Praznik-write	Praznik - spreminjanje	t
00030000-5656-fe8f-4370-b25a4cdc1641	Predstava-read	Predstava - branje	t
00030000-5656-fe8f-5378-487e01374974	Predstava-write	Predstava - spreminjanje	t
00030000-5656-fe8f-8620-0250b661eb8d	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5656-fe8f-730f-2a6278220974	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5656-fe8f-041b-613ecfb3b989	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5656-fe8f-1660-6a4876c1ed25	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5656-fe8f-e7f1-165f084e67da	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5656-fe8f-f339-c8958e4e113e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5656-fe8f-49ca-44899167efe4	ProgramDela-read	ProgramDela - branje	t
00030000-5656-fe8f-12ae-30b1f2d5b64b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5656-fe8f-8d76-13728743e377	ProgramFestival-read	ProgramFestival - branje	t
00030000-5656-fe8f-8a04-cf9e2d455d23	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5656-fe8f-efde-5c5d3ede8fb3	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5656-fe8f-eed8-8c6461399d24	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5656-fe8f-a963-77eb60eccc1a	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5656-fe8f-894f-abcd17cdb2fd	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5656-fe8f-7b54-f6724e5d9f3c	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5656-fe8f-2b7b-dbd0c1ce179b	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5656-fe8f-72ab-8809f5dc9a44	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5656-fe8f-bbfc-3b6b1f197ebd	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5656-fe8f-f33a-6b9876502c1d	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5656-fe8f-54a4-d50e69c28430	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5656-fe8f-b147-8928623d371a	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5656-fe8f-02fc-b321523426b6	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5656-fe8f-f0d5-035ed4c7cbf3	ProgramRazno-read	ProgramRazno - branje	t
00030000-5656-fe8f-db07-a96707562824	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5656-fe8f-cef5-bb168b9436b1	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5656-fe8f-5a5a-cad1f862e68f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5656-fe8f-2404-8850f185d1a3	Prostor-read	Prostor - branje	t
00030000-5656-fe8f-74ad-9bea95fd9c7a	Prostor-write	Prostor - spreminjanje	t
00030000-5656-fe8f-8258-9abbdc8f3229	Racun-read	Racun - branje	t
00030000-5656-fe8f-50b6-af47f0632688	Racun-write	Racun - spreminjanje	t
00030000-5656-fe8f-12b2-faa380dd94a0	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5656-fe8f-1b1a-57025f8cf0af	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5656-fe8f-8e0d-f6046aefc38a	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5656-fe8f-2607-a92f98c82aa3	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5656-fe8f-a3ae-6490e1d2d1dd	Rekvizit-read	Rekvizit - branje	t
00030000-5656-fe8f-f240-d964c7ee2cee	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5656-fe8f-81b6-e070cf6d9a06	Revizija-read	Revizija - branje	t
00030000-5656-fe8f-2716-f2dc4af1ac55	Revizija-write	Revizija - spreminjanje	t
00030000-5656-fe8f-88ae-c2451e7c4953	Rezervacija-read	Rezervacija - branje	t
00030000-5656-fe8f-d68d-79926ba18c08	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5656-fe8f-f189-3ec52927dcc8	SedezniRed-read	SedezniRed - branje	t
00030000-5656-fe8f-172b-502c353c19a1	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5656-fe8f-e3e7-4e3e57835360	Sedez-read	Sedez - branje	t
00030000-5656-fe8f-0f52-09ab89849a77	Sedez-write	Sedez - spreminjanje	t
00030000-5656-fe8f-d05b-d58091c13462	Sezona-read	Sezona - branje	t
00030000-5656-fe8f-33db-78d3c5264c19	Sezona-write	Sezona - spreminjanje	t
00030000-5656-fe8f-1303-87d1710a328f	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5656-fe8f-a878-2469910ebdb4	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5656-fe8f-21ae-b340e533358a	Stevilcenje-read	Stevilcenje - branje	t
00030000-5656-fe8f-2c6a-14b7945c120a	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5656-fe8f-519c-1ede89c45c5e	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5656-fe8f-2f6c-8d26e2a50ae4	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5656-fe8f-8042-9fb21ab92fc4	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5656-fe8f-8a67-110e85561c8f	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5656-fe8f-e6ac-9a0647c183da	Telefonska-read	Telefonska - branje	t
00030000-5656-fe8f-bbcb-622feb462610	Telefonska-write	Telefonska - spreminjanje	t
00030000-5656-fe8f-4ade-548bdd302a7a	TerminStoritve-read	TerminStoritve - branje	t
00030000-5656-fe8f-ef14-be9669a28c6e	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5656-fe8f-b407-b1ab9cef42c9	TipFunkcije-read	TipFunkcije - branje	t
00030000-5656-fe8f-d5d3-cd1c594001bf	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5656-fe8f-c93c-8d0c65e22ea1	TipPopa-read	TipPopa - branje	t
00030000-5656-fe8f-92d4-990755f7fe4e	TipPopa-write	TipPopa - spreminjanje	t
00030000-5656-fe8f-3178-2b7bebcdf26c	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5656-fe8f-43d0-6ed1e2831362	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5656-fe8f-b2fa-27ec513e31fa	TipVaje-read	TipVaje - branje	t
00030000-5656-fe8f-fe9c-d9157ab53ed9	TipVaje-write	TipVaje - spreminjanje	t
00030000-5656-fe8f-3733-0085de3de8c3	Trr-read	Trr - branje	t
00030000-5656-fe8f-737c-9334488faa1f	Trr-write	Trr - spreminjanje	t
00030000-5656-fe8f-c8fd-575022bd9332	Uprizoritev-read	Uprizoritev - branje	t
00030000-5656-fe8f-d48f-757ca5f623ca	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5656-fe8f-52f5-06cea4dac6ab	Vaja-read	Vaja - branje	t
00030000-5656-fe8f-3f37-b3941fde9e0a	Vaja-write	Vaja - spreminjanje	t
00030000-5656-fe8f-2e30-e0e785b81b9e	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5656-fe8f-38ef-9390f36acdb1	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5656-fe8f-8251-1ac9199411db	VrstaStroska-read	VrstaStroska - branje	t
00030000-5656-fe8f-07ec-b7f3208f6bef	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5656-fe8f-ab4d-54b15ec30955	Zaposlitev-read	Zaposlitev - branje	t
00030000-5656-fe8f-b3b5-1f498217b2ea	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5656-fe8f-14bf-48f4533b0244	Zasedenost-read	Zasedenost - branje	t
00030000-5656-fe8f-2d39-6c1813cc99de	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5656-fe8f-4f41-54ea6fbc337c	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5656-fe8f-8a77-df6351774c9e	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5656-fe8f-0e14-5790a8dac76e	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5656-fe8f-ee80-3cd28525ac49	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5656-fe8f-9b62-8eb5add730b5	Job-read	Branje opravil - samo zase - branje	t
00030000-5656-fe8f-b48d-2579cc101fb9	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5656-fe8f-4627-1af50eb71a91	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5656-fe8f-c41e-e3a1ff2f3fcc	Report-read	Report - branje	t
00030000-5656-fe8f-2a53-d9f67a816897	Report-write	Report - spreminjanje	t
00030000-5656-fe8f-7f02-9f9dda012a97	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5656-fe8f-f6c3-82fe7f610b45	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5656-fe8f-5c74-31a872663033	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5656-fe8f-40fb-b90c0c594952	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5656-fe8f-ac18-45d8497bd7d5	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5656-fe8f-ac12-f469fb763819	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5656-fe8f-c4fa-70f467d80bd3	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5656-fe8f-fdd0-dd13c46ab6f2	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5656-fe8f-3c8a-5a2f822194f2	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5656-fe8f-4297-c121758ca9a2	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5656-fe8f-c591-0df0ba01da82	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5656-fe8f-73c1-5004885b557b	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5656-fe8f-318e-7c83f738849c	Datoteka-write	Datoteka - spreminjanje	t
00030000-5656-fe8f-5c0d-3c31607c48c5	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29625333)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5656-fe8f-017a-c92411701f2e	00030000-5656-fe8f-b4b9-604a2018a0c2
00020000-5656-fe8f-3576-8f1177cd57c3	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-184c-35a5ca32060b
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-be6d-639bf84083de
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-e8e7-2e0784566667
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-9c24-3855f64263d2
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-da69-4043488fc5ef
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-2f91-bca2b933abf2
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-5a24-a7fb73bf8f22
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-6361-a44c2fe4aaf8
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-26c1-4091d2e319b8
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-bbca-115c9b96b568
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-eac7-8bb6fe0fb3bc
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-32d4-c4878b7fc3ad
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-0df9-b69dd6722339
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-7963-214a9eb3fc40
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-03d0-12aa4de01af6
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-123c-90fe6644f0d8
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-abb7-ee3550fccb2c
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-4be0-9f13dc3f3b88
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-6018-9af56c6159e4
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-42fa-bda1d9884acf
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-4370-b25a4cdc1641
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-5378-487e01374974
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-e7f1-165f084e67da
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-f339-c8958e4e113e
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-74ad-9bea95fd9c7a
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-8e0d-f6046aefc38a
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-2607-a92f98c82aa3
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-a3ae-6490e1d2d1dd
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-f240-d964c7ee2cee
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-d05b-d58091c13462
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-33db-78d3c5264c19
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-b407-b1ab9cef42c9
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-c8fd-575022bd9332
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-d48f-757ca5f623ca
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-52f5-06cea4dac6ab
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-3f37-b3941fde9e0a
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-14bf-48f4533b0244
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-2d39-6c1813cc99de
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe8f-e51d-9d7deed3157e	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-9c24-3855f64263d2
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-da69-4043488fc5ef
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-eac7-8bb6fe0fb3bc
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-0df9-b69dd6722339
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-7963-214a9eb3fc40
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-03d0-12aa4de01af6
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-123c-90fe6644f0d8
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-abb7-ee3550fccb2c
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-42fa-bda1d9884acf
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-4370-b25a4cdc1641
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-8e0d-f6046aefc38a
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-a3ae-6490e1d2d1dd
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-d05b-d58091c13462
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-e6ac-9a0647c183da
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-bbcb-622feb462610
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-3733-0085de3de8c3
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-737c-9334488faa1f
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-ab4d-54b15ec30955
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-b3b5-1f498217b2ea
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe8f-afe3-f467fa334a7c	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-be6d-639bf84083de
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-9c24-3855f64263d2
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-a11f-eab04793710b
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-b120-cc497bd134e2
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-f479-ff92a1a9976a
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-da69-4043488fc5ef
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-26c1-4091d2e319b8
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-eac7-8bb6fe0fb3bc
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-0df9-b69dd6722339
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-03d0-12aa4de01af6
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-123c-90fe6644f0d8
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-4370-b25a4cdc1641
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-e7f1-165f084e67da
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-8e0d-f6046aefc38a
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-a3ae-6490e1d2d1dd
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-d05b-d58091c13462
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-b407-b1ab9cef42c9
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-52f5-06cea4dac6ab
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-14bf-48f4533b0244
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe8f-077a-5bea8b73a809	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-184c-35a5ca32060b
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-e8e7-2e0784566667
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-9c24-3855f64263d2
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-da69-4043488fc5ef
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-eac7-8bb6fe0fb3bc
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-03d0-12aa4de01af6
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-123c-90fe6644f0d8
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-4370-b25a4cdc1641
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-8e0d-f6046aefc38a
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-a3ae-6490e1d2d1dd
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-d05b-d58091c13462
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-b407-b1ab9cef42c9
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe8f-bbeb-05e4761c9094	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-9c24-3855f64263d2
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-da69-4043488fc5ef
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-eac7-8bb6fe0fb3bc
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-03d0-12aa4de01af6
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-123c-90fe6644f0d8
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-4370-b25a4cdc1641
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-8e0d-f6046aefc38a
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-a3ae-6490e1d2d1dd
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-d05b-d58091c13462
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-4ade-548bdd302a7a
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-37ce-4bbd1e9dbd08
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-b407-b1ab9cef42c9
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe8f-d666-d6f4b9910e03	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-02f1-40ecbf3db043
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b4b9-604a2018a0c2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-184c-35a5ca32060b
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-be6d-639bf84083de
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e8e7-2e0784566667
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-9c24-3855f64263d2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-a11f-eab04793710b
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2b8a-ae6f9a06b0ba
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-62e9-ff03c74a4671
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5d15-429f19813704
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-3fcb-92c8b44f6a96
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b120-cc497bd134e2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-d0d2-b0712119e22a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-318e-7c83f738849c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-da69-4043488fc5ef
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2f91-bca2b933abf2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5a24-a7fb73bf8f22
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f479-ff92a1a9976a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e088-dcc52fbe2ba1
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e418-00ecb0fcc1e4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-dda2-fe671ba9cd9c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c33e-b4f380dd79b7
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e208-41a1d8cccb97
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-6361-a44c2fe4aaf8
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-53bb-36925533bf2e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-0955-4da2651fde23
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-26c1-4091d2e319b8
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-bbca-115c9b96b568
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-eac7-8bb6fe0fb3bc
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-32d4-c4878b7fc3ad
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4627-1af50eb71a91
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-9b62-8eb5add730b5
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b48d-2579cc101fb9
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-0df9-b69dd6722339
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-7963-214a9eb3fc40
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5eff-ca4f7a187ba8
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-619b-0d2b814edef4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-7f02-9f9dda012a97
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f6c3-82fe7f610b45
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5c74-31a872663033
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-40fb-b90c0c594952
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-ac12-f469fb763819
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-ac18-45d8497bd7d5
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e3bb-e5dd86083f77
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f7cc-6955073c9abb
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-03d0-12aa4de01af6
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f054-a0a558dead84
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-123c-90fe6644f0d8
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5983-3009406b0532
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-81ab-280fdf51f449
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-a91e-6130c096a1c3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-7922-20151c054831
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-abb7-ee3550fccb2c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-16f6-5deeec54f286
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-449c-8063eb7512fb
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-dabd-841352864e89
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4be4-d864fba28b9a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-1c74-78a3634bc5b0
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-ed13-a2d4991c9ff3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4be0-9f13dc3f3b88
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-6018-9af56c6159e4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b579-9424d92ac7a7
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-0759-128c78564da2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-9607-4720f5947417
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-aa6a-d1fbf9fb9d77
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-42fa-bda1d9884acf
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5e6d-e2ae1106ee3c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-393e-407e414b229d
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4370-b25a4cdc1641
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5378-487e01374974
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8620-0250b661eb8d
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-730f-2a6278220974
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-041b-613ecfb3b989
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-1660-6a4876c1ed25
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e7f1-165f084e67da
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f339-c8958e4e113e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-6312-8039543dd828
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-49ca-44899167efe4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-6025-138edf3d879e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-12ae-30b1f2d5b64b
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8d76-13728743e377
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8a04-cf9e2d455d23
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-efde-5c5d3ede8fb3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-eed8-8c6461399d24
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-a963-77eb60eccc1a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-894f-abcd17cdb2fd
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-7b54-f6724e5d9f3c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2b7b-dbd0c1ce179b
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-72ab-8809f5dc9a44
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-bbfc-3b6b1f197ebd
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f33a-6b9876502c1d
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-54a4-d50e69c28430
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b147-8928623d371a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-02fc-b321523426b6
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f0d5-035ed4c7cbf3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-db07-a96707562824
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-cef5-bb168b9436b1
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-5a5a-cad1f862e68f
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-74ad-9bea95fd9c7a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8258-9abbdc8f3229
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-50b6-af47f0632688
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-12b2-faa380dd94a0
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-1b1a-57025f8cf0af
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-a3ae-6490e1d2d1dd
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f240-d964c7ee2cee
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8e0d-f6046aefc38a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2607-a92f98c82aa3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c41e-e3a1ff2f3fcc
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2a53-d9f67a816897
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-81b6-e070cf6d9a06
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2716-f2dc4af1ac55
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-88ae-c2451e7c4953
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-d68d-79926ba18c08
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e3e7-4e3e57835360
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-0f52-09ab89849a77
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-f189-3ec52927dcc8
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-172b-502c353c19a1
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-d05b-d58091c13462
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-33db-78d3c5264c19
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-21ae-b340e533358a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2c6a-14b7945c120a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-1303-87d1710a328f
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-a878-2469910ebdb4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-519c-1ede89c45c5e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2f6c-8d26e2a50ae4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8042-9fb21ab92fc4
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8a67-110e85561c8f
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-e6ac-9a0647c183da
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-bbcb-622feb462610
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4ade-548bdd302a7a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-37ce-4bbd1e9dbd08
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-ef14-be9669a28c6e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b407-b1ab9cef42c9
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-d5d3-cd1c594001bf
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c93c-8d0c65e22ea1
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-92d4-990755f7fe4e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-3178-2b7bebcdf26c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-43d0-6ed1e2831362
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b2fa-27ec513e31fa
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-fe9c-d9157ab53ed9
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-3733-0085de3de8c3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-737c-9334488faa1f
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c8fd-575022bd9332
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-d48f-757ca5f623ca
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-52f5-06cea4dac6ab
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-3f37-b3941fde9e0a
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2e30-e0e785b81b9e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-38ef-9390f36acdb1
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8251-1ac9199411db
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-07ec-b7f3208f6bef
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-73c1-5004885b557b
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c591-0df0ba01da82
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-c4fa-70f467d80bd3
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-3c8a-5a2f822194f2
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-ab4d-54b15ec30955
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-b3b5-1f498217b2ea
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-14bf-48f4533b0244
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-2d39-6c1813cc99de
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-8a77-df6351774c9e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe91-1253-84fc5e819bd0	00030000-5656-fe8f-ee80-3cd28525ac49
00020000-5656-fe91-7b17-690e243d1b67	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-7776-0ea27f74e301	00030000-5656-fe8f-3c8a-5a2f822194f2
00020000-5656-fe91-ab7d-50230a605034	00030000-5656-fe8f-d48f-757ca5f623ca
00020000-5656-fe91-c918-91b1664741fe	00030000-5656-fe8f-c8fd-575022bd9332
00020000-5656-fe91-e61f-2c3dd939cf6a	00030000-5656-fe8f-f6c3-82fe7f610b45
00020000-5656-fe91-cee6-a9f7b9c06416	00030000-5656-fe8f-5c74-31a872663033
00020000-5656-fe91-153a-c03b83ebe87b	00030000-5656-fe8f-40fb-b90c0c594952
00020000-5656-fe91-c636-cd837b2d8077	00030000-5656-fe8f-7f02-9f9dda012a97
00020000-5656-fe91-8dd9-3109e8ad15cb	00030000-5656-fe8f-ac12-f469fb763819
00020000-5656-fe91-fa05-16e7b9abcadc	00030000-5656-fe8f-ac18-45d8497bd7d5
00020000-5656-fe91-b878-7cfffd1ac451	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-9da9-2626c066ac4d	00030000-5656-fe8f-c4fa-70f467d80bd3
00020000-5656-fe91-6d85-5885b8296ad6	00030000-5656-fe8f-abb7-ee3550fccb2c
00020000-5656-fe91-3f2b-0ff1d397f162	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe91-ed1d-62532db3c42b	00030000-5656-fe8f-318e-7c83f738849c
00020000-5656-fe91-f98f-bbc07b1f34e1	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-1d11-9512acf28585	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-1d11-9512acf28585	00030000-5656-fe8f-4be0-9f13dc3f3b88
00020000-5656-fe91-1d11-9512acf28585	00030000-5656-fe8f-c8fd-575022bd9332
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-3fcb-92c8b44f6a96
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-d0d2-b0712119e22a
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-318e-7c83f738849c
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-c4fa-70f467d80bd3
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-3c8a-5a2f822194f2
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-5d15-429f19813704
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-b120-cc497bd134e2
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-f216-c44d16614a00	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-ad2c-438f8395dd7e	00030000-5656-fe8f-5d15-429f19813704
00020000-5656-fe91-ad2c-438f8395dd7e	00030000-5656-fe8f-b120-cc497bd134e2
00020000-5656-fe91-ad2c-438f8395dd7e	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-ad2c-438f8395dd7e	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-ad2c-438f8395dd7e	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-8c71-e839fdd7ad03	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe91-8c71-e839fdd7ad03	00030000-5656-fe8f-ab4d-54b15ec30955
00020000-5656-fe91-8c71-e839fdd7ad03	00030000-5656-fe8f-b3b5-1f498217b2ea
00020000-5656-fe91-8c71-e839fdd7ad03	00030000-5656-fe8f-81ab-280fdf51f449
00020000-5656-fe91-5aa5-519cebbfdf61	00030000-5656-fe8f-ab4d-54b15ec30955
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-e6ac-9a0647c183da
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-3733-0085de3de8c3
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-0df9-b69dd6722339
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-e7f1-165f084e67da
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-bbcb-622feb462610
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-42fa-bda1d9884acf
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-c4fa-70f467d80bd3
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-737c-9334488faa1f
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-4be0-9f13dc3f3b88
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-318e-7c83f738849c
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-3c8a-5a2f822194f2
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-7963-214a9eb3fc40
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-f339-c8958e4e113e
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-f587-f0dc15166431	00030000-5656-fe8f-c93c-8d0c65e22ea1
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-e6ac-9a0647c183da
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-3733-0085de3de8c3
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-0df9-b69dd6722339
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-e7f1-165f084e67da
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-087a-da7661b03a17	00030000-5656-fe8f-c93c-8d0c65e22ea1
00020000-5656-fe91-d750-56686c0e46be	00030000-5656-fe8f-c93c-8d0c65e22ea1
00020000-5656-fe91-d750-56686c0e46be	00030000-5656-fe8f-92d4-990755f7fe4e
00020000-5656-fe91-557a-e0fafdac11b0	00030000-5656-fe8f-c93c-8d0c65e22ea1
00020000-5656-fe91-f5d2-87cb35ba1914	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe91-f5d2-87cb35ba1914	00030000-5656-fe8f-6018-9af56c6159e4
00020000-5656-fe91-a6cc-87e6b9f0f3dc	00030000-5656-fe8f-c925-eb2ab505cc17
00020000-5656-fe91-d18e-ca432a2f8752	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-d18e-ca432a2f8752	00030000-5656-fe8f-6361-a44c2fe4aaf8
00020000-5656-fe91-f97e-96dc060d4365	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-4b9d-0a90480a8c18	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe91-4b9d-0a90480a8c18	00030000-5656-fe8f-ee80-3cd28525ac49
00020000-5656-fe91-c6da-e9a457ff9f82	00030000-5656-fe8f-0e14-5790a8dac76e
00020000-5656-fe91-bb54-b7bb965a5509	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe91-bb54-b7bb965a5509	00030000-5656-fe8f-8a77-df6351774c9e
00020000-5656-fe91-89c1-e914ea4eb964	00030000-5656-fe8f-4f41-54ea6fbc337c
00020000-5656-fe91-3054-9a294146de6a	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe91-3054-9a294146de6a	00030000-5656-fe8f-184c-35a5ca32060b
00020000-5656-fe91-a3bf-ef18447dca86	00030000-5656-fe8f-34c7-95c31b1b6258
00020000-5656-fe91-3ae3-e5f362e21820	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe91-3ae3-e5f362e21820	00030000-5656-fe8f-74ad-9bea95fd9c7a
00020000-5656-fe91-3ae3-e5f362e21820	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-3ae3-e5f362e21820	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe91-3ae3-e5f362e21820	00030000-5656-fe8f-42fa-bda1d9884acf
00020000-5656-fe91-3ae3-e5f362e21820	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-1967-8f044dcf89c8	00030000-5656-fe8f-2404-8850f185d1a3
00020000-5656-fe91-1967-8f044dcf89c8	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-1967-8f044dcf89c8	00030000-5656-fe8f-3ec9-cb5d356cdd2c
00020000-5656-fe91-8eef-c799724a99ef	00030000-5656-fe8f-8251-1ac9199411db
00020000-5656-fe91-8eef-c799724a99ef	00030000-5656-fe8f-07ec-b7f3208f6bef
00020000-5656-fe91-3166-1b400b0a122b	00030000-5656-fe8f-8251-1ac9199411db
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-a91e-6130c096a1c3
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-81ab-280fdf51f449
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-318e-7c83f738849c
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-c4fa-70f467d80bd3
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-3c8a-5a2f822194f2
00020000-5656-fe91-b738-a9f849f39890	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-9923-e6598eeeab66	00030000-5656-fe8f-81ab-280fdf51f449
00020000-5656-fe91-9923-e6598eeeab66	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-9923-e6598eeeab66	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-9923-e6598eeeab66	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-db10-87ede0b1ca08	00030000-5656-fe8f-b2fa-27ec513e31fa
00020000-5656-fe91-db10-87ede0b1ca08	00030000-5656-fe8f-fe9c-d9157ab53ed9
00020000-5656-fe91-6a39-7cb7070afb9c	00030000-5656-fe8f-b2fa-27ec513e31fa
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-6312-8039543dd828
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-6025-138edf3d879e
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-49ca-44899167efe4
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-12ae-30b1f2d5b64b
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-8d76-13728743e377
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-8a04-cf9e2d455d23
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-efde-5c5d3ede8fb3
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-eed8-8c6461399d24
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-a963-77eb60eccc1a
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-894f-abcd17cdb2fd
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-7b54-f6724e5d9f3c
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-2b7b-dbd0c1ce179b
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-72ab-8809f5dc9a44
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-bbfc-3b6b1f197ebd
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-f33a-6b9876502c1d
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-54a4-d50e69c28430
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-b147-8928623d371a
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-02fc-b321523426b6
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-f0d5-035ed4c7cbf3
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-db07-a96707562824
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-cef5-bb168b9436b1
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-5a5a-cad1f862e68f
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-1660-6a4876c1ed25
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-e208-41a1d8cccb97
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-0759-128c78564da2
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-c33e-b4f380dd79b7
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-041b-613ecfb3b989
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-e7f1-165f084e67da
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-b579-9424d92ac7a7
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-8251-1ac9199411db
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-c8fd-575022bd9332
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-8042-9fb21ab92fc4
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-26c1-4091d2e319b8
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-b407-b1ab9cef42c9
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-90df-cb5e99d3b134
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-1c74-78a3634bc5b0
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-f32a-50aa47b586a7
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-318e-7c83f738849c
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-c4fa-70f467d80bd3
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-3c8a-5a2f822194f2
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-2eb4-0f6bb401c7f0	00030000-5656-fe8f-4297-c121758ca9a2
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-49ca-44899167efe4
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-8d76-13728743e377
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-efde-5c5d3ede8fb3
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-a963-77eb60eccc1a
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-7b54-f6724e5d9f3c
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-72ab-8809f5dc9a44
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-f33a-6b9876502c1d
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-b147-8928623d371a
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-f0d5-035ed4c7cbf3
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-cef5-bb168b9436b1
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-041b-613ecfb3b989
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-c33e-b4f380dd79b7
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-b579-9424d92ac7a7
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-e297-6ab1fc944cfe
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-9b62-8eb5add730b5
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-c41e-e3a1ff2f3fcc
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-5c0d-3c31607c48c5
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-fdd0-dd13c46ab6f2
00020000-5656-fe91-8111-11557d0e5d6e	00030000-5656-fe8f-4297-c121758ca9a2
\.


--
-- TOC entry 3139 (class 0 OID 29625723)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29625757)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29625894)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5656-fe91-0820-de0e80df7f08	00090000-5656-fe91-ab46-4a4c120d9413	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5656-fe91-9e34-f48e29737506	00090000-5656-fe91-ce27-5232baa6430c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5656-fe91-b37c-b2601e3459b2	00090000-5656-fe91-fbc3-aa84bc700a29	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5656-fe91-1d73-8e7ca1c99e4d	00090000-5656-fe91-bda0-43863f9631d0	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29625415)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5656-fe91-fc42-7cdcd86ca07a	\N	00040000-5656-fe8f-f492-422f18a96187	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-fff7-413e481b5875	\N	00040000-5656-fe8f-f492-422f18a96187	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5656-fe91-a5d2-b29a27e20bde	\N	00040000-5656-fe8f-f492-422f18a96187	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-3bc8-bff297bb11d2	\N	00040000-5656-fe8f-f492-422f18a96187	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-172d-b01c47d3309d	\N	00040000-5656-fe8f-f492-422f18a96187	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-7bbe-7ad55e341d7e	\N	00040000-5656-fe8f-5d06-4829cd384299	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-19a8-320209fbbebf	\N	00040000-5656-fe8f-80a3-924f743dbd26	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-b8f9-dd74fc6b398f	\N	00040000-5656-fe8f-7b60-1d3d944941fe	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe91-ec2e-eef0cfbd9c74	\N	00040000-5656-fe8f-6bee-41d475c4f750	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5656-fe93-b829-2bc6f2a95157	\N	00040000-5656-fe8f-f492-422f18a96187	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29625460)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5656-fe8e-acba-72bd523e668e	8341	Adlešiči
00050000-5656-fe8e-8551-e18f954bb6db	5270	Ajdovščina
00050000-5656-fe8e-de79-c7dc8207511d	6280	Ankaran/Ancarano
00050000-5656-fe8e-9c12-894dc75748a6	9253	Apače
00050000-5656-fe8e-c6d7-c98760cdbf88	8253	Artiče
00050000-5656-fe8e-b0aa-f45f45ade079	4275	Begunje na Gorenjskem
00050000-5656-fe8e-6ea6-870b490a27c0	1382	Begunje pri Cerknici
00050000-5656-fe8e-25fc-763fd53ed44b	9231	Beltinci
00050000-5656-fe8e-54de-33a8f16096c2	2234	Benedikt
00050000-5656-fe8e-6634-b98812134cc0	2345	Bistrica ob Dravi
00050000-5656-fe8e-cc66-030d8e16ac7a	3256	Bistrica ob Sotli
00050000-5656-fe8e-f3d1-a04fee1d8902	8259	Bizeljsko
00050000-5656-fe8e-c364-d7b583699e82	1223	Blagovica
00050000-5656-fe8e-a39b-1692a2d71590	8283	Blanca
00050000-5656-fe8e-ba27-77b6be169bb8	4260	Bled
00050000-5656-fe8e-e544-f937474d2f40	4273	Blejska Dobrava
00050000-5656-fe8e-fd28-fa2d9932736c	9265	Bodonci
00050000-5656-fe8e-d54d-0eb64a22d7f4	9222	Bogojina
00050000-5656-fe8e-66b1-34489e81e760	4263	Bohinjska Bela
00050000-5656-fe8e-fa18-9719417ad621	4264	Bohinjska Bistrica
00050000-5656-fe8e-25d1-6b4a34289d36	4265	Bohinjsko jezero
00050000-5656-fe8e-73b0-862072126dee	1353	Borovnica
00050000-5656-fe8e-4a75-77adeab6bbe8	8294	Boštanj
00050000-5656-fe8e-e44c-511f27148cbf	5230	Bovec
00050000-5656-fe8e-2a12-8eb6f757db1f	5295	Branik
00050000-5656-fe8e-6d47-f6ecfd702ab5	3314	Braslovče
00050000-5656-fe8e-f8c2-8b27e49b5ddf	5223	Breginj
00050000-5656-fe8e-9686-db3ef4fa9cb0	8280	Brestanica
00050000-5656-fe8e-eb85-4a3abd33c7d2	2354	Bresternica
00050000-5656-fe8e-908b-f7dfe13609a9	4243	Brezje
00050000-5656-fe8e-f0b1-5e79f62eb561	1351	Brezovica pri Ljubljani
00050000-5656-fe8e-a982-ee4fbe321d96	8250	Brežice
00050000-5656-fe8e-5b25-75f85a54dca7	4210	Brnik - Aerodrom
00050000-5656-fe8e-c3eb-5be6e3d7c605	8321	Brusnice
00050000-5656-fe8e-1348-75c16c06065a	3255	Buče
00050000-5656-fe8e-1627-5a2b84fcb0bd	8276	Bučka 
00050000-5656-fe8e-feab-5ca1f528f774	9261	Cankova
00050000-5656-fe8e-9bfb-fc71553950e7	3000	Celje 
00050000-5656-fe8e-5910-ff12949756cb	3001	Celje - poštni predali
00050000-5656-fe8e-d8ca-8419018072d4	4207	Cerklje na Gorenjskem
00050000-5656-fe8e-b798-037aa2b6a6e3	8263	Cerklje ob Krki
00050000-5656-fe8e-0668-2914daf270e8	1380	Cerknica
00050000-5656-fe8e-45a0-c8c4292f90db	5282	Cerkno
00050000-5656-fe8e-e689-42df633c07fe	2236	Cerkvenjak
00050000-5656-fe8e-cbcc-9c83bc488787	2215	Ceršak
00050000-5656-fe8e-a584-a4772a7bb4db	2326	Cirkovce
00050000-5656-fe8e-d004-08fd1d3d77e6	2282	Cirkulane
00050000-5656-fe8e-549d-e7461b983a96	5273	Col
00050000-5656-fe8e-e90a-eab0ef57898f	8251	Čatež ob Savi
00050000-5656-fe8e-f69f-e2379df62b3e	1413	Čemšenik
00050000-5656-fe8e-a441-1a3732eebe34	5253	Čepovan
00050000-5656-fe8e-f755-e4c32b9d5e1e	9232	Črenšovci
00050000-5656-fe8e-1a75-7266337187d4	2393	Črna na Koroškem
00050000-5656-fe8e-399b-47e711edd1c3	6275	Črni Kal
00050000-5656-fe8e-9e06-2174825275e8	5274	Črni Vrh nad Idrijo
00050000-5656-fe8e-68c9-1ea1ae5f3bd2	5262	Črniče
00050000-5656-fe8e-9005-572385917141	8340	Črnomelj
00050000-5656-fe8e-253f-6e99b222fbc0	6271	Dekani
00050000-5656-fe8e-7a8c-31f3d1943bde	5210	Deskle
00050000-5656-fe8e-8fcc-348559bea947	2253	Destrnik
00050000-5656-fe8e-1011-e39529c20f17	6215	Divača
00050000-5656-fe8e-1a91-db4b09090c80	1233	Dob
00050000-5656-fe8e-a509-de3766dad835	3224	Dobje pri Planini
00050000-5656-fe8e-8fc1-7806511d6fb3	8257	Dobova
00050000-5656-fe8e-876b-77da9873d869	1423	Dobovec
00050000-5656-fe8e-d9bd-15288472b8b5	5263	Dobravlje
00050000-5656-fe8e-08b5-04f8d8d0a658	3204	Dobrna
00050000-5656-fe8e-4eb1-74ea554dd00b	8211	Dobrnič
00050000-5656-fe8e-44ed-7469aa8bf1b4	1356	Dobrova
00050000-5656-fe8e-792b-c5e3092944c5	9223	Dobrovnik/Dobronak 
00050000-5656-fe8e-45cc-fdcdacedfe94	5212	Dobrovo v Brdih
00050000-5656-fe8e-d591-574cabeb3d40	1431	Dol pri Hrastniku
00050000-5656-fe8e-561e-a61b4b7f3c35	1262	Dol pri Ljubljani
00050000-5656-fe8e-2be3-f709f31efacd	1273	Dole pri Litiji
00050000-5656-fe8e-5bc7-6316ab268f82	1331	Dolenja vas
00050000-5656-fe8e-ea1d-ff36e3007b18	8350	Dolenjske Toplice
00050000-5656-fe8e-94c5-7882d767b0ed	1230	Domžale
00050000-5656-fe8e-f555-3c82f73d7523	2252	Dornava
00050000-5656-fe8e-fea0-2dbe3c173723	5294	Dornberk
00050000-5656-fe8e-041f-8a57bc7ba5dc	1319	Draga
00050000-5656-fe8e-73b0-055fcd208d09	8343	Dragatuš
00050000-5656-fe8e-071b-eb32a689d37e	3222	Dramlje
00050000-5656-fe8e-2106-82182abfd8e7	2370	Dravograd
00050000-5656-fe8e-5889-9d20ac8ed20d	4203	Duplje
00050000-5656-fe8e-5758-9ebc4d647d97	6221	Dutovlje
00050000-5656-fe8e-5d8b-5e23241f93aa	8361	Dvor
00050000-5656-fe8e-10ec-9c19bad3237e	2343	Fala
00050000-5656-fe8e-cf43-f4a8fc839c21	9208	Fokovci
00050000-5656-fe8e-4659-8cbe9923769f	2313	Fram
00050000-5656-fe8e-33b1-22a40fc8899e	3213	Frankolovo
00050000-5656-fe8e-8859-5d25eb0518df	1274	Gabrovka
00050000-5656-fe8e-aa49-c4e88f7e6b51	8254	Globoko
00050000-5656-fe8e-11dc-bea50132e1ad	5275	Godovič
00050000-5656-fe8e-a0fb-900821fe5569	4204	Golnik
00050000-5656-fe8e-f8dd-afe29b938e92	3303	Gomilsko
00050000-5656-fe8e-85c2-5090864706e1	4224	Gorenja vas
00050000-5656-fe8e-23c9-e993c06ee767	3263	Gorica pri Slivnici
00050000-5656-fe8e-58d5-75f02113a0eb	2272	Gorišnica
00050000-5656-fe8e-2c51-16e98422201a	9250	Gornja Radgona
00050000-5656-fe8e-8c92-9d29bf58ae08	3342	Gornji Grad
00050000-5656-fe8e-dd77-afbd81505594	4282	Gozd Martuljek
00050000-5656-fe8e-f42a-5ac5ada0ba09	6272	Gračišče
00050000-5656-fe8e-76f3-84739cc2592b	9264	Grad
00050000-5656-fe8e-5a37-fdcafbbf53fe	8332	Gradac
00050000-5656-fe8e-59f3-f4f65b75736b	1384	Grahovo
00050000-5656-fe8e-e820-aab520051bf1	5242	Grahovo ob Bači
00050000-5656-fe8e-3090-0e2638f25f23	5251	Grgar
00050000-5656-fe8e-8e06-20ea91e7adf7	3302	Griže
00050000-5656-fe8e-065b-125053acb4d9	3231	Grobelno
00050000-5656-fe8e-da0b-93b4cd063147	1290	Grosuplje
00050000-5656-fe8e-083f-644be49eac61	2288	Hajdina
00050000-5656-fe8e-3bdd-cc496e25c0ed	8362	Hinje
00050000-5656-fe8e-ba49-b19231bcaae1	2311	Hoče
00050000-5656-fe8e-ed80-018c028a4b2c	9205	Hodoš/Hodos
00050000-5656-fe8e-2174-61062caee62d	1354	Horjul
00050000-5656-fe8e-d191-86d538d07161	1372	Hotedršica
00050000-5656-fe8e-d34c-5d3e12b78ce4	1430	Hrastnik
00050000-5656-fe8e-fec1-293f5e8bd6c7	6225	Hruševje
00050000-5656-fe8e-f15d-cb37156ecab1	4276	Hrušica
00050000-5656-fe8e-58c4-7ed7badf7670	5280	Idrija
00050000-5656-fe8e-a0a5-efb3386e819f	1292	Ig
00050000-5656-fe8e-0fbd-b629aed54502	6250	Ilirska Bistrica
00050000-5656-fe8e-8c68-510e1c456f1f	6251	Ilirska Bistrica-Trnovo
00050000-5656-fe8e-4641-29be3892934b	1295	Ivančna Gorica
00050000-5656-fe8e-a26f-9e336f1aa6b9	2259	Ivanjkovci
00050000-5656-fe8e-b193-ac6f4247e202	1411	Izlake
00050000-5656-fe8e-9683-908d4af0a409	6310	Izola/Isola
00050000-5656-fe8e-f659-4040ce9b8d7b	2222	Jakobski Dol
00050000-5656-fe8e-f62e-d92f0d463d1c	2221	Jarenina
00050000-5656-fe8e-e72a-b1f8225f5546	6254	Jelšane
00050000-5656-fe8e-3d45-8a6fa90d1696	4270	Jesenice
00050000-5656-fe8e-9f6d-75ee564c1679	8261	Jesenice na Dolenjskem
00050000-5656-fe8e-81d2-54dd74467f71	3273	Jurklošter
00050000-5656-fe8e-d403-5d51ccc3cbfe	2223	Jurovski Dol
00050000-5656-fe8e-bdbd-7f65cf3bbad6	2256	Juršinci
00050000-5656-fe8e-81a5-8d2d990eaaae	5214	Kal nad Kanalom
00050000-5656-fe8e-c45c-d1f100431c15	3233	Kalobje
00050000-5656-fe8e-f2d1-b13da9114d89	4246	Kamna Gorica
00050000-5656-fe8e-1920-a882f35609a9	2351	Kamnica
00050000-5656-fe8e-90bc-dd3ebaab536d	1241	Kamnik
00050000-5656-fe8e-8613-4946ba9d50fa	5213	Kanal
00050000-5656-fe8e-4bd3-d024388a56c0	8258	Kapele
00050000-5656-fe8e-1364-b5313435a14f	2362	Kapla
00050000-5656-fe8e-3039-684a186814ce	2325	Kidričevo
00050000-5656-fe8e-444e-612eaec7c5b9	1412	Kisovec
00050000-5656-fe8e-bcb8-e43ec2e2055f	6253	Knežak
00050000-5656-fe8e-70f8-e974b92510ab	5222	Kobarid
00050000-5656-fe8e-936f-e87c9496a133	9227	Kobilje
00050000-5656-fe8e-1171-78a5a212c038	1330	Kočevje
00050000-5656-fe8e-c8ea-a681b836e59e	1338	Kočevska Reka
00050000-5656-fe8e-9758-37db34beb175	2276	Kog
00050000-5656-fe8e-ad65-1672383eef45	5211	Kojsko
00050000-5656-fe8e-7232-1574705983cb	6223	Komen
00050000-5656-fe8e-78e5-e332719169f3	1218	Komenda
00050000-5656-fe8e-0ebf-cd097c19ed7d	6000	Koper/Capodistria 
00050000-5656-fe8e-6b09-fed5399fc9d2	6001	Koper/Capodistria - poštni predali
00050000-5656-fe8e-5e02-cc15d6e6c3eb	8282	Koprivnica
00050000-5656-fe8e-800a-bed7eaab7658	5296	Kostanjevica na Krasu
00050000-5656-fe8e-ab6f-91bc9ece1efb	8311	Kostanjevica na Krki
00050000-5656-fe8e-d3d4-eee92a2e3fa3	1336	Kostel
00050000-5656-fe8e-34b0-1480c7dfcb6a	6256	Košana
00050000-5656-fe8e-c987-eba8b314b2bb	2394	Kotlje
00050000-5656-fe8e-6b70-e664040f70ed	6240	Kozina
00050000-5656-fe8e-a2cc-52e7412c7ec0	3260	Kozje
00050000-5656-fe8e-9d00-a9f275172f8e	4000	Kranj 
00050000-5656-fe8e-b343-21c1bc76d5ad	4001	Kranj - poštni predali
00050000-5656-fe8e-43ae-96efeba1a434	4280	Kranjska Gora
00050000-5656-fe8e-3038-40bdfb9922a3	1281	Kresnice
00050000-5656-fe8e-df1b-57d1749a5c6f	4294	Križe
00050000-5656-fe8e-1f76-277c3c1428d8	9206	Križevci
00050000-5656-fe8e-1bc4-bfe2b862238e	9242	Križevci pri Ljutomeru
00050000-5656-fe8e-0dd5-b2632b8c952b	1301	Krka
00050000-5656-fe8e-9539-a75e63d638ce	8296	Krmelj
00050000-5656-fe8e-5218-6097d1b1c3ab	4245	Kropa
00050000-5656-fe8e-81b1-eb270a905074	8262	Krška vas
00050000-5656-fe8e-e734-636f53a0e6fc	8270	Krško
00050000-5656-fe8e-c8cf-e4887bcfa2ff	9263	Kuzma
00050000-5656-fe8e-3081-ef2b42259fbc	2318	Laporje
00050000-5656-fe8e-cc47-b237182977e7	3270	Laško
00050000-5656-fe8e-80c7-018d5181c4d4	1219	Laze v Tuhinju
00050000-5656-fe8e-b7f6-1222ddafbafd	2230	Lenart v Slovenskih goricah
00050000-5656-fe8e-fa28-2145f99099b5	9220	Lendava/Lendva
00050000-5656-fe8e-a733-fb87500d789b	4248	Lesce
00050000-5656-fe8e-fc43-9850432e61a1	3261	Lesično
00050000-5656-fe8e-bd05-a8ddcc3b4383	8273	Leskovec pri Krškem
00050000-5656-fe8e-af1a-0ba10a8aeecd	2372	Libeliče
00050000-5656-fe8e-9b89-c1d80c612035	2341	Limbuš
00050000-5656-fe8e-595c-c0f197180b14	1270	Litija
00050000-5656-fe8e-438b-eb325c125803	3202	Ljubečna
00050000-5656-fe8e-8467-3646438ae2e3	1000	Ljubljana 
00050000-5656-fe8e-0615-7a24706e321a	1001	Ljubljana - poštni predali
00050000-5656-fe8e-f868-7df8d121dd3c	1231	Ljubljana - Črnuče
00050000-5656-fe8e-2dcf-1e61be74312e	1261	Ljubljana - Dobrunje
00050000-5656-fe8e-5753-6c9027412510	1260	Ljubljana - Polje
00050000-5656-fe8e-581c-8b50e96cb83d	1210	Ljubljana - Šentvid
00050000-5656-fe8e-899a-2c2464b10dac	1211	Ljubljana - Šmartno
00050000-5656-fe8e-9505-7dac0607c864	3333	Ljubno ob Savinji
00050000-5656-fe8e-70c6-dbf409bbfd93	9240	Ljutomer
00050000-5656-fe8e-e25b-280188679e91	3215	Loče
00050000-5656-fe8e-0148-745448e3b1de	5231	Log pod Mangartom
00050000-5656-fe8e-168d-dd749f48eaee	1358	Log pri Brezovici
00050000-5656-fe8e-a69e-6e4f21ef7e6b	1370	Logatec
00050000-5656-fe8e-f679-3c73637b2b0c	1371	Logatec
00050000-5656-fe8e-0f31-10f35ec51543	1434	Loka pri Zidanem Mostu
00050000-5656-fe8e-4bc2-69d76dc87dbb	3223	Loka pri Žusmu
00050000-5656-fe8e-894c-d714b519a0d9	6219	Lokev
00050000-5656-fe8e-2545-cd033b7eeb04	1318	Loški Potok
00050000-5656-fe8e-8923-10302a261e2e	2324	Lovrenc na Dravskem polju
00050000-5656-fe8e-d5ed-b136c9ac3ed4	2344	Lovrenc na Pohorju
00050000-5656-fe8e-f13d-94222f718f56	3334	Luče
00050000-5656-fe8e-0ce9-73a17dafef5d	1225	Lukovica
00050000-5656-fe8e-e31c-085a741bcc22	9202	Mačkovci
00050000-5656-fe8e-6051-ca138945f3e2	2322	Majšperk
00050000-5656-fe8e-64a9-ad5881f4a35a	2321	Makole
00050000-5656-fe8e-190d-c10070459b2c	9243	Mala Nedelja
00050000-5656-fe8e-3306-cc9f89601739	2229	Malečnik
00050000-5656-fe8e-a019-ca0c1b62fa81	6273	Marezige
00050000-5656-fe8e-2173-f583198720b8	2000	Maribor 
00050000-5656-fe8e-c742-1bfb55cb0971	2001	Maribor - poštni predali
00050000-5656-fe8e-5a01-809364d027e8	2206	Marjeta na Dravskem polju
00050000-5656-fe8e-47a5-f7092869592f	2281	Markovci
00050000-5656-fe8e-8be4-77ff72a0471a	9221	Martjanci
00050000-5656-fe8e-3db2-c1cf76cbb5a9	6242	Materija
00050000-5656-fe8e-8c65-bcecfc5ec8d1	4211	Mavčiče
00050000-5656-fe8e-d5a1-128355c46f08	1215	Medvode
00050000-5656-fe8e-680a-7f365d2bd70e	1234	Mengeš
00050000-5656-fe8e-2d62-9e2121c0f301	8330	Metlika
00050000-5656-fe8e-303b-f4d2fd273b44	2392	Mežica
00050000-5656-fe8e-3a4d-31ebdc9d4bd4	2204	Miklavž na Dravskem polju
00050000-5656-fe8e-3181-22790ae2f95f	2275	Miklavž pri Ormožu
00050000-5656-fe8e-4f20-473ca947ae42	5291	Miren
00050000-5656-fe8e-f1bb-432bcfe154f9	8233	Mirna
00050000-5656-fe8e-df3b-4dfda6b7445a	8216	Mirna Peč
00050000-5656-fe8e-135f-3555cf0e99e0	2382	Mislinja
00050000-5656-fe8e-1dbf-39ae60d7377f	4281	Mojstrana
00050000-5656-fe8e-da10-7f9398024404	8230	Mokronog
00050000-5656-fe8e-ac5b-97835ee8acee	1251	Moravče
00050000-5656-fe8e-df71-e2b5868adfd7	9226	Moravske Toplice
00050000-5656-fe8e-6031-9cfbfcfceec6	5216	Most na Soči
00050000-5656-fe8e-bdc2-75ab19f84557	1221	Motnik
00050000-5656-fe8e-9eef-2316542cbfcc	3330	Mozirje
00050000-5656-fe8e-0445-fb641c8b9394	9000	Murska Sobota 
00050000-5656-fe8e-1f98-96ff73f1185e	9001	Murska Sobota - poštni predali
00050000-5656-fe8e-b1b1-1bddff7735e7	2366	Muta
00050000-5656-fe8e-eb9c-0382870b01d8	4202	Naklo
00050000-5656-fe8e-569e-42e7fc61b496	3331	Nazarje
00050000-5656-fe8e-222c-3401ceeaf9c1	1357	Notranje Gorice
00050000-5656-fe8e-bd3d-1f3210a48bee	3203	Nova Cerkev
00050000-5656-fe8e-98ed-803d42b7a81b	5000	Nova Gorica 
00050000-5656-fe8e-30ca-34efd0391684	5001	Nova Gorica - poštni predali
00050000-5656-fe8e-3135-364ba381fb5f	1385	Nova vas
00050000-5656-fe8e-42dd-0c71e06a6fa0	8000	Novo mesto
00050000-5656-fe8e-2342-04d00441da31	8001	Novo mesto - poštni predali
00050000-5656-fe8e-d038-fb77773e0836	6243	Obrov
00050000-5656-fe8e-929d-bb3e01c6b459	9233	Odranci
00050000-5656-fe8e-2511-903e9d8a7500	2317	Oplotnica
00050000-5656-fe8e-c168-c8d45917a190	2312	Orehova vas
00050000-5656-fe8e-5eb9-47e629aeaa4a	2270	Ormož
00050000-5656-fe8e-818d-a3e88ed9845c	1316	Ortnek
00050000-5656-fe8e-8b21-17f9f66f2bf4	1337	Osilnica
00050000-5656-fe8e-f1b1-2f689cbcba29	8222	Otočec
00050000-5656-fe8e-583d-b7f0079f3323	2361	Ožbalt
00050000-5656-fe8e-e1ac-473b7ea91aaa	2231	Pernica
00050000-5656-fe8e-6e9a-53ff88d1c408	2211	Pesnica pri Mariboru
00050000-5656-fe8e-527f-a0fb07084293	9203	Petrovci
00050000-5656-fe8e-9960-a1309c86cdd3	3301	Petrovče
00050000-5656-fe8e-4038-baf36881da0a	6330	Piran/Pirano
00050000-5656-fe8e-579c-86d4d2276126	8255	Pišece
00050000-5656-fe8e-453b-3c85cd25131f	6257	Pivka
00050000-5656-fe8e-0910-36059b054eca	6232	Planina
00050000-5656-fe8e-89ca-e9534587bcde	3225	Planina pri Sevnici
00050000-5656-fe8e-6486-68d2110f97d7	6276	Pobegi
00050000-5656-fe8e-da7d-601f64e8ff65	8312	Podbočje
00050000-5656-fe8e-a95b-023f6292d43f	5243	Podbrdo
00050000-5656-fe8e-e64f-42096c3240e7	3254	Podčetrtek
00050000-5656-fe8e-7246-d342f921d406	2273	Podgorci
00050000-5656-fe8e-dde3-46ac4b066c74	6216	Podgorje
00050000-5656-fe8e-e3a6-572c21e11d09	2381	Podgorje pri Slovenj Gradcu
00050000-5656-fe8e-5c60-6a66b96a35fe	6244	Podgrad
00050000-5656-fe8e-1406-70f69f79d57a	1414	Podkum
00050000-5656-fe8e-8bfa-6f45abe50014	2286	Podlehnik
00050000-5656-fe8e-9bde-a3dbd3adc324	5272	Podnanos
00050000-5656-fe8e-ed61-ac3b32c2710c	4244	Podnart
00050000-5656-fe8e-3868-55d2f11765b5	3241	Podplat
00050000-5656-fe8e-e4d2-d61c1e1ac6f5	3257	Podsreda
00050000-5656-fe8e-c4eb-35d9bfd85da4	2363	Podvelka
00050000-5656-fe8e-c21c-61c26646da97	2208	Pohorje
00050000-5656-fe8e-8e5a-16a56c99c835	2257	Polenšak
00050000-5656-fe8e-0b24-c103331522c6	1355	Polhov Gradec
00050000-5656-fe8e-3381-8872e168aefc	4223	Poljane nad Škofjo Loko
00050000-5656-fe8e-4acf-8bb2456e0a1b	2319	Poljčane
00050000-5656-fe8e-c461-a93f5eacd2de	1272	Polšnik
00050000-5656-fe8e-31be-6ebf86c84c6d	3313	Polzela
00050000-5656-fe8e-e404-c49b50526e7b	3232	Ponikva
00050000-5656-fe8e-5deb-527e49e7b7ab	6320	Portorož/Portorose
00050000-5656-fe8e-104e-a2de3c0ca576	6230	Postojna
00050000-5656-fe8e-749a-d42b5fca0537	2331	Pragersko
00050000-5656-fe8e-0d72-deac769ed27b	3312	Prebold
00050000-5656-fe8e-41bc-9dc3fc266152	4205	Preddvor
00050000-5656-fe8e-054a-f14fa6ab6634	6255	Prem
00050000-5656-fe8e-d398-6f8997f9d992	1352	Preserje
00050000-5656-fe8e-4ab6-e26bc1b51d50	6258	Prestranek
00050000-5656-fe8e-fd59-b0281bb56304	2391	Prevalje
00050000-5656-fe8e-f149-8675f504d07a	3262	Prevorje
00050000-5656-fe8e-4b24-e51a4ca4d698	1276	Primskovo 
00050000-5656-fe8e-c83f-8126f3aeeb6e	3253	Pristava pri Mestinju
00050000-5656-fe8e-8e31-e74e395bec0b	9207	Prosenjakovci/Partosfalva
00050000-5656-fe8e-dd33-859b53fa74d8	5297	Prvačina
00050000-5656-fe8e-485a-f2074c13bba8	2250	Ptuj
00050000-5656-fe8e-bf4f-7195ff7a4229	2323	Ptujska Gora
00050000-5656-fe8e-a2e2-aa8114e137fe	9201	Puconci
00050000-5656-fe8e-d4d6-f7ac4c7a3b77	2327	Rače
00050000-5656-fe8e-caa8-99a9d9bbe2c1	1433	Radeče
00050000-5656-fe8e-f1fb-9eb762087306	9252	Radenci
00050000-5656-fe8e-c0df-e056bba97864	2360	Radlje ob Dravi
00050000-5656-fe8e-5a5a-0d81ace78202	1235	Radomlje
00050000-5656-fe8e-1b3c-493ef4d01082	4240	Radovljica
00050000-5656-fe8e-dbc7-2d0cd28cfef7	8274	Raka
00050000-5656-fe8e-a071-2f4c56634320	1381	Rakek
00050000-5656-fe8e-e215-2b8f66eb36c8	4283	Rateče - Planica
00050000-5656-fe8e-f673-cca8c7ec6dbf	2390	Ravne na Koroškem
00050000-5656-fe8e-7feb-30f5c14f9cc6	9246	Razkrižje
00050000-5656-fe8e-dc64-f9cb93ad01db	3332	Rečica ob Savinji
00050000-5656-fe8e-dd09-7307e98c6e57	5292	Renče
00050000-5656-fe8e-217f-f30819f360cc	1310	Ribnica
00050000-5656-fe8e-308f-9212c6ecd3d5	2364	Ribnica na Pohorju
00050000-5656-fe8e-28f2-5d329941c5f5	3272	Rimske Toplice
00050000-5656-fe8e-c67a-264fc160cf8b	1314	Rob
00050000-5656-fe8e-2503-bb9f7df4c4a6	5215	Ročinj
00050000-5656-fe8e-01f5-cb29670b7fbb	3250	Rogaška Slatina
00050000-5656-fe8e-1b4e-80a488bb1305	9262	Rogašovci
00050000-5656-fe8e-1291-9fe174371a27	3252	Rogatec
00050000-5656-fe8e-e690-6d7ba8d33714	1373	Rovte
00050000-5656-fe8e-1f33-c1b8a1670452	2342	Ruše
00050000-5656-fe8e-e0e8-1a169eb826f4	1282	Sava
00050000-5656-fe8e-a17e-faa2ece17cf3	6333	Sečovlje/Sicciole
00050000-5656-fe8e-5334-6df3efbaac1b	4227	Selca
00050000-5656-fe8e-de60-0694249717e6	2352	Selnica ob Dravi
00050000-5656-fe8e-a5d0-969c07994565	8333	Semič
00050000-5656-fe8e-132b-59d01f901c6b	8281	Senovo
00050000-5656-fe8e-e114-224422592bd3	6224	Senožeče
00050000-5656-fe8e-740b-e1331bb25309	8290	Sevnica
00050000-5656-fe8e-e752-5d69fb6c8ebf	6210	Sežana
00050000-5656-fe8e-3cd7-d93d4d24d409	2214	Sladki Vrh
00050000-5656-fe8e-4c4f-65bf701a8dff	5283	Slap ob Idrijci
00050000-5656-fe8e-cb1d-b90f02403b8a	2380	Slovenj Gradec
00050000-5656-fe8e-76e8-4eeebda0051d	2310	Slovenska Bistrica
00050000-5656-fe8e-1b4c-93821bc89a21	3210	Slovenske Konjice
00050000-5656-fe8e-c9f7-1a1b15ef4e0e	1216	Smlednik
00050000-5656-fe8e-5033-558e6e772496	5232	Soča
00050000-5656-fe8e-d71e-1da1eb124ea9	1317	Sodražica
00050000-5656-fe8e-12ec-0d6fead2c9fd	3335	Solčava
00050000-5656-fe8e-9793-37c10c03494e	5250	Solkan
00050000-5656-fe8e-9f96-ba111392ee6b	4229	Sorica
00050000-5656-fe8e-7516-b9027da65c28	4225	Sovodenj
00050000-5656-fe8e-5128-5457ff138a8c	5281	Spodnja Idrija
00050000-5656-fe8e-02e5-200b126a62f7	2241	Spodnji Duplek
00050000-5656-fe8e-f25a-8a407f7751c7	9245	Spodnji Ivanjci
00050000-5656-fe8e-ad90-fb323badbc69	2277	Središče ob Dravi
00050000-5656-fe8e-4435-f7a302d15fad	4267	Srednja vas v Bohinju
00050000-5656-fe8e-4b54-2a441131f1da	8256	Sromlje 
00050000-5656-fe8e-d668-1cd5abbc1d87	5224	Srpenica
00050000-5656-fe8e-50e9-611b04331370	1242	Stahovica
00050000-5656-fe8e-864b-7ef5b9679da6	1332	Stara Cerkev
00050000-5656-fe8e-63ff-5042e60c2976	8342	Stari trg ob Kolpi
00050000-5656-fe8e-3dd3-af69a02a987c	1386	Stari trg pri Ložu
00050000-5656-fe8e-fcd0-51f11f309f91	2205	Starše
00050000-5656-fe8e-1ffc-9fc9ceca3766	2289	Stoperce
00050000-5656-fe8e-df3b-c1c9a3cb9fb3	8322	Stopiče
00050000-5656-fe8e-74a8-d801f45156ba	3206	Stranice
00050000-5656-fe8e-b5af-bf34283f48cc	8351	Straža
00050000-5656-fe8e-7e2b-0efbc0635593	1313	Struge
00050000-5656-fe8e-ce8e-3fcd71fd9e4b	8293	Studenec
00050000-5656-fe8e-eab7-058de8bb2c4c	8331	Suhor
00050000-5656-fe8e-ff4b-c011130d722a	2233	Sv. Ana v Slovenskih goricah
00050000-5656-fe8e-e5d7-7b0c0ad1456d	2235	Sv. Trojica v Slovenskih goricah
00050000-5656-fe8e-ed65-db6e662b161e	2353	Sveti Duh na Ostrem Vrhu
00050000-5656-fe8e-5fd5-0f826c84e615	9244	Sveti Jurij ob Ščavnici
00050000-5656-fe8e-e3e8-31ab3b2ec32f	3264	Sveti Štefan
00050000-5656-fe8e-8b85-76cd586b7770	2258	Sveti Tomaž
00050000-5656-fe8e-b527-8fbb96ab57dc	9204	Šalovci
00050000-5656-fe8e-4643-cd91696829fb	5261	Šempas
00050000-5656-fe8e-ce55-b68dcb120c36	5290	Šempeter pri Gorici
00050000-5656-fe8e-b859-cdd2fb8fdee5	3311	Šempeter v Savinjski dolini
00050000-5656-fe8e-5500-ace4e79427d8	4208	Šenčur
00050000-5656-fe8e-a5bd-69dc9d7bc18b	2212	Šentilj v Slovenskih goricah
00050000-5656-fe8e-7bee-1d294aa77a5b	8297	Šentjanž
00050000-5656-fe8e-c6aa-c20a542c47b3	2373	Šentjanž pri Dravogradu
00050000-5656-fe8e-7427-7ba8c6d76790	8310	Šentjernej
00050000-5656-fe8e-ad7b-d33ffe155be5	3230	Šentjur
00050000-5656-fe8e-724f-e7ffc9369c77	3271	Šentrupert
00050000-5656-fe8e-55f0-240bfc7eed24	8232	Šentrupert
00050000-5656-fe8e-ee8f-3410ac7d9cde	1296	Šentvid pri Stični
00050000-5656-fe8e-175d-f574cecee35a	8275	Škocjan
00050000-5656-fe8e-428c-0ec4cbb54f49	6281	Škofije
00050000-5656-fe8e-14b6-e4c72821b9df	4220	Škofja Loka
00050000-5656-fe8e-3f12-0f0102519ee1	3211	Škofja vas
00050000-5656-fe8e-40c0-f6d00ac85a66	1291	Škofljica
00050000-5656-fe8e-a1d9-0025ec796f38	6274	Šmarje
00050000-5656-fe8e-0969-de89f67d3e95	1293	Šmarje - Sap
00050000-5656-fe8e-6e30-557dde4b6334	3240	Šmarje pri Jelšah
00050000-5656-fe8e-53a0-65e5e675bed0	8220	Šmarješke Toplice
00050000-5656-fe8e-4fbc-8d343b8920a3	2315	Šmartno na Pohorju
00050000-5656-fe8e-2e13-79884c883fcb	3341	Šmartno ob Dreti
00050000-5656-fe8e-a024-31b742fc40c8	3327	Šmartno ob Paki
00050000-5656-fe8e-510f-0d6fa1c2129b	1275	Šmartno pri Litiji
00050000-5656-fe8e-5284-011c1d15a75f	2383	Šmartno pri Slovenj Gradcu
00050000-5656-fe8e-7499-202b968a0701	3201	Šmartno v Rožni dolini
00050000-5656-fe8e-00ba-79af4df576a6	3325	Šoštanj
00050000-5656-fe8e-b2c9-9c5cef12ae7a	6222	Štanjel
00050000-5656-fe8e-17b2-7346b248a84e	3220	Štore
00050000-5656-fe8e-ac13-6023ecc2283c	3304	Tabor
00050000-5656-fe8e-013c-3ceb6882b423	3221	Teharje
00050000-5656-fe8e-c84d-7586cdb3dc80	9251	Tišina
00050000-5656-fe8e-5118-74e45bd0ac06	5220	Tolmin
00050000-5656-fe8e-06ee-be502c546f0e	3326	Topolšica
00050000-5656-fe8e-2205-4d8a359a14c7	2371	Trbonje
00050000-5656-fe8e-913e-ab83366d5a27	1420	Trbovlje
00050000-5656-fe8e-9ab8-9dc9964bae6a	8231	Trebelno 
00050000-5656-fe8e-1f93-35494ed93e12	8210	Trebnje
00050000-5656-fe8e-0bd7-fb1ce324f65b	5252	Trnovo pri Gorici
00050000-5656-fe8e-f336-b4028e511413	2254	Trnovska vas
00050000-5656-fe8e-2a08-f5e0d04732f7	1222	Trojane
00050000-5656-fe8e-1416-89b767d6a6a3	1236	Trzin
00050000-5656-fe8e-cc8a-8e312c357686	4290	Tržič
00050000-5656-fe8e-c766-63652c1733e7	8295	Tržišče
00050000-5656-fe8e-fe6d-e92acbe2ea17	1311	Turjak
00050000-5656-fe8e-ad62-bd0675d61e2c	9224	Turnišče
00050000-5656-fe8e-3ccc-313334f6af19	8323	Uršna sela
00050000-5656-fe8e-cf00-3ff875d4a4e9	1252	Vače
00050000-5656-fe8e-9d84-8ab50a8acf55	3320	Velenje 
00050000-5656-fe8e-97db-837bfdbb3eb2	3322	Velenje - poštni predali
00050000-5656-fe8e-8acb-3ddd98225a71	8212	Velika Loka
00050000-5656-fe8e-d613-e898b3b5f4b6	2274	Velika Nedelja
00050000-5656-fe8e-0d57-ff45a17fdd59	9225	Velika Polana
00050000-5656-fe8e-22b7-598c0686db49	1315	Velike Lašče
00050000-5656-fe8e-1f85-64e09a9daa62	8213	Veliki Gaber
00050000-5656-fe8e-92f1-7b0a7bcd43c2	9241	Veržej
00050000-5656-fe8e-fbd8-e94e4b046254	1312	Videm - Dobrepolje
00050000-5656-fe8e-526a-4ca6c75fb8fd	2284	Videm pri Ptuju
00050000-5656-fe8e-1ce3-b204be3ca31c	8344	Vinica
00050000-5656-fe8e-d57a-655643144b58	5271	Vipava
00050000-5656-fe8e-dca9-e74b12d74662	4212	Visoko
00050000-5656-fe8e-730a-93cc36958b5a	1294	Višnja Gora
00050000-5656-fe8e-cb88-27f96e665517	3205	Vitanje
00050000-5656-fe8e-4e6b-935b82aff213	2255	Vitomarci
00050000-5656-fe8e-1189-883edc7f0ea7	1217	Vodice
00050000-5656-fe8e-26a7-7581cb5b3525	3212	Vojnik\t
00050000-5656-fe8e-6561-68425ef75e3e	5293	Volčja Draga
00050000-5656-fe8e-46c5-33a96948ec6a	2232	Voličina
00050000-5656-fe8e-18c2-3ddbffc54534	3305	Vransko
00050000-5656-fe8e-bd92-30a26960e03d	6217	Vremski Britof
00050000-5656-fe8e-2c5f-11a46d5b4641	1360	Vrhnika
00050000-5656-fe8e-e235-53fa8259f900	2365	Vuhred
00050000-5656-fe8e-2df6-8a8183981d5f	2367	Vuzenica
00050000-5656-fe8e-dbbe-4641e0308d51	8292	Zabukovje 
00050000-5656-fe8e-376c-63e1b3d0d693	1410	Zagorje ob Savi
00050000-5656-fe8e-ef02-a5a024c28cfc	1303	Zagradec
00050000-5656-fe8e-9627-4a1a82ed10a2	2283	Zavrč
00050000-5656-fe8e-f0a2-e0a7f5ec4fdd	8272	Zdole 
00050000-5656-fe8e-b680-1a223794ca0d	4201	Zgornja Besnica
00050000-5656-fe8e-1184-a726222b4778	2242	Zgornja Korena
00050000-5656-fe8e-dc28-338a624d9a3b	2201	Zgornja Kungota
00050000-5656-fe8e-07d4-aab900400232	2316	Zgornja Ložnica
00050000-5656-fe8e-abcf-b79e684d8668	2314	Zgornja Polskava
00050000-5656-fe8e-b90b-bde4155c8c5a	2213	Zgornja Velka
00050000-5656-fe8e-a7c6-9a5fc0b7090b	4247	Zgornje Gorje
00050000-5656-fe8e-90ef-e45853b2371c	4206	Zgornje Jezersko
00050000-5656-fe8e-c860-e5bcc8d79830	2285	Zgornji Leskovec
00050000-5656-fe8e-5636-8c3de27733ad	1432	Zidani Most
00050000-5656-fe8e-b247-02b924fe5edc	3214	Zreče
00050000-5656-fe8e-5e63-467186f7d9d6	4209	Žabnica
00050000-5656-fe8e-67b6-cc0074b38d0a	3310	Žalec
00050000-5656-fe8e-76a6-7b53cf8f53ad	4228	Železniki
00050000-5656-fe8e-6778-bed4a8e90747	2287	Žetale
00050000-5656-fe8e-8d5f-b2e8fb3e38df	4226	Žiri
00050000-5656-fe8e-bb3d-d2025294d0bc	4274	Žirovnica
00050000-5656-fe8e-6b11-f2dc953199f1	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29626121)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29625697)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29625445)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5656-fe91-9b6b-3576003c6f03	00080000-5656-fe91-fc42-7cdcd86ca07a	\N	00040000-5656-fe8f-f492-422f18a96187	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5656-fe91-6a04-326c4fd4bba5	00080000-5656-fe91-fc42-7cdcd86ca07a	\N	00040000-5656-fe8f-f492-422f18a96187	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5656-fe91-2774-962d1c453160	00080000-5656-fe91-fff7-413e481b5875	\N	00040000-5656-fe8f-f492-422f18a96187	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29625589)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5656-fe8f-a14f-dadd725b6af0	novo leto	1	1	\N	t
00430000-5656-fe8f-abe9-1ec4d2ef5dc6	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5656-fe8f-e960-cda6a8d34ec6	dan upora proti okupatorju	27	4	\N	t
00430000-5656-fe8f-4923-e1d879661cb1	praznik dela	1	5	\N	t
00430000-5656-fe8f-252c-7bf19314ea25	praznik dela	2	5	\N	t
00430000-5656-fe8f-19a3-0c44874667db	dan Primoža Trubarja	8	6	\N	f
00430000-5656-fe8f-5fac-b8c382be1c51	dan državnosti	25	6	\N	t
00430000-5656-fe8f-c18f-f1d86be28b92	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5656-fe8f-bb58-f9f0f57ce761	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5656-fe8f-f01b-439c56b28dfd	dan suverenosti	25	10	\N	f
00430000-5656-fe8f-7584-fd33aea33c48	dan spomina na mrtve	1	11	\N	t
00430000-5656-fe8f-c6fe-f265f7079147	dan Rudolfa Maistra	23	11	\N	f
00430000-5656-fe8f-9692-86c09a130919	božič	25	12	\N	t
00430000-5656-fe8f-581a-35fe553baa37	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5656-fe8f-2ee1-8dce34209a61	Marijino vnebovzetje	15	8	\N	t
00430000-5656-fe8f-bc16-c4f1a2f9fd10	dan reformacije	31	10	\N	t
00430000-5656-fe8f-04b1-38e3b8d4f714	velikonočna nedelja	27	3	2016	t
00430000-5656-fe8f-3e58-8176827d9001	velikonočna nedelja	16	4	2017	t
00430000-5656-fe8f-b68a-ee739e368e2d	velikonočna nedelja	1	4	2018	t
00430000-5656-fe8f-3c0f-be674d86047b	velikonočna nedelja	21	4	2019	t
00430000-5656-fe8f-99bf-1f9a452c135a	velikonočna nedelja	12	4	2020	t
00430000-5656-fe8f-8a21-3499aa958bb4	velikonočna nedelja	4	4	2021	t
00430000-5656-fe8f-9d52-211d1880eb58	velikonočna nedelja	17	4	2022	t
00430000-5656-fe8f-3940-3eaa809e9463	velikonočna nedelja	9	4	2023	t
00430000-5656-fe8f-c011-d50799f88ac9	velikonočna nedelja	31	3	2024	t
00430000-5656-fe8f-b761-5cadf278038d	velikonočna nedelja	20	4	2025	t
00430000-5656-fe8f-6eaa-787f0a97a9f6	velikonočna nedelja	5	4	2026	t
00430000-5656-fe8f-ad5a-933c1a585fc3	velikonočna nedelja	28	3	2027	t
00430000-5656-fe8f-7ea0-2aaf5e92b74c	velikonočna nedelja	16	4	2028	t
00430000-5656-fe8f-01a7-e370270823b2	velikonočna nedelja	1	4	2029	t
00430000-5656-fe8f-5299-d35c39aa0827	velikonočna nedelja	21	4	2030	t
00430000-5656-fe8f-620a-8c0208190e7f	velikonočni ponedeljek	28	3	2016	t
00430000-5656-fe8f-dbe4-d87929e444ca	velikonočni ponedeljek	17	4	2017	t
00430000-5656-fe8f-99d0-ede34d002056	velikonočni ponedeljek	2	4	2018	t
00430000-5656-fe8f-fe66-bbde1e02c41c	velikonočni ponedeljek	22	4	2019	t
00430000-5656-fe8f-cc4f-5a70e2f44f2b	velikonočni ponedeljek	13	4	2020	t
00430000-5656-fe8f-252e-f80042ab4c81	velikonočni ponedeljek	5	4	2021	t
00430000-5656-fe8f-9713-b342ae116835	velikonočni ponedeljek	18	4	2022	t
00430000-5656-fe8f-62bd-19349a43a166	velikonočni ponedeljek	10	4	2023	t
00430000-5656-fe8f-a8e8-c50065158369	velikonočni ponedeljek	1	4	2024	t
00430000-5656-fe8f-2ff9-62fee630324d	velikonočni ponedeljek	21	4	2025	t
00430000-5656-fe8f-5115-401aceb576d2	velikonočni ponedeljek	6	4	2026	t
00430000-5656-fe8f-ad2f-771259413eb9	velikonočni ponedeljek	29	3	2027	t
00430000-5656-fe8f-ecb2-485a15932a62	velikonočni ponedeljek	17	4	2028	t
00430000-5656-fe8f-5566-5b2c42a30a02	velikonočni ponedeljek	2	4	2029	t
00430000-5656-fe8f-ebe8-6301ea014f1f	velikonočni ponedeljek	22	4	2030	t
00430000-5656-fe8f-0015-2280cf3643e3	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5656-fe8f-127a-061a6f771827	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5656-fe8f-3fa1-9087c72cc226	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5656-fe8f-a884-40d94e270788	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5656-fe8f-d97f-dd8c1599b6ee	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5656-fe8f-afbe-8d2432813db1	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5656-fe8f-87a3-23df30df847d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5656-fe8f-0c3c-7b92daa7a372	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5656-fe8f-5898-58122eb5638c	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5656-fe8f-d026-c8687294e8b2	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5656-fe8f-9db2-c38916a22074	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5656-fe8f-cf9c-b02371017c4d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5656-fe8f-e49e-99d4943c9c63	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5656-fe8f-322a-c80805209e1e	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5656-fe8f-a300-e82e4829d3cb	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29625549)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29625561)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29625709)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29626135)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29626145)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5656-fe91-03d4-fb6165b9be3d	00080000-5656-fe91-a5d2-b29a27e20bde	0987	AK
00190000-5656-fe91-841e-d0dfca8fa3ac	00080000-5656-fe91-fff7-413e481b5875	0989	AK
00190000-5656-fe91-9d7e-d818a61ceaa9	00080000-5656-fe91-3bc8-bff297bb11d2	0986	AK
00190000-5656-fe91-b3e2-c21b1afd10bd	00080000-5656-fe91-7bbe-7ad55e341d7e	0984	AK
00190000-5656-fe91-95cf-cf247d4850f4	00080000-5656-fe91-19a8-320209fbbebf	0983	AK
00190000-5656-fe91-036d-94fb77fca65f	00080000-5656-fe91-b8f9-dd74fc6b398f	0982	AK
00190000-5656-fe93-4c72-e5c4d1223f76	00080000-5656-fe93-b829-2bc6f2a95157	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29626044)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5656-fe91-cfe4-be0dcbe5d768	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29626153)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29625738)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5656-fe91-7421-b8d91477f243	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5656-fe91-5fc8-7ec7c757628f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5656-fe91-4320-c4a8d175fec8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5656-fe91-fd2b-52d2b9e1bccd	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5656-fe91-4614-fadf62ab8fba	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5656-fe91-16e0-ac2976143063	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5656-fe91-4744-2a41e4ecc441	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29625682)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29625672)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29625883)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29625813)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29625523)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29625285)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5656-fe93-b829-2bc6f2a95157	00010000-5656-fe8f-9d79-9d6ccf0d5d0f	2015-11-26 13:44:03	INS	a:0:{}
2	App\\Entity\\Option	00000000-5656-fe93-2c2e-784f8447a048	00010000-5656-fe8f-9d79-9d6ccf0d5d0f	2015-11-26 13:44:03	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5656-fe93-4c72-e5c4d1223f76	00010000-5656-fe8f-9d79-9d6ccf0d5d0f	2015-11-26 13:44:03	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29625751)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29625323)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5656-fe8f-017a-c92411701f2e	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5656-fe8f-3576-8f1177cd57c3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5656-fe8f-c7a0-4cf35eaa2eef	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5656-fe8f-5485-c67414f35c36	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5656-fe8f-e51d-9d7deed3157e	planer	Planer dogodkov v koledarju	t
00020000-5656-fe8f-afe3-f467fa334a7c	kadrovska	Kadrovska služba	t
00020000-5656-fe8f-077a-5bea8b73a809	arhivar	Ažuriranje arhivalij	t
00020000-5656-fe8f-bbeb-05e4761c9094	igralec	Igralec	t
00020000-5656-fe8f-d666-d6f4b9910e03	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5656-fe91-1253-84fc5e819bd0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5656-fe91-7b17-690e243d1b67	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-7776-0ea27f74e301	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-ab7d-50230a605034	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-c918-91b1664741fe	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-e61f-2c3dd939cf6a	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-cee6-a9f7b9c06416	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-153a-c03b83ebe87b	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-c636-cd837b2d8077	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-8dd9-3109e8ad15cb	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-fa05-16e7b9abcadc	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-b878-7cfffd1ac451	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-9da9-2626c066ac4d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-6d85-5885b8296ad6	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-3f2b-0ff1d397f162	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-ed1d-62532db3c42b	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-f98f-bbc07b1f34e1	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5656-fe91-1d11-9512acf28585	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5656-fe91-f216-c44d16614a00	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5656-fe91-ad2c-438f8395dd7e	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5656-fe91-8c71-e839fdd7ad03	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5656-fe91-5aa5-519cebbfdf61	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5656-fe91-f587-f0dc15166431	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5656-fe91-087a-da7661b03a17	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5656-fe91-d750-56686c0e46be	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5656-fe91-557a-e0fafdac11b0	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5656-fe91-f5d2-87cb35ba1914	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5656-fe91-a6cc-87e6b9f0f3dc	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5656-fe91-d18e-ca432a2f8752	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5656-fe91-f97e-96dc060d4365	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5656-fe91-4b9d-0a90480a8c18	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5656-fe91-c6da-e9a457ff9f82	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5656-fe91-bb54-b7bb965a5509	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5656-fe91-89c1-e914ea4eb964	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5656-fe91-3054-9a294146de6a	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5656-fe91-a3bf-ef18447dca86	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5656-fe91-3ae3-e5f362e21820	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5656-fe91-1967-8f044dcf89c8	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5656-fe91-8eef-c799724a99ef	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5656-fe91-3166-1b400b0a122b	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5656-fe91-b738-a9f849f39890	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5656-fe91-9923-e6598eeeab66	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5656-fe91-db10-87ede0b1ca08	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5656-fe91-6a39-7cb7070afb9c	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5656-fe91-2eb4-0f6bb401c7f0	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5656-fe91-8111-11557d0e5d6e	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5656-fe91-fdf6-1e40b4f2ffb6	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5656-fe91-e1c2-128423270003	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5656-fe91-8c7a-e0f295edf16b	mn-produkcija-stroskovnik-	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5656-fe91-762f-487e9e4f7592	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5656-fe91-b240-84c41d0e252c	mn-produkcija-stroskovnik-splosno	omogoča akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5656-fe91-3222-2c020d05d51e	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5656-fe91-3d09-1f19410622bd	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5656-fe91-26ab-f92eeb42330a	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
\.


--
-- TOC entry 3099 (class 0 OID 29625307)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5656-fe8f-95ea-7e0bcc446325	00020000-5656-fe8f-c7a0-4cf35eaa2eef
00010000-5656-fe8f-9d79-9d6ccf0d5d0f	00020000-5656-fe8f-c7a0-4cf35eaa2eef
00010000-5656-fe91-84f6-f07e2c941291	00020000-5656-fe91-1253-84fc5e819bd0
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-7b17-690e243d1b67
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-e61f-2c3dd939cf6a
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-8dd9-3109e8ad15cb
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-b878-7cfffd1ac451
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-3f2b-0ff1d397f162
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-f98f-bbc07b1f34e1
00010000-5656-fe91-36e2-6905b9533eb4	00020000-5656-fe91-ab7d-50230a605034
00010000-5656-fe91-bda7-cc1bc2f05c7b	00020000-5656-fe91-7b17-690e243d1b67
00010000-5656-fe91-bda7-cc1bc2f05c7b	00020000-5656-fe91-7776-0ea27f74e301
00010000-5656-fe91-bda7-cc1bc2f05c7b	00020000-5656-fe91-ab7d-50230a605034
00010000-5656-fe91-bda7-cc1bc2f05c7b	00020000-5656-fe91-c918-91b1664741fe
00010000-5656-fe91-0758-5c2ac56d62e1	00020000-5656-fe91-7b17-690e243d1b67
00010000-5656-fe91-0758-5c2ac56d62e1	00020000-5656-fe91-7776-0ea27f74e301
00010000-5656-fe91-0758-5c2ac56d62e1	00020000-5656-fe91-ab7d-50230a605034
00010000-5656-fe91-0758-5c2ac56d62e1	00020000-5656-fe91-c918-91b1664741fe
00010000-5656-fe91-0758-5c2ac56d62e1	00020000-5656-fe91-b878-7cfffd1ac451
00010000-5656-fe91-a1d0-a26622952548	00020000-5656-fe91-7776-0ea27f74e301
00010000-5656-fe91-a1d0-a26622952548	00020000-5656-fe91-cee6-a9f7b9c06416
00010000-5656-fe91-a1d0-a26622952548	00020000-5656-fe91-fa05-16e7b9abcadc
00010000-5656-fe91-a1d0-a26622952548	00020000-5656-fe91-9da9-2626c066ac4d
00010000-5656-fe91-a1d0-a26622952548	00020000-5656-fe91-b878-7cfffd1ac451
00010000-5656-fe91-a1d0-a26622952548	00020000-5656-fe91-ed1d-62532db3c42b
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-7776-0ea27f74e301
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-cee6-a9f7b9c06416
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-c636-cd837b2d8077
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-fa05-16e7b9abcadc
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-9da9-2626c066ac4d
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-b878-7cfffd1ac451
00010000-5656-fe91-9cfb-350a11d028dd	00020000-5656-fe91-ed1d-62532db3c42b
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-7776-0ea27f74e301
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-ab7d-50230a605034
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-cee6-a9f7b9c06416
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-153a-c03b83ebe87b
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-c636-cd837b2d8077
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-e61f-2c3dd939cf6a
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-fa05-16e7b9abcadc
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-9da9-2626c066ac4d
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-b878-7cfffd1ac451
00010000-5656-fe91-329a-9561b40dfd7c	00020000-5656-fe91-ed1d-62532db3c42b
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-7b17-690e243d1b67
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-c918-91b1664741fe
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-e61f-2c3dd939cf6a
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-8dd9-3109e8ad15cb
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-b878-7cfffd1ac451
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-3f2b-0ff1d397f162
00010000-5656-fe91-1135-3ecaebf4f70b	00020000-5656-fe91-f98f-bbc07b1f34e1
00010000-5656-fe91-be8a-b091c0d9771c	00020000-5656-fe91-1d11-9512acf28585
\.


--
-- TOC entry 3144 (class 0 OID 29625765)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29625703)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29625649)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5656-fe91-c71b-eb781ce96873	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5656-fe91-950d-87084bff522b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5656-fe91-313a-e255b056696a	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29625272)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5656-fe8f-98ea-fa56acd67b0a	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5656-fe8f-6fda-a0907262eacd	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5656-fe8f-1834-dd76b9c33926	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5656-fe8f-eafa-ef470939b801	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5656-fe8f-a2d8-b110193568f1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29625264)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5656-fe8f-3eda-b76f2e790629	00230000-5656-fe8f-eafa-ef470939b801	popa
00240000-5656-fe8f-b7d7-ee582acf6a91	00230000-5656-fe8f-eafa-ef470939b801	oseba
00240000-5656-fe8f-89e7-723d31d0ea37	00230000-5656-fe8f-eafa-ef470939b801	tippopa
00240000-5656-fe8f-e31d-3a7b4d1c1c3c	00230000-5656-fe8f-eafa-ef470939b801	organizacijskaenota
00240000-5656-fe8f-86ee-b50234703495	00230000-5656-fe8f-eafa-ef470939b801	sezona
00240000-5656-fe8f-0ea3-b37ae031a6b2	00230000-5656-fe8f-eafa-ef470939b801	tipvaje
00240000-5656-fe8f-4b9c-6fbca64318f3	00230000-5656-fe8f-6fda-a0907262eacd	prostor
00240000-5656-fe8f-4954-e3163465f28a	00230000-5656-fe8f-eafa-ef470939b801	besedilo
00240000-5656-fe8f-8b19-a1c64758c7d0	00230000-5656-fe8f-eafa-ef470939b801	uprizoritev
00240000-5656-fe8f-97e9-76c1b997c11d	00230000-5656-fe8f-eafa-ef470939b801	funkcija
00240000-5656-fe8f-0a2c-70824bed07d2	00230000-5656-fe8f-eafa-ef470939b801	tipfunkcije
00240000-5656-fe8f-2e8d-700ebf752787	00230000-5656-fe8f-eafa-ef470939b801	alternacija
00240000-5656-fe8f-7883-09efb893c07a	00230000-5656-fe8f-98ea-fa56acd67b0a	pogodba
00240000-5656-fe8f-05d7-aeb7b3bdb524	00230000-5656-fe8f-eafa-ef470939b801	zaposlitev
00240000-5656-fe8f-9ca4-90258c4bdd09	00230000-5656-fe8f-eafa-ef470939b801	zvrstuprizoritve
00240000-5656-fe8f-d454-d8af759a5f79	00230000-5656-fe8f-98ea-fa56acd67b0a	programdela
00240000-5656-fe8f-326d-3f3b3d57323e	00230000-5656-fe8f-eafa-ef470939b801	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29625259)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
4a0dbfd8-a8b2-4bdc-8c43-df79495c73a3	00240000-5656-fe8f-3eda-b76f2e790629	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29625830)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5656-fe91-5d25-fb5efe82de5a	000e0000-5656-fe91-f310-44409a61f07e	00080000-5656-fe91-fc42-7cdcd86ca07a	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5656-fe8f-fe7f-da558ac6b838
00270000-5656-fe91-c204-c6fbc15940de	000e0000-5656-fe91-f310-44409a61f07e	00080000-5656-fe91-fc42-7cdcd86ca07a	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5656-fe8f-fe7f-da558ac6b838
\.


--
-- TOC entry 3109 (class 0 OID 29625407)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29625659)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5656-fe91-dfde-ae8666b3c3f7	00180000-5656-fe91-9148-9793a95edb62	000c0000-5656-fe91-c513-e7c23d8ef9c7	00090000-5656-fe91-ab46-4a4c120d9413	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5656-fe91-63dc-e81227932d3d	00180000-5656-fe91-9148-9793a95edb62	000c0000-5656-fe91-8f31-a4638b672ffa	00090000-5656-fe91-bda0-43863f9631d0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5656-fe91-1180-bd97adf0ac25	00180000-5656-fe91-9148-9793a95edb62	000c0000-5656-fe91-7b1b-04c9ba395784	00090000-5656-fe91-a390-60ddf86c1d88	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5656-fe91-ad54-50af6c4c35ca	00180000-5656-fe91-9148-9793a95edb62	000c0000-5656-fe91-f483-df91ce3ffb87	00090000-5656-fe91-0de2-c5c14a8b8717	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5656-fe91-dc0c-dbb4f23fbfaa	00180000-5656-fe91-9148-9793a95edb62	000c0000-5656-fe91-fac5-68d1a9086172	00090000-5656-fe91-c1c4-ec63e303470b	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5656-fe91-afdc-1f2848a51a2a	00180000-5656-fe91-e85e-db4881b78882	\N	00090000-5656-fe91-c1c4-ec63e303470b	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5656-fe91-73c5-9bd11153bf97	00180000-5656-fe91-e85e-db4881b78882	\N	00090000-5656-fe91-bda0-43863f9631d0	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29625871)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5656-fe8f-26d3-dd9bd2427f62	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5656-fe8f-08c9-b34cd296dcb2	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5656-fe8f-6f5a-7181d4da6f54	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5656-fe8f-6c0e-8f35b9dda019	04	Režija	Režija	Režija	umetnik	30
000f0000-5656-fe8f-df70-ce3a754397a5	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5656-fe8f-6443-e50728cac46a	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5656-fe8f-ef5f-03da2a8cbe62	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5656-fe8f-2773-9de020967822	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5656-fe8f-fe84-bed9c5b1ef0d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5656-fe8f-f754-5d27c4bdd2eb	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5656-fe8f-5b7a-49e8efb393e9	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5656-fe8f-a9da-ac848507395d	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5656-fe8f-3b8a-a1f60ced2b98	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5656-fe8f-59e6-ea005a9a47a0	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5656-fe8f-d21e-03cf18cc7d70	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5656-fe8f-7a38-cd841e324cd7	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5656-fe8f-e972-0de428eca810	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5656-fe8f-ee72-ed1f764b1403	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29625358)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5656-fe91-7425-b174d22c907a	0001	šola	osnovna ali srednja šola
00400000-5656-fe91-5524-4d504b70cd1a	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5656-fe91-a3e5-b503ed047c46	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29626164)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5656-fe8f-659d-6be2ca8b8ee8	01	Velika predstava	f	1.00	1.00
002b0000-5656-fe8f-e454-f3d55a747ae9	02	Mala predstava	f	0.50	0.50
002b0000-5656-fe8f-4c46-08f32954e10f	03	Mala koprodukcija	t	0.40	1.00
002b0000-5656-fe8f-8810-3091128365f6	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5656-fe8f-301c-b2981ab060c2	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29625639)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5656-fe8f-078b-bd6750a8a1bb	0001	prva vaja	prva vaja
00420000-5656-fe8f-d655-b99449c13275	0002	tehnična vaja	tehnična vaja
00420000-5656-fe8f-646b-4d6a9253dd51	0003	lučna vaja	lučna vaja
00420000-5656-fe8f-586e-73f599e4c4dd	0004	kostumska vaja	kostumska vaja
00420000-5656-fe8f-2e1e-9266f802dabc	0005	foto vaja	foto vaja
00420000-5656-fe8f-68e4-0053ceb7fc1f	0006	1. glavna vaja	1. glavna vaja
00420000-5656-fe8f-35c4-27cd694f7cf4	0007	2. glavna vaja	2. glavna vaja
00420000-5656-fe8f-b061-0fbb587ce8c3	0008	1. generalka	1. generalka
00420000-5656-fe8f-c2f8-4ec1f7717d9d	0009	2. generalka	2. generalka
00420000-5656-fe8f-d370-82196ad1ef45	0010	odprta generalka	odprta generalka
00420000-5656-fe8f-ccd7-9557e8cb379f	0011	obnovitvena vaja	obnovitvena vaja
00420000-5656-fe8f-436e-dd3fd070852e	0012	pevska vaja	pevska vaja
00420000-5656-fe8f-5c26-fa2699c2f234	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5656-fe8f-25c5-45c9b4d5a668	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29625480)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29625294)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5656-fe8f-9d79-9d6ccf0d5d0f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROkR5kPXaEQ.srNtGEEYIpAanc9RCJlDO	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5656-fe91-2c25-8a5984ed4f91	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5656-fe91-7697-4d32dc627f79	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5656-fe91-493e-259bc90db2d9	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5656-fe91-6bb4-872af9e87c91	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5656-fe91-a2c8-d18f26fe55f8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5656-fe91-3cc4-d80864bfdd67	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5656-fe91-2daa-e319c613e690	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5656-fe91-79a4-85d51948097e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5656-fe91-928c-16856304203a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5656-fe91-84f6-f07e2c941291	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5656-fe91-eb11-971dc496f809	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5656-fe91-36e2-6905b9533eb4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5656-fe91-bda7-cc1bc2f05c7b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5656-fe91-0758-5c2ac56d62e1	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5656-fe91-a1d0-a26622952548	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5656-fe91-9cfb-350a11d028dd	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5656-fe91-329a-9561b40dfd7c	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5656-fe91-1135-3ecaebf4f70b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5656-fe91-be8a-b091c0d9771c	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5656-fe8f-95ea-7e0bcc446325	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29625921)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5656-fe91-a61c-6d1935ea96f7	00160000-5656-fe91-d17f-a52b2e649a41	\N	00140000-5656-fe8f-5518-d9d774ca964d	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5656-fe91-4614-fadf62ab8fba
000e0000-5656-fe91-f310-44409a61f07e	00160000-5656-fe91-0bda-3af2a1de27ed	\N	00140000-5656-fe8f-44a3-1dae870645a4	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5656-fe91-16e0-ac2976143063
000e0000-5656-fe91-9c65-64005abb3207	\N	\N	00140000-5656-fe8f-44a3-1dae870645a4	00190000-5656-fe91-03d4-fb6165b9be3d	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5656-fe91-4614-fadf62ab8fba
000e0000-5656-fe91-ea31-63ae63bf0a4f	\N	\N	00140000-5656-fe8f-44a3-1dae870645a4	00190000-5656-fe91-03d4-fb6165b9be3d	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5656-fe91-4614-fadf62ab8fba
000e0000-5656-fe91-ee71-f5e2eba43d9a	\N	\N	00140000-5656-fe8f-44a3-1dae870645a4	00190000-5656-fe91-03d4-fb6165b9be3d	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5656-fe91-7421-b8d91477f243
000e0000-5656-fe91-a2b8-49a3e2c0555b	\N	\N	00140000-5656-fe8f-44a3-1dae870645a4	00190000-5656-fe91-03d4-fb6165b9be3d	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5656-fe91-7421-b8d91477f243
\.


--
-- TOC entry 3123 (class 0 OID 29625579)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5656-fe91-9137-98eafb70ea25	\N	000e0000-5656-fe91-f310-44409a61f07e	1	
00200000-5656-fe91-3aed-0c8267ea2596	\N	000e0000-5656-fe91-f310-44409a61f07e	2	
00200000-5656-fe91-9563-e1ccd90b7ce6	\N	000e0000-5656-fe91-f310-44409a61f07e	3	
00200000-5656-fe91-ab3b-232ec8c17980	\N	000e0000-5656-fe91-f310-44409a61f07e	4	
00200000-5656-fe91-770e-fd5627519cd4	\N	000e0000-5656-fe91-f310-44409a61f07e	5	
\.


--
-- TOC entry 3140 (class 0 OID 29625730)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29625844)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5656-fe8f-20ed-c6eeb4e8bd98	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5656-fe8f-0ad8-a3309d0a4f10	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5656-fe8f-cf5a-2b2075f11d63	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5656-fe8f-94d9-41a049e3790a	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5656-fe8f-ebec-866389df7baa	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5656-fe8f-f9be-d69478012d94	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5656-fe8f-d449-24dd859ba6e1	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5656-fe8f-094a-55d00831902c	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5656-fe8f-fe7f-da558ac6b838	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5656-fe8f-f64a-442385441b9e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5656-fe8f-55af-1a1f19f69c27	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5656-fe8f-aa0d-0c07496ef316	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5656-fe8f-de9d-05dd73fc84f8	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5656-fe8f-48a5-167a99262bae	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5656-fe8f-11f9-8b6ad5b5f789	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5656-fe8f-e410-8a3364fdcc56	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5656-fe8f-68f5-35bcb310cdc5	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5656-fe8f-589d-66b2b593fa61	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5656-fe8f-22f8-656bc35566c7	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5656-fe8f-7cea-484c891c429e	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5656-fe8f-5edb-a12c5815e0ef	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5656-fe8f-90c2-8e16f0d6cadb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5656-fe8f-a678-5293414f9622	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5656-fe8f-8d72-f26872061a4d	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5656-fe8f-09af-26c1076ae209	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5656-fe8f-7c65-084f12928674	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5656-fe8f-c889-b690f3eef736	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5656-fe8f-f8d5-4ee15a717daf	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29626214)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29626183)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29626226)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29625802)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5656-fe91-7806-0b82427f92f7	00090000-5656-fe91-bda0-43863f9631d0	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5656-fe91-15c7-adbca6d8a0cb	00090000-5656-fe91-a390-60ddf86c1d88	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5656-fe91-a6ca-b5f3a2e6f246	00090000-5656-fe91-35bc-4d0f6ec42cc6	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5656-fe91-ac11-c86568839d65	00090000-5656-fe91-787a-cd07f6875508	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5656-fe91-f6e1-3964dedb34f6	00090000-5656-fe91-77b5-f58c5caf913a	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5656-fe91-e99f-c5a3ff3b24b2	00090000-5656-fe91-5421-949b2029ac7b	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29625623)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29625911)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5656-fe8f-5518-d9d774ca964d	01	Drama	drama (SURS 01)
00140000-5656-fe8f-9ea3-e71f3fe9ee80	02	Opera	opera (SURS 02)
00140000-5656-fe8f-1790-69098606bf9e	03	Balet	balet (SURS 03)
00140000-5656-fe8f-e274-c7ab776ba2a9	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5656-fe8f-2579-1ab420bd82b0	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5656-fe8f-44a3-1dae870645a4	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5656-fe8f-d07e-9c974b498bfc	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29625792)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29625357)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29625970)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29625960)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29625348)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29625827)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29625869)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29626267)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29625611)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29625633)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29625638)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29626181)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29625506)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29626038)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29625788)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29625577)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29625544)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29625520)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29625695)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29626244)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29626251)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29626275)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 25231835)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2726 (class 2606 OID 29625722)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29625478)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29625376)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29625440)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29625403)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29625337)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29625322)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29625728)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29625764)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29625906)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29625431)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29625466)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29626133)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29625701)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29625456)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29625596)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29625565)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29625557)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29625713)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29626142)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29626150)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29626120)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29626162)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29625746)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29625686)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29625677)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29625893)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29625820)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29625532)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29625293)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29625755)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29625311)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29625331)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29625773)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29625708)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29625657)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29625281)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29625269)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29625263)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29625840)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29625412)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29625668)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29625880)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29625365)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29626174)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29625646)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29625491)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29625306)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29625939)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29625586)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29625736)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29625852)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29626224)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29626208)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29626232)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29625810)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29625627)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29625919)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29625800)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29625621)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29625622)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29625620)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29625619)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29625618)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29625841)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29625842)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29625843)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29626246)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29626245)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29625433)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29625434)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29625729)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29626212)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29626211)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29626213)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29626210)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29626209)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29625715)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29625714)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29625587)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29625588)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29625789)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29625791)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29625790)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29625522)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29625521)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29626163)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29625908)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29625909)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29625910)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29626233)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29625944)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29625941)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29625945)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29625943)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29625942)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29625493)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29625492)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29625406)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29625756)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29625338)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29625339)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29625776)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29625775)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29625774)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29625443)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29625442)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29625444)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29625560)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29625558)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29625559)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29625271)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29625681)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29625679)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29625678)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29625680)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29625312)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29625313)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29625737)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29626268)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29625829)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29625828)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29626276)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29626277)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29625702)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29625821)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29625822)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29626043)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29626042)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29626039)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29626040)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29626041)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29625458)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29625457)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29625459)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29625750)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29625749)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29626143)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29626144)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29625974)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29625975)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29625972)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29625973)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29625811)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29625812)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29625690)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29625689)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29625687)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29625688)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29625962)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29625961)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29625533)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29625547)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29625546)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29625545)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29625548)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29625578)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29625566)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29625567)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29626134)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29626182)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29626252)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29626253)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29625378)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29625377)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29625413)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29625414)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29625628)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29625671)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29625670)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29625669)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29625613)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29625614)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29625617)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29625612)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29625616)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29625615)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29625432)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29625366)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29625367)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29625507)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29625509)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29625508)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29625510)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29625696)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29625907)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29625940)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29625881)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29625882)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29625404)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29625405)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29625801)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29625282)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29625479)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29625441)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29625270)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29626175)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29625748)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29625747)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29625647)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29625648)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29625971)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29625467)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29625920)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29626225)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29626151)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29626152)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29625870)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29625658)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29625332)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 29626448)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 29626453)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 29626478)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 29626468)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 29626443)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 29626463)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 29626473)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 29626458)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 29626648)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29626653)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 29626658)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 29626823)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 29626818)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 29626333)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 29626338)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29626563)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 29626803)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29626798)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 29626808)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 29626793)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 29626788)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 29626558)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 29626553)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 29626433)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 29626438)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29626603)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29626613)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29626608)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 29626388)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 29626383)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29626543)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29626778)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 29626663)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29626668)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 29626673)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29626813)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 29626693)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 29626678)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 29626698)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29626688)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 29626683)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 29626378)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 29626373)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 29626318)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 29626313)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29626583)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 29626293)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 29626298)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 29626598)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29626593)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 29626588)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29626348)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 29626343)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 29626353)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 29626413)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 29626403)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29626408)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29626278)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 29626518)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 29626508)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 29626503)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 29626513)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 29626283)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 29626288)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29626568)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29626838)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 29626643)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 29626638)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 29626843)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 29626848)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29626548)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 29626628)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 29626633)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 29626753)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 29626748)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 29626733)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 29626738)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29626743)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29626363)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 29626358)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 29626368)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 29626578)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 29626573)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 29626763)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 29626768)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 29626723)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 29626728)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 29626713)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 29626718)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 29626618)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 29626623)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 29626538)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 29626533)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 29626523)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 29626528)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 29626708)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 29626703)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29626393)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29626398)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29626428)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 29626418)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 29626423)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29626758)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29626773)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29626783)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 29626828)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 29626833)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 29626308)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 29626303)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 29626323)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 29626328)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29626483)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 29626498)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29626493)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 29626488)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-26 13:44:04 CET

--
-- PostgreSQL database dump complete
--

