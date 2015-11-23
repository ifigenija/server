--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-23 17:31:30 CET

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
-- TOC entry 183 (class 1259 OID 29287681)
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
-- TOC entry 237 (class 1259 OID 29288295)
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
-- TOC entry 236 (class 1259 OID 29288278)
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
-- TOC entry 182 (class 1259 OID 29287674)
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
-- TOC entry 181 (class 1259 OID 29287672)
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
-- TOC entry 227 (class 1259 OID 29288155)
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
-- TOC entry 230 (class 1259 OID 29288185)
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
-- TOC entry 251 (class 1259 OID 29288586)
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
-- TOC entry 203 (class 1259 OID 29287929)
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
-- TOC entry 205 (class 1259 OID 29287961)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 29287966)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 29288508)
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
-- TOC entry 194 (class 1259 OID 29287826)
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
-- TOC entry 238 (class 1259 OID 29288308)
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
-- TOC entry 223 (class 1259 OID 29288109)
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
-- TOC entry 200 (class 1259 OID 29287900)
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
-- TOC entry 197 (class 1259 OID 29287866)
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
-- TOC entry 195 (class 1259 OID 29287843)
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
-- TOC entry 212 (class 1259 OID 29288023)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 29288566)
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
-- TOC entry 250 (class 1259 OID 29288579)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 29288601)
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
-- TOC entry 216 (class 1259 OID 29288048)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 29287800)
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
-- TOC entry 185 (class 1259 OID 29287700)
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
-- TOC entry 189 (class 1259 OID 29287767)
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
-- TOC entry 186 (class 1259 OID 29287711)
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
-- TOC entry 178 (class 1259 OID 29287646)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 29287665)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 29288055)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 29288089)
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
-- TOC entry 233 (class 1259 OID 29288226)
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
-- TOC entry 188 (class 1259 OID 29287747)
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
-- TOC entry 191 (class 1259 OID 29287792)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 29288453)
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
-- TOC entry 213 (class 1259 OID 29288029)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 29287777)
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
-- TOC entry 202 (class 1259 OID 29287921)
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
-- TOC entry 198 (class 1259 OID 29287881)
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
-- TOC entry 199 (class 1259 OID 29287893)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 29288041)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 29288467)
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
-- TOC entry 242 (class 1259 OID 29288477)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 29288376)
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
-- TOC entry 243 (class 1259 OID 29288485)
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
-- TOC entry 219 (class 1259 OID 29288070)
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
-- TOC entry 211 (class 1259 OID 29288014)
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
-- TOC entry 210 (class 1259 OID 29288004)
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
-- TOC entry 232 (class 1259 OID 29288215)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 29288145)
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
-- TOC entry 196 (class 1259 OID 29287855)
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
-- TOC entry 175 (class 1259 OID 29287617)
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
-- TOC entry 174 (class 1259 OID 29287615)
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
-- TOC entry 220 (class 1259 OID 29288083)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 29287655)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 29287639)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 29288097)
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
-- TOC entry 214 (class 1259 OID 29288035)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 29287981)
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
-- TOC entry 173 (class 1259 OID 29287604)
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
-- TOC entry 172 (class 1259 OID 29287596)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 29287591)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 29288162)
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
-- TOC entry 187 (class 1259 OID 29287739)
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
-- TOC entry 209 (class 1259 OID 29287991)
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
-- TOC entry 231 (class 1259 OID 29288203)
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
-- TOC entry 184 (class 1259 OID 29287690)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 29288496)
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
-- TOC entry 207 (class 1259 OID 29287971)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 29287812)
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
-- TOC entry 176 (class 1259 OID 29287626)
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
-- TOC entry 235 (class 1259 OID 29288253)
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
-- TOC entry 201 (class 1259 OID 29287911)
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
-- TOC entry 218 (class 1259 OID 29288062)
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
-- TOC entry 229 (class 1259 OID 29288176)
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
-- TOC entry 247 (class 1259 OID 29288546)
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
-- TOC entry 246 (class 1259 OID 29288515)
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
-- TOC entry 248 (class 1259 OID 29288558)
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
-- TOC entry 225 (class 1259 OID 29288134)
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
-- TOC entry 204 (class 1259 OID 29287955)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 29288243)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 29288124)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 29287677)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 29287620)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 29287681)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5653-3f5e-72bd-98664889e9b7	10	30	Otroci	Abonma za otroke	200
000a0000-5653-3f5e-74c3-8405253a5b6a	20	60	Mladina	Abonma za mladino	400
000a0000-5653-3f5e-d7a3-1c93eccaab73	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 29288295)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5653-3f5f-3be0-57105d708396	000d0000-5653-3f5e-a095-bc85812ae48b	\N	00090000-5653-3f5e-ca6d-fcd477964ced	000b0000-5653-3f5e-2464-56d52a9a11b2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5653-3f5f-390a-2dec88d8ed72	000d0000-5653-3f5e-c371-8d486438156d	00100000-5653-3f5e-957f-dc5bf28e77c7	00090000-5653-3f5e-99a3-4d7b9febc2b3	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5653-3f5f-8c37-d5bd9af5120d	000d0000-5653-3f5e-9e40-35435894d6c7	00100000-5653-3f5e-a6b2-42ddf0f006cf	00090000-5653-3f5e-c2e3-13c2c27e228f	\N	0003	t	\N	2015-11-23	\N	2	t	\N	f	f
000c0000-5653-3f5f-6daf-696bae31f155	000d0000-5653-3f5e-93db-d23d0cd4cb7c	\N	00090000-5653-3f5e-48ab-7ee39d6a0d48	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5653-3f5f-0204-e6737ca69b5c	000d0000-5653-3f5e-c7b6-2e9289f14ae3	\N	00090000-5653-3f5e-74c8-ed5fb36a3a49	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5653-3f5f-bac0-7ec180ce137b	000d0000-5653-3f5e-5a75-ed2cc751141f	\N	00090000-5653-3f5e-2c6d-a09730a92b25	000b0000-5653-3f5e-7368-ad047575fa4d	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5653-3f5f-195f-8a9c5e184c4a	000d0000-5653-3f5e-f8ea-93bc53ad0bdc	00100000-5653-3f5e-da1d-68e69d287757	00090000-5653-3f5e-6c3e-10529a8f062e	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5653-3f5f-9114-f26909f14dfb	000d0000-5653-3f5e-eda2-aa134556437c	\N	00090000-5653-3f5e-13ae-b404b5e953f1	000b0000-5653-3f5e-6d40-1127f1f77ca5	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5653-3f5f-be50-e4e39af3eeaf	000d0000-5653-3f5e-f8ea-93bc53ad0bdc	00100000-5653-3f5e-f640-d8184b9574a1	00090000-5653-3f5e-e35a-3af4a18391f9	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5653-3f5f-e79f-9359bcc9d780	000d0000-5653-3f5e-f8ea-93bc53ad0bdc	00100000-5653-3f5e-8448-2f869b51a55a	00090000-5653-3f5e-d890-2902b77f238f	\N	0010	t	\N	2015-11-23	\N	16	f	\N	f	t
000c0000-5653-3f5f-b80d-70f4a620fbf1	000d0000-5653-3f5e-f8ea-93bc53ad0bdc	00100000-5653-3f5e-a33c-90a209ddf7a6	00090000-5653-3f5e-aa6a-99f14f7eb95e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5653-3f5f-5f7a-ca51c0aa4258	000d0000-5653-3f5e-a072-13fcdc177841	00100000-5653-3f5e-957f-dc5bf28e77c7	00090000-5653-3f5e-99a3-4d7b9febc2b3	000b0000-5653-3f5e-187c-ea76a6dc1f27	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 29288278)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 29287674)
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
-- TOC entry 3149 (class 0 OID 29288155)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5653-3f5e-d82f-a548ad97c808	00160000-5653-3f5e-ef2b-e2413c7087fd	00090000-5653-3f5e-7fc0-db044c507031	aizv	10	t
003d0000-5653-3f5e-d127-ecc6861e53de	00160000-5653-3f5e-ef2b-e2413c7087fd	00090000-5653-3f5e-3f33-41a73412378e	apri	14	t
003d0000-5653-3f5e-8c7d-035373b05ff0	00160000-5653-3f5e-e49d-a9a138f96854	00090000-5653-3f5e-e73a-24f1f3002e40	aizv	11	t
003d0000-5653-3f5e-81d1-9d67723b0f31	00160000-5653-3f5e-edc2-53b07e08c947	00090000-5653-3f5e-7655-2d9dde2f3e2a	aizv	12	t
003d0000-5653-3f5e-25d9-6039d8a943b7	00160000-5653-3f5e-ef2b-e2413c7087fd	00090000-5653-3f5e-5cfe-8d2305d44c15	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 29288185)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5653-3f5e-ef2b-e2413c7087fd	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5653-3f5e-e49d-a9a138f96854	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5653-3f5e-edc2-53b07e08c947	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 29288586)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 29287929)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5653-3f5f-7d81-21c602ed2c3d	\N	\N	00200000-5653-3f5e-8bc3-aefc6389bee3	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5653-3f5f-2a17-5608bb1b616a	\N	\N	00200000-5653-3f5f-8c08-052b857285a5	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5653-3f5f-e8e9-59bfd28d2ff4	\N	\N	00200000-5653-3f5f-904c-664ad42565e6	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5653-3f5f-2cb7-147a5e0dd83d	\N	\N	00200000-5653-3f5f-f61c-53ffc0ad34fe	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5653-3f5f-5367-3ff777976e99	\N	\N	00200000-5653-3f5f-ae34-ee2a372e355b	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 29287961)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 29287966)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 29288508)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 29287826)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5653-3f5c-9e90-cd12ef5fba9a	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5653-3f5c-36c9-73fb30135ec5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5653-3f5c-19aa-e19a819a00ff	AL	ALB	008	Albania 	Albanija	\N
00040000-5653-3f5c-3064-6382fcb963ce	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5653-3f5c-3ce0-f1bc0be626fd	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5653-3f5c-c16a-9426621478db	AD	AND	020	Andorra 	Andora	\N
00040000-5653-3f5c-c8af-eb615107ede4	AO	AGO	024	Angola 	Angola	\N
00040000-5653-3f5c-c378-7075199d0dc5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5653-3f5c-4ceb-c858bd283342	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5653-3f5c-3c9d-b7c118c4679e	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5653-3f5c-c922-c113b3206cd7	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5653-3f5c-cd6f-47f44e7431ef	AM	ARM	051	Armenia 	Armenija	\N
00040000-5653-3f5c-8561-a68f3db224fb	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5653-3f5c-4a43-4dfcaeee7125	AU	AUS	036	Australia 	Avstralija	\N
00040000-5653-3f5c-2b01-8e4618da6b45	AT	AUT	040	Austria 	Avstrija	\N
00040000-5653-3f5c-3afc-d929a0ef7514	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5653-3f5c-74f8-d63bd2959dd2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5653-3f5c-8cc4-3df07720bd1c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5653-3f5c-e610-5bc4670f6953	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5653-3f5c-e24e-1717b930fe2b	BB	BRB	052	Barbados 	Barbados	\N
00040000-5653-3f5c-ab74-3c4bb5243f8c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5653-3f5c-3ae0-e192367e27de	BE	BEL	056	Belgium 	Belgija	\N
00040000-5653-3f5c-a678-fcfb6fc1db86	BZ	BLZ	084	Belize 	Belize	\N
00040000-5653-3f5c-0a70-ab6969c6f863	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5653-3f5c-cef0-89939ec87fe0	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5653-3f5c-70be-5cc302bb076d	BT	BTN	064	Bhutan 	Butan	\N
00040000-5653-3f5c-f785-1f26eedfc4cd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5653-3f5c-a51c-3945050345a3	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5653-3f5c-5311-93976cbff923	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5653-3f5c-30d1-485317c100b4	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5653-3f5c-f23d-4955de6f3497	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5653-3f5c-3e0f-73be2c6b0250	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5653-3f5c-5f91-b2566d4e5dbb	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5653-3f5c-864a-8e9c32a50e48	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5653-3f5c-7efd-ac19e33b9602	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5653-3f5c-991f-931d9a610a56	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5653-3f5c-f5fa-9a3628d89aca	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5653-3f5c-1d19-92287a938ebc	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5653-3f5c-7e79-fd0f25270ea1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5653-3f5c-27c9-698999f4b4b6	CA	CAN	124	Canada 	Kanada	\N
00040000-5653-3f5c-ee5a-ade11a3b8758	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5653-3f5c-01e3-051fed461f50	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5653-3f5c-17af-4061a1ca044d	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5653-3f5c-1b07-aeb1eb945f14	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5653-3f5c-04f9-264202a0e6f3	CL	CHL	152	Chile 	Čile	\N
00040000-5653-3f5c-9439-1687b92636a2	CN	CHN	156	China 	Kitajska	\N
00040000-5653-3f5c-1e77-12eeff009e72	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5653-3f5c-0fab-792fbeb7c756	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5653-3f5c-ba30-92d6da76a9ad	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5653-3f5c-3bd9-9f1b666c4ac6	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5653-3f5c-dfea-a6cfa01538c8	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5653-3f5c-36e5-200102a89ce0	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5653-3f5c-b132-4a736275b502	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5653-3f5c-32e4-3d819ff6cd13	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5653-3f5c-6bc9-d4555fb8f709	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5653-3f5c-6f03-58030b515b49	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5653-3f5c-5a4a-a1d80ec5d255	CU	CUB	192	Cuba 	Kuba	\N
00040000-5653-3f5c-f411-f664570283d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5653-3f5c-4ea4-986e7b5f0e43	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5653-3f5c-02ee-3e38b9709711	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5653-3f5c-b62a-02012f423c55	DK	DNK	208	Denmark 	Danska	\N
00040000-5653-3f5c-5e59-cbabb704b3dd	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5653-3f5c-ee3e-ad40745b4c4d	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5653-3f5c-ecbe-61edfa7f46e0	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5653-3f5c-6bb4-da9dc35bd358	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5653-3f5c-5e41-77c7e6514a27	EG	EGY	818	Egypt 	Egipt	\N
00040000-5653-3f5c-b434-a7e77c6d00bc	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5653-3f5c-e511-0664c01f0590	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5653-3f5c-53db-9c1e0ddfc4b4	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5653-3f5c-f669-e0507980010e	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5653-3f5c-59a8-0930fc1d3ee0	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5653-3f5c-f4bd-abc29588a767	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5653-3f5c-4809-9ec689ac33c4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5653-3f5c-2d36-e2f98480dfd9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5653-3f5c-de42-38c0e0ea9828	FI	FIN	246	Finland 	Finska	\N
00040000-5653-3f5c-b820-a04cc86250f1	FR	FRA	250	France 	Francija	\N
00040000-5653-3f5c-56b2-0828aab32b74	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5653-3f5c-ae15-0b28bfda545c	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5653-3f5c-7024-0b7bbb42f856	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5653-3f5c-9e45-8aad74294353	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5653-3f5c-8e38-2810260d7c8e	GA	GAB	266	Gabon 	Gabon	\N
00040000-5653-3f5c-3afc-18dc551e815b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5653-3f5c-d57f-e6f3f49ba6c7	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5653-3f5c-770a-f127d0fed9b0	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5653-3f5c-907c-dbb52912dbae	GH	GHA	288	Ghana 	Gana	\N
00040000-5653-3f5c-28c1-9f6a52f59799	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5653-3f5c-468a-153d7f54bd40	GR	GRC	300	Greece 	Grčija	\N
00040000-5653-3f5c-ffb1-4865b410d1c7	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5653-3f5c-e34b-e17b5b8ae7b2	GD	GRD	308	Grenada 	Grenada	\N
00040000-5653-3f5c-4104-f37863e08003	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5653-3f5c-b23c-629ebd304d82	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5653-3f5c-0cda-de974103e868	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5653-3f5c-154e-a3bbe0c19736	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5653-3f5c-c327-07093cd1496f	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5653-3f5c-6dfe-97e1a03ef837	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5653-3f5c-bc65-ac85fb49e071	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5653-3f5c-89b7-246fea318efe	HT	HTI	332	Haiti 	Haiti	\N
00040000-5653-3f5c-c0d2-4a2ebeb4d69b	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5653-3f5c-283f-8e9b5b5208b0	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5653-3f5c-6502-001c011feae2	HN	HND	340	Honduras 	Honduras	\N
00040000-5653-3f5c-0c3b-ea0077895897	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5653-3f5c-aebf-306a76c268c8	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5653-3f5c-ed77-f38d9c45b52b	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5653-3f5c-91f9-b332affb13c4	IN	IND	356	India 	Indija	\N
00040000-5653-3f5c-59c6-6d6450e67dc5	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5653-3f5c-5b97-a5ae279a520d	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5653-3f5c-dbee-3acb766533c6	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5653-3f5c-f50a-11f1127527cb	IE	IRL	372	Ireland 	Irska	\N
00040000-5653-3f5c-0461-c2208609dd84	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5653-3f5c-4ea3-a740f77e64d8	IL	ISR	376	Israel 	Izrael	\N
00040000-5653-3f5c-6134-96cbca4b465c	IT	ITA	380	Italy 	Italija	\N
00040000-5653-3f5c-ea66-ac69fbacd7b4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5653-3f5c-393b-2b4856865bc0	JP	JPN	392	Japan 	Japonska	\N
00040000-5653-3f5c-3895-dbd8fdb5c478	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5653-3f5c-2993-2793faf56bca	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5653-3f5c-5473-afd8edd029d2	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5653-3f5c-54b9-3d3de4b48bb6	KE	KEN	404	Kenya 	Kenija	\N
00040000-5653-3f5c-a933-ffd57e2f87da	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5653-3f5c-c8e5-3b3be3f6aa69	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5653-3f5c-13e7-addfb673d59c	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5653-3f5c-1854-a3eebf7a5c2d	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5653-3f5c-ca52-9e221b658e7a	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5653-3f5c-8a3b-8e6a25dba952	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5653-3f5c-aae0-25f097bd165c	LV	LVA	428	Latvia 	Latvija	\N
00040000-5653-3f5c-00a9-44ec96150800	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5653-3f5c-d0b4-bbc81a55d799	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5653-3f5c-b84d-718486b3bb53	LR	LBR	430	Liberia 	Liberija	\N
00040000-5653-3f5c-e312-76e2269b0f16	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5653-3f5c-6733-714a0c90e2d2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5653-3f5c-bbc5-1f5a25049a31	LT	LTU	440	Lithuania 	Litva	\N
00040000-5653-3f5c-6669-a1be2671d54b	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5653-3f5c-5b4f-df413336ba7f	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5653-3f5c-009f-497b48763d0c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5653-3f5c-07ae-c25f0a03ca18	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5653-3f5c-b92d-a050bfeff792	MW	MWI	454	Malawi 	Malavi	\N
00040000-5653-3f5c-96a6-2b78b625034f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5653-3f5c-77af-2e4d7da7c8ec	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5653-3f5c-8652-45c5418333b1	ML	MLI	466	Mali 	Mali	\N
00040000-5653-3f5c-0604-1741f3b056ca	MT	MLT	470	Malta 	Malta	\N
00040000-5653-3f5c-86e7-3d4a7ec085b4	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5653-3f5c-adb0-426b4bba8121	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5653-3f5c-3a3a-ff2017ff0f2c	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5653-3f5c-b71f-a25af4073fef	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5653-3f5c-1105-58b347b5dbee	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5653-3f5c-5d3b-126358eb6b1c	MX	MEX	484	Mexico 	Mehika	\N
00040000-5653-3f5c-babc-10c38c99f791	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5653-3f5c-2f2a-501476ce5595	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5653-3f5c-9766-76378c76deee	MC	MCO	492	Monaco 	Monako	\N
00040000-5653-3f5c-b771-6fc1c078c9b2	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5653-3f5c-97c4-173b4a7801a3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5653-3f5c-5ef8-2ddcc42bb02c	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5653-3f5c-55a9-7cc7cbbe565d	MA	MAR	504	Morocco 	Maroko	\N
00040000-5653-3f5c-29b5-13d1d36a9652	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5653-3f5c-e7da-b48f78ad66c6	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5653-3f5c-0d0a-30920839231c	NA	NAM	516	Namibia 	Namibija	\N
00040000-5653-3f5c-1ca5-00f2dc684d92	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5653-3f5c-85cb-7ef245ad049a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5653-3f5c-f271-cdb5da642f36	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5653-3f5c-72b8-109d70ed9cef	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5653-3f5c-3eed-02b210c035ed	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5653-3f5c-b6d3-1917f2f346ba	NE	NER	562	Niger 	Niger 	\N
00040000-5653-3f5c-fda7-893e46e352be	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5653-3f5c-4415-dc696689294a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5653-3f5c-8931-756e77d57c7b	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5653-3f5c-0103-a09da7f22172	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5653-3f5c-c8a5-45ac34262006	NO	NOR	578	Norway 	Norveška	\N
00040000-5653-3f5c-2ea1-52a73385e089	OM	OMN	512	Oman 	Oman	\N
00040000-5653-3f5c-0b9f-ef76323ede11	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5653-3f5c-7bf2-d7fc60ec5c7d	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5653-3f5c-87ea-2e8a2b0d7a70	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5653-3f5c-cd04-b34fa3f8a931	PA	PAN	591	Panama 	Panama	\N
00040000-5653-3f5c-a9c7-2d984440b229	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5653-3f5c-f444-c90587b9c1bc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5653-3f5c-0820-5a4afbd0d65b	PE	PER	604	Peru 	Peru	\N
00040000-5653-3f5c-905c-badf701f1962	PH	PHL	608	Philippines 	Filipini	\N
00040000-5653-3f5c-5d78-c566a8b7e43f	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5653-3f5c-ccc6-486e56c0ff77	PL	POL	616	Poland 	Poljska	\N
00040000-5653-3f5c-d4ab-b282ab13979b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5653-3f5c-fee0-ee429412829b	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5653-3f5c-0619-9e26e93548d7	QA	QAT	634	Qatar 	Katar	\N
00040000-5653-3f5c-b437-8368d10106ad	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5653-3f5c-d2ee-de530cd05e55	RO	ROU	642	Romania 	Romunija	\N
00040000-5653-3f5c-5140-9e25f92970ae	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5653-3f5c-eabd-2dc40cc6fa42	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5653-3f5c-ce13-4a59e699e75d	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5653-3f5c-7a06-a0b8715a0cf9	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5653-3f5c-5d67-4b5e5073eee1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5653-3f5c-7891-83e9c4713554	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5653-3f5c-45cc-0ae41e2587c5	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5653-3f5c-92c8-d37da8cbd905	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5653-3f5c-cfba-a922d26f2358	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5653-3f5c-9026-0c6b1a251b20	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5653-3f5c-ce08-65854ad00d2d	SM	SMR	674	San Marino 	San Marino	\N
00040000-5653-3f5c-00d3-679afa4941f5	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5653-3f5c-1e37-3045a3e3a140	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5653-3f5c-3ca7-78a95fe58611	SN	SEN	686	Senegal 	Senegal	\N
00040000-5653-3f5c-b2b8-db2d7aed05a3	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5653-3f5c-fb99-0325316dc171	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5653-3f5c-cb1b-6f274886b6b0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5653-3f5c-5af0-10b025305630	SG	SGP	702	Singapore 	Singapur	\N
00040000-5653-3f5c-7280-b386d32363e4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5653-3f5c-7b50-98e044a76402	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5653-3f5c-15fb-de38b6241296	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5653-3f5c-d8ed-7fedcf598747	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5653-3f5c-fa5b-7f68b7e6a507	SO	SOM	706	Somalia 	Somalija	\N
00040000-5653-3f5c-85d1-7830164738fe	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5653-3f5c-a045-fd11293193fd	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5653-3f5c-a7d9-cde14e1a6901	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5653-3f5c-e9bb-727056d9600c	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5653-3f5c-e711-314999dfd585	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5653-3f5c-7d1d-6aec2bd8117d	SD	SDN	729	Sudan 	Sudan	\N
00040000-5653-3f5c-e214-df1d7a48a73b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5653-3f5c-4232-137204fe0b69	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5653-3f5c-6da3-dcdf7d0f8184	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5653-3f5c-82f2-0df7ddec0092	SE	SWE	752	Sweden 	Švedska	\N
00040000-5653-3f5c-74ac-44515b0f2db3	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5653-3f5c-cd31-70a76cf41d49	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5653-3f5c-4d13-fac94f62fcde	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5653-3f5c-d25d-802622808295	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5653-3f5c-afce-564086dd7e38	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5653-3f5c-bbf9-7a2c999ec7de	TH	THA	764	Thailand 	Tajska	\N
00040000-5653-3f5c-7ad8-5a97100e2e46	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5653-3f5c-2116-f258a89dfc59	TG	TGO	768	Togo 	Togo	\N
00040000-5653-3f5c-b941-b64826592ac1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5653-3f5c-1644-b8eae18998bc	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5653-3f5c-eb6f-e877c12f133e	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5653-3f5c-7b3e-51720645b432	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5653-3f5c-de4f-f826023c97bb	TR	TUR	792	Turkey 	Turčija	\N
00040000-5653-3f5c-f835-68a7db5f9f1c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5653-3f5c-84be-c62929f3369b	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5653-3f5c-f4a8-a40d1595216d	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5653-3f5c-5212-79486986a253	UG	UGA	800	Uganda 	Uganda	\N
00040000-5653-3f5c-ee51-1ae1bcf80010	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5653-3f5c-d74e-1a0978ddd36e	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5653-3f5c-b33e-83d79f2845b1	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5653-3f5c-0df8-92c8a8629382	US	USA	840	United States 	Združene države Amerike	\N
00040000-5653-3f5c-b452-129d6b134959	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5653-3f5c-87b5-f27a8a606ea7	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5653-3f5c-2beb-7e4e0d9eb3ed	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5653-3f5c-75dc-4893a126e62f	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5653-3f5c-d9bf-720f931c5606	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5653-3f5c-5063-284918455244	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5653-3f5c-ec93-39f0c7a861e8	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5653-3f5c-c7d5-9e7e35bd5244	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5653-3f5c-4aef-d9ed06c0876c	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5653-3f5c-64a1-31a6bd27cdf2	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5653-3f5c-3e4c-ac227ffca7d8	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5653-3f5c-5b3e-c5fa420997dd	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5653-3f5c-336c-312c7f8a6484	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 29288308)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5653-3f5f-69ad-d805264dadf2	000e0000-5653-3f5e-dcc4-83ac0b214502	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5653-3f5c-a12a-6f4a57021a10	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5653-3f5f-126f-9407fbf5f90e	000e0000-5653-3f5e-1c8e-00d7de9e4f34	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5653-3f5c-8cce-e3e030906819	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5653-3f5f-d03e-7f7eaa6d7524	000e0000-5653-3f5e-bf38-8e952edbc665	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5653-3f5c-a12a-6f4a57021a10	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5653-3f5f-0f1a-a45a6c7ebcb1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5653-3f5f-0e85-af473d61d83f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 29288109)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5653-3f5e-f8ea-93bc53ad0bdc	000e0000-5653-3f5e-1c8e-00d7de9e4f34	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5653-3f5c-c041-753d2097dd5c
000d0000-5653-3f5e-a095-bc85812ae48b	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-3be0-57105d708396	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5653-3f5c-c041-753d2097dd5c
000d0000-5653-3f5e-c371-8d486438156d	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-390a-2dec88d8ed72	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5653-3f5c-7261-0d88cb687b5f
000d0000-5653-3f5e-9e40-35435894d6c7	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-8c37-d5bd9af5120d	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5653-3f5c-098e-4d850f0743e0
000d0000-5653-3f5e-93db-d23d0cd4cb7c	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-6daf-696bae31f155	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5653-3f5c-d371-143c4f8c9d2a
000d0000-5653-3f5e-c7b6-2e9289f14ae3	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-0204-e6737ca69b5c	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5653-3f5c-d371-143c4f8c9d2a
000d0000-5653-3f5e-5a75-ed2cc751141f	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-bac0-7ec180ce137b	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5653-3f5c-c041-753d2097dd5c
000d0000-5653-3f5e-eda2-aa134556437c	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-9114-f26909f14dfb	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5653-3f5c-f68a-cb2eb6758f93
000d0000-5653-3f5e-a072-13fcdc177841	000e0000-5653-3f5e-1c8e-00d7de9e4f34	000c0000-5653-3f5f-5f7a-ca51c0aa4258	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5653-3f5c-574b-92b31826e8cb
\.


