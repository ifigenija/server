--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-11-04 15:09:09 CET

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
-- TOC entry 183 (class 1259 OID 25171292)
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
-- TOC entry 237 (class 1259 OID 25171906)
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
-- TOC entry 236 (class 1259 OID 25171889)
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
-- TOC entry 182 (class 1259 OID 25171285)
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
-- TOC entry 181 (class 1259 OID 25171283)
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
-- TOC entry 227 (class 1259 OID 25171766)
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
-- TOC entry 230 (class 1259 OID 25171796)
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
-- TOC entry 251 (class 1259 OID 25172193)
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
-- TOC entry 203 (class 1259 OID 25171540)
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
-- TOC entry 205 (class 1259 OID 25171572)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 25171577)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 25172119)
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
-- TOC entry 194 (class 1259 OID 25171437)
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
-- TOC entry 238 (class 1259 OID 25171919)
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
-- TOC entry 223 (class 1259 OID 25171720)
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
-- TOC entry 200 (class 1259 OID 25171511)
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
-- TOC entry 197 (class 1259 OID 25171477)
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
-- TOC entry 195 (class 1259 OID 25171454)
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
-- TOC entry 212 (class 1259 OID 25171634)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 25172174)
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
-- TOC entry 250 (class 1259 OID 25172186)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 25172208)
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
-- TOC entry 216 (class 1259 OID 25171659)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 25171411)
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
-- TOC entry 185 (class 1259 OID 25171311)
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
-- TOC entry 189 (class 1259 OID 25171378)
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
-- TOC entry 186 (class 1259 OID 25171322)
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
-- TOC entry 178 (class 1259 OID 25171257)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 25171276)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 25171666)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 25171700)
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
-- TOC entry 233 (class 1259 OID 25171837)
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
-- TOC entry 188 (class 1259 OID 25171358)
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
-- TOC entry 191 (class 1259 OID 25171403)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 25172064)
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
-- TOC entry 213 (class 1259 OID 25171640)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 25171388)
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
-- TOC entry 202 (class 1259 OID 25171532)
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
-- TOC entry 198 (class 1259 OID 25171492)
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
-- TOC entry 199 (class 1259 OID 25171504)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 25171652)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 25172078)
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
-- TOC entry 242 (class 1259 OID 25172088)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 25171987)
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
-- TOC entry 243 (class 1259 OID 25172096)
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
-- TOC entry 219 (class 1259 OID 25171681)
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
-- TOC entry 211 (class 1259 OID 25171625)
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
-- TOC entry 210 (class 1259 OID 25171615)
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
-- TOC entry 232 (class 1259 OID 25171826)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 25171756)
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
-- TOC entry 196 (class 1259 OID 25171466)
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
-- TOC entry 175 (class 1259 OID 25171228)
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
-- TOC entry 174 (class 1259 OID 25171226)
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
-- TOC entry 220 (class 1259 OID 25171694)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 25171266)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 25171250)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 25171708)
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
-- TOC entry 214 (class 1259 OID 25171646)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 25171592)
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
-- TOC entry 173 (class 1259 OID 25171215)
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
-- TOC entry 172 (class 1259 OID 25171207)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 25171202)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 25171773)
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
-- TOC entry 187 (class 1259 OID 25171350)
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
-- TOC entry 209 (class 1259 OID 25171602)
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
-- TOC entry 231 (class 1259 OID 25171814)
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
-- TOC entry 184 (class 1259 OID 25171301)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 25172107)
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
-- TOC entry 207 (class 1259 OID 25171582)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 25171423)
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
-- TOC entry 176 (class 1259 OID 25171237)
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
-- TOC entry 235 (class 1259 OID 25171864)
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
-- TOC entry 201 (class 1259 OID 25171522)
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
-- TOC entry 218 (class 1259 OID 25171673)
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
-- TOC entry 229 (class 1259 OID 25171787)
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
-- TOC entry 247 (class 1259 OID 25172154)
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
-- TOC entry 246 (class 1259 OID 25172126)
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
-- TOC entry 248 (class 1259 OID 25172166)
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
-- TOC entry 225 (class 1259 OID 25171745)
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
-- TOC entry 204 (class 1259 OID 25171566)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 25171854)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 25171735)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 25171288)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 25171231)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3101 (class 0 OID 25171292)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-563a-1181-2889-eaabc3f0f801	10	30	Otroci	Abonma za otroke	200
000a0000-563a-1181-1682-533a138f17cd	20	60	Mladina	Abonma za mladino	400
000a0000-563a-1181-d9da-7cf5de96bf0a	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3155 (class 0 OID 25171906)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-563a-1182-efee-8cec6d2ce56e	000d0000-563a-1182-12ad-d68a9bd22971	\N	00090000-563a-1182-9dfd-c638c7921bb4	000b0000-563a-1182-0c00-b75aabd6a392	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-563a-1182-c27e-f0d94b155e22	000d0000-563a-1182-83dd-5f6481659fdf	00100000-563a-1182-f044-c5e1d912b4aa	00090000-563a-1182-d7b6-7ecc9b5cae3f	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-563a-1182-5552-fb19aa6c95c0	000d0000-563a-1182-875b-5f151fde2b1f	00100000-563a-1182-8aee-e9706483791b	00090000-563a-1182-eee3-4bd4ebf035e1	\N	0003	t	\N	2015-11-04	\N	2	t	\N	f	f
000c0000-563a-1182-baa3-90cddd0b9820	000d0000-563a-1182-148e-3af78ee8f04e	\N	00090000-563a-1182-6d3e-13f5a2463190	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-563a-1182-5271-97b703fb211d	000d0000-563a-1182-2d2b-6882708c7f8c	\N	00090000-563a-1182-dc3a-71aec520bceb	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-563a-1182-3981-bc5af6771b4a	000d0000-563a-1182-6bf6-402ac77c3d1a	\N	00090000-563a-1182-1142-a71519d3c626	000b0000-563a-1182-deea-f95ca3330c83	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-563a-1182-0f1f-b72915b8eabf	000d0000-563a-1182-ba9e-e5f46c2ce1bd	00100000-563a-1182-1071-f7a29bf3c06a	00090000-563a-1182-ea2d-03fd9e476560	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-563a-1182-8065-213f65a85dd0	000d0000-563a-1182-9c30-2fc5974354e5	\N	00090000-563a-1182-9ca6-b3781a6ff9ec	000b0000-563a-1182-3417-ce5971c127c4	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-563a-1182-eed3-d2f97f1c1b68	000d0000-563a-1182-ba9e-e5f46c2ce1bd	00100000-563a-1182-a54d-be70811db986	00090000-563a-1182-dad5-c8cfe7450cb3	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-563a-1182-1d91-74cd0d8a20f8	000d0000-563a-1182-ba9e-e5f46c2ce1bd	00100000-563a-1182-25e6-fd1db171af51	00090000-563a-1182-d21b-cec0eade5032	\N	0010	t	\N	2015-11-04	\N	16	f	\N	f	t
000c0000-563a-1182-62fd-aa6585d0e001	000d0000-563a-1182-ba9e-e5f46c2ce1bd	00100000-563a-1182-96f4-33dd6912b87b	00090000-563a-1182-9d59-d5c12dfdc6c9	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-563a-1182-5e70-25e03367d8aa	000d0000-563a-1182-8bc9-ba51e1554095	00100000-563a-1182-f044-c5e1d912b4aa	00090000-563a-1182-d7b6-7ecc9b5cae3f	000b0000-563a-1182-4d04-003c66356389	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3154 (class 0 OID 25171889)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3100 (class 0 OID 25171285)
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
-- TOC entry 3145 (class 0 OID 25171766)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-563a-1182-c974-a6a73b6b1a5b	00160000-563a-1181-3499-808072d31061	00090000-563a-1182-cbe0-4b730c464387	aizv	10	t
003d0000-563a-1182-5bdf-e695d8ac9984	00160000-563a-1181-3499-808072d31061	00090000-563a-1182-7a57-910adf2373a1	apri	14	t
003d0000-563a-1182-d205-f4ede1f2539f	00160000-563a-1181-866a-fa09033f3547	00090000-563a-1182-565e-1382cd42b08e	aizv	11	t
003d0000-563a-1182-fe41-453e46611a12	00160000-563a-1181-d93d-591bc18270d9	00090000-563a-1182-e9eb-d347db02554e	aizv	12	t
003d0000-563a-1182-e558-87db8aa12df5	00160000-563a-1181-3499-808072d31061	00090000-563a-1182-9660-fe99b1a5d9de	apri	18	f
\.


