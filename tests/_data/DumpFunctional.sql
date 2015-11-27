--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-27 16:47:03 CET

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
-- TOC entry 183 (class 1259 OID 30023626)
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
-- TOC entry 237 (class 1259 OID 30024240)
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
-- TOC entry 236 (class 1259 OID 30024223)
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
-- TOC entry 182 (class 1259 OID 30023619)
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
-- TOC entry 181 (class 1259 OID 30023617)
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
-- TOC entry 227 (class 1259 OID 30024100)
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
-- TOC entry 230 (class 1259 OID 30024130)
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
-- TOC entry 251 (class 1259 OID 30024531)
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
-- TOC entry 203 (class 1259 OID 30023874)
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
-- TOC entry 205 (class 1259 OID 30023906)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 30023911)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 30024453)
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
-- TOC entry 194 (class 1259 OID 30023771)
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
-- TOC entry 238 (class 1259 OID 30024253)
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
-- TOC entry 223 (class 1259 OID 30024054)
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
-- TOC entry 200 (class 1259 OID 30023845)
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
-- TOC entry 197 (class 1259 OID 30023811)
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
-- TOC entry 195 (class 1259 OID 30023788)
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
-- TOC entry 212 (class 1259 OID 30023968)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 30024511)
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
-- TOC entry 250 (class 1259 OID 30024524)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 30024546)
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
-- TOC entry 216 (class 1259 OID 30023993)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 30023745)
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
-- TOC entry 185 (class 1259 OID 30023645)
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
-- TOC entry 189 (class 1259 OID 30023712)
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
-- TOC entry 186 (class 1259 OID 30023656)
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
-- TOC entry 178 (class 1259 OID 30023591)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 30023610)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 30024000)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 30024034)
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
-- TOC entry 233 (class 1259 OID 30024171)
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
-- TOC entry 188 (class 1259 OID 30023692)
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
-- TOC entry 191 (class 1259 OID 30023737)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 30024398)
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
-- TOC entry 213 (class 1259 OID 30023974)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 30023722)
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
-- TOC entry 202 (class 1259 OID 30023866)
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
-- TOC entry 198 (class 1259 OID 30023826)
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
-- TOC entry 199 (class 1259 OID 30023838)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 30023986)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 30024412)
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
-- TOC entry 242 (class 1259 OID 30024422)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 30024321)
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
-- TOC entry 243 (class 1259 OID 30024430)
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
-- TOC entry 219 (class 1259 OID 30024015)
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
-- TOC entry 211 (class 1259 OID 30023959)
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
-- TOC entry 210 (class 1259 OID 30023949)
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
-- TOC entry 232 (class 1259 OID 30024160)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 30024090)
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
-- TOC entry 196 (class 1259 OID 30023800)
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
-- TOC entry 175 (class 1259 OID 30023562)
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
-- TOC entry 174 (class 1259 OID 30023560)
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
-- TOC entry 220 (class 1259 OID 30024028)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 30023600)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 30023584)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 30024042)
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
-- TOC entry 214 (class 1259 OID 30023980)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 30023926)
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
-- TOC entry 173 (class 1259 OID 30023549)
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
-- TOC entry 172 (class 1259 OID 30023541)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 30023536)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 30024107)
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
-- TOC entry 187 (class 1259 OID 30023684)
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
-- TOC entry 209 (class 1259 OID 30023936)
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
-- TOC entry 231 (class 1259 OID 30024148)
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
-- TOC entry 184 (class 1259 OID 30023635)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 30024441)
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
-- TOC entry 207 (class 1259 OID 30023916)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 30023757)
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
-- TOC entry 176 (class 1259 OID 30023571)
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
-- TOC entry 235 (class 1259 OID 30024198)
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
-- TOC entry 201 (class 1259 OID 30023856)
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
-- TOC entry 218 (class 1259 OID 30024007)
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
-- TOC entry 229 (class 1259 OID 30024121)
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
-- TOC entry 247 (class 1259 OID 30024491)
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
-- TOC entry 246 (class 1259 OID 30024460)
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
-- TOC entry 248 (class 1259 OID 30024503)
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
-- TOC entry 225 (class 1259 OID 30024079)
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
-- TOC entry 204 (class 1259 OID 30023900)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 30024188)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 30024069)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 30023622)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 30023565)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3105 (class 0 OID 30023626)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5658-7af4-c075-d15e03df2506	10	30	Otroci	Abonma za otroke	200
000a0000-5658-7af4-50d8-4d3bf79bb2fd	20	60	Mladina	Abonma za mladino	400
000a0000-5658-7af4-0cc8-46cbd961f89c	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3159 (class 0 OID 30024240)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5658-7af4-9961-afdc99c1b04d	000d0000-5658-7af4-ba78-00ff49d97a59	\N	00090000-5658-7af4-d37c-71149a0f25c0	000b0000-5658-7af4-9d29-cc6c1951388c	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5658-7af4-e57b-bbf72fa433d5	000d0000-5658-7af4-042d-3c490fd011be	00100000-5658-7af4-c41a-16feeabf45c1	00090000-5658-7af4-eb53-d50fd6f14df8	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5658-7af4-f022-86b9be1b4e8f	000d0000-5658-7af4-6417-a2ed64a10d8f	00100000-5658-7af4-3809-019c718b6a53	00090000-5658-7af4-9e83-2da8adf892a3	\N	0003	t	\N	2015-11-27	\N	2	t	\N	f	f
000c0000-5658-7af4-6d50-a7cce60fbed7	000d0000-5658-7af4-c1d4-f1ee55e6a8c9	\N	00090000-5658-7af4-5245-60680dd51f1a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5658-7af4-4da0-7ea5f2372f4f	000d0000-5658-7af4-7e2d-e6d68013bee4	\N	00090000-5658-7af4-30c1-a391e79d32a6	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5658-7af4-361a-e5e257d34404	000d0000-5658-7af4-8756-5063dc19fa29	\N	00090000-5658-7af4-7729-fae1f7fe7355	000b0000-5658-7af4-8f1f-1efa2dbce8da	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5658-7af4-88c7-4d2b1160c9f4	000d0000-5658-7af4-bd7e-3e811b005887	00100000-5658-7af4-2668-c81fd72f1753	00090000-5658-7af4-ee38-045919010d09	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5658-7af4-bf64-59df7b825a69	000d0000-5658-7af4-76b5-f12d6d67592d	\N	00090000-5658-7af4-2a15-b1f98bc9168c	000b0000-5658-7af4-afec-5ff2cf1806a5	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5658-7af4-03f6-a8880cedc69d	000d0000-5658-7af4-bd7e-3e811b005887	00100000-5658-7af4-9898-421f3f3c94ba	00090000-5658-7af4-dd3e-8782e33d95de	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5658-7af4-db93-203219779feb	000d0000-5658-7af4-bd7e-3e811b005887	00100000-5658-7af4-d6a3-d0a900f4b603	00090000-5658-7af4-5c19-78f1114cc0ab	\N	0010	t	\N	2015-11-27	\N	16	f	\N	f	t
000c0000-5658-7af4-b7a3-faf0d4b6d4d5	000d0000-5658-7af4-bd7e-3e811b005887	00100000-5658-7af4-fe6a-f1af270ebb3b	00090000-5658-7af4-4a8c-61b53525e488	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5658-7af4-f393-582f70eb17d8	000d0000-5658-7af4-b74e-c5e19edfb310	00100000-5658-7af4-c41a-16feeabf45c1	00090000-5658-7af4-eb53-d50fd6f14df8	000b0000-5658-7af4-db85-e712b8d186cc	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3158 (class 0 OID 30024223)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3104 (class 0 OID 30023619)
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
-- TOC entry 3149 (class 0 OID 30024100)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5658-7af4-33e7-1972f873c35f	00160000-5658-7af3-d279-9432bd925d04	00090000-5658-7af4-12ac-a37950f9ed7a	aizv	10	t
003d0000-5658-7af4-eb5e-eff47a8825dd	00160000-5658-7af3-d279-9432bd925d04	00090000-5658-7af4-2414-87c2480ea46d	apri	14	t
003d0000-5658-7af4-3c25-5df027d5379f	00160000-5658-7af3-0ffb-aa8fb0082419	00090000-5658-7af4-55c2-033c4ecfc20b	aizv	11	t
003d0000-5658-7af4-7081-de6d70ea9133	00160000-5658-7af3-be66-ca69451892df	00090000-5658-7af4-a895-4fb4f244c22b	aizv	12	t
003d0000-5658-7af4-f85a-4f92f3eeb9ab	00160000-5658-7af3-d279-9432bd925d04	00090000-5658-7af4-bc6f-68feba191185	apri	18	f
\.