--
-- TOC entry 3122 (class 0 OID 29287900)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 29287866)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 29287843)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5653-3f5e-3b5e-6017fc285f34	00080000-5653-3f5e-58f0-655730e84ccb	00090000-5653-3f5e-d890-2902b77f238f	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 29288023)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 29288566)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5653-3f5e-5bed-da0c81aab2c8	00010000-5653-3f5c-e2cc-80fb8de7170c	\N	Prva mapa	Root mapa	2015-11-23 17:31:26	2015-11-23 17:31:26	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 29288579)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 29288601)
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
-- TOC entry 3138 (class 0 OID 29288048)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 29287800)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5653-3f5d-a8ad-1940c604512b	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5653-3f5d-3bb1-fc8e6a607fd9	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5653-3f5d-5682-fbabddd7bbd9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5653-3f5d-f99d-6c17ecb3518b	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5653-3f5d-05bb-510d135701bc	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5653-3f5d-8e87-9f2d5f85114b	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5653-3f5d-1944-970ffc3e0cc0	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5653-3f5d-427e-071aa28046ba	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5653-3f5d-f366-765e05d74936	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5653-3f5d-5413-427c4df3c970	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5653-3f5d-740a-4d8065e603f5	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5653-3f5d-f2ca-c51de8daf16c	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5653-3f5d-af24-c97a601a8cc4	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5653-3f5d-74f3-ffa52cc247aa	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5653-3f5e-8378-3978e4d54440	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5653-3f5e-0534-d3cb522bbae7	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5653-3f5e-3b21-ae3ceef2939d	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5653-3f5e-8bb8-28fd97633abb	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5653-3f5e-3aa4-642d89d1902c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5653-3f60-8c2a-2bd9ddd568d4	application.tenant.maticnopodjetje	string	s:36:"00080000-5653-3f60-31ee-7768bb2cdf87";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 29287700)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5653-3f5e-e945-606a6fd6d172	00000000-5653-3f5e-8378-3978e4d54440	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5653-3f5e-dba4-33b596be7e60	00000000-5653-3f5e-8378-3978e4d54440	00010000-5653-3f5c-e2cc-80fb8de7170c	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5653-3f5e-9138-3d2f44054b84	00000000-5653-3f5e-0534-d3cb522bbae7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 29287767)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5653-3f5e-de2d-1cb8fbe48be7	\N	00100000-5653-3f5e-957f-dc5bf28e77c7	00100000-5653-3f5e-a6b2-42ddf0f006cf	01	Gledališče Nimbis
00410000-5653-3f5e-4763-f3a8b3767f00	00410000-5653-3f5e-de2d-1cb8fbe48be7	00100000-5653-3f5e-957f-dc5bf28e77c7	00100000-5653-3f5e-a6b2-42ddf0f006cf	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 29287711)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5653-3f5e-ca6d-fcd477964ced	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5653-3f5e-48ab-7ee39d6a0d48	00010000-5653-3f5e-eb6e-91e81527243c	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5653-3f5e-c2e3-13c2c27e228f	00010000-5653-3f5e-a9a2-93274ea3b4a8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5653-3f5e-e35a-3af4a18391f9	00010000-5653-3f5e-1926-4ba1c225d793	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5653-3f5e-9813-c2d2224ed0c4	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5653-3f5e-2c6d-a09730a92b25	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5653-3f5e-aa6a-99f14f7eb95e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5653-3f5e-6c3e-10529a8f062e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5653-3f5e-d890-2902b77f238f	00010000-5653-3f5e-c960-6691b415ea44	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5653-3f5e-99a3-4d7b9febc2b3	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5653-3f5e-c246-0b36575ae163	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5653-3f5e-74c8-ed5fb36a3a49	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5653-3f5e-13ae-b404b5e953f1	00010000-5653-3f5e-8434-8167e1717b1b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5653-3f5e-7fc0-db044c507031	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5653-3f5e-3f33-41a73412378e	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5653-3f5e-e73a-24f1f3002e40	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5653-3f5e-7655-2d9dde2f3e2a	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5653-3f5e-5cfe-8d2305d44c15	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5653-3f5e-a94f-5f5a857e60ae	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5653-3f5e-dc2e-babfc0bd5fd3	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5653-3f5e-2009-d70ecb4da5a8	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 29287646)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5653-3f5c-1c22-428f68bad155	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5653-3f5c-fd16-12d261a34fcc	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5653-3f5c-3caa-5ebed04a859e	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5653-3f5c-e6f6-c5f411981e08	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5653-3f5c-52a7-c0960d37bb45	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5653-3f5c-9231-3d28cb3dffc8	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5653-3f5c-d5e7-4f7bb2d4c0b2	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5653-3f5c-bc92-e0b30a46f872	Abonma-read	Abonma - branje	t
00030000-5653-3f5c-82fe-84fa630e1ac1	Abonma-write	Abonma - spreminjanje	t
00030000-5653-3f5c-174e-d76ff60e1ea7	Alternacija-read	Alternacija - branje	t
00030000-5653-3f5c-1407-739390c056c8	Alternacija-write	Alternacija - spreminjanje	t
00030000-5653-3f5c-2ab7-25a6a087f1c2	Arhivalija-read	Arhivalija - branje	t
00030000-5653-3f5c-1fab-7ebbe6811cdb	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5653-3f5c-1cc8-61c2ddb091e4	AuthStorage-read	AuthStorage - branje	t
00030000-5653-3f5c-93e4-e28adfe56ab8	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5653-3f5c-245a-01808c5e5c71	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5653-3f5c-dc78-ec50bbf04b1f	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5653-3f5c-0f51-5c1ea6ce4803	Besedilo-read	Besedilo - branje	t
00030000-5653-3f5c-48f5-b332bd62630e	Besedilo-write	Besedilo - spreminjanje	t
00030000-5653-3f5c-1522-18ce2b4ad989	Dogodek-read	Dogodek - branje	t
00030000-5653-3f5c-b413-9c1308f97e45	Dogodek-write	Dogodek - spreminjanje	t
00030000-5653-3f5c-0853-f146356e9e06	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5653-3f5c-6763-07284a850799	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5653-3f5c-fc8b-f6dc8c959379	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5653-3f5c-170c-40f2c02670ed	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5653-3f5c-b5b7-b21d1164e564	DogodekTrait-read	DogodekTrait - branje	t
00030000-5653-3f5c-3815-4a4cdd1af2d5	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5653-3f5c-737f-556b5decaed8	DrugiVir-read	DrugiVir - branje	t
00030000-5653-3f5c-f885-84e7a60c1b29	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5653-3f5c-105f-8574d675f8fc	Drzava-read	Drzava - branje	t
00030000-5653-3f5c-c34f-ca622614e507	Drzava-write	Drzava - spreminjanje	t
00030000-5653-3f5c-db52-f69e17a07ee8	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5653-3f5c-a430-930c56e47b39	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5653-3f5c-7f27-9e671bcba533	Funkcija-read	Funkcija - branje	t
00030000-5653-3f5c-127a-f8f8529c229d	Funkcija-write	Funkcija - spreminjanje	t
00030000-5653-3f5c-4b00-745377998be7	Gostovanje-read	Gostovanje - branje	t
00030000-5653-3f5c-ac44-bfb6d2c7dc8c	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5653-3f5c-9119-ebe4fcd769f3	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5653-3f5c-9a5a-e2df259822f8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5653-3f5c-d13d-30d65d86b087	Kupec-read	Kupec - branje	t
00030000-5653-3f5c-b27e-475feb8259bd	Kupec-write	Kupec - spreminjanje	t
00030000-5653-3f5c-dadf-2bd9c0e6ba9d	NacinPlacina-read	NacinPlacina - branje	t
00030000-5653-3f5c-1159-afabde6565e2	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5653-3f5c-d2d1-e679b519fc29	Option-read	Option - branje	t
00030000-5653-3f5c-a7d9-f7ced46b6be0	Option-write	Option - spreminjanje	t
00030000-5653-3f5c-c7e2-486637a7072e	OptionValue-read	OptionValue - branje	t
00030000-5653-3f5c-9ed7-8cbdb1738fd9	OptionValue-write	OptionValue - spreminjanje	t
00030000-5653-3f5c-b7fd-292fb8f0d3d8	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5653-3f5c-240b-e091063c3695	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5653-3f5c-70d8-7bd8c1cb4151	Oseba-read	Oseba - branje	t
00030000-5653-3f5c-4039-1273d7249774	Oseba-write	Oseba - spreminjanje	t
00030000-5653-3f5c-094e-8b73370112ce	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5653-3f5c-70aa-1a86784759cf	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5653-3f5c-3912-f6f5fc54fed4	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5653-3f5c-1a4f-341a7d2d925d	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5653-3f5c-5a88-86e63fe0d383	Pogodba-read	Pogodba - branje	t
00030000-5653-3f5c-616e-918f0ee33784	Pogodba-write	Pogodba - spreminjanje	t
00030000-5653-3f5c-9a64-49ca9f8e59f7	Popa-read	Popa - branje	t
00030000-5653-3f5c-08d2-dc9dc5cd5a74	Popa-write	Popa - spreminjanje	t
00030000-5653-3f5c-8ea7-2a963f1ec7df	Posta-read	Posta - branje	t
00030000-5653-3f5c-84ed-f6cf484e4a26	Posta-write	Posta - spreminjanje	t
00030000-5653-3f5c-c65d-51fb12d68241	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5653-3f5c-0984-e2d9dbffdf69	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5653-3f5c-29eb-e0a7aca09853	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5653-3f5c-0a52-556f416be5cf	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5653-3f5c-8ce7-cd35ee845a59	PostniNaslov-read	PostniNaslov - branje	t
00030000-5653-3f5c-173d-fa0fe7004cb1	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5653-3f5c-0fb2-3f56a0c6ea56	Praznik-read	Praznik - branje	t
00030000-5653-3f5c-6526-2afef789ef9e	Praznik-write	Praznik - spreminjanje	t
00030000-5653-3f5c-23ec-3d01e5255595	Predstava-read	Predstava - branje	t
00030000-5653-3f5c-d725-8ca2a12c53f1	Predstava-write	Predstava - spreminjanje	t
00030000-5653-3f5c-f9d6-15ad31a16648	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5653-3f5c-5df5-f60814892477	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5653-3f5c-f89d-d7c849418090	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5653-3f5c-84c9-32837931b9df	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5653-3f5c-08ce-d44a69e92436	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5653-3f5c-7696-14064d9e9b2a	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5653-3f5c-6c85-1632c09b8775	ProgramDela-read	ProgramDela - branje	t
00030000-5653-3f5c-99d5-48ab66ee4c01	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5653-3f5c-a391-7034d603f7c2	ProgramFestival-read	ProgramFestival - branje	t
00030000-5653-3f5c-e104-36dba80309c8	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5653-3f5c-9d83-9b9874610f73	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5653-3f5c-aec5-1bdd790c54e3	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5653-3f5c-8316-5cecaa771579	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5653-3f5c-33b9-268297c866d2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5653-3f5c-9834-329f47baae04	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5653-3f5c-7238-6c87d9db3889	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5653-3f5c-b354-f0a3a5edcf24	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5653-3f5c-2e71-233bb22312ca	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5653-3f5c-e739-cdee373ad378	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5653-3f5c-8ad2-458ba3562745	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5653-3f5c-4881-d68667a04a83	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5653-3f5c-0a7e-135c2f84b9fa	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5653-3f5c-4cc7-df1ef3e2471a	ProgramRazno-read	ProgramRazno - branje	t
00030000-5653-3f5c-a3f9-709ddbdc9023	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5653-3f5c-bfcf-5c08f346cf0b	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5653-3f5c-0448-51ae4f385e5d	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5653-3f5c-04cf-03d164e53628	Prostor-read	Prostor - branje	t
00030000-5653-3f5c-2b23-858edeefcf58	Prostor-write	Prostor - spreminjanje	t
00030000-5653-3f5c-9243-98aa632b5826	Racun-read	Racun - branje	t
00030000-5653-3f5c-f3cd-cf7a4e47cca2	Racun-write	Racun - spreminjanje	t
00030000-5653-3f5c-d9d2-bdb6eb7c0482	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5653-3f5c-9230-9464cb07ff9f	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5653-3f5c-321c-ef964ace2b69	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5653-3f5c-d0b9-ff882d32fe61	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5653-3f5c-ebe6-8454c57b7d77	Rekvizit-read	Rekvizit - branje	t
00030000-5653-3f5c-6ecc-28858e66d381	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5653-3f5c-c371-6640bf651d8a	Revizija-read	Revizija - branje	t
00030000-5653-3f5c-46b7-2136003c642a	Revizija-write	Revizija - spreminjanje	t
00030000-5653-3f5c-c876-146ffe681fcc	Rezervacija-read	Rezervacija - branje	t
00030000-5653-3f5c-b289-dcba1fa1b2a3	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5653-3f5c-1587-13120ffbcb7a	SedezniRed-read	SedezniRed - branje	t
00030000-5653-3f5c-06bd-92a0e266d5dc	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5653-3f5c-cda6-13963a94bb8f	Sedez-read	Sedez - branje	t
00030000-5653-3f5c-1286-64f92a268f59	Sedez-write	Sedez - spreminjanje	t
00030000-5653-3f5c-5dcd-01887bc998fb	Sezona-read	Sezona - branje	t
00030000-5653-3f5c-2cd9-7cc57dcd22f9	Sezona-write	Sezona - spreminjanje	t
00030000-5653-3f5c-e23b-d3c30312ad62	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5653-3f5c-fd19-e8f7378b4aa2	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5653-3f5c-4e8f-fd8fdb16b15c	Stevilcenje-read	Stevilcenje - branje	t
00030000-5653-3f5c-77be-0fcb3c8db163	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5653-3f5c-6f4b-97ac1d6edac4	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5653-3f5c-0b9a-fb81891182f8	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5653-3f5c-a831-7b3050429109	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5653-3f5c-fa75-6e9a2c607620	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5653-3f5c-dcb9-b7a13ebd6be2	Telefonska-read	Telefonska - branje	t
00030000-5653-3f5c-df82-f77b355f6253	Telefonska-write	Telefonska - spreminjanje	t
00030000-5653-3f5c-e42d-721e862cbffa	TerminStoritve-read	TerminStoritve - branje	t
00030000-5653-3f5c-8a07-dc3fd0146b63	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5653-3f5c-3d5c-9bb61aea7bf0	TipFunkcije-read	TipFunkcije - branje	t
00030000-5653-3f5c-5fa8-0b3b24daf066	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5653-3f5c-f7e6-ff55f79225b1	TipPopa-read	TipPopa - branje	t
00030000-5653-3f5c-d18f-602724fdb827	TipPopa-write	TipPopa - spreminjanje	t
00030000-5653-3f5c-d17e-af99a1c21b7f	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5653-3f5c-680e-9419da4e750f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5653-3f5c-92ed-ebe1b2c08663	TipVaje-read	TipVaje - branje	t
00030000-5653-3f5c-8f55-c1ab5be80e57	TipVaje-write	TipVaje - spreminjanje	t
00030000-5653-3f5c-861a-6d9adfb90724	Trr-read	Trr - branje	t
00030000-5653-3f5c-19cd-d945fba431b6	Trr-write	Trr - spreminjanje	t
00030000-5653-3f5c-5d47-dba299ea7ba9	Uprizoritev-read	Uprizoritev - branje	t
00030000-5653-3f5c-596d-5cd95372de28	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5653-3f5c-68f9-9b907c168ad6	Vaja-read	Vaja - branje	t
00030000-5653-3f5c-f61b-b1bc2dedf7cc	Vaja-write	Vaja - spreminjanje	t
00030000-5653-3f5c-cf9b-7de6f50cac79	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5653-3f5c-5727-f5f915d416e5	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5653-3f5c-4762-37a492600148	VrstaStroska-read	VrstaStroska - branje	t
00030000-5653-3f5c-5b10-a12493566bad	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5653-3f5c-e588-41930ac5dfe4	Zaposlitev-read	Zaposlitev - branje	t
00030000-5653-3f5c-0f9a-5655957c8275	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5653-3f5c-2420-a2e5d3b7ae95	Zasedenost-read	Zasedenost - branje	t
00030000-5653-3f5c-a2a0-7a94bc4a7e54	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5653-3f5c-d130-020d4c271ffb	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5653-3f5c-5de6-50d3617a7885	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5653-3f5c-98d4-8ef6770b2194	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5653-3f5c-3313-2a177bf6f7e1	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5653-3f5c-4200-3cd9825a9b63	Job-read	Branje opravil - samo zase - branje	t
00030000-5653-3f5c-1b52-d05f7ab3b484	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5653-3f5c-8e41-2b7f7017abd4	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5653-3f5c-4156-d407d01af83f	Report-read	Report - branje	t
00030000-5653-3f5c-019f-eb512e5af4ac	Report-write	Report - spreminjanje	t
00030000-5653-3f5c-4d03-8c0ba0e4acc6	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5653-3f5c-d9dc-b85bd564ba6a	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5653-3f5c-2536-7710dda2560a	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5653-3f5c-89a5-cd2b2bad04c1	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5653-3f5c-7d10-b2ac7aab7c3b	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5653-3f5c-5168-19fb68b35a5b	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5653-3f5c-7fa2-0ee21a15dfbe	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5653-3f5c-f594-ebdf93f0d245	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5653-3f5c-60af-f4a8f30e0e61	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5653-3f5c-ccc8-af92f4d919b6	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5653-3f5c-7df4-7b9d13077ac7	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5653-3f5c-4afc-9225d42d45b3	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5653-3f5c-84ea-b2332b661ad8	Datoteka-write	Datoteka - spreminjanje	t
00030000-5653-3f5c-2ac9-46dffd2ea570	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 29287665)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5653-3f5c-e823-7f11b7699889	00030000-5653-3f5c-fd16-12d261a34fcc
00020000-5653-3f5c-f925-e7f83de7aba5	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-bc92-e0b30a46f872
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-82fe-84fa630e1ac1
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-174e-d76ff60e1ea7
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-1407-739390c056c8
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-2ab7-25a6a087f1c2
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-1522-18ce2b4ad989
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-e6f6-c5f411981e08
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-b413-9c1308f97e45
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-c34f-ca622614e507
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-7f27-9e671bcba533
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-127a-f8f8529c229d
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-4b00-745377998be7
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-ac44-bfb6d2c7dc8c
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-9119-ebe4fcd769f3
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-9a5a-e2df259822f8
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-d2d1-e679b519fc29
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-c7e2-486637a7072e
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-70d8-7bd8c1cb4151
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-4039-1273d7249774
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-08d2-dc9dc5cd5a74
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-8ea7-2a963f1ec7df
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-84ed-f6cf484e4a26
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-8ce7-cd35ee845a59
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-173d-fa0fe7004cb1
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-23ec-3d01e5255595
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-d725-8ca2a12c53f1
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-08ce-d44a69e92436
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-7696-14064d9e9b2a
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-04cf-03d164e53628
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-2b23-858edeefcf58
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-321c-ef964ace2b69
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-d0b9-ff882d32fe61
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-ebe6-8454c57b7d77
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-6ecc-28858e66d381
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-5dcd-01887bc998fb
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-2cd9-7cc57dcd22f9
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-3d5c-9bb61aea7bf0
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-5d47-dba299ea7ba9
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-596d-5cd95372de28
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-68f9-9b907c168ad6
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-f61b-b1bc2dedf7cc
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-2420-a2e5d3b7ae95
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-a2a0-7a94bc4a7e54
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-d130-020d4c271ffb
00020000-5653-3f5c-2fa7-f217bb23c80f	00030000-5653-3f5c-98d4-8ef6770b2194
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-bc92-e0b30a46f872
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-2ab7-25a6a087f1c2
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-1522-18ce2b4ad989
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-4b00-745377998be7
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-9119-ebe4fcd769f3
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-9a5a-e2df259822f8
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-d2d1-e679b519fc29
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-c7e2-486637a7072e
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-70d8-7bd8c1cb4151
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-4039-1273d7249774
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-8ea7-2a963f1ec7df
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-8ce7-cd35ee845a59
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-173d-fa0fe7004cb1
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-23ec-3d01e5255595
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-04cf-03d164e53628
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-321c-ef964ace2b69
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-ebe6-8454c57b7d77
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-5dcd-01887bc998fb
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-dcb9-b7a13ebd6be2
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-df82-f77b355f6253
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-861a-6d9adfb90724
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-19cd-d945fba431b6
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-e588-41930ac5dfe4
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-0f9a-5655957c8275
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-d130-020d4c271ffb
00020000-5653-3f5c-be43-f5de710c8e56	00030000-5653-3f5c-98d4-8ef6770b2194
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-bc92-e0b30a46f872
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-174e-d76ff60e1ea7
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-2ab7-25a6a087f1c2
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-1fab-7ebbe6811cdb
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-0f51-5c1ea6ce4803
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-0853-f146356e9e06
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-1522-18ce2b4ad989
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-7f27-9e671bcba533
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-4b00-745377998be7
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-9119-ebe4fcd769f3
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-d2d1-e679b519fc29
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-c7e2-486637a7072e
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-70d8-7bd8c1cb4151
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-8ea7-2a963f1ec7df
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-23ec-3d01e5255595
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-08ce-d44a69e92436
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-04cf-03d164e53628
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-321c-ef964ace2b69
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-ebe6-8454c57b7d77
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-5dcd-01887bc998fb
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-3d5c-9bb61aea7bf0
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-68f9-9b907c168ad6
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-2420-a2e5d3b7ae95
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-d130-020d4c271ffb
00020000-5653-3f5c-ce4a-89fbd9003f10	00030000-5653-3f5c-98d4-8ef6770b2194
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-bc92-e0b30a46f872
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-82fe-84fa630e1ac1
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-1407-739390c056c8
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-2ab7-25a6a087f1c2
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-1522-18ce2b4ad989
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-4b00-745377998be7
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-d2d1-e679b519fc29
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-c7e2-486637a7072e
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-8ea7-2a963f1ec7df
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-23ec-3d01e5255595
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-04cf-03d164e53628
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-321c-ef964ace2b69
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-ebe6-8454c57b7d77
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-5dcd-01887bc998fb
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-3d5c-9bb61aea7bf0
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-d130-020d4c271ffb
00020000-5653-3f5c-62e1-7922a5d219ae	00030000-5653-3f5c-98d4-8ef6770b2194
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-bc92-e0b30a46f872
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-2ab7-25a6a087f1c2
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-1522-18ce2b4ad989
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-4b00-745377998be7
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-d2d1-e679b519fc29
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-c7e2-486637a7072e
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-8ea7-2a963f1ec7df
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-23ec-3d01e5255595
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-04cf-03d164e53628
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-321c-ef964ace2b69
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-ebe6-8454c57b7d77
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-5dcd-01887bc998fb
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-e42d-721e862cbffa
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-3caa-5ebed04a859e
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-3d5c-9bb61aea7bf0
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-d130-020d4c271ffb
00020000-5653-3f5c-dd9b-f96dc8692dd2	00030000-5653-3f5c-98d4-8ef6770b2194
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1c22-428f68bad155
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-fd16-12d261a34fcc
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-bc92-e0b30a46f872
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-82fe-84fa630e1ac1
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-174e-d76ff60e1ea7
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1407-739390c056c8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2ab7-25a6a087f1c2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1fab-7ebbe6811cdb
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1cc8-61c2ddb091e4
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-93e4-e28adfe56ab8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-245a-01808c5e5c71
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-dc78-ec50bbf04b1f
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0f51-5c1ea6ce4803
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-48f5-b332bd62630e
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2ac9-46dffd2ea570
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-84ea-b2332b661ad8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1522-18ce2b4ad989
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-e6f6-c5f411981e08
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-b413-9c1308f97e45
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0853-f146356e9e06
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-6763-07284a850799
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-fc8b-f6dc8c959379
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-170c-40f2c02670ed
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-737f-556b5decaed8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f885-84e7a60c1b29
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-105f-8574d675f8fc
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-c34f-ca622614e507
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-db52-f69e17a07ee8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-a430-930c56e47b39
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-7f27-9e671bcba533
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-127a-f8f8529c229d
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4b00-745377998be7
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-ac44-bfb6d2c7dc8c
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8e41-2b7f7017abd4
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4200-3cd9825a9b63
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1b52-d05f7ab3b484
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9119-ebe4fcd769f3
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9a5a-e2df259822f8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d13d-30d65d86b087
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-b27e-475feb8259bd
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4d03-8c0ba0e4acc6
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d9dc-b85bd564ba6a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2536-7710dda2560a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-89a5-cd2b2bad04c1
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5168-19fb68b35a5b
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-7d10-b2ac7aab7c3b
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-dadf-2bd9c0e6ba9d
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1159-afabde6565e2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d2d1-e679b519fc29
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-a7d9-f7ced46b6be0
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-c7e2-486637a7072e
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9ed7-8cbdb1738fd9
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-b7fd-292fb8f0d3d8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-240b-e091063c3695
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-70d8-7bd8c1cb4151
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-52a7-c0960d37bb45
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4039-1273d7249774
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-094e-8b73370112ce
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-70aa-1a86784759cf
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-3912-f6f5fc54fed4
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1a4f-341a7d2d925d
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5a88-86e63fe0d383
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-616e-918f0ee33784
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-08d2-dc9dc5cd5a74
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8ea7-2a963f1ec7df
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-84ed-f6cf484e4a26
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-c65d-51fb12d68241
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0984-e2d9dbffdf69
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-29eb-e0a7aca09853
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0a52-556f416be5cf
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8ce7-cd35ee845a59
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-173d-fa0fe7004cb1
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0fb2-3f56a0c6ea56
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-6526-2afef789ef9e
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-23ec-3d01e5255595
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d725-8ca2a12c53f1
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f9d6-15ad31a16648
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5df5-f60814892477
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f89d-d7c849418090
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-84c9-32837931b9df
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-08ce-d44a69e92436
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-7696-14064d9e9b2a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9231-3d28cb3dffc8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-6c85-1632c09b8775
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d5e7-4f7bb2d4c0b2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-99d5-48ab66ee4c01
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-a391-7034d603f7c2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-e104-36dba80309c8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9d83-9b9874610f73
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-aec5-1bdd790c54e3
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8316-5cecaa771579
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-33b9-268297c866d2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9834-329f47baae04
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-7238-6c87d9db3889
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-b354-f0a3a5edcf24
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2e71-233bb22312ca
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-e739-cdee373ad378
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8ad2-458ba3562745
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4881-d68667a04a83
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0a7e-135c2f84b9fa
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4cc7-df1ef3e2471a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-a3f9-709ddbdc9023
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-bfcf-5c08f346cf0b
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0448-51ae4f385e5d
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-04cf-03d164e53628
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2b23-858edeefcf58
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9243-98aa632b5826
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f3cd-cf7a4e47cca2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d9d2-bdb6eb7c0482
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-9230-9464cb07ff9f
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-ebe6-8454c57b7d77
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-6ecc-28858e66d381
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-321c-ef964ace2b69
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d0b9-ff882d32fe61
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4156-d407d01af83f
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-019f-eb512e5af4ac
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-c371-6640bf651d8a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-46b7-2136003c642a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-c876-146ffe681fcc
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-b289-dcba1fa1b2a3
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-cda6-13963a94bb8f
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1286-64f92a268f59
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-1587-13120ffbcb7a
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-06bd-92a0e266d5dc
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5dcd-01887bc998fb
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2cd9-7cc57dcd22f9
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4e8f-fd8fdb16b15c
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-77be-0fcb3c8db163
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-e23b-d3c30312ad62
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-fd19-e8f7378b4aa2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-6f4b-97ac1d6edac4
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0b9a-fb81891182f8
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-a831-7b3050429109
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-fa75-6e9a2c607620
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-dcb9-b7a13ebd6be2
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-df82-f77b355f6253
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-e42d-721e862cbffa
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-3caa-5ebed04a859e
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8a07-dc3fd0146b63
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-3d5c-9bb61aea7bf0
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5fa8-0b3b24daf066
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f7e6-ff55f79225b1
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d18f-602724fdb827
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d17e-af99a1c21b7f
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-680e-9419da4e750f
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-92ed-ebe1b2c08663
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-8f55-c1ab5be80e57
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-861a-6d9adfb90724
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-19cd-d945fba431b6
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5d47-dba299ea7ba9
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-596d-5cd95372de28
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-68f9-9b907c168ad6
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f61b-b1bc2dedf7cc
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-cf9b-7de6f50cac79
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5727-f5f915d416e5
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4762-37a492600148
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5b10-a12493566bad
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-4afc-9225d42d45b3
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-7df4-7b9d13077ac7
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-f594-ebdf93f0d245
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-7fa2-0ee21a15dfbe
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-ccc8-af92f4d919b6
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-60af-f4a8f30e0e61
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-e588-41930ac5dfe4
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-0f9a-5655957c8275
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-2420-a2e5d3b7ae95
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-a2a0-7a94bc4a7e54
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-d130-020d4c271ffb
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-5de6-50d3617a7885
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-98d4-8ef6770b2194
00020000-5653-3f5e-a728-8cc1db01a1e0	00030000-5653-3f5c-3313-2a177bf6f7e1
00020000-5653-3f5e-b586-e4cd15e935c0	00030000-5653-3f5c-ccc8-af92f4d919b6
00020000-5653-3f5e-f018-9186dcd912a1	00030000-5653-3f5c-60af-f4a8f30e0e61
00020000-5653-3f5e-a6c9-0a05094acbd0	00030000-5653-3f5c-596d-5cd95372de28
00020000-5653-3f5e-4857-4a876bfe7bbe	00030000-5653-3f5c-5d47-dba299ea7ba9
00020000-5653-3f5e-1dad-86e9728297ec	00030000-5653-3f5c-d9dc-b85bd564ba6a
00020000-5653-3f5e-aae7-71b156d7788c	00030000-5653-3f5c-2536-7710dda2560a
00020000-5653-3f5e-93c9-f27408ef6b5a	00030000-5653-3f5c-89a5-cd2b2bad04c1
00020000-5653-3f5e-0efb-b904d8193b2c	00030000-5653-3f5c-4d03-8c0ba0e4acc6
00020000-5653-3f5e-c69f-e53e8ef74afb	00030000-5653-3f5c-5168-19fb68b35a5b
00020000-5653-3f5e-6d4f-88db78a37d51	00030000-5653-3f5c-7d10-b2ac7aab7c3b
00020000-5653-3f5e-5f64-144254db3978	00030000-5653-3f5c-f594-ebdf93f0d245
00020000-5653-3f5e-7636-3848e6f9491d	00030000-5653-3f5c-7fa2-0ee21a15dfbe
00020000-5653-3f5e-ecdf-d35f2037e435	00030000-5653-3f5c-4039-1273d7249774
00020000-5653-3f5e-4048-5f2930cf4b73	00030000-5653-3f5c-70d8-7bd8c1cb4151
00020000-5653-3f5e-2dc6-7a932cc70f2d	00030000-5653-3f5c-84ea-b2332b661ad8
00020000-5653-3f5e-9fb1-cdd441f47f54	00030000-5653-3f5c-2ac9-46dffd2ea570
00020000-5653-3f5e-95ee-cfd734503684	00030000-5653-3f5c-9a64-49ca9f8e59f7
00020000-5653-3f5e-95ee-cfd734503684	00030000-5653-3f5c-08d2-dc9dc5cd5a74
00020000-5653-3f5e-95ee-cfd734503684	00030000-5653-3f5c-5d47-dba299ea7ba9
\.


