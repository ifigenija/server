--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2016-01-22 17:54:18 CET

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
-- TOC entry 3223 (class 0 OID 0)
-- Dependencies: 257
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 39920579)
-- Name: abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE abonma (
    id uuid NOT NULL,
    stpredstav integer,
    stkuponov integer,
    ime character varying(40) DEFAULT NULL::character varying,
    opis text,
    barva character varying(7) DEFAULT NULL::character varying,
    kapaciteta integer
);


--
-- TOC entry 241 (class 1259 OID 39921197)
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
-- TOC entry 240 (class 1259 OID 39921181)
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
-- TOC entry 184 (class 1259 OID 39920572)
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
-- TOC entry 183 (class 1259 OID 39920570)
-- Name: authstorage_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE authstorage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3224 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE authstorage_id_seq OWNED BY authstorage.id;


--
-- TOC entry 231 (class 1259 OID 39921058)
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
-- TOC entry 234 (class 1259 OID 39921088)
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
-- TOC entry 255 (class 1259 OID 39921500)
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
-- TOC entry 212 (class 1259 OID 39920894)
-- Name: dodatek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dodatek (
    id uuid NOT NULL,
    ura_id uuid,
    tipdodatka_id uuid,
    trajanje integer
);


--
-- TOC entry 205 (class 1259 OID 39920820)
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
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 206 (class 1259 OID 39920845)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 207 (class 1259 OID 39920850)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 249 (class 1259 OID 39921422)
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
-- TOC entry 196 (class 1259 OID 39920725)
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
-- TOC entry 242 (class 1259 OID 39921210)
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
-- TOC entry 227 (class 1259 OID 39921016)
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
-- TOC entry 202 (class 1259 OID 39920794)
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
-- TOC entry 199 (class 1259 OID 39920765)
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
-- TOC entry 3225 (class 0 OID 0)
-- Dependencies: 199
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 197 (class 1259 OID 39920742)
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
-- TOC entry 216 (class 1259 OID 39920930)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 253 (class 1259 OID 39921480)
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
-- TOC entry 254 (class 1259 OID 39921493)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 256 (class 1259 OID 39921515)
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
-- TOC entry 220 (class 1259 OID 39920954)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 194 (class 1259 OID 39920699)
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
-- TOC entry 187 (class 1259 OID 39920599)
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
-- TOC entry 191 (class 1259 OID 39920666)
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
-- TOC entry 188 (class 1259 OID 39920610)
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
-- TOC entry 180 (class 1259 OID 39920544)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 182 (class 1259 OID 39920563)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 221 (class 1259 OID 39920961)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 225 (class 1259 OID 39920996)
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
-- TOC entry 237 (class 1259 OID 39921129)
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
-- TOC entry 190 (class 1259 OID 39920646)
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
-- TOC entry 193 (class 1259 OID 39920691)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 244 (class 1259 OID 39921366)
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
-- TOC entry 217 (class 1259 OID 39920936)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 192 (class 1259 OID 39920676)
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
-- TOC entry 204 (class 1259 OID 39920812)
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
-- TOC entry 200 (class 1259 OID 39920780)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    zaporednasez integer
);


--
-- TOC entry 201 (class 1259 OID 39920787)
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
-- TOC entry 219 (class 1259 OID 39920948)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid
);


--
-- TOC entry 245 (class 1259 OID 39921380)
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
-- TOC entry 246 (class 1259 OID 39921390)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 243 (class 1259 OID 39921279)
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
-- TOC entry 247 (class 1259 OID 39921398)
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
-- TOC entry 223 (class 1259 OID 39920976)
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
    opis text,
    barva character varying(7) DEFAULT NULL::character varying
);


--
-- TOC entry 215 (class 1259 OID 39920921)
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
-- TOC entry 214 (class 1259 OID 39920911)
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
-- TOC entry 236 (class 1259 OID 39921118)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 230 (class 1259 OID 39921048)
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
-- TOC entry 198 (class 1259 OID 39920754)
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
-- TOC entry 177 (class 1259 OID 39920515)
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
-- TOC entry 176 (class 1259 OID 39920513)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3226 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 224 (class 1259 OID 39920990)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 181 (class 1259 OID 39920553)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 179 (class 1259 OID 39920537)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 226 (class 1259 OID 39921004)
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
-- TOC entry 218 (class 1259 OID 39920942)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 209 (class 1259 OID 39920865)
-- Name: sezona; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sezona (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    zacetek date,
    konec date
);


--
-- TOC entry 175 (class 1259 OID 39920502)
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
-- TOC entry 174 (class 1259 OID 39920494)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 173 (class 1259 OID 39920489)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 232 (class 1259 OID 39921065)
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
-- TOC entry 189 (class 1259 OID 39920638)
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
-- TOC entry 211 (class 1259 OID 39920884)
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
-- TOC entry 213 (class 1259 OID 39920901)
-- Name: tipdodatka; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipdodatka (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 235 (class 1259 OID 39921106)
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
-- TOC entry 186 (class 1259 OID 39920589)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 248 (class 1259 OID 39921410)
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
-- TOC entry 208 (class 1259 OID 39920855)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 195 (class 1259 OID 39920711)
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
-- TOC entry 178 (class 1259 OID 39920524)
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
-- TOC entry 239 (class 1259 OID 39921156)
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
-- TOC entry 210 (class 1259 OID 39920875)
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
-- TOC entry 203 (class 1259 OID 39920805)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    tipvaje_id uuid,
    uprizoritev_id uuid,
    zaporedna integer
);


--
-- TOC entry 222 (class 1259 OID 39920968)
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
-- TOC entry 233 (class 1259 OID 39921079)
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
-- TOC entry 251 (class 1259 OID 39921460)
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
-- TOC entry 250 (class 1259 OID 39921429)
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
-- TOC entry 252 (class 1259 OID 39921472)
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
-- TOC entry 229 (class 1259 OID 39921041)
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
-- TOC entry 238 (class 1259 OID 39921146)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 228 (class 1259 OID 39921031)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2258 (class 2604 OID 39920575)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2250 (class 2604 OID 39920518)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3145 (class 0 OID 39920579)
-- Dependencies: 185
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, barva, kapaciteta) FROM stdin;
000a0000-56a2-5eb6-dfc9-b3061bcf8a17	10	30	Otroci	Abonma za otroke	\N	200
000a0000-56a2-5eb6-547a-5c103d5ed3c9	20	60	Mladina	Abonma za mladino	\N	400
000a0000-56a2-5eb6-9bff-542943ad1705	15	50	Odrasli	Abonma za odrasle	\N	300
\.


--
-- TOC entry 3201 (class 0 OID 39921197)
-- Dependencies: 241
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, imapogodbo, pomembna) FROM stdin;
000c0000-56a2-5eb7-2782-ef156d82f2fe	000d0000-56a2-5eb6-0026-fdb9124aed70	\N	00090000-56a2-5eb6-4abf-e796080cdea5	000b0000-56a2-5eb6-d7e3-dbe412d4c974	0001	f	\N	\N	\N	3	t	t	t
000c0000-56a2-5eb7-26d6-1592a0b8c3e6	000d0000-56a2-5eb6-ea48-33f7199178be	00100000-56a2-5eb6-fe1a-9818c9d7bea6	00090000-56a2-5eb6-0d63-ed891867074e	\N	0002	t	2016-01-01	\N	\N	8	t	f	f
000c0000-56a2-5eb7-d1c4-ba5d795d02d7	000d0000-56a2-5eb6-b4cd-beb123e16a75	00100000-56a2-5eb6-2974-025895015fef	00090000-56a2-5eb6-c069-600a8e3a9381	\N	0003	t	\N	2016-01-19	\N	2	t	f	f
000c0000-56a2-5eb7-93d8-ad50a2bb3600	000d0000-56a2-5eb6-658e-33c68bc3c83b	\N	00090000-56a2-5eb6-54e9-c59ab924c6dd	\N	0004	f	2016-01-01	2016-01-19	\N	26	t	f	f
000c0000-56a2-5eb7-8ecb-afa3d5bf66cb	000d0000-56a2-5eb6-b1d9-5a508a059c63	\N	00090000-56a2-5eb6-42de-2ffb8f14f760	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	f	f
000c0000-56a2-5eb7-5f27-4c9c72ffdcac	000d0000-56a2-5eb6-c7bd-6a8ccbc8a108	\N	00090000-56a2-5eb6-4135-942abd4d952b	000b0000-56a2-5eb6-5d01-fb468e954320	0006	f	2016-01-01	2016-04-20	\N	1	t	t	t
000c0000-56a2-5eb7-cf2b-e95506ef9595	000d0000-56a2-5eb6-48c3-8ddf5a2f5d6b	00100000-56a2-5eb6-bf92-1c2d9dcfe54a	00090000-56a2-5eb6-7d8d-860f02cb1e0e	\N	0007	t	2016-01-01	2016-04-20	\N	14	f	f	t
000c0000-56a2-5eb7-7b58-8de6499bae91	000d0000-56a2-5eb6-6213-20c48364f8fd	\N	00090000-56a2-5eb6-0881-4c22b240bd48	000b0000-56a2-5eb6-9195-98d119e008fa	0008	f	2016-01-01	2016-04-20	\N	12	t	t	t
000c0000-56a2-5eb7-1ee0-2a8199565146	000d0000-56a2-5eb6-48c3-8ddf5a2f5d6b	00100000-56a2-5eb6-582a-1563e6ec56e7	00090000-56a2-5eb6-ad14-5a1d91038fd3	\N	0009	t	2016-01-01	\N	\N	15	t	f	t
000c0000-56a2-5eb7-978f-47d7c53e790b	000d0000-56a2-5eb6-48c3-8ddf5a2f5d6b	00100000-56a2-5eb6-ff90-f6f64945a410	00090000-56a2-5eb6-8333-55c9f7889ae5	\N	0010	t	\N	2017-04-20	\N	16	f	f	t
000c0000-56a2-5eb7-e2d0-20a23128457d	000d0000-56a2-5eb6-48c3-8ddf5a2f5d6b	00100000-56a2-5eb6-945d-8affcd8a477b	00090000-56a2-5eb6-7d77-ab87919b2b67	\N	0011	t	2017-01-01	\N	\N	17	f	f	t
000c0000-56a2-5eb7-a6d3-3512d85fcc72	000d0000-56a2-5eb6-1405-7e9fb939541c	00100000-56a2-5eb6-fe1a-9818c9d7bea6	00090000-56a2-5eb6-0d63-ed891867074e	000b0000-56a2-5eb6-ac54-59aa1392206b	0012	t	\N	\N	\N	2	t	t	t
000c0000-56a2-5eb7-a1b8-782a320d077f	000d0000-56a2-5eb6-ebbe-666c15d5f2ed	\N	00090000-56a2-5eb6-0881-4c22b240bd48	\N	0013	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-1269-7cdf587c0e62	000d0000-56a2-5eb6-ebbe-666c15d5f2ed	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0014	f	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-0247-741af69b3da4	000d0000-56a2-5eb6-5f06-2bc81a09570c	00100000-56a2-5eb6-2974-025895015fef	00090000-56a2-5eb6-c069-600a8e3a9381	\N	0015	t	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-3a39-242ef7374158	000d0000-56a2-5eb6-5f06-2bc81a09570c	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0016	f	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-0a35-7973c5a57428	000d0000-56a2-5eb6-33fc-285dff6938e6	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0017	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-5571-d730293f43c1	000d0000-56a2-5eb6-33fc-285dff6938e6	\N	00090000-56a2-5eb6-0881-4c22b240bd48	\N	0018	f	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-a209-97623ebbb715	000d0000-56a2-5eb6-067c-7a93e4420205	00100000-56a2-5eb6-bf92-1c2d9dcfe54a	00090000-56a2-5eb6-7d8d-860f02cb1e0e	\N	0019	t	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-5085-fa48dbd37b57	000d0000-56a2-5eb6-067c-7a93e4420205	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0020	f	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-8973-a23ab23c8aec	000d0000-56a2-5eb6-e6e3-a1059f054798	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0021	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-5a49-06fb47fe6776	000d0000-56a2-5eb6-e6e3-a1059f054798	00100000-56a2-5eb6-bf92-1c2d9dcfe54a	00090000-56a2-5eb6-7d8d-860f02cb1e0e	\N	0022	t	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-9d81-8ab6a025aaf9	000d0000-56a2-5eb6-84f2-6bc2a4f9eb5a	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0023	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-b100-1ea4aef13c5d	000d0000-56a2-5eb6-f357-14cd316fccda	\N	00090000-56a2-5eb6-0881-4c22b240bd48	\N	0024	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-7684-f9c07aa30523	000d0000-56a2-5eb6-4e3b-7f9e9b434ad3	\N	00090000-56a2-5eb6-0881-4c22b240bd48	\N	0025	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-01cd-21286065178a	000d0000-56a2-5eb6-4e3b-7f9e9b434ad3	00100000-56a2-5eb6-2974-025895015fef	00090000-56a2-5eb6-c069-600a8e3a9381	\N	0026	t	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-25a4-2b5c1ab655a3	000d0000-56a2-5eb6-f91e-7a078dec00d5	\N	00090000-56a2-5eb6-6257-beb5100c45aa	\N	0027	f	\N	\N	\N	2	t	f	t
000c0000-56a2-5eb7-09ab-099a4bab921a	000d0000-56a2-5eb6-f91e-7a078dec00d5	\N	00090000-56a2-5eb6-9a8f-f178b2828a7a	\N	0028	f	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-2e64-70bbed3a2b8b	000d0000-56a2-5eb6-2fec-4159a0a2169e	\N	00090000-56a2-5eb6-0881-4c22b240bd48	\N	0029	f	\N	\N	\N	1	t	f	t
000c0000-56a2-5eb7-4399-568803b7c13c	000d0000-56a2-5eb6-2fec-4159a0a2169e	00100000-56a2-5eb6-2974-025895015fef	00090000-56a2-5eb6-c069-600a8e3a9381	\N	0030	t	\N	\N	\N	2	f	f	t
000c0000-56a2-5eb7-310c-fb5b898ed157	000d0000-56a2-5eb6-2fec-4159a0a2169e	\N	00090000-56a2-5eb6-9a8f-f178b2828a7a	\N	0031	f	\N	\N	\N	3	f	f	t
000c0000-56a2-5eb7-9a2e-0a77ce41cd8d	000d0000-56a2-5eb6-2fec-4159a0a2169e	\N	00090000-56a2-5eb6-6257-beb5100c45aa	\N	0032	f	\N	\N	\N	4	f	f	t
000c0000-56a2-5eb7-24ae-ec604de1e2c6	000d0000-56a2-5eb6-2c1b-0cb220fd41ef	\N	00090000-56a2-5eb6-0881-4c22b240bd48	\N	0033	f	\N	\N	\N	4	t	f	t
000c0000-56a2-5eb7-ef1e-1abfdebd8ffd	000d0000-56a2-5eb6-8ace-96f1c47044fc	00100000-56a2-5eb6-2974-025895015fef	00090000-56a2-5eb6-c069-600a8e3a9381	\N	0034	t	\N	\N	\N	4	t	f	t
000c0000-56a2-5eb7-dbc7-44fedc0abf41	000d0000-56a2-5eb6-8ace-96f1c47044fc	\N	00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	0035	f	\N	\N	\N	4	f	f	t
\.


--
-- TOC entry 3200 (class 0 OID 39921181)
-- Dependencies: 240
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 39920572)
-- Dependencies: 184
-- Data for Name: authstorage; Type: TABLE DATA; Schema: public; Owner: -
--

COPY authstorage (id, sessionid, upor, datum, ip, deleted) FROM stdin;
\.


--
-- TOC entry 3227 (class 0 OID 0)
-- Dependencies: 183
-- Name: authstorage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('authstorage_id_seq', 1, false);


--
-- TOC entry 3191 (class 0 OID 39921058)
-- Dependencies: 231
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-56a2-5eb6-14de-db58f85e54e4	00160000-56a2-5eb6-0a69-151265088529	00090000-56a2-5eb6-9a8f-f178b2828a7a	aizv	10	t
003d0000-56a2-5eb6-5fe7-aa36a5e5da2a	00160000-56a2-5eb6-0a69-151265088529	00090000-56a2-5eb6-6459-257dd117a0cd	apri	14	t
003d0000-56a2-5eb6-63dd-006046620c5f	00160000-56a2-5eb6-33fd-e3b5672a6277	00090000-56a2-5eb6-6257-beb5100c45aa	aizv	11	t
003d0000-56a2-5eb6-3a3f-e2cb5a801bc9	00160000-56a2-5eb6-ea94-3876b67f7cd8	00090000-56a2-5eb6-6038-7255680d281b	aizv	12	t
003d0000-56a2-5eb6-f8ef-1855fc6fa0d6	00160000-56a2-5eb6-0a69-151265088529	00090000-56a2-5eb6-75df-fec4f7f4ea44	apri	18	f
\.


--
-- TOC entry 3194 (class 0 OID 39921088)
-- Dependencies: 234
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-56a2-5eb6-0a69-151265088529	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-56a2-5eb6-33fd-e3b5672a6277	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-56a2-5eb6-ea94-3876b67f7cd8	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3215 (class 0 OID 39921500)
-- Dependencies: 255
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3172 (class 0 OID 39920894)
-- Dependencies: 212
-- Data for Name: dodatek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dodatek (id, ura_id, tipdodatka_id, trajanje) FROM stdin;
\.


--
-- TOC entry 3165 (class 0 OID 39920820)
-- Dependencies: 205
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, zacetek, konec, status, razred, termin, title, barva) FROM stdin;
00180000-56a2-5eb6-894e-963afb5755ed	\N	\N	\N	\N	00440000-56a2-5eb6-554d-48e01f461116	00220000-56a2-5eb6-becc-1cc1df86fccd	\N	2012-04-01 17:00:00	2012-04-01 17:00:00	200s	600s	\N	DogodekTehnicni 1	\N
00180000-56a2-5eb6-7af8-b4bc4a9cc5c0	\N	\N	\N	\N	00440000-56a2-5eb6-137f-d2806bce8674	00220000-56a2-5eb6-edd3-718f4f0e3afb	\N	2012-04-02 17:00:00	2012-05-02 17:00:00	600s	600s	\N	DogodekTehnicni 2	\N
00180000-56a2-5eb6-5d0c-7e9318bf315d	\N	\N	\N	001e0000-56a2-5eb6-437e-0d6c08691ab4	\N	00220000-56a2-5eb6-becc-1cc1df86fccd	\N	2012-03-01 17:00:00	2012-03-01 17:00:00	200s	400s	\N	DogodekSplosni 1	\N
00180000-56a2-5eb6-242b-ee242354fac1	\N	\N	\N	001e0000-56a2-5eb6-05c0-5e76095bceb0	\N	00220000-56a2-5eb6-edd3-718f4f0e3afb	\N	2012-03-02 17:00:00	2012-03-02 17:00:00	200s	400s	\N	DogodekSplosni 2	\N
00180000-56a2-5eb7-0854-ddb6635d7f2a	\N	00200000-56a2-5eb6-c146-0c7b67767ea2	\N	\N	\N	00220000-56a2-5eb6-3b15-cf48d2ff20ff	\N	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1	\N
00180000-56a2-5eb7-8fe9-97f807587778	\N	00200000-56a2-5eb6-c46d-780354eb208e	\N	\N	\N	00220000-56a2-5eb6-3b15-cf48d2ff20ff	\N	2012-06-04 10:00:00	2015-06-27 12:00:00	400s	200s		dogodek 2	\N
00180000-56a2-5eb7-6aaf-df18f0c8724a	\N	00200000-56a2-5eb6-3dc1-47ce0eb93ecb	\N	\N	\N	00220000-56a2-5eb6-edd3-718f4f0e3afb	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3	\N
00180000-56a2-5eb7-8293-e51f348429ff	\N	00200000-56a2-5eb6-5363-2c56350851c6	\N	\N	\N	00220000-56a2-5eb6-6155-ea1b4385fa19	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	200s	200s		dogodek 4	\N
00180000-56a2-5eb7-2d7a-bd43d45de84b	\N	00200000-56a2-5eb6-e188-330c2b6c92d9	\N	\N	\N	00220000-56a2-5eb6-6f73-c2fc7ff9c23d	\N	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5	\N
00180000-56a2-5eb7-0cb5-de7dbbbdcb80	001b0000-56a2-5eb7-b031-284fa84c564a	\N	\N	\N	\N	00220000-56a2-5eb6-becc-1cc1df86fccd	001f0000-56a2-5eb6-b3d0-63f1586d318b	2014-05-10 20:00:00	2014-05-10 23:00:00	400s	100s	\N	Predstava 1	\N
00180000-56a2-5eb7-f1cd-1aef3346303c	001b0000-56a2-5eb7-b5c5-e7e80d598bf5	\N	\N	\N	\N	00220000-56a2-5eb6-edd3-718f4f0e3afb	001f0000-56a2-5eb6-b3d0-63f1586d318b	2014-05-11 20:00:00	2014-05-11 23:00:00	200s	100s	\N	Predstava 2	\N
00180000-56a2-5eb7-7f33-8b1057f09584	001b0000-56a2-5eb7-cd35-d2234250c999	\N	\N	\N	\N	00220000-56a2-5eb6-becc-1cc1df86fccd	001f0000-56a2-5eb6-b3d0-63f1586d318b	2014-05-20 20:00:00	2014-05-20 23:00:00	200s	100s	\N	Predstava 3	\N
\.


--
-- TOC entry 3166 (class 0 OID 39920845)
-- Dependencies: 206
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
001e0000-56a2-5eb6-437e-0d6c08691ab4
001e0000-56a2-5eb6-05c0-5e76095bceb0
\.


--
-- TOC entry 3167 (class 0 OID 39920850)
-- Dependencies: 207
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
00440000-56a2-5eb6-554d-48e01f461116
00440000-56a2-5eb6-137f-d2806bce8674
\.