--
-- TOC entry 3152 (class 0 OID 30024130)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5658-7af3-d279-9432bd925d04	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5658-7af3-0ffb-aa8fb0082419	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5658-7af3-be66-ca69451892df	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3173 (class 0 OID 30024531)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 30023874)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5658-7af4-2adf-3451f4df2392	\N	\N	00200000-5658-7af4-3e86-92c10ba13131	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5658-7af4-9361-693b434b91e7	\N	\N	00200000-5658-7af4-6d1c-457cc504ec9f	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5658-7af4-ef60-3c216a3f0707	\N	\N	00200000-5658-7af4-0d89-c681082aec8c	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5658-7af4-916d-a56a6588bc9d	\N	\N	00200000-5658-7af4-fa80-fcc2e7af2a52	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5658-7af4-70bd-f3077d7b1db0	\N	\N	00200000-5658-7af4-70b5-0db653376ce7	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3127 (class 0 OID 30023906)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 30023911)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 30024453)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3116 (class 0 OID 30023771)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5658-7af1-f65c-3aa5a7862a23	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5658-7af1-b31c-441810b17d8b	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5658-7af1-7bde-e77929a05dc5	AL	ALB	008	Albania 	Albanija	\N
00040000-5658-7af1-af26-6990f71389b5	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5658-7af1-9ce4-e9749631a6f8	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5658-7af1-d2c7-5bf73e2a3d98	AD	AND	020	Andorra 	Andora	\N
00040000-5658-7af1-3d06-93682a4d8d39	AO	AGO	024	Angola 	Angola	\N
00040000-5658-7af1-4447-ee5c82efe216	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5658-7af1-83b1-36156ab1244b	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5658-7af1-f89b-e86b0fc3dc6f	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5658-7af1-adde-592fc7785f77	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5658-7af1-f870-c4d8908e1b2c	AM	ARM	051	Armenia 	Armenija	\N
00040000-5658-7af1-4c05-4b59d5659073	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5658-7af1-b80b-26443043873c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5658-7af1-2033-e5b5b7fc7f15	AT	AUT	040	Austria 	Avstrija	\N
00040000-5658-7af1-edef-68eb39a6f99b	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5658-7af1-c40a-bef025e84100	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5658-7af1-08e7-49f3e24ce228	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5658-7af1-72ff-8215a1dc42a7	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5658-7af1-5f53-08f7123d6a82	BB	BRB	052	Barbados 	Barbados	\N
00040000-5658-7af1-53a3-a1e0a39bfe0c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5658-7af1-d427-3c61e3763ca7	BE	BEL	056	Belgium 	Belgija	\N
00040000-5658-7af1-b687-90b297cc840e	BZ	BLZ	084	Belize 	Belize	\N
00040000-5658-7af1-f046-cf6dea8a5434	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5658-7af1-66f1-e4146fbaa8be	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5658-7af1-e169-ce0002254c98	BT	BTN	064	Bhutan 	Butan	\N
00040000-5658-7af1-c81b-3a0af3c8dcb7	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5658-7af1-2c70-63d653fa6263	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5658-7af1-9257-4adf98603f5c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5658-7af1-5637-33fd258130f2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5658-7af1-8b14-645b67b15117	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5658-7af1-5a06-449e80b8ee26	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5658-7af1-bab0-de57a4b14f0b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5658-7af1-bc71-af02b268a2ca	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5658-7af1-45d3-d419d54ee6c5	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5658-7af1-cf76-638f0462668d	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5658-7af1-e58e-552a6e59615d	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5658-7af1-6396-c4c80a5e5eac	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5658-7af1-b077-46b328643bb1	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5658-7af1-4aef-fb1a18f0d360	CA	CAN	124	Canada 	Kanada	\N
00040000-5658-7af1-0176-036b5d65f13b	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5658-7af1-2235-d321cc999fe5	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5658-7af1-f635-c32824d79c04	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5658-7af1-1ff1-a95a068ddc59	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5658-7af1-e66e-e944ea711b80	CL	CHL	152	Chile 	Čile	\N
00040000-5658-7af1-5277-f5255d298789	CN	CHN	156	China 	Kitajska	\N
00040000-5658-7af1-6f9a-6da3b7874f53	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5658-7af1-8c92-1ac86cc94dd9	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5658-7af1-3e6d-0b24fa1231d8	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5658-7af1-76f9-f49b99d8a0f9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5658-7af1-2ff3-94c19b4df084	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5658-7af1-2350-71888d672b74	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5658-7af1-4b76-aa7d4819030a	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5658-7af1-49e2-9f9aa8d4114b	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5658-7af1-3595-d0804d9b69e6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5658-7af1-9e1c-d391bd97cd2b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5658-7af1-359d-2cb978dfe3f4	CU	CUB	192	Cuba 	Kuba	\N
00040000-5658-7af1-f6a5-51091e412daf	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5658-7af1-08d5-d8644c29a584	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5658-7af1-11e3-9262c9bc2034	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5658-7af1-d01c-3a6c5d9def2a	DK	DNK	208	Denmark 	Danska	\N
00040000-5658-7af1-1d61-b69e9b76a05e	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5658-7af1-8dae-b7e744d497ad	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5658-7af1-664b-74071126aeb1	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5658-7af1-8c3f-88e13ae866d9	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5658-7af1-e761-ed2c0501c163	EG	EGY	818	Egypt 	Egipt	\N
00040000-5658-7af1-1724-32eeecd0627d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5658-7af1-9674-a0a3bad64749	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5658-7af1-7310-c63d1aff8fd9	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5658-7af1-fe42-70221a145cfa	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5658-7af1-9e1e-f78b2837c522	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5658-7af1-db7e-d2be96b6f8e7	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5658-7af1-f001-ab699470a7bc	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5658-7af1-919a-4a506c344595	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5658-7af1-f1aa-0fb5f77401c8	FI	FIN	246	Finland 	Finska	\N
00040000-5658-7af1-5852-79066df05fbd	FR	FRA	250	France 	Francija	\N
00040000-5658-7af1-2c3a-bcffc4f8c6f6	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5658-7af1-8076-1862f25e5501	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5658-7af1-82f8-6444e0a796f2	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5658-7af1-35b4-a34a377298da	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5658-7af1-1478-0893daaba9c5	GA	GAB	266	Gabon 	Gabon	\N
00040000-5658-7af1-8fef-e70d076d1fa3	GM	GMB	270	Gambia 	Gambija	\N
00040000-5658-7af1-4499-5effdb88fd6b	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5658-7af1-5fc3-584e8056e015	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5658-7af1-cbef-5fda0daad367	GH	GHA	288	Ghana 	Gana	\N
00040000-5658-7af1-6e9d-0eca7c0f553b	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5658-7af1-c17d-9d57ef528c5f	GR	GRC	300	Greece 	Grčija	\N
00040000-5658-7af1-5b82-1fe8e1042698	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5658-7af1-77af-5d5cca6427bc	GD	GRD	308	Grenada 	Grenada	\N
00040000-5658-7af1-8ce9-dccaa0f19893	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5658-7af1-f9d0-24b096c108a2	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5658-7af1-84c8-5a5e5c62b202	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5658-7af1-eb59-bc293d1c4ce5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5658-7af1-2dd8-5aca53e72d5a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5658-7af1-f121-17d8c3687851	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5658-7af1-7cf7-d58f047b0635	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5658-7af1-714f-4750dd16c0c6	HT	HTI	332	Haiti 	Haiti	\N
00040000-5658-7af1-6611-3e1cdc35c31e	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5658-7af1-211f-8a8f65db5185	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5658-7af1-47b6-76c34475798e	HN	HND	340	Honduras 	Honduras	\N
00040000-5658-7af1-4a51-047d72beac59	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5658-7af1-2bff-681caca57aff	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5658-7af1-e736-912a550e39bd	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5658-7af1-ab30-b6a9e97dadc6	IN	IND	356	India 	Indija	\N
00040000-5658-7af1-26ef-23a5b99e9980	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5658-7af1-1af1-a0b5b7d8ba1b	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5658-7af1-ef0b-035f1dd0be8b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5658-7af1-2853-81a892986921	IE	IRL	372	Ireland 	Irska	\N
00040000-5658-7af1-bf6c-aaac3f3c5ce0	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5658-7af1-01a2-a74a170c238d	IL	ISR	376	Israel 	Izrael	\N
00040000-5658-7af1-3c9a-d14837c4caf4	IT	ITA	380	Italy 	Italija	\N
00040000-5658-7af1-e9dc-2550b850060a	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5658-7af1-c5d4-84fa336cb54d	JP	JPN	392	Japan 	Japonska	\N
00040000-5658-7af1-fe26-cafaad813b18	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5658-7af1-2db0-1945ed22109c	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5658-7af1-d21e-4e6ceb944adc	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5658-7af1-fb8e-895f76307771	KE	KEN	404	Kenya 	Kenija	\N
00040000-5658-7af1-cc56-3c52df43ea31	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5658-7af1-a910-347ceea3ea4b	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5658-7af1-c47d-d9be056565a3	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5658-7af1-4666-fe92df01d177	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5658-7af1-7083-a48a14c3cef8	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5658-7af1-56ac-40eb3820db2c	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5658-7af1-365c-c1faf29b3af2	LV	LVA	428	Latvia 	Latvija	\N
00040000-5658-7af1-2668-67ad3e88fb5c	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5658-7af1-2b10-1d68d6b448c7	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5658-7af1-6138-9daa96e2613a	LR	LBR	430	Liberia 	Liberija	\N
00040000-5658-7af1-24d1-24bbdcc4471a	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5658-7af1-078e-8346f81e3d39	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5658-7af1-bd93-98bebdb97e03	LT	LTU	440	Lithuania 	Litva	\N
00040000-5658-7af1-b100-d5e2d523d39e	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5658-7af1-3bf7-8b855e09f517	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5658-7af1-455e-a3d68132f15c	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5658-7af1-b4cc-eb7f82636dbc	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5658-7af1-a440-d0bc16db434c	MW	MWI	454	Malawi 	Malavi	\N
00040000-5658-7af1-3dd3-4eec3a568b9d	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5658-7af1-aa81-cafa592365a1	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5658-7af1-3634-a442f678297f	ML	MLI	466	Mali 	Mali	\N
00040000-5658-7af1-6464-6b38731536a5	MT	MLT	470	Malta 	Malta	\N
00040000-5658-7af1-b284-db61230f3d81	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5658-7af1-85f3-aac4239c5d00	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5658-7af1-7928-bba9cd14ff3a	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5658-7af1-316f-18ab3024bbe8	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5658-7af1-d1c6-60a5576b24af	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5658-7af1-1c6c-c7d599371d21	MX	MEX	484	Mexico 	Mehika	\N
00040000-5658-7af1-fe08-e514ef4dfdaa	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5658-7af1-6230-3649342e6342	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5658-7af1-9fd0-c159b0ba6f66	MC	MCO	492	Monaco 	Monako	\N
00040000-5658-7af1-cd96-1b47ac6aca64	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5658-7af1-9839-f7c70664136f	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5658-7af1-bc53-b82725443bde	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5658-7af1-e635-d6ecca762a95	MA	MAR	504	Morocco 	Maroko	\N
00040000-5658-7af1-3d70-f191e134dba7	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5658-7af1-4b85-1c324853db36	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5658-7af1-aae3-833dd8d5f494	NA	NAM	516	Namibia 	Namibija	\N
00040000-5658-7af1-ff09-5021ec43b317	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5658-7af1-ed92-9e6a3a7f3e94	NP	NPL	524	Nepal 	Nepal	\N
00040000-5658-7af1-512c-5e5032fed799	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5658-7af1-afb7-bd212387f5f9	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5658-7af1-f678-3ef1bd62d8f0	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5658-7af1-7d5e-a92d65deb77a	NE	NER	562	Niger 	Niger 	\N
00040000-5658-7af1-dc12-53b8dfb4283b	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5658-7af1-4bf9-79bac38ea055	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5658-7af1-6498-bb0c3a736fa4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5658-7af1-3f67-aecff62b4a37	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5658-7af1-0e7c-1307f68c1b10	NO	NOR	578	Norway 	Norveška	\N
00040000-5658-7af1-0661-f51020af54c2	OM	OMN	512	Oman 	Oman	\N
00040000-5658-7af1-19ba-26c03ebebe33	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5658-7af1-af74-ebe2477b4c08	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5658-7af1-029f-d23404f8d37a	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5658-7af1-ec89-d32f8fb7e115	PA	PAN	591	Panama 	Panama	\N
00040000-5658-7af1-bb88-ac5f2fd61788	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5658-7af1-1a2f-4310dd038404	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5658-7af1-2bbd-d0c8d718c00e	PE	PER	604	Peru 	Peru	\N
00040000-5658-7af1-4b59-b02037b7fcb8	PH	PHL	608	Philippines 	Filipini	\N
00040000-5658-7af1-3c28-617e96d6cf5c	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5658-7af1-65b1-9c6f5145e28e	PL	POL	616	Poland 	Poljska	\N
00040000-5658-7af1-9639-94d9c4947100	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5658-7af1-2e94-f0055d34bd33	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5658-7af1-e6bc-993abca36213	QA	QAT	634	Qatar 	Katar	\N
00040000-5658-7af1-b29e-64022cd44582	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5658-7af1-d2b5-c0704f391ecd	RO	ROU	642	Romania 	Romunija	\N
00040000-5658-7af1-3ae8-434285fa35bc	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5658-7af1-f988-0059540833e6	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5658-7af1-6dde-d6d2e635c580	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5658-7af1-5121-2094180d85f7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5658-7af1-0a50-ac29590fd7a1	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5658-7af1-d689-e4947a178838	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5658-7af1-cd4e-a22a5e075e41	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5658-7af1-2d2c-a8de37c3c90d	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5658-7af1-b628-5a455aa6a60b	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5658-7af1-8282-2ba996c6a926	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5658-7af1-eee7-54d91f935e59	SM	SMR	674	San Marino 	San Marino	\N
00040000-5658-7af1-2a9c-a70cb07577e7	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5658-7af1-2acd-383ff8ee9eb5	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5658-7af1-a1a2-60c8c6d91e01	SN	SEN	686	Senegal 	Senegal	\N
00040000-5658-7af1-4c9a-37b7572e8b0f	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5658-7af1-bfee-1af8d918230e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5658-7af1-30a5-d42b10aa3e0b	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5658-7af1-177e-5e27540a3387	SG	SGP	702	Singapore 	Singapur	\N
00040000-5658-7af1-c192-363c1db0afe0	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5658-7af1-30d7-71116b84d016	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5658-7af1-c9fa-326ddd61813d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5658-7af1-dd33-dc80dded2570	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5658-7af1-2779-1c8503e6cb14	SO	SOM	706	Somalia 	Somalija	\N
00040000-5658-7af1-7fee-76b924d6cef0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5658-7af1-a859-9157a16012bc	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5658-7af1-685c-aa73512cd3e1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5658-7af1-adc4-1156cbae900a	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5658-7af1-7eb1-12fb2e3c7c1a	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5658-7af1-a8a8-073f4a2a276f	SD	SDN	729	Sudan 	Sudan	\N
00040000-5658-7af1-ea1e-02801234c3a7	SR	SUR	740	Suriname 	Surinam	\N
00040000-5658-7af1-3168-007f2b62e034	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5658-7af1-0d7f-ecc1616afbf6	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5658-7af1-549b-bd51ea6fc341	SE	SWE	752	Sweden 	Švedska	\N
00040000-5658-7af1-92f2-9fb0dc2c4d89	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5658-7af1-960f-a27460fc03d2	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5658-7af1-fe7c-94e18c3ff395	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5658-7af1-5ef0-841877b6ebda	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5658-7af1-6f75-0b52d0d0a6e8	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5658-7af1-3b52-9580de4e1c88	TH	THA	764	Thailand 	Tajska	\N
00040000-5658-7af1-9312-a40cf2b2db22	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5658-7af1-6e98-caf0843f254c	TG	TGO	768	Togo 	Togo	\N
00040000-5658-7af1-4bde-8fab7e60f6b5	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5658-7af1-6d51-18f058cbd9ed	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5658-7af1-62c6-cd9ed4ff1c6d	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5658-7af1-6a73-7944072d9703	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5658-7af1-737f-8be640f88266	TR	TUR	792	Turkey 	Turčija	\N
00040000-5658-7af1-7bed-391fcb7a4211	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5658-7af1-b2fa-55e9f436ff9a	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5658-7af1-5953-0bde3dba360a	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5658-7af1-e685-c384c6c65bbc	UG	UGA	800	Uganda 	Uganda	\N
00040000-5658-7af1-a858-19da2955f7c2	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5658-7af1-84ac-adf88ddb33c0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5658-7af1-8002-4c1dad9d51fe	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5658-7af1-8146-055e461bab18	US	USA	840	United States 	Združene države Amerike	\N
00040000-5658-7af1-931c-f9624df87634	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5658-7af1-91e8-ac4a22d27441	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5658-7af1-6412-0874272c3395	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5658-7af1-19fc-98183f5541ea	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5658-7af1-f0e2-d110cb7d8673	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5658-7af1-020f-117e8ebe272e	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5658-7af1-438f-7d718c908edf	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5658-7af1-758e-0919fba71bda	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5658-7af1-4dcf-5449c961a6b8	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5658-7af1-9a3a-9efa7dc852d5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5658-7af1-2ea0-c8adcf187fd7	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5658-7af1-1714-e8a263109eb4	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5658-7af1-2a78-25dd26257a9d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3160 (class 0 OID 30024253)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5658-7af4-a609-e68abd994482	000e0000-5658-7af4-63d1-1a4c696898ac	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5658-7af1-ae63-cac2f1bc427a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5658-7af4-ea79-66947eb2998d	000e0000-5658-7af4-2f75-fed004495114	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5658-7af1-8311-c4b31575e1ca	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5658-7af4-8b56-1d50879e232c	000e0000-5658-7af4-4631-f7a64a70c54d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5658-7af1-ae63-cac2f1bc427a	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5658-7af4-bf95-608e95446d49	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5658-7af4-e3e9-c9c1d79f6d54	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3145 (class 0 OID 30024054)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5658-7af4-bd7e-3e811b005887	000e0000-5658-7af4-2f75-fed004495114	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5658-7af1-5671-de23b9d08b8d
000d0000-5658-7af4-ba78-00ff49d97a59	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-9961-afdc99c1b04d	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5658-7af1-5671-de23b9d08b8d
000d0000-5658-7af4-042d-3c490fd011be	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-e57b-bbf72fa433d5	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5658-7af1-c605-04b1929af9da
000d0000-5658-7af4-6417-a2ed64a10d8f	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-f022-86b9be1b4e8f	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5658-7af1-b3e1-9f101b136815
000d0000-5658-7af4-c1d4-f1ee55e6a8c9	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-6d50-a7cce60fbed7	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5658-7af1-83cb-c3f4a2363cc6
000d0000-5658-7af4-7e2d-e6d68013bee4	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-4da0-7ea5f2372f4f	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5658-7af1-83cb-c3f4a2363cc6
000d0000-5658-7af4-8756-5063dc19fa29	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-361a-e5e257d34404	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5658-7af1-5671-de23b9d08b8d
000d0000-5658-7af4-76b5-f12d6d67592d	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-bf64-59df7b825a69	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5658-7af1-2463-3849c2365292
000d0000-5658-7af4-b74e-c5e19edfb310	000e0000-5658-7af4-2f75-fed004495114	000c0000-5658-7af4-f393-582f70eb17d8	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5658-7af1-d456-a44e8cfedc5e
\.


--
-- TOC entry 3122 (class 0 OID 30023845)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3119 (class 0 OID 30023811)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 30023788)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5658-7af4-ccf0-311c484e4373	00080000-5658-7af4-d327-d6805f8beade	00090000-5658-7af4-5c19-78f1114cc0ab	AK		igralka
\.


--
-- TOC entry 3134 (class 0 OID 30023968)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3171 (class 0 OID 30024511)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5658-7af4-1712-8bc20a54d63a	00010000-5658-7af2-367a-b0d302ac16b2	\N	Prva mapa	Root mapa	2015-11-27 16:47:00	2015-11-27 16:47:00	R	\N	\N
\.


--
-- TOC entry 3172 (class 0 OID 30024524)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3174 (class 0 OID 30024546)
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
-- TOC entry 3138 (class 0 OID 30023993)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 30023745)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5658-7af2-849d-c79ce9f3191c	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5658-7af2-cf1f-0f898ab58476	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5658-7af2-aeb6-ea1b5a0a71d9	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5658-7af2-2e90-03eb18eb8f9c	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5658-7af2-40a0-cdf558afeacf	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5658-7af2-f13c-38a621ec44bb	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5658-7af2-e101-2e4059133a5b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5658-7af2-d341-e0acb96345b8	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5658-7af2-c30c-d4040fec5596	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5658-7af2-56a0-e0d69981fc13	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5658-7af2-3dcb-4213868227f0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5658-7af2-48f9-0a4af5a58803	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5658-7af2-52bc-c7969ae8bac2	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5658-7af2-c161-117cb3aab1bd	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5658-7af3-b942-a4d1f73cecd8	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5658-7af3-e96f-32cff465aa86	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5658-7af3-a7d0-88e7d19a5605	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5658-7af3-cc69-214b364a5c3e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5658-7af3-b41b-bcc9107ca93a	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5658-7af5-6362-405f98a2721a	application.tenant.maticnopodjetje	string	s:36:"00080000-5658-7af5-f35b-399d7e3bda5c";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3107 (class 0 OID 30023645)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5658-7af3-e4f6-a2498cd13bfd	00000000-5658-7af3-b942-a4d1f73cecd8	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5658-7af3-6547-0e1d73b7bfc5	00000000-5658-7af3-b942-a4d1f73cecd8	00010000-5658-7af2-367a-b0d302ac16b2	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5658-7af3-8083-5cd76b543960	00000000-5658-7af3-e96f-32cff465aa86	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3111 (class 0 OID 30023712)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5658-7af4-fc73-e31cd7950a7d	\N	00100000-5658-7af4-c41a-16feeabf45c1	00100000-5658-7af4-3809-019c718b6a53	01	Gledališče Nimbis
00410000-5658-7af4-d1d4-0779ac8dba85	00410000-5658-7af4-fc73-e31cd7950a7d	00100000-5658-7af4-c41a-16feeabf45c1	00100000-5658-7af4-3809-019c718b6a53	02	Tehnika
\.