--
-- TOC entry 3148 (class 0 OID 25171796)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-563a-1181-3499-808072d31061	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-563a-1181-866a-fa09033f3547	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-563a-1181-d93d-591bc18270d9	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3169 (class 0 OID 25172193)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3121 (class 0 OID 25171540)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-563a-1182-0b7e-b50784a5f7d4	\N	\N	00200000-563a-1182-6306-3aff2d97511b	\N	\N	\N	\N	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-563a-1182-e784-cec83d1a66dd	\N	\N	00200000-563a-1182-9109-f2a020d372d3	\N	\N	\N	\N	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-563a-1182-c84a-287dbf8d123d	\N	\N	00200000-563a-1182-06e1-bf13da3f495d	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-563a-1182-0bf8-31f2ddbc283b	\N	\N	00200000-563a-1182-564f-8a04634a2dcb	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-563a-1182-883f-eacda39f4c8d	\N	\N	00200000-563a-1182-b055-c3d4d825a656	\N	\N	\N	\N	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3123 (class 0 OID 25171572)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3124 (class 0 OID 25171577)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3163 (class 0 OID 25172119)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3112 (class 0 OID 25171437)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-563a-117f-ee2a-b20886de60dd	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-563a-117f-0638-e9338a7dcbbe	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-563a-117f-510a-47e59af1b0cc	AL	ALB	008	Albania 	Albanija	\N
00040000-563a-117f-b75c-94d9f1c23bd2	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-563a-117f-4d26-d3ab13068891	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-563a-117f-b6eb-9fc93694e6dd	AD	AND	020	Andorra 	Andora	\N
00040000-563a-117f-2c21-3e1a1c4b6bcf	AO	AGO	024	Angola 	Angola	\N
00040000-563a-117f-4baf-448ff08f1aa0	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-563a-117f-fe8f-a789fd462554	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-563a-117f-10b6-405b71dadde4	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-563a-117f-4d0b-780fc56c16f0	AR	ARG	032	Argentina 	Argenitna	\N
00040000-563a-117f-9686-d2214502355c	AM	ARM	051	Armenia 	Armenija	\N
00040000-563a-117f-771e-216c0dc0b107	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-563a-117f-77ac-96379c4f2f04	AU	AUS	036	Australia 	Avstralija	\N
00040000-563a-117f-7856-7d716166aad6	AT	AUT	040	Austria 	Avstrija	\N
00040000-563a-117f-5f71-bb04a0cbd13c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-563a-117f-7a0a-2922c67d5bed	BS	BHS	044	Bahamas 	Bahami	\N
00040000-563a-117f-84b1-cfece3371c39	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-563a-117f-2641-781c5f9b67fa	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-563a-117f-3160-621ca5ce0278	BB	BRB	052	Barbados 	Barbados	\N
00040000-563a-117f-5454-213b28bc1c7c	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-563a-117f-cb48-d563b9326ea4	BE	BEL	056	Belgium 	Belgija	\N
00040000-563a-117f-bcde-3d607cc66e56	BZ	BLZ	084	Belize 	Belize	\N
00040000-563a-117f-ae86-83b2b32a9b08	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-563a-117f-74e0-321fb1e5989a	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-563a-117f-2c8c-b80b57938d52	BT	BTN	064	Bhutan 	Butan	\N
00040000-563a-117f-05a2-144ad1894386	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-563a-117f-09f0-078c01e95ca1	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-563a-117f-79c3-a8c653681c2c	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-563a-117f-8330-a25814839d3b	BW	BWA	072	Botswana 	Bocvana	\N
00040000-563a-117f-e28a-c3abaa989f6d	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-563a-117f-6205-6f130eef5f15	BR	BRA	076	Brazil 	Brazilija	\N
00040000-563a-117f-080e-11eec6ebaf11	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-563a-117f-b628-d8454f03c277	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-563a-117f-a460-d700f3eb61f2	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-563a-117f-99ab-3eb6ffb25401	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-563a-117f-c0f2-e20d97e25d5e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-563a-117f-27a3-b9d3a4516918	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-563a-117f-dacb-f15cc402a65b	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-563a-117f-e9ef-5297b6f4cc80	CA	CAN	124	Canada 	Kanada	\N
00040000-563a-117f-79b4-1838df2f7462	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-563a-117f-f53b-99fed1fb5616	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-563a-117f-faa9-b86ec9331397	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-563a-117f-b89c-043f0711a8aa	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-563a-117f-0b6d-78b4f074a73b	CL	CHL	152	Chile 	Čile	\N
00040000-563a-117f-c267-fe3809f4998c	CN	CHN	156	China 	Kitajska	\N
00040000-563a-117f-df66-647eca47e11f	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-563a-117f-463e-8817bd6042c3	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-563a-117f-0a33-9d42b1dc9ca5	CO	COL	170	Colombia 	Kolumbija	\N
00040000-563a-117f-72d0-33356db0fe4c	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-563a-117f-6905-0a254dac4103	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-563a-117f-444a-91075daa11dd	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-563a-117f-0a08-4d1e9075cb9c	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-563a-117f-cb2e-9024c97ab04d	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-563a-117f-898e-ba8c266680a6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-563a-117f-3ea1-10eafde6c7ec	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-563a-117f-2f95-45c6fa7f8ff7	CU	CUB	192	Cuba 	Kuba	\N
00040000-563a-117f-f78b-94821d89b070	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-563a-117f-b8b8-5c63985af038	CY	CYP	196	Cyprus 	Ciper	\N
00040000-563a-117f-ff11-f9af74ccf97a	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-563a-117f-0b16-9e83456508d7	DK	DNK	208	Denmark 	Danska	\N
00040000-563a-117f-ee9b-c1d5062c611c	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-563a-117f-aac2-e59bef87fbbb	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-563a-117f-f30f-66194b3f2a32	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-563a-117f-7d90-ced4dc37e724	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-563a-117f-d0c7-b0a20bf3a3f2	EG	EGY	818	Egypt 	Egipt	\N
00040000-563a-117f-a4c0-af9ed1661f60	SV	SLV	222	El Salvador 	Salvador	\N
00040000-563a-117f-e4d1-1007af3a92a3	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-563a-117f-dfaa-42636ee36f40	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-563a-117f-1404-3383d2ffedc0	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-563a-117f-6cbc-b6769d259a18	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-563a-117f-710d-7313b26c4ae2	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-563a-117f-a733-79f4a3f978d0	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-563a-117f-0184-21e690bc6486	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-563a-117f-6dfd-1044a270cefa	FI	FIN	246	Finland 	Finska	\N
00040000-563a-117f-fc2b-2c5a1048d8e6	FR	FRA	250	France 	Francija	\N
00040000-563a-117f-9f6c-b2ed5306fd29	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-563a-117f-b1ef-103953175109	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-563a-117f-6052-153ef354b8d3	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-563a-117f-468a-64051b73345e	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-563a-117f-75c8-d5a6f0cb7480	GA	GAB	266	Gabon 	Gabon	\N
00040000-563a-117f-22d9-d1a375314620	GM	GMB	270	Gambia 	Gambija	\N
00040000-563a-117f-bd14-ebb75015e43f	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-563a-117f-722a-792a32ef0af7	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-563a-117f-6dc4-91f8b148236c	GH	GHA	288	Ghana 	Gana	\N
00040000-563a-117f-d7e4-c0645ed34650	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-563a-117f-add4-723d00a72597	GR	GRC	300	Greece 	Grčija	\N
00040000-563a-117f-c1bd-8ed8c41895e3	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-563a-117f-79e9-1b97c3ec3562	GD	GRD	308	Grenada 	Grenada	\N
00040000-563a-117f-6c18-7a3449c99715	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-563a-117f-5aa0-03a3a23202b6	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-563a-117f-e632-b54f76d3f4a1	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-563a-117f-2a1a-563c36453359	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-563a-117f-7e35-438f195f0040	GN	GIN	324	Guinea 	Gvineja	\N
00040000-563a-117f-2e0f-31f2209bf291	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-563a-117f-7a46-90cb8803ff44	GY	GUY	328	Guyana 	Gvajana	\N
00040000-563a-117f-9654-dd3876340496	HT	HTI	332	Haiti 	Haiti	\N
00040000-563a-117f-dcf6-efd79b2d91ba	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-563a-117f-1a07-f2b00fa1c576	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-563a-117f-14a4-72b984c6f9e2	HN	HND	340	Honduras 	Honduras	\N
00040000-563a-117f-dac9-52b5c7e30b9b	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-563a-117f-457a-369f0ce3c4d7	HU	HUN	348	Hungary 	Madžarska	\N
00040000-563a-117f-fe94-b55d07153e15	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-563a-117f-bf86-fce4db24d2c0	IN	IND	356	India 	Indija	\N
00040000-563a-117f-c719-06b2591e13eb	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-563a-117f-efc4-3366167cf22c	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-563a-117f-dfda-c18878dde63b	IQ	IRQ	368	Iraq 	Irak	\N
00040000-563a-117f-6ff8-db2c2ef8b0e5	IE	IRL	372	Ireland 	Irska	\N
00040000-563a-117f-907d-c81f234fa2c9	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-563a-117f-1728-7db3b7c6493d	IL	ISR	376	Israel 	Izrael	\N
00040000-563a-117f-6182-5ed9edb41704	IT	ITA	380	Italy 	Italija	\N
00040000-563a-117f-389b-7a4cf56b07e1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-563a-117f-d57d-accd207785df	JP	JPN	392	Japan 	Japonska	\N
00040000-563a-117f-c552-77c33bbd4624	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-563a-117f-6770-7225cd035bf4	JO	JOR	400	Jordan 	Jordanija	\N
00040000-563a-117f-89e7-868bde21025a	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-563a-117f-19b5-349b86ec70af	KE	KEN	404	Kenya 	Kenija	\N
00040000-563a-117f-8206-10bf8060a221	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-563a-117f-71e0-32524fd94ecb	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-563a-117f-fdcd-f35d5b2121e1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-563a-117f-4d34-f7de8b485280	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-563a-117f-6562-505e9057501e	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-563a-117f-6fa7-f41bddf6001a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-563a-117f-0b3d-a361b31b6c2f	LV	LVA	428	Latvia 	Latvija	\N
00040000-563a-117f-0f82-b2b3a14286ae	LB	LBN	422	Lebanon 	Libanon	\N
00040000-563a-117f-8b67-9ade4f7a28f1	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-563a-117f-6f71-cb9bdb14b9bc	LR	LBR	430	Liberia 	Liberija	\N
00040000-563a-117f-9507-20cacbc599db	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-563a-117f-344e-64eab3a95294	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-563a-117f-ab5d-258ea21a380d	LT	LTU	440	Lithuania 	Litva	\N
00040000-563a-117f-9793-eb919e4a4aa4	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-563a-117f-c125-cc5c5cd94cad	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-563a-117f-9ff0-abee0dd7edc5	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-563a-117f-b912-04df3ddb768e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-563a-117f-ba14-b7a0c5773f3c	MW	MWI	454	Malawi 	Malavi	\N
00040000-563a-117f-c6aa-8ec89d2eaa4e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-563a-117f-185c-f7c54d7da006	MV	MDV	462	Maldives 	Maldivi	\N
00040000-563a-117f-f045-826c928e1f24	ML	MLI	466	Mali 	Mali	\N
00040000-563a-117f-1599-d6273030fc0d	MT	MLT	470	Malta 	Malta	\N
00040000-563a-117f-e1a2-60acfa75bc70	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-563a-117f-fbe5-bfed1f9e4c16	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-563a-117f-35e7-080dad267bfa	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-563a-117f-3e01-ea1d533f01d4	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-563a-117f-73ec-0e7de3ffe26e	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-563a-117f-12fc-a5bcc70a822a	MX	MEX	484	Mexico 	Mehika	\N
00040000-563a-117f-2e20-c8fd09efcdc0	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-563a-117f-d349-a8422696452d	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-563a-117f-5385-7798c5c1f703	MC	MCO	492	Monaco 	Monako	\N
00040000-563a-117f-34fc-d09efdfd80f4	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-563a-117f-ffa6-19593056639c	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-563a-117f-d00c-b5bd77dea2e7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-563a-117f-3770-8bf99f3dee6b	MA	MAR	504	Morocco 	Maroko	\N
00040000-563a-117f-c2ef-0b1ef03d7db2	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-563a-117f-7923-0e659f3464d4	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-563a-117f-a1d3-344baa61b23c	NA	NAM	516	Namibia 	Namibija	\N
00040000-563a-117f-5042-49b35ef6d49c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-563a-117f-00fd-88e3bcf2ba23	NP	NPL	524	Nepal 	Nepal	\N
00040000-563a-117f-932b-8fad8ab7ec00	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-563a-117f-637a-44f39f6ba6e3	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-563a-117f-2ccb-c0004064ba45	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-563a-117f-745b-8994e20154e5	NE	NER	562	Niger 	Niger 	\N
00040000-563a-117f-45e3-eb28e699d2f5	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-563a-117f-5d38-05252fd29f2e	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-563a-117f-1664-7b79bac548f2	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-563a-117f-df3d-893525c77812	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-563a-117f-7767-0b6ae4e28c99	NO	NOR	578	Norway 	Norveška	\N
00040000-563a-117f-5666-1caa9f8aa2d1	OM	OMN	512	Oman 	Oman	\N
00040000-563a-117f-0656-f5896ef4749e	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-563a-117f-cee1-8020abfa7792	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-563a-117f-cf36-04970b26ac4b	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-563a-117f-4dfa-4965c403a33d	PA	PAN	591	Panama 	Panama	\N
00040000-563a-117f-299a-fea497785400	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-563a-117f-50e6-3381525cbd52	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-563a-117f-0181-59b52eece68c	PE	PER	604	Peru 	Peru	\N
00040000-563a-117f-3dee-df7958b860c3	PH	PHL	608	Philippines 	Filipini	\N
00040000-563a-117f-566d-6301de23899a	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-563a-117f-619d-ef8dc9ab24a2	PL	POL	616	Poland 	Poljska	\N
00040000-563a-117f-46e6-6d0cdc4d3b2a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-563a-117f-0e2b-f9af86af92d5	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-563a-117f-77fc-8bc902e50b08	QA	QAT	634	Qatar 	Katar	\N
00040000-563a-117f-d5a6-2532454a655d	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-563a-117f-a883-b4d11893f66f	RO	ROU	642	Romania 	Romunija	\N
00040000-563a-117f-3d26-5a23962a8748	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-563a-117f-b701-5e359fddda29	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-563a-117f-ef3b-2963558c0c1b	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-563a-117f-b521-8bb9ea64a168	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-563a-117f-afff-7540d214d120	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-563a-117f-6484-271967504507	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-563a-117f-3a93-ea06318283c9	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-563a-117f-34ad-dc76c5e9f9f2	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-563a-117f-9704-cc64dd5e1b19	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-563a-117f-29cf-0acca49b119c	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-563a-117f-2c01-fb4f90c3ca6a	SM	SMR	674	San Marino 	San Marino	\N
00040000-563a-117f-54a7-49af1e4c7f3f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-563a-117f-93a4-677e15e62b84	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-563a-117f-64f5-d3748f63fbdc	SN	SEN	686	Senegal 	Senegal	\N
00040000-563a-117f-ceed-09cedd3192c6	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-563a-117f-fbc4-263cecc1ba11	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-563a-117f-bc97-42bb3dce96ff	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-563a-117f-d3b1-be3f4af37485	SG	SGP	702	Singapore 	Singapur	\N
00040000-563a-117f-511b-e1d8215bddca	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-563a-117f-d912-5de70337bb6d	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-563a-117f-e3bd-469d44758f65	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-563a-117f-8459-afa52f253873	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-563a-117f-b66a-63e22cabda79	SO	SOM	706	Somalia 	Somalija	\N
00040000-563a-117f-4bf8-e6b0f3eaf3a0	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-563a-117f-bdc0-b3b49592c090	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-563a-117f-a2d8-c74f635d178b	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-563a-117f-1617-e93a9a4cd543	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-563a-117f-932e-3dd561667066	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-563a-117f-de38-1910a43cd203	SD	SDN	729	Sudan 	Sudan	\N
00040000-563a-117f-8817-b6c284c7a156	SR	SUR	740	Suriname 	Surinam	\N
00040000-563a-117f-9bba-726966a1a53c	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-563a-117f-8f33-f6f620be3af7	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-563a-117f-ce83-6fca9538d3ad	SE	SWE	752	Sweden 	Švedska	\N
00040000-563a-117f-513e-f3bdf15c36a0	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-563a-117f-e26f-917b5296b3ac	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-563a-117f-d8ea-d5e4b7326ed1	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-563a-117f-b81a-5a4c2c1d95bc	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-563a-117f-278d-c6bc0cff675f	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-563a-117f-6813-b4b7caf46196	TH	THA	764	Thailand 	Tajska	\N
00040000-563a-117f-6e3a-653495fa0080	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-563a-117f-cdcc-5938e535ab35	TG	TGO	768	Togo 	Togo	\N
00040000-563a-117f-28fa-16591a76a73c	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-563a-117f-bf48-d3f87a5e6ebb	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-563a-117f-0ac2-808286bb21a3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-563a-117f-c0f6-b6c5821868df	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-563a-117f-a1d4-1b79539e3dad	TR	TUR	792	Turkey 	Turčija	\N
00040000-563a-117f-c096-bb3ca7af6d85	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-563a-117f-527f-8dd7bc4a30e3	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563a-117f-14ba-cd88fd59a913	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-563a-117f-71a9-c9f2d8219f80	UG	UGA	800	Uganda 	Uganda	\N
00040000-563a-117f-bc80-91515afe5858	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-563a-117f-2760-2a44e27f3734	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-563a-117f-3140-f424d88d7c6f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-563a-117f-19b9-f633593a903b	US	USA	840	United States 	Združene države Amerike	\N
00040000-563a-117f-bb36-dff328dc74d5	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-563a-117f-ba8b-442428934220	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-563a-117f-4269-ad6e925653b4	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-563a-117f-ab0d-7b27caf6dc7a	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-563a-117f-9911-41935b75a561	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-563a-117f-82dd-eb22032e8222	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-563a-117f-48b9-e6755e547da4	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-563a-117f-6e67-9196b3fa37ac	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-563a-117f-e82a-35726775a1e3	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-563a-117f-cb07-7ddd2e35ec7e	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-563a-117f-8a25-a9c02191e560	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-563a-117f-7140-0bad48c5b7fe	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-563a-117f-3149-aaae9c56111a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3156 (class 0 OID 25171919)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-563a-1182-4210-47b1b180e08e	000e0000-563a-1182-63d2-1ef6fac914a3	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563a-117f-0804-6d4d23239b34	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563a-1182-1b85-2ba81abfcecb	000e0000-563a-1182-8f27-6da23cfe551e	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563a-117f-b412-6da0711d06c3	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-563a-1182-fe0b-c5195da28140	000e0000-563a-1182-0398-acc6c7ea0cf3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-563a-117f-0804-6d4d23239b34	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563a-1182-18be-66d83146b96c	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-563a-1182-a0f6-37303a643498	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3141 (class 0 OID 25171720)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-563a-1182-ba9e-e5f46c2ce1bd	000e0000-563a-1182-8f27-6da23cfe551e	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-563a-117f-e379-5774e7c0bbb0
000d0000-563a-1182-12ad-d68a9bd22971	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-efee-8cec6d2ce56e	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-563a-117f-e379-5774e7c0bbb0
000d0000-563a-1182-83dd-5f6481659fdf	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-c27e-f0d94b155e22	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-563a-117f-4936-a00a3aea2961
000d0000-563a-1182-875b-5f151fde2b1f	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-5552-fb19aa6c95c0	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-563a-117f-d643-c6490fd055c2
000d0000-563a-1182-148e-3af78ee8f04e	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-baa3-90cddd0b9820	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-563a-117f-96f1-8ee976116a3a
000d0000-563a-1182-2d2b-6882708c7f8c	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-5271-97b703fb211d	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-563a-117f-96f1-8ee976116a3a
000d0000-563a-1182-6bf6-402ac77c3d1a	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-3981-bc5af6771b4a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-563a-117f-e379-5774e7c0bbb0
000d0000-563a-1182-9c30-2fc5974354e5	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-8065-213f65a85dd0	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-563a-117f-e14c-4a6034074c9a
000d0000-563a-1182-8bc9-ba51e1554095	000e0000-563a-1182-8f27-6da23cfe551e	000c0000-563a-1182-5e70-25e03367d8aa	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-563a-117f-c02c-76b7f08da2ec
\.


--
-- TOC entry 3118 (class 0 OID 25171511)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3115 (class 0 OID 25171477)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3113 (class 0 OID 25171454)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-563a-1182-8152-f274513ca61c	00080000-563a-1182-6e32-0ab715d52407	00090000-563a-1182-d21b-cec0eade5032	AK		igralka
\.


--
-- TOC entry 3130 (class 0 OID 25171634)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 25172174)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 25172186)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3170 (class 0 OID 25172208)
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
-- TOC entry 3134 (class 0 OID 25171659)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 25171411)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-563a-1180-2391-8b4d1ca8685a	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-563a-1180-da46-657cec38c052	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-563a-1180-9a40-7111d2b2d8ee	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-563a-1180-a908-7d035c024e5f	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-563a-1180-8e94-17109b67f8cb	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-563a-1180-1cda-80b4a1d00e55	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-563a-1180-590f-a40c41a059e7	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-563a-1180-0617-2ebea9dff204	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563a-1180-ac00-9bd6a545ef77	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-563a-1180-59f3-270373e37759	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-563a-1180-6e6a-5464b0d7e6a6	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-563a-1180-6079-3f1608ff3d28	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-563a-1180-45e6-7ac3c44d8eb3	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-563a-1180-579c-ea218d37b18b	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-563a-1180-39e6-c5844bb0888c	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-563a-1181-a010-783efe474cb9	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-563a-1181-5ddd-5424c4e8418d	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-563a-1181-8b47-955b4d30edf4	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-563a-1181-df3d-2c1ede66081b	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-563a-1181-444b-c0a8f1fcfba1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-563a-1183-290e-95ca236a85ad	application.tenant.maticnopodjetje	string	s:36:"00080000-563a-1183-375f-cadc20df4778";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3103 (class 0 OID 25171311)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-563a-1181-0326-b7eb30b61d62	00000000-563a-1181-a010-783efe474cb9	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-563a-1181-9484-d006764a4589	00000000-563a-1181-a010-783efe474cb9	00010000-563a-1180-16d9-e28d92a36104	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-563a-1181-4721-59849f636d0a	00000000-563a-1181-5ddd-5424c4e8418d	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3107 (class 0 OID 25171378)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-563a-1182-f767-85f5e39abb89	\N	00100000-563a-1182-f044-c5e1d912b4aa	00100000-563a-1182-8aee-e9706483791b	01	Gledališče Nimbis
00410000-563a-1182-c630-e66c22b0c728	00410000-563a-1182-f767-85f5e39abb89	00100000-563a-1182-f044-c5e1d912b4aa	00100000-563a-1182-8aee-e9706483791b	02	Tehnika
\.


