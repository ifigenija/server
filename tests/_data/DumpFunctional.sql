--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-16 15:33:28 CET

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
-- TOC entry 183 (class 1259 OID 27266874)
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
-- TOC entry 237 (class 1259 OID 27267488)
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
-- TOC entry 236 (class 1259 OID 27267471)
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
-- TOC entry 182 (class 1259 OID 27266867)
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
-- TOC entry 181 (class 1259 OID 27266865)
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
-- TOC entry 227 (class 1259 OID 27267348)
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
-- TOC entry 230 (class 1259 OID 27267378)
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
-- TOC entry 251 (class 1259 OID 27267779)
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
-- TOC entry 203 (class 1259 OID 27267122)
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
-- TOC entry 205 (class 1259 OID 27267154)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 27267159)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 27267701)
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
-- TOC entry 194 (class 1259 OID 27267019)
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
-- TOC entry 238 (class 1259 OID 27267501)
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
-- TOC entry 223 (class 1259 OID 27267302)
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
-- TOC entry 200 (class 1259 OID 27267093)
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
-- TOC entry 197 (class 1259 OID 27267059)
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
-- TOC entry 195 (class 1259 OID 27267036)
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
-- TOC entry 212 (class 1259 OID 27267216)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 27267759)
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
-- TOC entry 250 (class 1259 OID 27267772)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 27267794)
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
-- TOC entry 216 (class 1259 OID 27267241)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 27266993)
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
-- TOC entry 185 (class 1259 OID 27266893)
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
-- TOC entry 189 (class 1259 OID 27266960)
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
-- TOC entry 186 (class 1259 OID 27266904)
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
-- TOC entry 178 (class 1259 OID 27266839)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 27266858)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 27267248)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 27267282)
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
-- TOC entry 233 (class 1259 OID 27267419)
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
-- TOC entry 188 (class 1259 OID 27266940)
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
-- TOC entry 191 (class 1259 OID 27266985)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 27267646)
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
-- TOC entry 213 (class 1259 OID 27267222)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 27266970)
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
-- TOC entry 202 (class 1259 OID 27267114)
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
-- TOC entry 198 (class 1259 OID 27267074)
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
-- TOC entry 199 (class 1259 OID 27267086)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 27267234)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 27267660)
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
-- TOC entry 242 (class 1259 OID 27267670)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 27267569)
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
-- TOC entry 243 (class 1259 OID 27267678)
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
-- TOC entry 219 (class 1259 OID 27267263)
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
-- TOC entry 211 (class 1259 OID 27267207)
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
-- TOC entry 210 (class 1259 OID 27267197)
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
-- TOC entry 232 (class 1259 OID 27267408)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 27267338)
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
-- TOC entry 196 (class 1259 OID 27267048)
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
-- TOC entry 175 (class 1259 OID 27266810)
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
-- TOC entry 174 (class 1259 OID 27266808)
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
-- TOC entry 220 (class 1259 OID 27267276)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 27266848)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 27266832)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 27267290)
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
-- TOC entry 214 (class 1259 OID 27267228)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 27267174)
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
-- TOC entry 173 (class 1259 OID 27266797)
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
-- TOC entry 172 (class 1259 OID 27266789)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 27266784)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 27267355)
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
-- TOC entry 187 (class 1259 OID 27266932)
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
-- TOC entry 209 (class 1259 OID 27267184)
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
-- TOC entry 231 (class 1259 OID 27267396)
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
-- TOC entry 184 (class 1259 OID 27266883)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 27267689)
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
-- TOC entry 207 (class 1259 OID 27267164)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 27267005)
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
-- TOC entry 176 (class 1259 OID 27266819)
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
-- TOC entry 235 (class 1259 OID 27267446)
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
-- TOC entry 201 (class 1259 OID 27267104)
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
-- TOC entry 218 (class 1259 OID 27267255)
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
-- TOC entry 229 (class 1259 OID 27267369)
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
-- TOC entry 247 (class 1259 OID 27267739)
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
-- TOC entry 246 (class 1259 OID 27267708)
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
-- TOC entry 248 (class 1259 OID 27267751)
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
-- TOC entry 225 (class 1259 OID 27267327)
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
-- TOC entry 204 (class 1259 OID 27267148)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 27267436)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 27267317)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 27266870)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 27266813)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 27266874)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5649-e935-5b5e-2da91e70c007	10	30	Otroci	Abonma za otroke	200
000a0000-5649-e935-a5c2-078db45c2653	20	60	Mladina	Abonma za mladino	400
000a0000-5649-e935-e6b0-d426916d72c1	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 27267488)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5649-e935-1827-7a0bd0b7d6f5	000d0000-5649-e935-e1d5-426f4c4c9af3	\N	00090000-5649-e935-bb77-8404bcb0cef3	000b0000-5649-e935-a5e6-0ad74d90aebe	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5649-e935-ceac-fc4224cbb8e7	000d0000-5649-e935-8bdc-982396dfa5b6	00100000-5649-e935-d7e6-86803d04d21a	00090000-5649-e935-8939-c41b3a11a450	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5649-e935-7847-77f39f3a9394	000d0000-5649-e935-4812-cb400808aff7	00100000-5649-e935-c020-1a436e450015	00090000-5649-e935-b93b-03bee5e13272	\N	0003	t	\N	2015-11-16	\N	2	t	\N	f	f
000c0000-5649-e935-b9de-42a1d37194ac	000d0000-5649-e935-6504-39706fb99f10	\N	00090000-5649-e935-ada8-a0dd42b4af58	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5649-e935-dd7d-43e97646813b	000d0000-5649-e935-b1e8-5fe5f6b24e91	\N	00090000-5649-e935-78c3-6b05bbe0fdd7	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5649-e935-4f2a-0123a1182807	000d0000-5649-e935-91bf-9255543a5d4c	\N	00090000-5649-e935-85ff-5cf846b90d9c	000b0000-5649-e935-4050-7f0fdaf49c6f	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5649-e935-6ad1-7f71eab27ca5	000d0000-5649-e935-a17d-7f455ec40236	00100000-5649-e935-1fd5-22828be71e99	00090000-5649-e935-1971-ebe65377079c	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5649-e935-b173-91f2d825ee62	000d0000-5649-e935-6bd5-ac0c1f29b38d	\N	00090000-5649-e935-cd00-63efa252ee5f	000b0000-5649-e935-7aa6-23df0cbc9ea7	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5649-e935-505a-e9515a05b454	000d0000-5649-e935-a17d-7f455ec40236	00100000-5649-e935-2f41-9f29f2977cfe	00090000-5649-e935-6574-640a5f946730	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5649-e935-c058-15c7e076ebb0	000d0000-5649-e935-a17d-7f455ec40236	00100000-5649-e935-c7f4-cb93ef04e6f4	00090000-5649-e935-eb1b-61d79f40dfac	\N	0010	t	\N	2015-11-16	\N	16	f	\N	f	t
000c0000-5649-e935-e61e-e30379a4a351	000d0000-5649-e935-a17d-7f455ec40236	00100000-5649-e935-d052-08b0bf159d0e	00090000-5649-e935-c0a9-f12490919313	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5649-e935-ddf8-6d0a48c404db	000d0000-5649-e935-3faf-72600892e088	00100000-5649-e935-d7e6-86803d04d21a	00090000-5649-e935-8939-c41b3a11a450	000b0000-5649-e935-f1da-13b571e90949	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 27267471)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 27266867)
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
-- TOC entry 3149 (class 0 OID 27267348)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5649-e935-309c-eace59197b2f	00160000-5649-e934-ce5a-cdd559647f61	00090000-5649-e935-b5af-2b6238fc3d12	aizv	10	t
003d0000-5649-e935-d111-8bd5939c7754	00160000-5649-e934-ce5a-cdd559647f61	00090000-5649-e935-a022-c1db13ed47d1	apri	14	t
003d0000-5649-e935-0f67-70afc090fdcb	00160000-5649-e934-b45d-b2c6b5b61e7d	00090000-5649-e935-d9a0-854bc80a35e1	aizv	11	t
003d0000-5649-e935-a582-e435d45d07ae	00160000-5649-e934-310b-9aced8986f6c	00090000-5649-e935-c1a9-e6411ca161c1	aizv	12	t
003d0000-5649-e935-5b2a-3f492c5cf0c9	00160000-5649-e934-ce5a-cdd559647f61	00090000-5649-e935-aef6-92fcb9e7fcf0	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 27267378)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5649-e934-ce5a-cdd559647f61	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5649-e934-b45d-b2c6b5b61e7d	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5649-e934-310b-9aced8986f6c	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 27267779)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 27267122)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5649-e935-6348-82cb208442a1	\N	\N	00200000-5649-e935-5eff-19ff270bfa3e	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5649-e935-5d6e-796a2b8ca4f0	\N	\N	00200000-5649-e935-b558-c038fe6f39e9	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5649-e935-71d3-c95d755f2be7	\N	\N	00200000-5649-e935-b72d-dad6eb2df3a4	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5649-e935-f3f0-467d96f6154f	\N	\N	00200000-5649-e935-d72f-10d013cff6c7	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5649-e935-4a5f-c1cb0aa7a4b4	\N	\N	00200000-5649-e935-485b-611093ec23ab	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 27267154)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 27267159)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 27267701)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 27267019)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5649-e932-c17f-1e3e12dbbffd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5649-e932-2719-4055f321a494	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5649-e932-3d5d-a820a7e54f7e	AL	ALB	008	Albania 	Albanija	\N
00040000-5649-e932-4de7-f114826a3bc8	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5649-e932-fa89-22cfd3f16c0b	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5649-e932-2e5b-26c794841cd2	AD	AND	020	Andorra 	Andora	\N
00040000-5649-e932-d5c0-f0ee613637ca	AO	AGO	024	Angola 	Angola	\N
00040000-5649-e932-ceaa-bf4c3ee81274	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5649-e932-cab2-27aaab32714f	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5649-e932-e120-c56a1706b823	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5649-e932-e9f1-d78b756b7745	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5649-e932-6f1d-3101e903a193	AM	ARM	051	Armenia 	Armenija	\N
00040000-5649-e932-ab7a-eddf77015fb1	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5649-e932-4ee2-4ea6f111b584	AU	AUS	036	Australia 	Avstralija	\N
00040000-5649-e932-b345-8648d678dfc5	AT	AUT	040	Austria 	Avstrija	\N
00040000-5649-e932-b640-f8ce7b2b59bc	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5649-e932-4b11-1e55c93f2a4d	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5649-e932-bc57-c6e0118b57de	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5649-e932-05e1-57ed425be912	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5649-e932-586f-1adfd39fadb1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5649-e932-9e50-355aaca6cd7b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5649-e932-88ca-2c9e31a2285d	BE	BEL	056	Belgium 	Belgija	\N
00040000-5649-e932-58d3-b8bad7dd419a	BZ	BLZ	084	Belize 	Belize	\N
00040000-5649-e932-22aa-bc3690e49004	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5649-e932-a014-5017d78fd1ad	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5649-e932-1f3f-11cdb2cb8a74	BT	BTN	064	Bhutan 	Butan	\N
00040000-5649-e932-8197-63ded54ac4e7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5649-e932-c9b1-8daadb0da754	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5649-e932-eee6-a63e0be1d907	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5649-e932-3c45-a82c97360c43	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5649-e932-af9c-1331e6960419	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5649-e932-dd89-4e9780e749e5	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5649-e932-8347-a8459697f56f	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5649-e932-b348-e6cf99863682	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5649-e932-38b0-a9c491e9d4c3	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5649-e932-c493-6c781b28bb2a	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5649-e932-6a93-058704513273	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5649-e932-3ee5-1128bb64a25a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5649-e932-d0b1-eacbbd407789	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5649-e932-b8a9-e6bffcac30bf	CA	CAN	124	Canada 	Kanada	\N
00040000-5649-e932-7bb4-a52c39146eda	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5649-e932-3316-fec4f2c6db30	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5649-e932-7d85-6a9812dec8c8	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5649-e932-3b47-4acfe738058c	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5649-e932-1224-e07105c3bc9f	CL	CHL	152	Chile 	Čile	\N
00040000-5649-e932-8913-c761ea42609b	CN	CHN	156	China 	Kitajska	\N
00040000-5649-e933-def1-944e1936e937	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5649-e933-233a-5d8ead54baa9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5649-e933-55c6-da22198b2f35	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5649-e933-c98e-b363ff92d227	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5649-e933-f86f-d66dc2234ba8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5649-e933-d5fa-f9e0bed3aa85	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5649-e933-f8e8-75129c16e4ff	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5649-e933-61b0-3e438359b718	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5649-e933-0d2a-1e6e9a815414	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5649-e933-9a98-394ff8963691	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5649-e933-e51c-4c409c8c16c8	CU	CUB	192	Cuba 	Kuba	\N
00040000-5649-e933-506f-cb1034793807	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5649-e933-0fe8-c81c93280804	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5649-e933-b174-83f186944879	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5649-e933-71a3-26a9937ea1a2	DK	DNK	208	Denmark 	Danska	\N
00040000-5649-e933-1fad-ed30a19a9d18	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5649-e933-c93c-980de1445abd	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5649-e933-13a3-f5748f309624	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5649-e933-90d7-e9572509724d	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5649-e933-763c-6273e80394c6	EG	EGY	818	Egypt 	Egipt	\N
00040000-5649-e933-d938-52ef71b38072	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5649-e933-8d6d-d1e2bb7d7425	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5649-e933-f94a-b59621b14207	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5649-e933-b546-5139b92effcf	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5649-e933-0adc-b11f313a62fe	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5649-e933-3734-0519e4cd0ad9	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5649-e933-ac42-2346d727ec16	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5649-e933-bdfe-f4733ec4d7ff	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5649-e933-cb10-26c904edcf1f	FI	FIN	246	Finland 	Finska	\N
00040000-5649-e933-e5ec-9ac047884865	FR	FRA	250	France 	Francija	\N
00040000-5649-e933-5348-d98c2cd1a1e0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5649-e933-5dd4-6846b36494c2	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5649-e933-c3d3-4c501af86382	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5649-e933-4f2b-7b8928677817	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5649-e933-439e-583dd0a440b3	GA	GAB	266	Gabon 	Gabon	\N
00040000-5649-e933-6713-d2f04f2bc671	GM	GMB	270	Gambia 	Gambija	\N
00040000-5649-e933-e4f7-c3521301b6a5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5649-e933-abf2-b8f90ef00ec3	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5649-e933-dee8-eef7d93d5005	GH	GHA	288	Ghana 	Gana	\N
00040000-5649-e933-d8be-eade57f17cf1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5649-e933-9e2a-de7738f1e430	GR	GRC	300	Greece 	Grčija	\N
00040000-5649-e933-4e39-dfe76c01542c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5649-e933-06e4-6dd3482f5a84	GD	GRD	308	Grenada 	Grenada	\N
00040000-5649-e933-23e4-83b9c62641ef	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5649-e933-e15e-c695e6728463	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5649-e933-76bc-ca009494ef02	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5649-e933-f8d3-c067e35598af	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5649-e933-f6db-0e8c81f8d56e	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5649-e933-739c-1466e56dfd7e	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5649-e933-dd8f-0dff9301205a	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5649-e933-030e-75b88d22146d	HT	HTI	332	Haiti 	Haiti	\N
00040000-5649-e933-13a0-58ed8bad2449	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5649-e933-07f2-38edc254228c	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5649-e933-6d24-e94f4d1936d1	HN	HND	340	Honduras 	Honduras	\N
00040000-5649-e933-f1a0-0cbbd3cd1b90	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5649-e933-064a-5ba5fb83c9b2	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5649-e933-77df-c4cfc13bea06	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5649-e933-c351-7cb781aa029a	IN	IND	356	India 	Indija	\N
00040000-5649-e933-e56a-c3e19d744b03	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5649-e933-a3a6-e59fd977024e	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5649-e933-af78-0ec1aca78828	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5649-e933-10ea-09f150703e17	IE	IRL	372	Ireland 	Irska	\N
00040000-5649-e933-930b-26317a79beb9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5649-e933-1518-b03da04f721d	IL	ISR	376	Israel 	Izrael	\N
00040000-5649-e933-d1de-0b8c5a0d3746	IT	ITA	380	Italy 	Italija	\N
00040000-5649-e933-922d-8316d612f0bd	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5649-e933-074b-b4068fceade6	JP	JPN	392	Japan 	Japonska	\N
00040000-5649-e933-dfd2-c1d11be7971a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5649-e933-5a0f-6cea96bdd0f7	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5649-e933-42f5-d836ec2dd5d6	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5649-e933-8963-e7a4b7a96705	KE	KEN	404	Kenya 	Kenija	\N
00040000-5649-e933-f1f5-7b4551c31dde	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5649-e933-b5c0-4f4844f13a82	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5649-e933-e205-9209bc8f4fdd	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5649-e933-dbbd-6a78c2d18d00	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5649-e933-3689-74bf7f849dc2	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5649-e933-3c39-a7b3030e1113	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5649-e933-3737-05fc610ce05c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5649-e933-d2cc-403d295ebad3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5649-e933-661a-6014c9cef4d5	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5649-e933-af2e-1fa631c2b64b	LR	LBR	430	Liberia 	Liberija	\N
00040000-5649-e933-8d56-8e72e66317c3	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5649-e933-2cb8-9e95043688f9	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5649-e933-395c-428b133c2a3f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5649-e933-8b4c-20abf4a1fcba	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5649-e933-21e6-657e8851acf4	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5649-e933-fe11-e0248f08a38e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5649-e933-697e-a0c231d7a99b	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5649-e933-aa97-e87279c76f8f	MW	MWI	454	Malawi 	Malavi	\N
00040000-5649-e933-598b-82b57b0ff62a	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5649-e933-9315-a03788eb807d	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5649-e933-14d0-a623ee0e68c6	ML	MLI	466	Mali 	Mali	\N
00040000-5649-e933-0795-ba1aab24e1af	MT	MLT	470	Malta 	Malta	\N
00040000-5649-e933-583b-34ea5bc95444	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5649-e933-e77c-0980f257832f	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5649-e933-7a02-ab3fcef06992	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5649-e933-69a7-8ce144721c61	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5649-e933-2e33-d84e07878420	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5649-e933-10d8-42a85c152a1e	MX	MEX	484	Mexico 	Mehika	\N
00040000-5649-e933-b21e-e5ac5ef47cb4	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5649-e933-a4f9-bd54ec7a8755	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5649-e933-e938-f9b7f68d0436	MC	MCO	492	Monaco 	Monako	\N
00040000-5649-e933-f211-7669ec93a2b4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5649-e933-0566-dc56c038a606	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5649-e933-d7bc-3929ebd33dd7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5649-e933-aaf5-100e232a6e77	MA	MAR	504	Morocco 	Maroko	\N
00040000-5649-e933-65cc-c709b728773e	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5649-e933-6b90-4b87bbb52ed0	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5649-e933-f951-5d89a0b9861f	NA	NAM	516	Namibia 	Namibija	\N
00040000-5649-e933-f91f-98b58799857d	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5649-e933-0247-6fb8f8418cb3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5649-e933-49b7-dbac2c5e22d8	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5649-e933-a904-56bd1ed783af	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5649-e933-9477-fb0ef28c0bda	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5649-e933-2379-ddccf0534ab5	NE	NER	562	Niger 	Niger 	\N
00040000-5649-e933-d6a5-622220b24f57	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5649-e933-5dca-494ebfdc6899	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5649-e933-194d-51c7a41823fc	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5649-e933-b516-bcaf3e0fbf82	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5649-e933-9bb5-cc9b8dcc4f74	NO	NOR	578	Norway 	Norveška	\N
00040000-5649-e933-f9ae-bf572580b92c	OM	OMN	512	Oman 	Oman	\N
00040000-5649-e933-89f4-cff6181f97cc	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5649-e933-5007-77494e4c68ca	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5649-e933-c4a0-c1d4f75adc88	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5649-e933-a5ac-bd659d0ae621	PA	PAN	591	Panama 	Panama	\N
00040000-5649-e933-85bd-0ea9c7a2e736	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5649-e933-934d-ea4f146fff35	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5649-e933-1559-5d3fc049e4ad	PE	PER	604	Peru 	Peru	\N
00040000-5649-e933-1296-a9d4352c24db	PH	PHL	608	Philippines 	Filipini	\N
00040000-5649-e933-31d0-40818b738e1c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5649-e933-0351-dd126277d313	PL	POL	616	Poland 	Poljska	\N
00040000-5649-e933-24dc-14eab3752cd7	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5649-e933-46ce-4106491b4999	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5649-e933-5612-bfcc53d53783	QA	QAT	634	Qatar 	Katar	\N
00040000-5649-e933-5b4c-1d08d57378f3	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5649-e933-52c0-ad2f92a90421	RO	ROU	642	Romania 	Romunija	\N
00040000-5649-e933-0c45-9fb4ceee9710	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5649-e933-2690-b4f81fa4ea61	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5649-e933-2a03-b379afa9809f	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5649-e933-0143-47198d7cdefc	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5649-e933-3cdb-69918da7b226	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5649-e933-075b-303b4f543ee7	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5649-e933-9149-96761ce65c5f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5649-e933-908d-3150fd89cc8c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5649-e933-3453-aff0ed14db9e	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5649-e933-575f-4eb121b7c32b	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5649-e933-28d1-99d29738c7bb	SM	SMR	674	San Marino 	San Marino	\N
00040000-5649-e933-e281-8e4e2e45df39	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5649-e933-5ea8-c3d4e4782961	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5649-e933-26d5-79f055c179f5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5649-e933-edd2-757e1edaf9f5	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5649-e933-4cc4-abb2ae00979c	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5649-e933-5392-7fa86818dd19	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5649-e933-5fbd-23007e473a57	SG	SGP	702	Singapore 	Singapur	\N
00040000-5649-e933-68af-c95887361e0b	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5649-e933-d867-acf773d4559d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5649-e933-fa3b-2ec79b4a266c	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5649-e933-2b96-bdc6fa59a002	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5649-e933-fa23-e7c2d558c270	SO	SOM	706	Somalia 	Somalija	\N
00040000-5649-e933-3b12-2cbf685b3009	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5649-e933-fbed-2f38d4ff31a9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5649-e933-a0e7-b545eb19c63a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5649-e933-6241-d6e764ac217f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5649-e933-3c03-3c5beafdb42f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5649-e933-6552-79f2acdc8a13	SD	SDN	729	Sudan 	Sudan	\N
00040000-5649-e933-e8c4-e3409c53100c	SR	SUR	740	Suriname 	Surinam	\N
00040000-5649-e933-4fe0-3f367f660bef	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5649-e933-ad58-1194ed950bc2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5649-e933-94fd-30bb8f841cc7	SE	SWE	752	Sweden 	Švedska	\N
00040000-5649-e933-3455-76370b6a8b17	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5649-e933-8500-16dc743eefdc	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5649-e933-0cf5-636fa19135cb	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5649-e933-3432-887840c96ea6	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5649-e933-d987-703784c4b4bc	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5649-e933-df57-76642bd3c72c	TH	THA	764	Thailand 	Tajska	\N
00040000-5649-e933-252f-51d7f7062fbc	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5649-e933-90ba-be88910eebd2	TG	TGO	768	Togo 	Togo	\N
00040000-5649-e933-b0a4-c54153f16fe9	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5649-e933-1b59-cfe9b32d19b4	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5649-e933-49d5-acd9912d53a7	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5649-e933-1979-eea2902632ca	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5649-e933-cc83-f6b56d598030	TR	TUR	792	Turkey 	Turčija	\N
00040000-5649-e933-6bbe-9cdba37a27cd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5649-e933-0d90-1d2012c194f7	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5649-e933-bdc9-c257a3af267f	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5649-e933-79fb-0a15e009bdd7	UG	UGA	800	Uganda 	Uganda	\N
00040000-5649-e933-4630-bf205cb614d5	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5649-e933-a6b9-2cbb93a3e908	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5649-e933-7a1b-dcb44308188f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5649-e933-9260-3ea09ceb3653	US	USA	840	United States 	Združene države Amerike	\N
00040000-5649-e933-2f23-52cd97a67d23	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5649-e933-48d3-d61359f304f5	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5649-e933-c604-d703e5fb6c7d	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5649-e933-66ef-80bb6874576e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5649-e933-c46e-11bfa7360875	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5649-e933-a410-a7887e8d0a13	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5649-e933-180d-4534b08a7737	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5649-e933-b652-c7d77dfeb8af	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5649-e933-00b4-cc21d3a174e2	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5649-e933-0a5b-fc13baa98843	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5649-e933-ed8c-b143c4fbf3c5	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5649-e933-a17d-0b3d274449bc	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5649-e933-243d-c7af144cc6be	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 27267501)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5649-e935-f27f-8586ecb22008	000e0000-5649-e935-18ba-265620fd0e04	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5649-e932-a2e2-853d8ae418c3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5649-e935-d4c0-6b42cb1881ef	000e0000-5649-e935-efe2-02f0dc4e4257	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5649-e932-0d8e-7bdbefb38d98	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5649-e935-4433-01bc08f242d2	000e0000-5649-e935-4dd6-6e5716d5d963	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5649-e932-a2e2-853d8ae418c3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5649-e935-c1fe-e6ce261157fa	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5649-e935-1cd0-180d73075630	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 27267302)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5649-e935-a17d-7f455ec40236	000e0000-5649-e935-efe2-02f0dc4e4257	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5649-e932-a355-c0b56c2d024d
000d0000-5649-e935-e1d5-426f4c4c9af3	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-1827-7a0bd0b7d6f5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5649-e932-a355-c0b56c2d024d
000d0000-5649-e935-8bdc-982396dfa5b6	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-ceac-fc4224cbb8e7	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5649-e932-2ebd-00f887b84c27
000d0000-5649-e935-4812-cb400808aff7	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-7847-77f39f3a9394	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5649-e932-7e9c-435e8c1dd21f
000d0000-5649-e935-6504-39706fb99f10	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-b9de-42a1d37194ac	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5649-e932-abcf-9e5178406444
000d0000-5649-e935-b1e8-5fe5f6b24e91	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-dd7d-43e97646813b	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5649-e932-abcf-9e5178406444
000d0000-5649-e935-91bf-9255543a5d4c	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-4f2a-0123a1182807	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5649-e932-a355-c0b56c2d024d
000d0000-5649-e935-6bd5-ac0c1f29b38d	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-b173-91f2d825ee62	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5649-e932-b954-c0b088e37358
000d0000-5649-e935-3faf-72600892e088	000e0000-5649-e935-efe2-02f0dc4e4257	000c0000-5649-e935-ddf8-6d0a48c404db	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5649-e932-7bc0-20a22d9f5125
\.