--
-- TOC entry 3108 (class 0 OID 30023656)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5658-7af4-d37c-71149a0f25c0	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5658-7af4-5245-60680dd51f1a	00010000-5658-7af4-6ac9-0f4c7b81b2a4	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5658-7af4-9e83-2da8adf892a3	00010000-5658-7af4-acd0-207a1f83f2d8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5658-7af4-dd3e-8782e33d95de	00010000-5658-7af4-e8c1-875cec39e5d2	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5658-7af4-a6a0-3b1fe98e0250	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5658-7af4-7729-fae1f7fe7355	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5658-7af4-4a8c-61b53525e488	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5658-7af4-ee38-045919010d09	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5658-7af4-5c19-78f1114cc0ab	00010000-5658-7af4-3b6f-41982be31192	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5658-7af4-eb53-d50fd6f14df8	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5658-7af4-87e1-44c88e18760e	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5658-7af4-30c1-a391e79d32a6	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5658-7af4-2a15-b1f98bc9168c	00010000-5658-7af4-53fb-9e91f276481b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5658-7af4-12ac-a37950f9ed7a	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-7af4-2414-87c2480ea46d	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-7af4-55c2-033c4ecfc20b	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-7af4-a895-4fb4f244c22b	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5658-7af4-bc6f-68feba191185	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5658-7af4-4d96-17b3d494557a	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-7af4-7b09-5e5ddb2ef25e	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5658-7af4-730c-ca37d1b1c777	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3100 (class 0 OID 30023591)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5658-7af2-5384-a6701e094119	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5658-7af2-ec64-606a387f384f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5658-7af2-fe95-caca0e0a5765	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5658-7af2-c2e9-61f184d3dd89	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5658-7af2-aaa2-aa89c9661663	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-5658-7af2-a4f2-5ea8f6f0a2ef	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5658-7af2-0e07-06a9745f6c0d	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5658-7af2-643f-3dc174407878	Abonma-read	Abonma - branje	t
00030000-5658-7af2-a22d-4c6a2bda7d01	Abonma-write	Abonma - spreminjanje	t
00030000-5658-7af2-bb17-11352395410f	Alternacija-read	Alternacija - branje	t
00030000-5658-7af2-819a-cc96f8ec1ccf	Alternacija-write	Alternacija - spreminjanje	t
00030000-5658-7af2-4015-591efd73c51b	Arhivalija-read	Arhivalija - branje	t
00030000-5658-7af2-53f3-583d36ac99d0	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5658-7af2-3fa0-6a111a40c0a7	AuthStorage-read	AuthStorage - branje	t
00030000-5658-7af2-60a3-754728a09703	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5658-7af2-887e-c08da924d5d8	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5658-7af2-b711-0bc97eb3a2cf	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5658-7af2-a1a7-94ce6fcbc051	Besedilo-read	Besedilo - branje	t
00030000-5658-7af2-94f2-9e7dc302c416	Besedilo-write	Besedilo - spreminjanje	t
00030000-5658-7af2-ae69-2c914eb161d2	Dogodek-read	Dogodek - branje	t
00030000-5658-7af2-e8fc-a19ac24e054f	Dogodek-write	Dogodek - spreminjanje	t
00030000-5658-7af2-b9dd-4cc2a93a9f49	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5658-7af2-7ac5-f8a2c0e812c5	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5658-7af2-471c-b7d9a3d883d0	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5658-7af2-a322-f981b238c80e	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5658-7af2-3987-aa278dc34d9d	DogodekTrait-read	DogodekTrait - branje	t
00030000-5658-7af2-311e-46546fbed7e8	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5658-7af2-574f-ffe2323d26da	DrugiVir-read	DrugiVir - branje	t
00030000-5658-7af2-7af8-69112a67db63	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5658-7af2-7f55-b8a76d670b7c	Drzava-read	Drzava - branje	t
00030000-5658-7af2-9209-0b21f5c9d28a	Drzava-write	Drzava - spreminjanje	t
00030000-5658-7af2-f0f8-0f7d1dae0b87	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5658-7af2-a996-cbefed43af02	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5658-7af2-38b7-89676918572f	Funkcija-read	Funkcija - branje	t
00030000-5658-7af2-4013-74d4a7590ec0	Funkcija-write	Funkcija - spreminjanje	t
00030000-5658-7af2-f192-c8e425f26d97	Gostovanje-read	Gostovanje - branje	t
00030000-5658-7af2-841e-0da1e4e69420	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5658-7af2-eb0e-d4fcd1e40556	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5658-7af2-ebae-0b77bf3ce168	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5658-7af2-8341-774e1d0b1ef1	Kupec-read	Kupec - branje	t
00030000-5658-7af2-780f-0c8825b53b97	Kupec-write	Kupec - spreminjanje	t
00030000-5658-7af2-b6d2-a6d6312472b3	NacinPlacina-read	NacinPlacina - branje	t
00030000-5658-7af2-d54d-df70983f6754	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5658-7af2-93b3-338d3c8e6dea	Option-read	Option - branje	t
00030000-5658-7af2-2ad4-9582c0b5abd6	Option-write	Option - spreminjanje	t
00030000-5658-7af2-8cb3-7ebda6cd5801	OptionValue-read	OptionValue - branje	t
00030000-5658-7af2-7bfb-585302c43bbd	OptionValue-write	OptionValue - spreminjanje	t
00030000-5658-7af2-1b70-379acefce756	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5658-7af2-c1f8-0bc5150e88c8	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5658-7af2-f29a-06cf8e002f42	Oseba-read	Oseba - branje	t
00030000-5658-7af2-b94f-6d9bfd52c842	Oseba-write	Oseba - spreminjanje	t
00030000-5658-7af2-0ac5-6ec71593d09d	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5658-7af2-aef9-01754dd1b5ff	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5658-7af2-976a-d465bddfabf4	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5658-7af2-50ed-483e83120b98	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5658-7af2-9161-246bcdb69ec5	Pogodba-read	Pogodba - branje	t
00030000-5658-7af2-1e5f-4d0cc55e9499	Pogodba-write	Pogodba - spreminjanje	t
00030000-5658-7af2-4352-5a6b88f581c4	Popa-read	Popa - branje	t
00030000-5658-7af2-09b6-dd6b3c18c29b	Popa-write	Popa - spreminjanje	t
00030000-5658-7af2-ea51-b28748e6660a	Posta-read	Posta - branje	t
00030000-5658-7af2-6613-430a07028a70	Posta-write	Posta - spreminjanje	t
00030000-5658-7af2-994a-73b5ba36b9e8	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5658-7af2-799d-6a0759c3dd94	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5658-7af2-9614-783b42b7887d	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5658-7af2-3553-1a5462322a2a	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5658-7af2-8765-a37430526ec7	PostniNaslov-read	PostniNaslov - branje	t
00030000-5658-7af2-dc9d-3a533f2d3638	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5658-7af2-e7b9-1837a205742a	Praznik-read	Praznik - branje	t
00030000-5658-7af2-c3c5-ebfba6e7f4e7	Praznik-write	Praznik - spreminjanje	t
00030000-5658-7af2-ecf8-b5dcb4024f74	Predstava-read	Predstava - branje	t
00030000-5658-7af2-5e0b-e9b94a5dd67b	Predstava-write	Predstava - spreminjanje	t
00030000-5658-7af2-ed6c-2c96f80aee14	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5658-7af2-b69e-167efd98e239	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5658-7af2-e0ec-86c74bd218f3	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5658-7af2-f7ac-64f63f11f52d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5658-7af2-d796-5067035c6186	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5658-7af2-1ed9-343f288d8bca	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5658-7af2-bc10-2f060b2b0e2a	ProgramDela-read	ProgramDela - branje	t
00030000-5658-7af2-d97c-5c1d029d41ef	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5658-7af2-2f3c-6f4082349d5a	ProgramFestival-read	ProgramFestival - branje	t
00030000-5658-7af2-f51f-4cfc9d51dfee	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5658-7af2-86cf-25081a0e887e	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5658-7af2-1f8b-a126ec81327e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5658-7af2-9e04-ee6706888bb3	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5658-7af2-44d5-1c22cfe2f1f5	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5658-7af2-d1d4-3b96d0daf6ec	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5658-7af2-6033-610434c0e838	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5658-7af2-85ec-9358009998fe	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5658-7af2-f214-9a6ec41d8920	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5658-7af2-dd0d-fea445b1bad6	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5658-7af2-3a19-73f70d45ca53	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5658-7af2-119c-93669f88b74d	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5658-7af2-40ce-728839926295	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5658-7af2-d22c-621b55eec65f	ProgramRazno-read	ProgramRazno - branje	t
00030000-5658-7af2-69e2-91031fefe013	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5658-7af2-e251-c647e14d03a1	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5658-7af2-b70a-448042f0bdae	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5658-7af2-81d2-f28ab781c5e0	Prostor-read	Prostor - branje	t
00030000-5658-7af2-7514-ca290a6cd1e1	Prostor-write	Prostor - spreminjanje	t
00030000-5658-7af2-a0be-bfd7450f5c07	Racun-read	Racun - branje	t
00030000-5658-7af2-3c8e-017796c44b10	Racun-write	Racun - spreminjanje	t
00030000-5658-7af2-89b4-d2bc5b495d16	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5658-7af2-d06f-26deaeff59c3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5658-7af2-0e42-896d36bb4a16	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5658-7af2-aaea-343c9b9f5ee0	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5658-7af2-fda1-88745be3b36f	Rekvizit-read	Rekvizit - branje	t
00030000-5658-7af2-cdbf-b7f16ae39fd8	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5658-7af2-776e-4ffdc47f633e	Revizija-read	Revizija - branje	t
00030000-5658-7af2-c49e-2a07b5f9c3b0	Revizija-write	Revizija - spreminjanje	t
00030000-5658-7af2-76d0-a982422ea5ae	Rezervacija-read	Rezervacija - branje	t
00030000-5658-7af2-8fee-9ca72c80d222	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5658-7af2-5002-6ebbc23e4419	SedezniRed-read	SedezniRed - branje	t
00030000-5658-7af2-cfd4-4916813cfcfd	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5658-7af2-c2de-d7f9143da950	Sedez-read	Sedez - branje	t
00030000-5658-7af2-0b68-16e1372d36e9	Sedez-write	Sedez - spreminjanje	t
00030000-5658-7af2-baa3-0bd9a7e808f0	Sezona-read	Sezona - branje	t
00030000-5658-7af2-c2d9-7e491f1f84b2	Sezona-write	Sezona - spreminjanje	t
00030000-5658-7af2-a8e4-d31f30870c32	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-5658-7af2-2f18-3aa3e341e9b0	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-5658-7af2-7d56-24b4701b0cb5	Stevilcenje-read	Stevilcenje - branje	t
00030000-5658-7af2-66ad-0dd65be633b1	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5658-7af2-b907-15c28852440b	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-5658-7af2-fe96-af4d3f4c19de	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-5658-7af2-944f-00d6f7e384ce	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5658-7af2-47b2-73ee11c50639	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5658-7af2-0945-f5da457942e1	Telefonska-read	Telefonska - branje	t
00030000-5658-7af2-608e-85c0f20e84c5	Telefonska-write	Telefonska - spreminjanje	t
00030000-5658-7af2-9094-482aeb66d569	TerminStoritve-read	TerminStoritve - branje	t
00030000-5658-7af2-4c58-1b8534bbed50	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5658-7af2-4bf7-302a4bac91f3	TipFunkcije-read	TipFunkcije - branje	t
00030000-5658-7af2-9e21-0ff7d26ec200	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5658-7af2-27e0-da84b10a3274	TipPopa-read	TipPopa - branje	t
00030000-5658-7af2-3358-40470c1cc823	TipPopa-write	TipPopa - spreminjanje	t
00030000-5658-7af2-0570-a0508e0bb2ab	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5658-7af2-8d26-99405b5bb35b	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5658-7af2-2f5f-21696352991f	TipVaje-read	TipVaje - branje	t
00030000-5658-7af2-1523-5fc3268b8721	TipVaje-write	TipVaje - spreminjanje	t
00030000-5658-7af2-75e7-5911fea4f40a	Trr-read	Trr - branje	t
00030000-5658-7af2-7e51-c5dee25293d6	Trr-write	Trr - spreminjanje	t
00030000-5658-7af2-0685-65253ca15e3f	Uprizoritev-read	Uprizoritev - branje	t
00030000-5658-7af2-f070-2420fe36f0c9	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5658-7af2-cd16-adb38f6641f7	Vaja-read	Vaja - branje	t
00030000-5658-7af2-39a9-765d9e1e1117	Vaja-write	Vaja - spreminjanje	t
00030000-5658-7af2-ec64-3c965e6034d6	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5658-7af2-c95a-733d64cfbc09	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5658-7af2-fc74-0b8883c75fcd	VrstaStroska-read	VrstaStroska - branje	t
00030000-5658-7af2-659c-e5f8f072f824	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5658-7af2-3e9a-858aab2e6481	Zaposlitev-read	Zaposlitev - branje	t
00030000-5658-7af2-156b-5a3f762da380	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5658-7af2-488b-5a7d79d62c86	Zasedenost-read	Zasedenost - branje	t
00030000-5658-7af2-e8b0-8e470392d77d	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5658-7af2-b874-210770a52907	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5658-7af2-b28b-3b68b9a3eab1	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5658-7af2-d814-a1d314e3456c	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5658-7af2-442f-d12c5b6fdb04	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5658-7af2-0ff7-42bdd593db95	Job-read	Branje opravil - samo zase - branje	t
00030000-5658-7af2-2ed2-06ac37cf134d	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5658-7af2-088b-734678c93d57	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5658-7af2-4582-a78639359b8d	Report-read	Report - branje	t
00030000-5658-7af2-6b13-a901c465e8c1	Report-write	Report - spreminjanje	t
00030000-5658-7af2-f5e3-8b3aa20e9b90	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5658-7af2-7daa-ae8ec7bb7647	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5658-7af2-4446-e158cc73fec3	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5658-7af2-6443-3e8f1349f4ed	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5658-7af2-ebdc-af1d6c67e58d	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5658-7af2-a21e-6a723b83b352	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5658-7af2-6422-7b85d2bbb09f	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5658-7af2-d678-f9081e0bfc6b	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5658-7af2-e0c9-a1c03b83c77c	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5658-7af2-1a1b-f47c8ffc1b11	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5658-7af2-22ff-c299591a533f	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5658-7af2-eb5a-c92b082d2417	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5658-7af2-2744-c0a946ea61ea	Datoteka-write	Datoteka - spreminjanje	t
00030000-5658-7af2-9558-509b16d7b5d6	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3102 (class 0 OID 30023610)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5658-7af2-8701-ec27d7c27a5b	00030000-5658-7af2-ec64-606a387f384f
00020000-5658-7af2-8701-ec27d7c27a5b	00030000-5658-7af2-5384-a6701e094119
00020000-5658-7af2-6c04-8f4cad1593ec	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-b711-0bc97eb3a2cf
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-94f2-9e7dc302c416
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-887e-c08da924d5d8
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-a1a7-94ce6fcbc051
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-0a8c-309fd1dedc3c	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-4f36-9a2c709ac970	00030000-5658-7af2-887e-c08da924d5d8
00020000-5658-7af2-4f36-9a2c709ac970	00030000-5658-7af2-a1a7-94ce6fcbc051
00020000-5658-7af2-4f36-9a2c709ac970	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-4f36-9a2c709ac970	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-4f36-9a2c709ac970	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-2643-10daf4874887	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-2643-10daf4874887	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af2-2643-10daf4874887	00030000-5658-7af2-156b-5a3f762da380
00020000-5658-7af2-2643-10daf4874887	00030000-5658-7af2-1b70-379acefce756
00020000-5658-7af2-82a5-1bd646f4b8ff	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af2-82a5-1bd646f4b8ff	00030000-5658-7af2-1b70-379acefce756
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-0945-f5da457942e1
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-8765-a37430526ec7
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-75e7-5911fea4f40a
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-eb0e-d4fcd1e40556
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-608e-85c0f20e84c5
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-dc9d-3a533f2d3638
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-7e51-c5dee25293d6
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-09b6-dd6b3c18c29b
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-ebae-0b77bf3ce168
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-1ed9-343f288d8bca
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-9320-28177d41ca6f	00030000-5658-7af2-27e0-da84b10a3274
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-0945-f5da457942e1
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-8765-a37430526ec7
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-75e7-5911fea4f40a
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-eb0e-d4fcd1e40556
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-794e-ac8952c71d3a	00030000-5658-7af2-27e0-da84b10a3274
00020000-5658-7af2-742b-4544ce3ccab0	00030000-5658-7af2-27e0-da84b10a3274
00020000-5658-7af2-742b-4544ce3ccab0	00030000-5658-7af2-3358-40470c1cc823
00020000-5658-7af2-2822-8d59916c31b9	00030000-5658-7af2-27e0-da84b10a3274
00020000-5658-7af2-ab6c-01a9570f35f3	00030000-5658-7af2-ea51-b28748e6660a
00020000-5658-7af2-ab6c-01a9570f35f3	00030000-5658-7af2-6613-430a07028a70
00020000-5658-7af2-5116-0f04474ee56d	00030000-5658-7af2-ea51-b28748e6660a
00020000-5658-7af2-0842-eabd651c5dbc	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-0842-eabd651c5dbc	00030000-5658-7af2-9209-0b21f5c9d28a
00020000-5658-7af2-d1b6-d366ddfaa2eb	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-88f3-809b69003670	00030000-5658-7af2-d814-a1d314e3456c
00020000-5658-7af2-88f3-809b69003670	00030000-5658-7af2-442f-d12c5b6fdb04
00020000-5658-7af2-b65c-80cb39b62fb4	00030000-5658-7af2-d814-a1d314e3456c
00020000-5658-7af2-b64b-3d23c6796391	00030000-5658-7af2-b874-210770a52907
00020000-5658-7af2-b64b-3d23c6796391	00030000-5658-7af2-b28b-3b68b9a3eab1
00020000-5658-7af2-713d-2dc06bbb7560	00030000-5658-7af2-b874-210770a52907
00020000-5658-7af2-eefd-7b0999f29e4c	00030000-5658-7af2-643f-3dc174407878
00020000-5658-7af2-eefd-7b0999f29e4c	00030000-5658-7af2-a22d-4c6a2bda7d01
00020000-5658-7af2-75c4-d2651ef31065	00030000-5658-7af2-643f-3dc174407878
00020000-5658-7af2-d090-9f55b6d6792c	00030000-5658-7af2-81d2-f28ab781c5e0
00020000-5658-7af2-d090-9f55b6d6792c	00030000-5658-7af2-7514-ca290a6cd1e1
00020000-5658-7af2-d090-9f55b6d6792c	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-d090-9f55b6d6792c	00030000-5658-7af2-8765-a37430526ec7
00020000-5658-7af2-d090-9f55b6d6792c	00030000-5658-7af2-dc9d-3a533f2d3638
00020000-5658-7af2-d090-9f55b6d6792c	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-7fce-ce45c14aecce	00030000-5658-7af2-81d2-f28ab781c5e0
00020000-5658-7af2-7fce-ce45c14aecce	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-7fce-ce45c14aecce	00030000-5658-7af2-8765-a37430526ec7
00020000-5658-7af2-a07f-df8ba44c9760	00030000-5658-7af2-fc74-0b8883c75fcd
00020000-5658-7af2-a07f-df8ba44c9760	00030000-5658-7af2-659c-e5f8f072f824
00020000-5658-7af2-67bd-33e4a1828173	00030000-5658-7af2-fc74-0b8883c75fcd
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-c1f8-0bc5150e88c8
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-1b70-379acefce756
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af2-b627-4345c47f4392	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-1199-af10299b47a3	00030000-5658-7af2-1b70-379acefce756
00020000-5658-7af2-1199-af10299b47a3	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af2-1199-af10299b47a3	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-1199-af10299b47a3	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-1199-af10299b47a3	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-bd21-4e47a7634f6e	00030000-5658-7af2-2f5f-21696352991f
00020000-5658-7af2-bd21-4e47a7634f6e	00030000-5658-7af2-1523-5fc3268b8721
00020000-5658-7af2-f5ef-c7d648b441d1	00030000-5658-7af2-2f5f-21696352991f
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-a4f2-5ea8f6f0a2ef
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-0e07-06a9745f6c0d
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-bc10-2f060b2b0e2a
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-d97c-5c1d029d41ef
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-2f3c-6f4082349d5a
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-f51f-4cfc9d51dfee
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-86cf-25081a0e887e
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-1f8b-a126ec81327e
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-9e04-ee6706888bb3
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-44d5-1c22cfe2f1f5
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-d1d4-3b96d0daf6ec
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-6033-610434c0e838
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-85ec-9358009998fe
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-f214-9a6ec41d8920
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-dd0d-fea445b1bad6
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-3a19-73f70d45ca53
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-119c-93669f88b74d
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-40ce-728839926295
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-d22c-621b55eec65f
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-69e2-91031fefe013
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-e251-c647e14d03a1
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-b70a-448042f0bdae
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-f7ac-64f63f11f52d
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-7af8-69112a67db63
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-799d-6a0759c3dd94
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-574f-ffe2323d26da
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-e0ec-86c74bd218f3
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-994a-73b5ba36b9e8
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-fc74-0b8883c75fcd
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-bb17-11352395410f
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-9161-246bcdb69ec5
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-42e2-7b8b7ed19043	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-bc10-2f060b2b0e2a
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-2f3c-6f4082349d5a
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-86cf-25081a0e887e
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-9e04-ee6706888bb3
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-d1d4-3b96d0daf6ec
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-85ec-9358009998fe
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-dd0d-fea445b1bad6
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-119c-93669f88b74d
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-d22c-621b55eec65f
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-e251-c647e14d03a1
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-e0ec-86c74bd218f3
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-574f-ffe2323d26da
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-994a-73b5ba36b9e8
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-4582-a78639359b8d
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-9983-b74cc67417c2	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-f070-2420fe36f0c9
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-bb17-11352395410f
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-819a-cc96f8ec1ccf
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-a1a7-94ce6fcbc051
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-4013-74d4a7590ec0
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-696f-8eb05ff92b15	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-bb17-11352395410f
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-a1a7-94ce6fcbc051
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af2-1f77-aeb6703b566f	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-bb17-11352395410f
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-819a-cc96f8ec1ccf
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-9161-246bcdb69ec5
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-1e5f-4d0cc55e9499
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-47b2-73ee11c50639
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-75e7-5911fea4f40a
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-2763-c259b4591bdc	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-bb17-11352395410f
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-9161-246bcdb69ec5
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-75e7-5911fea4f40a
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-4721-4a4e0d79955d	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-9161-246bcdb69ec5
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af2-1e6a-1dbe59c84472	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af2-363b-9c24e7808849	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af2-363b-9c24e7808849	00030000-5658-7af2-47b2-73ee11c50639
00020000-5658-7af2-363b-9c24e7808849	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af2-363b-9c24e7808849	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af2-0dd7-ba2dc29f5afe	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af2-0dd7-ba2dc29f5afe	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-5384-a6701e094119
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ec64-606a387f384f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-643f-3dc174407878
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a22d-4c6a2bda7d01
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-bb17-11352395410f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-819a-cc96f8ec1ccf
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4015-591efd73c51b
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-53f3-583d36ac99d0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-3fa0-6a111a40c0a7
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-60a3-754728a09703
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-887e-c08da924d5d8
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b711-0bc97eb3a2cf
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a1a7-94ce6fcbc051
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-94f2-9e7dc302c416
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ae69-2c914eb161d2
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c2e9-61f184d3dd89
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-e8fc-a19ac24e054f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b9dd-4cc2a93a9f49
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7ac5-f8a2c0e812c5
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-471c-b7d9a3d883d0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a322-f981b238c80e
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-574f-ffe2323d26da
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7af8-69112a67db63
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7f55-b8a76d670b7c
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9209-0b21f5c9d28a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f0f8-0f7d1dae0b87
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a996-cbefed43af02
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-38b7-89676918572f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4013-74d4a7590ec0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f192-c8e425f26d97
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-841e-0da1e4e69420
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-088b-734678c93d57
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0ff7-42bdd593db95
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-2ed2-06ac37cf134d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-eb0e-d4fcd1e40556
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ebae-0b77bf3ce168
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-8341-774e1d0b1ef1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-780f-0c8825b53b97
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f5e3-8b3aa20e9b90
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7daa-ae8ec7bb7647
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4446-e158cc73fec3
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-6443-3e8f1349f4ed
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a21e-6a723b83b352
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ebdc-af1d6c67e58d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b6d2-a6d6312472b3
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d54d-df70983f6754
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-93b3-338d3c8e6dea
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-2ad4-9582c0b5abd6
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-8cb3-7ebda6cd5801
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7bfb-585302c43bbd
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-1b70-379acefce756
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c1f8-0bc5150e88c8
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-aaa2-aa89c9661663
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b94f-6d9bfd52c842
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0ac5-6ec71593d09d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-aef9-01754dd1b5ff
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-976a-d465bddfabf4
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-50ed-483e83120b98
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9161-246bcdb69ec5
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-1e5f-4d0cc55e9499
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-09b6-dd6b3c18c29b
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ea51-b28748e6660a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-6613-430a07028a70
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-994a-73b5ba36b9e8
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-799d-6a0759c3dd94
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9614-783b42b7887d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-3553-1a5462322a2a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-8765-a37430526ec7
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-dc9d-3a533f2d3638
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-e7b9-1837a205742a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c3c5-ebfba6e7f4e7
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ecf8-b5dcb4024f74
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-5e0b-e9b94a5dd67b
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ed6c-2c96f80aee14
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b69e-167efd98e239
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-e0ec-86c74bd218f3
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f7ac-64f63f11f52d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d796-5067035c6186
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-1ed9-343f288d8bca
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a4f2-5ea8f6f0a2ef
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-bc10-2f060b2b0e2a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0e07-06a9745f6c0d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d97c-5c1d029d41ef
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-2f3c-6f4082349d5a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f51f-4cfc9d51dfee
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-86cf-25081a0e887e
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-1f8b-a126ec81327e
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9e04-ee6706888bb3
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-44d5-1c22cfe2f1f5
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d1d4-3b96d0daf6ec
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-6033-610434c0e838
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-85ec-9358009998fe
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f214-9a6ec41d8920
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-dd0d-fea445b1bad6
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-3a19-73f70d45ca53
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-119c-93669f88b74d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-40ce-728839926295
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d22c-621b55eec65f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-69e2-91031fefe013
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-e251-c647e14d03a1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b70a-448042f0bdae
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-81d2-f28ab781c5e0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7514-ca290a6cd1e1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a0be-bfd7450f5c07
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-3c8e-017796c44b10
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-89b4-d2bc5b495d16
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d06f-26deaeff59c3
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-fda1-88745be3b36f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-cdbf-b7f16ae39fd8
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0e42-896d36bb4a16
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-aaea-343c9b9f5ee0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4582-a78639359b8d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-6b13-a901c465e8c1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-776e-4ffdc47f633e
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c49e-2a07b5f9c3b0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-76d0-a982422ea5ae
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-8fee-9ca72c80d222
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c2de-d7f9143da950
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0b68-16e1372d36e9
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-5002-6ebbc23e4419
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-cfd4-4916813cfcfd
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-baa3-0bd9a7e808f0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c2d9-7e491f1f84b2
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7d56-24b4701b0cb5
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-66ad-0dd65be633b1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-a8e4-d31f30870c32
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-2f18-3aa3e341e9b0
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b907-15c28852440b
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-fe96-af4d3f4c19de
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-944f-00d6f7e384ce
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-47b2-73ee11c50639
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0945-f5da457942e1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-608e-85c0f20e84c5
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9094-482aeb66d569
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-fe95-caca0e0a5765
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4c58-1b8534bbed50
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-4bf7-302a4bac91f3
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-9e21-0ff7d26ec200
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-27e0-da84b10a3274
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-3358-40470c1cc823
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0570-a0508e0bb2ab
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-8d26-99405b5bb35b
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-2f5f-21696352991f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-1523-5fc3268b8721
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-75e7-5911fea4f40a
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-7e51-c5dee25293d6
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-f070-2420fe36f0c9
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-cd16-adb38f6641f7
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-39a9-765d9e1e1117
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-ec64-3c965e6034d6
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-c95a-733d64cfbc09
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-fc74-0b8883c75fcd
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-659c-e5f8f072f824
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-eb5a-c92b082d2417
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-22ff-c299591a533f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-3e9a-858aab2e6481
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-156b-5a3f762da380
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-488b-5a7d79d62c86
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-e8b0-8e470392d77d
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b874-210770a52907
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-b28b-3b68b9a3eab1
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-d814-a1d314e3456c
00020000-5658-7af3-4170-ae41055201ad	00030000-5658-7af2-442f-d12c5b6fdb04
00020000-5658-7af3-7508-d18a4e2c7607	00030000-5658-7af2-1a1b-f47c8ffc1b11
00020000-5658-7af3-7aa5-9066c20bbb57	00030000-5658-7af2-e0c9-a1c03b83c77c
00020000-5658-7af3-a49a-1f2d0f9dad2a	00030000-5658-7af2-f070-2420fe36f0c9
00020000-5658-7af3-8bb8-61232dddad8f	00030000-5658-7af2-0685-65253ca15e3f
00020000-5658-7af3-b4f5-9852eb2f3834	00030000-5658-7af2-7daa-ae8ec7bb7647
00020000-5658-7af3-ae54-32d6445db9f8	00030000-5658-7af2-4446-e158cc73fec3
00020000-5658-7af3-4f7c-ce3b5a11d9dc	00030000-5658-7af2-6443-3e8f1349f4ed
00020000-5658-7af3-1629-a7b0a03c1d91	00030000-5658-7af2-f5e3-8b3aa20e9b90
00020000-5658-7af3-bcaf-33eb5916662c	00030000-5658-7af2-a21e-6a723b83b352
00020000-5658-7af3-c6e7-ae98e8ce8c84	00030000-5658-7af2-ebdc-af1d6c67e58d
00020000-5658-7af3-ef76-31211e0dcb9a	00030000-5658-7af2-d678-f9081e0bfc6b
00020000-5658-7af3-12ef-0b013dd1c29a	00030000-5658-7af2-6422-7b85d2bbb09f
00020000-5658-7af3-f0e5-d37210254943	00030000-5658-7af2-b94f-6d9bfd52c842
00020000-5658-7af3-7e61-c47de0d908f6	00030000-5658-7af2-f29a-06cf8e002f42
00020000-5658-7af3-c585-c4204ad22d23	00030000-5658-7af2-2744-c0a946ea61ea
00020000-5658-7af3-09e9-0e578275e861	00030000-5658-7af2-9558-509b16d7b5d6
00020000-5658-7af3-090e-c62f7195de3b	00030000-5658-7af2-4352-5a6b88f581c4
00020000-5658-7af3-090e-c62f7195de3b	00030000-5658-7af2-09b6-dd6b3c18c29b
00020000-5658-7af3-090e-c62f7195de3b	00030000-5658-7af2-0685-65253ca15e3f
\.