--
-- TOC entry 3209 (class 0 OID 39921422)
-- Dependencies: 249
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 39920725)
-- Dependencies: 196
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-56a2-5eb3-b9fe-4884d6c9bb52	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-56a2-5eb3-1a95-c0f2254c6f10	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-56a2-5eb3-79c2-6dc538599b98	AL	ALB	008	Albania 	Albanija	\N
00040000-56a2-5eb3-386a-9f88d1d00142	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-56a2-5eb3-1b66-c1848f846140	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-56a2-5eb3-2832-a70cb3a5f88b	AD	AND	020	Andorra 	Andora	\N
00040000-56a2-5eb3-94f8-0cc02483067f	AO	AGO	024	Angola 	Angola	\N
00040000-56a2-5eb3-9714-6898919266e4	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-56a2-5eb3-0f81-b02fe2282cb3	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-56a2-5eb3-caaf-d32994b93189	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-56a2-5eb3-a929-01cc90f5269e	AR	ARG	032	Argentina 	Argenitna	\N
00040000-56a2-5eb3-474b-1e7795383221	AM	ARM	051	Armenia 	Armenija	\N
00040000-56a2-5eb3-9979-48ce2ea2dfc0	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-56a2-5eb3-8d95-81822eb01015	AU	AUS	036	Australia 	Avstralija	\N
00040000-56a2-5eb3-a871-8e684af7d018	AT	AUT	040	Austria 	Avstrija	\N
00040000-56a2-5eb3-ca6a-25f6e5cf7be9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-56a2-5eb3-63dc-60cd82ac8feb	BS	BHS	044	Bahamas 	Bahami	\N
00040000-56a2-5eb3-fd1b-41374c252d7d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-56a2-5eb3-738d-38e0ede005b8	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-56a2-5eb3-cb92-83fcc7a6c312	BB	BRB	052	Barbados 	Barbados	\N
00040000-56a2-5eb3-10af-0f63d67e7f22	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-56a2-5eb3-ca1e-e3109de75550	BE	BEL	056	Belgium 	Belgija	\N
00040000-56a2-5eb3-3964-71bb577692c0	BZ	BLZ	084	Belize 	Belize	\N
00040000-56a2-5eb3-d533-fb8401892ee7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-56a2-5eb3-2d81-050ac0a09d9f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-56a2-5eb3-69a4-230ab268c9a6	BT	BTN	064	Bhutan 	Butan	\N
00040000-56a2-5eb3-b617-4c13ea77ef51	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-56a2-5eb3-2f38-abb224cbfb33	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-56a2-5eb3-adc2-b54f25e83624	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-56a2-5eb3-d82f-4dac97bdc3bb	BW	BWA	072	Botswana 	Bocvana	\N
00040000-56a2-5eb3-3291-e34819a405ba	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-56a2-5eb3-cce2-3c19311e031b	BR	BRA	076	Brazil 	Brazilija	\N
00040000-56a2-5eb3-ab78-0a87c2f19a8c	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-56a2-5eb3-18ea-886d92fc726a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-56a2-5eb3-7887-98faf88c6478	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-56a2-5eb3-4c2a-29196d302243	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-56a2-5eb3-cd33-f2ed0a8d55e6	BI	BDI	108	Burundi 	Burundi 	\N
00040000-56a2-5eb3-322a-a3a7e825f73c	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-56a2-5eb3-018a-be8aa83bc16b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-56a2-5eb3-7f0a-bc17ab64a3ab	CA	CAN	124	Canada 	Kanada	\N
00040000-56a2-5eb3-d2b0-b518d17f6248	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-56a2-5eb3-8532-9c74d6d03397	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-56a2-5eb3-c2cc-2e813dbcfd2b	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-56a2-5eb3-40dd-98b5690e1213	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-56a2-5eb3-04e0-d82106fe95f4	CL	CHL	152	Chile 	Čile	\N
00040000-56a2-5eb3-67d5-dade1a83ef7a	CN	CHN	156	China 	Kitajska	\N
00040000-56a2-5eb3-54be-f8c171f1d004	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-56a2-5eb3-2105-129c388f392e	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-56a2-5eb3-d12f-33344c6075e3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-56a2-5eb3-40b1-d488208ac40e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-56a2-5eb3-4790-05a4ff925399	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-56a2-5eb3-5458-0d7c8f36a91e	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-56a2-5eb3-3932-e860ae75de13	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-56a2-5eb3-3b68-2f58e4baee9c	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-56a2-5eb3-88e9-333857597505	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-56a2-5eb3-90d0-b63cfd28a426	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-56a2-5eb3-fb01-efc2e0b90b03	CU	CUB	192	Cuba 	Kuba	\N
00040000-56a2-5eb3-b9ee-37fac8ff322e	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-56a2-5eb3-263e-1bc64692aac1	CY	CYP	196	Cyprus 	Ciper	\N
00040000-56a2-5eb3-29a6-1134f7d4026a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-56a2-5eb3-04a5-78b1fec7d8ca	DK	DNK	208	Denmark 	Danska	\N
00040000-56a2-5eb3-d8d6-4e15ccdfd6ab	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-56a2-5eb3-1db4-5ef938d95ce9	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-56a2-5eb3-deb2-e7427cd8cd84	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-56a2-5eb3-d94e-538b86bf73cf	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-56a2-5eb3-26b1-7475e8b7b8f4	EG	EGY	818	Egypt 	Egipt	\N
00040000-56a2-5eb3-031c-2742d5f779ff	SV	SLV	222	El Salvador 	Salvador	\N
00040000-56a2-5eb3-9f41-fd734c9e7921	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-56a2-5eb3-21b5-50593e61471f	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-56a2-5eb3-aa89-eb6d51545f9f	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-56a2-5eb3-97aa-d988f163e743	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-56a2-5eb3-a905-44639ffb9535	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-56a2-5eb3-b615-ba96c83dc6d9	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-56a2-5eb3-5f93-066c4a168ce9	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-56a2-5eb3-7158-a34884711d40	FI	FIN	246	Finland 	Finska	\N
00040000-56a2-5eb3-797c-9f087c90ddab	FR	FRA	250	France 	Francija	\N
00040000-56a2-5eb3-9669-06fb0dcad35a	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-56a2-5eb3-1ba3-f8065a900bef	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-56a2-5eb3-375c-a725f2646a62	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-56a2-5eb3-d3e4-87829fa4f42b	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-56a2-5eb3-6fdf-7d6bbd9e7267	GA	GAB	266	Gabon 	Gabon	\N
00040000-56a2-5eb3-3cb8-a4f58bb598fe	GM	GMB	270	Gambia 	Gambija	\N
00040000-56a2-5eb3-7de8-1611ddacda3b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-56a2-5eb3-239e-d28bb5ccb6ef	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-56a2-5eb3-d813-60c3aecdb065	GH	GHA	288	Ghana 	Gana	\N
00040000-56a2-5eb3-c52c-e0e3de85c121	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-56a2-5eb3-fa8b-e1f3a59b5cb7	GR	GRC	300	Greece 	Grčija	\N
00040000-56a2-5eb3-dae8-0fb576771de4	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-56a2-5eb3-f782-89a11097c0df	GD	GRD	308	Grenada 	Grenada	\N
00040000-56a2-5eb3-6979-2a4e7da9d10e	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-56a2-5eb3-7531-b8a8a1af5ef4	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-56a2-5eb3-074b-827ff9fd9608	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-56a2-5eb3-e8aa-e4ba591fd061	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-56a2-5eb3-8400-4ceb94dffcfb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-56a2-5eb3-9ba1-7caf60c8d36a	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-56a2-5eb3-d8ae-6a687b2631ef	GY	GUY	328	Guyana 	Gvajana	\N
00040000-56a2-5eb3-d83b-3afcc6e408a6	HT	HTI	332	Haiti 	Haiti	\N
00040000-56a2-5eb3-ba58-dc42c70b6e9d	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-56a2-5eb3-aa89-b5e943c4b04e	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-56a2-5eb3-7082-ed97171cc8bc	HN	HND	340	Honduras 	Honduras	\N
00040000-56a2-5eb3-4b25-55faeffbd700	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-56a2-5eb3-6046-ae13cb03a5dd	HU	HUN	348	Hungary 	Madžarska	\N
00040000-56a2-5eb3-b86f-69d7cefdab19	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-56a2-5eb3-0f08-c067e82fdd3f	IN	IND	356	India 	Indija	\N
00040000-56a2-5eb3-ecfd-6086735fb001	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-56a2-5eb3-91df-e81c74a5a1f4	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-56a2-5eb3-8cf5-55f34c7b84e1	IQ	IRQ	368	Iraq 	Irak	\N
00040000-56a2-5eb3-6951-dda39ef334c9	IE	IRL	372	Ireland 	Irska	\N
00040000-56a2-5eb3-9335-1c9558189ac0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-56a2-5eb3-886c-8aa5de0e2dc3	IL	ISR	376	Israel 	Izrael	\N
00040000-56a2-5eb3-2d40-6ff86c7a41e6	IT	ITA	380	Italy 	Italija	\N
00040000-56a2-5eb3-3ecd-3325c17145c4	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-56a2-5eb3-552b-56967772be2a	JP	JPN	392	Japan 	Japonska	\N
00040000-56a2-5eb3-7abb-19781c77e83c	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-56a2-5eb3-c3f7-40d81cc09a80	JO	JOR	400	Jordan 	Jordanija	\N
00040000-56a2-5eb3-d2ca-7b923a9cc763	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-56a2-5eb3-1782-19f3371f6513	KE	KEN	404	Kenya 	Kenija	\N
00040000-56a2-5eb3-662a-fc144f84d3f3	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-56a2-5eb3-cc4a-7abe626f8589	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-56a2-5eb3-a313-4c0497a9edab	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-56a2-5eb3-2cd7-1e91918b22cc	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-56a2-5eb3-de84-3da3b93fd14b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-56a2-5eb3-cd9d-831dfce05397	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-56a2-5eb3-fbe2-5e9706614cb5	LV	LVA	428	Latvia 	Latvija	\N
00040000-56a2-5eb3-bad8-7d03d2649298	LB	LBN	422	Lebanon 	Libanon	\N
00040000-56a2-5eb3-7040-70943227e231	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-56a2-5eb3-270c-46490a212855	LR	LBR	430	Liberia 	Liberija	\N
00040000-56a2-5eb3-abf5-3115d0ec0375	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-56a2-5eb3-ad23-fb4fa4a70026	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-56a2-5eb3-bac8-b484fdc901b0	LT	LTU	440	Lithuania 	Litva	\N
00040000-56a2-5eb3-432d-2d4223643b20	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-56a2-5eb3-8792-03d0a2e89301	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-56a2-5eb3-6a9c-424d5449cc5e	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-56a2-5eb3-9082-b8c956fe3ea8	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-56a2-5eb3-a391-d02b9e36086a	MW	MWI	454	Malawi 	Malavi	\N
00040000-56a2-5eb3-9179-1ff5ba9b57f8	MY	MYS	458	Malaysia 	Malezija	\N
00040000-56a2-5eb3-c246-7c074bc06065	MV	MDV	462	Maldives 	Maldivi	\N
00040000-56a2-5eb3-3d0a-71b7a29e03ae	ML	MLI	466	Mali 	Mali	\N
00040000-56a2-5eb3-1928-307249d260f0	MT	MLT	470	Malta 	Malta	\N
00040000-56a2-5eb3-8217-67ce77d6b50b	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-56a2-5eb3-bee8-37f4b28cf90b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-56a2-5eb3-ffff-a66c1075b5e7	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-56a2-5eb3-8db5-ab2db5a21b99	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-56a2-5eb3-8928-a2deb272de8c	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-56a2-5eb3-65d6-707b2b881da1	MX	MEX	484	Mexico 	Mehika	\N
00040000-56a2-5eb3-1ac1-8554bb1098bf	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-56a2-5eb3-75f3-45fc9e2a933c	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-56a2-5eb3-7b2a-3e8acfdfb15c	MC	MCO	492	Monaco 	Monako	\N
00040000-56a2-5eb3-0d55-750ca2a912b6	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-56a2-5eb3-fcca-16dbb57eb93f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-56a2-5eb3-c709-b7b997ca395d	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-56a2-5eb3-b028-5d47abba9263	MA	MAR	504	Morocco 	Maroko	\N
00040000-56a2-5eb3-80d9-6a6f8e556ad2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-56a2-5eb3-0ab3-2604c4b57455	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-56a2-5eb3-63e6-d3b7e0156761	NA	NAM	516	Namibia 	Namibija	\N
00040000-56a2-5eb3-7b39-7336321b7123	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-56a2-5eb3-c56b-1818f3ae2db1	NP	NPL	524	Nepal 	Nepal	\N
00040000-56a2-5eb3-a894-6723ec0ce3b3	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-56a2-5eb3-948b-9e3c704269c2	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-56a2-5eb3-f1b8-baa29299ae56	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-56a2-5eb3-1e25-7208a5f8d765	NE	NER	562	Niger 	Niger 	\N
00040000-56a2-5eb3-e47c-d5ffafc176fc	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-56a2-5eb3-7407-25771bda80a9	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-56a2-5eb3-bb08-e80a4f0a14a8	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-56a2-5eb3-f3f2-8fbb7099db02	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-56a2-5eb3-144b-9dedf88ac732	NO	NOR	578	Norway 	Norveška	\N
00040000-56a2-5eb3-5073-71d5661e558a	OM	OMN	512	Oman 	Oman	\N
00040000-56a2-5eb3-4bbe-963c0d0fc48f	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-56a2-5eb3-a587-5d935d51f244	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-56a2-5eb3-ab84-548c0fa6fd00	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-56a2-5eb3-a1cb-32d09aee579e	PA	PAN	591	Panama 	Panama	\N
00040000-56a2-5eb3-8466-238697e03f3d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-56a2-5eb3-cf17-258f51c29895	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-56a2-5eb3-fdb9-ee4ba6f57c71	PE	PER	604	Peru 	Peru	\N
00040000-56a2-5eb3-0774-6765da717856	PH	PHL	608	Philippines 	Filipini	\N
00040000-56a2-5eb3-2730-2b51967cbc2e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-56a2-5eb3-151c-75a4af341c15	PL	POL	616	Poland 	Poljska	\N
00040000-56a2-5eb3-7a52-716baa3a6d4b	PT	PRT	620	Portugal 	Portugalska	\N
00040000-56a2-5eb3-51f4-7003961b4f4e	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-56a2-5eb3-21e4-193a353db7d4	QA	QAT	634	Qatar 	Katar	\N
00040000-56a2-5eb3-f200-d19edaae9e9d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-56a2-5eb3-47f5-0be6662b0bbc	RO	ROU	642	Romania 	Romunija	\N
00040000-56a2-5eb3-9a93-4df91b7138db	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-56a2-5eb3-2238-dd78414a55b4	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-56a2-5eb3-d985-1ed1ee2a619a	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-56a2-5eb3-ba8c-52f0750ebb69	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-56a2-5eb3-e038-4926fa5fa957	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-56a2-5eb3-d358-ea16aac50f2f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-56a2-5eb3-f02d-83c44413ee1e	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-56a2-5eb3-42b5-978978dacb69	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-56a2-5eb3-1c90-e2279f993421	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-56a2-5eb3-0f17-e06c2ede64f0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-56a2-5eb3-914e-dcb3c479de24	SM	SMR	674	San Marino 	San Marino	\N
00040000-56a2-5eb3-d0bd-ef9925b4b490	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-56a2-5eb3-0852-8494d193b67e	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-56a2-5eb3-e1b9-22cd5548e45a	SN	SEN	686	Senegal 	Senegal	\N
00040000-56a2-5eb3-c136-07184cda3e05	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-56a2-5eb3-f1a4-9f2c02aaa7c1	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-56a2-5eb3-03d1-2183c8a30192	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-56a2-5eb3-c97c-b6e33f4e9874	SG	SGP	702	Singapore 	Singapur	\N
00040000-56a2-5eb3-6322-f3301738cfb7	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-56a2-5eb3-af7f-43e7db94cae2	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-56a2-5eb3-7b18-74a65a491a82	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-56a2-5eb3-fce0-0bee1231fb22	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-56a2-5eb3-79c0-5b358ebe9f7a	SO	SOM	706	Somalia 	Somalija	\N
00040000-56a2-5eb3-15d6-f1f7b6f26629	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-56a2-5eb3-1d24-04081683d730	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-56a2-5eb3-2efd-f90ca47da5b2	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-56a2-5eb3-c878-74f27fba82d0	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-56a2-5eb3-cf48-01f67bab837b	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-56a2-5eb3-a15e-5c8959ee45bf	SD	SDN	729	Sudan 	Sudan	\N
00040000-56a2-5eb3-8cc1-b681cdec3aa6	SR	SUR	740	Suriname 	Surinam	\N
00040000-56a2-5eb3-41a8-f5eaf59d654a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-56a2-5eb3-8f13-cf0ba0889052	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-56a2-5eb3-5226-7cf6600c1fa5	SE	SWE	752	Sweden 	Švedska	\N
00040000-56a2-5eb3-091d-354e0f3f4300	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-56a2-5eb3-9286-d360c5a093d5	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-56a2-5eb3-5d0b-2a30e01bcb5c	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-56a2-5eb3-d561-67a0e8393175	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-56a2-5eb3-8200-fb9a6f6e446c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-56a2-5eb3-7707-c92b2efe56fa	TH	THA	764	Thailand 	Tajska	\N
00040000-56a2-5eb3-99a4-34131809738b	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-56a2-5eb3-3f2d-7e9b26dbaee3	TG	TGO	768	Togo 	Togo	\N
00040000-56a2-5eb3-00a9-960c7bf4211b	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-56a2-5eb3-a9c9-c909fee92a57	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-56a2-5eb3-52cf-97b25e5bca42	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-56a2-5eb3-bf36-b5cef8958e20	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-56a2-5eb3-13bd-787286a20c06	TR	TUR	792	Turkey 	Turčija	\N
00040000-56a2-5eb3-ca62-faf126ed8d0c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-56a2-5eb3-70df-b7b19618d4c1	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a2-5eb3-d3a5-ddac8a145802	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-56a2-5eb3-3884-c843f6f40a55	UG	UGA	800	Uganda 	Uganda	\N
00040000-56a2-5eb3-a3f5-f1f77ffc4e06	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-56a2-5eb3-c563-ce2d1a8dfda7	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-56a2-5eb3-971d-8ad5bbb9a3c0	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-56a2-5eb3-40c1-9e4782da5098	US	USA	840	United States 	Združene države Amerike	\N
00040000-56a2-5eb3-76aa-5e4d77ab9e4a	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-56a2-5eb3-9cd0-5602c8e89c4e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-56a2-5eb3-77ba-1919d04b8523	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-56a2-5eb3-48ec-b52be1cf758a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-56a2-5eb3-ebdc-bc7858e800de	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-56a2-5eb3-b6ae-519813664988	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-56a2-5eb3-94f2-c797144a88c2	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-56a2-5eb3-3633-087560d8a45b	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-56a2-5eb3-2e37-4e7e993a6233	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-56a2-5eb3-7099-496acf496380	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-56a2-5eb3-4c36-67499b26189c	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-56a2-5eb3-8717-e1c4fc81b570	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-56a2-5eb3-682e-bc8387282e42	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3202 (class 0 OID 39921210)
-- Dependencies: 242
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
00310000-56a2-5eb6-20b8-a2deb0bed41f	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-56a2-5eb6-eea4-933622653a10	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a2-5eb7-9405-2b0d6d9e2f58	000e0000-56a2-5eb6-477e-f3b758c87513	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a2-5eb3-448c-9ff24b34bd3e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a2-5eb7-582a-183e2466b678	000e0000-56a2-5eb6-016b-f1e609b4a7d0	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a2-5eb3-b17c-cbec63ad6c37	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-56a2-5eb7-3913-f0279aacd7bd	000e0000-56a2-5eb6-bd45-d6da55876662	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-56a2-5eb3-448c-9ff24b34bd3e	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3187 (class 0 OID 39921016)
-- Dependencies: 227
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-56a2-5eb6-9ffb-5b6b92976887	000e0000-56a2-5eb6-016b-f1e609b4a7d0	\N	tehnik	t	Tonski mojster	funkcija brez alternacij		t	9	t	t	\N	000f0000-56a2-5eb3-4b46-c5602de6570c
000d0000-56a2-5eb6-ac87-c1d2f58b34db	000e0000-56a2-5eb6-f577-4b11f9e1faa1	\N	igralec	\N	Konj	glavna vloga	velika	t	5	t	t	\N	000f0000-56a2-5eb3-6e81-30f260eda157
000d0000-56a2-5eb6-f2c2-e56ae4131942	000e0000-56a2-5eb6-f577-4b11f9e1faa1	\N	umetnik	\N	Režiramo		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-0026-fdb9124aed70	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-2782-ef156d82f2fe	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-56a2-5eb3-6e81-30f260eda157
000d0000-56a2-5eb6-ea48-33f7199178be	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-26d6-1592a0b8c3e6	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-b4cd-beb123e16a75	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-d1c4-ba5d795d02d7	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-56a2-5eb3-8ec7-214763b6101b
000d0000-56a2-5eb6-658e-33c68bc3c83b	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-93d8-ad50a2bb3600	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-56a2-5eb3-4b46-c5602de6570c
000d0000-56a2-5eb6-b1d9-5a508a059c63	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-8ecb-afa3d5bf66cb	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-56a2-5eb3-4b46-c5602de6570c
000d0000-56a2-5eb6-c7bd-6a8ccbc8a108	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-5f27-4c9c72ffdcac	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-56a2-5eb3-6e81-30f260eda157
000d0000-56a2-5eb6-48c3-8ddf5a2f5d6b	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-1ee0-2a8199565146	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-56a2-5eb3-6e81-30f260eda157
000d0000-56a2-5eb6-6213-20c48364f8fd	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-7b58-8de6499bae91	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-56a2-5eb3-a8d4-ef72bf2a2f19
000d0000-56a2-5eb6-1405-7e9fb939541c	000e0000-56a2-5eb6-016b-f1e609b4a7d0	000c0000-56a2-5eb7-a6d3-3512d85fcc72	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-56a2-5eb3-e941-121412540c95
000d0000-56a2-5eb6-ebbe-666c15d5f2ed	000e0000-56a2-5eb6-da81-fda93c9b0c6d	000c0000-56a2-5eb7-a1b8-782a320d077f	umetnik	\N	u11_DN fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-5f06-2bc81a09570c	000e0000-56a2-5eb6-5455-3b578d0aec66	000c0000-56a2-5eb7-0247-741af69b3da4	umetnik	\N	u12_EN fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-33fc-285dff6938e6	000e0000-56a2-5eb6-5455-3b578d0aec66	000c0000-56a2-5eb7-0a35-7973c5a57428	umetnik	\N	u12_ND fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-067c-7a93e4420205	000e0000-56a2-5eb6-0c39-61fe5586084c	000c0000-56a2-5eb7-a209-97623ebbb715	umetnik	\N	u13_BN fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-e6e3-a1059f054798	000e0000-56a2-5eb6-232b-d292a17d57a1	000c0000-56a2-5eb7-8973-a23ab23c8aec	umetnik	\N	u14_NB fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-84f2-6bc2a4f9eb5a	000e0000-56a2-5eb6-3086-d7d2ff2b9943	000c0000-56a2-5eb7-9d81-8ab6a025aaf9	umetnik	\N	u15_N fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-f357-14cd316fccda	000e0000-56a2-5eb6-fb1f-56fdfc1499ad	000c0000-56a2-5eb7-b100-1ea4aef13c5d	umetnik	\N	u16_D_fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-4e3b-7f9e9b434ad3	000e0000-56a2-5eb6-861e-4240e141f204	000c0000-56a2-5eb7-7684-f9c07aa30523	umetnik	\N	u17_DE_fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-f91e-7a078dec00d5	000e0000-56a2-5eb6-4f7f-a320777792d6	000c0000-56a2-5eb7-25a4-2b5c1ab655a3	umetnik	\N	u18_NN_fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-2fec-4159a0a2169e	000e0000-56a2-5eb6-4f7f-a320777792d6	000c0000-56a2-5eb7-2e64-70bbed3a2b8b	umetnik	\N	u18_DENN_fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-2c1b-0cb220fd41ef	000e0000-56a2-5eb6-ddf6-b598a20810ac	000c0000-56a2-5eb7-24ae-ec604de1e2c6	umetnik	\N	u19_D_fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
000d0000-56a2-5eb6-8ace-96f1c47044fc	000e0000-56a2-5eb6-ddf6-b598a20810ac	000c0000-56a2-5eb7-ef1e-1abfdebd8ffd	umetnik	\N	u19_EN_fja		velika	t	5	t	t	\N	000f0000-56a2-5eb3-b353-2c4544f35a33
\.


--
-- TOC entry 3162 (class 0 OID 39920794)
-- Dependencies: 202
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 39920765)
-- Dependencies: 199
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3157 (class 0 OID 39920742)
-- Dependencies: 197
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-56a2-5eb6-e21b-b4502c47bf83	00080000-56a2-5eb6-575a-ff5ab5ae245b	00090000-56a2-5eb6-8333-55c9f7889ae5	AK		igralka
\.


--
-- TOC entry 3176 (class 0 OID 39920930)
-- Dependencies: 216
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3213 (class 0 OID 39921480)
-- Dependencies: 253
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-56a2-5eb6-fa27-957692778b47	00010000-56a2-5eb4-f739-ab5525127f33	\N	Prva mapa	Root mapa	2016-01-22 17:54:14	2016-01-22 17:54:14	R	\N	\N
\.