--
-- TOC entry 3122 (class 0 OID 27267093)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 27267059)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 27267036)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5649-e935-c249-001e137e609a	00080000-5649-e935-644c-c7d70ad43e03	00090000-5649-e935-eb1b-61d79f40dfac	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 27267216)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 27267759)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5649-e935-88ce-d421b94171e7	00010000-5649-e933-7b3b-0c42f63ce3ee	\N	Prva mapa	Root mapa	2015-11-16 15:33:25	2015-11-16 15:33:25	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 27267772)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 27267794)
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
-- TOC entry 3138 (class 0 OID 27267241)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 27266993)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5649-e933-af9c-6b3c7f646bfc	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5649-e933-c7f7-6b75961915f1	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5649-e933-997c-683803262018	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5649-e933-0199-13fc1995ca40	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5649-e933-f5ca-f301612e02a6	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5649-e933-e51e-2cef5f8b8390	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5649-e933-0292-44401012cc49	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5649-e933-f452-b134f4daafc9	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5649-e933-72bb-5d85332b6029	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5649-e933-3bd6-606c3dcdfcf0	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5649-e933-5bbb-ff358edda716	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5649-e933-a54b-0f1fa8bd05a5	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5649-e933-cbd6-e2d9f22556a5	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5649-e933-5aab-78236e8cc78c	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5649-e934-e520-aacedeb806d5	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5649-e934-c953-ea7e13a50a64	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5649-e934-9b6c-bb400959e171	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5649-e934-891e-b4b00e49dfbd	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5649-e934-3676-08c4c7683b8a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5649-e936-484a-1a5032c7d934	application.tenant.maticnopodjetje	string	s:36:"00080000-5649-e936-201e-aeefe1b34d5a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 27266893)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5649-e934-7963-9567e693fdf8	00000000-5649-e934-e520-aacedeb806d5	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5649-e934-e375-235aded04964	00000000-5649-e934-e520-aacedeb806d5	00010000-5649-e933-7b3b-0c42f63ce3ee	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5649-e934-66c6-07d990201614	00000000-5649-e934-c953-ea7e13a50a64	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 27266960)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5649-e935-ff17-daed436affd0	\N	00100000-5649-e935-d7e6-86803d04d21a	00100000-5649-e935-c020-1a436e450015	01	Gledališče Nimbis
00410000-5649-e935-5a01-e3a01fab9673	00410000-5649-e935-ff17-daed436affd0	00100000-5649-e935-d7e6-86803d04d21a	00100000-5649-e935-c020-1a436e450015	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 27266904)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5649-e935-bb77-8404bcb0cef3	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5649-e935-ada8-a0dd42b4af58	00010000-5649-e935-6d4f-65c0fa4f8f53	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5649-e935-b93b-03bee5e13272	00010000-5649-e935-f83b-cdd896172a41	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5649-e935-6574-640a5f946730	00010000-5649-e935-c510-762c5b289421	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5649-e935-59cc-e480162a3c41	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5649-e935-85ff-5cf846b90d9c	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5649-e935-c0a9-f12490919313	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5649-e935-1971-ebe65377079c	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5649-e935-eb1b-61d79f40dfac	00010000-5649-e935-df70-ecb307823571	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5649-e935-8939-c41b3a11a450	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5649-e935-6765-e50c94f4386f	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5649-e935-78c3-6b05bbe0fdd7	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5649-e935-cd00-63efa252ee5f	00010000-5649-e935-4b3a-d39261198c70	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5649-e935-b5af-2b6238fc3d12	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5649-e935-a022-c1db13ed47d1	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5649-e935-d9a0-854bc80a35e1	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5649-e935-c1a9-e6411ca161c1	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5649-e935-aef6-92fcb9e7fcf0	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5649-e935-e907-752b8ac16356	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5649-e935-b01c-e166b25f4e67	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5649-e935-4e49-63a0d842083e	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 27266839)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5649-e933-3466-51eef02af60e	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5649-e933-d425-053140bf691d	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5649-e933-a58e-fc351bd157a0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5649-e933-ff5a-5f601f40fc30	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5649-e933-ba72-940665e24574	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5649-e933-acf7-46345eae718e	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5649-e933-f72f-b40966d9515c	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5649-e933-9933-16fe8c754101	Abonma-read	Abonma - branje	t
00030000-5649-e933-4c35-253d065be099	Abonma-write	Abonma - spreminjanje	t
00030000-5649-e933-9340-3787a3b3346f	Alternacija-read	Alternacija - branje	t
00030000-5649-e933-0e74-85e3c7b3c9ef	Alternacija-write	Alternacija - spreminjanje	t
00030000-5649-e933-ae97-3d9c5a89a940	Arhivalija-read	Arhivalija - branje	t
00030000-5649-e933-80d0-4286e3fa95eb	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5649-e933-c397-4228dc8c63fc	AuthStorage-read	AuthStorage - branje	t
00030000-5649-e933-8ff2-873409ecc955	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5649-e933-f2de-ed9b2fefbcf1	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5649-e933-42b3-3d92ecd1e0ee	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5649-e933-df95-d78263780041	Besedilo-read	Besedilo - branje	t
00030000-5649-e933-d81d-39161f4a2ee9	Besedilo-write	Besedilo - spreminjanje	t
00030000-5649-e933-b73c-bd920aa56be2	Dogodek-read	Dogodek - branje	t
00030000-5649-e933-76a2-d9669c85f894	Dogodek-write	Dogodek - spreminjanje	t
00030000-5649-e933-052a-ec37380c456c	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5649-e933-6b60-7f0d51bdc864	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5649-e933-fbe6-78fe8ada56a7	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5649-e933-e20a-61531e48c543	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5649-e933-34ab-6d97e5b4c184	DogodekTrait-read	DogodekTrait - branje	t
00030000-5649-e933-36d6-cb9e9ce4bc6f	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5649-e933-8aac-717fca1b184a	DrugiVir-read	DrugiVir - branje	t
00030000-5649-e933-b3d6-79ea84b6c40e	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5649-e933-a629-09619f3f59d4	Drzava-read	Drzava - branje	t
00030000-5649-e933-2836-75f73dd4425c	Drzava-write	Drzava - spreminjanje	t
00030000-5649-e933-dfe1-92ac864afb1f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5649-e933-f799-d7339a892227	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5649-e933-1b52-702a81ba7a8d	Funkcija-read	Funkcija - branje	t
00030000-5649-e933-d159-d159efac5a19	Funkcija-write	Funkcija - spreminjanje	t
00030000-5649-e933-2de7-5d29965f86db	Gostovanje-read	Gostovanje - branje	t
00030000-5649-e933-5d56-a0c6cd99fab3	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5649-e933-0393-86fabb1bed94	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5649-e933-447a-a7ae0df1bf85	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5649-e933-0a20-32cff75388a9	Kupec-read	Kupec - branje	t
00030000-5649-e933-878b-96199a8a1bce	Kupec-write	Kupec - spreminjanje	t
00030000-5649-e933-10a1-4f4d1a53dea8	NacinPlacina-read	NacinPlacina - branje	t
00030000-5649-e933-1ade-f143b7636c8c	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5649-e933-ac97-79e184f4056a	Option-read	Option - branje	t
00030000-5649-e933-a66e-4f1c7fb30679	Option-write	Option - spreminjanje	t
00030000-5649-e933-18be-b888cb0b4641	OptionValue-read	OptionValue - branje	t
00030000-5649-e933-b2c3-c2727ac6e97b	OptionValue-write	OptionValue - spreminjanje	t
00030000-5649-e933-bc61-9af31322584a	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5649-e933-28d4-62d5d9fc1358	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5649-e933-f219-47e606c7c49d	Oseba-read	Oseba - branje	t
00030000-5649-e933-1f5d-82d11654cee4	Oseba-write	Oseba - spreminjanje	t
00030000-5649-e933-dcec-92f324ed7dd1	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5649-e933-34f3-1d9aed7d79d3	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5649-e933-dbb4-0855a4e5349e	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5649-e933-8431-6e978aac05c1	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5649-e933-a252-3619b46f784b	Pogodba-read	Pogodba - branje	t
00030000-5649-e933-9059-71e44f6978d0	Pogodba-write	Pogodba - spreminjanje	t
00030000-5649-e933-5dc8-c0436be0a878	Popa-read	Popa - branje	t
00030000-5649-e933-2adb-c4a7ded00889	Popa-write	Popa - spreminjanje	t
00030000-5649-e933-a286-b8781ac7893a	Posta-read	Posta - branje	t
00030000-5649-e933-bcea-3c1ff17081fa	Posta-write	Posta - spreminjanje	t
00030000-5649-e933-037f-21e79193e07b	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5649-e933-5829-99dd682274a2	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5649-e933-2a19-275220e98d3a	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5649-e933-bce4-07e1922ac758	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5649-e933-16b7-4e9f60bedc2c	PostniNaslov-read	PostniNaslov - branje	t
00030000-5649-e933-2e76-580355fbf1b7	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5649-e933-1d50-ab42bfe41bdb	Praznik-read	Praznik - branje	t
00030000-5649-e933-09e6-336e0ff78003	Praznik-write	Praznik - spreminjanje	t
00030000-5649-e933-c9a9-1aed221c5bb7	Predstava-read	Predstava - branje	t
00030000-5649-e933-d995-1d68f8a1264f	Predstava-write	Predstava - spreminjanje	t
00030000-5649-e933-f9bc-d319cc570f95	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5649-e933-4aa1-adc90f75f563	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5649-e933-fbb8-dac68da833c3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5649-e933-afb6-97698b48f53f	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5649-e933-6e66-5cdc04a3668b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5649-e933-ea3c-2ff7458a10e2	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5649-e933-3a61-7e77c3883809	ProgramDela-read	ProgramDela - branje	t
00030000-5649-e933-4e32-57b09f8c6c52	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5649-e933-6ee3-d1878e4dd346	ProgramFestival-read	ProgramFestival - branje	t
00030000-5649-e933-04c4-b8a8bc081a7b	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5649-e933-37c4-3ed01a6300b4	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5649-e933-f1ce-42853ffafce8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5649-e933-4fc9-6483e2a0df9f	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5649-e933-9bb3-083ccf710156	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5649-e933-4574-1f20fedc6ea1	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5649-e933-b0c4-f06d58b2228d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5649-e933-bc0d-48ac691063f4	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5649-e933-a6c9-791eb32fea9e	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5649-e933-bc66-88fe701d8f71	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5649-e933-71f0-809052a93760	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5649-e933-6bca-6c80a4261ac3	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5649-e933-cfdf-0936d8d29dac	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5649-e933-a195-85f9d793d49a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5649-e933-0f24-3da99bf37dc6	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5649-e933-09eb-7a6e6a8684d6	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5649-e933-57eb-6e23904dcd15	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5649-e933-d5c3-9ce81109cd65	Prostor-read	Prostor - branje	t
00030000-5649-e933-d522-3dff8afdc4bd	Prostor-write	Prostor - spreminjanje	t
00030000-5649-e933-4255-eeb9aec215a6	Racun-read	Racun - branje	t
00030000-5649-e933-0564-8834d9760bc1	Racun-write	Racun - spreminjanje	t
00030000-5649-e933-160d-132ceb7eece8	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5649-e933-66f5-e4f4492a8d1a	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5649-e933-03c0-181423687495	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5649-e933-ce3a-ec531fbfc75e	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5649-e933-d876-41c5b4adc5ea	Rekvizit-read	Rekvizit - branje	t
00030000-5649-e933-f672-3d8af0e456e7	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5649-e933-5769-0bf4e6be5236	Revizija-read	Revizija - branje	t
00030000-5649-e933-650a-0982f7181b4f	Revizija-write	Revizija - spreminjanje	t
00030000-5649-e933-c288-ec6185e7a458	Rezervacija-read	Rezervacija - branje	t
00030000-5649-e933-5fd2-2ee5c5486154	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5649-e933-3731-5c963dd61b2d	SedezniRed-read	SedezniRed - branje	t
00030000-5649-e933-7301-a545090114ba	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5649-e933-c88e-8266205a5675	Sedez-read	Sedez - branje	t
00030000-5649-e933-964f-c7b705defc43	Sedez-write	Sedez - spreminjanje	t
00030000-5649-e933-3037-448b4457fb93	Sezona-read	Sezona - branje	t
00030000-5649-e933-d16e-644f530ee1d1	Sezona-write	Sezona - spreminjanje	t
00030000-5649-e933-3dee-3ce067d71094	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5649-e933-6a3d-3626188abf5b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5649-e933-0812-92afbf27803a	Stevilcenje-read	Stevilcenje - branje	t
00030000-5649-e933-2266-3bc8631f6588	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5649-e933-707a-5ae100e5bcc5	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5649-e933-2498-985b8b95145e	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5649-e933-ce31-9d44d9cd2e7c	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5649-e933-8c91-66a49e0eed72	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5649-e933-174a-63e915a3b5a3	Telefonska-read	Telefonska - branje	t
00030000-5649-e933-23e5-7f85def0b707	Telefonska-write	Telefonska - spreminjanje	t
00030000-5649-e933-19b3-351be7b839e8	TerminStoritve-read	TerminStoritve - branje	t
00030000-5649-e933-3b2d-f5a76cab98ee	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5649-e933-f9d5-7c70819be698	TipFunkcije-read	TipFunkcije - branje	t
00030000-5649-e933-b33a-f9fdd2077308	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5649-e933-47a4-f59e71bec622	TipPopa-read	TipPopa - branje	t
00030000-5649-e933-7f0a-c79ce4f258a9	TipPopa-write	TipPopa - spreminjanje	t
00030000-5649-e933-fe9a-dc0815f68ec5	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5649-e933-1bdd-8766c99eae63	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5649-e933-c2a9-b859ba81769c	TipVaje-read	TipVaje - branje	t
00030000-5649-e933-d9fa-418b12921ef2	TipVaje-write	TipVaje - spreminjanje	t
00030000-5649-e933-2d87-f596f6769ebf	Trr-read	Trr - branje	t
00030000-5649-e933-612e-2494614a73ac	Trr-write	Trr - spreminjanje	t
00030000-5649-e933-80f2-d9b4a4405ea6	Uprizoritev-read	Uprizoritev - branje	t
00030000-5649-e933-e8f4-faf3396b17b6	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5649-e933-a50d-053d99a6fa5c	Vaja-read	Vaja - branje	t
00030000-5649-e933-2966-7013212fbc08	Vaja-write	Vaja - spreminjanje	t
00030000-5649-e933-50f2-53e406f0ca1e	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5649-e933-3c3b-a7a017d2ee5e	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5649-e933-f027-67fd4a819061	VrstaStroska-read	VrstaStroska - branje	t
00030000-5649-e933-74fe-cd86483d7fdb	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5649-e933-cb8c-9af091d85a11	Zaposlitev-read	Zaposlitev - branje	t
00030000-5649-e933-824f-32f1b3234c0b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5649-e933-5be3-91ba5eb1dadc	Zasedenost-read	Zasedenost - branje	t
00030000-5649-e933-651e-7041960c69a9	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5649-e933-e63e-de8a30f18899	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5649-e933-aad7-d336ccc323de	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5649-e933-3518-ea1609f843dd	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5649-e933-f926-1e57da30eb1a	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5649-e933-0c57-5b6a397c7385	Job-read	Branje opravil - samo zase - branje	t
00030000-5649-e933-5682-abc2071746ce	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5649-e933-e576-1770ca819b8d	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5649-e933-f036-f43c4b310454	Report-read	Report - branje	t
00030000-5649-e933-5251-e66a5734db30	Report-write	Report - spreminjanje	t
00030000-5649-e933-dc08-6394b4bf7713	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5649-e933-a9fc-bfb0a0a6e0fb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5649-e933-d6c0-705e4a2c794c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5649-e933-4c8b-cae6f3db7f92	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5649-e933-f244-a17abf006bc4	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5649-e933-4c85-d8f3db9c3996	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5649-e933-21cc-808ab96f5dbe	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5649-e933-b3ba-e754c4d239fd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5649-e933-1647-19cad4c84938	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5649-e933-7d17-0749e0eb7b8b	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5649-e933-cc45-f2dee138efcf	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5649-e933-3af6-4163c3c3123d	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5649-e933-f434-36f347644f65	Datoteka-write	Datoteka - spreminjanje	t
00030000-5649-e933-9ffc-b11a09b2172b	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 27266858)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5649-e933-b92e-1dc09c8e6038	00030000-5649-e933-d425-053140bf691d
00020000-5649-e933-e2cd-703599738aa2	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-9933-16fe8c754101
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-4c35-253d065be099
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-9340-3787a3b3346f
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-0e74-85e3c7b3c9ef
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-ae97-3d9c5a89a940
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-b73c-bd920aa56be2
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-ff5a-5f601f40fc30
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-76a2-d9669c85f894
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-2836-75f73dd4425c
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-1b52-702a81ba7a8d
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-d159-d159efac5a19
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-2de7-5d29965f86db
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-5d56-a0c6cd99fab3
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-0393-86fabb1bed94
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-447a-a7ae0df1bf85
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-ac97-79e184f4056a
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-18be-b888cb0b4641
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-f219-47e606c7c49d
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-1f5d-82d11654cee4
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-5dc8-c0436be0a878
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-2adb-c4a7ded00889
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-a286-b8781ac7893a
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-bcea-3c1ff17081fa
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-16b7-4e9f60bedc2c
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-2e76-580355fbf1b7
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-c9a9-1aed221c5bb7
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-d995-1d68f8a1264f
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-6e66-5cdc04a3668b
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-ea3c-2ff7458a10e2
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-d5c3-9ce81109cd65
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-d522-3dff8afdc4bd
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-03c0-181423687495
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-ce3a-ec531fbfc75e
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-d876-41c5b4adc5ea
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-f672-3d8af0e456e7
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-3037-448b4457fb93
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-d16e-644f530ee1d1
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-f9d5-7c70819be698
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-80f2-d9b4a4405ea6
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-e8f4-faf3396b17b6
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-a50d-053d99a6fa5c
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-2966-7013212fbc08
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-5be3-91ba5eb1dadc
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-651e-7041960c69a9
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-e63e-de8a30f18899
00020000-5649-e933-2991-52598ef607f2	00030000-5649-e933-3518-ea1609f843dd
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-9933-16fe8c754101
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-ae97-3d9c5a89a940
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-b73c-bd920aa56be2
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-2de7-5d29965f86db
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-0393-86fabb1bed94
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-447a-a7ae0df1bf85
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-ac97-79e184f4056a
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-18be-b888cb0b4641
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-f219-47e606c7c49d
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-1f5d-82d11654cee4
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-5dc8-c0436be0a878
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-a286-b8781ac7893a
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-16b7-4e9f60bedc2c
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-2e76-580355fbf1b7
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-c9a9-1aed221c5bb7
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-d5c3-9ce81109cd65
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-03c0-181423687495
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-d876-41c5b4adc5ea
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-3037-448b4457fb93
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-174a-63e915a3b5a3
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-23e5-7f85def0b707
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-2d87-f596f6769ebf
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-612e-2494614a73ac
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-cb8c-9af091d85a11
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-824f-32f1b3234c0b
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-e63e-de8a30f18899
00020000-5649-e933-ac5a-3e709d2fe68b	00030000-5649-e933-3518-ea1609f843dd
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-9933-16fe8c754101
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-9340-3787a3b3346f
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-ae97-3d9c5a89a940
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-80d0-4286e3fa95eb
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-df95-d78263780041
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-052a-ec37380c456c
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-b73c-bd920aa56be2
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-1b52-702a81ba7a8d
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-2de7-5d29965f86db
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-0393-86fabb1bed94
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-ac97-79e184f4056a
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-18be-b888cb0b4641
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-f219-47e606c7c49d
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-5dc8-c0436be0a878
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-a286-b8781ac7893a
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-c9a9-1aed221c5bb7
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-6e66-5cdc04a3668b
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-d5c3-9ce81109cd65
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-03c0-181423687495
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-d876-41c5b4adc5ea
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-3037-448b4457fb93
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-f9d5-7c70819be698
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-a50d-053d99a6fa5c
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-5be3-91ba5eb1dadc
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-e63e-de8a30f18899
00020000-5649-e933-d253-ac3b46325484	00030000-5649-e933-3518-ea1609f843dd
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-9933-16fe8c754101
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-4c35-253d065be099
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-0e74-85e3c7b3c9ef
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-ae97-3d9c5a89a940
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-b73c-bd920aa56be2
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-2de7-5d29965f86db
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-ac97-79e184f4056a
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-18be-b888cb0b4641
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-5dc8-c0436be0a878
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-a286-b8781ac7893a
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-c9a9-1aed221c5bb7
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-d5c3-9ce81109cd65
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-03c0-181423687495
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-d876-41c5b4adc5ea
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-3037-448b4457fb93
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-f9d5-7c70819be698
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-e63e-de8a30f18899
00020000-5649-e933-23c9-a4a9e1ceeb11	00030000-5649-e933-3518-ea1609f843dd
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-9933-16fe8c754101
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-ae97-3d9c5a89a940
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-b73c-bd920aa56be2
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-2de7-5d29965f86db
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-ac97-79e184f4056a
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-18be-b888cb0b4641
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-5dc8-c0436be0a878
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-a286-b8781ac7893a
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-c9a9-1aed221c5bb7
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-d5c3-9ce81109cd65
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-03c0-181423687495
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-d876-41c5b4adc5ea
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-3037-448b4457fb93
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-19b3-351be7b839e8
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-a58e-fc351bd157a0
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-f9d5-7c70819be698
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-e63e-de8a30f18899
00020000-5649-e933-837d-1d2aa042eb3f	00030000-5649-e933-3518-ea1609f843dd
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3466-51eef02af60e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d425-053140bf691d
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-9933-16fe8c754101
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-4c35-253d065be099
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-9340-3787a3b3346f
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-0e74-85e3c7b3c9ef
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ae97-3d9c5a89a940
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-80d0-4286e3fa95eb
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f2de-ed9b2fefbcf1
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-42b3-3d92ecd1e0ee
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-df95-d78263780041
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d81d-39161f4a2ee9
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-052a-ec37380c456c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-6b60-7f0d51bdc864
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-b73c-bd920aa56be2
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ff5a-5f601f40fc30
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-76a2-d9669c85f894
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-8aac-717fca1b184a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-b3d6-79ea84b6c40e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a629-09619f3f59d4
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2836-75f73dd4425c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-dfe1-92ac864afb1f
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f799-d7339a892227
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-1b52-702a81ba7a8d
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d159-d159efac5a19
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2de7-5d29965f86db
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-5d56-a0c6cd99fab3
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-0393-86fabb1bed94
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-447a-a7ae0df1bf85
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-0a20-32cff75388a9
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-878b-96199a8a1bce
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-10a1-4f4d1a53dea8
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-1ade-f143b7636c8c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ac97-79e184f4056a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-18be-b888cb0b4641
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-b2c3-c2727ac6e97b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a66e-4f1c7fb30679
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-bc61-9af31322584a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-28d4-62d5d9fc1358
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f219-47e606c7c49d
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ba72-940665e24574
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-1f5d-82d11654cee4
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-dcec-92f324ed7dd1
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-34f3-1d9aed7d79d3
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-dbb4-0855a4e5349e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-8431-6e978aac05c1
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a252-3619b46f784b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-9059-71e44f6978d0
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-5dc8-c0436be0a878
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2adb-c4a7ded00889
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a286-b8781ac7893a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-037f-21e79193e07b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-5829-99dd682274a2
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2a19-275220e98d3a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-bce4-07e1922ac758
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-bcea-3c1ff17081fa
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-16b7-4e9f60bedc2c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2e76-580355fbf1b7
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-1d50-ab42bfe41bdb
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-09e6-336e0ff78003
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-c9a9-1aed221c5bb7
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d995-1d68f8a1264f
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f9bc-d319cc570f95
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-4aa1-adc90f75f563
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-fbb8-dac68da833c3
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-afb6-97698b48f53f
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-6e66-5cdc04a3668b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ea3c-2ff7458a10e2
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-acf7-46345eae718e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3a61-7e77c3883809
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f72f-b40966d9515c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-4e32-57b09f8c6c52
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-6ee3-d1878e4dd346
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-04c4-b8a8bc081a7b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-37c4-3ed01a6300b4
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f1ce-42853ffafce8
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-4fc9-6483e2a0df9f
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-9bb3-083ccf710156
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-4574-1f20fedc6ea1
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-b0c4-f06d58b2228d
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-bc0d-48ac691063f4
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a6c9-791eb32fea9e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-bc66-88fe701d8f71
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-71f0-809052a93760
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-6bca-6c80a4261ac3
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-cfdf-0936d8d29dac
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a195-85f9d793d49a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-0f24-3da99bf37dc6
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-09eb-7a6e6a8684d6
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-57eb-6e23904dcd15
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d5c3-9ce81109cd65
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d522-3dff8afdc4bd
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-4255-eeb9aec215a6
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-0564-8834d9760bc1
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-160d-132ceb7eece8
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-66f5-e4f4492a8d1a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-03c0-181423687495
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ce3a-ec531fbfc75e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d876-41c5b4adc5ea
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f672-3d8af0e456e7
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-5769-0bf4e6be5236
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-650a-0982f7181b4f
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-c288-ec6185e7a458
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-5fd2-2ee5c5486154
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3731-5c963dd61b2d
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-7301-a545090114ba
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-c88e-8266205a5675
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-964f-c7b705defc43
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3037-448b4457fb93
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d16e-644f530ee1d1
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3dee-3ce067d71094
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-6a3d-3626188abf5b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-0812-92afbf27803a
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-707a-5ae100e5bcc5
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2498-985b8b95145e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2266-3bc8631f6588
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-ce31-9d44d9cd2e7c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-8c91-66a49e0eed72
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-174a-63e915a3b5a3
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-23e5-7f85def0b707
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-19b3-351be7b839e8
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a58e-fc351bd157a0
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3b2d-f5a76cab98ee
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f9d5-7c70819be698
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-b33a-f9fdd2077308
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-47a4-f59e71bec622
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-7f0a-c79ce4f258a9
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-fe9a-dc0815f68ec5
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-1bdd-8766c99eae63
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-c2a9-b859ba81769c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-d9fa-418b12921ef2
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2d87-f596f6769ebf
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-612e-2494614a73ac
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-80f2-d9b4a4405ea6
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-e8f4-faf3396b17b6
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-a50d-053d99a6fa5c
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-2966-7013212fbc08
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-50f2-53e406f0ca1e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3c3b-a7a017d2ee5e
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f027-67fd4a819061
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-74fe-cd86483d7fdb
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-cb8c-9af091d85a11
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-824f-32f1b3234c0b
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-5be3-91ba5eb1dadc
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-651e-7041960c69a9
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-e63e-de8a30f18899
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-aad7-d336ccc323de
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-3518-ea1609f843dd
00020000-5649-e935-7bbb-2e267f294a5d	00030000-5649-e933-f926-1e57da30eb1a
00020000-5649-e935-d2e7-5af91d872e7f	00030000-5649-e933-7d17-0749e0eb7b8b
00020000-5649-e935-9ff4-a076d5561ec3	00030000-5649-e933-1647-19cad4c84938
00020000-5649-e935-804d-50723518e14d	00030000-5649-e933-e8f4-faf3396b17b6
00020000-5649-e935-b085-de606ede0d69	00030000-5649-e933-80f2-d9b4a4405ea6
00020000-5649-e935-51d0-1de1a4bcb4db	00030000-5649-e933-a9fc-bfb0a0a6e0fb
00020000-5649-e935-fdd1-ab56500bfdbd	00030000-5649-e933-d6c0-705e4a2c794c
00020000-5649-e935-79c5-8b3a92932a44	00030000-5649-e933-4c8b-cae6f3db7f92
00020000-5649-e935-9fb9-c56b3f0cb7a0	00030000-5649-e933-dc08-6394b4bf7713
00020000-5649-e935-6090-18447e763862	00030000-5649-e933-4c85-d8f3db9c3996
00020000-5649-e935-241f-b23ed56001fa	00030000-5649-e933-f244-a17abf006bc4
00020000-5649-e935-dc59-22d39c027816	00030000-5649-e933-b3ba-e754c4d239fd
00020000-5649-e935-3c71-b431af9249a9	00030000-5649-e933-21cc-808ab96f5dbe
00020000-5649-e935-d47b-32ab38f15c6e	00030000-5649-e933-1f5d-82d11654cee4
00020000-5649-e935-c761-6812c83eac8e	00030000-5649-e933-f219-47e606c7c49d
\.