--
-- TOC entry 3139 (class 0 OID 29288055)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 29288089)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 29288226)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5653-3f5e-2464-56d52a9a11b2	00090000-5653-3f5e-ca6d-fcd477964ced	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5653-3f5e-7368-ad047575fa4d	00090000-5653-3f5e-2c6d-a09730a92b25	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5653-3f5e-6d40-1127f1f77ca5	00090000-5653-3f5e-13ae-b404b5e953f1	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5653-3f5e-187c-ea76a6dc1f27	00090000-5653-3f5e-99a3-4d7b9febc2b3	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 29287747)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5653-3f5e-58f0-655730e84ccb	\N	00040000-5653-3f5c-15fb-de38b6241296	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-9e92-b21ef19224f9	\N	00040000-5653-3f5c-15fb-de38b6241296	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5653-3f5e-95a1-2558bbba51b2	\N	00040000-5653-3f5c-15fb-de38b6241296	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-4064-7dbaa898824e	\N	00040000-5653-3f5c-15fb-de38b6241296	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-331b-f12d4a7800f4	\N	00040000-5653-3f5c-15fb-de38b6241296	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-020a-b347446fba5d	\N	00040000-5653-3f5c-c922-c113b3206cd7	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-013f-d5c35f922a40	\N	00040000-5653-3f5c-6f03-58030b515b49	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-4e59-d28bc0123c17	\N	00040000-5653-3f5c-2b01-8e4618da6b45	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f5e-7201-bd2e0f021b36	\N	00040000-5653-3f5c-770a-f127d0fed9b0	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5653-3f60-31ee-7768bb2cdf87	\N	00040000-5653-3f5c-15fb-de38b6241296	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 29287792)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5653-3f5b-dcba-3f1c0293786f	8341	Adlešiči
00050000-5653-3f5b-d03e-143d4d5654c5	5270	Ajdovščina
00050000-5653-3f5b-d547-2dffe652a981	6280	Ankaran/Ancarano
00050000-5653-3f5b-78c4-cf2475de93cd	9253	Apače
00050000-5653-3f5b-2ba8-ee8ff544e547	8253	Artiče
00050000-5653-3f5b-7fa4-ba5adc10925e	4275	Begunje na Gorenjskem
00050000-5653-3f5b-54dd-a95dacd37071	1382	Begunje pri Cerknici
00050000-5653-3f5b-e714-8874a59ba972	9231	Beltinci
00050000-5653-3f5b-121f-8ed329fb0b0b	2234	Benedikt
00050000-5653-3f5b-93a3-adc36eabc428	2345	Bistrica ob Dravi
00050000-5653-3f5b-2cdb-0e5ce1f17621	3256	Bistrica ob Sotli
00050000-5653-3f5b-1dd7-8cacbf6d9c87	8259	Bizeljsko
00050000-5653-3f5b-2840-1d99bbe470bc	1223	Blagovica
00050000-5653-3f5b-3ef1-ad1f23278ede	8283	Blanca
00050000-5653-3f5b-2ef6-c27b53fb9338	4260	Bled
00050000-5653-3f5b-447b-96e16cfde891	4273	Blejska Dobrava
00050000-5653-3f5b-dee0-d5d6e166e4cc	9265	Bodonci
00050000-5653-3f5b-1351-0edaccc9118b	9222	Bogojina
00050000-5653-3f5b-7682-c887cca2a44f	4263	Bohinjska Bela
00050000-5653-3f5b-50e6-f282784fa0e3	4264	Bohinjska Bistrica
00050000-5653-3f5b-edad-c59dc901ee27	4265	Bohinjsko jezero
00050000-5653-3f5b-4b10-3924d0f633f7	1353	Borovnica
00050000-5653-3f5b-d8e8-86199df17dc4	8294	Boštanj
00050000-5653-3f5b-6f1d-53b47c31a74e	5230	Bovec
00050000-5653-3f5b-e467-eb648911c5bd	5295	Branik
00050000-5653-3f5b-b176-035a5e301e5f	3314	Braslovče
00050000-5653-3f5b-77d5-ddbd18235841	5223	Breginj
00050000-5653-3f5b-9ad6-18ad68a1de8b	8280	Brestanica
00050000-5653-3f5b-8c98-25811b84ca45	2354	Bresternica
00050000-5653-3f5b-72f6-a038fa84e145	4243	Brezje
00050000-5653-3f5b-15dd-0c81f4246f70	1351	Brezovica pri Ljubljani
00050000-5653-3f5b-6817-4857561c9c2d	8250	Brežice
00050000-5653-3f5b-f176-5d40314feda7	4210	Brnik - Aerodrom
00050000-5653-3f5b-3015-a007fc2d71af	8321	Brusnice
00050000-5653-3f5b-6f9c-a5ceba79f054	3255	Buče
00050000-5653-3f5b-6b66-31261b93e6fd	8276	Bučka 
00050000-5653-3f5b-cbca-f253bf9933a5	9261	Cankova
00050000-5653-3f5b-6463-1f0b5702f4e5	3000	Celje 
00050000-5653-3f5b-ca4c-b89312f8159e	3001	Celje - poštni predali
00050000-5653-3f5b-2a42-d6bd9081347b	4207	Cerklje na Gorenjskem
00050000-5653-3f5b-3084-9ef15c4e1e41	8263	Cerklje ob Krki
00050000-5653-3f5b-ee28-bc99565a26fe	1380	Cerknica
00050000-5653-3f5b-60fc-493d70802244	5282	Cerkno
00050000-5653-3f5b-b75e-97d2a0b00aea	2236	Cerkvenjak
00050000-5653-3f5b-e264-075b75db570e	2215	Ceršak
00050000-5653-3f5b-f841-a3fdc6beae3a	2326	Cirkovce
00050000-5653-3f5b-6dab-b9ef9f68264d	2282	Cirkulane
00050000-5653-3f5b-2e1f-bbbdcb9a42a6	5273	Col
00050000-5653-3f5b-1cd4-4c975771d79e	8251	Čatež ob Savi
00050000-5653-3f5b-0b9a-66f5a2c26894	1413	Čemšenik
00050000-5653-3f5b-8333-f5d4daba1c8a	5253	Čepovan
00050000-5653-3f5b-d1ae-3b96d2abc44c	9232	Črenšovci
00050000-5653-3f5b-0ba5-9cd1151a74f7	2393	Črna na Koroškem
00050000-5653-3f5b-7f81-3456d766e819	6275	Črni Kal
00050000-5653-3f5b-650f-c5a43fa35e2e	5274	Črni Vrh nad Idrijo
00050000-5653-3f5b-98be-586ad9c90c1f	5262	Črniče
00050000-5653-3f5b-d4f5-8caa16db883c	8340	Črnomelj
00050000-5653-3f5b-2749-28e54d15b568	6271	Dekani
00050000-5653-3f5b-989a-7949b391e3cd	5210	Deskle
00050000-5653-3f5b-3e6d-2033032a927a	2253	Destrnik
00050000-5653-3f5b-2acf-fd5e985ac2a7	6215	Divača
00050000-5653-3f5b-c5f1-653faee759ef	1233	Dob
00050000-5653-3f5b-a9b6-e6a3f805e144	3224	Dobje pri Planini
00050000-5653-3f5b-b3fd-727aa7d8c2d1	8257	Dobova
00050000-5653-3f5b-a956-87f5238b51ba	1423	Dobovec
00050000-5653-3f5b-1c12-e82864130c52	5263	Dobravlje
00050000-5653-3f5b-1815-1f7f42e024ae	3204	Dobrna
00050000-5653-3f5b-041c-26b2a90a3f3f	8211	Dobrnič
00050000-5653-3f5b-e426-17c92fe9b2e6	1356	Dobrova
00050000-5653-3f5b-207c-6905678611d6	9223	Dobrovnik/Dobronak 
00050000-5653-3f5b-47a5-3d346493a9a4	5212	Dobrovo v Brdih
00050000-5653-3f5b-8751-29d1e6cb618b	1431	Dol pri Hrastniku
00050000-5653-3f5b-ca29-390bcf2b7a79	1262	Dol pri Ljubljani
00050000-5653-3f5b-ccd1-7d71c4dbc093	1273	Dole pri Litiji
00050000-5653-3f5b-4600-ce415c7afbc7	1331	Dolenja vas
00050000-5653-3f5b-8615-b28fa975adbb	8350	Dolenjske Toplice
00050000-5653-3f5b-56ed-25732e61fbb1	1230	Domžale
00050000-5653-3f5b-7761-0c1e629fbb8c	2252	Dornava
00050000-5653-3f5b-b885-4548f828fe22	5294	Dornberk
00050000-5653-3f5b-1dd5-ee7999590fa3	1319	Draga
00050000-5653-3f5b-2117-fed31ddd25c1	8343	Dragatuš
00050000-5653-3f5b-72e7-f44351cc5a00	3222	Dramlje
00050000-5653-3f5b-766d-12ca5a8062ca	2370	Dravograd
00050000-5653-3f5b-5788-281de5739602	4203	Duplje
00050000-5653-3f5b-5378-c2e3265a9c84	6221	Dutovlje
00050000-5653-3f5b-447f-8245143c44b4	8361	Dvor
00050000-5653-3f5b-7a23-008c441634a2	2343	Fala
00050000-5653-3f5b-eafe-2d4226b9c1e8	9208	Fokovci
00050000-5653-3f5b-c3c1-e8327f8d7c94	2313	Fram
00050000-5653-3f5b-f702-0c6b5b926bcd	3213	Frankolovo
00050000-5653-3f5b-7f5e-e0ee0587ec1b	1274	Gabrovka
00050000-5653-3f5b-abcf-fdc5e4702df2	8254	Globoko
00050000-5653-3f5b-0076-ceced3936efe	5275	Godovič
00050000-5653-3f5b-f6c3-92884176dbf3	4204	Golnik
00050000-5653-3f5b-5a2a-0c740934253d	3303	Gomilsko
00050000-5653-3f5b-2d4c-33e1b0134729	4224	Gorenja vas
00050000-5653-3f5b-195b-51161641b5b6	3263	Gorica pri Slivnici
00050000-5653-3f5b-fc83-9b6bb8451160	2272	Gorišnica
00050000-5653-3f5b-bb22-16ac9ea76656	9250	Gornja Radgona
00050000-5653-3f5b-db2d-bfd832c719eb	3342	Gornji Grad
00050000-5653-3f5b-f9b4-a5dd71dfc70f	4282	Gozd Martuljek
00050000-5653-3f5b-a387-6b243b9863d9	6272	Gračišče
00050000-5653-3f5b-8ebc-b1c972a4929b	9264	Grad
00050000-5653-3f5b-1d7f-049c6a4a7a9d	8332	Gradac
00050000-5653-3f5b-4923-f515e701626e	1384	Grahovo
00050000-5653-3f5b-370c-41e02c968cd9	5242	Grahovo ob Bači
00050000-5653-3f5b-5197-aeb5b5e9f3fa	5251	Grgar
00050000-5653-3f5b-fb06-a9d01b494f91	3302	Griže
00050000-5653-3f5b-f929-bd4eb386e253	3231	Grobelno
00050000-5653-3f5b-d649-339d5d311ce9	1290	Grosuplje
00050000-5653-3f5b-2eb6-e2e89fa644df	2288	Hajdina
00050000-5653-3f5b-2311-d9754760a849	8362	Hinje
00050000-5653-3f5b-a239-dfc252a3956f	2311	Hoče
00050000-5653-3f5b-e446-48c53a916197	9205	Hodoš/Hodos
00050000-5653-3f5b-e844-1999eaaf4c07	1354	Horjul
00050000-5653-3f5b-8a3b-94cef5f004dc	1372	Hotedršica
00050000-5653-3f5b-e0df-e9ae96009c01	1430	Hrastnik
00050000-5653-3f5b-7263-7d1ede05ca75	6225	Hruševje
00050000-5653-3f5b-1a04-dbd206ea2594	4276	Hrušica
00050000-5653-3f5b-dee8-5706066b646a	5280	Idrija
00050000-5653-3f5b-f917-7b71ef135459	1292	Ig
00050000-5653-3f5b-3caf-78c94c775180	6250	Ilirska Bistrica
00050000-5653-3f5b-0235-83108bc1e6e4	6251	Ilirska Bistrica-Trnovo
00050000-5653-3f5b-addb-4fe55983731a	1295	Ivančna Gorica
00050000-5653-3f5b-9798-b5b5063a0e26	2259	Ivanjkovci
00050000-5653-3f5b-66e5-f256fc143cbe	1411	Izlake
00050000-5653-3f5b-409b-a1ebbbfd17d0	6310	Izola/Isola
00050000-5653-3f5b-f373-41d7c6030070	2222	Jakobski Dol
00050000-5653-3f5b-c91a-144151b51194	2221	Jarenina
00050000-5653-3f5b-509f-4772da2a0fa9	6254	Jelšane
00050000-5653-3f5b-7c28-8752293f4fb4	4270	Jesenice
00050000-5653-3f5b-3b34-3027f0b11779	8261	Jesenice na Dolenjskem
00050000-5653-3f5b-3290-0f0567cfbcc7	3273	Jurklošter
00050000-5653-3f5b-cce1-627cb86988e5	2223	Jurovski Dol
00050000-5653-3f5b-571c-203ebdfb6abb	2256	Juršinci
00050000-5653-3f5b-355b-b10fc61388ac	5214	Kal nad Kanalom
00050000-5653-3f5b-d959-33db653690cf	3233	Kalobje
00050000-5653-3f5b-06ea-89a9984cab84	4246	Kamna Gorica
00050000-5653-3f5b-104d-aa64a1ec2590	2351	Kamnica
00050000-5653-3f5b-e3e1-341cfe2199ec	1241	Kamnik
00050000-5653-3f5b-1501-e686c1948542	5213	Kanal
00050000-5653-3f5b-7b5c-36ef263a6c6c	8258	Kapele
00050000-5653-3f5b-ff28-9235f0ad1573	2362	Kapla
00050000-5653-3f5b-294a-2e9b6a1cb689	2325	Kidričevo
00050000-5653-3f5b-8823-0bdd2e71143e	1412	Kisovec
00050000-5653-3f5b-d5ef-1245753a3956	6253	Knežak
00050000-5653-3f5b-28f8-1341d3b796ca	5222	Kobarid
00050000-5653-3f5b-2121-afbd2adce758	9227	Kobilje
00050000-5653-3f5b-ea7d-b14fc8131371	1330	Kočevje
00050000-5653-3f5b-d9f8-090b041b0048	1338	Kočevska Reka
00050000-5653-3f5b-56be-2c3662f02f7e	2276	Kog
00050000-5653-3f5b-b24e-2e368b91b16f	5211	Kojsko
00050000-5653-3f5b-933e-933fd36fddc3	6223	Komen
00050000-5653-3f5b-e633-1cb877e63e99	1218	Komenda
00050000-5653-3f5b-2fcd-34c95570eabf	6000	Koper/Capodistria 
00050000-5653-3f5b-14a1-4f4101786ed5	6001	Koper/Capodistria - poštni predali
00050000-5653-3f5b-d193-0055c7773615	8282	Koprivnica
00050000-5653-3f5b-99da-1103ec42c16a	5296	Kostanjevica na Krasu
00050000-5653-3f5b-18d9-1b0053a8110e	8311	Kostanjevica na Krki
00050000-5653-3f5b-fc88-6df7fcdec3ef	1336	Kostel
00050000-5653-3f5b-586c-3c8254e52383	6256	Košana
00050000-5653-3f5b-bde3-9fe20fef7607	2394	Kotlje
00050000-5653-3f5b-506a-7f28c05ff43a	6240	Kozina
00050000-5653-3f5b-ac12-e14d4ba63b5c	3260	Kozje
00050000-5653-3f5b-c586-dafe17a5235d	4000	Kranj 
00050000-5653-3f5b-6993-5ffa3d465bc4	4001	Kranj - poštni predali
00050000-5653-3f5b-d5b6-27c05d17fab0	4280	Kranjska Gora
00050000-5653-3f5b-021d-7d6fe763e187	1281	Kresnice
00050000-5653-3f5b-31d4-745c474a198b	4294	Križe
00050000-5653-3f5b-d9a8-59894fbb9665	9206	Križevci
00050000-5653-3f5b-7e1f-93ac9205b150	9242	Križevci pri Ljutomeru
00050000-5653-3f5b-0b00-5414e6b34986	1301	Krka
00050000-5653-3f5b-4709-d7535c77a18d	8296	Krmelj
00050000-5653-3f5b-ccda-a16435461baf	4245	Kropa
00050000-5653-3f5c-9796-329897c7ab05	8262	Krška vas
00050000-5653-3f5c-19df-17cea53df69f	8270	Krško
00050000-5653-3f5c-847a-f7c233cd29be	9263	Kuzma
00050000-5653-3f5c-c846-19105ba55e3e	2318	Laporje
00050000-5653-3f5c-7334-738dd3414654	3270	Laško
00050000-5653-3f5c-5403-f7cf2e9728bf	1219	Laze v Tuhinju
00050000-5653-3f5c-e61c-32e88127a131	2230	Lenart v Slovenskih goricah
00050000-5653-3f5c-ace3-6cdbe20cc2f5	9220	Lendava/Lendva
00050000-5653-3f5c-86a1-83ffeda0a0da	4248	Lesce
00050000-5653-3f5c-c4fa-1b7c28fd73a2	3261	Lesično
00050000-5653-3f5c-a5e9-cb7363c4c33b	8273	Leskovec pri Krškem
00050000-5653-3f5c-61a6-5e6e53c15326	2372	Libeliče
00050000-5653-3f5c-89a5-7acec851ae18	2341	Limbuš
00050000-5653-3f5c-1ac0-392a1d81c8ee	1270	Litija
00050000-5653-3f5c-c483-9a82ad65fac6	3202	Ljubečna
00050000-5653-3f5c-574f-c65868ce124c	1000	Ljubljana 
00050000-5653-3f5c-fca2-8dff2db3ca6f	1001	Ljubljana - poštni predali
00050000-5653-3f5c-ee7d-32c97856e00e	1231	Ljubljana - Črnuče
00050000-5653-3f5c-ab0f-0388769550ea	1261	Ljubljana - Dobrunje
00050000-5653-3f5c-9e9d-d7615b6751b6	1260	Ljubljana - Polje
00050000-5653-3f5c-f96b-9aa514ce155d	1210	Ljubljana - Šentvid
00050000-5653-3f5c-f756-0c60b6b7169d	1211	Ljubljana - Šmartno
00050000-5653-3f5c-0737-b935bedc7861	3333	Ljubno ob Savinji
00050000-5653-3f5c-4272-6db0b65f6121	9240	Ljutomer
00050000-5653-3f5c-9c94-9ffdeebf3275	3215	Loče
00050000-5653-3f5c-dc6b-724bedfde513	5231	Log pod Mangartom
00050000-5653-3f5c-2190-cb1842444c4a	1358	Log pri Brezovici
00050000-5653-3f5c-2b30-73f6417e3b1a	1370	Logatec
00050000-5653-3f5c-175f-ef5ddbcab84d	1371	Logatec
00050000-5653-3f5c-073f-525b82f5ae9e	1434	Loka pri Zidanem Mostu
00050000-5653-3f5c-154d-978a16fe2f44	3223	Loka pri Žusmu
00050000-5653-3f5c-1545-ef4a6973be71	6219	Lokev
00050000-5653-3f5c-c336-fc48843e2fbf	1318	Loški Potok
00050000-5653-3f5c-0c3d-b2b5d5886a9a	2324	Lovrenc na Dravskem polju
00050000-5653-3f5c-9d62-01471610fd20	2344	Lovrenc na Pohorju
00050000-5653-3f5c-a3d1-7250bd44110b	3334	Luče
00050000-5653-3f5c-7be6-c89f2c0f81af	1225	Lukovica
00050000-5653-3f5c-73e8-e91dcfa3095d	9202	Mačkovci
00050000-5653-3f5c-8fa4-b2badab9cbe9	2322	Majšperk
00050000-5653-3f5c-7678-b4c3f86a3890	2321	Makole
00050000-5653-3f5c-3f1c-20d9a18effb0	9243	Mala Nedelja
00050000-5653-3f5c-2ad7-669966626690	2229	Malečnik
00050000-5653-3f5c-201f-78ac9967a986	6273	Marezige
00050000-5653-3f5c-cef6-f6f1a926c5aa	2000	Maribor 
00050000-5653-3f5c-df62-bf5d6e0cccee	2001	Maribor - poštni predali
00050000-5653-3f5c-5e50-9d07c8ab2b7a	2206	Marjeta na Dravskem polju
00050000-5653-3f5c-6608-8b35bdaca04e	2281	Markovci
00050000-5653-3f5c-e797-87b39cc7bff1	9221	Martjanci
00050000-5653-3f5c-c07a-a6924a2576b6	6242	Materija
00050000-5653-3f5c-46e8-95313945f38d	4211	Mavčiče
00050000-5653-3f5c-e573-a1a4162b14c2	1215	Medvode
00050000-5653-3f5c-677e-8b2d1b975fed	1234	Mengeš
00050000-5653-3f5c-aabb-084b5ee620ff	8330	Metlika
00050000-5653-3f5c-c63e-d8907598b389	2392	Mežica
00050000-5653-3f5c-d8fd-e3abb6728948	2204	Miklavž na Dravskem polju
00050000-5653-3f5c-6ee1-8b0d3542e0b6	2275	Miklavž pri Ormožu
00050000-5653-3f5c-9681-f325cd6e6ac2	5291	Miren
00050000-5653-3f5c-a5b8-1e98678d41fd	8233	Mirna
00050000-5653-3f5c-d610-77b6e34c4d9a	8216	Mirna Peč
00050000-5653-3f5c-42ce-cb757f6b1ca5	2382	Mislinja
00050000-5653-3f5c-eae3-c41d392c6a47	4281	Mojstrana
00050000-5653-3f5c-8421-563303e3c72f	8230	Mokronog
00050000-5653-3f5c-4914-f686a7d92f50	1251	Moravče
00050000-5653-3f5c-6a41-9273ce39306e	9226	Moravske Toplice
00050000-5653-3f5c-0770-ba9f4eff4752	5216	Most na Soči
00050000-5653-3f5c-a54b-d720b1f6a5c3	1221	Motnik
00050000-5653-3f5c-5197-0d77d4c58b63	3330	Mozirje
00050000-5653-3f5c-b8bd-ecaf4197a6ee	9000	Murska Sobota 
00050000-5653-3f5c-cf31-3d253dc50114	9001	Murska Sobota - poštni predali
00050000-5653-3f5c-de4d-33ca755b5c05	2366	Muta
00050000-5653-3f5c-3539-f2262450881e	4202	Naklo
00050000-5653-3f5c-f49d-0a52beb4999b	3331	Nazarje
00050000-5653-3f5c-ca93-3faff319fb5d	1357	Notranje Gorice
00050000-5653-3f5c-3f8e-74846e9040aa	3203	Nova Cerkev
00050000-5653-3f5c-675d-48c973883ad5	5000	Nova Gorica 
00050000-5653-3f5c-eb84-4f6cdddd4a0b	5001	Nova Gorica - poštni predali
00050000-5653-3f5c-a1a5-b6aa230d8021	1385	Nova vas
00050000-5653-3f5c-548b-2ae0677cf988	8000	Novo mesto
00050000-5653-3f5c-5dd6-a779dd4c4eac	8001	Novo mesto - poštni predali
00050000-5653-3f5c-afca-38fdeb24c308	6243	Obrov
00050000-5653-3f5c-4425-9ce12f6f5b15	9233	Odranci
00050000-5653-3f5c-cb1a-9461067e875f	2317	Oplotnica
00050000-5653-3f5c-9fca-d4cbb5a49021	2312	Orehova vas
00050000-5653-3f5c-99c3-549d373fe702	2270	Ormož
00050000-5653-3f5c-5362-b0d583924c64	1316	Ortnek
00050000-5653-3f5c-8d11-2c1f194e228b	1337	Osilnica
00050000-5653-3f5c-ca0b-e5cde9d58687	8222	Otočec
00050000-5653-3f5c-6b61-9d8576154234	2361	Ožbalt
00050000-5653-3f5c-6ec6-1fced90f548b	2231	Pernica
00050000-5653-3f5c-5c66-e65d37e1dcbd	2211	Pesnica pri Mariboru
00050000-5653-3f5c-ac85-b762bf61af57	9203	Petrovci
00050000-5653-3f5c-a446-1b8378f8c738	3301	Petrovče
00050000-5653-3f5c-c10c-d299380ea126	6330	Piran/Pirano
00050000-5653-3f5c-c92a-3f4cbbcf2c58	8255	Pišece
00050000-5653-3f5c-54a2-89959bbc7dcd	6257	Pivka
00050000-5653-3f5c-463f-4894e42a58f0	6232	Planina
00050000-5653-3f5c-e817-55869a2f2dc2	3225	Planina pri Sevnici
00050000-5653-3f5c-d28f-830307595585	6276	Pobegi
00050000-5653-3f5c-420a-dfe445d101b8	8312	Podbočje
00050000-5653-3f5c-b67c-4dc7b22179a2	5243	Podbrdo
00050000-5653-3f5c-a109-99ebb50646a5	3254	Podčetrtek
00050000-5653-3f5c-9e4b-c23517e5b31d	2273	Podgorci
00050000-5653-3f5c-3dca-8220a0bf44a1	6216	Podgorje
00050000-5653-3f5c-b80a-45f3ea5d1611	2381	Podgorje pri Slovenj Gradcu
00050000-5653-3f5c-1f8b-ffc83fe3e689	6244	Podgrad
00050000-5653-3f5c-580a-d9f07ab8f5fd	1414	Podkum
00050000-5653-3f5c-2f72-1093703b9b92	2286	Podlehnik
00050000-5653-3f5c-094d-bc4626e34681	5272	Podnanos
00050000-5653-3f5c-7f9c-e6adca80900e	4244	Podnart
00050000-5653-3f5c-eabd-d2f2dfc4c5fa	3241	Podplat
00050000-5653-3f5c-35ed-b81015e20b6b	3257	Podsreda
00050000-5653-3f5c-f196-7ecd3422d0ef	2363	Podvelka
00050000-5653-3f5c-d0f8-ab830d3d023b	2208	Pohorje
00050000-5653-3f5c-9a9e-43a15091ffa4	2257	Polenšak
00050000-5653-3f5c-09bf-3310ef9e331a	1355	Polhov Gradec
00050000-5653-3f5c-9ed4-f242064ad71b	4223	Poljane nad Škofjo Loko
00050000-5653-3f5c-79e5-870dae3a0236	2319	Poljčane
00050000-5653-3f5c-069a-4b1866d032b0	1272	Polšnik
00050000-5653-3f5c-744a-b6caa8b67ce8	3313	Polzela
00050000-5653-3f5c-efc3-3c209d0ebecf	3232	Ponikva
00050000-5653-3f5c-1a01-895e41e2c00d	6320	Portorož/Portorose
00050000-5653-3f5c-7719-03ff5ecc77ce	6230	Postojna
00050000-5653-3f5c-7544-3fe68d75c0a5	2331	Pragersko
00050000-5653-3f5c-dd43-f6866d73069e	3312	Prebold
00050000-5653-3f5c-3225-8da2f447fa70	4205	Preddvor
00050000-5653-3f5c-f701-1ff851f12a3d	6255	Prem
00050000-5653-3f5c-757e-be309026b3a4	1352	Preserje
00050000-5653-3f5c-d874-5497a66da3a7	6258	Prestranek
00050000-5653-3f5c-f9b7-6fc98d7f99ba	2391	Prevalje
00050000-5653-3f5c-fd14-7928f1e946bd	3262	Prevorje
00050000-5653-3f5c-f43a-a31aeea21897	1276	Primskovo 
00050000-5653-3f5c-0b04-f157721ec8e1	3253	Pristava pri Mestinju
00050000-5653-3f5c-dd53-03d8b209cecf	9207	Prosenjakovci/Partosfalva
00050000-5653-3f5c-4fcb-a03ee862e8dd	5297	Prvačina
00050000-5653-3f5c-bc87-544347e343c5	2250	Ptuj
00050000-5653-3f5c-9fca-6ac0a4e88dfa	2323	Ptujska Gora
00050000-5653-3f5c-31be-75f5d7c70752	9201	Puconci
00050000-5653-3f5c-f2d0-1de9883b5759	2327	Rače
00050000-5653-3f5c-3000-3c7f71131d91	1433	Radeče
00050000-5653-3f5c-3729-0759d1b17aa8	9252	Radenci
00050000-5653-3f5c-63dc-c4e8553afc41	2360	Radlje ob Dravi
00050000-5653-3f5c-1df0-f728cc38bfed	1235	Radomlje
00050000-5653-3f5c-2c3d-952d5ed576ca	4240	Radovljica
00050000-5653-3f5c-4f22-9d7681a9a2ff	8274	Raka
00050000-5653-3f5c-3afb-f64e27db8a81	1381	Rakek
00050000-5653-3f5c-2e2c-67151211ca61	4283	Rateče - Planica
00050000-5653-3f5c-b83a-074573e5a221	2390	Ravne na Koroškem
00050000-5653-3f5c-c01d-a9f864a5fdb6	9246	Razkrižje
00050000-5653-3f5c-1289-c93f6f0b911b	3332	Rečica ob Savinji
00050000-5653-3f5c-8741-3fbef87540a5	5292	Renče
00050000-5653-3f5c-bfd0-cc4bb8427376	1310	Ribnica
00050000-5653-3f5c-ad5a-5efbde78039e	2364	Ribnica na Pohorju
00050000-5653-3f5c-9425-be04e5f26f14	3272	Rimske Toplice
00050000-5653-3f5c-ecbb-519b11c9a2d1	1314	Rob
00050000-5653-3f5c-df8a-85f8c4aae191	5215	Ročinj
00050000-5653-3f5c-11eb-3aa14a3abc2d	3250	Rogaška Slatina
00050000-5653-3f5c-859a-8db5608963ab	9262	Rogašovci
00050000-5653-3f5c-012d-e9eaa8fdb226	3252	Rogatec
00050000-5653-3f5c-0a22-aab2ae71b8be	1373	Rovte
00050000-5653-3f5c-b8cf-163ab3ecf64f	2342	Ruše
00050000-5653-3f5c-50dd-fb4e2f95df27	1282	Sava
00050000-5653-3f5c-e065-e37650e00816	6333	Sečovlje/Sicciole
00050000-5653-3f5c-7ca4-8f20a65c4f69	4227	Selca
00050000-5653-3f5c-5419-4184822952a1	2352	Selnica ob Dravi
00050000-5653-3f5c-12e3-71442f2e08cc	8333	Semič
00050000-5653-3f5c-bf49-e430ec5778b4	8281	Senovo
00050000-5653-3f5c-529c-31d35c7cc6f4	6224	Senožeče
00050000-5653-3f5c-2544-c801fa70216e	8290	Sevnica
00050000-5653-3f5c-ce75-922b5af25710	6210	Sežana
00050000-5653-3f5c-90a6-715d6258356b	2214	Sladki Vrh
00050000-5653-3f5c-bcf8-f89eec9b263d	5283	Slap ob Idrijci
00050000-5653-3f5c-3278-78d9c182fe57	2380	Slovenj Gradec
00050000-5653-3f5c-1759-2a8724f207fb	2310	Slovenska Bistrica
00050000-5653-3f5c-433d-3d5e06f8208c	3210	Slovenske Konjice
00050000-5653-3f5c-0526-7cfea172fd65	1216	Smlednik
00050000-5653-3f5c-7366-6697f1295a26	5232	Soča
00050000-5653-3f5c-4ca7-c91d74c07455	1317	Sodražica
00050000-5653-3f5c-ff9d-bb0e246e0d74	3335	Solčava
00050000-5653-3f5c-23c8-84dacd42da03	5250	Solkan
00050000-5653-3f5c-5eec-a61647c158dc	4229	Sorica
00050000-5653-3f5c-55b9-97ad133724d9	4225	Sovodenj
00050000-5653-3f5c-fe38-3af8bb48ff05	5281	Spodnja Idrija
00050000-5653-3f5c-8a12-58023a9269e7	2241	Spodnji Duplek
00050000-5653-3f5c-e096-0209ba3c9573	9245	Spodnji Ivanjci
00050000-5653-3f5c-e3d8-5906f1e6b29e	2277	Središče ob Dravi
00050000-5653-3f5c-ca79-4ed842eb9430	4267	Srednja vas v Bohinju
00050000-5653-3f5c-37f5-46a1a232ff0f	8256	Sromlje 
00050000-5653-3f5c-4cc0-6e834751d2c0	5224	Srpenica
00050000-5653-3f5c-c26c-2ffd88a6a7e9	1242	Stahovica
00050000-5653-3f5c-c322-411172e4160f	1332	Stara Cerkev
00050000-5653-3f5c-ea5b-0e610e4726c9	8342	Stari trg ob Kolpi
00050000-5653-3f5c-a376-297df3b80f01	1386	Stari trg pri Ložu
00050000-5653-3f5c-66ec-4d059251658c	2205	Starše
00050000-5653-3f5c-ed2d-a6826c108397	2289	Stoperce
00050000-5653-3f5c-4fcc-fb39196de980	8322	Stopiče
00050000-5653-3f5c-dc0c-0c5172d2e270	3206	Stranice
00050000-5653-3f5c-b73d-9070770b97c0	8351	Straža
00050000-5653-3f5c-0804-972a207c9abc	1313	Struge
00050000-5653-3f5c-1c8c-7ac49e5e2377	8293	Studenec
00050000-5653-3f5c-1b76-14acbc9864f6	8331	Suhor
00050000-5653-3f5c-eb60-9e2ecbb3f89f	2233	Sv. Ana v Slovenskih goricah
00050000-5653-3f5c-466d-f07c9209e553	2235	Sv. Trojica v Slovenskih goricah
00050000-5653-3f5c-4c93-1bd8775a7707	2353	Sveti Duh na Ostrem Vrhu
00050000-5653-3f5c-efe1-d707c2b0038b	9244	Sveti Jurij ob Ščavnici
00050000-5653-3f5c-c6f2-03b4b2e7f28b	3264	Sveti Štefan
00050000-5653-3f5c-9e24-6816b88b8d4c	2258	Sveti Tomaž
00050000-5653-3f5c-a38b-04b8b180291a	9204	Šalovci
00050000-5653-3f5c-8b54-bb3e348a1272	5261	Šempas
00050000-5653-3f5c-2a82-0365515a9252	5290	Šempeter pri Gorici
00050000-5653-3f5c-994f-e981cb73feab	3311	Šempeter v Savinjski dolini
00050000-5653-3f5c-9e6e-9169a164b27c	4208	Šenčur
00050000-5653-3f5c-f3fa-6669a08e5396	2212	Šentilj v Slovenskih goricah
00050000-5653-3f5c-dd20-97823a65c854	8297	Šentjanž
00050000-5653-3f5c-7596-a9f53b391b91	2373	Šentjanž pri Dravogradu
00050000-5653-3f5c-d075-e69187852114	8310	Šentjernej
00050000-5653-3f5c-327b-752ea58840ae	3230	Šentjur
00050000-5653-3f5c-d186-0fa431149c56	3271	Šentrupert
00050000-5653-3f5c-edb2-fe815874320d	8232	Šentrupert
00050000-5653-3f5c-8573-584209bf1e2d	1296	Šentvid pri Stični
00050000-5653-3f5c-c66e-1f67acaf675e	8275	Škocjan
00050000-5653-3f5c-0aef-8c89ebc446c6	6281	Škofije
00050000-5653-3f5c-1715-be1ecc1d7e5a	4220	Škofja Loka
00050000-5653-3f5c-1625-424b3e92cbe5	3211	Škofja vas
00050000-5653-3f5c-6981-a964f77af2ee	1291	Škofljica
00050000-5653-3f5c-abf6-4ab318df53ed	6274	Šmarje
00050000-5653-3f5c-9657-336e9f444b7a	1293	Šmarje - Sap
00050000-5653-3f5c-48a2-700f82b4a2e3	3240	Šmarje pri Jelšah
00050000-5653-3f5c-f9af-f854ccc34c57	8220	Šmarješke Toplice
00050000-5653-3f5c-120f-246bc25823d8	2315	Šmartno na Pohorju
00050000-5653-3f5c-5aae-45037617289b	3341	Šmartno ob Dreti
00050000-5653-3f5c-a72d-21a187ac0d9a	3327	Šmartno ob Paki
00050000-5653-3f5c-3458-e9076ef70ef3	1275	Šmartno pri Litiji
00050000-5653-3f5c-c780-f0e303269b75	2383	Šmartno pri Slovenj Gradcu
00050000-5653-3f5c-7a95-d07852fa30a5	3201	Šmartno v Rožni dolini
00050000-5653-3f5c-0dd9-892e96e5c551	3325	Šoštanj
00050000-5653-3f5c-9a31-58d3498714be	6222	Štanjel
00050000-5653-3f5c-9957-621184529b21	3220	Štore
00050000-5653-3f5c-1e47-7926d578c58e	3304	Tabor
00050000-5653-3f5c-7616-c165992fefc8	3221	Teharje
00050000-5653-3f5c-7645-dcaaeb4a68c3	9251	Tišina
00050000-5653-3f5c-fc4b-cc9dd6ce4f83	5220	Tolmin
00050000-5653-3f5c-a238-b070ea5b6a15	3326	Topolšica
00050000-5653-3f5c-8e01-a0dd4bcb6b07	2371	Trbonje
00050000-5653-3f5c-4a0e-90f5369d7502	1420	Trbovlje
00050000-5653-3f5c-4f96-26fd1e305a1d	8231	Trebelno 
00050000-5653-3f5c-6590-d2980e07430f	8210	Trebnje
00050000-5653-3f5c-9acb-92040eae191c	5252	Trnovo pri Gorici
00050000-5653-3f5c-17f2-ce53bdd4067a	2254	Trnovska vas
00050000-5653-3f5c-53ed-968cd1a5a35d	1222	Trojane
00050000-5653-3f5c-cdd5-e2f4e082ad49	1236	Trzin
00050000-5653-3f5c-9a71-59e0310af433	4290	Tržič
00050000-5653-3f5c-c3f3-354f7e0f92a4	8295	Tržišče
00050000-5653-3f5c-f78f-636175016c4b	1311	Turjak
00050000-5653-3f5c-2502-fa684641635d	9224	Turnišče
00050000-5653-3f5c-2d05-311b4c8cadce	8323	Uršna sela
00050000-5653-3f5c-8b32-9eae010021ee	1252	Vače
00050000-5653-3f5c-3d11-4c8c6aea4d3c	3320	Velenje 
00050000-5653-3f5c-edf7-9a9f59c58b67	3322	Velenje - poštni predali
00050000-5653-3f5c-fa5b-47de76cb43c1	8212	Velika Loka
00050000-5653-3f5c-d6fa-307d7b3fc10d	2274	Velika Nedelja
00050000-5653-3f5c-dcde-b92534a84abd	9225	Velika Polana
00050000-5653-3f5c-bb17-8b4be508569a	1315	Velike Lašče
00050000-5653-3f5c-8439-9f03949ad374	8213	Veliki Gaber
00050000-5653-3f5c-d6b6-b0fc6f1a3d72	9241	Veržej
00050000-5653-3f5c-97a4-1b4ad0ff3930	1312	Videm - Dobrepolje
00050000-5653-3f5c-50e1-7b6a9cd3bacf	2284	Videm pri Ptuju
00050000-5653-3f5c-ef0f-4b1064075925	8344	Vinica
00050000-5653-3f5c-6724-84ba668905fa	5271	Vipava
00050000-5653-3f5c-6199-f8a353b1d2ec	4212	Visoko
00050000-5653-3f5c-4352-bead7ab1d384	1294	Višnja Gora
00050000-5653-3f5c-ab24-0ec15e3e8065	3205	Vitanje
00050000-5653-3f5c-7c43-d22fb59c0d88	2255	Vitomarci
00050000-5653-3f5c-2b8b-5075ebd8b685	1217	Vodice
00050000-5653-3f5c-61c0-362da370e6ea	3212	Vojnik\t
00050000-5653-3f5c-9a89-7843cdff05fa	5293	Volčja Draga
00050000-5653-3f5c-772e-cbc8141d9722	2232	Voličina
00050000-5653-3f5c-24e5-c721d3259e8e	3305	Vransko
00050000-5653-3f5c-e9ab-c0c8ac5087f7	6217	Vremski Britof
00050000-5653-3f5c-6d65-6433acb763a1	1360	Vrhnika
00050000-5653-3f5c-c6b3-a6b40c107f61	2365	Vuhred
00050000-5653-3f5c-369b-25d91ee9d105	2367	Vuzenica
00050000-5653-3f5c-aca8-dc2842e36a70	8292	Zabukovje 
00050000-5653-3f5c-1b8a-535c77001dc2	1410	Zagorje ob Savi
00050000-5653-3f5c-4f50-7b426f44638b	1303	Zagradec
00050000-5653-3f5c-8b37-6199844112df	2283	Zavrč
00050000-5653-3f5c-8ce5-07b1fa350266	8272	Zdole 
00050000-5653-3f5c-9e68-e3361a4a73e8	4201	Zgornja Besnica
00050000-5653-3f5c-e397-5149dc54482b	2242	Zgornja Korena
00050000-5653-3f5c-c4a2-23096a4121e3	2201	Zgornja Kungota
00050000-5653-3f5c-07a5-0521c25e4525	2316	Zgornja Ložnica
00050000-5653-3f5c-6a79-23d5e2d6415a	2314	Zgornja Polskava
00050000-5653-3f5c-dc8f-bececb2bde12	2213	Zgornja Velka
00050000-5653-3f5c-0a6a-3efac036e926	4247	Zgornje Gorje
00050000-5653-3f5c-3523-927fa71d51e9	4206	Zgornje Jezersko
00050000-5653-3f5c-c01a-22c8d1098aba	2285	Zgornji Leskovec
00050000-5653-3f5c-5787-cee959fa4032	1432	Zidani Most
00050000-5653-3f5c-c023-0e06baf3de82	3214	Zreče
00050000-5653-3f5c-269a-47991750442a	4209	Žabnica
00050000-5653-3f5c-2a93-d9f86fc58edb	3310	Žalec
00050000-5653-3f5c-86ce-dc394bc059ec	4228	Železniki
00050000-5653-3f5c-09ef-d048c2a41ffe	2287	Žetale
00050000-5653-3f5c-833d-bd844c7f5b37	4226	Žiri
00050000-5653-3f5c-5cc1-f2b940deaea2	4274	Žirovnica
00050000-5653-3f5c-29e5-c85503062589	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 29288453)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 29288029)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 29287777)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5653-3f5e-7f8b-42d9bfe149de	00080000-5653-3f5e-58f0-655730e84ccb	\N	00040000-5653-3f5c-15fb-de38b6241296	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5653-3f5e-146b-da7762206a86	00080000-5653-3f5e-58f0-655730e84ccb	\N	00040000-5653-3f5c-15fb-de38b6241296	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5653-3f5e-547b-5a59641ddb7d	00080000-5653-3f5e-9e92-b21ef19224f9	\N	00040000-5653-3f5c-15fb-de38b6241296	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 29287921)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5653-3f5c-b634-d9f9f9ae920e	novo leto	1	1	\N	t
00430000-5653-3f5c-ebae-aada0c8f56d4	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5653-3f5c-a25a-0ab530ccdc2e	dan upora proti okupatorju	27	4	\N	t
00430000-5653-3f5c-a560-eb6fa3c86180	praznik dela	1	5	\N	t
00430000-5653-3f5c-861f-fd95a604c888	praznik dela	2	5	\N	t
00430000-5653-3f5c-9380-ff50200b0ff6	dan Primoža Trubarja	8	6	\N	f
00430000-5653-3f5c-4487-e2065fda2176	dan državnosti	25	6	\N	t
00430000-5653-3f5c-9c4b-cd0bcde9b8f3	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5653-3f5c-da7d-b7202ec5b1a4	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5653-3f5c-0553-feabcc504f4e	dan suverenosti	25	10	\N	f
00430000-5653-3f5c-1676-83846e5939d5	dan spomina na mrtve	1	11	\N	t
00430000-5653-3f5c-021b-3998d0cc763c	dan Rudolfa Maistra	23	11	\N	f
00430000-5653-3f5c-bd95-2927a786a004	božič	25	12	\N	t
00430000-5653-3f5c-f41c-bdd306c49371	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5653-3f5c-ba65-3fb3c0948737	Marijino vnebovzetje	15	8	\N	t
00430000-5653-3f5c-4094-39cb7fe74868	dan reformacije	31	10	\N	t
00430000-5653-3f5c-fcda-7a4aede619e3	velikonočna nedelja	27	3	2016	t
00430000-5653-3f5c-0a9b-349c3a49e926	velikonočna nedelja	16	4	2017	t
00430000-5653-3f5c-dc8e-fdcb90c240aa	velikonočna nedelja	1	4	2018	t
00430000-5653-3f5c-6458-562d82e2c31a	velikonočna nedelja	21	4	2019	t
00430000-5653-3f5c-fa17-a62b596c8d5f	velikonočna nedelja	12	4	2020	t
00430000-5653-3f5c-cf70-27cacb6c4aa4	velikonočna nedelja	4	4	2021	t
00430000-5653-3f5c-13b6-859a5ea85be7	velikonočna nedelja	17	4	2022	t
00430000-5653-3f5c-7f6b-9d9ddbb56548	velikonočna nedelja	9	4	2023	t
00430000-5653-3f5c-abf3-2f7c7f000445	velikonočna nedelja	31	3	2024	t
00430000-5653-3f5c-d532-81867b475199	velikonočna nedelja	20	4	2025	t
00430000-5653-3f5c-00aa-81ceb68e33af	velikonočna nedelja	5	4	2026	t
00430000-5653-3f5c-d903-b6e70bf93405	velikonočna nedelja	28	3	2027	t
00430000-5653-3f5c-d0b1-c882e25edc9c	velikonočna nedelja	16	4	2028	t
00430000-5653-3f5c-5c9e-5a2b65cdec2a	velikonočna nedelja	1	4	2029	t
00430000-5653-3f5c-78d8-d562bb661117	velikonočna nedelja	21	4	2030	t
00430000-5653-3f5c-b806-99797ed19d34	velikonočni ponedeljek	28	3	2016	t
00430000-5653-3f5c-6132-53e50660b17e	velikonočni ponedeljek	17	4	2017	t
00430000-5653-3f5c-1447-e418a72630d0	velikonočni ponedeljek	2	4	2018	t
00430000-5653-3f5c-7dc1-e12298f6319a	velikonočni ponedeljek	22	4	2019	t
00430000-5653-3f5c-6e33-ecf86e080b17	velikonočni ponedeljek	13	4	2020	t
00430000-5653-3f5c-5e76-3438a3256113	velikonočni ponedeljek	5	4	2021	t
00430000-5653-3f5c-5442-6f764a492b72	velikonočni ponedeljek	18	4	2022	t
00430000-5653-3f5c-b6f3-40d430a2a827	velikonočni ponedeljek	10	4	2023	t
00430000-5653-3f5c-a60e-0301d2d392b2	velikonočni ponedeljek	1	4	2024	t
00430000-5653-3f5c-72d4-53ff8764008b	velikonočni ponedeljek	21	4	2025	t
00430000-5653-3f5c-fc13-eb0dcea19a21	velikonočni ponedeljek	6	4	2026	t
00430000-5653-3f5c-bf7d-c221d2c216ed	velikonočni ponedeljek	29	3	2027	t
00430000-5653-3f5c-8a4d-9e1edb39e959	velikonočni ponedeljek	17	4	2028	t
00430000-5653-3f5c-1a1a-6c5887ce0a07	velikonočni ponedeljek	2	4	2029	t
00430000-5653-3f5c-a913-09cb188c99be	velikonočni ponedeljek	22	4	2030	t
00430000-5653-3f5c-0875-6e6676cac4e4	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5653-3f5c-c034-22c500399545	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5653-3f5c-dd39-5c1abe9fc197	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5653-3f5c-a1df-a1a96220b240	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5653-3f5c-d289-bc484248ab30	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5653-3f5c-9da2-282ca66f0647	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5653-3f5c-fd96-3fcba39d7788	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5653-3f5c-92fd-989fa1746acc	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5653-3f5c-1853-382e946e5aaa	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5653-3f5c-94f7-2dbc6816bc43	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5653-3f5c-b1af-00bed7f1d429	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5653-3f5c-80b9-9fa9e0a2151d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5653-3f5c-388d-d623dd8526f9	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5653-3f5c-8f73-6d452e125442	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5653-3f5c-44d9-64f72d8f6298	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 29287881)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 29287893)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 29288041)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 29288467)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 29288477)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5653-3f5e-d941-199e4b56e7e0	00080000-5653-3f5e-95a1-2558bbba51b2	0987	AK
00190000-5653-3f5e-666f-a51d25ad987d	00080000-5653-3f5e-9e92-b21ef19224f9	0989	AK
00190000-5653-3f5e-0d03-74315f7efa92	00080000-5653-3f5e-4064-7dbaa898824e	0986	AK
00190000-5653-3f5e-f81a-d4aec3b12a7a	00080000-5653-3f5e-020a-b347446fba5d	0984	AK
00190000-5653-3f5e-d8d2-d6fc082c638f	00080000-5653-3f5e-013f-d5c35f922a40	0983	AK
00190000-5653-3f5e-f83b-a2bda347a262	00080000-5653-3f5e-4e59-d28bc0123c17	0982	AK
00190000-5653-3f60-5eb3-7b5971538d6f	00080000-5653-3f60-31ee-7768bb2cdf87	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 29288376)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5653-3f5f-976d-2aff779c96eb	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 29288485)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 29288070)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5653-3f5e-046e-8956fe696a0b	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5653-3f5e-223e-cf7fd5572d0f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5653-3f5e-0e0e-a27c1db3b7c6	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5653-3f5e-0dd0-12f068db9414	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5653-3f5e-9fbf-340b4b328d80	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5653-3f5e-8d32-11db6c3c7b08	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5653-3f5e-8040-d901c8534283	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 29288014)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 29288004)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 29288215)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 29288145)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 29287855)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 29287617)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5653-3f60-31ee-7768bb2cdf87	00010000-5653-3f5d-5d8b-e88ba2f8f00f	2015-11-23 17:31:28	INS	a:0:{}
2	App\\Entity\\Option	00000000-5653-3f60-8c2a-2bd9ddd568d4	00010000-5653-3f5d-5d8b-e88ba2f8f00f	2015-11-23 17:31:28	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5653-3f60-5eb3-7b5971538d6f	00010000-5653-3f5d-5d8b-e88ba2f8f00f	2015-11-23 17:31:28	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 29288083)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 29287655)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5653-3f5c-e823-7f11b7699889	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5653-3f5c-f925-e7f83de7aba5	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5653-3f5c-e414-a2dbb923c59a	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5653-3f5c-44b4-4a5e4a4dc0f5	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5653-3f5c-2fa7-f217bb23c80f	planer	Planer dogodkov v koledarju	t
00020000-5653-3f5c-be43-f5de710c8e56	kadrovska	Kadrovska služba	t
00020000-5653-3f5c-ce4a-89fbd9003f10	arhivar	Ažuriranje arhivalij	t
00020000-5653-3f5c-62e1-7922a5d219ae	igralec	Igralec	t
00020000-5653-3f5c-dd9b-f96dc8692dd2	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5653-3f5e-a728-8cc1db01a1e0	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5653-3f5e-b586-e4cd15e935c0	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-f018-9186dcd912a1	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-a6c9-0a05094acbd0	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-4857-4a876bfe7bbe	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-1dad-86e9728297ec	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-aae7-71b156d7788c	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-93c9-f27408ef6b5a	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-0efb-b904d8193b2c	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-c69f-e53e8ef74afb	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-6d4f-88db78a37d51	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-5f64-144254db3978	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-7636-3848e6f9491d	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-ecdf-d35f2037e435	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-4048-5f2930cf4b73	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-2dc6-7a932cc70f2d	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-9fb1-cdd441f47f54	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5653-3f5e-95ee-cfd734503684	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3099 (class 0 OID 29287639)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5653-3f5c-e2cc-80fb8de7170c	00020000-5653-3f5c-e414-a2dbb923c59a
00010000-5653-3f5d-5d8b-e88ba2f8f00f	00020000-5653-3f5c-e414-a2dbb923c59a
00010000-5653-3f5e-a313-b0717ba288b2	00020000-5653-3f5e-a728-8cc1db01a1e0
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-b586-e4cd15e935c0
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-1dad-86e9728297ec
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-c69f-e53e8ef74afb
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-5f64-144254db3978
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-4048-5f2930cf4b73
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-9fb1-cdd441f47f54
00010000-5653-3f5e-3dbd-8943cebc5f86	00020000-5653-3f5e-a6c9-0a05094acbd0
00010000-5653-3f5e-78e7-2f308f548291	00020000-5653-3f5e-b586-e4cd15e935c0
00010000-5653-3f5e-78e7-2f308f548291	00020000-5653-3f5e-f018-9186dcd912a1
00010000-5653-3f5e-78e7-2f308f548291	00020000-5653-3f5e-a6c9-0a05094acbd0
00010000-5653-3f5e-78e7-2f308f548291	00020000-5653-3f5e-4857-4a876bfe7bbe
00010000-5653-3f5e-9573-efe8962b1923	00020000-5653-3f5e-b586-e4cd15e935c0
00010000-5653-3f5e-9573-efe8962b1923	00020000-5653-3f5e-f018-9186dcd912a1
00010000-5653-3f5e-9573-efe8962b1923	00020000-5653-3f5e-a6c9-0a05094acbd0
00010000-5653-3f5e-9573-efe8962b1923	00020000-5653-3f5e-4857-4a876bfe7bbe
00010000-5653-3f5e-9573-efe8962b1923	00020000-5653-3f5e-5f64-144254db3978
00010000-5653-3f5e-1710-6f2fe17fb016	00020000-5653-3f5e-f018-9186dcd912a1
00010000-5653-3f5e-1710-6f2fe17fb016	00020000-5653-3f5e-aae7-71b156d7788c
00010000-5653-3f5e-1710-6f2fe17fb016	00020000-5653-3f5e-6d4f-88db78a37d51
00010000-5653-3f5e-1710-6f2fe17fb016	00020000-5653-3f5e-7636-3848e6f9491d
00010000-5653-3f5e-1710-6f2fe17fb016	00020000-5653-3f5e-5f64-144254db3978
00010000-5653-3f5e-1710-6f2fe17fb016	00020000-5653-3f5e-2dc6-7a932cc70f2d
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-f018-9186dcd912a1
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-aae7-71b156d7788c
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-0efb-b904d8193b2c
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-6d4f-88db78a37d51
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-7636-3848e6f9491d
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-5f64-144254db3978
00010000-5653-3f5e-be30-4dba7857037b	00020000-5653-3f5e-2dc6-7a932cc70f2d
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-f018-9186dcd912a1
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-a6c9-0a05094acbd0
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-aae7-71b156d7788c
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-93c9-f27408ef6b5a
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-0efb-b904d8193b2c
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-1dad-86e9728297ec
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-6d4f-88db78a37d51
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-7636-3848e6f9491d
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-5f64-144254db3978
00010000-5653-3f5e-581d-7803531cc422	00020000-5653-3f5e-2dc6-7a932cc70f2d
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-b586-e4cd15e935c0
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-4857-4a876bfe7bbe
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-1dad-86e9728297ec
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-c69f-e53e8ef74afb
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-5f64-144254db3978
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-4048-5f2930cf4b73
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	00020000-5653-3f5e-9fb1-cdd441f47f54
00010000-5653-3f5e-220f-48b8e7b48974	00020000-5653-3f5e-95ee-cfd734503684
\.