--
-- TOC entry 3139 (class 0 OID 30024000)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 30024034)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3155 (class 0 OID 30024171)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5658-7af4-9d29-cc6c1951388c	00090000-5658-7af4-d37c-71149a0f25c0	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5658-7af4-8f1f-1efa2dbce8da	00090000-5658-7af4-7729-fae1f7fe7355	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5658-7af4-afec-5ff2cf1806a5	00090000-5658-7af4-2a15-b1f98bc9168c	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5658-7af4-db85-e712b8d186cc	00090000-5658-7af4-eb53-d50fd6f14df8	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3110 (class 0 OID 30023692)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5658-7af4-d327-d6805f8beade	\N	00040000-5658-7af1-c9fa-326ddd61813d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-6aad-25f1679b8006	\N	00040000-5658-7af1-c9fa-326ddd61813d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5658-7af4-90ed-b50825d0ac3e	\N	00040000-5658-7af1-c9fa-326ddd61813d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-c42b-83ed49cfd907	\N	00040000-5658-7af1-c9fa-326ddd61813d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-d3a8-611f71f16f1e	\N	00040000-5658-7af1-c9fa-326ddd61813d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-a00f-2a9f3d26faa7	\N	00040000-5658-7af1-adde-592fc7785f77	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-d5fd-f643c45833e3	\N	00040000-5658-7af1-9e1c-d391bd97cd2b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-042b-b2db31118482	\N	00040000-5658-7af1-2033-e5b5b7fc7f15	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af4-5612-8506816188ad	\N	00040000-5658-7af1-5fc3-584e8056e015	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5658-7af5-f35b-399d7e3bda5c	\N	00040000-5658-7af1-c9fa-326ddd61813d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3113 (class 0 OID 30023737)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5658-7af1-6164-fb8bfa83d352	8341	Adlešiči
00050000-5658-7af1-3879-4132a5a6d165	5270	Ajdovščina
00050000-5658-7af1-0087-caeee4861b07	6280	Ankaran/Ancarano
00050000-5658-7af1-2899-e7059de69d2b	9253	Apače
00050000-5658-7af1-0ba0-288e2d149496	8253	Artiče
00050000-5658-7af1-e1b5-256f1cb4b091	4275	Begunje na Gorenjskem
00050000-5658-7af1-131d-9ed151d8ab54	1382	Begunje pri Cerknici
00050000-5658-7af1-8555-584da50b6515	9231	Beltinci
00050000-5658-7af1-df0c-5f0f4fdfc53b	2234	Benedikt
00050000-5658-7af1-9db7-c9f31e229abf	2345	Bistrica ob Dravi
00050000-5658-7af1-1eab-d794d87e62d3	3256	Bistrica ob Sotli
00050000-5658-7af1-12e4-9e7af7af1dac	8259	Bizeljsko
00050000-5658-7af1-456d-b54094f4d70f	1223	Blagovica
00050000-5658-7af1-f065-d689ca4a9c97	8283	Blanca
00050000-5658-7af1-7189-393c64f308e5	4260	Bled
00050000-5658-7af1-f06f-5d880a34fc27	4273	Blejska Dobrava
00050000-5658-7af1-f771-5a492a39a442	9265	Bodonci
00050000-5658-7af1-bb44-37f481faac1f	9222	Bogojina
00050000-5658-7af1-f5bb-26082b43f8cc	4263	Bohinjska Bela
00050000-5658-7af1-7945-bc993572f3f3	4264	Bohinjska Bistrica
00050000-5658-7af1-cb7b-656cecbcd020	4265	Bohinjsko jezero
00050000-5658-7af1-b061-8102ae32ce03	1353	Borovnica
00050000-5658-7af1-c2a7-eae22dfff43f	8294	Boštanj
00050000-5658-7af1-2b09-a12f04b4ee21	5230	Bovec
00050000-5658-7af1-6de8-bdcfbc721c18	5295	Branik
00050000-5658-7af1-1491-4bb2009f5061	3314	Braslovče
00050000-5658-7af1-3105-5d4dab237385	5223	Breginj
00050000-5658-7af1-4980-7c142d7e23a6	8280	Brestanica
00050000-5658-7af1-3301-241b268b6e64	2354	Bresternica
00050000-5658-7af1-cf1a-95ce33ee8e2b	4243	Brezje
00050000-5658-7af1-364a-731ae108793c	1351	Brezovica pri Ljubljani
00050000-5658-7af1-d095-674ffa25ba59	8250	Brežice
00050000-5658-7af1-9ee3-b4b7427e0f9d	4210	Brnik - Aerodrom
00050000-5658-7af1-9f45-99adcef3d87e	8321	Brusnice
00050000-5658-7af1-38d2-1a5ba51c3d3c	3255	Buče
00050000-5658-7af1-0eaf-8378e0fff3d1	8276	Bučka 
00050000-5658-7af1-757a-bc9f22301b1e	9261	Cankova
00050000-5658-7af1-8a56-bd70cb918587	3000	Celje 
00050000-5658-7af1-fc9a-a0fc0ef8e496	3001	Celje - poštni predali
00050000-5658-7af1-e8fb-4341075a50cd	4207	Cerklje na Gorenjskem
00050000-5658-7af1-cad5-9627694ca58c	8263	Cerklje ob Krki
00050000-5658-7af1-7639-af682ef3b2c2	1380	Cerknica
00050000-5658-7af1-f125-15366920241f	5282	Cerkno
00050000-5658-7af1-b1c9-9e1fbfffbcb0	2236	Cerkvenjak
00050000-5658-7af1-591e-9f7e44088be7	2215	Ceršak
00050000-5658-7af1-a594-45830d115664	2326	Cirkovce
00050000-5658-7af1-e9a1-e30752ae6ab9	2282	Cirkulane
00050000-5658-7af1-8f3c-7e9428aae6b7	5273	Col
00050000-5658-7af1-753e-5ad8c42ca654	8251	Čatež ob Savi
00050000-5658-7af1-1d8d-a58865b38f43	1413	Čemšenik
00050000-5658-7af1-5388-f50189a4850c	5253	Čepovan
00050000-5658-7af1-d3d4-0b75698da548	9232	Črenšovci
00050000-5658-7af1-4660-6ba9d6cc0ca2	2393	Črna na Koroškem
00050000-5658-7af1-415d-e71b6de9763c	6275	Črni Kal
00050000-5658-7af1-9d01-5b120cfff926	5274	Črni Vrh nad Idrijo
00050000-5658-7af1-8bb0-ce349c2ea182	5262	Črniče
00050000-5658-7af1-c049-e2d72861e4fd	8340	Črnomelj
00050000-5658-7af1-402e-c5fb2022f33c	6271	Dekani
00050000-5658-7af1-0766-429d03e3134e	5210	Deskle
00050000-5658-7af1-c852-2bfaa8239d02	2253	Destrnik
00050000-5658-7af1-2581-addaefab15e2	6215	Divača
00050000-5658-7af1-bd78-18329061a454	1233	Dob
00050000-5658-7af1-ce52-996ef0009cfd	3224	Dobje pri Planini
00050000-5658-7af1-9bb8-aef98ac15098	8257	Dobova
00050000-5658-7af1-8099-ae5ffd07749a	1423	Dobovec
00050000-5658-7af1-1ed8-6239c4b757ef	5263	Dobravlje
00050000-5658-7af1-5cb8-2aae20cf8c20	3204	Dobrna
00050000-5658-7af1-bf0c-94a493e4cb7d	8211	Dobrnič
00050000-5658-7af1-9ddd-32db502a800b	1356	Dobrova
00050000-5658-7af1-df63-a66510b2dbe2	9223	Dobrovnik/Dobronak 
00050000-5658-7af1-5ab9-a1c348b4d8ec	5212	Dobrovo v Brdih
00050000-5658-7af1-a1b1-1607068d7537	1431	Dol pri Hrastniku
00050000-5658-7af1-6806-84486610a2b9	1262	Dol pri Ljubljani
00050000-5658-7af1-ab7d-3292563ec076	1273	Dole pri Litiji
00050000-5658-7af1-73c8-6ca7ab4cf480	1331	Dolenja vas
00050000-5658-7af1-b433-f41bedb5dc68	8350	Dolenjske Toplice
00050000-5658-7af1-f420-abd66df9e3c4	1230	Domžale
00050000-5658-7af1-f170-81ffe8a0957e	2252	Dornava
00050000-5658-7af1-e73d-aeabea4a9276	5294	Dornberk
00050000-5658-7af1-f289-e2867fc11553	1319	Draga
00050000-5658-7af1-2261-688ec42cad8b	8343	Dragatuš
00050000-5658-7af1-7534-cff7d6ab06fe	3222	Dramlje
00050000-5658-7af1-593f-cbde53948916	2370	Dravograd
00050000-5658-7af1-65e1-46102c963db5	4203	Duplje
00050000-5658-7af1-a599-9df1c07466af	6221	Dutovlje
00050000-5658-7af1-c624-2815543641fa	8361	Dvor
00050000-5658-7af1-d7a5-13b4c657e2b9	2343	Fala
00050000-5658-7af1-9e1f-7c6c3587455f	9208	Fokovci
00050000-5658-7af1-db3e-842c278a3576	2313	Fram
00050000-5658-7af1-ee09-b6947373ae2d	3213	Frankolovo
00050000-5658-7af1-b310-c26d1e9137c6	1274	Gabrovka
00050000-5658-7af1-4f5e-c4c0e54d695b	8254	Globoko
00050000-5658-7af1-b497-39d6f4fcb322	5275	Godovič
00050000-5658-7af1-34a5-17759e56b85a	4204	Golnik
00050000-5658-7af1-8a63-d05466665d47	3303	Gomilsko
00050000-5658-7af1-0624-f57e8ee351cf	4224	Gorenja vas
00050000-5658-7af1-5723-5e876990f6a8	3263	Gorica pri Slivnici
00050000-5658-7af1-4201-2f9a82a43cca	2272	Gorišnica
00050000-5658-7af1-b53a-f2298a12a2dc	9250	Gornja Radgona
00050000-5658-7af1-006b-f552637d416d	3342	Gornji Grad
00050000-5658-7af1-d580-01099c18ada9	4282	Gozd Martuljek
00050000-5658-7af1-2c6e-184f8bf5ef83	6272	Gračišče
00050000-5658-7af1-f0aa-537b933a758e	9264	Grad
00050000-5658-7af1-aa73-672bedb6a2ad	8332	Gradac
00050000-5658-7af1-c5a9-e74826e102d0	1384	Grahovo
00050000-5658-7af1-4252-e4c5aa4abbf9	5242	Grahovo ob Bači
00050000-5658-7af1-acba-466f1601a6a2	5251	Grgar
00050000-5658-7af1-0b2b-dbbd4c2473cd	3302	Griže
00050000-5658-7af1-bac6-d07dcb36986a	3231	Grobelno
00050000-5658-7af1-0d74-cf6e68c66f85	1290	Grosuplje
00050000-5658-7af1-537e-45a20e525111	2288	Hajdina
00050000-5658-7af1-71a9-087786304441	8362	Hinje
00050000-5658-7af1-f945-c3012abfcc1d	2311	Hoče
00050000-5658-7af1-d251-775179f8873c	9205	Hodoš/Hodos
00050000-5658-7af1-8f91-e7a26c057ee9	1354	Horjul
00050000-5658-7af1-f058-d72933f4c8e4	1372	Hotedršica
00050000-5658-7af1-333b-1bfc800ad6a7	1430	Hrastnik
00050000-5658-7af1-c237-7ffd76ff9fb6	6225	Hruševje
00050000-5658-7af1-74b0-59bc81a6a91b	4276	Hrušica
00050000-5658-7af1-0392-507d58f7154d	5280	Idrija
00050000-5658-7af1-aec9-ac8a40445680	1292	Ig
00050000-5658-7af1-7840-8c96171781cc	6250	Ilirska Bistrica
00050000-5658-7af1-37fd-c157b799c329	6251	Ilirska Bistrica-Trnovo
00050000-5658-7af1-6c64-3a0605a370a9	1295	Ivančna Gorica
00050000-5658-7af1-0cee-a8081a5e5da2	2259	Ivanjkovci
00050000-5658-7af1-a803-316acbd02c6f	1411	Izlake
00050000-5658-7af1-dc70-65af5701f720	6310	Izola/Isola
00050000-5658-7af1-3880-42ff61319c3c	2222	Jakobski Dol
00050000-5658-7af1-2d69-981103ba71e1	2221	Jarenina
00050000-5658-7af1-23fe-c1ddf98ce789	6254	Jelšane
00050000-5658-7af1-0130-9c109293f6fc	4270	Jesenice
00050000-5658-7af1-2d0b-e2d9fb464a83	8261	Jesenice na Dolenjskem
00050000-5658-7af1-cc8e-eb29cb19fc08	3273	Jurklošter
00050000-5658-7af1-28ce-a2711c0f7e09	2223	Jurovski Dol
00050000-5658-7af1-5394-b1e3ef0db970	2256	Juršinci
00050000-5658-7af1-a187-fabd30d8d341	5214	Kal nad Kanalom
00050000-5658-7af1-4ef7-46c2afb3aa3c	3233	Kalobje
00050000-5658-7af1-d228-15224a4e51e4	4246	Kamna Gorica
00050000-5658-7af1-7529-c36fd3ef4de6	2351	Kamnica
00050000-5658-7af1-0812-412e9c2a53ef	1241	Kamnik
00050000-5658-7af1-e01a-00a252829094	5213	Kanal
00050000-5658-7af1-9380-908351ba4b9f	8258	Kapele
00050000-5658-7af1-2139-c5c8b88084c2	2362	Kapla
00050000-5658-7af1-93fb-7d150956a699	2325	Kidričevo
00050000-5658-7af1-4539-ac62026ed2c4	1412	Kisovec
00050000-5658-7af1-6886-8ab3d59331f8	6253	Knežak
00050000-5658-7af1-2ab4-6d4f3ead6bca	5222	Kobarid
00050000-5658-7af1-5c16-8bb0f46110ca	9227	Kobilje
00050000-5658-7af1-ea32-ded5b18e9444	1330	Kočevje
00050000-5658-7af1-0ab5-64e922ab59c7	1338	Kočevska Reka
00050000-5658-7af1-85c3-8f62bd3e408a	2276	Kog
00050000-5658-7af1-79d0-a187d99a4f54	5211	Kojsko
00050000-5658-7af1-2e8a-60cec8706307	6223	Komen
00050000-5658-7af1-5107-1b8347f38910	1218	Komenda
00050000-5658-7af1-d4ed-0083b128c59b	6000	Koper/Capodistria 
00050000-5658-7af1-00ec-d9f3c9fe60cb	6001	Koper/Capodistria - poštni predali
00050000-5658-7af1-7917-111dc99dc398	8282	Koprivnica
00050000-5658-7af1-7da0-bcd6e414eef0	5296	Kostanjevica na Krasu
00050000-5658-7af1-a671-e3cd8042e557	8311	Kostanjevica na Krki
00050000-5658-7af1-497d-5114eed7ee5b	1336	Kostel
00050000-5658-7af1-dd41-1715110fea8d	6256	Košana
00050000-5658-7af1-9f19-01d46ae35b4e	2394	Kotlje
00050000-5658-7af1-959d-2154f9603b1b	6240	Kozina
00050000-5658-7af1-9434-84ed41c90962	3260	Kozje
00050000-5658-7af1-be61-141dc4f16474	4000	Kranj 
00050000-5658-7af1-f287-57ce1599d43e	4001	Kranj - poštni predali
00050000-5658-7af1-46c0-cd128ce4692d	4280	Kranjska Gora
00050000-5658-7af1-ca1a-0460eb6900d7	1281	Kresnice
00050000-5658-7af1-2e73-d9ca22cc8e9c	4294	Križe
00050000-5658-7af1-b772-c2575402085f	9206	Križevci
00050000-5658-7af1-3e7c-35a3d5aa307d	9242	Križevci pri Ljutomeru
00050000-5658-7af1-8be2-66c672068d7c	1301	Krka
00050000-5658-7af1-92bf-7d82f2681d17	8296	Krmelj
00050000-5658-7af1-d6b6-39f8373abb2b	4245	Kropa
00050000-5658-7af1-bda4-a170ffb3a2ff	8262	Krška vas
00050000-5658-7af1-4563-9c7acffddb39	8270	Krško
00050000-5658-7af1-09d7-d02161e8b203	9263	Kuzma
00050000-5658-7af1-cd8c-24fa0036dfae	2318	Laporje
00050000-5658-7af1-ca4d-d700b65d795a	3270	Laško
00050000-5658-7af1-d847-18814b4ade3e	1219	Laze v Tuhinju
00050000-5658-7af1-aee1-87592260797b	2230	Lenart v Slovenskih goricah
00050000-5658-7af1-4652-1f021f85f119	9220	Lendava/Lendva
00050000-5658-7af1-0f9f-065356d4f399	4248	Lesce
00050000-5658-7af1-a91a-b8e06e57811a	3261	Lesično
00050000-5658-7af1-cb44-82d9aa1ae2a2	8273	Leskovec pri Krškem
00050000-5658-7af1-fe35-82f2471f8ca7	2372	Libeliče
00050000-5658-7af1-cd5a-90107eb42c50	2341	Limbuš
00050000-5658-7af1-e1ba-5b2acbe13c3f	1270	Litija
00050000-5658-7af1-0456-4b6ca2266a12	3202	Ljubečna
00050000-5658-7af1-c7f1-a16a89cce870	1000	Ljubljana 
00050000-5658-7af1-1d28-6fe0d3dfa37c	1001	Ljubljana - poštni predali
00050000-5658-7af1-42d9-8ca574243c4e	1231	Ljubljana - Črnuče
00050000-5658-7af1-caf2-cb9358c0c9cc	1261	Ljubljana - Dobrunje
00050000-5658-7af1-6eb0-7f6c96010ccd	1260	Ljubljana - Polje
00050000-5658-7af1-0d5e-6cf82440a00b	1210	Ljubljana - Šentvid
00050000-5658-7af1-b9a0-c96e7ceffdd5	1211	Ljubljana - Šmartno
00050000-5658-7af1-bc14-949cb48eed98	3333	Ljubno ob Savinji
00050000-5658-7af1-6027-70735cbd5184	9240	Ljutomer
00050000-5658-7af1-596c-53d0c6c2bd39	3215	Loče
00050000-5658-7af1-6892-b61b6ab3d0cb	5231	Log pod Mangartom
00050000-5658-7af1-2245-0e32d9fca3dd	1358	Log pri Brezovici
00050000-5658-7af1-a022-986b91c1e5b0	1370	Logatec
00050000-5658-7af1-b4bd-521ecea12733	1371	Logatec
00050000-5658-7af1-e2b4-fcb2c495b66a	1434	Loka pri Zidanem Mostu
00050000-5658-7af1-f426-616ae3e62f6e	3223	Loka pri Žusmu
00050000-5658-7af1-982a-3e185c891596	6219	Lokev
00050000-5658-7af1-759d-2b7a848d7ab2	1318	Loški Potok
00050000-5658-7af1-ada1-e52e908f4d70	2324	Lovrenc na Dravskem polju
00050000-5658-7af1-c8d1-0c3b88ed2d34	2344	Lovrenc na Pohorju
00050000-5658-7af1-d2d1-190aa9d1c1e6	3334	Luče
00050000-5658-7af1-89c1-324b71fff7af	1225	Lukovica
00050000-5658-7af1-3b5b-7aa9f9664988	9202	Mačkovci
00050000-5658-7af1-cf75-04ebe30f4e80	2322	Majšperk
00050000-5658-7af1-6c6a-947497774d55	2321	Makole
00050000-5658-7af1-68b0-f0acc6d2d8b3	9243	Mala Nedelja
00050000-5658-7af1-4038-6bc35c5d568a	2229	Malečnik
00050000-5658-7af1-5360-73fc633a5e30	6273	Marezige
00050000-5658-7af1-2c52-664f01476236	2000	Maribor 
00050000-5658-7af1-4a06-1c9b958655f1	2001	Maribor - poštni predali
00050000-5658-7af1-b6d2-4378e9d43a03	2206	Marjeta na Dravskem polju
00050000-5658-7af1-df3c-41f4ef45e329	2281	Markovci
00050000-5658-7af1-bccf-5e938d2a1710	9221	Martjanci
00050000-5658-7af1-f509-f59722b755e9	6242	Materija
00050000-5658-7af1-2104-bca018abfcde	4211	Mavčiče
00050000-5658-7af1-1094-a0f291b109ea	1215	Medvode
00050000-5658-7af1-f890-637ba611071a	1234	Mengeš
00050000-5658-7af1-936a-e4f5792dc001	8330	Metlika
00050000-5658-7af1-f251-aeb54e8fcedb	2392	Mežica
00050000-5658-7af1-d281-05c32cc4f4f5	2204	Miklavž na Dravskem polju
00050000-5658-7af1-6acf-bf773fa3fb49	2275	Miklavž pri Ormožu
00050000-5658-7af1-14d5-a1c7f93c8e83	5291	Miren
00050000-5658-7af1-9ca4-cf737aea4278	8233	Mirna
00050000-5658-7af1-ddc4-446b4bce5a75	8216	Mirna Peč
00050000-5658-7af1-442f-680c828aceb7	2382	Mislinja
00050000-5658-7af1-4c8e-f8bcae6a21d2	4281	Mojstrana
00050000-5658-7af1-9595-223dcf465752	8230	Mokronog
00050000-5658-7af1-6bb5-97d7c5652865	1251	Moravče
00050000-5658-7af1-f78d-9af8eee492d2	9226	Moravske Toplice
00050000-5658-7af1-93ab-7270b310eb06	5216	Most na Soči
00050000-5658-7af1-47cd-913d2d712852	1221	Motnik
00050000-5658-7af1-bff8-710637851876	3330	Mozirje
00050000-5658-7af1-5e42-e33f94385b22	9000	Murska Sobota 
00050000-5658-7af1-a771-7e5f815a48de	9001	Murska Sobota - poštni predali
00050000-5658-7af1-b23b-f01d9411dd7d	2366	Muta
00050000-5658-7af1-093b-c9799704897b	4202	Naklo
00050000-5658-7af1-96cf-b606e46cdad4	3331	Nazarje
00050000-5658-7af1-af52-af95bbe944fa	1357	Notranje Gorice
00050000-5658-7af1-1816-1c688f77a753	3203	Nova Cerkev
00050000-5658-7af1-5a7c-8ac1993c4f52	5000	Nova Gorica 
00050000-5658-7af1-e14a-9e542d65a50e	5001	Nova Gorica - poštni predali
00050000-5658-7af1-ea20-498d4f8ff7ee	1385	Nova vas
00050000-5658-7af1-dd0b-c9263b698907	8000	Novo mesto
00050000-5658-7af1-2736-c30f30481585	8001	Novo mesto - poštni predali
00050000-5658-7af1-a1f6-deecb4de6d1d	6243	Obrov
00050000-5658-7af1-a4fe-eeb64e88a0fd	9233	Odranci
00050000-5658-7af1-3594-58bf746e097c	2317	Oplotnica
00050000-5658-7af1-ed44-29e56012dd0d	2312	Orehova vas
00050000-5658-7af1-6e93-10e2872d11e9	2270	Ormož
00050000-5658-7af1-3ac2-30efe9b6238b	1316	Ortnek
00050000-5658-7af1-7b68-922e6362e14a	1337	Osilnica
00050000-5658-7af1-72bb-61480e75b87a	8222	Otočec
00050000-5658-7af1-81e0-4b3f8e444241	2361	Ožbalt
00050000-5658-7af1-6d14-cf30ba1876f4	2231	Pernica
00050000-5658-7af1-0602-11cc3d7c12ab	2211	Pesnica pri Mariboru
00050000-5658-7af1-e9a7-6d451ae3567a	9203	Petrovci
00050000-5658-7af1-5411-e893773a83bf	3301	Petrovče
00050000-5658-7af1-fd33-e7ed41538c99	6330	Piran/Pirano
00050000-5658-7af1-c32f-ae615d259a19	8255	Pišece
00050000-5658-7af1-19ad-058c3268af23	6257	Pivka
00050000-5658-7af1-20af-86dea95c3e4d	6232	Planina
00050000-5658-7af1-912e-cdf35a835d28	3225	Planina pri Sevnici
00050000-5658-7af1-abab-f644b23161d1	6276	Pobegi
00050000-5658-7af1-d3cc-d8a45bff9fad	8312	Podbočje
00050000-5658-7af1-f68c-b3926789b01d	5243	Podbrdo
00050000-5658-7af1-db07-64ca8c68b328	3254	Podčetrtek
00050000-5658-7af1-e43e-e61fee953a95	2273	Podgorci
00050000-5658-7af1-39a6-27b0f6100a07	6216	Podgorje
00050000-5658-7af1-1839-fe0406131678	2381	Podgorje pri Slovenj Gradcu
00050000-5658-7af1-a53e-2e2168ea5ade	6244	Podgrad
00050000-5658-7af1-6158-df06e589e7a6	1414	Podkum
00050000-5658-7af1-8056-bef0342636f1	2286	Podlehnik
00050000-5658-7af1-c1db-758e9bf655b5	5272	Podnanos
00050000-5658-7af1-914b-95b1c6e1b99a	4244	Podnart
00050000-5658-7af1-026e-ab42804e3b3e	3241	Podplat
00050000-5658-7af1-9e1c-3da9315e9fb6	3257	Podsreda
00050000-5658-7af1-8930-ead248cf88f9	2363	Podvelka
00050000-5658-7af1-f1a8-2e5fcea67d97	2208	Pohorje
00050000-5658-7af1-eca5-a5af15c941c6	2257	Polenšak
00050000-5658-7af1-2dcb-c4edbd68260f	1355	Polhov Gradec
00050000-5658-7af1-ebfe-bac83f11520e	4223	Poljane nad Škofjo Loko
00050000-5658-7af1-cdde-fdaee48c96ce	2319	Poljčane
00050000-5658-7af1-a81b-7e7179f9077d	1272	Polšnik
00050000-5658-7af1-e0ba-74a8ac3a3032	3313	Polzela
00050000-5658-7af1-2973-6bfe9ddf1648	3232	Ponikva
00050000-5658-7af1-764d-4a1602eae7a5	6320	Portorož/Portorose
00050000-5658-7af1-3d71-d46da31080e5	6230	Postojna
00050000-5658-7af1-5f53-74f953469e6e	2331	Pragersko
00050000-5658-7af1-6465-0cd65959159c	3312	Prebold
00050000-5658-7af1-08a9-03dbb44391fe	4205	Preddvor
00050000-5658-7af1-a9c7-7d3769b4c06d	6255	Prem
00050000-5658-7af1-b138-1f893bbe5d39	1352	Preserje
00050000-5658-7af1-31bd-6fd39c6e4fc9	6258	Prestranek
00050000-5658-7af1-0621-3146786b1a6f	2391	Prevalje
00050000-5658-7af1-cecc-c28b48f17539	3262	Prevorje
00050000-5658-7af1-b2f8-3d1df8a2617b	1276	Primskovo 
00050000-5658-7af1-1f5f-835f23827170	3253	Pristava pri Mestinju
00050000-5658-7af1-202b-a8c7ebc69e7e	9207	Prosenjakovci/Partosfalva
00050000-5658-7af1-e9ef-0617b4a6e893	5297	Prvačina
00050000-5658-7af1-3762-4059a0d49cbf	2250	Ptuj
00050000-5658-7af1-ff47-8cb24f17adf5	2323	Ptujska Gora
00050000-5658-7af1-e8e7-98d4277e7b34	9201	Puconci
00050000-5658-7af1-5266-b6e9b52cadf1	2327	Rače
00050000-5658-7af1-3657-434505b03e85	1433	Radeče
00050000-5658-7af1-ae64-454e33c72c9c	9252	Radenci
00050000-5658-7af1-2cc3-63d1da6d78b3	2360	Radlje ob Dravi
00050000-5658-7af1-f721-dd8ac0562181	1235	Radomlje
00050000-5658-7af1-bd9e-caa513e9e0b0	4240	Radovljica
00050000-5658-7af1-72db-4c8abc50da53	8274	Raka
00050000-5658-7af1-bb33-5df28d0c7dda	1381	Rakek
00050000-5658-7af1-2b7b-32aa8536d085	4283	Rateče - Planica
00050000-5658-7af1-da35-595bdeef99f9	2390	Ravne na Koroškem
00050000-5658-7af1-5b9c-9428304dce75	9246	Razkrižje
00050000-5658-7af1-5ae7-ffe7d212cf05	3332	Rečica ob Savinji
00050000-5658-7af1-0538-9d3c78a3a0b1	5292	Renče
00050000-5658-7af1-26df-b404553ef672	1310	Ribnica
00050000-5658-7af1-da63-57dc9f8aeeec	2364	Ribnica na Pohorju
00050000-5658-7af1-aa6f-ef8484cdf880	3272	Rimske Toplice
00050000-5658-7af1-87b5-cb83f25b06a5	1314	Rob
00050000-5658-7af1-1e71-1e04674ec227	5215	Ročinj
00050000-5658-7af1-9b1d-5351263ca7a9	3250	Rogaška Slatina
00050000-5658-7af1-5a9e-f45c9552eb80	9262	Rogašovci
00050000-5658-7af1-bd06-f3630905827b	3252	Rogatec
00050000-5658-7af1-8419-e4b090e45096	1373	Rovte
00050000-5658-7af1-457f-ea01d2265db8	2342	Ruše
00050000-5658-7af1-6858-85d06268cb6e	1282	Sava
00050000-5658-7af1-32b7-92489177308f	6333	Sečovlje/Sicciole
00050000-5658-7af1-85a0-c32fd169a2d4	4227	Selca
00050000-5658-7af1-223f-491856639bca	2352	Selnica ob Dravi
00050000-5658-7af1-4f98-2d7568b0330c	8333	Semič
00050000-5658-7af1-5832-ae3e2b2edc11	8281	Senovo
00050000-5658-7af1-a30e-5298d8e3fbfd	6224	Senožeče
00050000-5658-7af1-7367-afd15ce3037b	8290	Sevnica
00050000-5658-7af1-ec19-66ce1c42c597	6210	Sežana
00050000-5658-7af1-77e1-01069a4e9733	2214	Sladki Vrh
00050000-5658-7af1-eeb0-83b86866cc1f	5283	Slap ob Idrijci
00050000-5658-7af1-a732-e86ecc70fb3b	2380	Slovenj Gradec
00050000-5658-7af1-9e70-0599f20405f0	2310	Slovenska Bistrica
00050000-5658-7af1-e119-a3d18cbb23d0	3210	Slovenske Konjice
00050000-5658-7af1-a81c-16d6ef49254d	1216	Smlednik
00050000-5658-7af1-986c-c5f77866ff78	5232	Soča
00050000-5658-7af1-58f9-f2ca4ea571c4	1317	Sodražica
00050000-5658-7af1-de67-171f66ee0373	3335	Solčava
00050000-5658-7af1-cdfc-a3863dca160a	5250	Solkan
00050000-5658-7af1-929f-d4325aabb187	4229	Sorica
00050000-5658-7af1-9fe1-c11f718c3b24	4225	Sovodenj
00050000-5658-7af1-fe3b-fe72b696e283	5281	Spodnja Idrija
00050000-5658-7af1-6e68-61e72c7f23f8	2241	Spodnji Duplek
00050000-5658-7af1-3aa3-870eae431496	9245	Spodnji Ivanjci
00050000-5658-7af1-e7ce-3e22f7c14f43	2277	Središče ob Dravi
00050000-5658-7af1-ce8b-e095d802a7a2	4267	Srednja vas v Bohinju
00050000-5658-7af1-bf8e-f64e23c4cf53	8256	Sromlje 
00050000-5658-7af1-a51b-8d6d31e4c20f	5224	Srpenica
00050000-5658-7af1-8f99-bd93dbf5b6c3	1242	Stahovica
00050000-5658-7af1-dc97-7a8227326d5f	1332	Stara Cerkev
00050000-5658-7af1-5b40-d40bef4cd404	8342	Stari trg ob Kolpi
00050000-5658-7af1-5f94-0c30f69b43e8	1386	Stari trg pri Ložu
00050000-5658-7af1-7e70-d21cf1b55dee	2205	Starše
00050000-5658-7af1-509c-a41c92f4b392	2289	Stoperce
00050000-5658-7af1-e3e6-e9d6e75413a4	8322	Stopiče
00050000-5658-7af1-6e20-2942e7f9eb48	3206	Stranice
00050000-5658-7af1-12d9-a0f08486e07d	8351	Straža
00050000-5658-7af1-99ea-068e76c3a19f	1313	Struge
00050000-5658-7af1-a39c-da30b3e06ddf	8293	Studenec
00050000-5658-7af1-13e5-34fd7ee0b60e	8331	Suhor
00050000-5658-7af1-e27f-2067b703063e	2233	Sv. Ana v Slovenskih goricah
00050000-5658-7af1-36fc-38967bfec157	2235	Sv. Trojica v Slovenskih goricah
00050000-5658-7af1-1a89-df96142f9e60	2353	Sveti Duh na Ostrem Vrhu
00050000-5658-7af1-085e-57ed465e7f96	9244	Sveti Jurij ob Ščavnici
00050000-5658-7af1-0246-d11f240b1005	3264	Sveti Štefan
00050000-5658-7af1-20f5-11581ad4b37f	2258	Sveti Tomaž
00050000-5658-7af1-0438-8cbd408ad767	9204	Šalovci
00050000-5658-7af1-40db-0fb2923faa8a	5261	Šempas
00050000-5658-7af1-0916-c416a9036fe2	5290	Šempeter pri Gorici
00050000-5658-7af1-aebb-81a04551868a	3311	Šempeter v Savinjski dolini
00050000-5658-7af1-1442-8e9d80ee0738	4208	Šenčur
00050000-5658-7af1-67d1-5c4433fc366e	2212	Šentilj v Slovenskih goricah
00050000-5658-7af1-fde4-b9fe90d4742d	8297	Šentjanž
00050000-5658-7af1-1450-f377d4e9073c	2373	Šentjanž pri Dravogradu
00050000-5658-7af1-b78e-dead98d2d4d7	8310	Šentjernej
00050000-5658-7af1-2b8a-c2250bb31605	3230	Šentjur
00050000-5658-7af1-2d99-01bf9eedc74b	3271	Šentrupert
00050000-5658-7af1-63e6-a2b7d0c48483	8232	Šentrupert
00050000-5658-7af1-e599-ba4411a76b4c	1296	Šentvid pri Stični
00050000-5658-7af1-630d-d64d779ced7f	8275	Škocjan
00050000-5658-7af1-fd1d-6ae74a56a52e	6281	Škofije
00050000-5658-7af1-ec88-9e7e7d0ed471	4220	Škofja Loka
00050000-5658-7af1-5812-2ac44dd13120	3211	Škofja vas
00050000-5658-7af1-26a8-0a5ee8981bad	1291	Škofljica
00050000-5658-7af1-507e-85578e19a01a	6274	Šmarje
00050000-5658-7af1-2dde-9ad30934920f	1293	Šmarje - Sap
00050000-5658-7af1-7ed2-52b649f01c4f	3240	Šmarje pri Jelšah
00050000-5658-7af1-351b-80fcfe5a4b79	8220	Šmarješke Toplice
00050000-5658-7af1-dc09-77be23853867	2315	Šmartno na Pohorju
00050000-5658-7af1-1e08-37be42fda99d	3341	Šmartno ob Dreti
00050000-5658-7af1-cbed-66ba919533e3	3327	Šmartno ob Paki
00050000-5658-7af1-61e8-108a8907ef1d	1275	Šmartno pri Litiji
00050000-5658-7af1-c211-37779c5bb37f	2383	Šmartno pri Slovenj Gradcu
00050000-5658-7af1-dbf8-eb376060810a	3201	Šmartno v Rožni dolini
00050000-5658-7af1-9c86-967ac70bb437	3325	Šoštanj
00050000-5658-7af1-4908-494067936a32	6222	Štanjel
00050000-5658-7af1-ebbc-e0c431a8f411	3220	Štore
00050000-5658-7af1-9753-a1982251096e	3304	Tabor
00050000-5658-7af1-afd9-63c079f8626f	3221	Teharje
00050000-5658-7af1-2a7a-c9a4244d2e24	9251	Tišina
00050000-5658-7af1-274d-40ff7e119ea5	5220	Tolmin
00050000-5658-7af1-8a72-281f7ddb37f1	3326	Topolšica
00050000-5658-7af1-060b-85b2d9ec7983	2371	Trbonje
00050000-5658-7af1-ad0f-7854f48e960f	1420	Trbovlje
00050000-5658-7af1-655b-956f6cf18696	8231	Trebelno 
00050000-5658-7af1-c2e6-0b91863c8392	8210	Trebnje
00050000-5658-7af1-4d04-5fbedae014f8	5252	Trnovo pri Gorici
00050000-5658-7af1-2717-1a6f7d16d7f0	2254	Trnovska vas
00050000-5658-7af1-c257-f124eabf5936	1222	Trojane
00050000-5658-7af1-4785-12cb068b1fb8	1236	Trzin
00050000-5658-7af1-7edf-73805b58a09f	4290	Tržič
00050000-5658-7af1-661a-408ea0547884	8295	Tržišče
00050000-5658-7af1-5d32-51a43b7f704f	1311	Turjak
00050000-5658-7af1-5c06-9e376dd1f751	9224	Turnišče
00050000-5658-7af1-4b25-d2cf68701bf2	8323	Uršna sela
00050000-5658-7af1-f0e2-f81a9b484359	1252	Vače
00050000-5658-7af1-44ea-a06a798fa2f3	3320	Velenje 
00050000-5658-7af1-e204-b504627face5	3322	Velenje - poštni predali
00050000-5658-7af1-e2bd-281d690e1cde	8212	Velika Loka
00050000-5658-7af1-8417-e9d5031316ed	2274	Velika Nedelja
00050000-5658-7af1-5cd6-9a18adc487f1	9225	Velika Polana
00050000-5658-7af1-f1e7-0f659ec84542	1315	Velike Lašče
00050000-5658-7af1-a96b-66d5c0e4b49d	8213	Veliki Gaber
00050000-5658-7af1-5f84-3d13fc8b1058	9241	Veržej
00050000-5658-7af1-e8ce-374c96e32a8c	1312	Videm - Dobrepolje
00050000-5658-7af1-9286-cf2e1fd2055a	2284	Videm pri Ptuju
00050000-5658-7af1-140c-cf9cc999cea4	8344	Vinica
00050000-5658-7af1-7c9c-30fc0b116c4e	5271	Vipava
00050000-5658-7af1-bcd2-915cbbc582e2	4212	Visoko
00050000-5658-7af1-d898-3b11f207c1a8	1294	Višnja Gora
00050000-5658-7af1-9377-09197641463b	3205	Vitanje
00050000-5658-7af1-309c-1342ac88a0c4	2255	Vitomarci
00050000-5658-7af1-d719-92a21d3112e9	1217	Vodice
00050000-5658-7af1-c9ca-1d3873eec905	3212	Vojnik\t
00050000-5658-7af1-f611-e44f845b00aa	5293	Volčja Draga
00050000-5658-7af1-22b8-7e71441f6994	2232	Voličina
00050000-5658-7af1-4e3e-9f013f8a70ab	3305	Vransko
00050000-5658-7af1-1d9b-b5bcdc2ee0c6	6217	Vremski Britof
00050000-5658-7af1-fabb-d20cbbf5e26e	1360	Vrhnika
00050000-5658-7af1-d29a-9c312d652d6e	2365	Vuhred
00050000-5658-7af1-e406-e625d9d19c8f	2367	Vuzenica
00050000-5658-7af1-fb40-dfda1167680c	8292	Zabukovje 
00050000-5658-7af1-e5d4-57f2017c82a0	1410	Zagorje ob Savi
00050000-5658-7af1-0e4e-c704d1130a9d	1303	Zagradec
00050000-5658-7af1-c66c-fc2e2bece4fb	2283	Zavrč
00050000-5658-7af1-8157-beda9b210e02	8272	Zdole 
00050000-5658-7af1-97da-22b322fc5068	4201	Zgornja Besnica
00050000-5658-7af1-6bee-f19d9341aae8	2242	Zgornja Korena
00050000-5658-7af1-2180-96c47f1e9d1b	2201	Zgornja Kungota
00050000-5658-7af1-45b2-6c12b277f6fd	2316	Zgornja Ložnica
00050000-5658-7af1-eca1-c776984e0be1	2314	Zgornja Polskava
00050000-5658-7af1-4124-5badfb91f365	2213	Zgornja Velka
00050000-5658-7af1-542b-4a350fa19c63	4247	Zgornje Gorje
00050000-5658-7af1-9518-36f5faf198ca	4206	Zgornje Jezersko
00050000-5658-7af1-4e19-37fe43353f83	2285	Zgornji Leskovec
00050000-5658-7af1-0c15-bdaca60a6a64	1432	Zidani Most
00050000-5658-7af1-f547-fbbb83b0a6e6	3214	Zreče
00050000-5658-7af1-2641-916e10ca21f2	4209	Žabnica
00050000-5658-7af1-e956-3a1a38a0caae	3310	Žalec
00050000-5658-7af1-516e-ac579b08e13b	4228	Železniki
00050000-5658-7af1-5ca7-d966d113f71c	2287	Žetale
00050000-5658-7af1-ca97-9af653fa7df8	4226	Žiri
00050000-5658-7af1-2bb0-a0fddd0776be	4274	Žirovnica
00050000-5658-7af1-4f29-581161de32cc	8360	Žužemberk
\.