--
-- TOC entry 3139 (class 0 OID 27267248)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 27267282)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 27267419)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5649-e935-a5e6-0ad74d90aebe	00090000-5649-e935-bb77-8404bcb0cef3	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5649-e935-4050-7f0fdaf49c6f	00090000-5649-e935-85ff-5cf846b90d9c	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5649-e935-7aa6-23df0cbc9ea7	00090000-5649-e935-cd00-63efa252ee5f	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5649-e935-f1da-13b571e90949	00090000-5649-e935-8939-c41b3a11a450	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 27266940)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5649-e935-644c-c7d70ad43e03	\N	00040000-5649-e933-fa3b-2ec79b4a266c	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-beb9-ebc7fef97bad	\N	00040000-5649-e933-fa3b-2ec79b4a266c	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5649-e935-d727-13e3b53b6360	\N	00040000-5649-e933-fa3b-2ec79b4a266c	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-b164-7e5724d51b06	\N	00040000-5649-e933-fa3b-2ec79b4a266c	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-9729-7a27c22a1b8f	\N	00040000-5649-e933-fa3b-2ec79b4a266c	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-dffe-afb17931a803	\N	00040000-5649-e932-e9f1-d78b756b7745	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-2106-7b5697e5bbef	\N	00040000-5649-e933-9a98-394ff8963691	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-60da-3287f1e0d922	\N	00040000-5649-e932-b345-8648d678dfc5	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e935-5f07-b9add823ecbb	\N	00040000-5649-e933-abf2-b8f90ef00ec3	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5649-e936-201e-aeefe1b34d5a	\N	00040000-5649-e933-fa3b-2ec79b4a266c	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 27266985)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5649-e932-3760-ea5f5624e310	8341	Adlešiči
00050000-5649-e932-ebe5-094e4f959f9c	5270	Ajdovščina
00050000-5649-e932-46a3-cc2312659157	6280	Ankaran/Ancarano
00050000-5649-e932-b8ea-6c7b248b0aa3	9253	Apače
00050000-5649-e932-e084-0c56d0fced05	8253	Artiče
00050000-5649-e932-3dda-5033e5532ee7	4275	Begunje na Gorenjskem
00050000-5649-e932-07a9-85ef88a231ab	1382	Begunje pri Cerknici
00050000-5649-e932-1d54-b94cabf4d6f9	9231	Beltinci
00050000-5649-e932-b12f-2a1c7caf4a2e	2234	Benedikt
00050000-5649-e932-2ff4-813751968d40	2345	Bistrica ob Dravi
00050000-5649-e932-1041-2d4c4fa38fdf	3256	Bistrica ob Sotli
00050000-5649-e932-cea5-7c1d6d99a6cc	8259	Bizeljsko
00050000-5649-e932-9d1e-4ebf76dcb804	1223	Blagovica
00050000-5649-e932-605b-290965766246	8283	Blanca
00050000-5649-e932-541d-8fb6169a1926	4260	Bled
00050000-5649-e932-81a3-3405135947af	4273	Blejska Dobrava
00050000-5649-e932-69aa-7fe88a6e5d21	9265	Bodonci
00050000-5649-e932-66fe-479284fd5de1	9222	Bogojina
00050000-5649-e932-cd08-434eef5f755f	4263	Bohinjska Bela
00050000-5649-e932-63d1-56bbaf5273c2	4264	Bohinjska Bistrica
00050000-5649-e932-af9c-6750ac947cd9	4265	Bohinjsko jezero
00050000-5649-e932-a99e-ad4a2fc31402	1353	Borovnica
00050000-5649-e932-3427-e28939bbd1d4	8294	Boštanj
00050000-5649-e932-80cd-0df7fd102f67	5230	Bovec
00050000-5649-e932-d041-73fb1a144bf4	5295	Branik
00050000-5649-e932-6bcf-cca34ddced6a	3314	Braslovče
00050000-5649-e932-01c3-61e0f6e3bd80	5223	Breginj
00050000-5649-e932-4436-25c6eb8efdac	8280	Brestanica
00050000-5649-e932-0ad4-414b580f8254	2354	Bresternica
00050000-5649-e932-5984-0beaba92c564	4243	Brezje
00050000-5649-e932-e552-c41f0fd395cc	1351	Brezovica pri Ljubljani
00050000-5649-e932-9681-0aa7f70083bc	8250	Brežice
00050000-5649-e932-7e66-7cdd547cdde5	4210	Brnik - Aerodrom
00050000-5649-e932-a102-9c5fa6927e59	8321	Brusnice
00050000-5649-e932-4459-25b67c2c1e8e	3255	Buče
00050000-5649-e932-8bb4-511ced13433f	8276	Bučka 
00050000-5649-e932-b8d4-c022edf0d302	9261	Cankova
00050000-5649-e932-368f-c8b81cc460ad	3000	Celje 
00050000-5649-e932-5c80-0012de4ff43a	3001	Celje - poštni predali
00050000-5649-e932-5dac-b6fa30f57d1c	4207	Cerklje na Gorenjskem
00050000-5649-e932-80e8-47531a30bb1a	8263	Cerklje ob Krki
00050000-5649-e932-6152-6a93199ccdb4	1380	Cerknica
00050000-5649-e932-e8c4-ae7276d908b0	5282	Cerkno
00050000-5649-e932-807e-43fdb0a770c5	2236	Cerkvenjak
00050000-5649-e932-ce26-dc0d5e64703c	2215	Ceršak
00050000-5649-e932-db2a-534a5c469427	2326	Cirkovce
00050000-5649-e932-d360-c5bdb55a1af0	2282	Cirkulane
00050000-5649-e932-2442-b1e8ead08426	5273	Col
00050000-5649-e932-45d2-f09daf13eea4	8251	Čatež ob Savi
00050000-5649-e932-f1ed-2a3ce9f9012d	1413	Čemšenik
00050000-5649-e932-9916-4427ada2772e	5253	Čepovan
00050000-5649-e932-0590-ea3f948bef4b	9232	Črenšovci
00050000-5649-e932-9926-4e722a94577b	2393	Črna na Koroškem
00050000-5649-e932-9802-d2eed43729b8	6275	Črni Kal
00050000-5649-e932-5fd5-d429683ed056	5274	Črni Vrh nad Idrijo
00050000-5649-e932-e160-d26c79160471	5262	Črniče
00050000-5649-e932-ab78-681f03862dab	8340	Črnomelj
00050000-5649-e932-1ad0-3b7fd726b3d1	6271	Dekani
00050000-5649-e932-f698-57479a63bbc0	5210	Deskle
00050000-5649-e932-b85f-c76761d3060d	2253	Destrnik
00050000-5649-e932-5caf-e5ac0201f857	6215	Divača
00050000-5649-e932-a761-796a72634890	1233	Dob
00050000-5649-e932-6c58-50ad1ba74533	3224	Dobje pri Planini
00050000-5649-e932-fdbe-df8534d7e32a	8257	Dobova
00050000-5649-e932-a61b-f69c9bb65919	1423	Dobovec
00050000-5649-e932-eb54-9d454f6755d8	5263	Dobravlje
00050000-5649-e932-1c3f-3e7db1e9cbf0	3204	Dobrna
00050000-5649-e932-5a07-15afbf33c9b9	8211	Dobrnič
00050000-5649-e932-2e84-fd46ec82b13b	1356	Dobrova
00050000-5649-e932-d2ad-0681b0654b3d	9223	Dobrovnik/Dobronak 
00050000-5649-e932-8138-1731ac1ece68	5212	Dobrovo v Brdih
00050000-5649-e932-e68d-55c30c45d241	1431	Dol pri Hrastniku
00050000-5649-e932-d6da-fe8d94b776fc	1262	Dol pri Ljubljani
00050000-5649-e932-28d4-538085e137d6	1273	Dole pri Litiji
00050000-5649-e932-23e8-306e5f0f48dc	1331	Dolenja vas
00050000-5649-e932-23af-25d6021cb989	8350	Dolenjske Toplice
00050000-5649-e932-23e8-7cb438888799	1230	Domžale
00050000-5649-e932-d16c-90a950fb015c	2252	Dornava
00050000-5649-e932-dc62-d4739b89883d	5294	Dornberk
00050000-5649-e932-3cc2-fe3197ab15c3	1319	Draga
00050000-5649-e932-4c7d-0541b614f0e1	8343	Dragatuš
00050000-5649-e932-356b-e55955868a6a	3222	Dramlje
00050000-5649-e932-c5a1-2d7b236550a7	2370	Dravograd
00050000-5649-e932-019f-35b41c2c771f	4203	Duplje
00050000-5649-e932-2d0d-929ca9cd2d08	6221	Dutovlje
00050000-5649-e932-feed-5b8a65ae5961	8361	Dvor
00050000-5649-e932-3ba0-f3ddddc1d7fb	2343	Fala
00050000-5649-e932-72ec-e21fbe2145d9	9208	Fokovci
00050000-5649-e932-9c5f-7386b1492a05	2313	Fram
00050000-5649-e932-36d3-cfe1246fb694	3213	Frankolovo
00050000-5649-e932-bf32-5de1c54a0c75	1274	Gabrovka
00050000-5649-e932-4b8d-04f7d4979469	8254	Globoko
00050000-5649-e932-cc02-5fb7fff5042b	5275	Godovič
00050000-5649-e932-a2ff-272637db57d2	4204	Golnik
00050000-5649-e932-eff0-22766c369632	3303	Gomilsko
00050000-5649-e932-c8e6-55dc2f229485	4224	Gorenja vas
00050000-5649-e932-dd80-0f7d4ecc7d11	3263	Gorica pri Slivnici
00050000-5649-e932-69d9-998c9dd775c1	2272	Gorišnica
00050000-5649-e932-7d0f-5afe7fa51f58	9250	Gornja Radgona
00050000-5649-e932-08ba-de3ee575044f	3342	Gornji Grad
00050000-5649-e932-ab3a-a61cbb485cc8	4282	Gozd Martuljek
00050000-5649-e932-1ec4-57f073095e8c	6272	Gračišče
00050000-5649-e932-3de7-186d3d19b86a	9264	Grad
00050000-5649-e932-6daa-0c2eca3368b3	8332	Gradac
00050000-5649-e932-467a-7b5c2f8aa799	1384	Grahovo
00050000-5649-e932-105f-532c36c7a0b9	5242	Grahovo ob Bači
00050000-5649-e932-ef20-6068210c7070	5251	Grgar
00050000-5649-e932-aa0f-45d8f4c2ab95	3302	Griže
00050000-5649-e932-6ba2-905ce5f17829	3231	Grobelno
00050000-5649-e932-ebc7-166fc081ec4e	1290	Grosuplje
00050000-5649-e932-a07e-e79d0cfce5bb	2288	Hajdina
00050000-5649-e932-5b3e-83f82d9c04e8	8362	Hinje
00050000-5649-e932-aba2-b54a00549bb0	2311	Hoče
00050000-5649-e932-1dd2-b4f6ecf0ff51	9205	Hodoš/Hodos
00050000-5649-e932-95eb-c9c736997eb4	1354	Horjul
00050000-5649-e932-d9ab-0bdec9ec01f1	1372	Hotedršica
00050000-5649-e932-c053-848df8f51e06	1430	Hrastnik
00050000-5649-e932-d104-c56ad2df0f38	6225	Hruševje
00050000-5649-e932-493f-8535386c494c	4276	Hrušica
00050000-5649-e932-c95b-6a373cac177e	5280	Idrija
00050000-5649-e932-5d06-a4eb33540b35	1292	Ig
00050000-5649-e932-a77a-bd3f999f19aa	6250	Ilirska Bistrica
00050000-5649-e932-3848-e563bf57b46e	6251	Ilirska Bistrica-Trnovo
00050000-5649-e932-f1e1-6cd060a67c3d	1295	Ivančna Gorica
00050000-5649-e932-8a8a-139db1e821e7	2259	Ivanjkovci
00050000-5649-e932-52eb-75d11fb7fa20	1411	Izlake
00050000-5649-e932-a1e1-cd6d81cd3fe9	6310	Izola/Isola
00050000-5649-e932-1d0c-4450f5e25b35	2222	Jakobski Dol
00050000-5649-e932-11b9-a24ee921eb65	2221	Jarenina
00050000-5649-e932-e418-4eb89f8f721a	6254	Jelšane
00050000-5649-e932-0cf2-944a8737e551	4270	Jesenice
00050000-5649-e932-18b3-2b118206405b	8261	Jesenice na Dolenjskem
00050000-5649-e932-421f-867323db5ce0	3273	Jurklošter
00050000-5649-e932-a757-20fbf34622d5	2223	Jurovski Dol
00050000-5649-e932-6aea-ac9174dddf62	2256	Juršinci
00050000-5649-e932-3534-723caa548df9	5214	Kal nad Kanalom
00050000-5649-e932-16d4-bd0b8ffcb9fc	3233	Kalobje
00050000-5649-e932-7d06-9ab99e8c7822	4246	Kamna Gorica
00050000-5649-e932-a076-65ef2a4e2817	2351	Kamnica
00050000-5649-e932-4e37-ad19c41a9cf0	1241	Kamnik
00050000-5649-e932-78c2-e059cc3f11bf	5213	Kanal
00050000-5649-e932-d971-c2be57775e2d	8258	Kapele
00050000-5649-e932-8e96-06e4180a12fb	2362	Kapla
00050000-5649-e932-88fb-292779ea408b	2325	Kidričevo
00050000-5649-e932-0831-4d2752073cb0	1412	Kisovec
00050000-5649-e932-a2b3-f8225a31cc6e	6253	Knežak
00050000-5649-e932-1fea-8f61b9393fd8	5222	Kobarid
00050000-5649-e932-12de-ddd0ad7be709	9227	Kobilje
00050000-5649-e932-069f-5ab0583b7484	1330	Kočevje
00050000-5649-e932-9f80-88fbef6cdb1b	1338	Kočevska Reka
00050000-5649-e932-f0c4-bdedf7abf0d3	2276	Kog
00050000-5649-e932-096e-cbdfdf932778	5211	Kojsko
00050000-5649-e932-447c-88a4c0be2ece	6223	Komen
00050000-5649-e932-b6e6-d4bbc16fdf99	1218	Komenda
00050000-5649-e932-07ee-c2b1ee812ec5	6000	Koper/Capodistria 
00050000-5649-e932-11de-719886872432	6001	Koper/Capodistria - poštni predali
00050000-5649-e932-893c-f77ec54b92c3	8282	Koprivnica
00050000-5649-e932-ae8c-c658e58c0e56	5296	Kostanjevica na Krasu
00050000-5649-e932-f44c-a3bedcb5ae21	8311	Kostanjevica na Krki
00050000-5649-e932-53b2-73649b97fbad	1336	Kostel
00050000-5649-e932-4aea-8cae4767b5e6	6256	Košana
00050000-5649-e932-0d82-507fa0fc3777	2394	Kotlje
00050000-5649-e932-bad8-a1f77a9bb64c	6240	Kozina
00050000-5649-e932-b86e-0591e1c1dfb5	3260	Kozje
00050000-5649-e932-c417-01b95bc9c879	4000	Kranj 
00050000-5649-e932-5994-dc116ab67c07	4001	Kranj - poštni predali
00050000-5649-e932-e54d-2398ab39b8e7	4280	Kranjska Gora
00050000-5649-e932-5432-52d4918d66f6	1281	Kresnice
00050000-5649-e932-3c81-c990c68665f8	4294	Križe
00050000-5649-e932-436b-d3f03759c06c	9206	Križevci
00050000-5649-e932-192b-20a09c044b08	9242	Križevci pri Ljutomeru
00050000-5649-e932-e3bb-a78adcd1c2c2	1301	Krka
00050000-5649-e932-4208-583b7449fc11	8296	Krmelj
00050000-5649-e932-480e-0b83b8f9a7bf	4245	Kropa
00050000-5649-e932-4651-81ad085df703	8262	Krška vas
00050000-5649-e932-dd9e-0643fbf4b4f5	8270	Krško
00050000-5649-e932-3144-b2f9c56ea351	9263	Kuzma
00050000-5649-e932-43f5-191c5a9feb76	2318	Laporje
00050000-5649-e932-e916-056a0c0f95b1	3270	Laško
00050000-5649-e932-bf05-a28d26319514	1219	Laze v Tuhinju
00050000-5649-e932-2f1c-994000195431	2230	Lenart v Slovenskih goricah
00050000-5649-e932-83f0-b6e591ebbcba	9220	Lendava/Lendva
00050000-5649-e932-9913-a78f2dd33e99	4248	Lesce
00050000-5649-e932-849e-e2218a52fc3b	3261	Lesično
00050000-5649-e932-0208-c096be18220e	8273	Leskovec pri Krškem
00050000-5649-e932-a909-0bf273f5e528	2372	Libeliče
00050000-5649-e932-69da-f9d3ecd08e0c	2341	Limbuš
00050000-5649-e932-8ee6-4aad86a27f6d	1270	Litija
00050000-5649-e932-3cb0-96adebebf584	3202	Ljubečna
00050000-5649-e932-1a33-22df39db8c96	1000	Ljubljana 
00050000-5649-e932-327d-93915774c82a	1001	Ljubljana - poštni predali
00050000-5649-e932-8521-95fc806ff370	1231	Ljubljana - Črnuče
00050000-5649-e932-1ef5-867462d0366b	1261	Ljubljana - Dobrunje
00050000-5649-e932-2cfb-5c670305bc5a	1260	Ljubljana - Polje
00050000-5649-e932-c38b-8cf1f532e8b3	1210	Ljubljana - Šentvid
00050000-5649-e932-b170-3e1d8c087d85	1211	Ljubljana - Šmartno
00050000-5649-e932-6942-0d0a51bbb425	3333	Ljubno ob Savinji
00050000-5649-e932-5c00-f52e3446532e	9240	Ljutomer
00050000-5649-e932-04eb-8c18985dd699	3215	Loče
00050000-5649-e932-9ef0-a817b0cfbb20	5231	Log pod Mangartom
00050000-5649-e932-b7d4-34a9dd6bf638	1358	Log pri Brezovici
00050000-5649-e932-b3b2-65433f247ce2	1370	Logatec
00050000-5649-e932-db03-e14fc348b918	1371	Logatec
00050000-5649-e932-5a8a-2e4c2d1839d4	1434	Loka pri Zidanem Mostu
00050000-5649-e932-0dd4-2bfd3440421a	3223	Loka pri Žusmu
00050000-5649-e932-0972-1666be618c6d	6219	Lokev
00050000-5649-e932-bdb4-db89bb7ba4cd	1318	Loški Potok
00050000-5649-e932-d962-6f4a4d6bdb46	2324	Lovrenc na Dravskem polju
00050000-5649-e932-7adf-cdb965524ff5	2344	Lovrenc na Pohorju
00050000-5649-e932-eb6d-5c85c59181b2	3334	Luče
00050000-5649-e932-4279-82f2cb93dfc6	1225	Lukovica
00050000-5649-e932-6049-888df721256f	9202	Mačkovci
00050000-5649-e932-de14-1e85ce08bc48	2322	Majšperk
00050000-5649-e932-ba0e-bc51490392f5	2321	Makole
00050000-5649-e932-989b-deac9a73f9bb	9243	Mala Nedelja
00050000-5649-e932-f843-0457b862b065	2229	Malečnik
00050000-5649-e932-e348-8846e6d17be6	6273	Marezige
00050000-5649-e932-dee4-027f88e0557d	2000	Maribor 
00050000-5649-e932-6128-f8c0c3499edd	2001	Maribor - poštni predali
00050000-5649-e932-0ff7-8c9e61a6c426	2206	Marjeta na Dravskem polju
00050000-5649-e932-5e81-7a5302bf729d	2281	Markovci
00050000-5649-e932-cdd7-dc7764497b32	9221	Martjanci
00050000-5649-e932-aa1e-ee1400ed600a	6242	Materija
00050000-5649-e932-c7b3-c39271c7713f	4211	Mavčiče
00050000-5649-e932-c1d6-ba7ff414309e	1215	Medvode
00050000-5649-e932-beeb-fa254667164f	1234	Mengeš
00050000-5649-e932-1202-4e9d6ef6aa13	8330	Metlika
00050000-5649-e932-129a-53df9a08a0d8	2392	Mežica
00050000-5649-e932-4c24-3fefda37cd6a	2204	Miklavž na Dravskem polju
00050000-5649-e932-7d97-fe0b04c50575	2275	Miklavž pri Ormožu
00050000-5649-e932-412e-33076d034491	5291	Miren
00050000-5649-e932-d013-53b093690c40	8233	Mirna
00050000-5649-e932-797e-02631d6b83a1	8216	Mirna Peč
00050000-5649-e932-dc98-5296bc438b80	2382	Mislinja
00050000-5649-e932-fc63-4e1ffa72a486	4281	Mojstrana
00050000-5649-e932-be33-88532409c5b2	8230	Mokronog
00050000-5649-e932-e7e4-ed60b4338ca6	1251	Moravče
00050000-5649-e932-db35-66a3adaf88e3	9226	Moravske Toplice
00050000-5649-e932-51a1-276b4734b704	5216	Most na Soči
00050000-5649-e932-503d-4c1b79f8a088	1221	Motnik
00050000-5649-e932-5a15-40827a3bf69c	3330	Mozirje
00050000-5649-e932-e76d-e43fb6b6c555	9000	Murska Sobota 
00050000-5649-e932-1314-7c979048f150	9001	Murska Sobota - poštni predali
00050000-5649-e932-36a0-3f451ee1d84d	2366	Muta
00050000-5649-e932-e71f-b136fe037e11	4202	Naklo
00050000-5649-e932-493b-b1bc644ce3f6	3331	Nazarje
00050000-5649-e932-8a1a-378e797ea139	1357	Notranje Gorice
00050000-5649-e932-bd36-d4b1dfc137e4	3203	Nova Cerkev
00050000-5649-e932-beb5-782409f77e8a	5000	Nova Gorica 
00050000-5649-e932-b92f-51eb14ff4cda	5001	Nova Gorica - poštni predali
00050000-5649-e932-8347-9b7f941d3a1e	1385	Nova vas
00050000-5649-e932-2ac8-1f494ef571f8	8000	Novo mesto
00050000-5649-e932-9c6e-5f4a90b45191	8001	Novo mesto - poštni predali
00050000-5649-e932-c6b2-780fc7fbe0a3	6243	Obrov
00050000-5649-e932-f64e-cbb0b6d7f927	9233	Odranci
00050000-5649-e932-b23c-771112780f1d	2317	Oplotnica
00050000-5649-e932-6ad6-f3f6bebcebcb	2312	Orehova vas
00050000-5649-e932-609b-39894903add9	2270	Ormož
00050000-5649-e932-828d-ce69effca005	1316	Ortnek
00050000-5649-e932-aca9-f098a33f55d8	1337	Osilnica
00050000-5649-e932-cf25-3c8cc82c32f0	8222	Otočec
00050000-5649-e932-57af-32a7eeed2f73	2361	Ožbalt
00050000-5649-e932-2646-a88048a4cbb1	2231	Pernica
00050000-5649-e932-ce09-6ea4ec48e405	2211	Pesnica pri Mariboru
00050000-5649-e932-ddf7-8840cf9f3bfc	9203	Petrovci
00050000-5649-e932-2595-5fd666f38366	3301	Petrovče
00050000-5649-e932-bbdb-88976322ad2f	6330	Piran/Pirano
00050000-5649-e932-d1d4-432a803dfd11	8255	Pišece
00050000-5649-e932-4d16-699e94fde74b	6257	Pivka
00050000-5649-e932-81d3-271203ab1fc4	6232	Planina
00050000-5649-e932-ef1e-54cd0eaae2ea	3225	Planina pri Sevnici
00050000-5649-e932-e832-cebad3fd4b47	6276	Pobegi
00050000-5649-e932-6b53-b5272084cda7	8312	Podbočje
00050000-5649-e932-7400-190b3be6ac68	5243	Podbrdo
00050000-5649-e932-ac85-fe0d04c8e4dc	3254	Podčetrtek
00050000-5649-e932-80a4-6e0767dd1eeb	2273	Podgorci
00050000-5649-e932-e659-b87a6a5a7726	6216	Podgorje
00050000-5649-e932-e0f2-2103f9e94803	2381	Podgorje pri Slovenj Gradcu
00050000-5649-e932-cb31-1c83ab43b58b	6244	Podgrad
00050000-5649-e932-7ee1-212199b54ac6	1414	Podkum
00050000-5649-e932-0022-b150c134227a	2286	Podlehnik
00050000-5649-e932-1965-08649d85ee3f	5272	Podnanos
00050000-5649-e932-8281-8c9736768121	4244	Podnart
00050000-5649-e932-cb0f-c7dc47c348b4	3241	Podplat
00050000-5649-e932-e69f-31312c342c2b	3257	Podsreda
00050000-5649-e932-f93e-c5cce4a8a410	2363	Podvelka
00050000-5649-e932-9b9e-334b3f10fafa	2208	Pohorje
00050000-5649-e932-8d8c-d562c094c94a	2257	Polenšak
00050000-5649-e932-9471-17f07cac9708	1355	Polhov Gradec
00050000-5649-e932-8da0-902b92e68e36	4223	Poljane nad Škofjo Loko
00050000-5649-e932-0422-8f59bfd02017	2319	Poljčane
00050000-5649-e932-358e-845b229af020	1272	Polšnik
00050000-5649-e932-73d5-b36852537c3b	3313	Polzela
00050000-5649-e932-95a7-9fc4307d8047	3232	Ponikva
00050000-5649-e932-9d6c-48af98ee4dfe	6320	Portorož/Portorose
00050000-5649-e932-2a21-1d3caacb9fe8	6230	Postojna
00050000-5649-e932-0d13-644fe5dbebcb	2331	Pragersko
00050000-5649-e932-4106-3d30605876bb	3312	Prebold
00050000-5649-e932-da98-117c79d5e122	4205	Preddvor
00050000-5649-e932-53d3-fcfa650c4f2f	6255	Prem
00050000-5649-e932-ce1d-589b81773abb	1352	Preserje
00050000-5649-e932-0680-5f4d29485037	6258	Prestranek
00050000-5649-e932-f380-597820544a21	2391	Prevalje
00050000-5649-e932-547a-7b44f0bad113	3262	Prevorje
00050000-5649-e932-1568-3a119cc46cd1	1276	Primskovo 
00050000-5649-e932-a618-eeae00553969	3253	Pristava pri Mestinju
00050000-5649-e932-924e-7e1885eef8fc	9207	Prosenjakovci/Partosfalva
00050000-5649-e932-9f87-9d3a402dd018	5297	Prvačina
00050000-5649-e932-3b20-38b8eee76b28	2250	Ptuj
00050000-5649-e932-d51a-e3abcf763162	2323	Ptujska Gora
00050000-5649-e932-6ec2-f5bb8f3bb436	9201	Puconci
00050000-5649-e932-3f45-1275231bb51b	2327	Rače
00050000-5649-e932-85a8-93ef1c605dd1	1433	Radeče
00050000-5649-e932-5910-886cc277aa10	9252	Radenci
00050000-5649-e932-7e00-0695cb1a5699	2360	Radlje ob Dravi
00050000-5649-e932-24e6-6b0486c187cc	1235	Radomlje
00050000-5649-e932-9913-3d625f5ee1fa	4240	Radovljica
00050000-5649-e932-092b-87115125b08c	8274	Raka
00050000-5649-e932-46e2-6d5f4b33b238	1381	Rakek
00050000-5649-e932-cdf3-5a86c0f02143	4283	Rateče - Planica
00050000-5649-e932-b13d-ded948765da2	2390	Ravne na Koroškem
00050000-5649-e932-c904-bf4990ea33d1	9246	Razkrižje
00050000-5649-e932-1845-b2e58c0361ed	3332	Rečica ob Savinji
00050000-5649-e932-5f7f-9aba3c08e4b0	5292	Renče
00050000-5649-e932-663f-e44425596d11	1310	Ribnica
00050000-5649-e932-bdc5-2922a785e885	2364	Ribnica na Pohorju
00050000-5649-e932-8c26-afefca855459	3272	Rimske Toplice
00050000-5649-e932-f8a5-23f06b04a361	1314	Rob
00050000-5649-e932-d83f-7e501c7a07dd	5215	Ročinj
00050000-5649-e932-ef47-bc7e19d8dd60	3250	Rogaška Slatina
00050000-5649-e932-fe91-84679325b888	9262	Rogašovci
00050000-5649-e932-dc51-450ffee56972	3252	Rogatec
00050000-5649-e932-6331-a2fd05f233fb	1373	Rovte
00050000-5649-e932-6ec7-ed31bc3d4b2a	2342	Ruše
00050000-5649-e932-bc35-f510283384a3	1282	Sava
00050000-5649-e932-4d2a-4b0c5f7f18e3	6333	Sečovlje/Sicciole
00050000-5649-e932-cdd4-5bfd868a75f1	4227	Selca
00050000-5649-e932-e85b-0a7d25f4d010	2352	Selnica ob Dravi
00050000-5649-e932-a78d-5d30c7d47f1b	8333	Semič
00050000-5649-e932-3498-d2fb1dd553cf	8281	Senovo
00050000-5649-e932-82c1-a9ffe5bd3de5	6224	Senožeče
00050000-5649-e932-904c-c735f3c7b1df	8290	Sevnica
00050000-5649-e932-e0cd-3b0d8f948518	6210	Sežana
00050000-5649-e932-95b7-527fb9a14fe7	2214	Sladki Vrh
00050000-5649-e932-1173-8f4418313b8b	5283	Slap ob Idrijci
00050000-5649-e932-7dc2-1c3e7d198a05	2380	Slovenj Gradec
00050000-5649-e932-cc3b-6bf858d70fc0	2310	Slovenska Bistrica
00050000-5649-e932-49f4-0b89a3c6e4c0	3210	Slovenske Konjice
00050000-5649-e932-098a-fe9ba1537f58	1216	Smlednik
00050000-5649-e932-3b75-68f5956bd374	5232	Soča
00050000-5649-e932-177b-2c9368333948	1317	Sodražica
00050000-5649-e932-f763-1bf710a31cf4	3335	Solčava
00050000-5649-e932-b92f-e614f91b32d0	5250	Solkan
00050000-5649-e932-16e3-53a825d784de	4229	Sorica
00050000-5649-e932-5553-b035adb460dc	4225	Sovodenj
00050000-5649-e932-8fd3-385bc45cd8d1	5281	Spodnja Idrija
00050000-5649-e932-8b3a-9c7fbdb3b9c4	2241	Spodnji Duplek
00050000-5649-e932-7c6d-bce84da25535	9245	Spodnji Ivanjci
00050000-5649-e932-0d7e-19bc449b4481	2277	Središče ob Dravi
00050000-5649-e932-f719-faeef7e88dae	4267	Srednja vas v Bohinju
00050000-5649-e932-798e-406a790af5ae	8256	Sromlje 
00050000-5649-e932-6ff6-3fd201a082d1	5224	Srpenica
00050000-5649-e932-5967-92cdda08179d	1242	Stahovica
00050000-5649-e932-0a2e-ce2d0b926467	1332	Stara Cerkev
00050000-5649-e932-2621-ca54b2980434	8342	Stari trg ob Kolpi
00050000-5649-e932-112a-cdfe68a38bcf	1386	Stari trg pri Ložu
00050000-5649-e932-2447-9da75440eb8a	2205	Starše
00050000-5649-e932-06a5-c2093deca984	2289	Stoperce
00050000-5649-e932-3e26-67cfc53bac7a	8322	Stopiče
00050000-5649-e932-e1b5-735830b18272	3206	Stranice
00050000-5649-e932-502b-f0e70265c510	8351	Straža
00050000-5649-e932-7569-152027437726	1313	Struge
00050000-5649-e932-8584-719da6e9c1ed	8293	Studenec
00050000-5649-e932-5931-7276dc5180d9	8331	Suhor
00050000-5649-e932-4b65-ce8dbe8599f7	2233	Sv. Ana v Slovenskih goricah
00050000-5649-e932-7480-e2108ecfb08f	2235	Sv. Trojica v Slovenskih goricah
00050000-5649-e932-0e48-f87a48552ec4	2353	Sveti Duh na Ostrem Vrhu
00050000-5649-e932-6c8a-1a7efaf0f189	9244	Sveti Jurij ob Ščavnici
00050000-5649-e932-c253-1705345711e7	3264	Sveti Štefan
00050000-5649-e932-036d-f6824f824175	2258	Sveti Tomaž
00050000-5649-e932-0690-c4434131164a	9204	Šalovci
00050000-5649-e932-c0e0-8bb0d3ce5c7f	5261	Šempas
00050000-5649-e932-895a-d9d3795f2ec6	5290	Šempeter pri Gorici
00050000-5649-e932-68df-99cbe7c8a3d0	3311	Šempeter v Savinjski dolini
00050000-5649-e932-321d-c1b8a019674a	4208	Šenčur
00050000-5649-e932-34b7-738e76724be2	2212	Šentilj v Slovenskih goricah
00050000-5649-e932-bbd1-7f2fdfc14761	8297	Šentjanž
00050000-5649-e932-1929-050654e186e4	2373	Šentjanž pri Dravogradu
00050000-5649-e932-980b-07b63a39d9ea	8310	Šentjernej
00050000-5649-e932-26f1-6b2aa6b9320c	3230	Šentjur
00050000-5649-e932-df94-4b9bb9d6227c	3271	Šentrupert
00050000-5649-e932-8a21-0b625ad043ba	8232	Šentrupert
00050000-5649-e932-9c9b-8a41a42a68af	1296	Šentvid pri Stični
00050000-5649-e932-86cb-bce2c10e2a12	8275	Škocjan
00050000-5649-e932-bbf8-a771c7d3f1aa	6281	Škofije
00050000-5649-e932-f9ac-9634b1561c19	4220	Škofja Loka
00050000-5649-e932-9124-a374b00958e7	3211	Škofja vas
00050000-5649-e932-d253-46ec0744254b	1291	Škofljica
00050000-5649-e932-5dd7-fee9f0b63010	6274	Šmarje
00050000-5649-e932-38ce-59adf36e273a	1293	Šmarje - Sap
00050000-5649-e932-67df-a759e6cd630e	3240	Šmarje pri Jelšah
00050000-5649-e932-2169-1ef51cd691f2	8220	Šmarješke Toplice
00050000-5649-e932-5f0b-5c1129c8a2cf	2315	Šmartno na Pohorju
00050000-5649-e932-e403-08ddd0edd2c1	3341	Šmartno ob Dreti
00050000-5649-e932-a0dd-31d3c372c7e8	3327	Šmartno ob Paki
00050000-5649-e932-fcbe-b8d71c701b68	1275	Šmartno pri Litiji
00050000-5649-e932-c163-1c5a12428776	2383	Šmartno pri Slovenj Gradcu
00050000-5649-e932-bbdc-a4e34cad9823	3201	Šmartno v Rožni dolini
00050000-5649-e932-d6f2-ac48e52adc5c	3325	Šoštanj
00050000-5649-e932-f4be-0d32f7b04b5f	6222	Štanjel
00050000-5649-e932-4508-0f6d070c4abb	3220	Štore
00050000-5649-e932-ec3f-7ec18e012b30	3304	Tabor
00050000-5649-e932-b4d9-c02f9fafcf30	3221	Teharje
00050000-5649-e932-8ce1-c7d81d81a406	9251	Tišina
00050000-5649-e932-28f9-fcadc9e50ac1	5220	Tolmin
00050000-5649-e932-6775-89d8db325ce1	3326	Topolšica
00050000-5649-e932-b52c-94cf007fc017	2371	Trbonje
00050000-5649-e932-9af4-1bfed8eff711	1420	Trbovlje
00050000-5649-e932-65c2-0ea80c5246f2	8231	Trebelno 
00050000-5649-e932-e402-e46c0be5087b	8210	Trebnje
00050000-5649-e932-405b-7fad8dbf6eb3	5252	Trnovo pri Gorici
00050000-5649-e932-f7a1-3b1688d50172	2254	Trnovska vas
00050000-5649-e932-27d4-55653d4c1343	1222	Trojane
00050000-5649-e932-e35c-9b99f2a1d72e	1236	Trzin
00050000-5649-e932-5267-707239c5985d	4290	Tržič
00050000-5649-e932-5628-3eb8cb51c643	8295	Tržišče
00050000-5649-e932-9367-bb810a1a98ae	1311	Turjak
00050000-5649-e932-13f0-05efa5bedf2c	9224	Turnišče
00050000-5649-e932-16f7-df4941600059	8323	Uršna sela
00050000-5649-e932-7f54-8f9223e3c6b6	1252	Vače
00050000-5649-e932-2131-eb4389ebbcb2	3320	Velenje 
00050000-5649-e932-ba26-8662dc11fe24	3322	Velenje - poštni predali
00050000-5649-e932-be64-bf6652d00830	8212	Velika Loka
00050000-5649-e932-380e-a127d12eb29c	2274	Velika Nedelja
00050000-5649-e932-2733-976650a3a189	9225	Velika Polana
00050000-5649-e932-5d4b-eebf2aac712b	1315	Velike Lašče
00050000-5649-e932-b62c-f7d209763dea	8213	Veliki Gaber
00050000-5649-e932-696b-e06be767672a	9241	Veržej
00050000-5649-e932-a41b-233b07dd5e0c	1312	Videm - Dobrepolje
00050000-5649-e932-dae2-82fe5c6ac642	2284	Videm pri Ptuju
00050000-5649-e932-f427-718bc1e0e7bc	8344	Vinica
00050000-5649-e932-451d-06fad2c797a3	5271	Vipava
00050000-5649-e932-c0a0-39f412f044f9	4212	Visoko
00050000-5649-e932-6db8-f739c9581f93	1294	Višnja Gora
00050000-5649-e932-3ea6-7eaff41fe0d3	3205	Vitanje
00050000-5649-e932-6e15-ae22cdba606f	2255	Vitomarci
00050000-5649-e932-156c-9ca05c9cb865	1217	Vodice
00050000-5649-e932-d2d1-ee674d5f4240	3212	Vojnik\t
00050000-5649-e932-8482-53938f1e996b	5293	Volčja Draga
00050000-5649-e932-26a5-58b0015966f9	2232	Voličina
00050000-5649-e932-f137-ae1b3a1ed617	3305	Vransko
00050000-5649-e932-4fc9-96f5dec552b1	6217	Vremski Britof
00050000-5649-e932-d01c-f68563724473	1360	Vrhnika
00050000-5649-e932-c2cd-3a54906cb3a4	2365	Vuhred
00050000-5649-e932-ae86-e05f6a704265	2367	Vuzenica
00050000-5649-e932-e43a-f5f6bf1a54fa	8292	Zabukovje 
00050000-5649-e932-af12-0eb8fcbc9ff7	1410	Zagorje ob Savi
00050000-5649-e932-909d-190f6295353c	1303	Zagradec
00050000-5649-e932-0676-f3e33636c8d3	2283	Zavrč
00050000-5649-e932-f9e5-e603974d8dba	8272	Zdole 
00050000-5649-e932-2d76-74e6e380fb8e	4201	Zgornja Besnica
00050000-5649-e932-1553-9ef90e95f395	2242	Zgornja Korena
00050000-5649-e932-aa58-1ce0a853b999	2201	Zgornja Kungota
00050000-5649-e932-9541-534f2be97850	2316	Zgornja Ložnica
00050000-5649-e932-0648-48b251f5bb55	2314	Zgornja Polskava
00050000-5649-e932-0480-e141cf617d66	2213	Zgornja Velka
00050000-5649-e932-8e06-cbf6330a319c	4247	Zgornje Gorje
00050000-5649-e932-8864-8ad397d68a35	4206	Zgornje Jezersko
00050000-5649-e932-80aa-8b80e218b3cb	2285	Zgornji Leskovec
00050000-5649-e932-0830-06e40d4cf15b	1432	Zidani Most
00050000-5649-e932-a700-160033386163	3214	Zreče
00050000-5649-e932-45f6-61e10912fd78	4209	Žabnica
00050000-5649-e932-0092-8eeb8317ba0c	3310	Žalec
00050000-5649-e932-e394-472306471352	4228	Železniki
00050000-5649-e932-36ab-498983f838fc	2287	Žetale
00050000-5649-e932-a3d8-a374225fe7cd	4226	Žiri
00050000-5649-e932-db88-94f2a9ac7031	4274	Žirovnica
00050000-5649-e932-1a2b-ca47b9eb8fed	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 27267646)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 27267222)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 27266970)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5649-e935-616d-9f1e66ee5d6d	00080000-5649-e935-644c-c7d70ad43e03	\N	00040000-5649-e933-fa3b-2ec79b4a266c	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5649-e935-6f20-1f85cf3da934	00080000-5649-e935-644c-c7d70ad43e03	\N	00040000-5649-e933-fa3b-2ec79b4a266c	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5649-e935-5587-a30e173156a2	00080000-5649-e935-beb9-ebc7fef97bad	\N	00040000-5649-e933-fa3b-2ec79b4a266c	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 27267114)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5649-e933-60e9-8f5b87ceb8f6	novo leto	1	1	\N	t
00430000-5649-e933-1bca-db46b86434e8	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5649-e933-d871-b3ec7ea9c7ab	dan upora proti okupatorju	27	4	\N	t
00430000-5649-e933-6550-1d300172504d	praznik dela	1	5	\N	t
00430000-5649-e933-83d5-c7186dcba5e8	praznik dela	2	5	\N	t
00430000-5649-e933-194e-18c92bf08257	dan Primoža Trubarja	8	6	\N	f
00430000-5649-e933-756c-cbcbb6d29fe4	dan državnosti	25	6	\N	t
00430000-5649-e933-3a4f-27c28ffc7b10	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5649-e933-59cd-08d6d86881eb	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5649-e933-b6c6-a2d6bcc0bb1f	dan suverenosti	25	10	\N	f
00430000-5649-e933-2f32-d2c9bec1655d	dan spomina na mrtve	1	11	\N	t
00430000-5649-e933-6de0-fe1239cca15e	dan Rudolfa Maistra	23	11	\N	f
00430000-5649-e933-af0d-fc8516024bb8	božič	25	12	\N	t
00430000-5649-e933-164f-53385d354d22	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5649-e933-ddda-b3d77c20f74d	Marijino vnebovzetje	15	8	\N	t
00430000-5649-e933-3926-ccb205fd91df	dan reformacije	31	10	\N	t
00430000-5649-e933-cbf1-6f2e18af069b	velikonočna nedelja	27	3	2016	t
00430000-5649-e933-d53d-28921d122169	velikonočna nedelja	16	4	2017	t
00430000-5649-e933-0be3-97125bd2b02d	velikonočna nedelja	1	4	2018	t
00430000-5649-e933-e802-c8cb727395a8	velikonočna nedelja	21	4	2019	t
00430000-5649-e933-e2b6-0f5aff3756db	velikonočna nedelja	12	4	2020	t
00430000-5649-e933-e0f8-15e27412768a	velikonočna nedelja	4	4	2021	t
00430000-5649-e933-b3c8-d7fc7692907a	velikonočna nedelja	17	4	2022	t
00430000-5649-e933-5704-af47738ee915	velikonočna nedelja	9	4	2023	t
00430000-5649-e933-71f3-92232a632704	velikonočna nedelja	31	3	2024	t
00430000-5649-e933-ae82-67094b175964	velikonočna nedelja	20	4	2025	t
00430000-5649-e933-1a9e-e4ef772aeeb9	velikonočna nedelja	5	4	2026	t
00430000-5649-e933-4454-1c7195e3fd97	velikonočna nedelja	28	3	2027	t
00430000-5649-e933-3677-a6fbb7fd9731	velikonočna nedelja	16	4	2028	t
00430000-5649-e933-e8ae-16c35ce8adc1	velikonočna nedelja	1	4	2029	t
00430000-5649-e933-74a6-ee2bcfe40375	velikonočna nedelja	21	4	2030	t
00430000-5649-e933-22ee-abf9ee951f24	velikonočni ponedeljek	28	3	2016	t
00430000-5649-e933-5af9-2f7f1de92cb3	velikonočni ponedeljek	17	4	2017	t
00430000-5649-e933-def2-792dee323ff9	velikonočni ponedeljek	2	4	2018	t
00430000-5649-e933-8db4-0491863026f3	velikonočni ponedeljek	22	4	2019	t
00430000-5649-e933-2df1-dc66f5d88186	velikonočni ponedeljek	13	4	2020	t
00430000-5649-e933-bfff-0e4ae995c73c	velikonočni ponedeljek	5	4	2021	t
00430000-5649-e933-e766-18860a8072bf	velikonočni ponedeljek	18	4	2022	t
00430000-5649-e933-a96c-a9de2d21397d	velikonočni ponedeljek	10	4	2023	t
00430000-5649-e933-e3b0-4e4fd94e4cff	velikonočni ponedeljek	1	4	2024	t
00430000-5649-e933-3c17-728544176a80	velikonočni ponedeljek	21	4	2025	t
00430000-5649-e933-f7c8-d12a5b7757f0	velikonočni ponedeljek	6	4	2026	t
00430000-5649-e933-9334-abde2e007e00	velikonočni ponedeljek	29	3	2027	t
00430000-5649-e933-17a6-87f3c435cb1e	velikonočni ponedeljek	17	4	2028	t
00430000-5649-e933-3363-f8fda82ce226	velikonočni ponedeljek	2	4	2029	t
00430000-5649-e933-c0d3-a9ba122178a5	velikonočni ponedeljek	22	4	2030	t
00430000-5649-e933-e539-a0558741b77f	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5649-e933-b6f8-834f5f6d4c97	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5649-e933-484f-f55738d88624	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5649-e933-837c-d7d2817a0ed9	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5649-e933-1d68-7f812dc3c776	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5649-e933-ad43-954edbf2088d	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5649-e933-fda8-b0086f11a13d	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5649-e933-1acf-403528f0ba99	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5649-e933-e1d7-c39269e15844	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5649-e933-03b0-511c7a864e57	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5649-e933-fd87-4c7f646c782b	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5649-e933-8f3c-f6e76733174d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5649-e933-f729-93468bd786dd	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5649-e933-aa52-189a2e1f7fb8	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5649-e933-2a90-4ec6e06e4a7d	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 27267074)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 27267086)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 27267234)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 27267660)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 27267670)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5649-e935-52ed-a46431dbb525	00080000-5649-e935-d727-13e3b53b6360	0987	AK
00190000-5649-e935-6bc1-56f899e4d7be	00080000-5649-e935-beb9-ebc7fef97bad	0989	AK
00190000-5649-e935-422a-6dd84a779311	00080000-5649-e935-b164-7e5724d51b06	0986	AK
00190000-5649-e935-0dae-9ed8df53f5d0	00080000-5649-e935-dffe-afb17931a803	0984	AK
00190000-5649-e935-d2f4-f80280099849	00080000-5649-e935-2106-7b5697e5bbef	0983	AK
00190000-5649-e935-d34c-7ddc91d4ba03	00080000-5649-e935-60da-3287f1e0d922	0982	AK
00190000-5649-e936-04ba-99ebab15dced	00080000-5649-e936-201e-aeefe1b34d5a	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 27267569)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5649-e935-e849-f1a705eab7d8	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 27267678)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 27267263)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5649-e934-b712-58fac693db78	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5649-e934-0789-4aba34cc872a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5649-e934-0f2f-35683c3c8bf8	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5649-e934-a1db-15f7f717d2b9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5649-e934-1c7b-d63475d509be	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5649-e934-6a42-ed8e16c9445c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5649-e934-ebc6-f1ca8ac6ffc5	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 27267207)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 27267197)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 27267408)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 27267338)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 27267048)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 27266810)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5649-e936-201e-aeefe1b34d5a	00010000-5649-e933-92e8-470b3ea7b2e6	2015-11-16 15:33:26	INS	a:0:{}
2	App\\Entity\\Option	00000000-5649-e936-484a-1a5032c7d934	00010000-5649-e933-92e8-470b3ea7b2e6	2015-11-16 15:33:26	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5649-e936-04ba-99ebab15dced	00010000-5649-e933-92e8-470b3ea7b2e6	2015-11-16 15:33:26	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 27267276)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 27266848)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5649-e933-b92e-1dc09c8e6038	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5649-e933-e2cd-703599738aa2	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5649-e933-8694-42d81575d8d6	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5649-e933-cbc8-ef0dc2e20d63	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5649-e933-2991-52598ef607f2	planer	Planer dogodkov v koledarju	t
00020000-5649-e933-ac5a-3e709d2fe68b	kadrovska	Kadrovska služba	t
00020000-5649-e933-d253-ac3b46325484	arhivar	Ažuriranje arhivalij	t
00020000-5649-e933-23c9-a4a9e1ceeb11	igralec	Igralec	t
00020000-5649-e933-837d-1d2aa042eb3f	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5649-e935-7bbb-2e267f294a5d	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5649-e935-d2e7-5af91d872e7f	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5649-e935-9ff4-a076d5561ec3	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5649-e935-804d-50723518e14d	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5649-e935-b085-de606ede0d69	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5649-e935-51d0-1de1a4bcb4db	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5649-e935-fdd1-ab56500bfdbd	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5649-e935-79c5-8b3a92932a44	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5649-e935-9fb9-c56b3f0cb7a0	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5649-e935-6090-18447e763862	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5649-e935-241f-b23ed56001fa	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5649-e935-dc59-22d39c027816	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5649-e935-3c71-b431af9249a9	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5649-e935-d47b-32ab38f15c6e	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5649-e935-c761-6812c83eac8e	Oseba-read	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3099 (class 0 OID 27266832)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5649-e933-7b3b-0c42f63ce3ee	00020000-5649-e933-8694-42d81575d8d6
00010000-5649-e933-92e8-470b3ea7b2e6	00020000-5649-e933-8694-42d81575d8d6
00010000-5649-e935-02f4-fc19f1a60f0a	00020000-5649-e935-7bbb-2e267f294a5d
00010000-5649-e935-3bdb-a735d8b25d54	00020000-5649-e935-d2e7-5af91d872e7f
00010000-5649-e935-3bdb-a735d8b25d54	00020000-5649-e935-51d0-1de1a4bcb4db
00010000-5649-e935-3bdb-a735d8b25d54	00020000-5649-e935-6090-18447e763862
00010000-5649-e935-3bdb-a735d8b25d54	00020000-5649-e935-dc59-22d39c027816
00010000-5649-e935-3bdb-a735d8b25d54	00020000-5649-e935-c761-6812c83eac8e
00010000-5649-e935-c199-321ba0a1c9de	00020000-5649-e935-9ff4-a076d5561ec3
00010000-5649-e935-c199-321ba0a1c9de	00020000-5649-e935-fdd1-ab56500bfdbd
00010000-5649-e935-c199-321ba0a1c9de	00020000-5649-e935-241f-b23ed56001fa
00010000-5649-e935-c199-321ba0a1c9de	00020000-5649-e935-3c71-b431af9249a9
00010000-5649-e935-6107-436d37c4191a	00020000-5649-e935-9ff4-a076d5561ec3
00010000-5649-e935-6107-436d37c4191a	00020000-5649-e935-fdd1-ab56500bfdbd
00010000-5649-e935-6107-436d37c4191a	00020000-5649-e935-9fb9-c56b3f0cb7a0
00010000-5649-e935-6107-436d37c4191a	00020000-5649-e935-241f-b23ed56001fa
00010000-5649-e935-6107-436d37c4191a	00020000-5649-e935-3c71-b431af9249a9
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-9ff4-a076d5561ec3
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-804d-50723518e14d
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-fdd1-ab56500bfdbd
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-79c5-8b3a92932a44
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-9fb9-c56b3f0cb7a0
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-51d0-1de1a4bcb4db
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-241f-b23ed56001fa
00010000-5649-e935-0224-233085628f1b	00020000-5649-e935-3c71-b431af9249a9
00010000-5649-e935-7593-b2d2623cc73d	00020000-5649-e935-d2e7-5af91d872e7f
00010000-5649-e935-7593-b2d2623cc73d	00020000-5649-e935-b085-de606ede0d69
00010000-5649-e935-7593-b2d2623cc73d	00020000-5649-e935-51d0-1de1a4bcb4db
00010000-5649-e935-7593-b2d2623cc73d	00020000-5649-e935-6090-18447e763862
00010000-5649-e935-7593-b2d2623cc73d	00020000-5649-e935-dc59-22d39c027816
00010000-5649-e935-7593-b2d2623cc73d	00020000-5649-e935-c761-6812c83eac8e
\.