--
-- TOC entry 3104 (class 0 OID 25171322)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-563a-1182-9dfd-c638c7921bb4	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-563a-1182-6d3e-13f5a2463190	00010000-563a-1182-f348-364f11edffc8	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-563a-1182-eee3-4bd4ebf035e1	00010000-563a-1182-e929-186a4761dbd3	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-563a-1182-dad5-c8cfe7450cb3	00010000-563a-1182-fd88-059f0c814f97	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-563a-1182-44d2-11f7cd4b6d66	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-563a-1182-1142-a71519d3c626	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-563a-1182-9d59-d5c12dfdc6c9	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-563a-1182-ea2d-03fd9e476560	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-563a-1182-d21b-cec0eade5032	00010000-563a-1182-ea84-92e65ad8dc4c	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-563a-1182-d7b6-7ecc9b5cae3f	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-563a-1182-2c86-4b72de6f3923	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563a-1182-dc3a-71aec520bceb	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-563a-1182-9ca6-b3781a6ff9ec	00010000-563a-1182-5621-5b089d1476ad	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-563a-1182-cbe0-4b730c464387	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-1182-7a57-910adf2373a1	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-1182-565e-1382cd42b08e	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-1182-e9eb-d347db02554e	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563a-1182-9660-fe99b1a5d9de	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-563a-1182-8a62-b6fb7b20f924	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-1182-fff2-c16c890d3d25	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-563a-1182-deb2-5a53c0846b9d	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3096 (class 0 OID 25171257)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-563a-1180-0a7e-23c093717229	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-563a-1180-59e1-6d98076492b5	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-563a-1180-a3f7-b0c126bf2da1	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-563a-1180-a076-498563e2bbd1	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-563a-1180-f03a-e3fa41ad1ca1	Oseba-vse	Oseba - vse - za testiranje assert	t
00030000-563a-1180-7eea-d443c2786ba2	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-563a-1180-9991-9332a3deab5e	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-563a-1180-d415-94f73603f51e	Abonma-read	Abonma - branje	t
00030000-563a-1180-3fc6-a035d06c1601	Abonma-write	Abonma - spreminjanje	t
00030000-563a-1180-bb3e-277d2142e8a7	Alternacija-read	Alternacija - branje	t
00030000-563a-1180-0d4c-43fbe79ba6a4	Alternacija-write	Alternacija - spreminjanje	t
00030000-563a-1180-46d7-9ddb4dbda8c2	Arhivalija-read	Arhivalija - branje	t
00030000-563a-1180-da7f-9c1ceef2c4c7	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-563a-1180-8751-8541a674065c	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-563a-1180-5298-bfdac72b32bd	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-563a-1180-5f16-230f04b7889e	Besedilo-read	Besedilo - branje	t
00030000-563a-1180-ac3e-6788310f2e0e	Besedilo-write	Besedilo - spreminjanje	t
00030000-563a-1180-c24f-e86e1bb7a913	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-563a-1180-5650-6b30ce4d58fd	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-563a-1180-6b8f-ad16a8e2560f	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-563a-1180-5f06-563e413c4f9d	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-563a-1180-f2df-e74513d44536	Dogodek-read	Dogodek - branje	t
00030000-563a-1180-4db9-5b961231918a	Dogodek-write	Dogodek - spreminjanje	t
00030000-563a-1180-3e9e-d2ca1eaa59c3	DrugiVir-read	DrugiVir - branje	t
00030000-563a-1180-0e99-6a22573857ac	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-563a-1180-fd89-aaadb9652ae0	Drzava-read	Drzava - branje	t
00030000-563a-1180-63d1-93468dedc24d	Drzava-write	Drzava - spreminjanje	t
00030000-563a-1180-14de-75bba0bc692a	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-563a-1180-b1ba-c20b755f967f	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-563a-1180-6b9c-55eeff7ba322	Funkcija-read	Funkcija - branje	t
00030000-563a-1180-201d-9ba2bf0b85fa	Funkcija-write	Funkcija - spreminjanje	t
00030000-563a-1180-d7b4-d3bcf73dfa45	Gostovanje-read	Gostovanje - branje	t
00030000-563a-1180-1be0-f793f232e889	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-563a-1180-3857-4aae0457c1e0	Gostujoca-read	Gostujoca - branje	t
00030000-563a-1180-fb2a-79e37295d36f	Gostujoca-write	Gostujoca - spreminjanje	t
00030000-563a-1180-c5f9-48a8568ce63e	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-563a-1180-ab41-3c1df7d0bcfe	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-563a-1180-4b06-f7577cfc0c67	Kupec-read	Kupec - branje	t
00030000-563a-1180-fd0d-bf7660ad210c	Kupec-write	Kupec - spreminjanje	t
00030000-563a-1180-946b-77d7a429b98d	NacinPlacina-read	NacinPlacina - branje	t
00030000-563a-1180-28d7-7fe365de4637	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-563a-1180-639f-716e4493fa03	Option-read	Option - branje	t
00030000-563a-1180-0964-1232a4c279d0	Option-write	Option - spreminjanje	t
00030000-563a-1180-6a96-391bdf7e135c	OptionValue-read	OptionValue - branje	t
00030000-563a-1180-b64e-04190717dad9	OptionValue-write	OptionValue - spreminjanje	t
00030000-563a-1180-d208-3239722e39a6	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-563a-1180-b129-a488819fc381	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-563a-1180-9dd7-3d2ab86e9929	Oseba-read	Oseba - branje	t
00030000-563a-1180-acfb-e69654cdfa7a	Oseba-write	Oseba - spreminjanje	t
00030000-563a-1180-92a4-b658dce33583	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-563a-1180-a23c-91a35c2f3d00	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-563a-1180-cb88-d60b8beb7d59	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-563a-1180-8a95-f7a4fb9e54c0	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-563a-1180-b1f0-8dfb548c66fb	Pogodba-read	Pogodba - branje	t
00030000-563a-1180-093b-f1b55164fa77	Pogodba-write	Pogodba - spreminjanje	t
00030000-563a-1180-88d1-bb741731a91e	Popa-read	Popa - branje	t
00030000-563a-1180-f9da-514c4c3dc6ca	Popa-write	Popa - spreminjanje	t
00030000-563a-1180-07e7-03d3eedffc8e	Posta-read	Posta - branje	t
00030000-563a-1180-3dec-1c219539aeaa	Posta-write	Posta - spreminjanje	t
00030000-563a-1180-23d1-515ce642c5b4	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-563a-1180-9b7a-13609043e765	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-563a-1180-dc51-8f6e3cf796b0	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-563a-1180-df7a-a2c3223ba499	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-563a-1180-74f8-59ed63ed0f47	PostniNaslov-read	PostniNaslov - branje	t
00030000-563a-1180-6dc7-b37e162c5369	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-563a-1180-eb8e-eb0c4243026a	Predstava-read	Predstava - branje	t
00030000-563a-1180-3cd2-7d0b09425552	Predstava-write	Predstava - spreminjanje	t
00030000-563a-1180-9b4c-93dcdbfa1318	Praznik-read	Praznik - branje	t
00030000-563a-1180-b198-0ada3798ce48	Praznik-write	Praznik - spreminjanje	t
00030000-563a-1180-082a-027974b2f4c3	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-563a-1180-4fe1-f552bf8c3e09	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-563a-1180-7fab-407099063477	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-563a-1180-15af-d501f7ebdfe7	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-563a-1180-f875-875571292f4f	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-563a-1180-b406-c1597d338fb3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-563a-1180-5f59-bafd91008d0a	ProgramDela-read	ProgramDela - branje	t
00030000-563a-1180-5144-adf07630382b	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-563a-1180-5447-63f34bad1b15	ProgramFestival-read	ProgramFestival - branje	t
00030000-563a-1180-a335-8896edfaf432	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-563a-1180-0d0d-4c7f269c70db	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-563a-1180-94fb-b46286d4852e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-563a-1180-9a2c-f18932ea5cac	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-563a-1180-dbd1-c30839db8122	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-563a-1180-b5a4-3b063795c35f	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-563a-1180-66c2-972701776858	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-563a-1180-9403-feada9617f73	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-563a-1180-e8af-1fd6764e3efa	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-563a-1180-271c-f0c898e89932	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-563a-1180-20b2-6eaf252337bb	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-563a-1180-8b0e-452f198f5583	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-563a-1180-c9ab-30a080dfd250	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-563a-1180-1e86-ae4687a51a3a	ProgramRazno-read	ProgramRazno - branje	t
00030000-563a-1180-3b3c-a9f786e23085	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-563a-1180-c968-cf2eed3fbfcb	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-563a-1180-710e-6d4ff9fd9396	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-563a-1180-6565-92eb41881215	Prostor-read	Prostor - branje	t
00030000-563a-1180-5007-f137700ea795	Prostor-write	Prostor - spreminjanje	t
00030000-563a-1180-6eda-28065a6eeb10	Racun-read	Racun - branje	t
00030000-563a-1180-985d-83b2e9263d8d	Racun-write	Racun - spreminjanje	t
00030000-563a-1180-efeb-9709b493c1cb	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-563a-1180-f7ff-9cf3277560f3	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-563a-1180-8cb3-efe13b909e0e	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-563a-1180-4e25-69ab07ce81fe	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-563a-1180-cc9d-46622fa61e73	Rekvizit-read	Rekvizit - branje	t
00030000-563a-1180-b8ea-cf6c1a574c6f	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-563a-1180-2940-00142e1e40d2	Revizija-read	Revizija - branje	t
00030000-563a-1180-8b8e-8668a927901c	Revizija-write	Revizija - spreminjanje	t
00030000-563a-1180-4e1e-4536fc22b630	Rezervacija-read	Rezervacija - branje	t
00030000-563a-1180-e8da-8ff0dd2a10f2	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-563a-1180-d47d-0889f2ea5b7f	SedezniRed-read	SedezniRed - branje	t
00030000-563a-1180-5570-b8e4d204e70d	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-563a-1180-b880-f42ac7382be6	Sedez-read	Sedez - branje	t
00030000-563a-1180-c225-47d6f23bf40f	Sedez-write	Sedez - spreminjanje	t
00030000-563a-1180-c019-459e01d6b3a6	Sezona-read	Sezona - branje	t
00030000-563a-1180-8383-f33aec7e4378	Sezona-write	Sezona - spreminjanje	t
00030000-563a-1180-308c-5e8e8bf692c6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	t
00030000-563a-1180-acb9-f3a9c4113f18	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	t
00030000-563a-1180-5afa-622dfada2ce2	Stevilcenje-read	Stevilcenje - branje	t
00030000-563a-1180-d481-792f2b696416	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-563a-1180-f85d-8a62d4cef8dc	StevilcenjeStanje-read	StevilcenjeStanje - branje	t
00030000-563a-1180-49e6-c01cbb14413d	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	t
00030000-563a-1180-cae4-b86dcb186675	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-563a-1180-2dce-46f40f1f395b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-563a-1180-4deb-def90a352deb	Telefonska-read	Telefonska - branje	t
00030000-563a-1180-0574-1c2eebeac46b	Telefonska-write	Telefonska - spreminjanje	t
00030000-563a-1180-5d0a-2fd96da1d06e	TerminStoritve-read	TerminStoritve - branje	t
00030000-563a-1180-6667-f136e3ec93dd	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-563a-1180-c58e-b4c58ea72872	TipFunkcije-read	TipFunkcije - branje	t
00030000-563a-1180-52c8-3c0cf85051ac	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-563a-1180-2e94-4e655c817e98	TipPopa-read	TipPopa - branje	t
00030000-563a-1180-164d-66bca68a3924	TipPopa-write	TipPopa - spreminjanje	t
00030000-563a-1180-c58f-54b31e9bf48e	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-563a-1180-6f41-ce20f0e3e301	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-563a-1180-fe04-863ed46e1a0d	TipVaje-read	TipVaje - branje	t
00030000-563a-1180-7782-7429775da63e	TipVaje-write	TipVaje - spreminjanje	t
00030000-563a-1180-4996-aa025f314e97	Trr-read	Trr - branje	t
00030000-563a-1180-0e3e-09115b3f8719	Trr-write	Trr - spreminjanje	t
00030000-563a-1180-33a6-38e1020effa6	Uprizoritev-read	Uprizoritev - branje	t
00030000-563a-1180-2f9c-eb2933e4bce2	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-563a-1180-c7a4-c8ac55192b53	Vaja-read	Vaja - branje	t
00030000-563a-1180-32d2-72bdaee93200	Vaja-write	Vaja - spreminjanje	t
00030000-563a-1180-8bf0-324fd2757062	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-563a-1180-0108-efbb39f72a75	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-563a-1180-785a-8738835f1a2d	VrstaStroska-read	VrstaStroska - branje	t
00030000-563a-1180-3b44-4ed393024664	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-563a-1180-d51b-bd085c830ed8	Zaposlitev-read	Zaposlitev - branje	t
00030000-563a-1180-8ce4-29772d7c065b	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-563a-1180-bc56-04f82021c9c3	Zasedenost-read	Zasedenost - branje	t
00030000-563a-1180-b296-98277fa43d9c	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-563a-1180-c664-12f7a2ad3f85	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-563a-1180-68e1-e98165780684	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-563a-1180-d973-4a7d9ee24031	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-563a-1180-d2c0-df36da0b237c	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-563a-1180-7f13-f6b82873c280	Job-read	Branje opravil - samo zase - branje	t
00030000-563a-1180-1e40-c02a03c1b537	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-563a-1180-d9ef-0d74b893e531	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-563a-1180-c10d-5403a8e095ea	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-563a-1180-aade-0b698cc06fb5	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-563a-1180-4beb-9b181966743c	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-563a-1180-c6f5-b9135ea9984e	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-563a-1180-207a-96c315387810	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-563a-1180-d00e-6518ec8c5cdd	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-563a-1180-1e61-90c5e6fe229e	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563a-1180-0356-adcd761e01c9	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-563a-1180-b1bf-f5b3a446d306	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-563a-1180-0ebd-d0cfac6ac572	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-563a-1180-e56b-3023869fb00e	Datoteka-write	Datoteka - spreminjanje	t
00030000-563a-1180-c3ad-9a1a0e5b0361	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3098 (class 0 OID 25171276)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-563a-1180-69b8-265f8cc157e3	00030000-563a-1180-59e1-6d98076492b5
00020000-563a-1180-725b-1012d34554ec	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-d415-94f73603f51e
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-3fc6-a035d06c1601
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-bb3e-277d2142e8a7
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-0d4c-43fbe79ba6a4
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-46d7-9ddb4dbda8c2
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-f2df-e74513d44536
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-a076-498563e2bbd1
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-4db9-5b961231918a
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-63d1-93468dedc24d
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-6b9c-55eeff7ba322
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-201d-9ba2bf0b85fa
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-d7b4-d3bcf73dfa45
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-1be0-f793f232e889
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-3857-4aae0457c1e0
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-fb2a-79e37295d36f
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-c5f9-48a8568ce63e
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-ab41-3c1df7d0bcfe
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-639f-716e4493fa03
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-6a96-391bdf7e135c
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-9dd7-3d2ab86e9929
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-acfb-e69654cdfa7a
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-88d1-bb741731a91e
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-f9da-514c4c3dc6ca
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-07e7-03d3eedffc8e
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-3dec-1c219539aeaa
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-74f8-59ed63ed0f47
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-6dc7-b37e162c5369
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-eb8e-eb0c4243026a
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-3cd2-7d0b09425552
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-f875-875571292f4f
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-b406-c1597d338fb3
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-6565-92eb41881215
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-5007-f137700ea795
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-8cb3-efe13b909e0e
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-4e25-69ab07ce81fe
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-cc9d-46622fa61e73
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-b8ea-cf6c1a574c6f
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-c019-459e01d6b3a6
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-8383-f33aec7e4378
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-c58e-b4c58ea72872
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-33a6-38e1020effa6
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-2f9c-eb2933e4bce2
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-c7a4-c8ac55192b53
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-32d2-72bdaee93200
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-bc56-04f82021c9c3
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-b296-98277fa43d9c
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-c664-12f7a2ad3f85
00020000-563a-1180-bbd9-d758a88b9647	00030000-563a-1180-d973-4a7d9ee24031
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-d415-94f73603f51e
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-46d7-9ddb4dbda8c2
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-f2df-e74513d44536
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-d7b4-d3bcf73dfa45
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-3857-4aae0457c1e0
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-c5f9-48a8568ce63e
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-ab41-3c1df7d0bcfe
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-639f-716e4493fa03
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-6a96-391bdf7e135c
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-9dd7-3d2ab86e9929
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-acfb-e69654cdfa7a
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-88d1-bb741731a91e
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-07e7-03d3eedffc8e
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-74f8-59ed63ed0f47
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-6dc7-b37e162c5369
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-eb8e-eb0c4243026a
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-6565-92eb41881215
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-8cb3-efe13b909e0e
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-cc9d-46622fa61e73
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-c019-459e01d6b3a6
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-4deb-def90a352deb
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-0574-1c2eebeac46b
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-4996-aa025f314e97
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-0e3e-09115b3f8719
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-d51b-bd085c830ed8
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-8ce4-29772d7c065b
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-c664-12f7a2ad3f85
00020000-563a-1180-aaf7-8edb71cfa6d1	00030000-563a-1180-d973-4a7d9ee24031
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-d415-94f73603f51e
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-bb3e-277d2142e8a7
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-46d7-9ddb4dbda8c2
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-da7f-9c1ceef2c4c7
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-5f16-230f04b7889e
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-c24f-e86e1bb7a913
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-f2df-e74513d44536
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-6b9c-55eeff7ba322
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-d7b4-d3bcf73dfa45
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-3857-4aae0457c1e0
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-c5f9-48a8568ce63e
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-639f-716e4493fa03
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-6a96-391bdf7e135c
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-9dd7-3d2ab86e9929
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-88d1-bb741731a91e
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-07e7-03d3eedffc8e
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-eb8e-eb0c4243026a
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-f875-875571292f4f
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-6565-92eb41881215
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-8cb3-efe13b909e0e
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-cc9d-46622fa61e73
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-c019-459e01d6b3a6
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-c58e-b4c58ea72872
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-c7a4-c8ac55192b53
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-bc56-04f82021c9c3
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-c664-12f7a2ad3f85
00020000-563a-1180-becc-54687640b1b7	00030000-563a-1180-d973-4a7d9ee24031
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-d415-94f73603f51e
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-3fc6-a035d06c1601
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-0d4c-43fbe79ba6a4
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-46d7-9ddb4dbda8c2
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-f2df-e74513d44536
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-d7b4-d3bcf73dfa45
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-3857-4aae0457c1e0
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-639f-716e4493fa03
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-6a96-391bdf7e135c
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-88d1-bb741731a91e
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-07e7-03d3eedffc8e
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-eb8e-eb0c4243026a
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-6565-92eb41881215
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-8cb3-efe13b909e0e
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-cc9d-46622fa61e73
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-c019-459e01d6b3a6
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-c58e-b4c58ea72872
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-c664-12f7a2ad3f85
00020000-563a-1180-64c4-a38963bd2380	00030000-563a-1180-d973-4a7d9ee24031
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-d415-94f73603f51e
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-46d7-9ddb4dbda8c2
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-f2df-e74513d44536
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-d7b4-d3bcf73dfa45
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-3857-4aae0457c1e0
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-639f-716e4493fa03
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-6a96-391bdf7e135c
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-88d1-bb741731a91e
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-07e7-03d3eedffc8e
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-eb8e-eb0c4243026a
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-6565-92eb41881215
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-8cb3-efe13b909e0e
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-cc9d-46622fa61e73
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-c019-459e01d6b3a6
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-5d0a-2fd96da1d06e
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-a3f7-b0c126bf2da1
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-c58e-b4c58ea72872
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-c664-12f7a2ad3f85
00020000-563a-1180-37d3-921ee5d75d71	00030000-563a-1180-d973-4a7d9ee24031
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0a7e-23c093717229
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-59e1-6d98076492b5
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d415-94f73603f51e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3fc6-a035d06c1601
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-bb3e-277d2142e8a7
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0d4c-43fbe79ba6a4
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-46d7-9ddb4dbda8c2
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-da7f-9c1ceef2c4c7
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8751-8541a674065c
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5298-bfdac72b32bd
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5f16-230f04b7889e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-ac3e-6788310f2e0e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c24f-e86e1bb7a913
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5650-6b30ce4d58fd
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-f2df-e74513d44536
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-a076-498563e2bbd1
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4db9-5b961231918a
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3e9e-d2ca1eaa59c3
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0e99-6a22573857ac
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-fd89-aaadb9652ae0
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-63d1-93468dedc24d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-14de-75bba0bc692a
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b1ba-c20b755f967f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6b9c-55eeff7ba322
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-201d-9ba2bf0b85fa
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d7b4-d3bcf73dfa45
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-1be0-f793f232e889
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3857-4aae0457c1e0
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-fb2a-79e37295d36f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c5f9-48a8568ce63e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-ab41-3c1df7d0bcfe
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4b06-f7577cfc0c67
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-fd0d-bf7660ad210c
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-946b-77d7a429b98d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-28d7-7fe365de4637
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-639f-716e4493fa03
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6a96-391bdf7e135c
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b64e-04190717dad9
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0964-1232a4c279d0
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d208-3239722e39a6
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b129-a488819fc381
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-9dd7-3d2ab86e9929
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-f03a-e3fa41ad1ca1
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-acfb-e69654cdfa7a
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-92a4-b658dce33583
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-a23c-91a35c2f3d00
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-cb88-d60b8beb7d59
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8a95-f7a4fb9e54c0
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b1f0-8dfb548c66fb
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-093b-f1b55164fa77
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-88d1-bb741731a91e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-f9da-514c4c3dc6ca
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-07e7-03d3eedffc8e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-23d1-515ce642c5b4
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-9b7a-13609043e765
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-dc51-8f6e3cf796b0
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-df7a-a2c3223ba499
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3dec-1c219539aeaa
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-74f8-59ed63ed0f47
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6dc7-b37e162c5369
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-9b4c-93dcdbfa1318
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b198-0ada3798ce48
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-eb8e-eb0c4243026a
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3cd2-7d0b09425552
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-082a-027974b2f4c3
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4fe1-f552bf8c3e09
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-7fab-407099063477
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-15af-d501f7ebdfe7
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-f875-875571292f4f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b406-c1597d338fb3
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-7eea-d443c2786ba2
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5f59-bafd91008d0a
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-9991-9332a3deab5e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5144-adf07630382b
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5447-63f34bad1b15
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-a335-8896edfaf432
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0d0d-4c7f269c70db
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-94fb-b46286d4852e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-9a2c-f18932ea5cac
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-dbd1-c30839db8122
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b5a4-3b063795c35f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-66c2-972701776858
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-9403-feada9617f73
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-e8af-1fd6764e3efa
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-271c-f0c898e89932
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-20b2-6eaf252337bb
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8b0e-452f198f5583
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c9ab-30a080dfd250
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-1e86-ae4687a51a3a
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3b3c-a9f786e23085
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c968-cf2eed3fbfcb
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-710e-6d4ff9fd9396
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6565-92eb41881215
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5007-f137700ea795
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6eda-28065a6eeb10
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-985d-83b2e9263d8d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-efeb-9709b493c1cb
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-f7ff-9cf3277560f3
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8cb3-efe13b909e0e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4e25-69ab07ce81fe
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-cc9d-46622fa61e73
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b8ea-cf6c1a574c6f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-2940-00142e1e40d2
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8b8e-8668a927901c
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4e1e-4536fc22b630
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-e8da-8ff0dd2a10f2
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d47d-0889f2ea5b7f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5570-b8e4d204e70d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b880-f42ac7382be6
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c225-47d6f23bf40f
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c019-459e01d6b3a6
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8383-f33aec7e4378
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-308c-5e8e8bf692c6
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-acb9-f3a9c4113f18
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5afa-622dfada2ce2
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-f85d-8a62d4cef8dc
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-49e6-c01cbb14413d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d481-792f2b696416
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-cae4-b86dcb186675
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-2dce-46f40f1f395b
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4deb-def90a352deb
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0574-1c2eebeac46b
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-5d0a-2fd96da1d06e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-a3f7-b0c126bf2da1
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6667-f136e3ec93dd
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c58e-b4c58ea72872
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-52c8-3c0cf85051ac
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-2e94-4e655c817e98
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-164d-66bca68a3924
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c58f-54b31e9bf48e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-6f41-ce20f0e3e301
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-fe04-863ed46e1a0d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-7782-7429775da63e
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-4996-aa025f314e97
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0e3e-09115b3f8719
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-33a6-38e1020effa6
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-2f9c-eb2933e4bce2
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c7a4-c8ac55192b53
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-32d2-72bdaee93200
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8bf0-324fd2757062
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-0108-efbb39f72a75
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-785a-8738835f1a2d
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-3b44-4ed393024664
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d51b-bd085c830ed8
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-8ce4-29772d7c065b
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-bc56-04f82021c9c3
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-b296-98277fa43d9c
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-c664-12f7a2ad3f85
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-68e1-e98165780684
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d973-4a7d9ee24031
00020000-563a-1181-8bcd-92d3aa3fadf8	00030000-563a-1180-d2c0-df36da0b237c
\.