--
-- TOC entry 3162 (class 0 OID 30024398)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3135 (class 0 OID 30023974)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 30023722)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5658-7af4-af76-31f1bb7783b8	00080000-5658-7af4-d327-d6805f8beade	\N	00040000-5658-7af1-c9fa-326ddd61813d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5658-7af4-a042-f13069b13d4f	00080000-5658-7af4-d327-d6805f8beade	\N	00040000-5658-7af1-c9fa-326ddd61813d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5658-7af4-a74f-8cc5777dafae	00080000-5658-7af4-6aad-25f1679b8006	\N	00040000-5658-7af1-c9fa-326ddd61813d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3124 (class 0 OID 30023866)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5658-7af2-ad7f-c19f58de1e8b	novo leto	1	1	\N	t
00430000-5658-7af2-760c-e638744b2f13	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5658-7af2-f1b9-e38e83a08292	dan upora proti okupatorju	27	4	\N	t
00430000-5658-7af2-9161-515cf706ad73	praznik dela	1	5	\N	t
00430000-5658-7af2-a57d-dbcea920da6d	praznik dela	2	5	\N	t
00430000-5658-7af2-2eed-4b138f20e3dc	dan Primoža Trubarja	8	6	\N	f
00430000-5658-7af2-602c-aea831da5524	dan državnosti	25	6	\N	t
00430000-5658-7af2-8dca-94074148d070	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5658-7af2-0c2f-c1c85c60f06b	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5658-7af2-cef6-6b8e963faec3	dan suverenosti	25	10	\N	f
00430000-5658-7af2-de3f-101dda42a46f	dan spomina na mrtve	1	11	\N	t
00430000-5658-7af2-9a67-ccd36757bf0a	dan Rudolfa Maistra	23	11	\N	f
00430000-5658-7af2-fe3a-9e528a001417	božič	25	12	\N	t
00430000-5658-7af2-a9b1-f90f389788c5	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5658-7af2-8bf4-0c80fd4e56ff	Marijino vnebovzetje	15	8	\N	t
00430000-5658-7af2-ed0e-bc3fc242750f	dan reformacije	31	10	\N	t
00430000-5658-7af2-77f4-2a545bfc7759	velikonočna nedelja	27	3	2016	t
00430000-5658-7af2-1caa-be48bda5d42e	velikonočna nedelja	16	4	2017	t
00430000-5658-7af2-b903-6f2ce81051a7	velikonočna nedelja	1	4	2018	t
00430000-5658-7af2-21d3-f0f799ee934a	velikonočna nedelja	21	4	2019	t
00430000-5658-7af2-02c4-4da4e0586711	velikonočna nedelja	12	4	2020	t
00430000-5658-7af2-1d8c-92945c48b4e0	velikonočna nedelja	4	4	2021	t
00430000-5658-7af2-535b-9241e218e65c	velikonočna nedelja	17	4	2022	t
00430000-5658-7af2-c95e-1f8f5f42d643	velikonočna nedelja	9	4	2023	t
00430000-5658-7af2-b5cd-fb3d0a4ae757	velikonočna nedelja	31	3	2024	t
00430000-5658-7af2-8fed-e327203db698	velikonočna nedelja	20	4	2025	t
00430000-5658-7af2-006d-858f6fbb9f73	velikonočna nedelja	5	4	2026	t
00430000-5658-7af2-b686-387b794857ff	velikonočna nedelja	28	3	2027	t
00430000-5658-7af2-b0b6-2005dae734e7	velikonočna nedelja	16	4	2028	t
00430000-5658-7af2-8cec-f9a57ae00b4f	velikonočna nedelja	1	4	2029	t
00430000-5658-7af2-0546-e889d7069719	velikonočna nedelja	21	4	2030	t
00430000-5658-7af2-9c28-6dcde9577690	velikonočni ponedeljek	28	3	2016	t
00430000-5658-7af2-4c6f-50196286ed62	velikonočni ponedeljek	17	4	2017	t
00430000-5658-7af2-21e0-bf3742e5d791	velikonočni ponedeljek	2	4	2018	t
00430000-5658-7af2-ab04-340267f3886d	velikonočni ponedeljek	22	4	2019	t
00430000-5658-7af2-10fe-e76a618164b0	velikonočni ponedeljek	13	4	2020	t
00430000-5658-7af2-cdf6-8dad0d36f38e	velikonočni ponedeljek	5	4	2021	t
00430000-5658-7af2-94ba-401d4954af9a	velikonočni ponedeljek	18	4	2022	t
00430000-5658-7af2-4d51-894255a1cec7	velikonočni ponedeljek	10	4	2023	t
00430000-5658-7af2-7c0c-10299d73a118	velikonočni ponedeljek	1	4	2024	t
00430000-5658-7af2-6548-e2e85e3f3458	velikonočni ponedeljek	21	4	2025	t
00430000-5658-7af2-cee0-2a9e51f2e0a4	velikonočni ponedeljek	6	4	2026	t
00430000-5658-7af2-66fd-50d7989b30a7	velikonočni ponedeljek	29	3	2027	t
00430000-5658-7af2-1d05-966428ab6ac8	velikonočni ponedeljek	17	4	2028	t
00430000-5658-7af2-a424-fbb86d98c452	velikonočni ponedeljek	2	4	2029	t
00430000-5658-7af2-f0d3-2324013feacf	velikonočni ponedeljek	22	4	2030	t
00430000-5658-7af2-e702-98f47ac85751	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5658-7af2-eee0-76636e025c48	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5658-7af2-0164-a3cc0be24837	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5658-7af2-36ed-75297ded4e58	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5658-7af2-3350-0aabd51874f1	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5658-7af2-3c32-b78ec8675001	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5658-7af2-d957-c04d9412db29	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5658-7af2-fdd9-c0fd58d91347	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5658-7af2-c3e6-42e5640386a5	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5658-7af2-e76f-33faa72c0883	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5658-7af2-d8b2-c676dbee4a5f	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5658-7af2-eb64-cc853a7c5f7d	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5658-7af2-d148-7ec91967ef04	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5658-7af2-b0e7-a2782ca71fcd	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5658-7af2-e9c1-e13eaf395150	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3120 (class 0 OID 30023826)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 30023838)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 30023986)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 30024412)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 30024422)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5658-7af4-79dc-ef6d337c2eb3	00080000-5658-7af4-90ed-b50825d0ac3e	0987	AK
00190000-5658-7af4-7983-8dbcd13f53a5	00080000-5658-7af4-6aad-25f1679b8006	0989	AK
00190000-5658-7af4-2099-aad0434cb6bc	00080000-5658-7af4-c42b-83ed49cfd907	0986	AK
00190000-5658-7af4-0fa1-4aa1d94d626f	00080000-5658-7af4-a00f-2a9f3d26faa7	0984	AK
00190000-5658-7af4-4675-ff8d6b38a4db	00080000-5658-7af4-d5fd-f643c45833e3	0983	AK
00190000-5658-7af4-f2bc-8d89ae85234b	00080000-5658-7af4-042b-b2db31118482	0982	AK
00190000-5658-7af5-71bc-0a2a0b4a35e5	00080000-5658-7af5-f35b-399d7e3bda5c	1001	AK
\.