--
-- TOC entry 3144 (class 0 OID 27267290)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 27267228)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 27267174)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5649-e935-17bd-852519cb0802	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5649-e935-765b-c2e3978dd331	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5649-e935-f0ce-e111c49ebff7	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 27266797)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5649-e932-8012-d973ebec1b4d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5649-e932-24ef-470481e65e1c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5649-e932-ac62-300aaf50a8c6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5649-e932-7e1c-21929282f71c	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5649-e932-4e78-58269e625446	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 27266789)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5649-e932-957e-223bb1336ff9	00230000-5649-e932-7e1c-21929282f71c	popa
00240000-5649-e932-99a6-3e012237f3fa	00230000-5649-e932-7e1c-21929282f71c	oseba
00240000-5649-e932-678f-49b123ac1705	00230000-5649-e932-7e1c-21929282f71c	tippopa
00240000-5649-e932-a068-3739e874a882	00230000-5649-e932-7e1c-21929282f71c	organizacijskaenota
00240000-5649-e932-6eb9-9c81731b5b51	00230000-5649-e932-7e1c-21929282f71c	sezona
00240000-5649-e932-90f6-430fbdcb73e8	00230000-5649-e932-7e1c-21929282f71c	tipvaje
00240000-5649-e932-8fa0-93389a5347d2	00230000-5649-e932-24ef-470481e65e1c	prostor
00240000-5649-e932-cd99-b6917d03341c	00230000-5649-e932-7e1c-21929282f71c	besedilo
00240000-5649-e932-e365-4d7d8f688e1c	00230000-5649-e932-7e1c-21929282f71c	uprizoritev
00240000-5649-e932-0db3-f849d6d623df	00230000-5649-e932-7e1c-21929282f71c	funkcija
00240000-5649-e932-eb2a-9056566c340a	00230000-5649-e932-7e1c-21929282f71c	tipfunkcije
00240000-5649-e932-fe51-2fcf09d379be	00230000-5649-e932-7e1c-21929282f71c	alternacija
00240000-5649-e932-f56c-aa75eb35799d	00230000-5649-e932-8012-d973ebec1b4d	pogodba
00240000-5649-e932-a56e-eea6242e62af	00230000-5649-e932-7e1c-21929282f71c	zaposlitev
00240000-5649-e932-3f76-641b9a5d55ef	00230000-5649-e932-7e1c-21929282f71c	zvrstuprizoritve
00240000-5649-e932-88ca-5143739164d9	00230000-5649-e932-8012-d973ebec1b4d	programdela
00240000-5649-e932-2286-c492eeb544b9	00230000-5649-e932-7e1c-21929282f71c	zapis
\.