--
-- TOC entry 3214 (class 0 OID 39921493)
-- Dependencies: 254
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3216 (class 0 OID 39921515)
-- Dependencies: 256
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 34548309)
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
-- TOC entry 3180 (class 0 OID 39920954)
-- Dependencies: 220
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 39920699)
-- Dependencies: 194
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-56a2-5eb4-35be-460d2dd37537	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-56a2-5eb4-8c98-0e3608c3877c	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-56a2-5eb4-5912-3982fdebe1ba	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-56a2-5eb4-872e-437169e6fc1c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-56a2-5eb4-7d80-5f3f5308fdce	dogodek.status	array	a:8:{s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"400s";a:1:{s:5:"label";s:9:"Pregledan";}s:4:"500s";a:1:{s:5:"label";s:7:"Potrjen";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"710s";a:1:{s:5:"label";s:23:"Obdelan od inšpicienta";}s:4:"720s";a:1:{s:5:"label";s:28:"Obdelan od tehničnega vodje";}s:4:"790s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-56a2-5eb4-18cf-888c4521d71e	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"600s";a:2:{s:5:"label";s:17:"tehnični dogodek";s:4:"type";s:8:"tehnicni";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-56a2-5eb4-2751-f4320092b361	dogodek.delte	array	a:12:{s:9:"delPreZac";a:2:{s:5:"label";s:29:"Delta začetka pri predstavah";s:5:"value";i:-60;}s:12:"delPreZacTeh";a:2:{s:5:"label";s:40:"Delta začetka pri predstavah za tehnike";s:5:"value";i:-60;}s:9:"delPreKon";a:2:{s:5:"label";s:26:"Delta konca pri predstavah";s:5:"value";i:0;}s:12:"delPreKonTeh";a:2:{s:5:"label";s:37:"Delta konca pri predstavah za tehnike";s:5:"value";i:0;}s:9:"delVajZac";a:2:{s:5:"label";s:24:"Delta začetka pri vajah";s:5:"value";i:0;}s:12:"delVajZacTeh";a:2:{s:5:"label";s:35:"Delta začetka pri vajah za tehnike";s:5:"value";i:0;}s:9:"delVajKon";a:2:{s:5:"label";s:21:"Delta konca pri vajah";s:5:"value";i:0;}s:12:"delVajKonTeh";a:2:{s:5:"label";s:32:"Delta konca pri vajah za tehnike";s:5:"value";i:0;}s:9:"delSplZac";a:2:{s:5:"label";s:36:"Delta začetka pri splošnem dogodku";s:5:"value";i:0;}s:9:"delSplKon";a:2:{s:5:"label";s:33:"Delta konca pri splošnem dogodku";s:5:"value";i:0;}s:9:"delTehZac";a:2:{s:5:"label";s:37:"Delta začetka pri tehničnem dogodku";s:5:"value";i:0;}s:9:"delTehKon";a:2:{s:5:"label";s:34:"Delta konca pri tehničnem dogodku";s:5:"value";i:0;}}	f	f	f	\N	Privzete vrednosti za delte terminov storitev glede na tipe dogodka v minutah
00000000-56a2-5eb4-5e63-d0d7c7d97052	dogodek.termini	array	a:6:{s:15:"dopoldanZacetek";a:3:{s:5:"label";s:30:"Začetek dopoldanskega termina";s:1:"h";i:10;s:1:"m";i:0;}s:13:"dopoldanKonec";a:3:{s:5:"label";s:27:"Konec dopoldanskega termina";s:1:"h";i:14;s:1:"m";i:0;}s:15:"popoldanZacetek";a:3:{s:5:"label";s:30:"Začetek popoldanskega termina";s:1:"h";i:15;s:1:"m";i:0;}s:13:"popoldanKonec";a:3:{s:5:"label";s:27:"Konec popoldanskega termina";s:1:"h";i:19;s:1:"m";i:0;}s:12:"vecerZacetek";a:3:{s:5:"label";s:27:"Začetek večernega termina";s:1:"h";i:20;s:1:"m";i:0;}s:10:"vecerKonec";a:3:{s:5:"label";s:24:"Konec večernega termina";s:1:"h";i:23;s:1:"m";i:0;}}	f	f	f	\N	Privzete vrednosti za termine dogodkov
00000000-56a2-5eb4-1eca-640b5d3e1559	dogodek.barve	array	a:7:{s:13:"predstavaDoma";a:2:{s:5:"label";s:20:"Barva predstave doma";s:5:"value";s:7:"#191a00";}s:10:"gostovanje";a:2:{s:5:"label";s:16:"Barva gostovanja";s:5:"value";s:7:"#ff3300";}s:9:"gostujoca";a:2:{s:5:"label";s:25:"Barva gostujoce predstave";s:5:"value";s:7:"#29a329";}s:7:"splosni";a:2:{s:5:"label";s:29:"Barva drugega javnega dogodka";s:5:"value";s:7:"#0066ff";}s:4:"vaja";a:2:{s:5:"label";s:10:"Barva vaje";s:5:"value";s:7:"#ffa74d";}s:15:"obnovitvenaVaja";a:2:{s:5:"label";s:22:"Barva obnovitvene vaje";s:5:"value";s:7:"#ffe6cc";}s:8:"tehnicni";a:2:{s:5:"label";s:25:"Barva tehničnega dogodka";s:5:"value";s:7:"#ac7339";}}	t	f	t	\N	Privzete barve za različne tipe dogodkov
00000000-56a2-5eb4-de3e-ab0bd2bc73c4	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-56a2-5eb4-48cc-7dbc8c89d92a	funkcija.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a2-5eb4-ce61-a5a9b618f2ed	tipfunkcije.podrocje	array	a:5:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}s:9:"sepetalec";a:1:{s:5:"label";s:10:"Šepetalec";}}	f	t	f	\N	Področje funkcije
00000000-56a2-5eb4-333b-7219ddbda8be	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-56a2-5eb4-b1bd-2192b65174b6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-56a2-5eb4-fb47-e4e379a7843d	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-56a2-5eb4-b248-8f7ce7a343ce	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-56a2-5eb4-07a9-12685fb453fa	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-56a2-5eb6-18e7-699d160a304d	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-56a2-5eb6-fdda-6166be5279bf	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-56a2-5eb6-ea1a-5fb59f7e9fd2	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-56a2-5eb6-e8cb-b963a98c5812	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-56a2-5eb6-2376-ebb64d58c77f	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-56a2-5eb8-d8b0-f9d22fada22d	application.tenant.maticnopodjetje	string	s:36:"00080000-56a2-5eb8-e964-47edffc5247a";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3147 (class 0 OID 39920599)
-- Dependencies: 187
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-56a2-5eb6-fc08-295804e2ceb7	00000000-56a2-5eb6-18e7-699d160a304d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-56a2-5eb6-6e61-23260fc6ef0b	00000000-56a2-5eb6-18e7-699d160a304d	00010000-56a2-5eb4-f739-ab5525127f33	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-56a2-5eb6-edb1-e10e6555aabc	00000000-56a2-5eb6-fdda-6166be5279bf	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3151 (class 0 OID 39920666)
-- Dependencies: 191
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-56a2-5eb6-6e1f-87de87172ecf	\N	00100000-56a2-5eb6-fe1a-9818c9d7bea6	00100000-56a2-5eb6-2974-025895015fef	01	Gledališče Nimbis
00410000-56a2-5eb6-e362-c26e9d406038	00410000-56a2-5eb6-6e1f-87de87172ecf	00100000-56a2-5eb6-fe1a-9818c9d7bea6	00100000-56a2-5eb6-2974-025895015fef	02	Tehnika
\.