--
-- TOC entry 3144 (class 0 OID 29288097)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 29288035)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 29287981)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5653-3f5e-9ec5-f62d5be5b61e	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5653-3f5e-813e-50422d81b873	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5653-3f5e-f00d-69e13c0f1dee	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 29287604)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5653-3f5c-9f88-e0bab952c3c4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5653-3f5c-28cd-2563d88d6dc9	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5653-3f5c-9084-5235d4c8cd6b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5653-3f5c-f5e7-ec01c252d104	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5653-3f5c-608c-9f0fb542bf5a	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 29287596)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5653-3f5c-3644-423a4d432121	00230000-5653-3f5c-f5e7-ec01c252d104	popa
00240000-5653-3f5c-500e-68b11dc65d07	00230000-5653-3f5c-f5e7-ec01c252d104	oseba
00240000-5653-3f5c-a53e-305fa172cf08	00230000-5653-3f5c-f5e7-ec01c252d104	tippopa
00240000-5653-3f5c-971d-737ff1c37c77	00230000-5653-3f5c-f5e7-ec01c252d104	organizacijskaenota
00240000-5653-3f5c-4550-4bcc1a73d4cd	00230000-5653-3f5c-f5e7-ec01c252d104	sezona
00240000-5653-3f5c-c4ef-8b46c816bf49	00230000-5653-3f5c-f5e7-ec01c252d104	tipvaje
00240000-5653-3f5c-960c-b859d7753f90	00230000-5653-3f5c-28cd-2563d88d6dc9	prostor
00240000-5653-3f5c-aa7a-bc1bb87ae0b8	00230000-5653-3f5c-f5e7-ec01c252d104	besedilo
00240000-5653-3f5c-1d99-e18b81be1381	00230000-5653-3f5c-f5e7-ec01c252d104	uprizoritev
00240000-5653-3f5c-9451-daddb0d8ed11	00230000-5653-3f5c-f5e7-ec01c252d104	funkcija
00240000-5653-3f5c-f0a2-1ca578a435f0	00230000-5653-3f5c-f5e7-ec01c252d104	tipfunkcije
00240000-5653-3f5c-d0f2-8ac94eeaf130	00230000-5653-3f5c-f5e7-ec01c252d104	alternacija
00240000-5653-3f5c-1e08-3b6d11abf4f6	00230000-5653-3f5c-9f88-e0bab952c3c4	pogodba
00240000-5653-3f5c-9f2e-50b320f46f86	00230000-5653-3f5c-f5e7-ec01c252d104	zaposlitev
00240000-5653-3f5c-e6db-b056d351c3ec	00230000-5653-3f5c-f5e7-ec01c252d104	zvrstuprizoritve
00240000-5653-3f5c-be6a-57a239e1eba1	00230000-5653-3f5c-9f88-e0bab952c3c4	programdela
00240000-5653-3f5c-8261-e39feda668c7	00230000-5653-3f5c-f5e7-ec01c252d104	zapis
\.