--
-- TOC entry 3161 (class 0 OID 30024321)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5658-7af4-4a3c-eed133b50299	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3165 (class 0 OID 30024430)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 30024015)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5658-7af3-35e4-986d06d4de8c	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5658-7af3-4290-2dda9e28930a	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5658-7af3-7ede-4e60c7a7943c	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5658-7af3-638c-ace613e1b8c9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5658-7af3-2a6b-ada9b0de6a0b	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5658-7af3-240e-f9502701270b	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5658-7af3-1b8b-0186d2a6f11e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3133 (class 0 OID 30023959)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 30023949)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 30024160)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 30024090)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3118 (class 0 OID 30023800)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 30023562)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5658-7af5-f35b-399d7e3bda5c	00010000-5658-7af2-362d-2765abbb7519	2015-11-27 16:47:01	INS	a:0:{}
2	App\\Entity\\Option	00000000-5658-7af5-6362-405f98a2721a	00010000-5658-7af2-362d-2765abbb7519	2015-11-27 16:47:01	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5658-7af5-71bc-0a2a0b4a35e5	00010000-5658-7af2-362d-2765abbb7519	2015-11-27 16:47:01	INS	a:0:{}
\.


--
-- TOC entry 3186 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3142 (class 0 OID 30024028)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3101 (class 0 OID 30023600)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5658-7af2-8701-ec27d7c27a5b	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5658-7af2-6c04-8f4cad1593ec	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5658-7af2-2e22-f89f0d42f121	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5658-7af2-4d21-c9a782aabbfe	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5658-7af2-0a8c-309fd1dedc3c	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5658-7af2-4f36-9a2c709ac970	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5658-7af2-2643-10daf4874887	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5658-7af2-82a5-1bd646f4b8ff	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5658-7af2-9320-28177d41ca6f	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5658-7af2-794e-ac8952c71d3a	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5658-7af2-742b-4544ce3ccab0	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5658-7af2-2822-8d59916c31b9	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5658-7af2-ab6c-01a9570f35f3	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5658-7af2-5116-0f04474ee56d	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5658-7af2-0842-eabd651c5dbc	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5658-7af2-d1b6-d366ddfaa2eb	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5658-7af2-88f3-809b69003670	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5658-7af2-b65c-80cb39b62fb4	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5658-7af2-b64b-3d23c6796391	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5658-7af2-713d-2dc06bbb7560	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5658-7af2-eefd-7b0999f29e4c	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5658-7af2-75c4-d2651ef31065	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5658-7af2-d090-9f55b6d6792c	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5658-7af2-7fce-ce45c14aecce	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5658-7af2-a07f-df8ba44c9760	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5658-7af2-67bd-33e4a1828173	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5658-7af2-b627-4345c47f4392	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5658-7af2-1199-af10299b47a3	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5658-7af2-bd21-4e47a7634f6e	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5658-7af2-f5ef-c7d648b441d1	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5658-7af2-42e2-7b8b7ed19043	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5658-7af2-9983-b74cc67417c2	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5658-7af2-696f-8eb05ff92b15	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5658-7af2-1f77-aeb6703b566f	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5658-7af2-2763-c259b4591bdc	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5658-7af2-4721-4a4e0d79955d	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5658-7af2-1e6a-1dbe59c84472	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5658-7af2-363b-9c24e7808849	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5658-7af2-0dd7-ba2dc29f5afe	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5658-7af3-4170-ae41055201ad	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5658-7af3-7508-d18a4e2c7607	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-7aa5-9066c20bbb57	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-a49a-1f2d0f9dad2a	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-8bb8-61232dddad8f	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-b4f5-9852eb2f3834	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-ae54-32d6445db9f8	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-4f7c-ce3b5a11d9dc	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-1629-a7b0a03c1d91	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-bcaf-33eb5916662c	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-c6e7-ae98e8ce8c84	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-ef76-31211e0dcb9a	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-12ef-0b013dd1c29a	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-f0e5-d37210254943	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-7e61-c47de0d908f6	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-c585-c4204ad22d23	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-09e9-0e578275e861	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5658-7af3-090e-c62f7195de3b	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
\.