--
-- TOC entry 3148 (class 0 OID 39920610)
-- Dependencies: 188
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-56a2-5eb6-4abf-e796080cdea5	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-56a2-5eb6-54e9-c59ab924c6dd	00010000-56a2-5eb6-38f7-f8a17124e84f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-56a2-5eb6-c069-600a8e3a9381	00010000-56a2-5eb6-c389-18659f8edd0e	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-56a2-5eb6-ad14-5a1d91038fd3	00010000-56a2-5eb6-5711-693195aa5bb8	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-56a2-5eb6-62e3-6b8d83c3b73c	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-56a2-5eb6-4135-942abd4d952b	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-56a2-5eb6-7d77-ab87919b2b67	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-56a2-5eb6-7d8d-860f02cb1e0e	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-56a2-5eb6-8333-55c9f7889ae5	00010000-56a2-5eb6-ea29-7ad97d864e86	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-56a2-5eb6-0d63-ed891867074e	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-56a2-5eb6-9847-135b23234936	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a2-5eb6-42de-2ffb8f14f760	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-56a2-5eb6-0881-4c22b240bd48	00010000-56a2-5eb6-8a99-c2a08d7e508b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-56a2-5eb6-9a8f-f178b2828a7a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a2-5eb6-6459-257dd117a0cd	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a2-5eb6-6257-beb5100c45aa	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a2-5eb6-6038-7255680d281b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a2-5eb6-75df-fec4f7f4ea44	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-56a2-5eb6-3ccc-d6bbeed3e0b6	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a2-5eb6-4a4b-023ce7addb2f	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-56a2-5eb6-a2f3-e2d8d7c27cd8	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3140 (class 0 OID 39920544)
-- Dependencies: 180
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-56a2-5eb4-08f0-f435fd097893	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-56a2-5eb4-dbc8-afd923320394	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-56a2-5eb4-8d40-2c969ca740a0	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-56a2-5eb4-c684-a84163cc0903	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-56a2-5eb4-f02a-48a8f0340f92	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-56a2-5eb4-2246-b2080016a51d	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-56a2-5eb4-7760-ace8be8e2cca	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-56a2-5eb4-b098-27ff9f7e4a8c	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-56a2-5eb4-088c-006ebff1afd1	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-56a2-5eb4-18b6-1e3167f87d86	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-56a2-5eb4-2268-bbba5cee2cb0	OptionValue-writeGlobal	OptionValue - dovoljenje za spreminjanje globalnih opcij	t
00030000-56a2-5eb4-2b10-c6442f76ead0	Abonma-read	Abonma - branje	t
00030000-56a2-5eb4-2f8f-1f6f30501ee7	Abonma-write	Abonma - spreminjanje	t
00030000-56a2-5eb4-d2e9-31eff920e3f1	Alternacija-read	Alternacija - branje	t
00030000-56a2-5eb4-ceb7-d279c9295cbb	Alternacija-write	Alternacija - spreminjanje	t
00030000-56a2-5eb4-8894-863c5bff68cd	Arhivalija-read	Arhivalija - branje	t
00030000-56a2-5eb4-58db-8008ff9cd33d	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-56a2-5eb4-284f-4117a9ecf944	AuthStorage-read	AuthStorage - branje	t
00030000-56a2-5eb4-74e6-1d6d8850ad9f	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-56a2-5eb4-11b6-baf4864c2571	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-56a2-5eb4-30ff-b3d686cf284a	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-56a2-5eb4-9408-f533b0883697	Besedilo-read	Besedilo - branje	t
00030000-56a2-5eb4-a1bc-5deebd8d0e9a	Besedilo-write	Besedilo - spreminjanje	t
00030000-56a2-5eb4-3df5-54958d4ac614	Dodatek-read	Dodatek - branje	t
00030000-56a2-5eb4-ae69-4c08a07ab179	Dodatek-write	Dodatek - spreminjanje	t
00030000-56a2-5eb4-82ff-e35f4fb2417b	Dogodek-read	Dogodek - branje	t
00030000-56a2-5eb4-1fa0-a8e9c927ccc7	Dogodek-write	Dogodek - spreminjanje	t
00030000-56a2-5eb4-0be9-c9cf35937e1a	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-56a2-5eb4-459a-d36c8bda2b10	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-56a2-5eb4-aabb-087f7974bb13	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-56a2-5eb4-1ebc-a4b09de69dc4	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-56a2-5eb4-c65e-4a09109dde9f	DogodekTrait-read	DogodekTrait - branje	t
00030000-56a2-5eb4-3df1-c481408e0aee	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-56a2-5eb4-15b4-4f09de47e3ca	DrugiVir-read	DrugiVir - branje	t
00030000-56a2-5eb4-b456-7f0ad0deda90	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-56a2-5eb4-5ef4-8a751f72ea21	Drzava-read	Drzava - branje	t
00030000-56a2-5eb4-6ec5-f9128ae33330	Drzava-write	Drzava - spreminjanje	t
00030000-56a2-5eb4-b4be-3c0411d74230	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-56a2-5eb4-a1c7-508b63da2910	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-56a2-5eb4-2b60-a857306495a4	Funkcija-read	Funkcija - branje	t
00030000-56a2-5eb4-8d26-b21ead2cc1bd	Funkcija-write	Funkcija - spreminjanje	t
00030000-56a2-5eb4-f022-b8dd445bbda0	Gostovanje-read	Gostovanje - branje	t
00030000-56a2-5eb4-c62b-f34c0c894e99	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-56a2-5eb4-ae29-8ebe24ffa0f4	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-56a2-5eb4-05aa-4e5968c26294	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-56a2-5eb4-2548-9c8adb702c0b	Kupec-read	Kupec - branje	t
00030000-56a2-5eb4-eba3-b03eaad1e44d	Kupec-write	Kupec - spreminjanje	t
00030000-56a2-5eb4-6d23-e7f091c5dbaa	NacinPlacina-read	NacinPlacina - branje	t
00030000-56a2-5eb4-1f8c-111df35259df	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-56a2-5eb4-edf6-99a8a831bb56	Option-read	Option - branje	t
00030000-56a2-5eb4-b4d3-e0d6e8e375bc	Option-write	Option - spreminjanje	t
00030000-56a2-5eb4-febf-44cabcd5c391	OptionValue-read	OptionValue - branje	t
00030000-56a2-5eb4-c89e-a04e2d352e01	OptionValue-write	OptionValue - spreminjanje	t
00030000-56a2-5eb4-b3d5-a44061e414b6	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-56a2-5eb4-a4e5-a060c884c1c5	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-56a2-5eb4-67a7-23ce8414865a	Oseba-read	Oseba - branje	t
00030000-56a2-5eb4-8263-042627a95e8b	Oseba-write	Oseba - spreminjanje	t
00030000-56a2-5eb4-47fb-cd6e5e66a86c	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-56a2-5eb4-e56e-14937d1fb751	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-56a2-5eb4-f25f-005d74abf6b8	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-56a2-5eb4-8a34-1c417f68c9b6	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-56a2-5eb4-6e2c-4b4b54be48a0	Pogodba-read	Pogodba - branje	t
00030000-56a2-5eb4-2ab6-598a8cf4ec94	Pogodba-write	Pogodba - spreminjanje	t
00030000-56a2-5eb4-bf94-760b33557111	Popa-read	Popa - branje	t
00030000-56a2-5eb4-6fab-e8030b901e68	Popa-write	Popa - spreminjanje	t
00030000-56a2-5eb4-c49c-a254ec5b8930	Posta-read	Posta - branje	t
00030000-56a2-5eb4-7525-a933fb926480	Posta-write	Posta - spreminjanje	t
00030000-56a2-5eb4-06b2-501b3abff89d	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-56a2-5eb4-30d9-86b2367f3b5f	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-56a2-5eb4-88cb-d60cdf2d966f	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-56a2-5eb4-12c1-7a1cb09abb32	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-56a2-5eb4-559e-7e46c948f394	PostniNaslov-read	PostniNaslov - branje	t
00030000-56a2-5eb4-7457-dddffcd9b16d	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-56a2-5eb4-f9a9-691de8bfc37b	Praznik-read	Praznik - branje	t
00030000-56a2-5eb4-117d-44e8a709f269	Praznik-write	Praznik - spreminjanje	t
00030000-56a2-5eb4-2afc-45bd3366016d	Predstava-read	Predstava - branje	t
00030000-56a2-5eb4-1bf0-bb5ac818f6a4	Predstava-write	Predstava - spreminjanje	t
00030000-56a2-5eb4-bf28-56b7907fceb7	Ura-read	Ura - branje	t
00030000-56a2-5eb4-eb4e-47c71402c2cb	Ura-write	Ura - spreminjanje	t
00030000-56a2-5eb4-42f5-97a6283baa38	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-56a2-5eb4-abaa-ffc43d9f0759	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-56a2-5eb4-b49f-5d886c8bc4b4	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-56a2-5eb4-9438-d7b7ffde5a1e	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-56a2-5eb4-cfc2-e2a75fdc3e1b	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-56a2-5eb4-8a4d-0782a0321f66	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-56a2-5eb4-7b50-26cef7517663	ProgramDela-read	ProgramDela - branje	t
00030000-56a2-5eb4-46a6-2b3db59a0120	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-56a2-5eb4-768a-e12ed2987332	ProgramFestival-read	ProgramFestival - branje	t
00030000-56a2-5eb4-18c7-3f185100b84f	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-56a2-5eb4-6785-86befc4c6f2e	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-56a2-5eb4-cda2-db94291a71e8	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-56a2-5eb4-9475-1649af72c184	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-56a2-5eb4-9a33-7a29f2bbe8b4	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-56a2-5eb4-17d9-4095cae5a33a	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-56a2-5eb4-406f-6e725fc3205d	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-56a2-5eb4-4ed8-d77fa7e964ec	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-56a2-5eb4-4c9e-19e4d4e6c0fa	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-56a2-5eb4-88a8-aa8970fab9a2	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-56a2-5eb4-3834-068f53c02e56	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-56a2-5eb4-b435-f4276fe1e5c4	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-56a2-5eb4-517b-12a5e94a1503	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-56a2-5eb4-e874-30cc7adf31b5	ProgramRazno-read	ProgramRazno - branje	t
00030000-56a2-5eb4-9acd-944479e25611	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-56a2-5eb4-e721-fa1e71028a8d	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-56a2-5eb4-b9d6-bc7c475e81fd	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-56a2-5eb4-215f-2b26465b1d5b	Prostor-read	Prostor - branje	t
00030000-56a2-5eb4-5493-492e6dd4d025	Prostor-write	Prostor - spreminjanje	t
00030000-56a2-5eb4-f81c-4d5f4c5e37ac	Racun-read	Racun - branje	t
00030000-56a2-5eb4-6032-f454fcef0f8c	Racun-write	Racun - spreminjanje	t
00030000-56a2-5eb4-2c2a-9b64fa07bb91	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-56a2-5eb4-eab5-9f1b7ee79781	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-56a2-5eb4-281f-4552d5310b53	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-56a2-5eb4-822c-e1c1ffdc024c	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-56a2-5eb4-0617-976029091ebf	Rekvizit-read	Rekvizit - branje	t
00030000-56a2-5eb4-2673-b8081826d809	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-56a2-5eb4-36a6-c477d0f67dca	Revizija-read	Revizija - branje	t
00030000-56a2-5eb4-cdd5-e544d792b683	Revizija-write	Revizija - spreminjanje	t
00030000-56a2-5eb4-50d5-f0780d3bbea9	Rezervacija-read	Rezervacija - branje	t
00030000-56a2-5eb4-14ee-1a50615d8089	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-56a2-5eb4-0e0c-415545b8064b	SedezniRed-read	SedezniRed - branje	t
00030000-56a2-5eb4-8fa0-822d923e75c7	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-56a2-5eb4-441f-15f322888977	Sedez-read	Sedez - branje	t
00030000-56a2-5eb4-d7bd-ac6da2a12e44	Sedez-write	Sedez - spreminjanje	t
00030000-56a2-5eb4-fd21-09dcb0b62148	Sezona-read	Sezona - branje	t
00030000-56a2-5eb4-dddd-adbae3019694	Sezona-write	Sezona - spreminjanje	t
00030000-56a2-5eb4-e603-b7fd9a80dc15	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-56a2-5eb4-557f-058f6c2f008e	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-56a2-5eb4-25cd-070799cd148d	Telefonska-read	Telefonska - branje	t
00030000-56a2-5eb4-d7e1-b8cdb832257a	Telefonska-write	Telefonska - spreminjanje	t
00030000-56a2-5eb4-b7bd-8e167a17863e	TerminStoritve-read	TerminStoritve - branje	t
00030000-56a2-5eb4-ef54-1479a70ae7ae	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-56a2-5eb4-ff54-e4858403bb68	TipDodatka-read	TipDodatka - branje	t
00030000-56a2-5eb4-6aaa-be4a8f5a4296	TipDodatka-write	TipDodatka - spreminjanje	t
00030000-56a2-5eb4-77ce-1d55ab0c4622	TipFunkcije-read	TipFunkcije - branje	t
00030000-56a2-5eb4-8f60-b53733fc9bc2	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-56a2-5eb4-461e-42671875f7ce	TipPopa-read	TipPopa - branje	t
00030000-56a2-5eb4-8fe0-fbd2fbc18b52	TipPopa-write	TipPopa - spreminjanje	t
00030000-56a2-5eb4-1be4-01f0fb334843	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-56a2-5eb4-8029-59c144dac0b4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-56a2-5eb4-407e-44f3729c4bdf	TipVaje-read	TipVaje - branje	t
00030000-56a2-5eb4-b5eb-3c63584f484f	TipVaje-write	TipVaje - spreminjanje	t
00030000-56a2-5eb4-39ea-b854ec7b22a6	Trr-read	Trr - branje	t
00030000-56a2-5eb4-cbfb-a4998f2db22c	Trr-write	Trr - spreminjanje	t
00030000-56a2-5eb4-1cf6-b92b92fa350b	Uprizoritev-read	Uprizoritev - branje	t
00030000-56a2-5eb4-3bec-5656bb26b5a5	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-56a2-5eb4-9b6f-429c5444a9cc	Vaja-read	Vaja - branje	t
00030000-56a2-5eb4-05a9-10f25ab59388	Vaja-write	Vaja - spreminjanje	t
00030000-56a2-5eb4-f5a6-e03423f54c33	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-56a2-5eb4-eaa2-0e2be75fa5f0	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-56a2-5eb4-42cd-80a484d0b099	VrstaStroska-read	VrstaStroska - branje	t
00030000-56a2-5eb4-6d77-53d187c97e32	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-56a2-5eb4-3937-3e561e57a63d	Zaposlitev-read	Zaposlitev - branje	t
00030000-56a2-5eb4-18ab-8fb925489541	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-56a2-5eb4-e1bb-7f00e872c177	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-56a2-5eb4-9792-331e5975ab78	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-56a2-5eb4-c8f1-0c6e2ad90265	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-56a2-5eb4-6594-5927e4e48022	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-56a2-5eb4-6ae4-88812d9b9931	Job-read	Branje opravil - samo zase - branje	t
00030000-56a2-5eb4-5e95-fb35c33af61f	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-56a2-5eb4-379f-f202608eec63	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-56a2-5eb4-d051-37bf19429cb8	Report-read	Report - branje	t
00030000-56a2-5eb4-4fee-b01694434e87	Report-write	Report - spreminjanje	t
00030000-56a2-5eb4-580a-51fb9646d077	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-56a2-5eb4-6eea-160634f58142	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-56a2-5eb4-97fc-e0e95c9bcb69	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-56a2-5eb4-a6ff-028a785d1324	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-56a2-5eb4-2048-7f64013700df	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-56a2-5eb4-0bce-d2ad86a3f7ee	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-56a2-5eb4-747e-d0bdcb2dcee6	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-56a2-5eb4-6a8a-a587d2c52e9f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a2-5eb4-5702-3b71ab1c8c80	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-56a2-5eb4-a922-bf7fac504e72	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a2-5eb4-4a93-f9442411b855	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-56a2-5eb4-7e4d-35dddb65edf2	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-56a2-5eb4-f4dd-51a049b68699	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-56a2-5eb4-d9ea-c8a6e8e09165	Datoteka-write	Datoteka - spreminjanje	t
00030000-56a2-5eb4-e129-0020263540e0	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3142 (class 0 OID 39920563)
-- Dependencies: 182
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-56a2-5eb4-7809-a38bbab5b80b	00030000-56a2-5eb4-dbc8-afd923320394
00020000-56a2-5eb4-7809-a38bbab5b80b	00030000-56a2-5eb4-08f0-f435fd097893
00020000-56a2-5eb4-387f-ba87335117a3	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-ade9-0eca50b4f0ea	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-e4ee-2a9ffec8a148	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-e4ee-2a9ffec8a148	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-e4ee-2a9ffec8a148	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-e4ee-2a9ffec8a148	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-e4ee-2a9ffec8a148	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-e4ee-2a9ffec8a148	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-18ab-8fb925489541
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-5d38-358707f69f53	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-50d4-6fdf6f09ded5	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-50d4-6fdf6f09ded5	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-50d4-6fdf6f09ded5	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-0537-4c565bedbe83	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-6de9-cbad0a2324cd	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-6de9-cbad0a2324cd	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-6de9-cbad0a2324cd	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-6de9-cbad0a2324cd	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-ca22-4a651a21d01b	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-4796-662db004f4a3	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-6fab-e8030b901e68
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-05aa-4e5968c26294
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-8a4d-0782a0321f66
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-56a3-67c604c8797c	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-3168-2cb615360d1b	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-77ac-5a9dfa6d2f23	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-77ac-5a9dfa6d2f23	00030000-56a2-5eb4-8fe0-fbd2fbc18b52
00020000-56a2-5eb4-3bc9-de416255c073	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-2e46-cd12ccda7c88	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-2e46-cd12ccda7c88	00030000-56a2-5eb4-7525-a933fb926480
00020000-56a2-5eb4-6ea6-7132a55e376e	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-46f6-270e410b6064	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-46f6-270e410b6064	00030000-56a2-5eb4-6ec5-f9128ae33330
00020000-56a2-5eb4-127c-8d8ab800f540	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-a07c-a8cb9bffead0	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-a07c-a8cb9bffead0	00030000-56a2-5eb4-6594-5927e4e48022
00020000-56a2-5eb4-cd9a-5687ff3b32e3	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-03fb-097b29efca46	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-03fb-097b29efca46	00030000-56a2-5eb4-9792-331e5975ab78
00020000-56a2-5eb4-2128-3e3c62229ae8	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-a86f-32b6ed829cae	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-a86f-32b6ed829cae	00030000-56a2-5eb4-2f8f-1f6f30501ee7
00020000-56a2-5eb4-ba0a-a86a38e1252a	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-4b07-d113a2b66fbb	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-4b07-d113a2b66fbb	00030000-56a2-5eb4-5493-492e6dd4d025
00020000-56a2-5eb4-4b07-d113a2b66fbb	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-4b07-d113a2b66fbb	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-4b07-d113a2b66fbb	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb4-4b07-d113a2b66fbb	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-2685-48d0650db0c9	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-2685-48d0650db0c9	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-2685-48d0650db0c9	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-855f-fb9fe05283e7	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-855f-fb9fe05283e7	00030000-56a2-5eb4-6d77-53d187c97e32
00020000-56a2-5eb4-5468-db7d841d0c41	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-a4e5-a060c884c1c5
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-61d5-93234d360428	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-69b6-12a6d3ec2ba4	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-69b6-12a6d3ec2ba4	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-69b6-12a6d3ec2ba4	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-69b6-12a6d3ec2ba4	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-69b6-12a6d3ec2ba4	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-c970-bf720aeffc41	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-c970-bf720aeffc41	00030000-56a2-5eb4-b5eb-3c63584f484f
00020000-56a2-5eb4-9376-0b6637b2094e	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-7760-ace8be8e2cca
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-b098-27ff9f7e4a8c
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-7b50-26cef7517663
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-46a6-2b3db59a0120
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-768a-e12ed2987332
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-18c7-3f185100b84f
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-6785-86befc4c6f2e
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-cda2-db94291a71e8
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-9475-1649af72c184
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-9a33-7a29f2bbe8b4
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-17d9-4095cae5a33a
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-406f-6e725fc3205d
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-4ed8-d77fa7e964ec
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-4c9e-19e4d4e6c0fa
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-88a8-aa8970fab9a2
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-3834-068f53c02e56
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-b435-f4276fe1e5c4
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-517b-12a5e94a1503
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-e874-30cc7adf31b5
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-9acd-944479e25611
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-e721-fa1e71028a8d
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-b9d6-bc7c475e81fd
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-9438-d7b7ffde5a1e
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-b456-7f0ad0deda90
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-30d9-86b2367f3b5f
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-5e95-fb35c33af61f
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-15b4-4f09de47e3ca
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-b49f-5d886c8bc4b4
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-06b2-501b3abff89d
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-6ae4-88812d9b9931
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-4a8a-de60f6705b56	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-7b50-26cef7517663
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-768a-e12ed2987332
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-6785-86befc4c6f2e
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-9475-1649af72c184
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-17d9-4095cae5a33a
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-4ed8-d77fa7e964ec
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-88a8-aa8970fab9a2
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-b435-f4276fe1e5c4
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-e874-30cc7adf31b5
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-e721-fa1e71028a8d
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-b49f-5d886c8bc4b4
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-15b4-4f09de47e3ca
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-06b2-501b3abff89d
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-6ae4-88812d9b9931
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-c0a6-80a031789fec	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-18b6-1e3167f87d86
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-adfe-30f535814778	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-943b-d44eb438fd51	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-0484-fc8b40de58da	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-2ab6-598a8cf4ec94
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-3417-34d6df248186	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-35fe-5bbeafc4eb50	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-2901-6d9ac56e79c5	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-9d4c-3acad3fff068	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-9d4c-3acad3fff068	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb4-9d4c-3acad3fff068	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-9d4c-3acad3fff068	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-ca72-f8901cff2597	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-ca72-f8901cff2597	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-15b4-4f09de47e3ca
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-b456-7f0ad0deda90
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-18b6-1e3167f87d86
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-6ae4-88812d9b9931
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-5e95-fb35c33af61f
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-2ab6-598a8cf4ec94
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-06b2-501b3abff89d
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-30d9-86b2367f3b5f
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-b49f-5d886c8bc4b4
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-9438-d7b7ffde5a1e
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-7760-ace8be8e2cca
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-7b50-26cef7517663
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-b098-27ff9f7e4a8c
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-46a6-2b3db59a0120
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-768a-e12ed2987332
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-18c7-3f185100b84f
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-6785-86befc4c6f2e
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-cda2-db94291a71e8
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-9475-1649af72c184
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-9a33-7a29f2bbe8b4
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-17d9-4095cae5a33a
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-406f-6e725fc3205d
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-4ed8-d77fa7e964ec
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-4c9e-19e4d4e6c0fa
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-88a8-aa8970fab9a2
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-3834-068f53c02e56
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-b435-f4276fe1e5c4
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-517b-12a5e94a1503
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-e874-30cc7adf31b5
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-9acd-944479e25611
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-e721-fa1e71028a8d
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-b9d6-bc7c475e81fd
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-0eac-267aee1b72e4	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-e47e-770b0d8a1609	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-18b6-1e3167f87d86
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-7556-50b447974f77	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-15b4-4f09de47e3ca
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-b456-7f0ad0deda90
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-18b6-1e3167f87d86
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-6ae4-88812d9b9931
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-5e95-fb35c33af61f
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-05aa-4e5968c26294
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-2ab6-598a8cf4ec94
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-6fab-e8030b901e68
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-06b2-501b3abff89d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-30d9-86b2367f3b5f
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-b49f-5d886c8bc4b4
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-9438-d7b7ffde5a1e
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-8a4d-0782a0321f66
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-7760-ace8be8e2cca
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-7b50-26cef7517663
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-b098-27ff9f7e4a8c
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-46a6-2b3db59a0120
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-768a-e12ed2987332
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-18c7-3f185100b84f
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-6785-86befc4c6f2e
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-cda2-db94291a71e8
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-9475-1649af72c184
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-9a33-7a29f2bbe8b4
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-17d9-4095cae5a33a
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-406f-6e725fc3205d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-4ed8-d77fa7e964ec
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-4c9e-19e4d4e6c0fa
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-88a8-aa8970fab9a2
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-3834-068f53c02e56
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-b435-f4276fe1e5c4
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-517b-12a5e94a1503
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-e874-30cc7adf31b5
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-9acd-944479e25611
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-e721-fa1e71028a8d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-b9d6-bc7c475e81fd
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-18ab-8fb925489541
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-ab25-b3ad1699ee20	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-18b6-1e3167f87d86
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-05aa-4e5968c26294
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-6fab-e8030b901e68
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-8a4d-0782a0321f66
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-18ab-8fb925489541
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-8041-79d5d1fccab9	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-c6cf-c3f436eb26bd	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-15b4-4f09de47e3ca
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-b456-7f0ad0deda90
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-6ae4-88812d9b9931
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-5e95-fb35c33af61f
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-05aa-4e5968c26294
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-a4e5-a060c884c1c5
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-2ab6-598a8cf4ec94
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-6fab-e8030b901e68
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-06b2-501b3abff89d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-30d9-86b2367f3b5f
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-b49f-5d886c8bc4b4
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-9438-d7b7ffde5a1e
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-8a4d-0782a0321f66
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-7760-ace8be8e2cca
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-7b50-26cef7517663
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-b098-27ff9f7e4a8c
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-46a6-2b3db59a0120
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-768a-e12ed2987332
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-18c7-3f185100b84f
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-6785-86befc4c6f2e
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-cda2-db94291a71e8
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-9475-1649af72c184
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-9a33-7a29f2bbe8b4
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-17d9-4095cae5a33a
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-406f-6e725fc3205d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-4ed8-d77fa7e964ec
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-4c9e-19e4d4e6c0fa
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-88a8-aa8970fab9a2
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-3834-068f53c02e56
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-b435-f4276fe1e5c4
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-517b-12a5e94a1503
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-e874-30cc7adf31b5
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-9acd-944479e25611
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-e721-fa1e71028a8d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-b9d6-bc7c475e81fd
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-6d77-53d187c97e32
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-18ab-8fb925489541
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb4-775e-a9d11e7b16f2	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-08f0-f435fd097893
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-dbc8-afd923320394
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2b10-c6442f76ead0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2f8f-1f6f30501ee7
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8894-863c5bff68cd
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-58db-8008ff9cd33d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-284f-4117a9ecf944
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-74e6-1d6d8850ad9f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-11b6-baf4864c2571
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-30ff-b3d686cf284a
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9408-f533b0883697
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-a1bc-5deebd8d0e9a
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-82ff-e35f4fb2417b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-c684-a84163cc0903
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-0be9-c9cf35937e1a
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-459a-d36c8bda2b10
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-aabb-087f7974bb13
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-1ebc-a4b09de69dc4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-c65e-4a09109dde9f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-3df1-c481408e0aee
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-1fa0-a8e9c927ccc7
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-15b4-4f09de47e3ca
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b456-7f0ad0deda90
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-5ef4-8a751f72ea21
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6ec5-f9128ae33330
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b4be-3c0411d74230
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-a1c7-508b63da2910
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-18b6-1e3167f87d86
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f022-b8dd445bbda0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-c62b-f34c0c894e99
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-379f-f202608eec63
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6ae4-88812d9b9931
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-5e95-fb35c33af61f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-ae29-8ebe24ffa0f4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-05aa-4e5968c26294
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2548-9c8adb702c0b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-eba3-b03eaad1e44d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-747e-d0bdcb2dcee6
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-0bce-d2ad86a3f7ee
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6eea-160634f58142
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-97fc-e0e95c9bcb69
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-a6ff-028a785d1324
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2048-7f64013700df
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6d23-e7f091c5dbaa
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-1f8c-111df35259df
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-edf6-99a8a831bb56
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-febf-44cabcd5c391
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-c89e-a04e2d352e01
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2268-bbba5cee2cb0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b4d3-e0d6e8e375bc
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b3d5-a44061e414b6
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-a4e5-a060c884c1c5
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-47fb-cd6e5e66a86c
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-e56e-14937d1fb751
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f25f-005d74abf6b8
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8a34-1c417f68c9b6
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2ab6-598a8cf4ec94
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6fab-e8030b901e68
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-c49c-a254ec5b8930
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-06b2-501b3abff89d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-30d9-86b2367f3b5f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-88cb-d60cdf2d966f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-12c1-7a1cb09abb32
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-7525-a933fb926480
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f9a9-691de8bfc37b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-117d-44e8a709f269
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2afc-45bd3366016d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-1bf0-bb5ac818f6a4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-42f5-97a6283baa38
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-abaa-ffc43d9f0759
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b49f-5d886c8bc4b4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9438-d7b7ffde5a1e
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-cfc2-e2a75fdc3e1b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8a4d-0782a0321f66
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-7760-ace8be8e2cca
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-7b50-26cef7517663
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b098-27ff9f7e4a8c
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-46a6-2b3db59a0120
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-768a-e12ed2987332
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-18c7-3f185100b84f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6785-86befc4c6f2e
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-cda2-db94291a71e8
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9475-1649af72c184
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9a33-7a29f2bbe8b4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-17d9-4095cae5a33a
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-406f-6e725fc3205d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-4ed8-d77fa7e964ec
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-4c9e-19e4d4e6c0fa
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-88a8-aa8970fab9a2
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-3834-068f53c02e56
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b435-f4276fe1e5c4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-517b-12a5e94a1503
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-e874-30cc7adf31b5
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9acd-944479e25611
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-e721-fa1e71028a8d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b9d6-bc7c475e81fd
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-215f-2b26465b1d5b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-5493-492e6dd4d025
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f81c-4d5f4c5e37ac
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6032-f454fcef0f8c
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2c2a-9b64fa07bb91
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-eab5-9f1b7ee79781
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-281f-4552d5310b53
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-822c-e1c1ffdc024c
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-0617-976029091ebf
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-2673-b8081826d809
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-d051-37bf19429cb8
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-4fee-b01694434e87
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-36a6-c477d0f67dca
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-cdd5-e544d792b683
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-50d5-f0780d3bbea9
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-14ee-1a50615d8089
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-0e0c-415545b8064b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8fa0-822d923e75c7
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-441f-15f322888977
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-d7bd-ac6da2a12e44
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-fd21-09dcb0b62148
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-dddd-adbae3019694
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-580a-51fb9646d077
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b7bd-8e167a17863e
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8d40-2c969ca740a0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-ef54-1479a70ae7ae
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-77ce-1d55ab0c4622
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8f60-b53733fc9bc2
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-461e-42671875f7ce
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8fe0-fbd2fbc18b52
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-1be4-01f0fb334843
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-8029-59c144dac0b4
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-407e-44f3729c4bdf
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-b5eb-3c63584f484f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9b6f-429c5444a9cc
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-05a9-10f25ab59388
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f5a6-e03423f54c33
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-eaa2-0e2be75fa5f0
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-42cd-80a484d0b099
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6d77-53d187c97e32
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-f4dd-51a049b68699
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-7e4d-35dddb65edf2
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-18ab-8fb925489541
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-e1bb-7f00e872c177
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-9792-331e5975ab78
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-c8f1-0c6e2ad90265
00020000-56a2-5eb6-5121-1f32b7657e0f	00030000-56a2-5eb4-6594-5927e4e48022
00020000-56a2-5eb6-5685-2c314bc997b0	00030000-56a2-5eb4-4a93-f9442411b855
00020000-56a2-5eb6-ed84-9f7a600abead	00030000-56a2-5eb4-a922-bf7fac504e72
00020000-56a2-5eb6-d61d-0b3148011e62	00030000-56a2-5eb4-3bec-5656bb26b5a5
00020000-56a2-5eb6-8012-0ed5bce10a30	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb6-5cb7-e0f2ca52acfa	00030000-56a2-5eb4-97fc-e0e95c9bcb69
00020000-56a2-5eb6-781a-6517203e23c6	00030000-56a2-5eb4-a6ff-028a785d1324
00020000-56a2-5eb6-1064-5cdf2133f8ce	00030000-56a2-5eb4-2048-7f64013700df
00020000-56a2-5eb6-df6b-693be2f38234	00030000-56a2-5eb4-6eea-160634f58142
00020000-56a2-5eb6-6304-531df6f1795b	00030000-56a2-5eb4-747e-d0bdcb2dcee6
00020000-56a2-5eb6-a6ff-0215194a170e	00030000-56a2-5eb4-0bce-d2ad86a3f7ee
00020000-56a2-5eb6-e4d1-24b62789865d	00030000-56a2-5eb4-5702-3b71ab1c8c80
00020000-56a2-5eb6-661b-b92e2e9a7388	00030000-56a2-5eb4-6a8a-a587d2c52e9f
00020000-56a2-5eb6-5a36-f4c6bc9ba8b7	00030000-56a2-5eb4-67a7-23ce8414865a
00020000-56a2-5eb6-41ce-ee15980b090c	00030000-56a2-5eb4-8263-042627a95e8b
00020000-56a2-5eb6-b060-c20b4c33b940	00030000-56a2-5eb4-f02a-48a8f0340f92
00020000-56a2-5eb6-fe74-49c3d8d013d0	00030000-56a2-5eb4-2246-b2080016a51d
00020000-56a2-5eb6-88d1-3a9cd2c7b244	00030000-56a2-5eb4-d9ea-c8a6e8e09165
00020000-56a2-5eb6-9d26-a10b288b35e6	00030000-56a2-5eb4-e129-0020263540e0
00020000-56a2-5eb6-c835-408e200ea941	00030000-56a2-5eb4-bf94-760b33557111
00020000-56a2-5eb6-c835-408e200ea941	00030000-56a2-5eb4-6fab-e8030b901e68
00020000-56a2-5eb6-c835-408e200ea941	00030000-56a2-5eb4-1cf6-b92b92fa350b
00020000-56a2-5eb6-9c7b-923b4cb7e4c6	00030000-56a2-5eb4-39ea-b854ec7b22a6
00020000-56a2-5eb6-4cbf-f7ef6328dfd7	00030000-56a2-5eb4-cbfb-a4998f2db22c
00020000-56a2-5eb6-758c-762544b34ba8	00030000-56a2-5eb4-580a-51fb9646d077
00020000-56a2-5eb6-4593-f0659a79ffde	00030000-56a2-5eb4-25cd-070799cd148d
00020000-56a2-5eb6-e470-397a6e9164f9	00030000-56a2-5eb4-d7e1-b8cdb832257a
00020000-56a2-5eb6-336c-eca48bf6ee05	00030000-56a2-5eb4-559e-7e46c948f394
00020000-56a2-5eb6-8249-554e5659d796	00030000-56a2-5eb4-7457-dddffcd9b16d
00020000-56a2-5eb6-97c8-1e178642a0cc	00030000-56a2-5eb4-3937-3e561e57a63d
00020000-56a2-5eb6-2fa8-b5dc430882f8	00030000-56a2-5eb4-18ab-8fb925489541
00020000-56a2-5eb6-dd86-9ce2170c2fd5	00030000-56a2-5eb4-6e2c-4b4b54be48a0
00020000-56a2-5eb6-4d79-aa4373480280	00030000-56a2-5eb4-2ab6-598a8cf4ec94
00020000-56a2-5eb6-1ea5-332bb7a3f1fb	00030000-56a2-5eb4-e603-b7fd9a80dc15
00020000-56a2-5eb6-1371-2e951dd3f6c6	00030000-56a2-5eb4-557f-058f6c2f008e
00020000-56a2-5eb6-5ffc-1c80e103c49d	00030000-56a2-5eb4-d2e9-31eff920e3f1
00020000-56a2-5eb6-3dc9-235e7933094f	00030000-56a2-5eb4-ceb7-d279c9295cbb
00020000-56a2-5eb6-47fa-df0ff9fe253f	00030000-56a2-5eb4-088c-006ebff1afd1
00020000-56a2-5eb6-b209-8256758421d1	00030000-56a2-5eb4-2b60-a857306495a4
00020000-56a2-5eb6-aa55-c4c8d946e6e3	00030000-56a2-5eb4-8d26-b21ead2cc1bd
00020000-56a2-5eb6-3d91-0a0d53b2708a	00030000-56a2-5eb4-18b6-1e3167f87d86
\.