--
-- TOC entry 3093 (class 0 OID 29287591)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
5fba57db-f85b-4cf7-bbb9-d0a69b93587d	00240000-5653-3f5c-3644-423a4d432121	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 29288162)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5653-3f5f-ef8b-10594e4186bc	000e0000-5653-3f5e-1c8e-00d7de9e4f34	00080000-5653-3f5e-58f0-655730e84ccb	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5653-3f5c-d76a-4b4eea5b3197
00270000-5653-3f5f-bebe-583118b750a3	000e0000-5653-3f5e-1c8e-00d7de9e4f34	00080000-5653-3f5e-58f0-655730e84ccb	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5653-3f5c-d76a-4b4eea5b3197
\.


--
-- TOC entry 3109 (class 0 OID 29287739)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 29287991)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5653-3f5f-ca6f-e721664abf67	00180000-5653-3f5f-7d81-21c602ed2c3d	000c0000-5653-3f5f-3be0-57105d708396	00090000-5653-3f5e-ca6d-fcd477964ced	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5653-3f5f-1b30-cf889df6e1c2	00180000-5653-3f5f-7d81-21c602ed2c3d	000c0000-5653-3f5f-390a-2dec88d8ed72	00090000-5653-3f5e-99a3-4d7b9febc2b3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5653-3f5f-7f23-0787eecfb541	00180000-5653-3f5f-7d81-21c602ed2c3d	000c0000-5653-3f5f-8c37-d5bd9af5120d	00090000-5653-3f5e-c2e3-13c2c27e228f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5653-3f5f-7603-a5eb5250fd1f	00180000-5653-3f5f-7d81-21c602ed2c3d	000c0000-5653-3f5f-6daf-696bae31f155	00090000-5653-3f5e-48ab-7ee39d6a0d48	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5653-3f5f-6339-9872497919ed	00180000-5653-3f5f-7d81-21c602ed2c3d	000c0000-5653-3f5f-0204-e6737ca69b5c	00090000-5653-3f5e-74c8-ed5fb36a3a49	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5653-3f5f-f1a5-898826977aaa	00180000-5653-3f5f-e8e9-59bfd28d2ff4	\N	00090000-5653-3f5e-74c8-ed5fb36a3a49	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5653-3f5f-c64e-d4d5c5537174	00180000-5653-3f5f-e8e9-59bfd28d2ff4	\N	00090000-5653-3f5e-99a3-4d7b9febc2b3	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 29288203)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5653-3f5c-574b-92b31826e8cb	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5653-3f5c-6d16-19bebbca48ca	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5653-3f5c-456a-16f4937e4541	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5653-3f5c-7261-0d88cb687b5f	04	Režija	Režija	Režija	umetnik	30
000f0000-5653-3f5c-93fc-62af67877829	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5653-3f5c-47be-a2f613c6a2b8	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5653-3f5c-b03e-341229c679c1	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5653-3f5c-dfbd-8d5952636e4b	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5653-3f5c-54ec-54811bd34fa6	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5653-3f5c-9540-53137aa0449a	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5653-3f5c-f68a-cb2eb6758f93	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5653-3f5c-aa7d-977a884225ff	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5653-3f5c-2cc7-b79c0a5bc36e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5653-3f5c-6b03-210c9a81f6c5	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5653-3f5c-c041-753d2097dd5c	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5653-3f5c-64ae-f81798ddb0b4	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5653-3f5c-d371-143c4f8c9d2a	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5653-3f5c-098e-4d850f0743e0	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 29287690)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5653-3f5e-21fd-8447c01e52d3	0001	šola	osnovna ali srednja šola
00400000-5653-3f5e-df22-747b20f74953	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5653-3f5e-a78d-9a97a49e4cad	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 29288496)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5653-3f5c-f4fa-e4bb59836924	01	Velika predstava	f	1.00	1.00
002b0000-5653-3f5c-f8fe-55af25dd08b5	02	Mala predstava	f	0.50	0.50
002b0000-5653-3f5c-951b-f0c3cfc28685	03	Mala koprodukcija	t	0.40	1.00
002b0000-5653-3f5c-a12a-6f4a57021a10	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5653-3f5c-8cce-e3e030906819	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 29287971)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5653-3f5c-646a-80d08acfc5f9	0001	prva vaja	prva vaja
00420000-5653-3f5c-664b-ad47f2faeea1	0002	tehnična vaja	tehnična vaja
00420000-5653-3f5c-e991-b9f371366622	0003	lučna vaja	lučna vaja
00420000-5653-3f5c-2abf-0d5e56ad17c1	0004	kostumska vaja	kostumska vaja
00420000-5653-3f5c-a179-9c751a801ab1	0005	foto vaja	foto vaja
00420000-5653-3f5c-5115-76f9e1cd8b45	0006	1. glavna vaja	1. glavna vaja
00420000-5653-3f5c-d106-988a6ba167b5	0007	2. glavna vaja	2. glavna vaja
00420000-5653-3f5c-c353-ef1b03ff4825	0008	1. generalka	1. generalka
00420000-5653-3f5c-62eb-d6f4734ecdbb	0009	2. generalka	2. generalka
00420000-5653-3f5c-54a8-32bb9b5830bc	0010	odprta generalka	odprta generalka
00420000-5653-3f5c-f8de-61be0999829e	0011	obnovitvena vaja	obnovitvena vaja
00420000-5653-3f5c-4116-575b21e88d79	0012	pevska vaja	pevska vaja
00420000-5653-3f5c-9da1-a247a408d2a0	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5653-3f5c-4e7f-441311e884bd	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 29287812)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 29287626)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5653-3f5d-5d8b-e88ba2f8f00f	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxRONr/KkYWAaYpG9TcbInrQ0I12sBB7ekG	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-a9a2-93274ea3b4a8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-eb6e-91e81527243c	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-c960-6691b415ea44	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-8434-8167e1717b1b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-1926-4ba1c225d793	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-e7a5-7c288b549764	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-7c06-9b64ba6b904f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-c98b-dad45f0a826e	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-707a-1bcf3933680e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-a313-b0717ba288b2	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-c805-66a2c4a8e6fa	testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-3dbd-8943cebc5f86	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-78e7-2f308f548291	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-9573-efe8962b1923	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-1710-6f2fe17fb016	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-be30-4dba7857037b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-581d-7803531cc422	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-fcb9-b4c9a1b53e6d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5653-3f5e-220f-48b8e7b48974	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5653-3f5c-e2cc-80fb8de7170c	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 29288253)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5653-3f5e-dcc4-83ac0b214502	00160000-5653-3f5e-ef2b-e2413c7087fd	\N	00140000-5653-3f5c-054c-68225159d6bd	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5653-3f5e-9fbf-340b4b328d80
000e0000-5653-3f5e-1c8e-00d7de9e4f34	00160000-5653-3f5e-edc2-53b07e08c947	\N	00140000-5653-3f5c-28e5-dfd432d6a8ee	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5653-3f5e-8d32-11db6c3c7b08
000e0000-5653-3f5e-bf38-8e952edbc665	\N	\N	00140000-5653-3f5c-28e5-dfd432d6a8ee	00190000-5653-3f5e-d941-199e4b56e7e0	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5653-3f5e-9fbf-340b4b328d80
000e0000-5653-3f5e-12e3-7b99d10ec3f0	\N	\N	00140000-5653-3f5c-28e5-dfd432d6a8ee	00190000-5653-3f5e-d941-199e4b56e7e0	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5653-3f5e-9fbf-340b4b328d80
000e0000-5653-3f5e-9ada-654dfa454328	\N	\N	00140000-5653-3f5c-28e5-dfd432d6a8ee	00190000-5653-3f5e-d941-199e4b56e7e0	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5653-3f5e-046e-8956fe696a0b
000e0000-5653-3f5e-aca0-a6b9cc606e99	\N	\N	00140000-5653-3f5c-28e5-dfd432d6a8ee	00190000-5653-3f5e-d941-199e4b56e7e0	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5653-3f5e-046e-8956fe696a0b
\.