--
-- TOC entry 3135 (class 0 OID 25171666)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3139 (class 0 OID 25171700)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3151 (class 0 OID 25171837)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-563a-1182-0c00-b75aabd6a392	00090000-563a-1182-9dfd-c638c7921bb4	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-563a-1182-deea-f95ca3330c83	00090000-563a-1182-1142-a71519d3c626	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-563a-1182-3417-ce5971c127c4	00090000-563a-1182-9ca6-b3781a6ff9ec	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-563a-1182-4d04-003c66356389	00090000-563a-1182-d7b6-7ecc9b5cae3f	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3106 (class 0 OID 25171358)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-563a-1182-6e32-0ab715d52407	\N	00040000-563a-117f-e3bd-469d44758f65	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-4441-c36af5d32a59	\N	00040000-563a-117f-e3bd-469d44758f65	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-563a-1182-f354-75b315cdf364	\N	00040000-563a-117f-e3bd-469d44758f65	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-9c85-126d3f191226	\N	00040000-563a-117f-e3bd-469d44758f65	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-e153-f39e541f6311	\N	00040000-563a-117f-e3bd-469d44758f65	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-835b-c4f876af43fd	\N	00040000-563a-117f-4d0b-780fc56c16f0	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-e7ad-e4be1dce6044	\N	00040000-563a-117f-3ea1-10eafde6c7ec	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-1dc1-88fa93690151	\N	00040000-563a-117f-7856-7d716166aad6	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1182-9c23-47aa94f34b18	\N	00040000-563a-117f-722a-792a32ef0af7	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-563a-1183-375f-cadc20df4778	\N	00040000-563a-117f-e3bd-469d44758f65	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3109 (class 0 OID 25171403)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-563a-117f-651d-61692bf54091	8341	Adlešiči
00050000-563a-117f-b23a-df092f26dd24	5270	Ajdovščina
00050000-563a-117f-3ca5-47c24004df5a	6280	Ankaran/Ancarano
00050000-563a-117f-a09b-cae5f2929cb8	9253	Apače
00050000-563a-117f-5af5-4e074625c8aa	8253	Artiče
00050000-563a-117f-5bf5-0335162c71f9	4275	Begunje na Gorenjskem
00050000-563a-117f-6bca-691d3d8374f4	1382	Begunje pri Cerknici
00050000-563a-117f-c465-8ff2208063f3	9231	Beltinci
00050000-563a-117f-02e4-0daa15fda89c	2234	Benedikt
00050000-563a-117f-ec07-0cdfabc45e43	2345	Bistrica ob Dravi
00050000-563a-117f-94b1-998330599afc	3256	Bistrica ob Sotli
00050000-563a-117f-f8f2-6f4dc9791d7a	8259	Bizeljsko
00050000-563a-117f-2d1a-513f82c2007b	1223	Blagovica
00050000-563a-117f-30d5-e75332ed1b23	8283	Blanca
00050000-563a-117f-c420-658b5682dc13	4260	Bled
00050000-563a-117f-231b-a37047af70a2	4273	Blejska Dobrava
00050000-563a-117f-0365-0142fc874aaa	9265	Bodonci
00050000-563a-117f-ad94-326ffd2f82a5	9222	Bogojina
00050000-563a-117f-8169-8bd853a72026	4263	Bohinjska Bela
00050000-563a-117f-8f16-c97307e91dde	4264	Bohinjska Bistrica
00050000-563a-117f-500a-57398c87858b	4265	Bohinjsko jezero
00050000-563a-117f-95c2-be5bd4085646	1353	Borovnica
00050000-563a-117f-47b3-0201458e50a9	8294	Boštanj
00050000-563a-117f-68ab-8e34ad9f3982	5230	Bovec
00050000-563a-117f-5f19-88592b1c747f	5295	Branik
00050000-563a-117f-4195-ef86eb6e664a	3314	Braslovče
00050000-563a-117f-1f82-d87f76794ea6	5223	Breginj
00050000-563a-117f-8e2d-74ade518d5ec	8280	Brestanica
00050000-563a-117f-5ba5-c1e21d1e7e8d	2354	Bresternica
00050000-563a-117f-e0db-33206f77a136	4243	Brezje
00050000-563a-117f-dc2c-9711055a21c6	1351	Brezovica pri Ljubljani
00050000-563a-117f-0fe9-3a40d1bc8b42	8250	Brežice
00050000-563a-117f-5c1b-3b5f17c48db9	4210	Brnik - Aerodrom
00050000-563a-117f-9f0a-b34eb67d90e2	8321	Brusnice
00050000-563a-117f-1f8f-267111eccdcd	3255	Buče
00050000-563a-117f-fabb-ca069642b93e	8276	Bučka 
00050000-563a-117f-e662-873ed726251e	9261	Cankova
00050000-563a-117f-8297-0ba4bef7d25e	3000	Celje 
00050000-563a-117f-3889-502ec5d180b6	3001	Celje - poštni predali
00050000-563a-117f-6250-2aef8452f2d3	4207	Cerklje na Gorenjskem
00050000-563a-117f-e1ac-ee9e001f86bd	8263	Cerklje ob Krki
00050000-563a-117f-5438-73b0686eb20d	1380	Cerknica
00050000-563a-117f-0ff4-418da32c6dae	5282	Cerkno
00050000-563a-117f-eeab-28622b0d0bfd	2236	Cerkvenjak
00050000-563a-117f-6057-406b8be5eb21	2215	Ceršak
00050000-563a-117f-2416-48ae69c45b8e	2326	Cirkovce
00050000-563a-117f-f1b7-4c3614848a9b	2282	Cirkulane
00050000-563a-117f-2dc1-9f9da9796550	5273	Col
00050000-563a-117f-103c-b24b10a399d5	8251	Čatež ob Savi
00050000-563a-117f-d98a-39727a26410d	1413	Čemšenik
00050000-563a-117f-9c14-0fec76a667db	5253	Čepovan
00050000-563a-117f-e17f-2c3cb7ce10b8	9232	Črenšovci
00050000-563a-117f-08ad-31e5488e1935	2393	Črna na Koroškem
00050000-563a-117f-6b58-bef8e168e985	6275	Črni Kal
00050000-563a-117f-ee5f-71d913baaeb1	5274	Črni Vrh nad Idrijo
00050000-563a-117f-0538-e7ef4def0abb	5262	Črniče
00050000-563a-117f-73c1-28d02f59d065	8340	Črnomelj
00050000-563a-117f-ac09-9addad44a332	6271	Dekani
00050000-563a-117f-97f6-194621e0a36c	5210	Deskle
00050000-563a-117f-dc7c-c86171e5ca75	2253	Destrnik
00050000-563a-117f-3d8f-3833c8e96efd	6215	Divača
00050000-563a-117f-45c3-5c2422255d52	1233	Dob
00050000-563a-117f-e38e-409ba66fa710	3224	Dobje pri Planini
00050000-563a-117f-d412-7a4d909f048c	8257	Dobova
00050000-563a-117f-cb4c-dc2a52efb614	1423	Dobovec
00050000-563a-117f-fafa-c862e7d58305	5263	Dobravlje
00050000-563a-117f-5033-70da51fea424	3204	Dobrna
00050000-563a-117f-55ca-76c634d46566	8211	Dobrnič
00050000-563a-117f-8295-bb23be881b41	1356	Dobrova
00050000-563a-117f-689e-348eeaa59b7e	9223	Dobrovnik/Dobronak 
00050000-563a-117f-bf9d-e82e5d95dd35	5212	Dobrovo v Brdih
00050000-563a-117f-8e49-0b9e4f9f5fd2	1431	Dol pri Hrastniku
00050000-563a-117f-8625-31cebcd4185d	1262	Dol pri Ljubljani
00050000-563a-117f-9f17-17b591e27fe0	1273	Dole pri Litiji
00050000-563a-117f-4aab-c9153d3042dc	1331	Dolenja vas
00050000-563a-117f-0d48-fdceb8fbcdfd	8350	Dolenjske Toplice
00050000-563a-117f-0bdd-4dcce646a883	1230	Domžale
00050000-563a-117f-7e50-28f7a45ad444	2252	Dornava
00050000-563a-117f-fc1c-b7231f02e893	5294	Dornberk
00050000-563a-117f-b13c-9a63d941aaa8	1319	Draga
00050000-563a-117f-21de-8df698639835	8343	Dragatuš
00050000-563a-117f-7a95-3397fa0e8385	3222	Dramlje
00050000-563a-117f-590d-b195fd14c77b	2370	Dravograd
00050000-563a-117f-09c0-0aa9fc4a72b1	4203	Duplje
00050000-563a-117f-2201-52296fa1a04a	6221	Dutovlje
00050000-563a-117f-5693-ba83eb6d9bae	8361	Dvor
00050000-563a-117f-c4da-c02f76491e7c	2343	Fala
00050000-563a-117f-8169-787fae056422	9208	Fokovci
00050000-563a-117f-8f51-c3f327513d70	2313	Fram
00050000-563a-117f-2617-b280eaf95dc6	3213	Frankolovo
00050000-563a-117f-3607-bbb297efab01	1274	Gabrovka
00050000-563a-117f-e2a4-8cea80985b6d	8254	Globoko
00050000-563a-117f-bedc-fabc4710afdc	5275	Godovič
00050000-563a-117f-20a7-332e4535d8d6	4204	Golnik
00050000-563a-117f-37ba-8644bdfbe7c0	3303	Gomilsko
00050000-563a-117f-34e2-61c66464727f	4224	Gorenja vas
00050000-563a-117f-fb08-959c4d66eb31	3263	Gorica pri Slivnici
00050000-563a-117f-8ae6-5f04bf9c1c13	2272	Gorišnica
00050000-563a-117f-a041-6ad353766033	9250	Gornja Radgona
00050000-563a-117f-313e-474eaf26b87a	3342	Gornji Grad
00050000-563a-117f-49ca-6471cce5444e	4282	Gozd Martuljek
00050000-563a-117f-6948-c465c25b3c00	6272	Gračišče
00050000-563a-117f-13e6-4da6fb1371f4	9264	Grad
00050000-563a-117f-bc15-3b977a93416a	8332	Gradac
00050000-563a-117f-22d3-1dcc5b371d31	1384	Grahovo
00050000-563a-117f-5f8d-fc170c36f5c7	5242	Grahovo ob Bači
00050000-563a-117f-ab44-cf7ccf95d1dd	5251	Grgar
00050000-563a-117f-304f-846986df3701	3302	Griže
00050000-563a-117f-ec2b-d119db4daa39	3231	Grobelno
00050000-563a-117f-6e93-5f45744ba8fa	1290	Grosuplje
00050000-563a-117f-6ac4-62501664a5f8	2288	Hajdina
00050000-563a-117f-0a59-38f5323c540c	8362	Hinje
00050000-563a-117f-4032-1b404bc5b31c	2311	Hoče
00050000-563a-117f-20ba-e4292a802730	9205	Hodoš/Hodos
00050000-563a-117f-05d8-bd7c91d84599	1354	Horjul
00050000-563a-117f-28a4-95a39d876f73	1372	Hotedršica
00050000-563a-117f-b4ff-5f5853dce714	1430	Hrastnik
00050000-563a-117f-170e-5d3e279e58b9	6225	Hruševje
00050000-563a-117f-6a58-c237cc772948	4276	Hrušica
00050000-563a-117f-aa5c-c175dee68469	5280	Idrija
00050000-563a-117f-bc52-d373c881d891	1292	Ig
00050000-563a-117f-127a-ad2e6cd1f515	6250	Ilirska Bistrica
00050000-563a-117f-49bd-41cb0171290a	6251	Ilirska Bistrica-Trnovo
00050000-563a-117f-4843-79f147d8af09	1295	Ivančna Gorica
00050000-563a-117f-5935-dc43d6218153	2259	Ivanjkovci
00050000-563a-117f-c898-757cdd9f0a54	1411	Izlake
00050000-563a-117f-8647-fc5a42f851ea	6310	Izola/Isola
00050000-563a-117f-1d39-846f08e780be	2222	Jakobski Dol
00050000-563a-117f-3fb5-e9d03224863f	2221	Jarenina
00050000-563a-117f-0118-53867565b667	6254	Jelšane
00050000-563a-117f-8798-941a2f0bd67d	4270	Jesenice
00050000-563a-117f-2a44-e1f94f8c9be1	8261	Jesenice na Dolenjskem
00050000-563a-117f-2b2d-6b1abab9f772	3273	Jurklošter
00050000-563a-117f-6269-dac97927be3e	2223	Jurovski Dol
00050000-563a-117f-f933-d4d30e38a331	2256	Juršinci
00050000-563a-117f-43a5-52811cc756e6	5214	Kal nad Kanalom
00050000-563a-117f-32fd-d577c3dbb772	3233	Kalobje
00050000-563a-117f-8ee8-025bc71dcc09	4246	Kamna Gorica
00050000-563a-117f-aced-289ebcae6ced	2351	Kamnica
00050000-563a-117f-41f4-ffb31f0deefd	1241	Kamnik
00050000-563a-117f-93e8-401db1d14a0e	5213	Kanal
00050000-563a-117f-28d9-5cebf0a87b49	8258	Kapele
00050000-563a-117f-a6f2-2ce05b5eba8c	2362	Kapla
00050000-563a-117f-2fb0-27c0f4845321	2325	Kidričevo
00050000-563a-117f-dcd2-235724ba88d9	1412	Kisovec
00050000-563a-117f-1444-452f61b74e05	6253	Knežak
00050000-563a-117f-a5a5-29ed5b39c671	5222	Kobarid
00050000-563a-117f-e3c6-4f64ce5f1986	9227	Kobilje
00050000-563a-117f-c08a-81361809215d	1330	Kočevje
00050000-563a-117f-3a44-267ae2fe51dc	1338	Kočevska Reka
00050000-563a-117f-db31-abd96daec6b6	2276	Kog
00050000-563a-117f-1f3c-77336dfb98c7	5211	Kojsko
00050000-563a-117f-c878-9260a1931277	6223	Komen
00050000-563a-117f-3209-8796b9ca45ae	1218	Komenda
00050000-563a-117f-478f-e64b5ef15ca1	6000	Koper/Capodistria 
00050000-563a-117f-0849-ffa7aa4138a3	6001	Koper/Capodistria - poštni predali
00050000-563a-117f-02fd-ef292e5a67e5	8282	Koprivnica
00050000-563a-117f-4437-6c25c59ffc5e	5296	Kostanjevica na Krasu
00050000-563a-117f-317b-52ab0b58da5c	8311	Kostanjevica na Krki
00050000-563a-117f-0dd7-d2dfdf2f013a	1336	Kostel
00050000-563a-117f-b56a-50331e1c19a4	6256	Košana
00050000-563a-117f-40a5-7c105d699c52	2394	Kotlje
00050000-563a-117f-9446-e66840a64f62	6240	Kozina
00050000-563a-117f-a25a-f82a402cfffb	3260	Kozje
00050000-563a-117f-01fe-33eddc4ff2e2	4000	Kranj 
00050000-563a-117f-e487-5a3ba38b86df	4001	Kranj - poštni predali
00050000-563a-117f-38fe-9c80ad959ae3	4280	Kranjska Gora
00050000-563a-117f-eb77-226cd5464a6a	1281	Kresnice
00050000-563a-117f-315c-4d33f6c88887	4294	Križe
00050000-563a-117f-e287-dd37d57a2224	9206	Križevci
00050000-563a-117f-44bc-a96adb425179	9242	Križevci pri Ljutomeru
00050000-563a-117f-6124-c62e236b0a0f	1301	Krka
00050000-563a-117f-28b4-31d51647228c	8296	Krmelj
00050000-563a-117f-cb5a-523aaccf9ee2	4245	Kropa
00050000-563a-117f-35fe-8b6cd7704b82	8262	Krška vas
00050000-563a-117f-e0d8-a44b176f7a98	8270	Krško
00050000-563a-117f-175e-d6bd18ab3dbf	9263	Kuzma
00050000-563a-117f-0297-8d981ed74467	2318	Laporje
00050000-563a-117f-a9e9-613bbab55ace	3270	Laško
00050000-563a-117f-c832-f744f35e5948	1219	Laze v Tuhinju
00050000-563a-117f-7854-4ab2b24c8337	2230	Lenart v Slovenskih goricah
00050000-563a-117f-01ba-0a4dcc23869d	9220	Lendava/Lendva
00050000-563a-117f-044e-03a13b16a87b	4248	Lesce
00050000-563a-117f-72d9-4b7891924946	3261	Lesično
00050000-563a-117f-2df0-fdcd1b40384b	8273	Leskovec pri Krškem
00050000-563a-117f-c22e-58e60fd00876	2372	Libeliče
00050000-563a-117f-8b89-f82d65b5426f	2341	Limbuš
00050000-563a-117f-7f58-82ea339f5d72	1270	Litija
00050000-563a-117f-5bfc-acca67d2fc44	3202	Ljubečna
00050000-563a-117f-289e-1238127e2b07	1000	Ljubljana 
00050000-563a-117f-cc4f-3bb446d5a3de	1001	Ljubljana - poštni predali
00050000-563a-117f-3d30-b19f1c582baf	1231	Ljubljana - Črnuče
00050000-563a-117f-1eaa-3889d9d1c10f	1261	Ljubljana - Dobrunje
00050000-563a-117f-08c7-08d1441d6a9f	1260	Ljubljana - Polje
00050000-563a-117f-d6d8-00467e271435	1210	Ljubljana - Šentvid
00050000-563a-117f-6083-69442d856329	1211	Ljubljana - Šmartno
00050000-563a-117f-528a-d36d9474b780	3333	Ljubno ob Savinji
00050000-563a-117f-9ef1-acfc8dc2de6d	9240	Ljutomer
00050000-563a-117f-d22e-b600d8cfd54c	3215	Loče
00050000-563a-117f-cdea-a92bdd3eafd4	5231	Log pod Mangartom
00050000-563a-117f-afc1-0fb01ad957f7	1358	Log pri Brezovici
00050000-563a-117f-dacc-140f8ee81068	1370	Logatec
00050000-563a-117f-47c5-04e9b58145c8	1371	Logatec
00050000-563a-117f-52f1-721ff67c1857	1434	Loka pri Zidanem Mostu
00050000-563a-117f-2d09-624bd645237d	3223	Loka pri Žusmu
00050000-563a-117f-af52-c8b6d886db20	6219	Lokev
00050000-563a-117f-6dea-e16d0dcf0a0e	1318	Loški Potok
00050000-563a-117f-f098-426ca66ef108	2324	Lovrenc na Dravskem polju
00050000-563a-117f-0728-53884538ade2	2344	Lovrenc na Pohorju
00050000-563a-117f-61a6-586529665304	3334	Luče
00050000-563a-117f-3f0b-71ae91a93e0b	1225	Lukovica
00050000-563a-117f-b02e-b8e755b6a55b	9202	Mačkovci
00050000-563a-117f-7ac0-2d502177a53a	2322	Majšperk
00050000-563a-117f-55ab-69a30e362fcc	2321	Makole
00050000-563a-117f-b477-7e73eede836a	9243	Mala Nedelja
00050000-563a-117f-5262-a7f3a1169081	2229	Malečnik
00050000-563a-117f-72eb-d01d707a25e7	6273	Marezige
00050000-563a-117f-ce7b-82ce22c83033	2000	Maribor 
00050000-563a-117f-a9d6-38cc55ac37b4	2001	Maribor - poštni predali
00050000-563a-117f-0218-f042554e7eb1	2206	Marjeta na Dravskem polju
00050000-563a-117f-6188-51c8934c901f	2281	Markovci
00050000-563a-117f-b93f-9b12a7403a94	9221	Martjanci
00050000-563a-117f-5f9b-f517c5c0f9c0	6242	Materija
00050000-563a-117f-3c15-5a840c3d0bdf	4211	Mavčiče
00050000-563a-117f-66e2-29b1641aab2e	1215	Medvode
00050000-563a-117f-f011-c841e4365619	1234	Mengeš
00050000-563a-117f-6631-7891ea570f46	8330	Metlika
00050000-563a-117f-0bf5-f1b6627dbc25	2392	Mežica
00050000-563a-117f-1de5-cfb382e09f94	2204	Miklavž na Dravskem polju
00050000-563a-117f-1ec4-4ba33780f919	2275	Miklavž pri Ormožu
00050000-563a-117f-18e4-0de3322539f1	5291	Miren
00050000-563a-117f-1edd-36b0bf2d9079	8233	Mirna
00050000-563a-117f-f923-32f1a75e3873	8216	Mirna Peč
00050000-563a-117f-e56a-1c8dbe4ade79	2382	Mislinja
00050000-563a-117f-01cb-18e258c37feb	4281	Mojstrana
00050000-563a-117f-9c6f-7ff99dfeb6de	8230	Mokronog
00050000-563a-117f-ce58-b12d51cf3aa7	1251	Moravče
00050000-563a-117f-577b-2beb5f8609fd	9226	Moravske Toplice
00050000-563a-117f-99cf-b08dc95323b1	5216	Most na Soči
00050000-563a-117f-b078-21b9fd8f0c17	1221	Motnik
00050000-563a-117f-78d7-68abb380f8a4	3330	Mozirje
00050000-563a-117f-c723-8f68a848ec8f	9000	Murska Sobota 
00050000-563a-117f-a6cd-a7eaa8f532ef	9001	Murska Sobota - poštni predali
00050000-563a-117f-5769-c6506515c602	2366	Muta
00050000-563a-117f-1cbd-ad5f0a0ffea8	4202	Naklo
00050000-563a-117f-2219-20f39eb12311	3331	Nazarje
00050000-563a-117f-d7d8-06642ce32909	1357	Notranje Gorice
00050000-563a-117f-20fe-128be633052d	3203	Nova Cerkev
00050000-563a-117f-f32b-792afb4822ff	5000	Nova Gorica 
00050000-563a-117f-af49-e569c81d092d	5001	Nova Gorica - poštni predali
00050000-563a-117f-5ab4-228caddf3d77	1385	Nova vas
00050000-563a-117f-4c72-c4fc00c9d9ea	8000	Novo mesto
00050000-563a-117f-a0fc-13bad3ffa68c	8001	Novo mesto - poštni predali
00050000-563a-117f-0ea5-ba98f4b07ac2	6243	Obrov
00050000-563a-117f-5f97-6151be8ac351	9233	Odranci
00050000-563a-117f-a7a7-63169885d3da	2317	Oplotnica
00050000-563a-117f-b719-86f43e189367	2312	Orehova vas
00050000-563a-117f-0cec-1058bc0b21b6	2270	Ormož
00050000-563a-117f-3d2a-0aa6964a51de	1316	Ortnek
00050000-563a-117f-0db3-8c786a0ae518	1337	Osilnica
00050000-563a-117f-ccca-3105d9949777	8222	Otočec
00050000-563a-117f-af1f-6a034f7c3616	2361	Ožbalt
00050000-563a-117f-201b-42161c80ca43	2231	Pernica
00050000-563a-117f-4c0f-03717cd23a48	2211	Pesnica pri Mariboru
00050000-563a-117f-e05d-94519c28d218	9203	Petrovci
00050000-563a-117f-4341-10b7cadd471e	3301	Petrovče
00050000-563a-117f-dc3c-ac9c5bf26ec8	6330	Piran/Pirano
00050000-563a-117f-616c-8f54af651d73	8255	Pišece
00050000-563a-117f-f5f4-138973300638	6257	Pivka
00050000-563a-117f-24d9-c7e5a7d7a3a4	6232	Planina
00050000-563a-117f-64aa-bd163d056d6a	3225	Planina pri Sevnici
00050000-563a-117f-66a3-969f18535e8d	6276	Pobegi
00050000-563a-117f-8792-88a51ec84974	8312	Podbočje
00050000-563a-117f-5ca5-016b2a2bade2	5243	Podbrdo
00050000-563a-117f-64eb-44e151730d5d	3254	Podčetrtek
00050000-563a-117f-6df8-90e9a1cdbc26	2273	Podgorci
00050000-563a-117f-468f-c197098d34aa	6216	Podgorje
00050000-563a-117f-28df-3cc54a3d6b8e	2381	Podgorje pri Slovenj Gradcu
00050000-563a-117f-96fc-bd3d23ed4d5a	6244	Podgrad
00050000-563a-117f-51a3-8bacccc95c52	1414	Podkum
00050000-563a-117f-a7fd-4fabcb64102d	2286	Podlehnik
00050000-563a-117f-64dc-ed7420475b80	5272	Podnanos
00050000-563a-117f-8180-8341b33fd503	4244	Podnart
00050000-563a-117f-1766-3dbfcfca4f5e	3241	Podplat
00050000-563a-117f-d1d8-1aff97a6920a	3257	Podsreda
00050000-563a-117f-2c92-a6b2689b1820	2363	Podvelka
00050000-563a-117f-3fce-198ef745c49c	2208	Pohorje
00050000-563a-117f-7646-c6f19574cd6c	2257	Polenšak
00050000-563a-117f-a439-47a13b43cb93	1355	Polhov Gradec
00050000-563a-117f-0c18-34e076dd894d	4223	Poljane nad Škofjo Loko
00050000-563a-117f-b568-1406183ec409	2319	Poljčane
00050000-563a-117f-f379-5a785609921f	1272	Polšnik
00050000-563a-117f-fc80-fe24e4cb7329	3313	Polzela
00050000-563a-117f-0371-d73c90eb7da9	3232	Ponikva
00050000-563a-117f-7949-a9af0b3feb4c	6320	Portorož/Portorose
00050000-563a-117f-3543-b1d7f61ccccc	6230	Postojna
00050000-563a-117f-41c6-cbffab428d70	2331	Pragersko
00050000-563a-117f-940b-6195988c1ff0	3312	Prebold
00050000-563a-117f-a106-826c76dddbb4	4205	Preddvor
00050000-563a-117f-c040-92772bf60964	6255	Prem
00050000-563a-117f-20b2-b30b022393d6	1352	Preserje
00050000-563a-117f-2d3e-d4ba11fd678b	6258	Prestranek
00050000-563a-117f-238f-e9e9266d1b9d	2391	Prevalje
00050000-563a-117f-2277-28240e856eb3	3262	Prevorje
00050000-563a-117f-7fa2-eff32ca645af	1276	Primskovo 
00050000-563a-117f-dff5-75e4afa2d9ad	3253	Pristava pri Mestinju
00050000-563a-117f-0efc-396e5def8e5e	9207	Prosenjakovci/Partosfalva
00050000-563a-117f-7447-ec02a68d5fc6	5297	Prvačina
00050000-563a-117f-4331-b4c91f616436	2250	Ptuj
00050000-563a-117f-c5f9-9ac46f42705e	2323	Ptujska Gora
00050000-563a-117f-407a-f63b2827bea9	9201	Puconci
00050000-563a-117f-ba28-358ac1b5959e	2327	Rače
00050000-563a-117f-4fd4-e9f52f102842	1433	Radeče
00050000-563a-117f-48cf-6ef04f5d13c2	9252	Radenci
00050000-563a-117f-bef8-3f2bb74e7662	2360	Radlje ob Dravi
00050000-563a-117f-2548-e4a1ce91b02f	1235	Radomlje
00050000-563a-117f-da3a-93ce53f60e29	4240	Radovljica
00050000-563a-117f-ad8b-933a03026f66	8274	Raka
00050000-563a-117f-fe2a-9e152bf8fcfc	1381	Rakek
00050000-563a-117f-4f53-27029c4dda5f	4283	Rateče - Planica
00050000-563a-117f-57b9-7e15a7cce34b	2390	Ravne na Koroškem
00050000-563a-117f-c398-3e128502b1aa	9246	Razkrižje
00050000-563a-117f-6af5-9596305f89f9	3332	Rečica ob Savinji
00050000-563a-117f-0a80-a6e7fd1648b1	5292	Renče
00050000-563a-117f-da75-2a8eeb6b485b	1310	Ribnica
00050000-563a-117f-72a3-da8cf27d284f	2364	Ribnica na Pohorju
00050000-563a-117f-607f-2c8d7a878bf3	3272	Rimske Toplice
00050000-563a-117f-25c0-a9fdf4fcb746	1314	Rob
00050000-563a-117f-f159-d9df094c20c4	5215	Ročinj
00050000-563a-117f-6e50-28d2a20ef15c	3250	Rogaška Slatina
00050000-563a-117f-eca2-57b7d308f5ea	9262	Rogašovci
00050000-563a-117f-1939-7f288df69cc3	3252	Rogatec
00050000-563a-117f-b0e4-777b12b66f6f	1373	Rovte
00050000-563a-117f-ef3e-ca11093ebc3c	2342	Ruše
00050000-563a-117f-c302-833eba49e446	1282	Sava
00050000-563a-117f-ba6c-01f6d50b69eb	6333	Sečovlje/Sicciole
00050000-563a-117f-ea0a-0481e2eedd1b	4227	Selca
00050000-563a-117f-accb-79ef124cfa1a	2352	Selnica ob Dravi
00050000-563a-117f-838f-801537109cb8	8333	Semič
00050000-563a-117f-504a-6256b7162f36	8281	Senovo
00050000-563a-117f-70ab-b0671f4d64cc	6224	Senožeče
00050000-563a-117f-7785-51a6cec22505	8290	Sevnica
00050000-563a-117f-c42b-8fe29dc29706	6210	Sežana
00050000-563a-117f-02aa-91efedc8536f	2214	Sladki Vrh
00050000-563a-117f-c4e3-dfd10c55ecf0	5283	Slap ob Idrijci
00050000-563a-117f-116b-ddeda679f6ca	2380	Slovenj Gradec
00050000-563a-117f-547f-106695157acd	2310	Slovenska Bistrica
00050000-563a-117f-9ca9-abc6cec2ece2	3210	Slovenske Konjice
00050000-563a-117f-8e8f-de79d0de3b96	1216	Smlednik
00050000-563a-117f-2ce7-3c859633b246	5232	Soča
00050000-563a-117f-746c-7d2467e4ff38	1317	Sodražica
00050000-563a-117f-f61a-2b48adfd1ee9	3335	Solčava
00050000-563a-117f-4cfd-cf42b0f98ef2	5250	Solkan
00050000-563a-117f-8b77-68a8ee11009d	4229	Sorica
00050000-563a-117f-aecb-214f62b47bd7	4225	Sovodenj
00050000-563a-117f-d4c1-9ded91d8c83c	5281	Spodnja Idrija
00050000-563a-117f-b585-b2bc21bd27b2	2241	Spodnji Duplek
00050000-563a-117f-0621-5b920fc120e3	9245	Spodnji Ivanjci
00050000-563a-117f-3618-5e0a32a94d0a	2277	Središče ob Dravi
00050000-563a-117f-e2f5-b10ef43a3e2a	4267	Srednja vas v Bohinju
00050000-563a-117f-c5d2-3d02decc9d6a	8256	Sromlje 
00050000-563a-117f-b9de-540cb50befc2	5224	Srpenica
00050000-563a-117f-1e10-1adf6950b1b4	1242	Stahovica
00050000-563a-117f-2ecf-c23c2892bca2	1332	Stara Cerkev
00050000-563a-117f-48b3-30464922d9f1	8342	Stari trg ob Kolpi
00050000-563a-117f-8e0b-276cd38439b6	1386	Stari trg pri Ložu
00050000-563a-117f-9315-7e439d4ab532	2205	Starše
00050000-563a-117f-89ef-780c4159e838	2289	Stoperce
00050000-563a-117f-da3f-2ac5f67c543f	8322	Stopiče
00050000-563a-117f-3f1c-c360301cf82c	3206	Stranice
00050000-563a-117f-7d40-823c02375a01	8351	Straža
00050000-563a-117f-bc9f-ad88866d693c	1313	Struge
00050000-563a-117f-d56d-5d50d18035cb	8293	Studenec
00050000-563a-117f-eab2-c356742ebdbf	8331	Suhor
00050000-563a-117f-cac9-4fb2d2893fb1	2233	Sv. Ana v Slovenskih goricah
00050000-563a-117f-07cf-e9a1ad2de82d	2235	Sv. Trojica v Slovenskih goricah
00050000-563a-117f-843c-56263f5c3dcb	2353	Sveti Duh na Ostrem Vrhu
00050000-563a-117f-74f4-b4b7ae82e3cc	9244	Sveti Jurij ob Ščavnici
00050000-563a-117f-40f4-9cda80852647	3264	Sveti Štefan
00050000-563a-117f-0118-bd745c9391ff	2258	Sveti Tomaž
00050000-563a-117f-8eab-3882fe603dcd	9204	Šalovci
00050000-563a-117f-1527-6ad4c28ce714	5261	Šempas
00050000-563a-117f-da2f-47b3207311e8	5290	Šempeter pri Gorici
00050000-563a-117f-8018-e7487bd392b3	3311	Šempeter v Savinjski dolini
00050000-563a-117f-c40e-b7143f7f03b1	4208	Šenčur
00050000-563a-117f-ab30-944a4ec7e96b	2212	Šentilj v Slovenskih goricah
00050000-563a-117f-2226-3d1bef2e9fe1	8297	Šentjanž
00050000-563a-117f-7f9e-e47c91ce0cb4	2373	Šentjanž pri Dravogradu
00050000-563a-117f-6ffe-8e4c05388311	8310	Šentjernej
00050000-563a-117f-365e-a0deeda7cc34	3230	Šentjur
00050000-563a-117f-e398-7b090f0001d7	3271	Šentrupert
00050000-563a-117f-e362-debf7a3c7dfa	8232	Šentrupert
00050000-563a-117f-bf95-c4af97daffb6	1296	Šentvid pri Stični
00050000-563a-117f-2832-1c57ed68ef77	8275	Škocjan
00050000-563a-117f-a125-0764a944ba9b	6281	Škofije
00050000-563a-117f-fd2c-c0290a8dab36	4220	Škofja Loka
00050000-563a-117f-80a8-6f2eadd54610	3211	Škofja vas
00050000-563a-117f-4082-826ca3b85700	1291	Škofljica
00050000-563a-117f-bd8e-087378d6b483	6274	Šmarje
00050000-563a-117f-0cc1-3bb73802ccae	1293	Šmarje - Sap
00050000-563a-117f-fc24-ce9320d94a1f	3240	Šmarje pri Jelšah
00050000-563a-117f-bc96-2f49ac51bdcf	8220	Šmarješke Toplice
00050000-563a-117f-b117-36f643b32adc	2315	Šmartno na Pohorju
00050000-563a-117f-42f6-63d126bc529b	3341	Šmartno ob Dreti
00050000-563a-117f-29f6-69a24893653c	3327	Šmartno ob Paki
00050000-563a-117f-a97b-ec885874ca6d	1275	Šmartno pri Litiji
00050000-563a-117f-b8e2-7c633f34c668	2383	Šmartno pri Slovenj Gradcu
00050000-563a-117f-5d22-e12f444bb1d3	3201	Šmartno v Rožni dolini
00050000-563a-117f-9720-ac3202cb723d	3325	Šoštanj
00050000-563a-117f-a9da-37ffd11e792b	6222	Štanjel
00050000-563a-117f-2dc2-be80761220b2	3220	Štore
00050000-563a-117f-4dbe-2a2160c785f0	3304	Tabor
00050000-563a-117f-8b62-a20b4e84486d	3221	Teharje
00050000-563a-117f-3626-afd42e67bb37	9251	Tišina
00050000-563a-117f-b7f6-d78a9cc2c8fa	5220	Tolmin
00050000-563a-117f-93aa-9856a171707e	3326	Topolšica
00050000-563a-117f-9464-9c3525b7ecba	2371	Trbonje
00050000-563a-117f-d236-e3b982e4f2e0	1420	Trbovlje
00050000-563a-117f-85d7-9cdbae26cdfb	8231	Trebelno 
00050000-563a-117f-76b0-876bfa677259	8210	Trebnje
00050000-563a-117f-b5d6-5bcab777f71d	5252	Trnovo pri Gorici
00050000-563a-117f-2949-550f4b98e033	2254	Trnovska vas
00050000-563a-117f-3a6a-8bd0521b0cd6	1222	Trojane
00050000-563a-117f-3f97-7fe207b27822	1236	Trzin
00050000-563a-117f-bf89-f7a4793c4940	4290	Tržič
00050000-563a-117f-1f3b-338b00457177	8295	Tržišče
00050000-563a-117f-0e59-067eb322b528	1311	Turjak
00050000-563a-117f-c877-2ccd0fa595ba	9224	Turnišče
00050000-563a-117f-3c72-ad46a061a4c2	8323	Uršna sela
00050000-563a-117f-f80f-ac95ebe17e3b	1252	Vače
00050000-563a-117f-7a83-45c580639279	3320	Velenje 
00050000-563a-117f-25c1-4716a0082523	3322	Velenje - poštni predali
00050000-563a-117f-ef16-1563504ea431	8212	Velika Loka
00050000-563a-117f-1f1e-298610186a71	2274	Velika Nedelja
00050000-563a-117f-6668-3a41df4945d9	9225	Velika Polana
00050000-563a-117f-50c1-e1b2d7441a6c	1315	Velike Lašče
00050000-563a-117f-d84a-13443e6b4fc2	8213	Veliki Gaber
00050000-563a-117f-3879-3c7793a59cfe	9241	Veržej
00050000-563a-117f-4392-86a5a46c394e	1312	Videm - Dobrepolje
00050000-563a-117f-8e61-9e674f73e7eb	2284	Videm pri Ptuju
00050000-563a-117f-9627-5b30154027cc	8344	Vinica
00050000-563a-117f-0384-8717aa24aabc	5271	Vipava
00050000-563a-117f-d281-87cdb2d6acca	4212	Visoko
00050000-563a-117f-997d-6ce633087006	1294	Višnja Gora
00050000-563a-117f-0f28-9eae980726f5	3205	Vitanje
00050000-563a-117f-7ea4-1fd51bcfe73b	2255	Vitomarci
00050000-563a-117f-d90c-ea5641c98242	1217	Vodice
00050000-563a-117f-7465-ad12d01d6ca3	3212	Vojnik\t
00050000-563a-117f-090a-7653ae21f967	5293	Volčja Draga
00050000-563a-117f-5f96-e2dfecb7513b	2232	Voličina
00050000-563a-117f-d630-49292a6dab13	3305	Vransko
00050000-563a-117f-5d17-fd668959c2f1	6217	Vremski Britof
00050000-563a-117f-9977-44e09aa5ac40	1360	Vrhnika
00050000-563a-117f-addb-f2d54f4c2eeb	2365	Vuhred
00050000-563a-117f-619d-db6b221ad679	2367	Vuzenica
00050000-563a-117f-a9f4-09941ef1f12c	8292	Zabukovje 
00050000-563a-117f-0cf0-d0c96fff2762	1410	Zagorje ob Savi
00050000-563a-117f-e870-3b105daca39c	1303	Zagradec
00050000-563a-117f-9321-0262e86ec0f4	2283	Zavrč
00050000-563a-117f-d925-d91c16b30ad3	8272	Zdole 
00050000-563a-117f-4036-a347510cf2a0	4201	Zgornja Besnica
00050000-563a-117f-864a-50f5b57bd05c	2242	Zgornja Korena
00050000-563a-117f-7466-ac19feafe309	2201	Zgornja Kungota
00050000-563a-117f-0385-f44d50c6ae64	2316	Zgornja Ložnica
00050000-563a-117f-d71b-5b508939fe62	2314	Zgornja Polskava
00050000-563a-117f-845f-a7b7f065656c	2213	Zgornja Velka
00050000-563a-117f-b796-5e102ff93f14	4247	Zgornje Gorje
00050000-563a-117f-44b7-d1041b239fa0	4206	Zgornje Jezersko
00050000-563a-117f-c607-7493a78d222d	2285	Zgornji Leskovec
00050000-563a-117f-7928-c21477f607b3	1432	Zidani Most
00050000-563a-117f-e2f9-841b097b3307	3214	Zreče
00050000-563a-117f-3fee-7c737971ea0a	4209	Žabnica
00050000-563a-117f-1185-06d82a0a3336	3310	Žalec
00050000-563a-117f-5969-c279be0e1d71	4228	Železniki
00050000-563a-117f-9610-c719bb038ae0	2287	Žetale
00050000-563a-117f-b28e-f0a0916e9f82	4226	Žiri
00050000-563a-117f-6c17-cabfbefbc7fe	4274	Žirovnica
00050000-563a-117f-ebe2-bea77171f145	8360	Žužemberk
\.