--
-- TOC entry 3181 (class 0 OID 39920961)
-- Dependencies: 221
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3185 (class 0 OID 39920996)
-- Dependencies: 225
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3197 (class 0 OID 39921129)
-- Dependencies: 237
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-56a2-5eb6-d7e3-dbe412d4c974	00090000-56a2-5eb6-4abf-e796080cdea5	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-56a2-5eb6-5d01-fb468e954320	00090000-56a2-5eb6-4135-942abd4d952b	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-56a2-5eb6-9195-98d119e008fa	00090000-56a2-5eb6-0881-4c22b240bd48	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-56a2-5eb6-ac54-59aa1392206b	00090000-56a2-5eb6-0d63-ed891867074e	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3150 (class 0 OID 39920646)
-- Dependencies: 190
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-56a2-5eb6-575a-ff5ab5ae245b	\N	00040000-56a2-5eb3-7b18-74a65a491a82	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-8702-6b4610e784ab	\N	00040000-56a2-5eb3-7b18-74a65a491a82	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-56a2-5eb6-de01-3d676ef27037	\N	00040000-56a2-5eb3-7b18-74a65a491a82	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-cb56-cc2a8a4aed74	\N	00040000-56a2-5eb3-7b18-74a65a491a82	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-1d0f-250a080e4920	\N	00040000-56a2-5eb3-7b18-74a65a491a82	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-fdd3-b5e90e0c679a	\N	00040000-56a2-5eb3-a929-01cc90f5269e	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-39fc-4a5571dea998	\N	00040000-56a2-5eb3-90d0-b63cfd28a426	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-c66a-9ea1b144b831	\N	00040000-56a2-5eb3-a871-8e684af7d018	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb6-7e2f-8d42950c5311	\N	00040000-56a2-5eb3-239e-d28bb5ccb6ef	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-56a2-5eb8-e964-47edffc5247a	\N	00040000-56a2-5eb3-7b18-74a65a491a82	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3153 (class 0 OID 39920691)
-- Dependencies: 193
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-56a2-5eb3-1462-07d25de6d76d	8341	Adlešiči
00050000-56a2-5eb3-c0e8-35634e1ae6f2	5270	Ajdovščina
00050000-56a2-5eb3-d4d0-8eb068147bb4	6280	Ankaran/Ancarano
00050000-56a2-5eb3-f51d-9d8cdf9e5e54	9253	Apače
00050000-56a2-5eb3-7346-6fb70777b5f8	8253	Artiče
00050000-56a2-5eb3-6c08-bce8a2695635	4275	Begunje na Gorenjskem
00050000-56a2-5eb3-702d-1fca6947fb36	1382	Begunje pri Cerknici
00050000-56a2-5eb3-711b-8e7cd83f3721	9231	Beltinci
00050000-56a2-5eb3-3a06-024548b4887b	2234	Benedikt
00050000-56a2-5eb3-f08f-89f21c0ffec6	2345	Bistrica ob Dravi
00050000-56a2-5eb3-dd6f-f01f646e408a	3256	Bistrica ob Sotli
00050000-56a2-5eb3-a86a-3fcfd2a4f46d	8259	Bizeljsko
00050000-56a2-5eb3-05e8-1d5f8c669701	1223	Blagovica
00050000-56a2-5eb3-df2e-53793928045d	8283	Blanca
00050000-56a2-5eb3-6a3c-2449eac28924	4260	Bled
00050000-56a2-5eb3-2371-6593c1e4c704	4273	Blejska Dobrava
00050000-56a2-5eb3-301e-9d4626aff3b6	9265	Bodonci
00050000-56a2-5eb3-7049-bb10d81eea53	9222	Bogojina
00050000-56a2-5eb3-46ab-d5bd99bb3327	4263	Bohinjska Bela
00050000-56a2-5eb3-9f11-38ba2dacb0bf	4264	Bohinjska Bistrica
00050000-56a2-5eb3-c625-3c0cd07c3f92	4265	Bohinjsko jezero
00050000-56a2-5eb3-c345-2cacb96feae1	1353	Borovnica
00050000-56a2-5eb3-9c08-b5d0fe4e868b	8294	Boštanj
00050000-56a2-5eb3-3522-2060423804ec	5230	Bovec
00050000-56a2-5eb3-b157-75721cbba734	5295	Branik
00050000-56a2-5eb3-8da8-f3cad9211092	3314	Braslovče
00050000-56a2-5eb3-6341-8b48da07aa2f	5223	Breginj
00050000-56a2-5eb3-4d57-3cdac452fab2	8280	Brestanica
00050000-56a2-5eb3-c816-2e3194dd9bbd	2354	Bresternica
00050000-56a2-5eb3-1dbc-8118102058ac	4243	Brezje
00050000-56a2-5eb3-66ea-913911b4deb4	1351	Brezovica pri Ljubljani
00050000-56a2-5eb3-04cd-84dec2244267	8250	Brežice
00050000-56a2-5eb3-92d1-d2b3d92c5cf8	4210	Brnik - Aerodrom
00050000-56a2-5eb3-a3e5-8e794541ca15	8321	Brusnice
00050000-56a2-5eb3-c472-be070b6ced7c	3255	Buče
00050000-56a2-5eb3-f2e7-92fa594bbf6b	8276	Bučka 
00050000-56a2-5eb3-d96b-b30ad6f2a40e	9261	Cankova
00050000-56a2-5eb3-3e73-6d9cc56fd456	3000	Celje 
00050000-56a2-5eb3-3e1d-f58315db331d	3001	Celje - poštni predali
00050000-56a2-5eb3-193f-b75ff3d68013	4207	Cerklje na Gorenjskem
00050000-56a2-5eb3-2d7c-bd1f2b54e220	8263	Cerklje ob Krki
00050000-56a2-5eb3-09b4-88cbb72b8a51	1380	Cerknica
00050000-56a2-5eb3-80c7-992ed13be7de	5282	Cerkno
00050000-56a2-5eb3-7572-f292a52b4fc4	2236	Cerkvenjak
00050000-56a2-5eb3-908b-c8f299164ae2	2215	Ceršak
00050000-56a2-5eb3-ccd4-498d7d9c613e	2326	Cirkovce
00050000-56a2-5eb3-3d7e-5acaa1396193	2282	Cirkulane
00050000-56a2-5eb3-519e-99d64e4216be	5273	Col
00050000-56a2-5eb3-5ee1-df94a8575668	8251	Čatež ob Savi
00050000-56a2-5eb3-6c97-3d00baa6a7ef	1413	Čemšenik
00050000-56a2-5eb3-aabf-2ccd5f10da0a	5253	Čepovan
00050000-56a2-5eb3-9320-a1ad3a5c858f	9232	Črenšovci
00050000-56a2-5eb3-6969-3a1027077ab3	2393	Črna na Koroškem
00050000-56a2-5eb3-579d-8a6585c3696a	6275	Črni Kal
00050000-56a2-5eb3-0ef9-cb5a502a3f81	5274	Črni Vrh nad Idrijo
00050000-56a2-5eb3-6d78-f89b8b12f302	5262	Črniče
00050000-56a2-5eb3-a59e-f39209af9650	8340	Črnomelj
00050000-56a2-5eb3-6aad-681ae546b0c5	6271	Dekani
00050000-56a2-5eb3-d4b1-3610451e699a	5210	Deskle
00050000-56a2-5eb3-32c9-80e211f3038a	2253	Destrnik
00050000-56a2-5eb3-03af-b16381fd72ed	6215	Divača
00050000-56a2-5eb3-05bd-f6a90a125073	1233	Dob
00050000-56a2-5eb3-0322-69104aa0e447	3224	Dobje pri Planini
00050000-56a2-5eb3-2ce8-b8a0ba1d4771	8257	Dobova
00050000-56a2-5eb3-90d3-53b78b67a4d4	1423	Dobovec
00050000-56a2-5eb3-b951-882da78cd7d6	5263	Dobravlje
00050000-56a2-5eb3-7abb-473be042eaec	3204	Dobrna
00050000-56a2-5eb3-079d-7db0442afb87	8211	Dobrnič
00050000-56a2-5eb3-1169-2f70b48bcd1b	1356	Dobrova
00050000-56a2-5eb3-972a-d880ee34c162	9223	Dobrovnik/Dobronak 
00050000-56a2-5eb3-4d24-b7239a431c9c	5212	Dobrovo v Brdih
00050000-56a2-5eb3-2db4-2b344c44027f	1431	Dol pri Hrastniku
00050000-56a2-5eb3-5bd5-06d384d00be9	1262	Dol pri Ljubljani
00050000-56a2-5eb3-0963-7c11626343e8	1273	Dole pri Litiji
00050000-56a2-5eb3-2cee-5617e620cce0	1331	Dolenja vas
00050000-56a2-5eb3-cea0-874ca2353e1f	8350	Dolenjske Toplice
00050000-56a2-5eb3-83bb-4008ed80e3ec	1230	Domžale
00050000-56a2-5eb3-fd5a-e73a1fe3edb7	2252	Dornava
00050000-56a2-5eb3-61c4-bb8d6e482bdf	5294	Dornberk
00050000-56a2-5eb3-1ec0-9c26707cec7b	1319	Draga
00050000-56a2-5eb3-33ea-fbc5c2fd339e	8343	Dragatuš
00050000-56a2-5eb3-5086-5a35f6ce2ac9	3222	Dramlje
00050000-56a2-5eb3-18a4-2bd41daf48d7	2370	Dravograd
00050000-56a2-5eb3-8362-f1801d0bf688	4203	Duplje
00050000-56a2-5eb3-d77a-d573a0dbb44a	6221	Dutovlje
00050000-56a2-5eb3-e51e-4ccec6f317f2	8361	Dvor
00050000-56a2-5eb3-ad0b-be0d20b44f47	2343	Fala
00050000-56a2-5eb3-7ecb-164b59e3035a	9208	Fokovci
00050000-56a2-5eb3-3e70-ebea5493cb5b	2313	Fram
00050000-56a2-5eb3-5394-a3d1a0507afc	3213	Frankolovo
00050000-56a2-5eb3-09d8-365115dcb763	1274	Gabrovka
00050000-56a2-5eb3-b434-fd20b6f23b69	8254	Globoko
00050000-56a2-5eb3-e32a-80ef7d686a28	5275	Godovič
00050000-56a2-5eb3-d3a3-fa2cbb5152e1	4204	Golnik
00050000-56a2-5eb3-07bc-0e82c109f0d3	3303	Gomilsko
00050000-56a2-5eb3-f329-1e3d1c3a12c9	4224	Gorenja vas
00050000-56a2-5eb3-7f7b-1581d47bfc9b	3263	Gorica pri Slivnici
00050000-56a2-5eb3-f0a5-ed3c13bc7d44	2272	Gorišnica
00050000-56a2-5eb3-a6f3-ebb6f18cb993	9250	Gornja Radgona
00050000-56a2-5eb3-f64c-be2ad7379cb2	3342	Gornji Grad
00050000-56a2-5eb3-e31d-d1dbe552d45e	4282	Gozd Martuljek
00050000-56a2-5eb3-3097-1776b67c792f	6272	Gračišče
00050000-56a2-5eb3-2656-e315e4ee929b	9264	Grad
00050000-56a2-5eb3-c1ce-b37a1fb8dd26	8332	Gradac
00050000-56a2-5eb3-37dc-6e28a23951e8	1384	Grahovo
00050000-56a2-5eb3-7b9c-0abc2574c782	5242	Grahovo ob Bači
00050000-56a2-5eb3-631a-0ff404d4d528	5251	Grgar
00050000-56a2-5eb3-05d7-5d1e4d55b1cd	3302	Griže
00050000-56a2-5eb3-201d-1ca31f9cb5e3	3231	Grobelno
00050000-56a2-5eb3-0698-1a578b8c4892	1290	Grosuplje
00050000-56a2-5eb3-dde1-f13dfdec53b8	2288	Hajdina
00050000-56a2-5eb3-2801-33ad5c54b128	8362	Hinje
00050000-56a2-5eb3-ac5a-c90ae29991a4	2311	Hoče
00050000-56a2-5eb3-163e-225085c22aa2	9205	Hodoš/Hodos
00050000-56a2-5eb3-bca0-8f6830b0171c	1354	Horjul
00050000-56a2-5eb3-fa42-a177f6ee4f34	1372	Hotedršica
00050000-56a2-5eb3-15b2-14b06bd68bdc	1430	Hrastnik
00050000-56a2-5eb3-8aa6-58a7c7c0e0fa	6225	Hruševje
00050000-56a2-5eb3-d7e7-0e26766242ad	4276	Hrušica
00050000-56a2-5eb3-1912-7d9015a87045	5280	Idrija
00050000-56a2-5eb3-f2b9-f99c5d297abf	1292	Ig
00050000-56a2-5eb3-5ab6-39ce144877cc	6250	Ilirska Bistrica
00050000-56a2-5eb3-f973-2d5778a9aa3e	6251	Ilirska Bistrica-Trnovo
00050000-56a2-5eb3-bd58-11954efb395b	1295	Ivančna Gorica
00050000-56a2-5eb3-757f-33c97ff6aa3a	2259	Ivanjkovci
00050000-56a2-5eb3-3b3f-1990a9c07a7f	1411	Izlake
00050000-56a2-5eb3-3237-9a9b2d602e7c	6310	Izola/Isola
00050000-56a2-5eb3-6260-651373283b08	2222	Jakobski Dol
00050000-56a2-5eb3-b61c-bf01588238aa	2221	Jarenina
00050000-56a2-5eb3-d057-f614593c0b7d	6254	Jelšane
00050000-56a2-5eb3-7ff0-be3091283673	4270	Jesenice
00050000-56a2-5eb3-3853-f740aa30db43	8261	Jesenice na Dolenjskem
00050000-56a2-5eb3-7c7d-209c1f004496	3273	Jurklošter
00050000-56a2-5eb3-d4e1-e3d4e91774b4	2223	Jurovski Dol
00050000-56a2-5eb3-9d01-0f769226c5d2	2256	Juršinci
00050000-56a2-5eb3-4e59-d9190fb07732	5214	Kal nad Kanalom
00050000-56a2-5eb3-c827-d6ce060ae7f4	3233	Kalobje
00050000-56a2-5eb3-0972-e54b93ba7a9a	4246	Kamna Gorica
00050000-56a2-5eb3-46f2-890730719590	2351	Kamnica
00050000-56a2-5eb3-2c7a-b9d97705aa71	1241	Kamnik
00050000-56a2-5eb3-b3d0-a7698f285a08	5213	Kanal
00050000-56a2-5eb3-7006-41579cd33c95	8258	Kapele
00050000-56a2-5eb3-19eb-cad1952a55d3	2362	Kapla
00050000-56a2-5eb3-cc5f-5b3485cf9284	2325	Kidričevo
00050000-56a2-5eb3-bbd3-844e17f6957d	1412	Kisovec
00050000-56a2-5eb3-6730-e50cbb722587	6253	Knežak
00050000-56a2-5eb3-f69c-34b8a2e427a1	5222	Kobarid
00050000-56a2-5eb3-7fe2-9bfa7f8e030c	9227	Kobilje
00050000-56a2-5eb3-5611-0a32d2fbc7ff	1330	Kočevje
00050000-56a2-5eb3-96fc-854c649be0c4	1338	Kočevska Reka
00050000-56a2-5eb3-866b-524d9c33674b	2276	Kog
00050000-56a2-5eb3-36f5-d6cade4f65c7	5211	Kojsko
00050000-56a2-5eb3-42e9-fe996a966cc4	6223	Komen
00050000-56a2-5eb3-c3d5-6d0631fdf72e	1218	Komenda
00050000-56a2-5eb3-fae1-68ed9519f8b0	6000	Koper/Capodistria 
00050000-56a2-5eb3-7cca-c218ffd5f530	6001	Koper/Capodistria - poštni predali
00050000-56a2-5eb3-01b2-d27b224105fe	8282	Koprivnica
00050000-56a2-5eb3-b99b-776b0c175387	5296	Kostanjevica na Krasu
00050000-56a2-5eb3-504a-e616b15f9e4f	8311	Kostanjevica na Krki
00050000-56a2-5eb3-c37b-1e708fe04f7d	1336	Kostel
00050000-56a2-5eb3-de0e-e591879b6f40	6256	Košana
00050000-56a2-5eb3-bc4e-d928535a03c3	2394	Kotlje
00050000-56a2-5eb3-e43e-b0a4c260412e	6240	Kozina
00050000-56a2-5eb3-b82d-c10af47520c0	3260	Kozje
00050000-56a2-5eb3-b6c7-e403de68c0f5	4000	Kranj 
00050000-56a2-5eb3-fc8e-32c9e45228c1	4001	Kranj - poštni predali
00050000-56a2-5eb3-d8e3-bbd4705a3fad	4280	Kranjska Gora
00050000-56a2-5eb3-09de-571a13f80ad4	1281	Kresnice
00050000-56a2-5eb3-f503-974c3e7ab770	4294	Križe
00050000-56a2-5eb3-b38e-a5ebfde97e75	9206	Križevci
00050000-56a2-5eb3-5db0-9557b62fbcaa	9242	Križevci pri Ljutomeru
00050000-56a2-5eb3-4f6a-4263a2cd7add	1301	Krka
00050000-56a2-5eb3-036f-656e153230eb	8296	Krmelj
00050000-56a2-5eb3-1b85-ba362dc02b34	4245	Kropa
00050000-56a2-5eb3-b803-d393edaa81c7	8262	Krška vas
00050000-56a2-5eb3-1a23-682086339350	8270	Krško
00050000-56a2-5eb3-39b5-3b63471e125c	9263	Kuzma
00050000-56a2-5eb3-3594-77a3149c6f04	2318	Laporje
00050000-56a2-5eb3-be58-b3c1509ea0e5	3270	Laško
00050000-56a2-5eb3-1d5e-0d29e8d94078	1219	Laze v Tuhinju
00050000-56a2-5eb3-9b90-22e332fd0197	2230	Lenart v Slovenskih goricah
00050000-56a2-5eb3-ab2f-c9d8ddb8aaf8	9220	Lendava/Lendva
00050000-56a2-5eb3-46a3-5a0d68224f83	4248	Lesce
00050000-56a2-5eb3-6232-da72bd8645a4	3261	Lesično
00050000-56a2-5eb3-58eb-c6e37cf5d22d	8273	Leskovec pri Krškem
00050000-56a2-5eb3-408e-ed03a4dcfe74	2372	Libeliče
00050000-56a2-5eb3-8743-c3f3c1ad0eef	2341	Limbuš
00050000-56a2-5eb3-f3b0-1ad19ed93cf3	1270	Litija
00050000-56a2-5eb3-8918-6fae4981a353	3202	Ljubečna
00050000-56a2-5eb3-4897-544551b5557e	1000	Ljubljana 
00050000-56a2-5eb3-a0ed-576f543735b9	1001	Ljubljana - poštni predali
00050000-56a2-5eb3-bc2b-faf9bf235d00	1231	Ljubljana - Črnuče
00050000-56a2-5eb3-d5b6-f7d4b19ac7ba	1261	Ljubljana - Dobrunje
00050000-56a2-5eb3-0ba5-9c9c5309fb7e	1260	Ljubljana - Polje
00050000-56a2-5eb3-1c26-25a5a7ccd924	1210	Ljubljana - Šentvid
00050000-56a2-5eb3-c3c2-8035bb0ae61a	1211	Ljubljana - Šmartno
00050000-56a2-5eb3-8cfa-cf6ecba14003	3333	Ljubno ob Savinji
00050000-56a2-5eb3-65d0-23b8e8d66c8b	9240	Ljutomer
00050000-56a2-5eb3-051a-a6805092b209	3215	Loče
00050000-56a2-5eb3-ef71-168b1ca32a1e	5231	Log pod Mangartom
00050000-56a2-5eb3-0488-95f49cb44645	1358	Log pri Brezovici
00050000-56a2-5eb3-b0b8-3e0d2e9d9f1c	1370	Logatec
00050000-56a2-5eb3-b38a-8c9bdd5d673c	1371	Logatec
00050000-56a2-5eb3-5239-f1ad4bca4dc3	1434	Loka pri Zidanem Mostu
00050000-56a2-5eb3-7928-3bc258a61fe7	3223	Loka pri Žusmu
00050000-56a2-5eb3-b1c5-74e01c628797	6219	Lokev
00050000-56a2-5eb3-1fdb-cfa0484feaf4	1318	Loški Potok
00050000-56a2-5eb3-3e4d-2f18d548fdae	2324	Lovrenc na Dravskem polju
00050000-56a2-5eb3-a538-51e4e9fe82cb	2344	Lovrenc na Pohorju
00050000-56a2-5eb3-929b-732197de00c1	3334	Luče
00050000-56a2-5eb3-dfa1-ec6137a9ada9	1225	Lukovica
00050000-56a2-5eb3-a20b-aa89557fab1d	9202	Mačkovci
00050000-56a2-5eb3-3ebb-033368d1fd41	2322	Majšperk
00050000-56a2-5eb3-5dd7-fda1285a1d59	2321	Makole
00050000-56a2-5eb3-50b7-ecd20b70fcb8	9243	Mala Nedelja
00050000-56a2-5eb3-442d-1c0300552601	2229	Malečnik
00050000-56a2-5eb3-0538-318ef2884cf0	6273	Marezige
00050000-56a2-5eb3-b860-10d3ffba1c27	2000	Maribor 
00050000-56a2-5eb3-d7bb-097983859c37	2001	Maribor - poštni predali
00050000-56a2-5eb3-7d5e-a35c0362604f	2206	Marjeta na Dravskem polju
00050000-56a2-5eb3-a71a-7520329f9855	2281	Markovci
00050000-56a2-5eb3-e3c7-bd8e4358c350	9221	Martjanci
00050000-56a2-5eb3-3532-a9187f073027	6242	Materija
00050000-56a2-5eb3-9ee5-5cfcf0a12dac	4211	Mavčiče
00050000-56a2-5eb3-85c0-fe3f681a858f	1215	Medvode
00050000-56a2-5eb3-8920-dd3a68cec4ab	1234	Mengeš
00050000-56a2-5eb3-3219-21b2ef5f7e56	8330	Metlika
00050000-56a2-5eb3-8cbb-70d1504d5472	2392	Mežica
00050000-56a2-5eb3-209a-f0b5dfd716cb	2204	Miklavž na Dravskem polju
00050000-56a2-5eb3-70da-84fb02fb5764	2275	Miklavž pri Ormožu
00050000-56a2-5eb3-12dd-e023cd78b954	5291	Miren
00050000-56a2-5eb3-3063-a931b486452f	8233	Mirna
00050000-56a2-5eb3-4de1-be8f80d83643	8216	Mirna Peč
00050000-56a2-5eb3-1921-45ead1d82296	2382	Mislinja
00050000-56a2-5eb3-dc35-c27b93a6ca5d	4281	Mojstrana
00050000-56a2-5eb3-1107-ca68baa083e7	8230	Mokronog
00050000-56a2-5eb3-a8f7-dd36a483eb76	1251	Moravče
00050000-56a2-5eb3-9df8-e2fade5c4531	9226	Moravske Toplice
00050000-56a2-5eb3-d3ee-44227494b5af	5216	Most na Soči
00050000-56a2-5eb3-b3da-73db51ae6f93	1221	Motnik
00050000-56a2-5eb3-f0e8-43344d40c6d6	3330	Mozirje
00050000-56a2-5eb3-819f-9fd5cc91ce58	9000	Murska Sobota 
00050000-56a2-5eb3-2aa8-e22694d70bbf	9001	Murska Sobota - poštni predali
00050000-56a2-5eb3-3dcc-bba3ad0e628b	2366	Muta
00050000-56a2-5eb3-4386-b75f014ca180	4202	Naklo
00050000-56a2-5eb3-c10a-0fcde454afde	3331	Nazarje
00050000-56a2-5eb3-ed03-057dd62d1d72	1357	Notranje Gorice
00050000-56a2-5eb3-83b8-50db7339c92a	3203	Nova Cerkev
00050000-56a2-5eb3-2dea-03514a0f2379	5000	Nova Gorica 
00050000-56a2-5eb3-5d0f-1f0c5deb5297	5001	Nova Gorica - poštni predali
00050000-56a2-5eb3-ba5f-dc3092852071	1385	Nova vas
00050000-56a2-5eb3-dd6e-f0560e21a170	8000	Novo mesto
00050000-56a2-5eb3-2d28-37bc9b018c9f	8001	Novo mesto - poštni predali
00050000-56a2-5eb3-9ae0-6d789313de5b	6243	Obrov
00050000-56a2-5eb3-0ef9-336b64eaf028	9233	Odranci
00050000-56a2-5eb3-8dac-43f9c7d190db	2317	Oplotnica
00050000-56a2-5eb3-7edc-280617698d68	2312	Orehova vas
00050000-56a2-5eb3-f198-5697f809ccda	2270	Ormož
00050000-56a2-5eb3-688e-863e42791cd7	1316	Ortnek
00050000-56a2-5eb3-0227-0129dc30d69a	1337	Osilnica
00050000-56a2-5eb3-091d-cda106b99a3f	8222	Otočec
00050000-56a2-5eb3-197c-24aabf35c1a2	2361	Ožbalt
00050000-56a2-5eb3-f11b-86f7e0c9fc55	2231	Pernica
00050000-56a2-5eb3-5cf1-45ec15e519eb	2211	Pesnica pri Mariboru
00050000-56a2-5eb3-74c2-d6799936a29e	9203	Petrovci
00050000-56a2-5eb3-01da-2701007df95f	3301	Petrovče
00050000-56a2-5eb3-8e40-00a248f4a76a	6330	Piran/Pirano
00050000-56a2-5eb3-3395-10440183271f	8255	Pišece
00050000-56a2-5eb3-e368-2312e917c67e	6257	Pivka
00050000-56a2-5eb3-e921-196206a30612	6232	Planina
00050000-56a2-5eb3-e3f0-9cf9f010f45a	3225	Planina pri Sevnici
00050000-56a2-5eb3-67bb-16efa818e1df	6276	Pobegi
00050000-56a2-5eb3-0eed-6753f8a4fc74	8312	Podbočje
00050000-56a2-5eb3-bb5b-bf6d05af79b6	5243	Podbrdo
00050000-56a2-5eb3-f394-aec4be4e9e63	3254	Podčetrtek
00050000-56a2-5eb3-d74a-8f2e7d2df7ed	2273	Podgorci
00050000-56a2-5eb3-2899-a914e64c3907	6216	Podgorje
00050000-56a2-5eb3-1939-4018f8def869	2381	Podgorje pri Slovenj Gradcu
00050000-56a2-5eb3-c8b8-4243514595c1	6244	Podgrad
00050000-56a2-5eb3-ee04-fcf40eeee6f9	1414	Podkum
00050000-56a2-5eb3-c17d-d5c372828351	2286	Podlehnik
00050000-56a2-5eb3-d3cc-f8f795b1f9af	5272	Podnanos
00050000-56a2-5eb3-0ce3-305fd5682387	4244	Podnart
00050000-56a2-5eb3-57fd-00a87e07195f	3241	Podplat
00050000-56a2-5eb3-df8c-f3a3bcb16e19	3257	Podsreda
00050000-56a2-5eb3-d913-b84ff0937825	2363	Podvelka
00050000-56a2-5eb3-e3e6-3093e21b48d0	2208	Pohorje
00050000-56a2-5eb3-86e0-1440f8fe2441	2257	Polenšak
00050000-56a2-5eb3-9dab-ded956b5f192	1355	Polhov Gradec
00050000-56a2-5eb3-f0f8-6fa9f4a2496e	4223	Poljane nad Škofjo Loko
00050000-56a2-5eb3-1d19-37a7770b89cb	2319	Poljčane
00050000-56a2-5eb3-5ced-59bfeb07ee1f	1272	Polšnik
00050000-56a2-5eb3-5ece-965ebd2e44f9	3313	Polzela
00050000-56a2-5eb3-bd5f-b0214f7868fb	3232	Ponikva
00050000-56a2-5eb3-15f3-2d937035b52a	6320	Portorož/Portorose
00050000-56a2-5eb3-22ca-ace2181a178c	6230	Postojna
00050000-56a2-5eb3-c643-9e7f4af88700	2331	Pragersko
00050000-56a2-5eb3-6749-4b6a6f2b6032	3312	Prebold
00050000-56a2-5eb3-d127-1916f0892e02	4205	Preddvor
00050000-56a2-5eb3-f346-21f9c28a4cf8	6255	Prem
00050000-56a2-5eb3-05d4-acfbee318f8d	1352	Preserje
00050000-56a2-5eb3-b10f-e6822187123d	6258	Prestranek
00050000-56a2-5eb3-90f7-8fbb90519cce	2391	Prevalje
00050000-56a2-5eb3-80cf-c2d9452a3978	3262	Prevorje
00050000-56a2-5eb3-860e-bf9098f4d5d9	1276	Primskovo 
00050000-56a2-5eb3-6aea-0c76f006610a	3253	Pristava pri Mestinju
00050000-56a2-5eb3-258c-edf2297a8d78	9207	Prosenjakovci/Partosfalva
00050000-56a2-5eb3-ae3b-2a6a9353d08e	5297	Prvačina
00050000-56a2-5eb3-d398-a8b7b586d4c4	2250	Ptuj
00050000-56a2-5eb3-b3c6-519cbe335c7e	2323	Ptujska Gora
00050000-56a2-5eb3-9287-644fa5eef772	9201	Puconci
00050000-56a2-5eb3-f6ca-0210071d5549	2327	Rače
00050000-56a2-5eb3-44d6-4ab0f00d6bcd	1433	Radeče
00050000-56a2-5eb3-2654-67df9db6b558	9252	Radenci
00050000-56a2-5eb3-4697-7e0d9e97a351	2360	Radlje ob Dravi
00050000-56a2-5eb3-4761-54e125bbd459	1235	Radomlje
00050000-56a2-5eb3-c4c3-7283978d588a	4240	Radovljica
00050000-56a2-5eb3-3200-565f834b2d06	8274	Raka
00050000-56a2-5eb3-c4e9-6b9267bfb00d	1381	Rakek
00050000-56a2-5eb3-c477-ad9fb4b6eb6f	4283	Rateče - Planica
00050000-56a2-5eb3-f7fd-ae3ffdda1c93	2390	Ravne na Koroškem
00050000-56a2-5eb3-8e9a-6e7073109175	9246	Razkrižje
00050000-56a2-5eb3-0776-63e7de37619b	3332	Rečica ob Savinji
00050000-56a2-5eb3-b4fb-9654e43aab03	5292	Renče
00050000-56a2-5eb3-1aba-e4d02afc6675	1310	Ribnica
00050000-56a2-5eb3-6221-18537f624120	2364	Ribnica na Pohorju
00050000-56a2-5eb3-779c-ba4d81b8024f	3272	Rimske Toplice
00050000-56a2-5eb3-ccf4-d4cf3e731d31	1314	Rob
00050000-56a2-5eb3-4d6f-5f63e35bb303	5215	Ročinj
00050000-56a2-5eb3-e9ec-8b275d2e7857	3250	Rogaška Slatina
00050000-56a2-5eb3-8300-269b5f8324a6	9262	Rogašovci
00050000-56a2-5eb3-4bcc-842410b5ce2b	3252	Rogatec
00050000-56a2-5eb3-d85e-953b987b9976	1373	Rovte
00050000-56a2-5eb3-d63a-e298cbaf2b4d	2342	Ruše
00050000-56a2-5eb3-16cc-08743b81bdfa	1282	Sava
00050000-56a2-5eb3-3a46-4ea55bff39a3	6333	Sečovlje/Sicciole
00050000-56a2-5eb3-f738-4e63ee2cbaab	4227	Selca
00050000-56a2-5eb3-fdd1-cba3d0d4dbbf	2352	Selnica ob Dravi
00050000-56a2-5eb3-1977-9962bf494174	8333	Semič
00050000-56a2-5eb3-f7de-94b9d90dc6ae	8281	Senovo
00050000-56a2-5eb3-3bb6-80473627feea	6224	Senožeče
00050000-56a2-5eb3-5626-cc61b6e5caa5	8290	Sevnica
00050000-56a2-5eb3-0af6-4954cda1f4db	6210	Sežana
00050000-56a2-5eb3-9887-75429cc9b225	2214	Sladki Vrh
00050000-56a2-5eb3-130d-39dd553039f6	5283	Slap ob Idrijci
00050000-56a2-5eb3-4402-b7e44d0d13ed	2380	Slovenj Gradec
00050000-56a2-5eb3-d7be-6c46ffbb9321	2310	Slovenska Bistrica
00050000-56a2-5eb3-4f65-989663a6706c	3210	Slovenske Konjice
00050000-56a2-5eb3-0f13-ecc241ff4cfd	1216	Smlednik
00050000-56a2-5eb3-a9e2-81add37181b5	5232	Soča
00050000-56a2-5eb3-05a4-ed03f58a8745	1317	Sodražica
00050000-56a2-5eb3-1531-6ba743b38eae	3335	Solčava
00050000-56a2-5eb3-b024-fd2e515ed21e	5250	Solkan
00050000-56a2-5eb3-9b63-3609f9b05faf	4229	Sorica
00050000-56a2-5eb3-beea-316126c73fee	4225	Sovodenj
00050000-56a2-5eb3-243d-0587dd44fd32	5281	Spodnja Idrija
00050000-56a2-5eb3-22d4-05a569e6e96f	2241	Spodnji Duplek
00050000-56a2-5eb3-ed39-655592f4e75b	9245	Spodnji Ivanjci
00050000-56a2-5eb3-3450-c5d6cc55c555	2277	Središče ob Dravi
00050000-56a2-5eb3-57b9-a91c18c10498	4267	Srednja vas v Bohinju
00050000-56a2-5eb3-0d8f-c143150002ea	8256	Sromlje 
00050000-56a2-5eb3-cf74-c4af5628560b	5224	Srpenica
00050000-56a2-5eb3-b981-88a48ca62261	1242	Stahovica
00050000-56a2-5eb3-9602-323707d27e8c	1332	Stara Cerkev
00050000-56a2-5eb3-fd2f-a40569031ec7	8342	Stari trg ob Kolpi
00050000-56a2-5eb3-3ca4-de3762373da9	1386	Stari trg pri Ložu
00050000-56a2-5eb3-43b4-6a083a181dc2	2205	Starše
00050000-56a2-5eb3-37f4-d7523dc121d7	2289	Stoperce
00050000-56a2-5eb3-220f-2974be7cc1c1	8322	Stopiče
00050000-56a2-5eb3-90a6-6163ad5b46af	3206	Stranice
00050000-56a2-5eb3-72e1-eb76e2a34e44	8351	Straža
00050000-56a2-5eb3-87fc-3fbe277592c5	1313	Struge
00050000-56a2-5eb3-d886-a802e5e3fdc2	8293	Studenec
00050000-56a2-5eb3-d62c-180ad5209d17	8331	Suhor
00050000-56a2-5eb3-e072-3eacaf2a0692	2233	Sv. Ana v Slovenskih goricah
00050000-56a2-5eb3-8d2e-73eafd058233	2235	Sv. Trojica v Slovenskih goricah
00050000-56a2-5eb3-59f6-a2b57827cb56	2353	Sveti Duh na Ostrem Vrhu
00050000-56a2-5eb3-363a-09ed38c0f2f3	9244	Sveti Jurij ob Ščavnici
00050000-56a2-5eb3-d90a-548946b5eaab	3264	Sveti Štefan
00050000-56a2-5eb3-1b6c-5aa9790ac967	2258	Sveti Tomaž
00050000-56a2-5eb3-c710-ba9bcee7b5c9	9204	Šalovci
00050000-56a2-5eb3-180b-e4f6336b88f0	5261	Šempas
00050000-56a2-5eb3-3d7c-60d2abfbc62d	5290	Šempeter pri Gorici
00050000-56a2-5eb3-1812-425021908f90	3311	Šempeter v Savinjski dolini
00050000-56a2-5eb3-7730-25b4c6d880f2	4208	Šenčur
00050000-56a2-5eb3-665b-48a1de18bca0	2212	Šentilj v Slovenskih goricah
00050000-56a2-5eb3-35cb-44c3f5013f8d	8297	Šentjanž
00050000-56a2-5eb3-c357-5579c7d5d310	2373	Šentjanž pri Dravogradu
00050000-56a2-5eb3-82a3-27a9423a0b78	8310	Šentjernej
00050000-56a2-5eb3-29e6-871d44d35f6e	3230	Šentjur
00050000-56a2-5eb3-f73b-8e7cc1e18c27	3271	Šentrupert
00050000-56a2-5eb3-b0f2-452cab09579c	8232	Šentrupert
00050000-56a2-5eb3-2b18-a25907bc0c9e	1296	Šentvid pri Stični
00050000-56a2-5eb3-01ab-8b359eebb2b2	8275	Škocjan
00050000-56a2-5eb3-08d0-88edba3aef45	6281	Škofije
00050000-56a2-5eb3-4f05-1665ca4c4bae	4220	Škofja Loka
00050000-56a2-5eb3-16d6-3e85ca5a8b3c	3211	Škofja vas
00050000-56a2-5eb3-4315-ef3f62e2e1de	1291	Škofljica
00050000-56a2-5eb3-5e02-79b1363c759f	6274	Šmarje
00050000-56a2-5eb3-0b45-0b86a0373408	1293	Šmarje - Sap
00050000-56a2-5eb3-9a8b-a0e13e1e8b27	3240	Šmarje pri Jelšah
00050000-56a2-5eb3-2d6b-2698b6ba7e44	8220	Šmarješke Toplice
00050000-56a2-5eb3-78c7-9cba7811a788	2315	Šmartno na Pohorju
00050000-56a2-5eb3-e299-24861a02f6ed	3341	Šmartno ob Dreti
00050000-56a2-5eb3-cf4f-bfb9cbe408ee	3327	Šmartno ob Paki
00050000-56a2-5eb3-b6cc-78f71636cf00	1275	Šmartno pri Litiji
00050000-56a2-5eb3-78a8-46a43374a8f7	2383	Šmartno pri Slovenj Gradcu
00050000-56a2-5eb3-f5ee-8029310f3d39	3201	Šmartno v Rožni dolini
00050000-56a2-5eb3-4134-8fefed2de70e	3325	Šoštanj
00050000-56a2-5eb3-8186-72ff0ba4b054	6222	Štanjel
00050000-56a2-5eb3-7ce8-09832dc83640	3220	Štore
00050000-56a2-5eb3-dc2f-d9a924d22105	3304	Tabor
00050000-56a2-5eb3-169a-b94863584115	3221	Teharje
00050000-56a2-5eb3-2053-6a8244e158e3	9251	Tišina
00050000-56a2-5eb3-12df-07df35a0125f	5220	Tolmin
00050000-56a2-5eb3-d4e1-827b1cd75732	3326	Topolšica
00050000-56a2-5eb3-7521-ad84e677a25b	2371	Trbonje
00050000-56a2-5eb3-e9ce-aa11b093faba	1420	Trbovlje
00050000-56a2-5eb3-7a95-d21e988634cf	8231	Trebelno 
00050000-56a2-5eb3-0505-00bc7f86d870	8210	Trebnje
00050000-56a2-5eb3-274c-f01fe502b551	5252	Trnovo pri Gorici
00050000-56a2-5eb3-537f-8b9f97d6731f	2254	Trnovska vas
00050000-56a2-5eb3-b0d5-b8531d0f1d5e	1222	Trojane
00050000-56a2-5eb3-1464-198b898a5bf7	1236	Trzin
00050000-56a2-5eb3-83b5-ad0a272ea0a7	4290	Tržič
00050000-56a2-5eb3-5a0f-175b68bddcb4	8295	Tržišče
00050000-56a2-5eb3-a45f-b7f5f38ab974	1311	Turjak
00050000-56a2-5eb3-f8e8-7ea45dcd523b	9224	Turnišče
00050000-56a2-5eb3-d7fd-437674e80100	8323	Uršna sela
00050000-56a2-5eb3-c139-a205e6274cf2	1252	Vače
00050000-56a2-5eb3-392d-75d9bed48d55	3320	Velenje 
00050000-56a2-5eb3-597e-4bb4a717ef0d	3322	Velenje - poštni predali
00050000-56a2-5eb3-4846-39effd256010	8212	Velika Loka
00050000-56a2-5eb3-2bc0-fbd424243ce7	2274	Velika Nedelja
00050000-56a2-5eb3-c034-1a4abe20af31	9225	Velika Polana
00050000-56a2-5eb3-ef60-dc760683a277	1315	Velike Lašče
00050000-56a2-5eb3-c75d-6990b1cd5cca	8213	Veliki Gaber
00050000-56a2-5eb3-2b1a-078f396f1514	9241	Veržej
00050000-56a2-5eb3-bf65-44a90714baef	1312	Videm - Dobrepolje
00050000-56a2-5eb3-0b7c-c0b75a945243	2284	Videm pri Ptuju
00050000-56a2-5eb3-3410-af002a366ec8	8344	Vinica
00050000-56a2-5eb3-4fb4-fef8276f238f	5271	Vipava
00050000-56a2-5eb3-d634-53d7d0830aba	4212	Visoko
00050000-56a2-5eb3-8321-c202b905810a	1294	Višnja Gora
00050000-56a2-5eb3-9fa8-893864915ba6	3205	Vitanje
00050000-56a2-5eb3-b81e-a972eaf5ea2e	2255	Vitomarci
00050000-56a2-5eb3-0d9d-83ecf5b68256	1217	Vodice
00050000-56a2-5eb3-4c04-cc1fac72376c	3212	Vojnik\t
00050000-56a2-5eb3-e0b5-4ac7e9299e97	5293	Volčja Draga
00050000-56a2-5eb3-f007-650fa2dc3e6f	2232	Voličina
00050000-56a2-5eb3-b976-ec61c6721446	3305	Vransko
00050000-56a2-5eb3-3e91-467edeafa727	6217	Vremski Britof
00050000-56a2-5eb3-d9c5-c0b3b9daf39d	1360	Vrhnika
00050000-56a2-5eb3-cc8c-7254bd124cfd	2365	Vuhred
00050000-56a2-5eb3-e1a2-4de77c3f6c88	2367	Vuzenica
00050000-56a2-5eb3-478e-75d6719180a5	8292	Zabukovje 
00050000-56a2-5eb3-3d81-fcaa21aa953f	1410	Zagorje ob Savi
00050000-56a2-5eb3-49be-36bfc45937f4	1303	Zagradec
00050000-56a2-5eb3-1c7f-adc2baa93c16	2283	Zavrč
00050000-56a2-5eb3-3247-fab54a010f86	8272	Zdole 
00050000-56a2-5eb3-7a51-56cd79a6c4a1	4201	Zgornja Besnica
00050000-56a2-5eb3-01d3-e537d6494b6b	2242	Zgornja Korena
00050000-56a2-5eb3-823b-d5548b92f549	2201	Zgornja Kungota
00050000-56a2-5eb3-549a-4267940d8c1e	2316	Zgornja Ložnica
00050000-56a2-5eb3-2035-21d65aed7441	2314	Zgornja Polskava
00050000-56a2-5eb3-e72e-37e6390111eb	2213	Zgornja Velka
00050000-56a2-5eb3-c801-bd7f091c376f	4247	Zgornje Gorje
00050000-56a2-5eb3-5eea-7bb0d3581722	4206	Zgornje Jezersko
00050000-56a2-5eb3-f8a8-f2b201a4355e	2285	Zgornji Leskovec
00050000-56a2-5eb3-61d2-3e513d6f1a83	1432	Zidani Most
00050000-56a2-5eb3-0788-221bc32a4113	3214	Zreče
00050000-56a2-5eb3-631e-56b4957f6c3a	4209	Žabnica
00050000-56a2-5eb3-5462-39fd22615283	3310	Žalec
00050000-56a2-5eb3-c0b6-3fc78f10d597	4228	Železniki
00050000-56a2-5eb3-ecf8-0af86159134f	2287	Žetale
00050000-56a2-5eb3-203f-aaea372a7dd5	4226	Žiri
00050000-56a2-5eb3-4ea7-76a2f4758fff	4274	Žirovnica
00050000-56a2-5eb3-9749-ad901c48ed85	8360	Žužemberk
\.