--
-- TOC entry 3123 (class 0 OID 29287911)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5653-3f5e-8bc3-aefc6389bee3	\N	000e0000-5653-3f5e-1c8e-00d7de9e4f34	1	
00200000-5653-3f5f-8c08-052b857285a5	\N	000e0000-5653-3f5e-1c8e-00d7de9e4f34	2	
00200000-5653-3f5f-904c-664ad42565e6	\N	000e0000-5653-3f5e-1c8e-00d7de9e4f34	3	
00200000-5653-3f5f-f61c-53ffc0ad34fe	\N	000e0000-5653-3f5e-1c8e-00d7de9e4f34	4	
00200000-5653-3f5f-ae34-ee2a372e355b	\N	000e0000-5653-3f5e-1c8e-00d7de9e4f34	5	
\.


--
-- TOC entry 3140 (class 0 OID 29288062)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 29288176)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5653-3f5c-3aac-7dca794c2274	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5653-3f5c-78aa-f7455a2597cb	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5653-3f5c-56ba-6a1bbd039e51	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5653-3f5c-1f59-d89e23372da0	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5653-3f5c-a1df-0610b77fa889	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5653-3f5c-7172-53bc058f3d6b	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5653-3f5c-ca34-5658d3ca6318	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5653-3f5c-9141-48aa7bbc7895	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5653-3f5c-d76a-4b4eea5b3197	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5653-3f5c-e445-b1585e56b51b	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5653-3f5c-282e-e8e8dad2c918	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5653-3f5c-e5e5-e268fd9f7a97	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5653-3f5c-72db-7e144c70e11e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5653-3f5c-1ae7-8f9eff54e453	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5653-3f5c-cbcc-c446c14cf9ec	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5653-3f5c-c663-657551ee4635	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5653-3f5c-34ce-75843a917a3a	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5653-3f5c-9c31-aabf6c04641b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5653-3f5c-9f55-af27744919ab	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5653-3f5c-41d2-0b6388ba9591	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5653-3f5c-b5f3-4120b000b4ea	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5653-3f5c-b181-874bcc5ffb6b	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5653-3f5c-8a15-c8a090d0fa22	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5653-3f5c-fdbe-dd5fe65b4a8f	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5653-3f5c-4a5e-1877192f7e5e	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5653-3f5c-e2ae-c736870007e2	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5653-3f5c-6e89-1c0515c935db	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5653-3f5c-c1e4-f85bc71ae69d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 29288546)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 29288515)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 29288558)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 29288134)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5653-3f5e-957f-dc5bf28e77c7	00090000-5653-3f5e-99a3-4d7b9febc2b3	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5653-3f5e-a6b2-42ddf0f006cf	00090000-5653-3f5e-c2e3-13c2c27e228f	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5653-3f5e-da1d-68e69d287757	00090000-5653-3f5e-6c3e-10529a8f062e	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5653-3f5e-f640-d8184b9574a1	00090000-5653-3f5e-e35a-3af4a18391f9	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5653-3f5e-8448-2f869b51a55a	00090000-5653-3f5e-d890-2902b77f238f	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5653-3f5e-a33c-90a209ddf7a6	00090000-5653-3f5e-aa6a-99f14f7eb95e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 29287955)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 29288243)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5653-3f5c-054c-68225159d6bd	01	Drama	drama (SURS 01)
00140000-5653-3f5c-17c9-54a246984fb3	02	Opera	opera (SURS 02)
00140000-5653-3f5c-3898-588ffc3ebfce	03	Balet	balet (SURS 03)
00140000-5653-3f5c-b212-fc4f371ddb21	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5653-3f5c-73f8-6c1d91586db5	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5653-3f5c-28e5-dfd432d6a8ee	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5653-3f5c-98e7-ee1a65a6f2ab	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 29288124)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 29287689)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 29288302)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 29288292)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 29287680)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 29288159)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 29288201)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 29288599)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 29287943)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 29287965)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 29287970)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 29288513)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 29287838)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 29288370)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 29288120)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 29287909)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 29287876)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 29287852)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 29288027)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 29288576)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 29288583)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 29288607)
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
-- TOC entry 2726 (class 2606 OID 29288054)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 29287810)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 29287708)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 29287772)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 29287735)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 29287669)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 29287654)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 29288060)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 29288096)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 29288238)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 29287763)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 29287798)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 29288465)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 29288033)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 29287788)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 29287928)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 29287897)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 29287889)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 29288045)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 29288474)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 29288482)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 29288452)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 29288494)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 29288078)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 29288018)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 29288009)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 29288225)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 29288152)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 29287864)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 29287625)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 29288087)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 29287643)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 29287663)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 29288105)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 29288040)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 29287989)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 29287613)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 29287601)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 29287595)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 29288172)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 29287744)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 29288000)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 29288212)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 29287697)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 29288506)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 29287978)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 29287823)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 29287638)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 29288271)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 29287918)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 29288068)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 29288184)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 29288556)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 29288540)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 29288564)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 29288142)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 29287959)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 29288251)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 29288132)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 29287953)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 29287954)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 29287952)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 29287951)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 29287950)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 29288173)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 29288174)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 29288175)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 29288578)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 29288577)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 29287765)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 29287766)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 29288061)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 29288544)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 29288543)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 29288545)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 29288542)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 29288541)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 29288047)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 29288046)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 29287919)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 29287920)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 29288121)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 29288123)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 29288122)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 29287854)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 29287853)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 29288495)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 29288240)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 29288241)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 29288242)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 29288565)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 29288276)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 29288273)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 29288277)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 29288275)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 29288274)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 29287825)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 29287824)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 29287738)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 29288088)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 29287670)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 29287671)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 29288108)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 29288107)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 29288106)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 29287775)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 29287774)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 29287776)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 29287892)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 29287890)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 29287891)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 29287603)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 29288013)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 29288011)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 29288010)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 29288012)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 29287644)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 29287645)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 29288069)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 29288600)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 29288161)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 29288160)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 29288608)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 29288609)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 29288034)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 29288153)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 29288154)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 29288375)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 29288374)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 29288371)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 29288372)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 29288373)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 29287790)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 29287789)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 29287791)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 29288082)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 29288081)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 29288475)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 29288476)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 29288306)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 29288307)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 29288304)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 29288305)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 29288143)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 29288144)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 29288022)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 29288021)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 29288019)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 29288020)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 29288294)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 29288293)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 29287865)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 29287879)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 29287878)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 29287877)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 29287880)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 29287910)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 29287898)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 29287899)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 29288466)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 29288514)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 29288584)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 29288585)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 29287710)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 29287709)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 29287745)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 29287746)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 29287960)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 29288003)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 29288002)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 29288001)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 29287945)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 29287946)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 29287949)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 29287944)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 29287948)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 29287947)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 29287764)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 29287698)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 29287699)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 29287839)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 29287841)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 29287840)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 29287842)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 29288028)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 29288239)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 29288272)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 29288213)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 29288214)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 29287736)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 29287737)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 29288133)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 29287614)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 29287811)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 29287773)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 29287602)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 29288507)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 29288080)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 29288079)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 29287979)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 29287980)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 29288303)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 29287799)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 29288252)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 29288557)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 29288483)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 29288484)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 29288202)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 29287990)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 29287664)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2904 (class 2606 OID 29288780)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2905 (class 2606 OID 29288785)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2910 (class 2606 OID 29288810)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2908 (class 2606 OID 29288800)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2903 (class 2606 OID 29288775)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2907 (class 2606 OID 29288795)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2909 (class 2606 OID 29288805)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2906 (class 2606 OID 29288790)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2944 (class 2606 OID 29288980)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 29288985)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2946 (class 2606 OID 29288990)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2979 (class 2606 OID 29289155)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2978 (class 2606 OID 29289150)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2881 (class 2606 OID 29288665)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2882 (class 2606 OID 29288670)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 29288895)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2975 (class 2606 OID 29289135)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 29289130)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2976 (class 2606 OID 29289140)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2973 (class 2606 OID 29289125)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 29289120)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2926 (class 2606 OID 29288890)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2925 (class 2606 OID 29288885)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2901 (class 2606 OID 29288765)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2902 (class 2606 OID 29288770)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 29288935)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 29288945)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 29288940)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2892 (class 2606 OID 29288720)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2891 (class 2606 OID 29288715)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 29288875)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 29289110)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2947 (class 2606 OID 29288995)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 29289000)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2949 (class 2606 OID 29289005)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 29289145)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2953 (class 2606 OID 29289025)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 29289010)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2954 (class 2606 OID 29289030)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 29289020)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2951 (class 2606 OID 29289015)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2890 (class 2606 OID 29288710)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2889 (class 2606 OID 29288705)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2878 (class 2606 OID 29288650)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2877 (class 2606 OID 29288645)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 29288915)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2873 (class 2606 OID 29288625)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2874 (class 2606 OID 29288630)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2934 (class 2606 OID 29288930)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 29288925)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2932 (class 2606 OID 29288920)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 29288680)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2883 (class 2606 OID 29288675)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2885 (class 2606 OID 29288685)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2897 (class 2606 OID 29288745)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2895 (class 2606 OID 29288735)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 29288740)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 29288610)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2918 (class 2606 OID 29288850)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2916 (class 2606 OID 29288840)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2915 (class 2606 OID 29288835)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2917 (class 2606 OID 29288845)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2871 (class 2606 OID 29288615)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 29288620)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 29288900)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 29289170)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2943 (class 2606 OID 29288975)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2942 (class 2606 OID 29288970)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2983 (class 2606 OID 29289175)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2984 (class 2606 OID 29289180)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 29288880)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2940 (class 2606 OID 29288960)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2941 (class 2606 OID 29288965)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2965 (class 2606 OID 29289085)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 29289080)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 29289065)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2962 (class 2606 OID 29289070)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 29289075)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 29288695)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 29288690)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2888 (class 2606 OID 29288700)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2930 (class 2606 OID 29288910)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2929 (class 2606 OID 29288905)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 29289095)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2968 (class 2606 OID 29289100)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2959 (class 2606 OID 29289055)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2960 (class 2606 OID 29289060)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2957 (class 2606 OID 29289045)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2958 (class 2606 OID 29289050)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2938 (class 2606 OID 29288950)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 29288955)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 29288870)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2921 (class 2606 OID 29288865)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2919 (class 2606 OID 29288855)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2920 (class 2606 OID 29288860)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2956 (class 2606 OID 29289040)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2955 (class 2606 OID 29289035)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 29288725)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 29288730)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 29288760)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2898 (class 2606 OID 29288750)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2899 (class 2606 OID 29288755)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 29289090)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 29289105)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 29289115)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 29289160)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2981 (class 2606 OID 29289165)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2876 (class 2606 OID 29288640)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2875 (class 2606 OID 29288635)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2879 (class 2606 OID 29288655)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2880 (class 2606 OID 29288660)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 29288815)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2914 (class 2606 OID 29288830)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 29288825)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2912 (class 2606 OID 29288820)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-23 17:31:30 CET

--
-- PostgreSQL database dump complete
--