--
-- TOC entry 3158 (class 0 OID 25172064)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 25171640)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3108 (class 0 OID 25171388)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-563a-1182-3638-0a51edadc6e3	00080000-563a-1182-6e32-0ab715d52407	\N	00040000-563a-117f-e3bd-469d44758f65	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-563a-1182-1966-4e874815c548	00080000-563a-1182-6e32-0ab715d52407	\N	00040000-563a-117f-e3bd-469d44758f65	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-563a-1182-ccba-74231a8b456d	00080000-563a-1182-4441-c36af5d32a59	\N	00040000-563a-117f-e3bd-469d44758f65	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3120 (class 0 OID 25171532)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-563a-117f-62ff-9026a1e40f28	novo leto	1	1	\N	t
00430000-563a-117f-8c64-677eef694ba7	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-563a-117f-e84a-1c47ffd8eaec	dan upora proti okupatorju	27	4	\N	t
00430000-563a-117f-5efe-70d6a3bdd7a3	praznik dela	1	5	\N	t
00430000-563a-117f-7946-c082b75f4787	praznik dela	2	5	\N	t
00430000-563a-117f-f565-77bec3df3c08	dan Primoža Trubarja	8	6	\N	f
00430000-563a-117f-04cc-ae1a5273c54a	dan državnosti	25	6	\N	t
00430000-563a-117f-f3cb-779b650c9f9d	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-563a-117f-63fc-04ecf10fa283	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-563a-117f-e05e-b04d508df50f	dan suverenosti	25	10	\N	f
00430000-563a-117f-dca9-3ea249b31279	dan spomina na mrtve	1	11	\N	t
00430000-563a-117f-ee85-a1604002fc1b	dan Rudolfa Maistra	23	11	\N	f
00430000-563a-117f-cc89-b0eb9a7adb71	božič	25	12	\N	t
00430000-563a-117f-4199-906e28f84d0b	dan samostojnosti in enotnosti	26	12	\N	t
00430000-563a-117f-799a-5240f898a244	Marijino vnebovzetje	15	8	\N	t
00430000-563a-117f-6d85-0ceffe6df655	dan reformacije	31	10	\N	t
00430000-563a-117f-33de-6d47a3e835db	velikonočna nedelja	27	3	2016	t
00430000-563a-117f-f419-729a52f923b7	velikonočna nedelja	16	4	2017	t
00430000-563a-117f-be6e-dc5170745e46	velikonočna nedelja	1	4	2018	t
00430000-563a-117f-b7b0-3c729b91f633	velikonočna nedelja	21	4	2019	t
00430000-563a-117f-b7a6-239764404f8a	velikonočna nedelja	12	4	2020	t
00430000-563a-117f-45e8-7c71a14e4dc4	velikonočna nedelja	4	4	2021	t
00430000-563a-117f-9c0e-a13b55e7951a	velikonočna nedelja	17	4	2022	t
00430000-563a-117f-36be-4121bc573ad9	velikonočna nedelja	9	4	2023	t
00430000-563a-117f-2fa9-301bbadfe411	velikonočna nedelja	31	3	2024	t
00430000-563a-117f-c9b3-a3b03f866cc9	velikonočna nedelja	20	4	2025	t
00430000-563a-117f-a5a1-bdeb3977ab24	velikonočna nedelja	5	4	2026	t
00430000-563a-117f-e009-e51b4468adcd	velikonočna nedelja	28	3	2027	t
00430000-563a-117f-5bed-ed5d19b9aa08	velikonočna nedelja	16	4	2028	t
00430000-563a-117f-1f7d-ea5e17d6adbe	velikonočna nedelja	1	4	2029	t
00430000-563a-117f-b2d8-e08ccbe8879f	velikonočna nedelja	21	4	2030	t
00430000-563a-117f-7b52-e5e9313845cb	velikonočni ponedeljek	28	3	2016	t
00430000-563a-117f-55d0-69e5dbcc035f	velikonočni ponedeljek	17	4	2017	t
00430000-563a-117f-9ea4-239a87e21701	velikonočni ponedeljek	2	4	2018	t
00430000-563a-117f-98e5-cb20d49be38d	velikonočni ponedeljek	22	4	2019	t
00430000-563a-117f-d179-de5d5966a7d7	velikonočni ponedeljek	13	4	2020	t
00430000-563a-117f-5046-b7493bebb3ff	velikonočni ponedeljek	5	4	2021	t
00430000-563a-117f-f05c-fb54d01618ae	velikonočni ponedeljek	18	4	2022	t
00430000-563a-117f-8af0-dc98296a7d04	velikonočni ponedeljek	10	4	2023	t
00430000-563a-117f-aca9-cf4d94ac761f	velikonočni ponedeljek	1	4	2024	t
00430000-563a-117f-19b7-6315ee8e43f1	velikonočni ponedeljek	21	4	2025	t
00430000-563a-117f-d4bf-635b8528221a	velikonočni ponedeljek	6	4	2026	t
00430000-563a-117f-8c80-130880a4d562	velikonočni ponedeljek	29	3	2027	t
00430000-563a-117f-5e5e-a047025d3d55	velikonočni ponedeljek	17	4	2028	t
00430000-563a-117f-493c-f72b1aa35179	velikonočni ponedeljek	2	4	2029	t
00430000-563a-117f-3b02-0ff1f2828bf7	velikonočni ponedeljek	22	4	2030	t
00430000-563a-117f-dc95-855b82b44577	binkoštna nedelja - binkošti	15	5	2016	t
00430000-563a-117f-6c20-5f097eedb60a	binkoštna nedelja - binkošti	4	6	2017	t
00430000-563a-117f-16c7-389e69476e48	binkoštna nedelja - binkošti	20	5	2018	t
00430000-563a-117f-e75d-32cddc5d46c6	binkoštna nedelja - binkošti	9	6	2019	t
00430000-563a-117f-34c6-218f0afcb8f6	binkoštna nedelja - binkošti	31	5	2020	t
00430000-563a-117f-8845-c2a5f7931a65	binkoštna nedelja - binkošti	23	5	2021	t
00430000-563a-117f-085a-fd50445021cd	binkoštna nedelja - binkošti	5	6	2022	t
00430000-563a-117f-f86b-853d45a278ef	binkoštna nedelja - binkošti	28	5	2023	t
00430000-563a-117f-9760-e9faa0261369	binkoštna nedelja - binkošti	19	5	2024	t
00430000-563a-117f-f050-c77e806d5be5	binkoštna nedelja - binkošti	8	6	2025	t
00430000-563a-117f-f659-808077f637ca	binkoštna nedelja - binkošti	24	5	2026	t
00430000-563a-117f-b71c-59ffe1983a0c	binkoštna nedelja - binkošti	16	5	2027	t
00430000-563a-117f-8289-576fbad44be7	binkoštna nedelja - binkošti	4	6	2028	t
00430000-563a-117f-e7e7-110df4fd1e9d	binkoštna nedelja - binkošti	20	5	2029	t
00430000-563a-117f-256b-5ec2f1b4169c	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3116 (class 0 OID 25171492)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 25171504)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3133 (class 0 OID 25171652)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3159 (class 0 OID 25172078)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 25172088)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-563a-1182-9b35-91c9d252b021	00080000-563a-1182-f354-75b315cdf364	0987	AK
00190000-563a-1182-ee2b-331b5facdaa2	00080000-563a-1182-4441-c36af5d32a59	0989	AK
00190000-563a-1182-f30b-64e27fd447b3	00080000-563a-1182-9c85-126d3f191226	0986	AK
00190000-563a-1182-8ce7-20d2b23bc10d	00080000-563a-1182-835b-c4f876af43fd	0984	AK
00190000-563a-1182-a55d-aeb4a6043711	00080000-563a-1182-e7ad-e4be1dce6044	0983	AK
00190000-563a-1182-d235-2f806784f36b	00080000-563a-1182-1dc1-88fa93690151	0982	AK
00190000-563a-1183-c46e-7eddcf90acb6	00080000-563a-1183-375f-cadc20df4778	1001	AK
\.