--
-- TOC entry 3093 (class 0 OID 27266784)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cb8668b0-544a-420a-b1c8-8f5393227040	00240000-5649-e932-957e-223bb1336ff9	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 27267355)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5649-e935-a807-6a94c865ab03	000e0000-5649-e935-efe2-02f0dc4e4257	00080000-5649-e935-644c-c7d70ad43e03	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5649-e933-be33-2858dad3a2e8
00270000-5649-e935-dd0e-7d3314edc491	000e0000-5649-e935-efe2-02f0dc4e4257	00080000-5649-e935-644c-c7d70ad43e03	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5649-e933-be33-2858dad3a2e8
\.


--
-- TOC entry 3109 (class 0 OID 27266932)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 27267184)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5649-e935-6282-e0a946dcd58f	00180000-5649-e935-6348-82cb208442a1	000c0000-5649-e935-1827-7a0bd0b7d6f5	00090000-5649-e935-bb77-8404bcb0cef3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5649-e935-059a-a8d3681a1cbb	00180000-5649-e935-6348-82cb208442a1	000c0000-5649-e935-ceac-fc4224cbb8e7	00090000-5649-e935-8939-c41b3a11a450	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5649-e935-6382-c50851eb07af	00180000-5649-e935-6348-82cb208442a1	000c0000-5649-e935-7847-77f39f3a9394	00090000-5649-e935-b93b-03bee5e13272	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5649-e935-a584-b0a3079e373e	00180000-5649-e935-6348-82cb208442a1	000c0000-5649-e935-b9de-42a1d37194ac	00090000-5649-e935-ada8-a0dd42b4af58	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5649-e935-ece2-1cee6282b522	00180000-5649-e935-6348-82cb208442a1	000c0000-5649-e935-dd7d-43e97646813b	00090000-5649-e935-78c3-6b05bbe0fdd7	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5649-e935-aa1a-b73b40e44738	00180000-5649-e935-71d3-c95d755f2be7	\N	00090000-5649-e935-78c3-6b05bbe0fdd7	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5649-e935-6dce-fdef07166180	00180000-5649-e935-71d3-c95d755f2be7	\N	00090000-5649-e935-8939-c41b3a11a450	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 27267396)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5649-e932-7bc0-20a22d9f5125	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5649-e932-60c9-24e7e2161303	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5649-e932-aca6-6df78e2551f3	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5649-e932-2ebd-00f887b84c27	04	Režija	Režija	Režija	umetnik	30
000f0000-5649-e932-2d0c-693a4c7be5fa	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5649-e932-e46e-ce88490ff691	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5649-e932-1d63-bcae910d5ad7	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5649-e932-239b-a89493634539	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5649-e932-6588-899b63a26415	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5649-e932-cecd-b9be65bef56b	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5649-e932-b954-c0b088e37358	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5649-e932-196e-aeec5ee431e6	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5649-e932-ee38-e46e672cfb86	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5649-e932-a2ee-2f834e4ac599	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5649-e932-a355-c0b56c2d024d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5649-e932-5291-1f187cdee3c1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5649-e932-abcf-9e5178406444	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5649-e932-7e9c-435e8c1dd21f	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 27266883)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5649-e934-e596-1cd366aba912	0001	šola	osnovna ali srednja šola
00400000-5649-e934-290d-08d54c050f08	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5649-e934-d106-9d86eca530fd	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 27267689)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5649-e932-6cf7-e16509189f71	01	Velika predstava	f	1.00	1.00
002b0000-5649-e932-77dd-9307986bf417	02	Mala predstava	f	0.50	0.50
002b0000-5649-e932-abb9-39ddc8975e16	03	Mala koprodukcija	t	0.40	1.00
002b0000-5649-e932-a2e2-853d8ae418c3	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5649-e932-0d8e-7bdbefb38d98	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 27267164)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5649-e932-d735-a3726fded22e	0001	prva vaja	prva vaja
00420000-5649-e932-3d04-41c967e9e9f0	0002	tehnična vaja	tehnična vaja
00420000-5649-e932-02da-023640a5ece6	0003	lučna vaja	lučna vaja
00420000-5649-e932-c72b-d941b42714f5	0004	kostumska vaja	kostumska vaja
00420000-5649-e932-a7d2-11026e148206	0005	foto vaja	foto vaja
00420000-5649-e932-d4f9-5b44d4674c85	0006	1. glavna vaja	1. glavna vaja
00420000-5649-e932-c7b8-fa2a828a9129	0007	2. glavna vaja	2. glavna vaja
00420000-5649-e932-2623-11bf9bf643bb	0008	1. generalka	1. generalka
00420000-5649-e932-5823-4ffdb4244ebe	0009	2. generalka	2. generalka
00420000-5649-e932-c9e6-abf9f9758fcc	0010	odprta generalka	odprta generalka
00420000-5649-e932-409a-c44889a20ce2	0011	obnovitvena vaja	obnovitvena vaja
00420000-5649-e932-e52e-2231787c765d	0012	pevska vaja	pevska vaja
00420000-5649-e932-642c-5d65a44a9c9c	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5649-e932-0862-4323e132284f	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 27267005)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 27266819)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5649-e933-92e8-470b3ea7b2e6	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROm2jYVxkZ5BcUJ5DErWp7DYEgkEUZQ96	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5649-e935-f83b-cdd896172a41	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5649-e935-6d4f-65c0fa4f8f53	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5649-e935-df70-ecb307823571	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5649-e935-4b3a-d39261198c70	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5649-e935-c510-762c5b289421	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5649-e935-eace-7180d56ac4e1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5649-e935-7214-375073b191e6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5649-e935-dbaa-456667590074	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5649-e935-2dae-cfa41025f9bd	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5649-e935-02f4-fc19f1a60f0a	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5649-e935-3066-fff43d83f85f	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5649-e935-3bdb-a735d8b25d54	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5649-e935-c199-321ba0a1c9de	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5649-e935-6107-436d37c4191a	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5649-e935-0224-233085628f1b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5649-e935-7593-b2d2623cc73d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5649-e933-7b3b-0c42f63ce3ee	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 27267446)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5649-e935-18ba-265620fd0e04	00160000-5649-e934-ce5a-cdd559647f61	\N	00140000-5649-e932-b547-40680cd422f2	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5649-e934-1c7b-d63475d509be
000e0000-5649-e935-efe2-02f0dc4e4257	00160000-5649-e934-310b-9aced8986f6c	\N	00140000-5649-e932-e3d9-af205f7a6a5c	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5649-e934-6a42-ed8e16c9445c
000e0000-5649-e935-4dd6-6e5716d5d963	\N	\N	00140000-5649-e932-e3d9-af205f7a6a5c	00190000-5649-e935-52ed-a46431dbb525	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5649-e934-1c7b-d63475d509be
000e0000-5649-e935-90a5-21cbc0ff3b6b	\N	\N	00140000-5649-e932-e3d9-af205f7a6a5c	00190000-5649-e935-52ed-a46431dbb525	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5649-e934-1c7b-d63475d509be
000e0000-5649-e935-1f88-c0beec410ba8	\N	\N	00140000-5649-e932-e3d9-af205f7a6a5c	00190000-5649-e935-52ed-a46431dbb525	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5649-e934-b712-58fac693db78
000e0000-5649-e935-cd99-101ac027b9cf	\N	\N	00140000-5649-e932-e3d9-af205f7a6a5c	00190000-5649-e935-52ed-a46431dbb525	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5649-e934-b712-58fac693db78
\.