--
-- TOC entry 3204 (class 0 OID 39921366)
-- Dependencies: 244
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 39920936)
-- Dependencies: 217
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 39920676)
-- Dependencies: 192
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-56a2-5eb6-c871-9382abcb895f	00080000-56a2-5eb6-575a-ff5ab5ae245b	\N	00040000-56a2-5eb3-7b18-74a65a491a82	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-56a2-5eb6-8a0f-1eb6bb3ece1c	00080000-56a2-5eb6-575a-ff5ab5ae245b	\N	00040000-56a2-5eb3-7b18-74a65a491a82	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-56a2-5eb6-3dcc-800e92573108	00080000-56a2-5eb6-8702-6b4610e784ab	\N	00040000-56a2-5eb3-7b18-74a65a491a82	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3164 (class 0 OID 39920812)
-- Dependencies: 204
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-56a2-5eb3-b070-de7d52af4b4f	novo leto	1	1	\N	t
00430000-56a2-5eb3-e47f-b30e26855602	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-56a2-5eb3-ae77-9bff266aa103	dan upora proti okupatorju	27	4	\N	t
00430000-56a2-5eb3-a72b-88c5523b4fe5	praznik dela	1	5	\N	t
00430000-56a2-5eb3-0b3e-136f914244c3	praznik dela	2	5	\N	t
00430000-56a2-5eb3-288c-6bf1ca7cdbcc	dan Primoža Trubarja	8	6	\N	f
00430000-56a2-5eb3-94f5-acd1c42f2ace	dan državnosti	25	6	\N	t
00430000-56a2-5eb3-d205-d37429415f49	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-56a2-5eb3-d001-46005614f922	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-56a2-5eb3-0584-197b1430c33b	dan suverenosti	25	10	\N	f
00430000-56a2-5eb3-e8ae-c257761974e6	dan spomina na mrtve	1	11	\N	t
00430000-56a2-5eb3-a844-79ecae9091d4	dan Rudolfa Maistra	23	11	\N	f
00430000-56a2-5eb3-df0a-54ca0e2144da	božič	25	12	\N	t
00430000-56a2-5eb3-ae34-4d1c90eb79a2	dan samostojnosti in enotnosti	26	12	\N	t
00430000-56a2-5eb3-2afa-a5f1da575865	Marijino vnebovzetje	15	8	\N	t
00430000-56a2-5eb3-e74d-07f3974b0e58	dan reformacije	31	10	\N	t
00430000-56a2-5eb3-f2fb-d25f0e4d18f7	velikonočna nedelja	27	3	2016	t
00430000-56a2-5eb3-fa9a-be51dfd6431f	velikonočna nedelja	16	4	2017	t
00430000-56a2-5eb3-bb38-a9c6aa6b5eba	velikonočna nedelja	1	4	2018	t
00430000-56a2-5eb3-ff3b-bbda38cf81a4	velikonočna nedelja	21	4	2019	t
00430000-56a2-5eb3-1c32-22eb24eedabf	velikonočna nedelja	12	4	2020	t
00430000-56a2-5eb3-72f9-3789b9cd4a29	velikonočna nedelja	4	4	2021	t
00430000-56a2-5eb3-98ca-a4d3fa58b91f	velikonočna nedelja	17	4	2022	t
00430000-56a2-5eb3-0e38-aa92a2985af6	velikonočna nedelja	9	4	2023	t
00430000-56a2-5eb3-8daf-c498acb581ed	velikonočna nedelja	31	3	2024	t
00430000-56a2-5eb3-9432-861ed834161b	velikonočna nedelja	20	4	2025	t
00430000-56a2-5eb3-bb32-7c178a298c15	velikonočna nedelja	5	4	2026	t
00430000-56a2-5eb3-bc00-e181265bb205	velikonočna nedelja	28	3	2027	t
00430000-56a2-5eb3-c0e1-339090f6092b	velikonočna nedelja	16	4	2028	t
00430000-56a2-5eb3-c888-96f9169876ec	velikonočna nedelja	1	4	2029	t
00430000-56a2-5eb3-5c64-dcef31822f52	velikonočna nedelja	21	4	2030	t
00430000-56a2-5eb3-71b4-667f79aab0cb	velikonočni ponedeljek	28	3	2016	t
00430000-56a2-5eb3-5793-e39d9e0897da	velikonočni ponedeljek	17	4	2017	t
00430000-56a2-5eb3-ea34-6ef5f3679ac9	velikonočni ponedeljek	2	4	2018	t
00430000-56a2-5eb3-cee8-8fb0a505f14e	velikonočni ponedeljek	22	4	2019	t
00430000-56a2-5eb3-fbc5-9bd8ed970121	velikonočni ponedeljek	13	4	2020	t
00430000-56a2-5eb3-f9ba-8dce327711ea	velikonočni ponedeljek	5	4	2021	t
00430000-56a2-5eb3-48d2-940b74dd4266	velikonočni ponedeljek	18	4	2022	t
00430000-56a2-5eb3-b086-3537418a1e9f	velikonočni ponedeljek	10	4	2023	t
00430000-56a2-5eb3-42f9-78b8dc7e593f	velikonočni ponedeljek	1	4	2024	t
00430000-56a2-5eb3-5640-5d59a513a720	velikonočni ponedeljek	21	4	2025	t
00430000-56a2-5eb3-ca00-7b9cea2cc683	velikonočni ponedeljek	6	4	2026	t
00430000-56a2-5eb3-ea6a-39cfd13f82d1	velikonočni ponedeljek	29	3	2027	t
00430000-56a2-5eb3-9fe4-7245e4ca2dcf	velikonočni ponedeljek	17	4	2028	t
00430000-56a2-5eb4-d631-76a9d538337e	velikonočni ponedeljek	2	4	2029	t
00430000-56a2-5eb4-08f6-9adf9e68ec2d	velikonočni ponedeljek	22	4	2030	t
00430000-56a2-5eb4-0823-9f9baf28c9ec	binkoštna nedelja - binkošti	15	5	2016	t
00430000-56a2-5eb4-802c-229ef6dc4951	binkoštna nedelja - binkošti	4	6	2017	t
00430000-56a2-5eb4-f40e-44bcc47bff98	binkoštna nedelja - binkošti	20	5	2018	t
00430000-56a2-5eb4-5983-4d755f3d4748	binkoštna nedelja - binkošti	9	6	2019	t
00430000-56a2-5eb4-0274-77ef72109a42	binkoštna nedelja - binkošti	31	5	2020	t
00430000-56a2-5eb4-212e-f310ea274c59	binkoštna nedelja - binkošti	23	5	2021	t
00430000-56a2-5eb4-314d-70d55989b174	binkoštna nedelja - binkošti	5	6	2022	t
00430000-56a2-5eb4-96f2-6d24f21e08fb	binkoštna nedelja - binkošti	28	5	2023	t
00430000-56a2-5eb4-5bee-4c5732a6cf9a	binkoštna nedelja - binkošti	19	5	2024	t
00430000-56a2-5eb4-a16c-7e967df80138	binkoštna nedelja - binkošti	8	6	2025	t
00430000-56a2-5eb4-bfa7-c97f4e607087	binkoštna nedelja - binkošti	24	5	2026	t
00430000-56a2-5eb4-73cf-55d09554a62c	binkoštna nedelja - binkošti	16	5	2027	t
00430000-56a2-5eb4-3907-982911ef5e92	binkoštna nedelja - binkošti	4	6	2028	t
00430000-56a2-5eb4-b6d5-09aecb831d29	binkoštna nedelja - binkošti	20	5	2029	t
00430000-56a2-5eb4-549a-77db604d709f	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3160 (class 0 OID 39920780)
-- Dependencies: 200
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, zaporednasez) FROM stdin;
001b0000-56a2-5eb7-b031-284fa84c564a	000e0000-56a2-5eb6-016b-f1e609b4a7d0	\N	1	\N
001b0000-56a2-5eb7-b5c5-e7e80d598bf5	000e0000-56a2-5eb6-016b-f1e609b4a7d0	\N	2	\N
001b0000-56a2-5eb7-cd35-d2234250c999	000e0000-56a2-5eb6-016b-f1e609b4a7d0	\N	3	\N
\.


--
-- TOC entry 3161 (class 0 OID 39920787)
-- Dependencies: 201
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
001b0000-56a2-5eb7-b031-284fa84c564a	000a0000-56a2-5eb6-dfc9-b3061bcf8a17
001b0000-56a2-5eb7-b031-284fa84c564a	000a0000-56a2-5eb6-547a-5c103d5ed3c9
001b0000-56a2-5eb7-b5c5-e7e80d598bf5	000a0000-56a2-5eb6-547a-5c103d5ed3c9
001b0000-56a2-5eb7-b5c5-e7e80d598bf5	000a0000-56a2-5eb6-9bff-542943ad1705
\.


--
-- TOC entry 3131 (class 0 OID 36291776)
-- Dependencies: 171
-- Data for Name: prisotnost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prisotnost (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3179 (class 0 OID 39920948)
-- Dependencies: 219
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id) FROM stdin;
\.


--
-- TOC entry 3205 (class 0 OID 39921380)
-- Dependencies: 245
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3206 (class 0 OID 39921390)
-- Dependencies: 246
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-56a2-5eb6-5d6b-06e67137a09c	00080000-56a2-5eb6-de01-3d676ef27037	0987	AK
00190000-56a2-5eb6-242d-ffa0a9ce3004	00080000-56a2-5eb6-8702-6b4610e784ab	0989	AK
00190000-56a2-5eb6-c20a-369fd04e8c32	00080000-56a2-5eb6-cb56-cc2a8a4aed74	0986	AK
00190000-56a2-5eb6-6f7d-66fd75e62524	00080000-56a2-5eb6-fdd3-b5e90e0c679a	0984	AK
00190000-56a2-5eb6-ae44-2d2f762f4d50	00080000-56a2-5eb6-39fc-4a5571dea998	0983	AK
00190000-56a2-5eb6-ca1d-8978a49ccb8a	00080000-56a2-5eb6-c66a-9ea1b144b831	0982	AK
00190000-56a2-5eb8-3cdb-6a70cfeac072	00080000-56a2-5eb8-e964-47edffc5247a	1001	AK
\.