--
-- TOC entry 3157 (class 0 OID 25171987)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-563a-1182-b547-9e9911a325cc	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3161 (class 0 OID 25172096)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3137 (class 0 OID 25171681)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-563a-1181-f4c4-da30440b35b2	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-563a-1181-f66e-f60cc0718e6e	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-563a-1181-5cc2-7dd98f5cbb20	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-563a-1181-21fd-dbe017dbefa9	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-563a-1181-8a7f-d26611308c33	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-563a-1181-e5f1-d479598c0fcf	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-563a-1181-d715-8b76c1e4959c	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3129 (class 0 OID 25171625)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3128 (class 0 OID 25171615)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 25171826)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 25171756)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 25171466)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3093 (class 0 OID 25171228)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-563a-1183-375f-cadc20df4778	00010000-563a-1180-b6d3-23854c21b9d5	2015-11-04 15:09:07	INS	a:0:{}
2	App\\Entity\\Option	00000000-563a-1183-290e-95ca236a85ad	00010000-563a-1180-b6d3-23854c21b9d5	2015-11-04 15:09:07	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-563a-1183-c46e-7eddcf90acb6	00010000-563a-1180-b6d3-23854c21b9d5	2015-11-04 15:09:07	INS	a:0:{}
\.


--
-- TOC entry 3182 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3138 (class 0 OID 25171694)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3097 (class 0 OID 25171266)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-563a-1180-69b8-265f8cc157e3	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-563a-1180-725b-1012d34554ec	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-563a-1180-206c-8f3b086e6c77	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-563a-1180-12db-358036c7c554	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-563a-1180-bbd9-d758a88b9647	planer	Planer dogodkov v koledarju	t
00020000-563a-1180-aaf7-8edb71cfa6d1	kadrovska	Kadrovska služba	t
00020000-563a-1180-becc-54687640b1b7	arhivar	Ažuriranje arhivalij	t
00020000-563a-1180-64c4-a38963bd2380	igralec	Igralec	t
00020000-563a-1180-37d3-921ee5d75d71	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-563a-1181-8bcd-92d3aa3fadf8	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 3095 (class 0 OID 25171250)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-563a-1180-16d9-e28d92a36104	00020000-563a-1180-206c-8f3b086e6c77
00010000-563a-1180-b6d3-23854c21b9d5	00020000-563a-1180-206c-8f3b086e6c77
00010000-563a-1182-a7a7-b9beab3b35c8	00020000-563a-1181-8bcd-92d3aa3fadf8
\.