--
-- TOC entry 3123 (class 0 OID 27267104)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5649-e935-5eff-19ff270bfa3e	\N	000e0000-5649-e935-efe2-02f0dc4e4257	1	
00200000-5649-e935-b558-c038fe6f39e9	\N	000e0000-5649-e935-efe2-02f0dc4e4257	2	
00200000-5649-e935-b72d-dad6eb2df3a4	\N	000e0000-5649-e935-efe2-02f0dc4e4257	3	
00200000-5649-e935-d72f-10d013cff6c7	\N	000e0000-5649-e935-efe2-02f0dc4e4257	4	
00200000-5649-e935-485b-611093ec23ab	\N	000e0000-5649-e935-efe2-02f0dc4e4257	5	
\.


--
-- TOC entry 3140 (class 0 OID 27267255)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 27267369)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5649-e933-6d8d-79ecaae8869b	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5649-e933-6f9a-d8cc62b54da7	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5649-e933-b5e9-befba4da64ea	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5649-e933-a548-943683155ca8	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5649-e933-a6bf-4989725df9f0	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5649-e933-f98a-2eda6b539c26	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5649-e933-c280-1735a5e085f0	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5649-e933-6bf9-fef0dd034096	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5649-e933-be33-2858dad3a2e8	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5649-e933-0bde-2db75e207893	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5649-e933-d4bf-8ba743084cc9	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5649-e933-c219-8376a715e66e	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5649-e933-42ec-0989ac089016	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5649-e933-cdfa-f5d7ad133b63	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5649-e933-837c-b509ce143efd	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5649-e933-325a-21d992db7211	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5649-e933-e5fb-97d84f279f34	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5649-e933-8059-381f4d8d4bb5	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5649-e933-80f6-447de6b88879	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5649-e933-d61d-f35b0b295f0a	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5649-e933-71fe-592675fe2791	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5649-e933-a1c8-a371db5ffe55	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5649-e933-2285-eb0a5a17fbbb	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5649-e933-9cd9-49fcc544b802	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5649-e933-4755-f0b9682b0973	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5649-e933-0a7b-6393caaf54ac	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5649-e933-cf20-bd2f9cce942c	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5649-e933-b1a9-c6dace383a6e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 27267739)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 27267708)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 27267751)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 27267327)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5649-e935-d7e6-86803d04d21a	00090000-5649-e935-8939-c41b3a11a450	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5649-e935-c020-1a436e450015	00090000-5649-e935-b93b-03bee5e13272	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5649-e935-1fd5-22828be71e99	00090000-5649-e935-1971-ebe65377079c	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5649-e935-2f41-9f29f2977cfe	00090000-5649-e935-6574-640a5f946730	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5649-e935-c7f4-cb93ef04e6f4	00090000-5649-e935-eb1b-61d79f40dfac	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5649-e935-d052-08b0bf159d0e	00090000-5649-e935-c0a9-f12490919313	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 27267148)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 27267436)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5649-e932-b547-40680cd422f2	01	Drama	drama (SURS 01)
00140000-5649-e932-a16d-70711bbc7fdd	02	Opera	opera (SURS 02)
00140000-5649-e932-f143-df02b996ba9d	03	Balet	balet (SURS 03)
00140000-5649-e932-89ba-12536f75e63e	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5649-e932-7f8d-23b81c6d10e5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5649-e932-e3d9-af205f7a6a5c	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5649-e932-e0c2-1f4bb389c471	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 27267317)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 27266882)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 27267495)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 27267485)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 27266873)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 27267352)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 27267394)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 27267792)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 27267136)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 27267158)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 27267163)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 27267706)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 27267031)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 27267563)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 27267313)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 27267102)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 27267069)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 27267045)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 27267220)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 27267769)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 27267776)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 27267800)
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
-- TOC entry 2726 (class 2606 OID 27267247)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 27267003)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 27266901)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 27266965)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 27266928)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 27266862)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 27266847)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 27267253)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 27267289)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 27267431)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 27266956)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 27266991)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 27267658)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 27267226)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 27266981)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 27267121)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 27267090)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 27267082)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 27267238)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 27267667)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 27267675)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 27267645)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 27267687)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 27267271)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 27267211)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 27267202)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 27267418)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 27267345)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 27267057)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 27266818)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 27267280)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 27266836)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 27266856)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 27267298)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 27267233)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 27267182)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 27266806)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 27266794)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 27266788)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 27267365)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 27266937)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 27267193)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 27267405)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 27266890)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 27267699)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 27267171)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 27267016)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 27266831)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 27267464)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 27267111)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 27267261)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 27267377)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 27267749)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 27267733)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 27267757)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 27267335)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 27267152)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 27267444)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 27267325)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 27267146)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 27267147)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 27267145)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 27267144)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 27267143)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 27267366)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 27267367)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 27267368)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 27267771)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 27267770)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 27266958)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 27266959)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 27267254)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 27267737)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 27267736)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 27267738)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 27267735)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 27267734)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 27267240)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 27267239)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 27267112)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 27267113)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 27267314)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 27267316)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 27267315)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 27267047)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 27267046)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 27267688)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 27267433)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 27267434)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 27267435)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 27267758)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 27267469)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 27267466)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 27267470)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 27267468)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 27267467)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 27267018)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 27267017)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 27266931)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 27267281)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 27266863)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 27266864)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 27267301)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 27267300)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 27267299)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 27266968)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 27266967)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 27266969)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 27267085)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 27267083)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 27267084)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 27266796)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 27267206)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 27267204)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 27267203)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 27267205)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 27266837)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 27266838)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 27267262)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 27267793)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 27267354)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 27267353)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 27267801)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 27267802)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 27267227)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 27267346)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 27267347)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 27267568)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 27267567)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 27267564)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 27267565)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 27267566)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 27266983)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 27266982)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 27266984)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 27267275)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 27267274)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 27267668)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 27267669)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 27267499)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 27267500)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 27267497)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 27267498)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 27267336)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 27267337)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 27267215)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 27267214)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 27267212)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 27267213)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 27267487)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 27267486)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 27267058)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 27267072)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 27267071)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 27267070)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 27267073)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 27267103)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 27267091)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 27267092)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 27267659)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 27267707)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 27267777)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 27267778)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 27266903)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 27266902)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 27266938)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 27266939)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 27267153)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 27267196)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 27267195)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 27267194)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 27267138)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 27267139)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 27267142)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 27267137)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 27267141)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 27267140)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 27266957)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 27266891)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 27266892)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 27267032)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 27267034)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 27267033)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 27267035)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 27267221)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 27267432)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 27267465)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 27267406)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 27267407)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 27266929)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 27266930)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 27267326)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 27266807)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 27267004)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 27266966)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 27266795)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 27267700)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 27267273)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 27267272)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 27267172)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 27267173)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 27267496)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 27266992)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 27267445)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 27267750)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 27267676)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 27267677)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 27267395)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 27267183)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 27266857)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 27267973)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 27267978)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 27268003)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 27267993)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 27267968)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 27267988)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 27267998)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 27267983)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 27268173)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 27268178)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 27268183)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 27268348)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 27268343)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 27267858)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 27267863)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 27268088)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 27268328)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 27268323)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 27268333)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 27268318)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 27268313)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 27268083)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 27268078)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 27267958)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 27267963)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 27268128)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 27268138)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 27268133)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 27267913)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 27267908)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 27268068)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 27268303)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 27268188)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 27268193)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 27268198)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 27268338)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 27268218)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 27268203)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 27268223)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 27268213)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 27268208)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 27267903)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 27267898)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 27267843)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 27267838)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 27268108)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 27267818)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 27267823)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 27268123)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 27268118)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 27268113)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 27267873)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 27267868)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 27267878)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 27267938)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 27267928)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 27267933)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 27267803)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 27268043)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 27268033)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 27268028)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 27268038)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 27267808)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 27267813)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 27268093)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 27268363)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 27268168)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 27268163)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 27268368)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 27268373)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 27268073)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 27268153)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 27268158)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 27268278)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 27268273)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 27268258)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 27268263)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 27268268)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 27267888)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 27267883)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 27267893)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 27268103)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 27268098)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 27268288)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 27268293)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 27268248)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 27268253)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 27268238)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 27268243)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 27268143)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 27268148)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 27268063)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 27268058)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 27268048)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 27268053)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 27268233)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 27268228)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 27267918)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 27267923)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 27267953)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 27267943)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 27267948)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 27268283)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 27268298)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 27268308)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 27268353)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 27268358)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 27267833)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 27267828)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 27267848)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 27267853)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 27268008)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 27268023)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 27268018)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 27268013)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-16 15:33:28 CET

--
-- PostgreSQL database dump complete
--