--
-- TOC entry 3099 (class 0 OID 30023584)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5658-7af2-367a-b0d302ac16b2	00020000-5658-7af2-2e22-f89f0d42f121
00010000-5658-7af2-362d-2765abbb7519	00020000-5658-7af2-2e22-f89f0d42f121
00010000-5658-7af4-351f-642190332c4e	00020000-5658-7af3-4170-ae41055201ad
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-7508-d18a4e2c7607
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-b4f5-9852eb2f3834
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-bcaf-33eb5916662c
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-ef76-31211e0dcb9a
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-7e61-c47de0d908f6
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-09e9-0e578275e861
00010000-5658-7af4-6e3e-c6ce2c715fd4	00020000-5658-7af3-a49a-1f2d0f9dad2a
00010000-5658-7af4-fe1b-0bae6d06c59e	00020000-5658-7af3-7508-d18a4e2c7607
00010000-5658-7af4-fe1b-0bae6d06c59e	00020000-5658-7af3-7aa5-9066c20bbb57
00010000-5658-7af4-fe1b-0bae6d06c59e	00020000-5658-7af3-a49a-1f2d0f9dad2a
00010000-5658-7af4-fe1b-0bae6d06c59e	00020000-5658-7af3-8bb8-61232dddad8f
00010000-5658-7af4-cd9c-d422a35f4c9d	00020000-5658-7af3-7508-d18a4e2c7607
00010000-5658-7af4-cd9c-d422a35f4c9d	00020000-5658-7af3-7aa5-9066c20bbb57
00010000-5658-7af4-cd9c-d422a35f4c9d	00020000-5658-7af3-a49a-1f2d0f9dad2a
00010000-5658-7af4-cd9c-d422a35f4c9d	00020000-5658-7af3-8bb8-61232dddad8f
00010000-5658-7af4-cd9c-d422a35f4c9d	00020000-5658-7af3-ef76-31211e0dcb9a
00010000-5658-7af4-d182-f83639f8c698	00020000-5658-7af3-7aa5-9066c20bbb57
00010000-5658-7af4-d182-f83639f8c698	00020000-5658-7af3-ae54-32d6445db9f8
00010000-5658-7af4-d182-f83639f8c698	00020000-5658-7af3-c6e7-ae98e8ce8c84
00010000-5658-7af4-d182-f83639f8c698	00020000-5658-7af3-12ef-0b013dd1c29a
00010000-5658-7af4-d182-f83639f8c698	00020000-5658-7af3-ef76-31211e0dcb9a
00010000-5658-7af4-d182-f83639f8c698	00020000-5658-7af3-c585-c4204ad22d23
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-7aa5-9066c20bbb57
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-ae54-32d6445db9f8
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-1629-a7b0a03c1d91
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-c6e7-ae98e8ce8c84
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-12ef-0b013dd1c29a
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-ef76-31211e0dcb9a
00010000-5658-7af4-7c00-57c50189da22	00020000-5658-7af3-c585-c4204ad22d23
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-7aa5-9066c20bbb57
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-a49a-1f2d0f9dad2a
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-ae54-32d6445db9f8
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-4f7c-ce3b5a11d9dc
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-1629-a7b0a03c1d91
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-b4f5-9852eb2f3834
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-c6e7-ae98e8ce8c84
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-12ef-0b013dd1c29a
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-ef76-31211e0dcb9a
00010000-5658-7af4-0176-ad31db5a2383	00020000-5658-7af3-c585-c4204ad22d23
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-7508-d18a4e2c7607
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-8bb8-61232dddad8f
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-b4f5-9852eb2f3834
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-bcaf-33eb5916662c
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-ef76-31211e0dcb9a
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-7e61-c47de0d908f6
00010000-5658-7af4-eac7-a90c627647ce	00020000-5658-7af3-09e9-0e578275e861
00010000-5658-7af4-5905-7a39c6dbc88a	00020000-5658-7af3-090e-c62f7195de3b
\.


--
-- TOC entry 3144 (class 0 OID 30024042)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3136 (class 0 OID 30023980)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 30023926)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5658-7af4-2be6-51a7a6f4611a	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5658-7af4-1925-f5f8e99c3e0c	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5658-7af4-7d0e-3c1bf7a5a739	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3095 (class 0 OID 30023549)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5658-7af1-4cf9-5e29bc1f0dbc	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5658-7af1-0ca8-8f73a579e4aa	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5658-7af1-35bb-f1a52507d8f9	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5658-7af1-19cd-fe88f6b4f257	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5658-7af1-a987-b7cf68aff886	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3094 (class 0 OID 30023541)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5658-7af1-e4ad-076a54ee4722	00230000-5658-7af1-19cd-fe88f6b4f257	popa
00240000-5658-7af1-479f-d6e7f7368ffd	00230000-5658-7af1-19cd-fe88f6b4f257	oseba
00240000-5658-7af1-42b1-d2cb560facfe	00230000-5658-7af1-19cd-fe88f6b4f257	tippopa
00240000-5658-7af1-65e8-93442dd17b1d	00230000-5658-7af1-19cd-fe88f6b4f257	organizacijskaenota
00240000-5658-7af1-6470-7a4921004377	00230000-5658-7af1-19cd-fe88f6b4f257	sezona
00240000-5658-7af1-ad8f-0b27de482b8e	00230000-5658-7af1-19cd-fe88f6b4f257	tipvaje
00240000-5658-7af1-3126-aafaecdf772b	00230000-5658-7af1-0ca8-8f73a579e4aa	prostor
00240000-5658-7af1-1a1d-20bb76aa8482	00230000-5658-7af1-19cd-fe88f6b4f257	besedilo
00240000-5658-7af1-a4f2-d7d8cb254c80	00230000-5658-7af1-19cd-fe88f6b4f257	uprizoritev
00240000-5658-7af1-d683-774c5ff5b651	00230000-5658-7af1-19cd-fe88f6b4f257	funkcija
00240000-5658-7af1-ffc9-d2590bd4e080	00230000-5658-7af1-19cd-fe88f6b4f257	tipfunkcije
00240000-5658-7af1-20f3-2139901b7549	00230000-5658-7af1-19cd-fe88f6b4f257	alternacija
00240000-5658-7af1-b3bc-c1ccf33675e9	00230000-5658-7af1-4cf9-5e29bc1f0dbc	pogodba
00240000-5658-7af1-bae8-b3158760d3d1	00230000-5658-7af1-19cd-fe88f6b4f257	zaposlitev
00240000-5658-7af1-024a-6929c3cda546	00230000-5658-7af1-19cd-fe88f6b4f257	zvrstuprizoritve
00240000-5658-7af1-4608-772f5b02fe88	00230000-5658-7af1-4cf9-5e29bc1f0dbc	programdela
00240000-5658-7af1-5fdd-76a229a21c6f	00230000-5658-7af1-19cd-fe88f6b4f257	zapis
\.


--
-- TOC entry 3093 (class 0 OID 30023536)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
0c207638-91db-40d3-8365-f304e2536d9d	00240000-5658-7af1-e4ad-076a54ee4722	0	1001
\.


--
-- TOC entry 3150 (class 0 OID 30024107)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5658-7af4-3129-9ebc799dba03	000e0000-5658-7af4-2f75-fed004495114	00080000-5658-7af4-d327-d6805f8beade	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5658-7af2-d4be-7de79a9dfc14
00270000-5658-7af4-5766-50c3ed5e8171	000e0000-5658-7af4-2f75-fed004495114	00080000-5658-7af4-d327-d6805f8beade	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5658-7af2-d4be-7de79a9dfc14
\.


--
-- TOC entry 3109 (class 0 OID 30023684)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 30023936)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5658-7af4-283b-bfbb7ce83d34	00180000-5658-7af4-2adf-3451f4df2392	000c0000-5658-7af4-9961-afdc99c1b04d	00090000-5658-7af4-d37c-71149a0f25c0	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-7af4-245e-526a66980a4a	00180000-5658-7af4-2adf-3451f4df2392	000c0000-5658-7af4-e57b-bbf72fa433d5	00090000-5658-7af4-eb53-d50fd6f14df8	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-7af4-a34b-b4bf136f9618	00180000-5658-7af4-2adf-3451f4df2392	000c0000-5658-7af4-f022-86b9be1b4e8f	00090000-5658-7af4-9e83-2da8adf892a3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-7af4-34e0-a30e211465b2	00180000-5658-7af4-2adf-3451f4df2392	000c0000-5658-7af4-6d50-a7cce60fbed7	00090000-5658-7af4-5245-60680dd51f1a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-7af4-75f6-d7208e6b4a47	00180000-5658-7af4-2adf-3451f4df2392	000c0000-5658-7af4-4da0-7ea5f2372f4f	00090000-5658-7af4-30c1-a391e79d32a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5658-7af4-dad1-b01603850892	00180000-5658-7af4-ef60-3c216a3f0707	\N	00090000-5658-7af4-30c1-a391e79d32a6	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5658-7af4-c99a-142b4bd3122d	00180000-5658-7af4-ef60-3c216a3f0707	\N	00090000-5658-7af4-eb53-d50fd6f14df8	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3153 (class 0 OID 30024148)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5658-7af1-d456-a44e8cfedc5e	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5658-7af1-298b-eaff27e638ae	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5658-7af1-f51e-6ea76fc173c5	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5658-7af1-c605-04b1929af9da	04	Režija	Režija	Režija	umetnik	30
000f0000-5658-7af1-2e91-687d2e178745	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5658-7af1-6d13-41a48ba014ee	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5658-7af1-1f42-a3d721cb221b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5658-7af1-f19e-5d3ab922c1e4	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5658-7af1-f284-6f997f8e4b3d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5658-7af1-0bc1-372839a267e6	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5658-7af1-2463-3849c2365292	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5658-7af1-d17f-f41cd44879cd	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5658-7af1-5e28-47f291ecd9c3	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5658-7af1-6fd8-d9638b43bccc	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5658-7af1-5671-de23b9d08b8d	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5658-7af1-1388-dff61f4b2ddf	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5658-7af1-83cb-c3f4a2363cc6	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5658-7af1-b3e1-9f101b136815	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3106 (class 0 OID 30023635)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5658-7af3-5b42-73a1770bfdb0	0001	šola	osnovna ali srednja šola
00400000-5658-7af3-2a9b-313016387744	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5658-7af3-7feb-e656b88dbbaf	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3166 (class 0 OID 30024441)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5658-7af1-b537-2c06f7023441	01	Velika predstava	f	1.00	1.00
002b0000-5658-7af1-1a9c-ffd658e360d9	02	Mala predstava	f	0.50	0.50
002b0000-5658-7af1-f46d-7a0d402669c5	03	Mala koprodukcija	t	0.40	1.00
002b0000-5658-7af1-ae63-cac2f1bc427a	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5658-7af1-8311-c4b31575e1ca	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3129 (class 0 OID 30023916)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5658-7af1-f9d3-b9ef64f81eda	0001	prva vaja	prva vaja
00420000-5658-7af1-70db-4a4b403f0da2	0002	tehnična vaja	tehnična vaja
00420000-5658-7af1-bb8a-0a1ec7a98dc0	0003	lučna vaja	lučna vaja
00420000-5658-7af1-9f41-953dd5c1f57e	0004	kostumska vaja	kostumska vaja
00420000-5658-7af1-ec6a-be386355a9d9	0005	foto vaja	foto vaja
00420000-5658-7af1-7318-e0e73295f1d5	0006	1. glavna vaja	1. glavna vaja
00420000-5658-7af1-6b30-6350694cd169	0007	2. glavna vaja	2. glavna vaja
00420000-5658-7af1-e8c1-a5af326d0c70	0008	1. generalka	1. generalka
00420000-5658-7af1-cb07-09f1aa8ed865	0009	2. generalka	2. generalka
00420000-5658-7af1-e732-e63111ffc3da	0010	odprta generalka	odprta generalka
00420000-5658-7af1-3e3c-0a10503d8e3d	0011	obnovitvena vaja	obnovitvena vaja
00420000-5658-7af1-7366-d1fe9ef279ce	0012	pevska vaja	pevska vaja
00420000-5658-7af1-8ad0-d65eaeb82a0b	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5658-7af1-2584-dc9ba9c3f207	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3115 (class 0 OID 30023757)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3098 (class 0 OID 30023571)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5658-7af2-362d-2765abbb7519	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROJDARDTAZXDrnC1/g05x6ZqHl86/8h66	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5658-7af4-acd0-207a1f83f2d8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5658-7af4-6ac9-0f4c7b81b2a4	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5658-7af4-3b6f-41982be31192	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5658-7af4-53fb-9e91f276481b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5658-7af4-e8c1-875cec39e5d2	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5658-7af4-0708-04da30898608	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5658-7af4-4e7f-6058a51721d6	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5658-7af4-c06a-b8c88685d582	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5658-7af4-88f7-2035162922cc	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5658-7af4-351f-642190332c4e	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5658-7af4-eec2-f676b7b8b086	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5658-7af4-6e3e-c6ce2c715fd4	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5658-7af4-fe1b-0bae6d06c59e	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5658-7af4-cd9c-d422a35f4c9d	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5658-7af4-d182-f83639f8c698	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5658-7af4-7c00-57c50189da22	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5658-7af4-0176-ad31db5a2383	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5658-7af4-eac7-a90c627647ce	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5658-7af4-5905-7a39c6dbc88a	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5658-7af2-367a-b0d302ac16b2	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3157 (class 0 OID 30024198)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5658-7af4-63d1-1a4c696898ac	00160000-5658-7af3-d279-9432bd925d04	\N	00140000-5658-7af1-e0b3-4a1033e3a031	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5658-7af3-2a6b-ada9b0de6a0b
000e0000-5658-7af4-2f75-fed004495114	00160000-5658-7af3-be66-ca69451892df	\N	00140000-5658-7af1-5b84-878091a46afe	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5658-7af3-240e-f9502701270b
000e0000-5658-7af4-4631-f7a64a70c54d	\N	\N	00140000-5658-7af1-5b84-878091a46afe	00190000-5658-7af4-79dc-ef6d337c2eb3	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5658-7af3-2a6b-ada9b0de6a0b
000e0000-5658-7af4-ce33-c91a53ed26cd	\N	\N	00140000-5658-7af1-5b84-878091a46afe	00190000-5658-7af4-79dc-ef6d337c2eb3	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5658-7af3-2a6b-ada9b0de6a0b
000e0000-5658-7af4-ffda-dffd44f1dc7a	\N	\N	00140000-5658-7af1-5b84-878091a46afe	00190000-5658-7af4-79dc-ef6d337c2eb3	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5658-7af3-35e4-986d06d4de8c
000e0000-5658-7af4-e7da-8875ea7254a8	\N	\N	00140000-5658-7af1-5b84-878091a46afe	00190000-5658-7af4-79dc-ef6d337c2eb3	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5658-7af3-35e4-986d06d4de8c
\.