--
-- TOC entry 3140 (class 0 OID 25171708)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 25171646)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3126 (class 0 OID 25171592)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-563a-1181-b9d1-3376b6a86e31	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-563a-1181-568e-efa6ef4637a4	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-563a-1181-80eb-aef0b5cd53a9	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3091 (class 0 OID 25171215)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-563a-117f-6ca2-5c8c30a33c5d	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-563a-117f-27d6-72dbd10dd296	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-563a-117f-9693-71d20ccfdd5d	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-563a-117f-c5a7-1b4dc45b1177	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-563a-117f-4c20-90ac8b6aefc1	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3090 (class 0 OID 25171207)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-563a-117f-f998-fc053561dd1b	00230000-563a-117f-c5a7-1b4dc45b1177	popa
00240000-563a-117f-477b-1595163445ba	00230000-563a-117f-c5a7-1b4dc45b1177	oseba
00240000-563a-117f-274b-3db682f95858	00230000-563a-117f-c5a7-1b4dc45b1177	tippopa
00240000-563a-117f-8e80-dffb77cd6e35	00230000-563a-117f-c5a7-1b4dc45b1177	organizacijskaenota
00240000-563a-117f-f8d9-f859658a8c16	00230000-563a-117f-c5a7-1b4dc45b1177	sezona
00240000-563a-117f-d362-88997a37c114	00230000-563a-117f-c5a7-1b4dc45b1177	tipvaje
00240000-563a-117f-d0c0-8a6fb6634b8a	00230000-563a-117f-27d6-72dbd10dd296	prostor
00240000-563a-117f-972b-5c582fda53a5	00230000-563a-117f-c5a7-1b4dc45b1177	besedilo
00240000-563a-117f-0f35-5e436dddc644	00230000-563a-117f-c5a7-1b4dc45b1177	uprizoritev
00240000-563a-117f-1ada-e3ad039f01d6	00230000-563a-117f-c5a7-1b4dc45b1177	funkcija
00240000-563a-117f-8772-12b099679380	00230000-563a-117f-c5a7-1b4dc45b1177	tipfunkcije
00240000-563a-117f-42c0-bb0b8b3eba32	00230000-563a-117f-c5a7-1b4dc45b1177	alternacija
00240000-563a-117f-17b8-f6a7c1e519fe	00230000-563a-117f-6ca2-5c8c30a33c5d	pogodba
00240000-563a-117f-cf7a-38338e0ea3a8	00230000-563a-117f-c5a7-1b4dc45b1177	zaposlitev
00240000-563a-117f-42bc-c2ae9a71ec10	00230000-563a-117f-c5a7-1b4dc45b1177	zvrstuprizoritve
00240000-563a-117f-63eb-a3f41cb0b436	00230000-563a-117f-6ca2-5c8c30a33c5d	programdela
00240000-563a-117f-5f33-817f9faaab8f	00230000-563a-117f-c5a7-1b4dc45b1177	zapis
\.


--
-- TOC entry 3089 (class 0 OID 25171202)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
74e21933-ed78-4f03-b520-fc1ebc053b00	00240000-563a-117f-f998-fc053561dd1b	0	1001
\.


--
-- TOC entry 3146 (class 0 OID 25171773)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-563a-1182-27f9-9e541a0c7fd4	000e0000-563a-1182-8f27-6da23cfe551e	00080000-563a-1182-6e32-0ab715d52407	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-563a-117f-1681-7cb6877b040b
00270000-563a-1182-6e8c-36fc73ccfbed	000e0000-563a-1182-8f27-6da23cfe551e	00080000-563a-1182-6e32-0ab715d52407	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-563a-117f-1681-7cb6877b040b
\.


--
-- TOC entry 3105 (class 0 OID 25171350)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 25171602)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-563a-1182-9cf4-cd301801a439	00180000-563a-1182-0b7e-b50784a5f7d4	000c0000-563a-1182-efee-8cec6d2ce56e	00090000-563a-1182-9dfd-c638c7921bb4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-1182-9aa6-1fb2fadd56e5	00180000-563a-1182-0b7e-b50784a5f7d4	000c0000-563a-1182-c27e-f0d94b155e22	00090000-563a-1182-d7b6-7ecc9b5cae3f	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-1182-d63e-42a1341d248d	00180000-563a-1182-0b7e-b50784a5f7d4	000c0000-563a-1182-5552-fb19aa6c95c0	00090000-563a-1182-eee3-4bd4ebf035e1	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-1182-6e81-292fbc56a08d	00180000-563a-1182-0b7e-b50784a5f7d4	000c0000-563a-1182-baa3-90cddd0b9820	00090000-563a-1182-6d3e-13f5a2463190	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-1182-78bf-6ed3a8ed026f	00180000-563a-1182-0b7e-b50784a5f7d4	000c0000-563a-1182-5271-97b703fb211d	00090000-563a-1182-dc3a-71aec520bceb	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-563a-1182-b4c3-485c605a7ce2	00180000-563a-1182-c84a-287dbf8d123d	\N	00090000-563a-1182-dc3a-71aec520bceb	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-563a-1182-79da-5fd292787a21	00180000-563a-1182-c84a-287dbf8d123d	\N	00090000-563a-1182-d7b6-7ecc9b5cae3f	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3149 (class 0 OID 25171814)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-563a-117f-c02c-76b7f08da2ec	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-563a-117f-767c-2c26ab671cf5	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-563a-117f-a12d-99a8a108d7b6	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-563a-117f-4936-a00a3aea2961	04	Režija	Režija	Režija	umetnik	30
000f0000-563a-117f-eb7d-c86605461d52	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-563a-117f-7ae8-406c0c541cdc	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-563a-117f-ff88-5fa269e881c8	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-563a-117f-7f6d-acc8fafbfa70	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-563a-117f-19b6-f8ef34eb400d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-563a-117f-f32f-e349ec45f96f	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-563a-117f-e14c-4a6034074c9a	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-563a-117f-c373-f699673b1691	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-563a-117f-1f66-ef55c686df3e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-563a-117f-d684-a555bc10284f	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-563a-117f-e379-5774e7c0bbb0	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-563a-117f-49d2-050ee75b13a1	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-563a-117f-96f1-8ee976116a3a	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-563a-117f-d643-c6490fd055c2	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3102 (class 0 OID 25171301)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-563a-1181-7176-c4e2beb58941	0001	šola	osnovna ali srednja šola
00400000-563a-1181-1c65-6087c3b82445	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-563a-1181-5bba-55fc92c06fae	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3162 (class 0 OID 25172107)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-563a-117f-0022-ad916d1d3dcc	01	Velika predstava	f	1.00	1.00
002b0000-563a-117f-fd90-078cedb0694b	02	Mala predstava	f	0.50	0.50
002b0000-563a-117f-fd1d-198e34a307f4	03	Mala koprodukcija	t	0.40	1.00
002b0000-563a-117f-0804-6d4d23239b34	04	Srednja koprodukcija	t	0.70	2.00
002b0000-563a-117f-b412-6da0711d06c3	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3125 (class 0 OID 25171582)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-563a-117f-1974-5c83462f6d53	0001	prva vaja	prva vaja
00420000-563a-117f-3a81-93e2f0c10d44	0002	tehnična vaja	tehnična vaja
00420000-563a-117f-665b-f4aa5feba873	0003	lučna vaja	lučna vaja
00420000-563a-117f-7b5e-ab39c96b1566	0004	kostumska vaja	kostumska vaja
00420000-563a-117f-a4a7-786bae600cf9	0005	foto vaja	foto vaja
00420000-563a-117f-ec13-9bc837e4b9a5	0006	1. glavna vaja	1. glavna vaja
00420000-563a-117f-db2e-be05cfb45a8f	0007	2. glavna vaja	2. glavna vaja
00420000-563a-117f-d98b-4b8f92f92b95	0008	1. generalka	1. generalka
00420000-563a-117f-3109-ce7ebcf85761	0009	2. generalka	2. generalka
00420000-563a-117f-f313-eb9ebd485efe	0010	odprta generalka	odprta generalka
00420000-563a-117f-edfc-cbaad1b8d439	0011	obnovitvena vaja	obnovitvena vaja
00420000-563a-117f-9812-84c158045978	0012	pevska vaja	pevska vaja
00420000-563a-117f-7831-ca85ff74eada	0013	postavitev scene	postavitev scene (za pripravo vaje)
00420000-563a-117f-e15a-888e609de7ef	0014	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3111 (class 0 OID 25171423)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3094 (class 0 OID 25171237)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-563a-1180-b6d3-23854c21b9d5	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROcSQvWZdhsUzgc.k/kko8d4u88x/ptfe	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-563a-1182-e929-186a4761dbd3	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-563a-1182-f348-364f11edffc8	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-563a-1182-ea84-92e65ad8dc4c	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-563a-1182-5621-5b089d1476ad	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-563a-1182-fd88-059f0c814f97	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-563a-1182-a209-5e1ed3923417	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-563a-1182-2211-3b47a10de976	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-563a-1182-301c-c475d41468fa	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-563a-1182-2267-2e95942e9d1c	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-563a-1182-a7a7-b9beab3b35c8	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-563a-1180-16d9-e28d92a36104	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3153 (class 0 OID 25171864)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-563a-1182-63d2-1ef6fac914a3	00160000-563a-1181-3499-808072d31061	\N	00140000-563a-117f-e742-5571534da9ce	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-563a-1181-8a7f-d26611308c33
000e0000-563a-1182-8f27-6da23cfe551e	00160000-563a-1181-d93d-591bc18270d9	\N	00140000-563a-117f-0d83-841dfc636bca	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-563a-1181-e5f1-d479598c0fcf
000e0000-563a-1182-0398-acc6c7ea0cf3	\N	\N	00140000-563a-117f-0d83-841dfc636bca	00190000-563a-1182-9b35-91c9d252b021	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563a-1181-8a7f-d26611308c33
000e0000-563a-1182-4365-8a8081c82413	\N	\N	00140000-563a-117f-0d83-841dfc636bca	00190000-563a-1182-9b35-91c9d252b021	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-563a-1181-8a7f-d26611308c33
000e0000-563a-1182-e028-9d53934f4bad	\N	\N	00140000-563a-117f-0d83-841dfc636bca	00190000-563a-1182-9b35-91c9d252b021	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-563a-1181-f4c4-da30440b35b2
000e0000-563a-1182-eea4-5ecfc80569a1	\N	\N	00140000-563a-117f-0d83-841dfc636bca	00190000-563a-1182-9b35-91c9d252b021	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-563a-1181-f4c4-da30440b35b2
\.