--
-- TOC entry 3203 (class 0 OID 39921279)
-- Dependencies: 243
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-56a2-5eb7-2bdc-7f299eca489c	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3207 (class 0 OID 39921398)
-- Dependencies: 247
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 39920976)
-- Dependencies: 223
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis, barva) FROM stdin;
00220000-56a2-5eb6-becc-1cc1df86fccd	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem	\N
00220000-56a2-5eb6-edd3-718f4f0e3afb	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem	\N
00220000-56a2-5eb6-6155-ea1b4385fa19	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana	\N
00220000-56a2-5eb6-c775-608a7363dc45	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 	\N
00220000-56a2-5eb6-3b15-cf48d2ff20ff	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder	\N
00220000-56a2-5eb6-6f73-c2fc7ff9c23d	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna	\N
00220000-56a2-5eb6-a29d-cb7e1ef0d57a	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana	\N
\.


--
-- TOC entry 3175 (class 0 OID 39920921)
-- Dependencies: 215
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 39920911)
-- Dependencies: 214
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3196 (class 0 OID 39921118)
-- Dependencies: 236
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3190 (class 0 OID 39921048)
-- Dependencies: 230
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3158 (class 0 OID 39920754)
-- Dependencies: 198
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 39920515)
-- Dependencies: 177
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-56a2-5eb8-e964-47edffc5247a	00010000-56a2-5eb4-5d4d-18da811350a0	2016-01-22 17:54:16	INS	a:0:{}
2	App\\Entity\\Option	00000000-56a2-5eb8-d8b0-f9d22fada22d	00010000-56a2-5eb4-5d4d-18da811350a0	2016-01-22 17:54:16	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-56a2-5eb8-3cdb-6a70cfeac072	00010000-56a2-5eb4-5d4d-18da811350a0	2016-01-22 17:54:16	INS	a:0:{}
\.


--
-- TOC entry 3228 (class 0 OID 0)
-- Dependencies: 176
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3184 (class 0 OID 39920990)
-- Dependencies: 224
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 39920553)
-- Dependencies: 181
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-56a2-5eb4-7809-a38bbab5b80b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-56a2-5eb4-387f-ba87335117a3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-56a2-5eb4-0451-0ecba729d1e1	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-56a2-5eb4-3b1d-d9980e51f461	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-56a2-5eb4-ade9-0eca50b4f0ea	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-56a2-5eb4-e4ee-2a9ffec8a148	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-56a2-5eb4-5d38-358707f69f53	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-56a2-5eb4-50d4-6fdf6f09ded5	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-56a2-5eb4-0537-4c565bedbe83	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a2-5eb4-6de9-cbad0a2324cd	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a2-5eb4-ca22-4a651a21d01b	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a2-5eb4-4796-662db004f4a3	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-56a2-5eb4-56a3-67c604c8797c	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a2-5eb4-3168-2cb615360d1b	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-56a2-5eb4-77ac-5a9dfa6d2f23	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a2-5eb4-3bc9-de416255c073	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-56a2-5eb4-2e46-cd12ccda7c88	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-56a2-5eb4-6ea6-7132a55e376e	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-56a2-5eb4-46f6-270e410b6064	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-56a2-5eb4-127c-8d8ab800f540	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-56a2-5eb4-a07c-a8cb9bffead0	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a2-5eb4-cd9a-5687ff3b32e3	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-56a2-5eb4-03fb-097b29efca46	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a2-5eb4-2128-3e3c62229ae8	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-56a2-5eb4-a86f-32b6ed829cae	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-56a2-5eb4-ba0a-a86a38e1252a	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-56a2-5eb4-4b07-d113a2b66fbb	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-56a2-5eb4-2685-48d0650db0c9	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-56a2-5eb4-855f-fb9fe05283e7	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-56a2-5eb4-5468-db7d841d0c41	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-56a2-5eb4-61d5-93234d360428	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-56a2-5eb4-69b6-12a6d3ec2ba4	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-56a2-5eb4-c970-bf720aeffc41	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-56a2-5eb4-9376-0b6637b2094e	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-56a2-5eb4-4a8a-de60f6705b56	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-56a2-5eb4-c0a6-80a031789fec	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-56a2-5eb4-adfe-30f535814778	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-56a2-5eb4-943b-d44eb438fd51	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-56a2-5eb4-0484-fc8b40de58da	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-56a2-5eb4-3417-34d6df248186	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-56a2-5eb4-35fe-5bbeafc4eb50	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-56a2-5eb4-2901-6d9ac56e79c5	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-56a2-5eb4-9d4c-3acad3fff068	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a2-5eb4-ca72-f8901cff2597	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-56a2-5eb4-0eac-267aee1b72e4	direktor	minimalne pravice za direktorja	t
00020000-56a2-5eb4-e47e-770b0d8a1609	arhivar	arhivar	t
00020000-56a2-5eb4-7556-50b447974f77	dramaturg	dramaturg	t
00020000-56a2-5eb4-ab25-b3ad1699ee20	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-56a2-5eb4-8041-79d5d1fccab9	poslovni-sekretar	poslovni sekretar	t
00020000-56a2-5eb4-c6cf-c3f436eb26bd	vodja-tehnike	vodja tehnike	t
00020000-56a2-5eb4-775e-a9d11e7b16f2	racunovodja	računovodja	t
00020000-56a2-5eb6-5121-1f32b7657e0f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-56a2-5eb6-5685-2c314bc997b0	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-ed84-9f7a600abead	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-d61d-0b3148011e62	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-8012-0ed5bce10a30	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-5cb7-e0f2ca52acfa	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-781a-6517203e23c6	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-1064-5cdf2133f8ce	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-df6b-693be2f38234	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-6304-531df6f1795b	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-a6ff-0215194a170e	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-e4d1-24b62789865d	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-661b-b92e2e9a7388	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-5a36-f4c6bc9ba8b7	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-41ce-ee15980b090c	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-b060-c20b4c33b940	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-fe74-49c3d8d013d0	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-88d1-3a9cd2c7b244	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-9d26-a10b288b35e6	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-c835-408e200ea941	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-56a2-5eb6-9c7b-923b4cb7e4c6	Trr-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-4cbf-f7ef6328dfd7	Trr-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-758c-762544b34ba8	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-4593-f0659a79ffde	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-e470-397a6e9164f9	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-336c-eca48bf6ee05	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-8249-554e5659d796	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-97c8-1e178642a0cc	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-2fa8-b5dc430882f8	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-dd86-9ce2170c2fd5	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-4d79-aa4373480280	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-1ea5-332bb7a3f1fb	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-1371-2e951dd3f6c6	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-5ffc-1c80e103c49d	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-3dc9-235e7933094f	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-47fa-df0ff9fe253f	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-b209-8256758421d1	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-aa55-c4c8d946e6e3	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-56a2-5eb6-3d91-0a0d53b2708a	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3139 (class 0 OID 39920537)
-- Dependencies: 179
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-56a2-5eb4-f739-ab5525127f33	00020000-56a2-5eb4-0451-0ecba729d1e1
00010000-56a2-5eb4-5d4d-18da811350a0	00020000-56a2-5eb4-0451-0ecba729d1e1
00010000-56a2-5eb6-7fa0-bb7148a74830	00020000-56a2-5eb6-5121-1f32b7657e0f
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-5685-2c314bc997b0
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-5cb7-e0f2ca52acfa
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-6304-531df6f1795b
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-e4d1-24b62789865d
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-5a36-f4c6bc9ba8b7
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-9d26-a10b288b35e6
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-d61d-0b3148011e62
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-9c7b-923b4cb7e4c6
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-4593-f0659a79ffde
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-336c-eca48bf6ee05
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-97c8-1e178642a0cc
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-dd86-9ce2170c2fd5
00010000-56a2-5eb6-5358-e0ac21ac8e2b	00020000-56a2-5eb6-5ffc-1c80e103c49d
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-5685-2c314bc997b0
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-ed84-9f7a600abead
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-d61d-0b3148011e62
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-8012-0ed5bce10a30
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-5a36-f4c6bc9ba8b7
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-fe74-49c3d8d013d0
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-9c7b-923b4cb7e4c6
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-4593-f0659a79ffde
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-336c-eca48bf6ee05
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-97c8-1e178642a0cc
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-dd86-9ce2170c2fd5
00010000-56a2-5eb6-391f-634b5f0ad2ab	00020000-56a2-5eb6-5ffc-1c80e103c49d
00010000-56a2-5eb6-7529-0de6078ba5f7	00020000-56a2-5eb6-5685-2c314bc997b0
00010000-56a2-5eb6-7529-0de6078ba5f7	00020000-56a2-5eb6-ed84-9f7a600abead
00010000-56a2-5eb6-7529-0de6078ba5f7	00020000-56a2-5eb6-d61d-0b3148011e62
00010000-56a2-5eb6-7529-0de6078ba5f7	00020000-56a2-5eb6-8012-0ed5bce10a30
00010000-56a2-5eb6-7529-0de6078ba5f7	00020000-56a2-5eb6-e4d1-24b62789865d
00010000-56a2-5eb6-7529-0de6078ba5f7	00020000-56a2-5eb6-5a36-f4c6bc9ba8b7
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-ed84-9f7a600abead
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-781a-6517203e23c6
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-a6ff-0215194a170e
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-661b-b92e2e9a7388
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-e4d1-24b62789865d
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-88d1-3a9cd2c7b244
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-5a36-f4c6bc9ba8b7
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-41ce-ee15980b090c
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-9c7b-923b4cb7e4c6
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-4cbf-f7ef6328dfd7
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-4593-f0659a79ffde
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-e470-397a6e9164f9
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-336c-eca48bf6ee05
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-8249-554e5659d796
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-97c8-1e178642a0cc
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-2fa8-b5dc430882f8
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-dd86-9ce2170c2fd5
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-4d79-aa4373480280
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-5ffc-1c80e103c49d
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-3dc9-235e7933094f
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-b209-8256758421d1
00010000-56a2-5eb6-ed80-ec8c86814994	00020000-56a2-5eb6-aa55-c4c8d946e6e3
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-ed84-9f7a600abead
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-781a-6517203e23c6
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-df6b-693be2f38234
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-a6ff-0215194a170e
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-661b-b92e2e9a7388
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-e4d1-24b62789865d
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-88d1-3a9cd2c7b244
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-5a36-f4c6bc9ba8b7
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-41ce-ee15980b090c
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-b060-c20b4c33b940
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-9c7b-923b4cb7e4c6
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-4cbf-f7ef6328dfd7
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-758c-762544b34ba8
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-4593-f0659a79ffde
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-e470-397a6e9164f9
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-336c-eca48bf6ee05
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-8249-554e5659d796
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-97c8-1e178642a0cc
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-2fa8-b5dc430882f8
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-dd86-9ce2170c2fd5
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-4d79-aa4373480280
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-5ffc-1c80e103c49d
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-3dc9-235e7933094f
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-47fa-df0ff9fe253f
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-b209-8256758421d1
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-aa55-c4c8d946e6e3
00010000-56a2-5eb6-e664-059fe8592a76	00020000-56a2-5eb6-3d91-0a0d53b2708a
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-ed84-9f7a600abead
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-d61d-0b3148011e62
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-781a-6517203e23c6
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-1064-5cdf2133f8ce
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-df6b-693be2f38234
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-5cb7-e0f2ca52acfa
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-a6ff-0215194a170e
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-661b-b92e2e9a7388
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-e4d1-24b62789865d
00010000-56a2-5eb6-cfac-316fbb9b7971	00020000-56a2-5eb6-88d1-3a9cd2c7b244
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-5685-2c314bc997b0
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-8012-0ed5bce10a30
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-5cb7-e0f2ca52acfa
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-6304-531df6f1795b
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-e4d1-24b62789865d
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-5a36-f4c6bc9ba8b7
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-9d26-a10b288b35e6
00010000-56a2-5eb6-5390-e335fa29507f	00020000-56a2-5eb6-1ea5-332bb7a3f1fb
00010000-56a2-5eb6-300d-f43617ea1120	00020000-56a2-5eb6-c835-408e200ea941
00010000-56a2-5eb6-2f99-142308b494df	00020000-56a2-5eb4-0eac-267aee1b72e4
00010000-56a2-5eb6-0f0d-cec6808d7652	00020000-56a2-5eb4-e47e-770b0d8a1609
00010000-56a2-5eb6-d80c-c4b0e0106841	00020000-56a2-5eb4-7556-50b447974f77
00010000-56a2-5eb6-92a2-6124e683aab6	00020000-56a2-5eb4-ab25-b3ad1699ee20
00010000-56a2-5eb6-15bd-e54049604d49	00020000-56a2-5eb4-8041-79d5d1fccab9
00010000-56a2-5eb6-cca6-396cbf1e0a83	00020000-56a2-5eb4-c6cf-c3f436eb26bd
00010000-56a2-5eb6-a7e1-c3a9bee6b2a8	00020000-56a2-5eb4-775e-a9d11e7b16f2
\.


--
-- TOC entry 3186 (class 0 OID 39921004)
-- Dependencies: 226
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3178 (class 0 OID 39920942)
-- Dependencies: 218
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 39920865)
-- Dependencies: 209
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec) FROM stdin;
001f0000-56a2-5eb6-b3d0-63f1586d318b	2014	Sezona 2014	2014-01-01	2014-12-31
001f0000-56a2-5eb6-e9ae-26e6b1ed208c	2015	Sezona 2015	2015-01-01	2015-12-31
001f0000-56a2-5eb6-ed33-87422f2464df	2016	Sezona 2016	2016-01-01	2016-12-31
001f0000-56a2-5eb6-b339-c23454e01bd4	2017	Sezona 2017	2017-01-01	2017-12-31
\.


--
-- TOC entry 3135 (class 0 OID 39920502)
-- Dependencies: 175
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-56a2-5eb3-6703-0a9417afa0b9	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-56a2-5eb3-7105-c74595179268	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-56a2-5eb3-f324-6a68dfee3727	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-56a2-5eb3-8256-eb7877a67881	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-56a2-5eb3-ed9e-e8e02e83b1c7	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3134 (class 0 OID 39920494)
-- Dependencies: 174
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-56a2-5eb3-74ca-5cfda2d5dfdd	00230000-56a2-5eb3-8256-eb7877a67881	popa
00240000-56a2-5eb3-c9a8-dbdaac8413de	00230000-56a2-5eb3-8256-eb7877a67881	oseba
00240000-56a2-5eb3-f8b3-a64381146f7f	00230000-56a2-5eb3-8256-eb7877a67881	tippopa
00240000-56a2-5eb3-cc65-8deab497131c	00230000-56a2-5eb3-8256-eb7877a67881	organizacijskaenota
00240000-56a2-5eb3-75da-b805ccbe871c	00230000-56a2-5eb3-8256-eb7877a67881	sezona
00240000-56a2-5eb3-a9c8-e4f517e10476	00230000-56a2-5eb3-8256-eb7877a67881	tipvaje
00240000-56a2-5eb3-331d-473ecb4bb301	00230000-56a2-5eb3-8256-eb7877a67881	tipdodatka
00240000-56a2-5eb3-0b58-0ef7e981bb92	00230000-56a2-5eb3-7105-c74595179268	prostor
00240000-56a2-5eb3-2d02-246fd2f933ee	00230000-56a2-5eb3-8256-eb7877a67881	besedilo
00240000-56a2-5eb3-143c-61e205900368	00230000-56a2-5eb3-8256-eb7877a67881	uprizoritev
00240000-56a2-5eb3-1cf4-712d4a81c75f	00230000-56a2-5eb3-8256-eb7877a67881	funkcija
00240000-56a2-5eb3-3c75-24acbe56c79f	00230000-56a2-5eb3-8256-eb7877a67881	tipfunkcije
00240000-56a2-5eb3-c605-1ad1ce78cc9c	00230000-56a2-5eb3-8256-eb7877a67881	alternacija
00240000-56a2-5eb3-afef-7fe9e867c08d	00230000-56a2-5eb3-6703-0a9417afa0b9	pogodba
00240000-56a2-5eb3-abbc-087682e9fa30	00230000-56a2-5eb3-8256-eb7877a67881	zaposlitev
00240000-56a2-5eb3-3124-472bdcba401a	00230000-56a2-5eb3-8256-eb7877a67881	zvrstuprizoritve
00240000-56a2-5eb3-96ff-cda3c7f67248	00230000-56a2-5eb3-6703-0a9417afa0b9	programdela
00240000-56a2-5eb3-7fd0-1844587dbbc8	00230000-56a2-5eb3-8256-eb7877a67881	zapis
\.


--
-- TOC entry 3133 (class 0 OID 39920489)
-- Dependencies: 173
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
bb7b6208-4b56-4d11-b222-c398a2a0a2e8	00240000-56a2-5eb3-74ca-5cfda2d5dfdd	0	1001
\.


--
-- TOC entry 3192 (class 0 OID 39921065)
-- Dependencies: 232
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-56a2-5eb7-8f98-0cc99369a467	000e0000-56a2-5eb6-016b-f1e609b4a7d0	00080000-56a2-5eb6-575a-ff5ab5ae245b	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-56a2-5eb3-b7f9-d47085e8b5f9
00270000-56a2-5eb7-84ed-e7cc348de16a	000e0000-56a2-5eb6-016b-f1e609b4a7d0	00080000-56a2-5eb6-575a-ff5ab5ae245b	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-56a2-5eb3-b7f9-d47085e8b5f9
\.


--
-- TOC entry 3149 (class 0 OID 39920638)
-- Dependencies: 189
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 39920884)
-- Dependencies: 211
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, deltaplaniranzacetek, planiranzacetek, deltaplanirankonec, planirankonec, dezurni, gost, sodelujoc, zasedenost, virtzasedenost) FROM stdin;
001a0000-56a2-5eb7-c5e1-019ecdfbd23b	00180000-56a2-5eb7-0854-ddb6635d7f2a	000c0000-56a2-5eb7-2782-ef156d82f2fe	00090000-56a2-5eb6-4abf-e796080cdea5	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a2-5eb7-89fb-9ca3b48ab10b	00180000-56a2-5eb7-0854-ddb6635d7f2a	000c0000-56a2-5eb7-26d6-1592a0b8c3e6	00090000-56a2-5eb6-0d63-ed891867074e	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a2-5eb7-0a8e-e2b865756d07	00180000-56a2-5eb7-0854-ddb6635d7f2a	000c0000-56a2-5eb7-d1c4-ba5d795d02d7	00090000-56a2-5eb6-c069-600a8e3a9381	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a2-5eb7-2f63-ccea0ec133bb	00180000-56a2-5eb7-0854-ddb6635d7f2a	000c0000-56a2-5eb7-93d8-ad50a2bb3600	00090000-56a2-5eb6-54e9-c59ab924c6dd	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a2-5eb7-709e-976cd11ed674	00180000-56a2-5eb7-0854-ddb6635d7f2a	000c0000-56a2-5eb7-8ecb-afa3d5bf66cb	00090000-56a2-5eb6-42de-2ffb8f14f760	1630080	2015-06-26 10:00:00	-60	2015-06-26 11:00:00	f	f	\N	\N	\N
001a0000-56a2-5eb7-945e-23e5fbf09122	00180000-56a2-5eb7-0cb5-de7dbbbdcb80	\N	00090000-56a2-5eb6-42de-2ffb8f14f760	645120	2015-08-01 20:00:00	645150	2015-08-01 23:30:00	t	f	\N	\N	\N
001a0000-56a2-5eb7-3a2c-5b915c44f53b	00180000-56a2-5eb7-6aaf-df18f0c8724a	\N	00090000-56a2-5eb6-0d63-ed891867074e	1576800	2015-08-01 20:00:00	30	2015-08-01 23:30:00	f	t	\N	\N	\N
001a0000-56a2-5eb7-a1e0-2d116bedbe36	00180000-56a2-5eb7-0854-ddb6635d7f2a	\N	00090000-56a2-5eb6-9a8f-f178b2828a7a	1682520	2015-08-01 20:00:00	52530	2015-08-01 23:30:00	f	t	\N	\N	\N
\.


--
-- TOC entry 3173 (class 0 OID 39920901)
-- Dependencies: 213
-- Data for Name: tipdodatka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipdodatka (id, sifra, ime, opis) FROM stdin;
00460000-56a2-5eb3-9114-564871d0160c	0001	Višina 20%	Dodatek za delo na višini 2-4 m -39.člen /12.
00460000-56a2-5eb3-62c0-b2b4dc9b5a93	0002	Višina 30%	Dodatek za delo na višini 4-20 m -39.člen /12.
00460000-56a2-5eb3-8fca-dcf10e4e52b7	0003	izmensko delo	dodatek za izmensko delo 40. člen
00460000-56a2-5eb3-439f-4ead937fb950	0004	d.č. 13%	dodatek za delo v deljenem delovnem času - 41. člen
00460000-56a2-5eb3-6de1-eee21401eec0	0005	d.č. 10%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen: za manj kot 4 dni v tednu ali za več kot 5 dni v tednu
00460000-56a2-5eb3-7a1b-943d7e2ddfec	0006	d.č. 20%	dodatek za delo v neenakomerno razporejenem delovnem času -42. člen za dve ali več prekinitvi za najmanj 1 uro ali za delo po posebnem razporedu
\.


--
-- TOC entry 3195 (class 0 OID 39921106)
-- Dependencies: 235
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-56a2-5eb3-e941-121412540c95	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-56a2-5eb3-6820-dc40e14c628d	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-56a2-5eb3-a8d1-4d67580822b2	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-56a2-5eb3-b353-2c4544f35a33	04	Režija	Režija	Režija	umetnik	30
000f0000-56a2-5eb3-02b4-ce7368baac71	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-56a2-5eb3-2dbb-0e3a50612323	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-56a2-5eb3-8327-d26c0ddf671b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-56a2-5eb3-41eb-49485b957880	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-56a2-5eb3-90a7-ab3da535430e	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-56a2-5eb3-8cd1-61d5a0a755cb	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-56a2-5eb3-a8d4-ef72bf2a2f19	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-56a2-5eb3-70de-233e408c2f3a	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-56a2-5eb3-f1ab-708bdef0eef6	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-56a2-5eb3-bcba-c147727a35ee	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-56a2-5eb3-6e81-30f260eda157	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-56a2-5eb3-6cdf-f0ef354ea8a9	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-56a2-5eb3-4b46-c5602de6570c	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-56a2-5eb3-8ec7-214763b6101b	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
000f0000-56a2-5eb3-4796-574239b93b3e	19	Šepetalec	Šepetalci	Šepetalka	sepetalec	190
\.


--
-- TOC entry 3146 (class 0 OID 39920589)
-- Dependencies: 186
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-56a2-5eb6-eff0-2ab8f8cf5a2f	0001	šola	osnovna ali srednja šola
00400000-56a2-5eb6-a474-a51f5fb90bb9	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-56a2-5eb6-b595-f320eb107530	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3208 (class 0 OID 39921410)
-- Dependencies: 248
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-56a2-5eb3-d08f-52a9b1be16af	01	Velika predstava	f	1.00	1.00
002b0000-56a2-5eb3-d948-f39c6763d942	02	Mala predstava	f	0.50	0.50
002b0000-56a2-5eb3-5277-7c53d744e5ca	03	Mala koprodukcija	t	0.40	1.00
002b0000-56a2-5eb3-448c-9ff24b34bd3e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-56a2-5eb3-b17c-cbec63ad6c37	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3168 (class 0 OID 39920855)
-- Dependencies: 208
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-56a2-5eb3-15b7-9557cb3f9396	0001	prva vaja	prva vaja
00420000-56a2-5eb3-9f15-ea5e088c20f2	0002	tehnična vaja	tehnična vaja
00420000-56a2-5eb3-d460-5c2f0728a71f	0003	lučna vaja	lučna vaja
00420000-56a2-5eb3-e21a-f2731684000c	0004	kostumska vaja	kostumska vaja
00420000-56a2-5eb3-46a8-dad87e7d26cd	0005	foto vaja	foto vaja
00420000-56a2-5eb3-1ced-9ca149b6d7b6	0006	1. glavna vaja	1. glavna vaja
00420000-56a2-5eb3-98a1-abf970d3e561	0007	2. glavna vaja	2. glavna vaja
00420000-56a2-5eb3-3114-6fcc7a41b075	0008	1. generalka	1. generalka
00420000-56a2-5eb3-1bfd-5ac6e6bf6907	0009	2. generalka	2. generalka
00420000-56a2-5eb3-d26e-3335f52f1350	0010	odprta generalka	odprta generalka
00420000-56a2-5eb3-59ac-9f13cee223a1	0011	obnovitvena vaja	obnovitvena vaja
00420000-56a2-5eb3-5c13-a72dcdf81808	0012	italijanka	krajša "obnovitvena" vaja
00420000-56a2-5eb3-78cd-5500c204b0d3	0013	pevska vaja	pevska vaja
00420000-56a2-5eb3-2478-99109c3274ee	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-56a2-5eb3-438f-9921935dc135	0015	postavitev luči	postavitev luči (za pripravo vaje)
00420000-56a2-5eb3-bc4e-3b48df53f31b	0016	orientacijska vaja	orientacijska vaja
00420000-56a2-5eb3-aadc-0b78c364c1dc	0017	situacijska vaja	situacijska vaja
00420000-56a2-5eb3-5db2-f382b216fca4	0018	tonska vaja	tonska vaja
\.