--
-- TOC entry 3123 (class 0 OID 30023856)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5658-7af4-3e86-92c10ba13131	\N	000e0000-5658-7af4-2f75-fed004495114	1	
00200000-5658-7af4-6d1c-457cc504ec9f	\N	000e0000-5658-7af4-2f75-fed004495114	2	
00200000-5658-7af4-0d89-c681082aec8c	\N	000e0000-5658-7af4-2f75-fed004495114	3	
00200000-5658-7af4-fa80-fcc2e7af2a52	\N	000e0000-5658-7af4-2f75-fed004495114	4	
00200000-5658-7af4-70b5-0db653376ce7	\N	000e0000-5658-7af4-2f75-fed004495114	5	
\.


--
-- TOC entry 3140 (class 0 OID 30024007)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 30024121)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5658-7af2-ce92-13ef890a000e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5658-7af2-51dd-9b6b34bafdc6	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5658-7af2-28b0-05e7cde7cc2c	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5658-7af2-9fbe-35bb2e9022f2	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5658-7af2-fbec-5e62c2f82294	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5658-7af2-dcd5-6759cd8d26e2	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5658-7af2-bec5-220eda044f48	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5658-7af2-579a-67f3cc51b3a4	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5658-7af2-d4be-7de79a9dfc14	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5658-7af2-b851-ad8fc3f89787	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5658-7af2-9515-f835b6350602	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5658-7af2-12f6-ac41969e1821	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5658-7af2-c693-7a6b38c4f48e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5658-7af2-ef52-905118f587ff	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5658-7af2-131c-9ae3b97734ec	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5658-7af2-33df-f032e42d0c51	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5658-7af2-01da-ae2d2f5500bc	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5658-7af2-fa27-fc6243682f19	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5658-7af2-db6a-4af8b2fd70cc	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5658-7af2-880b-c2ea41dac938	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5658-7af2-d9ee-9a757546dd68	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5658-7af2-1fed-bb777221ec23	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5658-7af2-8024-693ba840b2d2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5658-7af2-98ef-965c35809f04	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5658-7af2-754a-e560a5aabd98	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5658-7af2-f7a1-924cd6debef7	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5658-7af2-fab5-b5a1ed12c299	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5658-7af2-ec93-cb9ecb6cf79e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3169 (class 0 OID 30024491)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 30024460)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 30024503)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 30024079)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5658-7af4-c41a-16feeabf45c1	00090000-5658-7af4-eb53-d50fd6f14df8	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-7af4-3809-019c718b6a53	00090000-5658-7af4-9e83-2da8adf892a3	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-7af4-2668-c81fd72f1753	00090000-5658-7af4-ee38-045919010d09	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-7af4-9898-421f3f3c94ba	00090000-5658-7af4-dd3e-8782e33d95de	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-7af4-d6a3-d0a900f4b603	00090000-5658-7af4-5c19-78f1114cc0ab	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5658-7af4-fe6a-f1af270ebb3b	00090000-5658-7af4-4a8c-61b53525e488	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3126 (class 0 OID 30023900)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 30024188)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5658-7af1-e0b3-4a1033e3a031	01	Drama	drama (SURS 01)
00140000-5658-7af1-919f-235ee1c3eccc	02	Opera	opera (SURS 02)
00140000-5658-7af1-73b3-e05e24463420	03	Balet	balet (SURS 03)
00140000-5658-7af1-3f63-efab17e7aaa4	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5658-7af1-06b5-6ef25ac1dd6b	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5658-7af1-5b84-878091a46afe	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5658-7af1-f526-609fe30b8938	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3146 (class 0 OID 30024069)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2588 (class 2606 OID 30023634)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2807 (class 2606 OID 30024247)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 30024237)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 30023625)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2766 (class 2606 OID 30024104)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 30024146)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 30024544)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2670 (class 2606 OID 30023888)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 30023910)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2688 (class 2606 OID 30023915)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2840 (class 2606 OID 30024458)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 30023783)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 30024315)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2750 (class 2606 OID 30024065)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 30023854)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 30023821)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 30023797)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 30023972)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 30024521)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2862 (class 2606 OID 30024528)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2869 (class 2606 OID 30024552)
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
-- TOC entry 2726 (class 2606 OID 30023999)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 30023755)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2596 (class 2606 OID 30023653)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 30023717)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 30023680)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 30023614)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2577 (class 2606 OID 30023599)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2729 (class 2606 OID 30024005)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2743 (class 2606 OID 30024041)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 30024183)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 30023708)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2623 (class 2606 OID 30023743)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 30024410)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2718 (class 2606 OID 30023978)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 30023733)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 30023873)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 30023842)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2655 (class 2606 OID 30023834)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 30023990)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2828 (class 2606 OID 30024419)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2830 (class 2606 OID 30024427)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2821 (class 2606 OID 30024397)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2835 (class 2606 OID 30024439)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 30024023)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 30023963)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 30023954)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 30024170)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 30024097)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 30023809)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2569 (class 2606 OID 30023570)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2741 (class 2606 OID 30024032)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 30023588)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2579 (class 2606 OID 30023608)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 30024050)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 30023985)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 30023934)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2566 (class 2606 OID 30023558)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 2606 OID 30023546)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 30023540)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 30024117)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 30023689)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2700 (class 2606 OID 30023945)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 30024157)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2590 (class 2606 OID 30023642)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 30024451)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 30023923)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 30023768)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 30023583)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2801 (class 2606 OID 30024216)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 30023863)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 30024013)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 30024129)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2851 (class 2606 OID 30024501)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 30024485)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 30024509)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 30024087)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 30023904)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 30024196)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 30024077)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 1259 OID 30023898)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2672 (class 1259 OID 30023899)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2673 (class 1259 OID 30023897)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2674 (class 1259 OID 30023896)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2675 (class 1259 OID 30023895)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2769 (class 1259 OID 30024118)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2770 (class 1259 OID 30024119)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2771 (class 1259 OID 30024120)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2855 (class 1259 OID 30024523)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2856 (class 1259 OID 30024522)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2606 (class 1259 OID 30023710)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2607 (class 1259 OID 30023711)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2727 (class 1259 OID 30024006)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2842 (class 1259 OID 30024489)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2843 (class 1259 OID 30024488)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2844 (class 1259 OID 30024490)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2845 (class 1259 OID 30024487)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2846 (class 1259 OID 30024486)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2721 (class 1259 OID 30023992)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2722 (class 1259 OID 30023991)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2663 (class 1259 OID 30023864)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2664 (class 1259 OID 30023865)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2751 (class 1259 OID 30024066)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2752 (class 1259 OID 30024068)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2753 (class 1259 OID 30024067)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2638 (class 1259 OID 30023799)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2639 (class 1259 OID 30023798)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2833 (class 1259 OID 30024440)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2785 (class 1259 OID 30024185)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2786 (class 1259 OID 30024186)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2787 (class 1259 OID 30024187)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2852 (class 1259 OID 30024510)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2794 (class 1259 OID 30024221)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2795 (class 1259 OID 30024218)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2796 (class 1259 OID 30024222)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2797 (class 1259 OID 30024220)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2798 (class 1259 OID 30024219)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2628 (class 1259 OID 30023770)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2629 (class 1259 OID 30023769)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2597 (class 1259 OID 30023683)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2739 (class 1259 OID 30024033)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2581 (class 1259 OID 30023615)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2582 (class 1259 OID 30023616)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2744 (class 1259 OID 30024053)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 30024052)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2746 (class 1259 OID 30024051)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2611 (class 1259 OID 30023720)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2612 (class 1259 OID 30023719)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2613 (class 1259 OID 30023721)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2651 (class 1259 OID 30023837)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2652 (class 1259 OID 30023835)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 30023836)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2561 (class 1259 OID 30023548)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2701 (class 1259 OID 30023958)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2702 (class 1259 OID 30023956)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2703 (class 1259 OID 30023955)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2704 (class 1259 OID 30023957)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2572 (class 1259 OID 30023589)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2573 (class 1259 OID 30023590)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2730 (class 1259 OID 30024014)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2865 (class 1259 OID 30024545)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2767 (class 1259 OID 30024106)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2768 (class 1259 OID 30024105)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2866 (class 1259 OID 30024553)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2867 (class 1259 OID 30024554)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2716 (class 1259 OID 30023979)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2761 (class 1259 OID 30024098)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2762 (class 1259 OID 30024099)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2815 (class 1259 OID 30024320)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2816 (class 1259 OID 30024319)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2817 (class 1259 OID 30024316)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 30024317)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2819 (class 1259 OID 30024318)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2617 (class 1259 OID 30023735)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2618 (class 1259 OID 30023734)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2619 (class 1259 OID 30023736)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2733 (class 1259 OID 30024027)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2734 (class 1259 OID 30024026)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2825 (class 1259 OID 30024420)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2826 (class 1259 OID 30024421)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2808 (class 1259 OID 30024251)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2809 (class 1259 OID 30024252)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2810 (class 1259 OID 30024249)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2811 (class 1259 OID 30024250)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2757 (class 1259 OID 30024088)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2758 (class 1259 OID 30024089)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2707 (class 1259 OID 30023967)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2708 (class 1259 OID 30023966)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2709 (class 1259 OID 30023964)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2710 (class 1259 OID 30023965)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2804 (class 1259 OID 30024239)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2805 (class 1259 OID 30024238)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2642 (class 1259 OID 30023810)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2645 (class 1259 OID 30023824)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2646 (class 1259 OID 30023823)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2647 (class 1259 OID 30023822)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2648 (class 1259 OID 30023825)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2662 (class 1259 OID 30023855)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2656 (class 1259 OID 30023843)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2657 (class 1259 OID 30023844)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2822 (class 1259 OID 30024411)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2841 (class 1259 OID 30024459)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2859 (class 1259 OID 30024529)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2860 (class 1259 OID 30024530)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2593 (class 1259 OID 30023655)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2594 (class 1259 OID 30023654)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2602 (class 1259 OID 30023690)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2603 (class 1259 OID 30023691)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2682 (class 1259 OID 30023905)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2696 (class 1259 OID 30023948)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2697 (class 1259 OID 30023947)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2698 (class 1259 OID 30023946)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2676 (class 1259 OID 30023890)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2677 (class 1259 OID 30023891)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2678 (class 1259 OID 30023894)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2679 (class 1259 OID 30023889)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2680 (class 1259 OID 30023893)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2681 (class 1259 OID 30023892)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2610 (class 1259 OID 30023709)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2591 (class 1259 OID 30023643)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2592 (class 1259 OID 30023644)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2634 (class 1259 OID 30023784)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2635 (class 1259 OID 30023786)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2636 (class 1259 OID 30023785)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2637 (class 1259 OID 30023787)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2715 (class 1259 OID 30023973)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2790 (class 1259 OID 30024184)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2799 (class 1259 OID 30024217)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2781 (class 1259 OID 30024158)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2782 (class 1259 OID 30024159)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2600 (class 1259 OID 30023681)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2601 (class 1259 OID 30023682)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2754 (class 1259 OID 30024078)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2567 (class 1259 OID 30023559)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2627 (class 1259 OID 30023756)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2616 (class 1259 OID 30023718)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2564 (class 1259 OID 30023547)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2838 (class 1259 OID 30024452)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2737 (class 1259 OID 30024025)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2738 (class 1259 OID 30024024)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2691 (class 1259 OID 30023924)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 30023925)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2812 (class 1259 OID 30024248)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2624 (class 1259 OID 30023744)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2791 (class 1259 OID 30024197)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2849 (class 1259 OID 30024502)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2831 (class 1259 OID 30024428)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2832 (class 1259 OID 30024429)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2778 (class 1259 OID 30024147)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2695 (class 1259 OID 30023935)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 30023609)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2909 (class 2606 OID 30024725)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2908 (class 2606 OID 30024730)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2903 (class 2606 OID 30024755)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2905 (class 2606 OID 30024745)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2910 (class 2606 OID 30024720)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2906 (class 2606 OID 30024740)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2904 (class 2606 OID 30024750)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2907 (class 2606 OID 30024735)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2946 (class 2606 OID 30024925)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2945 (class 2606 OID 30024930)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2944 (class 2606 OID 30024935)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2978 (class 2606 OID 30025100)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 30025095)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2882 (class 2606 OID 30024610)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2881 (class 2606 OID 30024615)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2927 (class 2606 OID 30024840)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2973 (class 2606 OID 30025080)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2974 (class 2606 OID 30025075)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2972 (class 2606 OID 30025085)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2975 (class 2606 OID 30025070)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2976 (class 2606 OID 30025065)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2925 (class 2606 OID 30024835)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2926 (class 2606 OID 30024830)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2902 (class 2606 OID 30024710)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2901 (class 2606 OID 30024715)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2937 (class 2606 OID 30024880)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2935 (class 2606 OID 30024890)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2936 (class 2606 OID 30024885)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2891 (class 2606 OID 30024665)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 30024660)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2923 (class 2606 OID 30024820)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2970 (class 2606 OID 30025055)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2949 (class 2606 OID 30024940)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2948 (class 2606 OID 30024945)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2947 (class 2606 OID 30024950)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2977 (class 2606 OID 30025090)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2951 (class 2606 OID 30024970)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2954 (class 2606 OID 30024955)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2950 (class 2606 OID 30024975)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2952 (class 2606 OID 30024965)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2953 (class 2606 OID 30024960)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2889 (class 2606 OID 30024655)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2890 (class 2606 OID 30024650)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2877 (class 2606 OID 30024595)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2878 (class 2606 OID 30024590)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2931 (class 2606 OID 30024860)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2874 (class 2606 OID 30024570)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2873 (class 2606 OID 30024575)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2932 (class 2606 OID 30024875)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2933 (class 2606 OID 30024870)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2934 (class 2606 OID 30024865)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2884 (class 2606 OID 30024625)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2885 (class 2606 OID 30024620)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2883 (class 2606 OID 30024630)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2895 (class 2606 OID 30024690)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2897 (class 2606 OID 30024680)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2896 (class 2606 OID 30024685)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2870 (class 2606 OID 30024555)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2915 (class 2606 OID 30024795)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2917 (class 2606 OID 30024785)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2918 (class 2606 OID 30024780)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2916 (class 2606 OID 30024790)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2872 (class 2606 OID 30024560)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2871 (class 2606 OID 30024565)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2928 (class 2606 OID 30024845)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2982 (class 2606 OID 30025115)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2942 (class 2606 OID 30024920)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2943 (class 2606 OID 30024915)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2984 (class 2606 OID 30025120)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2983 (class 2606 OID 30025125)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2924 (class 2606 OID 30024825)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2941 (class 2606 OID 30024905)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2940 (class 2606 OID 30024910)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2961 (class 2606 OID 30025030)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2962 (class 2606 OID 30025025)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2965 (class 2606 OID 30025010)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2964 (class 2606 OID 30025015)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2963 (class 2606 OID 30025020)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2887 (class 2606 OID 30024640)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 30024635)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2886 (class 2606 OID 30024645)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2929 (class 2606 OID 30024855)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2930 (class 2606 OID 30024850)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2968 (class 2606 OID 30025040)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2967 (class 2606 OID 30025045)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2958 (class 2606 OID 30025000)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2957 (class 2606 OID 30025005)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2960 (class 2606 OID 30024990)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2959 (class 2606 OID 30024995)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2939 (class 2606 OID 30024895)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2938 (class 2606 OID 30024900)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2919 (class 2606 OID 30024815)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2920 (class 2606 OID 30024810)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2922 (class 2606 OID 30024800)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2921 (class 2606 OID 30024805)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2955 (class 2606 OID 30024985)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2956 (class 2606 OID 30024980)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2893 (class 2606 OID 30024670)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2894 (class 2606 OID 30024675)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2900 (class 2606 OID 30024705)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2899 (class 2606 OID 30024695)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2898 (class 2606 OID 30024700)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2966 (class 2606 OID 30025035)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2969 (class 2606 OID 30025050)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2971 (class 2606 OID 30025060)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2981 (class 2606 OID 30025105)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2980 (class 2606 OID 30025110)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2875 (class 2606 OID 30024585)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2876 (class 2606 OID 30024580)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2880 (class 2606 OID 30024600)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2879 (class 2606 OID 30024605)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2911 (class 2606 OID 30024760)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2912 (class 2606 OID 30024775)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2913 (class 2606 OID 30024770)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2914 (class 2606 OID 30024765)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-27 16:47:03 CET

--
-- PostgreSQL database dump complete
--