--
-- TOC entry 3119 (class 0 OID 25171522)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-563a-1182-6306-3aff2d97511b	\N	000e0000-563a-1182-8f27-6da23cfe551e	1	
00200000-563a-1182-9109-f2a020d372d3	\N	000e0000-563a-1182-8f27-6da23cfe551e	2	
00200000-563a-1182-06e1-bf13da3f495d	\N	000e0000-563a-1182-8f27-6da23cfe551e	3	
00200000-563a-1182-564f-8a04634a2dcb	\N	000e0000-563a-1182-8f27-6da23cfe551e	4	
00200000-563a-1182-b055-c3d4d825a656	\N	000e0000-563a-1182-8f27-6da23cfe551e	5	
\.


--
-- TOC entry 3136 (class 0 OID 25171673)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3147 (class 0 OID 25171787)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-563a-117f-092a-d5aa39c4da6e	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-563a-117f-2d6e-ce4318a8c1a3	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-563a-117f-d033-e087bb460483	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-563a-117f-b210-346236c08628	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-563a-117f-908d-cc418f612d70	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-563a-117f-00d2-76a7d1c60278	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-563a-117f-cd32-a651d90bf243	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-563a-117f-17a9-dec0498b6281	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-563a-117f-1681-7cb6877b040b	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-563a-117f-ee4b-bf1009aba798	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-563a-117f-1bf1-26882e8f9424	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-563a-117f-9e0c-94478bd433d8	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-563a-117f-ab98-62d617760389	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-563a-117f-09ca-0fe858847b82	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-563a-117f-c873-bac15e78ff95	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-563a-117f-8861-02e22a144392	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-563a-117f-f40e-de22438cdc9b	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-563a-117f-76f9-825851687d5b	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-563a-117f-b564-1b81a915aaa5	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-563a-117f-388c-de9d1149937d	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-563a-117f-a124-a272b71a40d4	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-563a-117f-8c81-ad5d8dce7775	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-563a-117f-1983-8ac1e4229623	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-563a-117f-ec38-847041d2175e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-563a-117f-d510-de4a0bb16277	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-563a-117f-f1fe-26df8cc544f8	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-563a-117f-9971-c61f1a1549ce	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-563a-117f-694a-4d4f4e9ca0d1	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3165 (class 0 OID 25172154)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 25172126)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3166 (class 0 OID 25172166)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 25171745)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-563a-1182-f044-c5e1d912b4aa	00090000-563a-1182-d7b6-7ecc9b5cae3f	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-1182-8aee-e9706483791b	00090000-563a-1182-eee3-4bd4ebf035e1	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-1182-1071-f7a29bf3c06a	00090000-563a-1182-ea2d-03fd9e476560	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-1182-a54d-be70811db986	00090000-563a-1182-dad5-c8cfe7450cb3	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-1182-25e6-fd1db171af51	00090000-563a-1182-d21b-cec0eade5032	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-563a-1182-96f4-33dd6912b87b	00090000-563a-1182-9d59-d5c12dfdc6c9	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3122 (class 0 OID 25171566)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3152 (class 0 OID 25171854)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-563a-117f-e742-5571534da9ce	01	Drama	drama (SURS 01)
00140000-563a-117f-6693-c713c6036ca6	02	Opera	opera (SURS 02)
00140000-563a-117f-f887-7cf64d719b6d	03	Balet	balet (SURS 03)
00140000-563a-117f-6785-8002cdf8375b	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-563a-117f-8149-2401c482659c	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-563a-117f-0d83-841dfc636bca	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-563a-117f-f42c-feb8191bae45	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3142 (class 0 OID 25171735)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2584 (class 2606 OID 25171300)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2803 (class 2606 OID 25171913)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 25171903)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 25171291)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2762 (class 2606 OID 25171770)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 25171812)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2860 (class 2606 OID 25172206)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 25171554)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2682 (class 2606 OID 25171576)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 2606 OID 25171581)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2836 (class 2606 OID 25172124)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 25171449)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2810 (class 2606 OID 25171981)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 25171731)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 25171520)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 25171487)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 25171463)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 25171638)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2854 (class 2606 OID 25172183)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2858 (class 2606 OID 25172190)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2865 (class 2606 OID 25172214)
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
-- TOC entry 2722 (class 2606 OID 25171665)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 25171421)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2592 (class 2606 OID 25171319)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2611 (class 2606 OID 25171383)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 25171346)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2580 (class 2606 OID 25171280)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2573 (class 2606 OID 25171265)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 25171671)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2739 (class 2606 OID 25171707)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 25171849)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 25171374)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 25171409)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 25172076)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 25171644)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 25171399)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 25171539)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 25171508)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2651 (class 2606 OID 25171500)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 25171656)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2824 (class 2606 OID 25172085)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2826 (class 2606 OID 25172093)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2817 (class 2606 OID 25172063)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2831 (class 2606 OID 25172105)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 25171689)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 25171629)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2702 (class 2606 OID 25171620)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 25171836)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 25171763)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 25171475)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2565 (class 2606 OID 25171236)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 25171698)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 25171254)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2575 (class 2606 OID 25171274)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 25171716)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2716 (class 2606 OID 25171651)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2690 (class 2606 OID 25171600)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 25171224)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 2606 OID 25171212)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 25171206)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 25171783)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 25171355)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 25171611)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2776 (class 2606 OID 25171823)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2586 (class 2606 OID 25171308)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2833 (class 2606 OID 25172117)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2686 (class 2606 OID 25171589)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2627 (class 2606 OID 25171434)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2567 (class 2606 OID 25171249)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 25171882)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 25171529)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 25171679)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 25171795)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2847 (class 2606 OID 25172164)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2844 (class 2606 OID 25172148)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 25172172)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 25171753)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2680 (class 2606 OID 25171570)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 25171862)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2752 (class 2606 OID 25171743)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2667 (class 1259 OID 25171564)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2668 (class 1259 OID 25171565)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2669 (class 1259 OID 25171563)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2670 (class 1259 OID 25171562)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2671 (class 1259 OID 25171561)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2765 (class 1259 OID 25171784)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2766 (class 1259 OID 25171785)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2767 (class 1259 OID 25171786)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2851 (class 1259 OID 25172185)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2852 (class 1259 OID 25172184)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2602 (class 1259 OID 25171376)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2603 (class 1259 OID 25171377)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2723 (class 1259 OID 25171672)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2838 (class 1259 OID 25172152)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2839 (class 1259 OID 25172151)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2840 (class 1259 OID 25172153)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2841 (class 1259 OID 25172150)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2842 (class 1259 OID 25172149)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2717 (class 1259 OID 25171658)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2718 (class 1259 OID 25171657)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2659 (class 1259 OID 25171530)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2660 (class 1259 OID 25171531)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2747 (class 1259 OID 25171732)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2748 (class 1259 OID 25171734)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2749 (class 1259 OID 25171733)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2634 (class 1259 OID 25171465)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2635 (class 1259 OID 25171464)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2829 (class 1259 OID 25172106)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2781 (class 1259 OID 25171851)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2782 (class 1259 OID 25171852)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2783 (class 1259 OID 25171853)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2848 (class 1259 OID 25172173)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2790 (class 1259 OID 25171887)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2791 (class 1259 OID 25171884)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2792 (class 1259 OID 25171888)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2793 (class 1259 OID 25171886)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2794 (class 1259 OID 25171885)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2624 (class 1259 OID 25171436)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2625 (class 1259 OID 25171435)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2593 (class 1259 OID 25171349)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2735 (class 1259 OID 25171699)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2577 (class 1259 OID 25171281)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2578 (class 1259 OID 25171282)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2740 (class 1259 OID 25171719)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2741 (class 1259 OID 25171718)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2742 (class 1259 OID 25171717)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2607 (class 1259 OID 25171386)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2608 (class 1259 OID 25171385)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2609 (class 1259 OID 25171387)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2647 (class 1259 OID 25171503)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2648 (class 1259 OID 25171501)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2649 (class 1259 OID 25171502)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2557 (class 1259 OID 25171214)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2697 (class 1259 OID 25171624)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2698 (class 1259 OID 25171622)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2699 (class 1259 OID 25171621)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2700 (class 1259 OID 25171623)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2568 (class 1259 OID 25171255)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2569 (class 1259 OID 25171256)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2726 (class 1259 OID 25171680)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2861 (class 1259 OID 25172207)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2763 (class 1259 OID 25171772)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2764 (class 1259 OID 25171771)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2862 (class 1259 OID 25172215)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2863 (class 1259 OID 25172216)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2712 (class 1259 OID 25171645)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2757 (class 1259 OID 25171764)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2758 (class 1259 OID 25171765)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2811 (class 1259 OID 25171986)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2812 (class 1259 OID 25171985)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2813 (class 1259 OID 25171982)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2814 (class 1259 OID 25171983)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2815 (class 1259 OID 25171984)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2613 (class 1259 OID 25171401)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2614 (class 1259 OID 25171400)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2615 (class 1259 OID 25171402)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2729 (class 1259 OID 25171693)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2730 (class 1259 OID 25171692)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2821 (class 1259 OID 25172086)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2822 (class 1259 OID 25172087)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2804 (class 1259 OID 25171917)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2805 (class 1259 OID 25171918)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2806 (class 1259 OID 25171915)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2807 (class 1259 OID 25171916)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2753 (class 1259 OID 25171754)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2754 (class 1259 OID 25171755)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2703 (class 1259 OID 25171633)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2704 (class 1259 OID 25171632)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2705 (class 1259 OID 25171630)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2706 (class 1259 OID 25171631)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2800 (class 1259 OID 25171905)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2801 (class 1259 OID 25171904)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2638 (class 1259 OID 25171476)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2641 (class 1259 OID 25171490)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2642 (class 1259 OID 25171489)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2643 (class 1259 OID 25171488)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2644 (class 1259 OID 25171491)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2658 (class 1259 OID 25171521)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2652 (class 1259 OID 25171509)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2653 (class 1259 OID 25171510)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2818 (class 1259 OID 25172077)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2837 (class 1259 OID 25172125)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2855 (class 1259 OID 25172191)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2856 (class 1259 OID 25172192)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2589 (class 1259 OID 25171321)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2590 (class 1259 OID 25171320)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2598 (class 1259 OID 25171356)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2599 (class 1259 OID 25171357)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2678 (class 1259 OID 25171571)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2692 (class 1259 OID 25171614)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 25171613)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2694 (class 1259 OID 25171612)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2672 (class 1259 OID 25171556)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2673 (class 1259 OID 25171557)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2674 (class 1259 OID 25171560)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2675 (class 1259 OID 25171555)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2676 (class 1259 OID 25171559)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2677 (class 1259 OID 25171558)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2606 (class 1259 OID 25171375)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2587 (class 1259 OID 25171309)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2588 (class 1259 OID 25171310)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2630 (class 1259 OID 25171450)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2631 (class 1259 OID 25171452)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2632 (class 1259 OID 25171451)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2633 (class 1259 OID 25171453)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2711 (class 1259 OID 25171639)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2786 (class 1259 OID 25171850)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 25171883)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2777 (class 1259 OID 25171824)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2778 (class 1259 OID 25171825)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2596 (class 1259 OID 25171347)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2597 (class 1259 OID 25171348)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2750 (class 1259 OID 25171744)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2563 (class 1259 OID 25171225)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2623 (class 1259 OID 25171422)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2612 (class 1259 OID 25171384)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2560 (class 1259 OID 25171213)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2834 (class 1259 OID 25172118)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 25171691)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2734 (class 1259 OID 25171690)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2687 (class 1259 OID 25171590)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2688 (class 1259 OID 25171591)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2808 (class 1259 OID 25171914)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 25171410)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2787 (class 1259 OID 25171863)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 25172165)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2827 (class 1259 OID 25172094)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2828 (class 1259 OID 25172095)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2774 (class 1259 OID 25171813)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2691 (class 1259 OID 25171601)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2576 (class 1259 OID 25171275)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2905 (class 2606 OID 25172387)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2904 (class 2606 OID 25172392)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2899 (class 2606 OID 25172417)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2901 (class 2606 OID 25172407)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2906 (class 2606 OID 25172382)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2902 (class 2606 OID 25172402)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2900 (class 2606 OID 25172412)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2903 (class 2606 OID 25172397)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2942 (class 2606 OID 25172587)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2941 (class 2606 OID 25172592)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2940 (class 2606 OID 25172597)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2974 (class 2606 OID 25172762)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2975 (class 2606 OID 25172757)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2878 (class 2606 OID 25172272)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2877 (class 2606 OID 25172277)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2923 (class 2606 OID 25172502)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2969 (class 2606 OID 25172742)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2970 (class 2606 OID 25172737)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2968 (class 2606 OID 25172747)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2971 (class 2606 OID 25172732)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2972 (class 2606 OID 25172727)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2921 (class 2606 OID 25172497)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2922 (class 2606 OID 25172492)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2898 (class 2606 OID 25172372)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2897 (class 2606 OID 25172377)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2933 (class 2606 OID 25172542)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2931 (class 2606 OID 25172552)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2932 (class 2606 OID 25172547)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2887 (class 2606 OID 25172327)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2888 (class 2606 OID 25172322)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2919 (class 2606 OID 25172482)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2966 (class 2606 OID 25172717)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2945 (class 2606 OID 25172602)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2944 (class 2606 OID 25172607)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2943 (class 2606 OID 25172612)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2973 (class 2606 OID 25172752)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2947 (class 2606 OID 25172632)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2950 (class 2606 OID 25172617)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2946 (class 2606 OID 25172637)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2948 (class 2606 OID 25172627)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2949 (class 2606 OID 25172622)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2885 (class 2606 OID 25172317)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2886 (class 2606 OID 25172312)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2873 (class 2606 OID 25172257)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2874 (class 2606 OID 25172252)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2927 (class 2606 OID 25172522)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2870 (class 2606 OID 25172232)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2869 (class 2606 OID 25172237)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2928 (class 2606 OID 25172537)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2929 (class 2606 OID 25172532)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2930 (class 2606 OID 25172527)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2880 (class 2606 OID 25172287)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2881 (class 2606 OID 25172282)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2879 (class 2606 OID 25172292)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2891 (class 2606 OID 25172352)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2893 (class 2606 OID 25172342)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2892 (class 2606 OID 25172347)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2866 (class 2606 OID 25172217)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2911 (class 2606 OID 25172457)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2913 (class 2606 OID 25172447)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2914 (class 2606 OID 25172442)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2912 (class 2606 OID 25172452)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2868 (class 2606 OID 25172222)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2867 (class 2606 OID 25172227)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2924 (class 2606 OID 25172507)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2978 (class 2606 OID 25172777)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2938 (class 2606 OID 25172582)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2939 (class 2606 OID 25172577)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2980 (class 2606 OID 25172782)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2979 (class 2606 OID 25172787)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2920 (class 2606 OID 25172487)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2937 (class 2606 OID 25172567)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2936 (class 2606 OID 25172572)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 25172692)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2958 (class 2606 OID 25172687)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2961 (class 2606 OID 25172672)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2960 (class 2606 OID 25172677)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2959 (class 2606 OID 25172682)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2883 (class 2606 OID 25172302)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2884 (class 2606 OID 25172297)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2882 (class 2606 OID 25172307)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2925 (class 2606 OID 25172517)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2926 (class 2606 OID 25172512)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2964 (class 2606 OID 25172702)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2963 (class 2606 OID 25172707)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2954 (class 2606 OID 25172662)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2953 (class 2606 OID 25172667)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2956 (class 2606 OID 25172652)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2955 (class 2606 OID 25172657)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2935 (class 2606 OID 25172557)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2934 (class 2606 OID 25172562)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2915 (class 2606 OID 25172477)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2916 (class 2606 OID 25172472)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2918 (class 2606 OID 25172462)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2917 (class 2606 OID 25172467)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2951 (class 2606 OID 25172647)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2952 (class 2606 OID 25172642)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2889 (class 2606 OID 25172332)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2890 (class 2606 OID 25172337)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2896 (class 2606 OID 25172367)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2895 (class 2606 OID 25172357)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2894 (class 2606 OID 25172362)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2962 (class 2606 OID 25172697)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2965 (class 2606 OID 25172712)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2967 (class 2606 OID 25172722)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2977 (class 2606 OID 25172767)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2976 (class 2606 OID 25172772)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2871 (class 2606 OID 25172247)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2872 (class 2606 OID 25172242)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2876 (class 2606 OID 25172262)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2875 (class 2606 OID 25172267)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2907 (class 2606 OID 25172422)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2908 (class 2606 OID 25172437)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2909 (class 2606 OID 25172432)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2910 (class 2606 OID 25172427)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-11-04 15:09:09 CET

--
-- PostgreSQL database dump complete
--