--
-- TOC entry 3155 (class 0 OID 39920711)
-- Dependencies: 195
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 39920524)
-- Dependencies: 178
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-56a2-5eb4-5d4d-18da811350a0	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROPv8qW6cqLSlHRaIM5sTAnkngg7qB0.u	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-c389-18659f8edd0e	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-38f7-f8a17124e84f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-ea29-7ad97d864e86	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-8a99-c2a08d7e508b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-5711-693195aa5bb8	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-031d-c28c6b3e624e	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-f5a6-cd970df8c204	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-db48-44850ff7b2bc	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-24e5-abddd906a5d1	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-7fa0-bb7148a74830	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-c0c8-4bf7d52c350f	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-5358-e0ac21ac8e2b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-391f-634b5f0ad2ab	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-7529-0de6078ba5f7	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-ed80-ec8c86814994	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-e664-059fe8592a76	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-cfac-316fbb9b7971	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-5390-e335fa29507f	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-300d-f43617ea1120	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-2f99-142308b494df	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-0f0d-cec6808d7652	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-d80c-c4b0e0106841	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-92a2-6124e683aab6	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-15bd-e54049604d49	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-cca6-396cbf1e0a83	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-56a2-5eb6-a7e1-c3a9bee6b2a8	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-56a2-5eb4-f739-ab5525127f33	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3199 (class 0 OID 39921156)
-- Dependencies: 239
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-56a2-5eb6-477e-f3b758c87513	00160000-56a2-5eb6-0a69-151265088529	\N	00140000-56a2-5eb3-a8d6-5f8fda4f526f	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-56a2-5eb6-3b15-cf48d2ff20ff
000e0000-56a2-5eb6-016b-f1e609b4a7d0	00160000-56a2-5eb6-ea94-3876b67f7cd8	\N	00140000-56a2-5eb3-8a39-dfec87bbf8eb	\N	0002	produkcija	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-56a2-5eb6-6f73-c2fc7ff9c23d
000e0000-56a2-5eb6-bd45-d6da55876662	\N	\N	00140000-56a2-5eb3-8a39-dfec87bbf8eb	00190000-56a2-5eb6-5d6b-06e67137a09c	0003	predprodukcija-ideja	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a2-5eb6-3b15-cf48d2ff20ff
000e0000-56a2-5eb6-ebb9-b50bbc07cc8f	\N	\N	00140000-56a2-5eb3-8a39-dfec87bbf8eb	00190000-56a2-5eb6-5d6b-06e67137a09c	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-56a2-5eb6-3b15-cf48d2ff20ff
000e0000-56a2-5eb6-f577-4b11f9e1faa1	\N	\N	00140000-56a2-5eb3-8a39-dfec87bbf8eb	00190000-56a2-5eb6-5d6b-06e67137a09c	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-f908-b44280d04e64	\N	\N	00140000-56a2-5eb3-8a39-dfec87bbf8eb	00190000-56a2-5eb6-5d6b-06e67137a09c	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-da81-fda93c9b0c6d	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0011	postprodukcija	U11_EP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-5455-3b578d0aec66	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0012	postprodukcija	U12_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-0c39-61fe5586084c	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0013	postprodukcija	U13_DP_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-232b-d292a17d57a1	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0014	postprodukcija	U14_DD_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-3086-d7d2ff2b9943	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0015	postprodukcija	U15_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-fb1f-56fdfc1499ad	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0016	postprodukcija	U16_EE_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-861e-4240e141f204	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0017	postprodukcija	U17_EP_ED_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-4f7f-a320777792d6	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0018	postprodukcija	U18_EP_ED_NT_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
000e0000-56a2-5eb6-ddf6-b598a20810ac	\N	\N	00140000-56a2-5eb3-51a8-4e703b9b4561	\N	0019	postprodukcija	U19_ED_ZAS_PROST_test_vzporednic			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-56a2-5eb6-becc-1cc1df86fccd
\.


--
-- TOC entry 3170 (class 0 OID 39920875)
-- Dependencies: 210
-- Data for Name: ura; Type: TABLE DATA; Schema: public; Owner: -
--

COPY ura (id, oseba_id, zacetek, konec, terminstoritve_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 39920805)
-- Dependencies: 203
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna) FROM stdin;
00200000-56a2-5eb6-c146-0c7b67767ea2	\N	000e0000-56a2-5eb6-016b-f1e609b4a7d0	1
00200000-56a2-5eb6-c46d-780354eb208e	\N	000e0000-56a2-5eb6-016b-f1e609b4a7d0	2
00200000-56a2-5eb6-3dc1-47ce0eb93ecb	\N	000e0000-56a2-5eb6-016b-f1e609b4a7d0	3
00200000-56a2-5eb6-5363-2c56350851c6	\N	000e0000-56a2-5eb6-016b-f1e609b4a7d0	4
00200000-56a2-5eb6-e188-330c2b6c92d9	\N	000e0000-56a2-5eb6-016b-f1e609b4a7d0	5
\.


--
-- TOC entry 3182 (class 0 OID 39920968)
-- Dependencies: 222
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3193 (class 0 OID 39921079)
-- Dependencies: 233
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-56a2-5eb3-c86c-2d04d8a0f936	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-56a2-5eb3-e518-9eb1c76cd576	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-56a2-5eb3-b834-5fbfbdbfca51	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-56a2-5eb3-f961-cd2d147eb3dc	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-56a2-5eb3-fada-72f61acacc85	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-56a2-5eb3-3ac2-4253c09eb3d1	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-56a2-5eb3-ac7e-f4c78f2374e5	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-56a2-5eb3-f32e-810f1e76dd41	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-56a2-5eb3-b7f9-d47085e8b5f9	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-56a2-5eb3-e77a-e45da5272bae	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-56a2-5eb3-12dc-0ff07245af7c	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-56a2-5eb3-deb2-4d00050ed8f8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-56a2-5eb3-a173-45af3c98fe25	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-56a2-5eb3-af04-4801350c1840	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-56a2-5eb3-96e7-5bcc17c832bb	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-56a2-5eb3-7915-7a47a212bd11	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-56a2-5eb3-18e2-13c1ba16a1b9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-56a2-5eb3-01ee-11d5d61bd0a9	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-56a2-5eb3-270e-305e009391aa	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-56a2-5eb3-ada4-f79f6f4792de	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-56a2-5eb3-b85e-ccedb2ab4678	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-56a2-5eb3-a45b-118be0dd1699	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-56a2-5eb3-e1eb-3e5001f560b5	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-56a2-5eb3-309e-ed558ac66738	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-56a2-5eb3-45a7-774302f5edc6	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-56a2-5eb3-7760-2049e2d3f13e	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-56a2-5eb3-5029-712f3a676ae5	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-56a2-5eb3-5d5f-d7507c9224d2	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3211 (class 0 OID 39921460)
-- Dependencies: 251
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3210 (class 0 OID 39921429)
-- Dependencies: 250
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3212 (class 0 OID 39921472)
-- Dependencies: 252
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3189 (class 0 OID 39921041)
-- Dependencies: 229
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, delovnaobveza, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-56a2-5eb6-fe1a-9818c9d7bea6	00090000-56a2-5eb6-0d63-ed891867074e	0010	A	Mojster	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a2-5eb6-2974-025895015fef	00090000-56a2-5eb6-c069-600a8e3a9381	0003	A	Igralec	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a2-5eb6-bf92-1c2d9dcfe54a	00090000-56a2-5eb6-7d8d-860f02cb1e0e	0008	A	Natakar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a2-5eb6-582a-1563e6ec56e7	00090000-56a2-5eb6-ad14-5a1d91038fd3	0004	A	Mizar	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a2-5eb6-ff90-f6f64945a410	00090000-56a2-5eb6-8333-55c9f7889ae5	0009	A	Šivilja	2010-02-01	\N	2	t	f	f	t	\N
00100000-56a2-5eb6-945d-8affcd8a477b	00090000-56a2-5eb6-7d77-ab87919b2b67	0007	A	Inšpicient	2010-02-01	\N	2	t	f	f	t	\N
\.


--
-- TOC entry 3132 (class 0 OID 37017863)
-- Dependencies: 172
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3198 (class 0 OID 39921146)
-- Dependencies: 238
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-56a2-5eb3-a8d6-5f8fda4f526f	01	Drama	drama (SURS 01)
00140000-56a2-5eb3-2293-21649656cd28	02	Opera	opera (SURS 02)
00140000-56a2-5eb3-0d86-4667d8da5994	03	Balet	balet (SURS 03)
00140000-56a2-5eb3-48cd-3ce88489c77d	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-56a2-5eb3-51a8-4e703b9b4561	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-56a2-5eb3-8a39-dfec87bbf8eb	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-56a2-5eb3-1e6c-4d2d7d071fdd	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3188 (class 0 OID 39921031)
-- Dependencies: 228
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2622 (class 2606 OID 39920588)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2846 (class 2606 OID 39921204)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 39921195)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2620 (class 2606 OID 39920578)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 39921062)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 39921104)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2903 (class 2606 OID 39921513)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 39920898)
-- Name: dodatek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT dodatek_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 39920834)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 39920849)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 39920854)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 39921427)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 2606 OID 39920737)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 39921273)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 39921027)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 39920803)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 39920775)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 39920751)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2755 (class 2606 OID 39920934)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2897 (class 2606 OID 39921490)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 39921497)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2908 (class 2606 OID 39921521)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 34548313)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2766 (class 2606 OID 39920960)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 39920709)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2630 (class 2606 OID 39920607)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2649 (class 2606 OID 39920671)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 39920634)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 39920567)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2611 (class 2606 OID 39920552)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 39920966)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 39921003)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2829 (class 2606 OID 39921141)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2643 (class 2606 OID 39920662)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 39920697)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2863 (class 2606 OID 39921378)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2759 (class 2606 OID 39920940)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 39920687)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 39920819)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2692 (class 2606 OID 39920791)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2688 (class 2606 OID 39920784)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 36291782)
-- Name: prisotnost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prisotnost
    ADD CONSTRAINT prisotnost_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 39920952)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 39921387)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2869 (class 2606 OID 39921395)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 39921365)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 39921408)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 39920985)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2753 (class 2606 OID 39920925)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2747 (class 2606 OID 39920916)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 39921128)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 39921055)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2678 (class 2606 OID 39920763)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 39920523)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 39920994)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 39920541)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2613 (class 2606 OID 39920561)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 39921012)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 39920947)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2723 (class 2606 OID 39920873)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2600 (class 2606 OID 39920511)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 39920499)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2594 (class 2606 OID 39920493)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2813 (class 2606 OID 39921075)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 39920643)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 39920890)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 39920908)
-- Name: tipdodatka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipdodatka
    ADD CONSTRAINT tipdodatka_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 39921115)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 39920596)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2876 (class 2606 OID 39921420)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 39920862)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2665 (class 2606 OID 39920722)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 39920536)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 39921174)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 39920881)
-- Name: ura_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT ura_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 39920809)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 39920974)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2815 (class 2606 OID 39921087)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2890 (class 2606 OID 39921470)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2887 (class 2606 OID 39921454)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 39921478)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2800 (class 2606 OID 39921045)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 37017867)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 39921154)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2796 (class 2606 OID 39921039)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 1259 OID 39920843)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2705 (class 1259 OID 39920844)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2706 (class 1259 OID 39920842)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2707 (class 1259 OID 39920841)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2708 (class 1259 OID 39920840)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2809 (class 1259 OID 39921076)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2810 (class 1259 OID 39921077)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 39921078)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2894 (class 1259 OID 39921492)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2895 (class 1259 OID 39921491)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2640 (class 1259 OID 39920664)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2641 (class 1259 OID 39920665)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2767 (class 1259 OID 39920967)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2881 (class 1259 OID 39921458)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2882 (class 1259 OID 39921457)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2883 (class 1259 OID 39921459)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2884 (class 1259 OID 39921456)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2885 (class 1259 OID 39921455)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2762 (class 1259 OID 39920953)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2696 (class 1259 OID 39920810)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2697 (class 1259 OID 39920811)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2791 (class 1259 OID 39921028)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2792 (class 1259 OID 39921030)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2793 (class 1259 OID 39921029)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2672 (class 1259 OID 39920753)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2673 (class 1259 OID 39920752)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2872 (class 1259 OID 39921409)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2825 (class 1259 OID 39921143)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2826 (class 1259 OID 39921144)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2827 (class 1259 OID 39921145)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2891 (class 1259 OID 39921479)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2834 (class 1259 OID 39921179)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2835 (class 1259 OID 39921176)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2836 (class 1259 OID 39921180)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2837 (class 1259 OID 39921178)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2838 (class 1259 OID 39921177)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2662 (class 1259 OID 39920724)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2663 (class 1259 OID 39920723)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2631 (class 1259 OID 39920637)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2779 (class 1259 OID 39920995)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2615 (class 1259 OID 39920568)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2616 (class 1259 OID 39920569)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2784 (class 1259 OID 39921015)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2785 (class 1259 OID 39921014)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2786 (class 1259 OID 39921013)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2645 (class 1259 OID 39920674)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2646 (class 1259 OID 39920673)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2647 (class 1259 OID 39920675)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2685 (class 1259 OID 39920785)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2686 (class 1259 OID 39920786)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2595 (class 1259 OID 39920501)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2742 (class 1259 OID 39920920)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2743 (class 1259 OID 39920918)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2744 (class 1259 OID 39920917)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2745 (class 1259 OID 39920919)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2606 (class 1259 OID 39920542)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 39920543)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2770 (class 1259 OID 39920975)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2904 (class 1259 OID 39921514)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2807 (class 1259 OID 39921064)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2808 (class 1259 OID 39921063)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2905 (class 1259 OID 39921522)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2906 (class 1259 OID 39921523)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2757 (class 1259 OID 39920941)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2801 (class 1259 OID 39921056)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2802 (class 1259 OID 39921057)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2854 (class 1259 OID 39921278)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2855 (class 1259 OID 39921277)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2856 (class 1259 OID 39921274)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2857 (class 1259 OID 39921275)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2858 (class 1259 OID 39921276)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2651 (class 1259 OID 39920689)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 39920688)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2653 (class 1259 OID 39920690)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2773 (class 1259 OID 39920989)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2774 (class 1259 OID 39920988)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2864 (class 1259 OID 39921388)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2865 (class 1259 OID 39921389)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2847 (class 1259 OID 39921208)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2848 (class 1259 OID 39921209)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2849 (class 1259 OID 39921206)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2850 (class 1259 OID 39921207)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2586 (class 1259 OID 36291783)
-- Name: idx_a8171cf610389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a8171cf610389148 ON prisotnost USING btree (oseba_id);


--
-- TOC entry 2736 (class 1259 OID 39920899)
-- Name: idx_aab095ce73a5023a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce73a5023a ON dodatek USING btree (ura_id);


--
-- TOC entry 2737 (class 1259 OID 39920900)
-- Name: idx_aab095ce789dd25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aab095ce789dd25a ON dodatek USING btree (tipdodatka_id);


--
-- TOC entry 2797 (class 1259 OID 39921046)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2798 (class 1259 OID 39921047)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2725 (class 1259 OID 39920882)
-- Name: idx_b28a7ff310389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b28a7ff310389148 ON ura USING btree (oseba_id);


--
-- TOC entry 2748 (class 1259 OID 39920929)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2749 (class 1259 OID 39920928)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2750 (class 1259 OID 39920926)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2751 (class 1259 OID 39920927)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2844 (class 1259 OID 39921196)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2676 (class 1259 OID 39920764)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2679 (class 1259 OID 39920778)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2680 (class 1259 OID 39920777)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2681 (class 1259 OID 39920776)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2682 (class 1259 OID 39920779)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2695 (class 1259 OID 39920804)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2689 (class 1259 OID 39920792)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2690 (class 1259 OID 39920793)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2861 (class 1259 OID 39921379)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2880 (class 1259 OID 39921428)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2898 (class 1259 OID 39921498)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2899 (class 1259 OID 39921499)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2627 (class 1259 OID 39920609)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2628 (class 1259 OID 39920608)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2636 (class 1259 OID 39920644)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2637 (class 1259 OID 39920645)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2590 (class 1259 OID 37017868)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2729 (class 1259 OID 39920893)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2730 (class 1259 OID 39920892)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2731 (class 1259 OID 39920891)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2709 (class 1259 OID 39920836)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2710 (class 1259 OID 39920839)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2711 (class 1259 OID 39920835)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2712 (class 1259 OID 39920838)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2713 (class 1259 OID 39920837)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2644 (class 1259 OID 39920663)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2625 (class 1259 OID 39920597)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2626 (class 1259 OID 39920598)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2668 (class 1259 OID 39920738)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2669 (class 1259 OID 39920740)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2670 (class 1259 OID 39920739)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2671 (class 1259 OID 39920741)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2756 (class 1259 OID 39920935)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2830 (class 1259 OID 39921142)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2839 (class 1259 OID 39921175)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2821 (class 1259 OID 39921116)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2822 (class 1259 OID 39921117)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 39920635)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 39920636)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2740 (class 1259 OID 39920909)
-- Name: uniq_466f660b559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b559828a3 ON tipdodatka USING btree (sifra);


--
-- TOC entry 2741 (class 1259 OID 39920910)
-- Name: uniq_466f660b55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466f660b55cca980 ON tipdodatka USING btree (ime);


--
-- TOC entry 2794 (class 1259 OID 39921040)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 39920512)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 39920710)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2650 (class 1259 OID 39920672)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2598 (class 1259 OID 39920500)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2877 (class 1259 OID 39921421)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 39920987)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2778 (class 1259 OID 39920986)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2720 (class 1259 OID 39920863)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2721 (class 1259 OID 39920864)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2851 (class 1259 OID 39921205)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2589 (class 1259 OID 36291784)
-- Name: uniq_a8171cf65e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a8171cf65e15bdbd ON prisotnost USING btree (terminstoritve_id);


--
-- TOC entry 2726 (class 1259 OID 39920883)
-- Name: uniq_b28a7ff35e15bdbd; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_b28a7ff35e15bdbd ON ura USING btree (terminstoritve_id);


--
-- TOC entry 2658 (class 1259 OID 39920698)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2831 (class 1259 OID 39921155)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2888 (class 1259 OID 39921471)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2870 (class 1259 OID 39921396)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2871 (class 1259 OID 39921397)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2818 (class 1259 OID 39921105)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2724 (class 1259 OID 39920874)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 39920562)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2946 (class 2606 OID 39921689)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2941 (class 2606 OID 39921714)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2943 (class 2606 OID 39921704)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2947 (class 2606 OID 39921684)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2944 (class 2606 OID 39921699)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2942 (class 2606 OID 39921709)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2945 (class 2606 OID 39921694)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2985 (class 2606 OID 39921894)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2984 (class 2606 OID 39921899)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2983 (class 2606 OID 39921904)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3016 (class 2606 OID 39922064)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 3017 (class 2606 OID 39922059)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2921 (class 2606 OID 39921579)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2920 (class 2606 OID 39921584)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2966 (class 2606 OID 39921809)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 3011 (class 2606 OID 39922044)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 3012 (class 2606 OID 39922039)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3010 (class 2606 OID 39922049)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 3013 (class 2606 OID 39922034)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 3014 (class 2606 OID 39922029)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2965 (class 2606 OID 39921804)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2940 (class 2606 OID 39921674)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2939 (class 2606 OID 39921679)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2976 (class 2606 OID 39921849)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 39921859)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2975 (class 2606 OID 39921854)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2930 (class 2606 OID 39921634)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2931 (class 2606 OID 39921629)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2963 (class 2606 OID 39921794)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3008 (class 2606 OID 39922019)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2988 (class 2606 OID 39921909)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2987 (class 2606 OID 39921914)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2986 (class 2606 OID 39921919)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 3015 (class 2606 OID 39922054)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2990 (class 2606 OID 39921939)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2993 (class 2606 OID 39921924)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2989 (class 2606 OID 39921944)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2991 (class 2606 OID 39921934)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2992 (class 2606 OID 39921929)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2928 (class 2606 OID 39921624)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2929 (class 2606 OID 39921619)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2916 (class 2606 OID 39921564)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2917 (class 2606 OID 39921559)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 39921829)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2913 (class 2606 OID 39921539)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2912 (class 2606 OID 39921544)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2971 (class 2606 OID 39921844)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2972 (class 2606 OID 39921839)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2973 (class 2606 OID 39921834)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2923 (class 2606 OID 39921594)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2924 (class 2606 OID 39921589)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2922 (class 2606 OID 39921599)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 39921649)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2934 (class 2606 OID 39921654)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2909 (class 2606 OID 39921524)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2955 (class 2606 OID 39921769)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2957 (class 2606 OID 39921759)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2958 (class 2606 OID 39921754)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2956 (class 2606 OID 39921764)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2911 (class 2606 OID 39921529)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2910 (class 2606 OID 39921534)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2967 (class 2606 OID 39921814)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 3020 (class 2606 OID 39922079)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2981 (class 2606 OID 39921889)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2982 (class 2606 OID 39921884)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 3022 (class 2606 OID 39922084)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 3021 (class 2606 OID 39922089)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2964 (class 2606 OID 39921799)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2980 (class 2606 OID 39921874)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2979 (class 2606 OID 39921879)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2999 (class 2606 OID 39921994)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 3000 (class 2606 OID 39921989)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 3003 (class 2606 OID 39921974)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 3002 (class 2606 OID 39921979)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 3001 (class 2606 OID 39921984)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2926 (class 2606 OID 39921609)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2927 (class 2606 OID 39921604)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2925 (class 2606 OID 39921614)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2968 (class 2606 OID 39921824)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2969 (class 2606 OID 39921819)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3006 (class 2606 OID 39922004)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3005 (class 2606 OID 39922009)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2996 (class 2606 OID 39921964)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2995 (class 2606 OID 39921969)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2998 (class 2606 OID 39921954)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2997 (class 2606 OID 39921959)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2954 (class 2606 OID 39921744)
-- Name: fk_aab095ce73a5023a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce73a5023a FOREIGN KEY (ura_id) REFERENCES ura(id);


--
-- TOC entry 2953 (class 2606 OID 39921749)
-- Name: fk_aab095ce789dd25a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dodatek
    ADD CONSTRAINT fk_aab095ce789dd25a FOREIGN KEY (tipdodatka_id) REFERENCES tipdodatka(id);


--
-- TOC entry 2978 (class 2606 OID 39921864)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2977 (class 2606 OID 39921869)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2949 (class 2606 OID 39921719)
-- Name: fk_b28a7ff310389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff310389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 39921724)
-- Name: fk_b28a7ff35e15bdbd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ura
    ADD CONSTRAINT fk_b28a7ff35e15bdbd FOREIGN KEY (terminstoritve_id) REFERENCES terminstoritve(id);


--
-- TOC entry 2959 (class 2606 OID 39921789)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2960 (class 2606 OID 39921784)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2962 (class 2606 OID 39921774)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2961 (class 2606 OID 39921779)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2994 (class 2606 OID 39921949)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2932 (class 2606 OID 39921639)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2933 (class 2606 OID 39921644)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 39921669)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2937 (class 2606 OID 39921659)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2936 (class 2606 OID 39921664)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 3004 (class 2606 OID 39921999)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 3007 (class 2606 OID 39922014)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 3009 (class 2606 OID 39922024)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 3019 (class 2606 OID 39922069)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 3018 (class 2606 OID 39922074)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2914 (class 2606 OID 39921554)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2915 (class 2606 OID 39921549)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2919 (class 2606 OID 39921569)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2918 (class 2606 OID 39921574)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2950 (class 2606 OID 39921739)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 39921734)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2952 (class 2606 OID 39921729)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2016-01-22 17:54:18 CET

--
-- PostgreSQL database dump complete
--

