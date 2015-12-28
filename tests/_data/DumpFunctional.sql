--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-12-28 09:37:08 CET

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
-- TOC entry 183 (class 1259 OID 33020505)
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
-- TOC entry 237 (class 1259 OID 33021121)
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
-- TOC entry 236 (class 1259 OID 33021104)
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
-- TOC entry 182 (class 1259 OID 33020498)
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
-- TOC entry 181 (class 1259 OID 33020496)
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
-- TOC entry 227 (class 1259 OID 33020981)
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
-- TOC entry 230 (class 1259 OID 33021011)
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
-- TOC entry 251 (class 1259 OID 33021424)
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
-- TOC entry 203 (class 1259 OID 33020754)
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
-- TOC entry 205 (class 1259 OID 33020786)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 206 (class 1259 OID 33020791)
-- Name: dogodektehnicni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodektehnicni (
    id uuid NOT NULL
);


--
-- TOC entry 245 (class 1259 OID 33021346)
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
-- TOC entry 194 (class 1259 OID 33020650)
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
-- TOC entry 238 (class 1259 OID 33021134)
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
-- TOC entry 223 (class 1259 OID 33020934)
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
-- TOC entry 200 (class 1259 OID 33020725)
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
-- TOC entry 197 (class 1259 OID 33020691)
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
-- TOC entry 195 (class 1259 OID 33020667)
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
-- TOC entry 212 (class 1259 OID 33020848)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 249 (class 1259 OID 33021404)
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
-- TOC entry 250 (class 1259 OID 33021417)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 252 (class 1259 OID 33021439)
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
-- TOC entry 216 (class 1259 OID 33020873)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 192 (class 1259 OID 33020624)
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
-- TOC entry 185 (class 1259 OID 33020524)
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
-- TOC entry 189 (class 1259 OID 33020591)
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
-- TOC entry 186 (class 1259 OID 33020535)
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
-- TOC entry 178 (class 1259 OID 33020470)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 33020489)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 33020880)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 221 (class 1259 OID 33020914)
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
-- TOC entry 233 (class 1259 OID 33021052)
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
-- TOC entry 188 (class 1259 OID 33020571)
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
-- TOC entry 191 (class 1259 OID 33020616)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 240 (class 1259 OID 33021290)
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
-- TOC entry 213 (class 1259 OID 33020854)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 190 (class 1259 OID 33020601)
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
-- TOC entry 202 (class 1259 OID 33020746)
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
-- TOC entry 198 (class 1259 OID 33020706)
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
-- TOC entry 199 (class 1259 OID 33020718)
-- Name: predstava_abonma; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava_abonma (
    predstava_id uuid NOT NULL,
    abonma_id uuid NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 33020866)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 241 (class 1259 OID 33021304)
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
-- TOC entry 242 (class 1259 OID 33021314)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(255) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 239 (class 1259 OID 33021203)
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
-- TOC entry 243 (class 1259 OID 33021322)
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
-- TOC entry 219 (class 1259 OID 33020895)
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
-- TOC entry 211 (class 1259 OID 33020839)
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
-- TOC entry 210 (class 1259 OID 33020829)
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
-- TOC entry 232 (class 1259 OID 33021041)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 226 (class 1259 OID 33020971)
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
-- TOC entry 196 (class 1259 OID 33020680)
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
-- TOC entry 175 (class 1259 OID 33020441)
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
-- TOC entry 174 (class 1259 OID 33020439)
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
-- TOC entry 220 (class 1259 OID 33020908)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 33020479)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 33020463)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 33020922)
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
-- TOC entry 214 (class 1259 OID 33020860)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 208 (class 1259 OID 33020806)
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
-- TOC entry 173 (class 1259 OID 33020428)
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
-- TOC entry 172 (class 1259 OID 33020420)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 33020415)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 228 (class 1259 OID 33020988)
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
-- TOC entry 187 (class 1259 OID 33020563)
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
-- TOC entry 209 (class 1259 OID 33020816)
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
-- TOC entry 231 (class 1259 OID 33021029)
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
-- TOC entry 184 (class 1259 OID 33020514)
-- Name: tippopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tippopa (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 244 (class 1259 OID 33021334)
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
-- TOC entry 207 (class 1259 OID 33020796)
-- Name: tipvaje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipvaje (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text
);


--
-- TOC entry 193 (class 1259 OID 33020636)
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
-- TOC entry 176 (class 1259 OID 33020450)
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
-- TOC entry 235 (class 1259 OID 33021079)
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
-- TOC entry 201 (class 1259 OID 33020736)
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
-- TOC entry 218 (class 1259 OID 33020887)
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
-- TOC entry 229 (class 1259 OID 33021002)
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
-- TOC entry 247 (class 1259 OID 33021384)
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
-- TOC entry 246 (class 1259 OID 33021353)
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
-- TOC entry 248 (class 1259 OID 33021396)
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
-- TOC entry 225 (class 1259 OID 33020960)
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
-- TOC entry 204 (class 1259 OID 33020780)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 234 (class 1259 OID 33021069)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 224 (class 1259 OID 33020950)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2242 (class 2604 OID 33020501)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage ALTER COLUMN id SET DEFAULT nextval('authstorage_id_seq'::regclass);


--
-- TOC entry 2234 (class 2604 OID 33020444)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 3118 (class 0 OID 33020505)
-- Dependencies: 183
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
000a0000-5680-f4b1-aee9-f0c2254ed2cd	10	30	Otroci	Abonma za otroke	200
000a0000-5680-f4b1-9378-ead41d050d9f	20	60	Mladina	Abonma za mladino	400
000a0000-5680-f4b1-c398-32ad1ce8e1e8	15	50	Odrasli	Abonma za odrasle	300
\.


--
-- TOC entry 3172 (class 0 OID 33021121)
-- Dependencies: 237
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5680-f4b1-803f-276364beede1	000d0000-5680-f4b1-0ce8-b3fb7b10712d	\N	00090000-5680-f4b1-8873-82910558ef76	000b0000-5680-f4b1-6de8-6770d9f582d0	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5680-f4b1-4a1b-3bc895dd26cf	000d0000-5680-f4b1-3030-febc10fadf51	00100000-5680-f4b1-346e-39443f1da194	00090000-5680-f4b1-a061-a5a833344dfa	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5680-f4b1-b68f-5ca9f8e37d51	000d0000-5680-f4b1-3761-afd84317eb0d	00100000-5680-f4b1-2331-984d0cba51d5	00090000-5680-f4b1-5eb3-cccdf7ef445e	\N	0003	t	\N	2015-12-28	\N	2	t	\N	f	f
000c0000-5680-f4b1-3af6-20cd37993ff2	000d0000-5680-f4b1-1060-1dabeb7026ef	\N	00090000-5680-f4b1-80f2-cda52b0e6573	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5680-f4b1-9661-80cd7d5c0152	000d0000-5680-f4b1-c5df-6c3d4d81c6c2	\N	00090000-5680-f4b1-ba23-2b0a00b7981a	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5680-f4b1-a28c-9287714c8efb	000d0000-5680-f4b1-f3bb-2ab870824a1b	\N	00090000-5680-f4b1-cbb6-a8078c63a437	000b0000-5680-f4b1-33d7-f2b041ae5d23	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5680-f4b1-4e27-afe8de77cd90	000d0000-5680-f4b1-37d0-cbb7758084dd	00100000-5680-f4b1-132c-8c2f55f385f4	00090000-5680-f4b1-10e0-a1facf06e582	\N	0007	t	2016-01-01	2016-01-01	\N	14	f	\N	f	t
000c0000-5680-f4b1-307a-fb8dbb0fca30	000d0000-5680-f4b1-0a49-7154639ee065	\N	00090000-5680-f4b1-43f9-5229b32f22ad	000b0000-5680-f4b1-97a3-db01a73d47fb	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5680-f4b1-1376-face4786c85b	000d0000-5680-f4b1-37d0-cbb7758084dd	00100000-5680-f4b1-2c9d-7185def9be81	00090000-5680-f4b1-fe03-b36351c22732	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5680-f4b1-a525-52950f12cd94	000d0000-5680-f4b1-37d0-cbb7758084dd	00100000-5680-f4b1-c57d-286d956f21a7	00090000-5680-f4b1-1521-fcfd8cea9b0a	\N	0010	t	\N	2015-12-28	\N	16	f	\N	f	t
000c0000-5680-f4b1-1293-0e039db84bc1	000d0000-5680-f4b1-37d0-cbb7758084dd	00100000-5680-f4b1-9569-3dfe3414f05e	00090000-5680-f4b1-5167-42667a734548	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5680-f4b1-183d-2f19dc15d737	000d0000-5680-f4b1-acd6-9ea59fa89736	00100000-5680-f4b1-346e-39443f1da194	00090000-5680-f4b1-a061-a5a833344dfa	000b0000-5680-f4b1-7f97-5961e8f93125	0012	t	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3171 (class 0 OID 33021104)
-- Dependencies: 236
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3117 (class 0 OID 33020498)
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
-- TOC entry 3162 (class 0 OID 33020981)
-- Dependencies: 227
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5680-f4b1-ecb7-6b6e4c7dbc2e	00160000-5680-f4b0-0487-bc52835a21f3	00090000-5680-f4b1-3903-77fff9eb87e1	aizv	10	t
003d0000-5680-f4b1-ae57-70c10284c6d8	00160000-5680-f4b0-0487-bc52835a21f3	00090000-5680-f4b1-5c5a-7d7ce858b9d8	apri	14	t
003d0000-5680-f4b1-13d2-f1ce4205947a	00160000-5680-f4b0-c12f-5145ea93910c	00090000-5680-f4b1-6da8-1fb2c3d7bee6	aizv	11	t
003d0000-5680-f4b1-a66b-6e3b477a8f5d	00160000-5680-f4b0-5f9f-5bf785e82cdb	00090000-5680-f4b1-0e35-0277c3051678	aizv	12	t
003d0000-5680-f4b1-b624-f237e0a2b702	00160000-5680-f4b0-0487-bc52835a21f3	00090000-5680-f4b1-c85d-48392cdb3e6f	apri	18	f
\.


--
-- TOC entry 3165 (class 0 OID 33021011)
-- Dependencies: 230
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5680-f4b0-0487-bc52835a21f3	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	William  Shakespeare - Nebojša  Kavader
00160000-5680-f4b0-c12f-5145ea93910c	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	Fjodor Mihajlovič Dostojevski
00160000-5680-f4b0-5f9f-5bf785e82cdb	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	Berta   Hočevar
\.


--
-- TOC entry 3186 (class 0 OID 33021424)
-- Dependencies: 251
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3138 (class 0 OID 33020754)
-- Dependencies: 203
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, tehnicni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5680-f4b1-2f62-24ac723d85e9	\N	\N	00200000-5680-f4b1-cbe2-c4d0d48fd62c	\N	\N	\N	00220000-5680-f4b0-d610-40eac6e6716c	\N	f	2012-05-20 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5680-f4b1-18f6-fc12b37f7aec	\N	\N	00200000-5680-f4b1-74ef-4dbf2566ee04	\N	\N	\N	00220000-5680-f4b0-d610-40eac6e6716c	\N	f	2012-06-04 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5680-f4b1-da07-b614f66b5011	\N	\N	00200000-5680-f4b1-ee6a-8aa1ebd74958	\N	\N	\N	00220000-5680-f4b0-58e1-30f2b899dff1	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5680-f4b1-a586-7881fe5dadc2	\N	\N	00200000-5680-f4b1-29f8-91d42f475541	\N	\N	\N	00220000-5680-f4b0-b4e9-88770ebf5e28	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5680-f4b1-8da5-6a635ce9fba1	\N	\N	00200000-5680-f4b1-d0b0-4940a8c7d7aa	\N	\N	\N	00220000-5680-f4b0-503a-2bdb3df8b8d6	\N	f	2012-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 3140 (class 0 OID 33020786)
-- Dependencies: 205
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3141 (class 0 OID 33020791)
-- Dependencies: 206
-- Data for Name: dogodektehnicni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodektehnicni (id) FROM stdin;
\.


--
-- TOC entry 3180 (class 0 OID 33021346)
-- Dependencies: 245
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3129 (class 0 OID 33020650)
-- Dependencies: 194
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5680-f4ae-de86-2593f46ae752	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5680-f4ae-1082-6e835a7ccc4d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5680-f4ae-5aad-757f76319fee	AL	ALB	008	Albania 	Albanija	\N
00040000-5680-f4ae-b38a-516b42405574	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5680-f4ae-907a-559a9877be4c	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5680-f4ae-9d86-817366e154ab	AD	AND	020	Andorra 	Andora	\N
00040000-5680-f4ae-6e23-c8153bfe2f5a	AO	AGO	024	Angola 	Angola	\N
00040000-5680-f4ae-cd74-6fa182603d3e	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5680-f4ae-4165-52e7abd378cb	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5680-f4ae-505e-5011d19d917a	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5680-f4ae-3053-d6cce81b583a	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5680-f4ae-dbca-a93ac15a507d	AM	ARM	051	Armenia 	Armenija	\N
00040000-5680-f4ae-ec5f-13d10dfe3c59	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5680-f4ae-da1f-c75ba9f09d9d	AU	AUS	036	Australia 	Avstralija	\N
00040000-5680-f4ae-c545-f5a5e3dd1d3f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5680-f4ae-c983-1161870a13e1	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5680-f4ae-86f9-07201b21b72f	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5680-f4ae-46fb-fc1879d5c26c	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5680-f4ae-e9ab-01a3c12e2034	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5680-f4ae-7ce8-8f2c0246ee24	BB	BRB	052	Barbados 	Barbados	\N
00040000-5680-f4ae-c1fa-6a25c031cb1b	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5680-f4ae-9ba4-02aa54cd50d0	BE	BEL	056	Belgium 	Belgija	\N
00040000-5680-f4ae-1d2a-3c6d0bceee08	BZ	BLZ	084	Belize 	Belize	\N
00040000-5680-f4ae-c6ed-09a5e2b326b7	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5680-f4ae-4b80-e8c8cedd5a2c	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5680-f4ae-81f3-58b60d608481	BT	BTN	064	Bhutan 	Butan	\N
00040000-5680-f4ae-240a-7b55f7e3c78f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5680-f4ae-009e-3702e62e707e	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5680-f4ae-a89b-6773ce676c55	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5680-f4ae-8a38-3ece37fb1df5	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5680-f4ae-b06b-a70efabe8c7c	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5680-f4ae-ca9b-4a03fe47bb0a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5680-f4ae-8f41-3b032f4a5d0a	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5680-f4ae-d92f-19df124aedd5	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5680-f4ae-c85c-973ec898e48a	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5680-f4ae-3bf9-e45ddfad1bff	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5680-f4ae-5a61-89be28a70938	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5680-f4ae-5e77-0569ff699649	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5680-f4ae-b0b0-eb0c4ae110c9	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5680-f4ae-f319-4235709b88c1	CA	CAN	124	Canada 	Kanada	\N
00040000-5680-f4ae-3775-21972f57d2ce	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5680-f4ae-707f-b4946e3f94b9	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5680-f4ae-09db-6eb308848e25	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5680-f4ae-7e90-e25fa9cca602	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5680-f4ae-1282-ac7c81cb65d6	CL	CHL	152	Chile 	Čile	\N
00040000-5680-f4ae-9f48-6f3b3274dc3f	CN	CHN	156	China 	Kitajska	\N
00040000-5680-f4ae-f148-11285e1648e5	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5680-f4ae-4f01-cd19f311b65f	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5680-f4ae-96a5-bee7c1d6beac	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5680-f4ae-b6cd-1bc61b64bc33	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5680-f4ae-46fd-b5c8f262a6d2	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5680-f4ae-0d0d-d3a26b22a677	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5680-f4ae-03dc-383d4ae47fbb	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5680-f4ae-ea0e-0804a741a3ea	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5680-f4ae-814f-aa08bf2127a6	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5680-f4ae-5567-0342fca6fc3a	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5680-f4ae-30f3-75359268be6a	CU	CUB	192	Cuba 	Kuba	\N
00040000-5680-f4ae-dca1-76c0d6ef30f5	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5680-f4ae-ef79-3fb0cca307ed	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5680-f4ae-385c-868d09945318	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5680-f4ae-f2cb-41fe05cf2280	DK	DNK	208	Denmark 	Danska	\N
00040000-5680-f4ae-8543-3885fd109b56	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5680-f4ae-e811-b0aef6f5b440	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5680-f4ae-bce3-d9d378969725	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5680-f4ae-bb07-5e402704efc1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5680-f4ae-fd97-df0a16c7c8e7	EG	EGY	818	Egypt 	Egipt	\N
00040000-5680-f4ae-3a53-baf2b08a15ea	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5680-f4ae-5985-8bf30d43d302	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5680-f4ae-2546-1ce63bce0b01	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5680-f4ae-5ac6-0afde79b3f5a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5680-f4ae-d869-3f45ee0ffdb6	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5680-f4ae-2573-e06dece73a96	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5680-f4ae-f500-a3070a2741ad	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5680-f4ae-8c6f-2b55769cd19d	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5680-f4ae-bba8-9ad33bda9d24	FI	FIN	246	Finland 	Finska	\N
00040000-5680-f4ae-2379-959a0dddc821	FR	FRA	250	France 	Francija	\N
00040000-5680-f4ae-4e42-d46bd88b0717	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5680-f4ae-1a3b-fcaacf5247b1	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5680-f4ae-a1bf-4b1f499c9d51	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5680-f4ae-d337-8e8603994477	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5680-f4ae-f337-a531a0cfcd5a	GA	GAB	266	Gabon 	Gabon	\N
00040000-5680-f4ae-ef1a-8f54473a54bd	GM	GMB	270	Gambia 	Gambija	\N
00040000-5680-f4ae-2f56-db92bbddc6fd	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5680-f4ae-934f-13a52280d8a9	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5680-f4ae-c4cd-9c7baf19b8ad	GH	GHA	288	Ghana 	Gana	\N
00040000-5680-f4ae-ee92-94d4b3ff73a1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5680-f4ae-57a9-06dee1bade43	GR	GRC	300	Greece 	Grčija	\N
00040000-5680-f4ae-6b09-45cd1c3f7489	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5680-f4ae-c8bf-cce42648b3b3	GD	GRD	308	Grenada 	Grenada	\N
00040000-5680-f4ae-5230-f5307113c7ae	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5680-f4ae-1020-f7913366c49a	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5680-f4ae-3a97-0745e2e9d176	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5680-f4ae-75c2-64cef1a48bc9	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5680-f4ae-a085-1b919c07e7cb	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5680-f4ae-7902-6b5e2b8ca62d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5680-f4ae-1ad8-73bd41256977	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5680-f4ae-04ea-23acea9c4d58	HT	HTI	332	Haiti 	Haiti	\N
00040000-5680-f4ae-2310-8a02e97cf1aa	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5680-f4ae-0e7e-ae81e69bd6c4	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5680-f4ae-17c9-64a804713448	HN	HND	340	Honduras 	Honduras	\N
00040000-5680-f4ae-e083-4c02451e9639	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5680-f4ae-7d2b-ba32fa734f1e	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5680-f4ae-b718-54e07fcdc2e0	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5680-f4ae-979c-c408888df9de	IN	IND	356	India 	Indija	\N
00040000-5680-f4ae-9abe-2a43933cee2b	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5680-f4ae-480f-6c3496382072	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5680-f4ae-8c7e-c21f4a2dcd36	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5680-f4ae-d86a-f3a6e903d4aa	IE	IRL	372	Ireland 	Irska	\N
00040000-5680-f4ae-9646-ff847e33a3cd	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5680-f4ae-c1bd-a724abb44f18	IL	ISR	376	Israel 	Izrael	\N
00040000-5680-f4ae-79b2-27faad3295e0	IT	ITA	380	Italy 	Italija	\N
00040000-5680-f4ae-bace-7b24986b5933	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5680-f4ae-b32a-8f433d455a75	JP	JPN	392	Japan 	Japonska	\N
00040000-5680-f4ae-8eaa-9514b99a40de	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5680-f4ae-b828-116f9188f570	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5680-f4ae-b823-5b08ae05cc07	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5680-f4ae-2975-85e11ac2e5ef	KE	KEN	404	Kenya 	Kenija	\N
00040000-5680-f4ae-32b2-32f873ff2ad0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5680-f4ae-3ba0-0fa64bce377f	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5680-f4ae-5d78-58296023830a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5680-f4ae-5d59-1532042666a8	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5680-f4ae-416d-490fefba71fc	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5680-f4ae-1eaf-a8942e8b19a8	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5680-f4ae-e28c-81ef65a0fafa	LV	LVA	428	Latvia 	Latvija	\N
00040000-5680-f4ae-9d5c-92c9d7adbfa3	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5680-f4ae-09aa-54f53c92b3e0	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5680-f4ae-dd9a-4ca9ebfa9afe	LR	LBR	430	Liberia 	Liberija	\N
00040000-5680-f4ae-10a5-ea605a0bdb16	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5680-f4ae-5bc5-0437cbf263d3	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5680-f4ae-7879-c8f3123ed47f	LT	LTU	440	Lithuania 	Litva	\N
00040000-5680-f4ae-26e2-80db67f6e8fe	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5680-f4ae-0e86-45f8747c3d79	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5680-f4ae-a0a5-7f4b1f621acb	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5680-f4ae-7d7b-15c506830d49	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5680-f4ae-eeb8-37bf67372d90	MW	MWI	454	Malawi 	Malavi	\N
00040000-5680-f4ae-02c5-2bdf46810abc	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5680-f4ae-c7ef-591ad4a128bc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5680-f4ae-3312-04053bb7ecbe	ML	MLI	466	Mali 	Mali	\N
00040000-5680-f4ae-0727-0d8961bb7f5f	MT	MLT	470	Malta 	Malta	\N
00040000-5680-f4ae-dea8-9b15940d5176	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5680-f4ae-7a0c-cfce36c28878	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5680-f4ae-89af-4ad0f737502b	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5680-f4ae-6a7c-c608e26d810a	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5680-f4ae-3108-dbc8242a8206	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5680-f4ae-4cbd-e3ff1d0652c2	MX	MEX	484	Mexico 	Mehika	\N
00040000-5680-f4ae-d143-1f594db56c69	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5680-f4ae-4ad6-49a5be5aaecb	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5680-f4ae-9aed-6ad83b9775ed	MC	MCO	492	Monaco 	Monako	\N
00040000-5680-f4ae-529d-475027260925	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5680-f4ae-0c67-a3fcbe09efda	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5680-f4ae-d20f-8de3607dce56	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5680-f4ae-886d-6afc6a2627a0	MA	MAR	504	Morocco 	Maroko	\N
00040000-5680-f4ae-c7bc-21ed89b23b12	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5680-f4ae-a531-ed96f020a958	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5680-f4ae-d75e-a4a1eb359df3	NA	NAM	516	Namibia 	Namibija	\N
00040000-5680-f4ae-a0bf-15bf961e7cc2	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5680-f4ae-a790-124f5d2893a1	NP	NPL	524	Nepal 	Nepal	\N
00040000-5680-f4ae-bcb1-7fd7f071b46c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5680-f4ae-0beb-87bf54b40f0d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5680-f4ae-f852-5f080fc25527	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5680-f4ae-1a76-99f06a6b779d	NE	NER	562	Niger 	Niger 	\N
00040000-5680-f4ae-e053-420a00bb201a	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5680-f4ae-412a-479195dd83ab	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5680-f4ae-2957-4ce15dfcbae7	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5680-f4ae-38aa-d3cc89adbb3f	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5680-f4ae-87c3-9ae8cc4a7eab	NO	NOR	578	Norway 	Norveška	\N
00040000-5680-f4ae-05c6-9ec009e3bde8	OM	OMN	512	Oman 	Oman	\N
00040000-5680-f4ae-059a-6eeb7d237d4d	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5680-f4ae-96c7-3aff874239b1	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5680-f4ae-393f-b17e71b8a84c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5680-f4ae-7475-5ef269e634ad	PA	PAN	591	Panama 	Panama	\N
00040000-5680-f4ae-cac2-5d48cd045779	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5680-f4ae-1851-79d84f82a69a	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5680-f4ae-f23f-5372aa7ce571	PE	PER	604	Peru 	Peru	\N
00040000-5680-f4ae-2f2a-055310f6a7cd	PH	PHL	608	Philippines 	Filipini	\N
00040000-5680-f4ae-2f4e-0456c9cae58e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5680-f4ae-c300-0c777d0242d9	PL	POL	616	Poland 	Poljska	\N
00040000-5680-f4ae-9d74-d191fab1eddd	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5680-f4ae-452e-0c8d8f752c2c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5680-f4ae-bbb5-fb7033acc798	QA	QAT	634	Qatar 	Katar	\N
00040000-5680-f4ae-a460-3b38eeff32cc	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5680-f4ae-e7ac-fadd9d7161c7	RO	ROU	642	Romania 	Romunija	\N
00040000-5680-f4ae-286f-7b8d0e7ab2b0	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5680-f4ae-af9d-11deaa213fc5	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5680-f4ae-95a1-c30454caa3ab	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5680-f4ae-5fda-9d398bf6167a	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5680-f4ae-e92a-3e4e6264bfe2	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5680-f4ae-a5ed-c4f9013dbb7f	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5680-f4ae-eb16-951bb812be4d	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5680-f4ae-dd6c-144ed7c7bc7c	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5680-f4ae-fe11-6831cb4a164a	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5680-f4ae-faee-4374d1e19ab9	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5680-f4ae-01b3-8c28357795ae	SM	SMR	674	San Marino 	San Marino	\N
00040000-5680-f4ae-e488-503257bb6a9a	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5680-f4ae-cba4-790e25594042	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5680-f4ae-15d2-2a81352410f5	SN	SEN	686	Senegal 	Senegal	\N
00040000-5680-f4ae-5deb-d2c57dc9a55d	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5680-f4ae-d6dc-73edf1ac6300	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5680-f4ae-075d-606e4c08e4b0	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5680-f4ae-2a18-5cfd49856800	SG	SGP	702	Singapore 	Singapur	\N
00040000-5680-f4ae-1edb-1b807134d918	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5680-f4ae-da17-556e04b6edaa	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5680-f4ae-5b6c-0934a40441de	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5680-f4ae-32d9-d53e3673b620	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5680-f4ae-3d26-759ecd4f7a26	SO	SOM	706	Somalia 	Somalija	\N
00040000-5680-f4ae-543c-7b99d1222699	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5680-f4ae-c31a-38107ea66a9b	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5680-f4ae-636f-ea77a80f153f	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5680-f4ae-5ec1-7979efa23b3e	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5680-f4ae-ca04-cf9de06b3727	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5680-f4ae-cc8c-627bbd4bc20a	SD	SDN	729	Sudan 	Sudan	\N
00040000-5680-f4ae-29eb-4aad27c4131b	SR	SUR	740	Suriname 	Surinam	\N
00040000-5680-f4ae-0a8a-33768fd6d3ad	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5680-f4ae-9293-55d88902d8c2	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5680-f4ae-f11c-7bccac9e966a	SE	SWE	752	Sweden 	Švedska	\N
00040000-5680-f4ae-17d1-07906d7173e4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5680-f4ae-773a-6bcc5dda9938	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5680-f4ae-b169-f4da3528ca0e	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5680-f4ae-440a-2141f142b5f1	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5680-f4ae-14fe-7f091536874b	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5680-f4ae-cb38-6b6f88521686	TH	THA	764	Thailand 	Tajska	\N
00040000-5680-f4ae-7059-ba008db88de0	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5680-f4ae-91aa-567bf066c420	TG	TGO	768	Togo 	Togo	\N
00040000-5680-f4ae-54fc-dee8cb2970ab	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5680-f4ae-b6da-a7a8de5e17c6	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5680-f4ae-1a94-647fd40e5772	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5680-f4ae-27b4-d6ab1cd825c5	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5680-f4ae-01a7-ae9cd26eea4e	TR	TUR	792	Turkey 	Turčija	\N
00040000-5680-f4ae-cfb9-e4b9e437a86c	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5680-f4ae-fbe3-3fd5ef422bab	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5680-f4ae-619e-080b1f6d97cf	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5680-f4ae-f109-5232ea505fe2	UG	UGA	800	Uganda 	Uganda	\N
00040000-5680-f4ae-4793-a9aeaad52a2b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5680-f4ae-2bbc-5db0c290141c	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5680-f4ae-dbba-e66a6e4dd66f	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5680-f4ae-a57f-fd0663edc8a5	US	USA	840	United States 	Združene države Amerike	\N
00040000-5680-f4ae-b799-bb36eda6d6f9	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5680-f4ae-96a8-5f78e9a3c315	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5680-f4ae-0cc5-219eafd3aba1	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5680-f4ae-e329-437d3d06685e	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5680-f4ae-d3c8-f7e96fe8f2fd	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5680-f4ae-0c76-76844dcd2961	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5680-f4ae-e71d-3f0bacefb4cb	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5680-f4ae-26f8-ddf1ab7788bf	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5680-f4ae-4fed-7eb8e5cccd71	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5680-f4ae-8bef-1febb58b9d84	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5680-f4ae-6b0a-ca544697e703	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5680-f4ae-2ebe-111cbc59201b	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5680-f4ae-174d-db7b88d4d57a	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3173 (class 0 OID 33021134)
-- Dependencies: 238
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, obiskdoma, obiskkopr, obiskgost, obiskkoprgost, obiskzamejo, obiskkoprzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovikoprzamejo, ponovigost, ponovikoprgost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, zvrst, avtor, reziser, datum, soustvarjalci, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, stdogodkov, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5680-f4b1-f797-d89c115b19d3	000e0000-5680-f4b1-93b1-80a1bfe310d7	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	0	40	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5680-f4ae-cc9f-ff7185bd8bbf	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5680-f4b1-ec33-386b3138d562	000e0000-5680-f4b1-800f-93cfbb032e5c	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5680-f4ae-0cc3-710de94cec8d	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5680-f4b1-e549-b0cdba71e7cf	000e0000-5680-f4b1-2d6f-35381af4582d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	0	60	0	0	0	0	0	0	0	1	0	0.00	0.00	0.00	0.00	0	0		0.00	\N	002b0000-5680-f4ae-cc9f-ff7185bd8bbf	premiera	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5680-f4b1-3720-e1ce1599e623	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5680-f4b1-3707-948ad4f8a493	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	\N	\N	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3158 (class 0 OID 33020934)
-- Dependencies: 223
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, altercount, tipfunkcije_id) FROM stdin;
000d0000-5680-f4b1-0ce8-b3fb7b10712d	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-803f-276364beede1	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5680-f4ae-18f3-abc081d7c629
000d0000-5680-f4b1-3030-febc10fadf51	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-4a1b-3bc895dd26cf	umetnik	\N	Režija		velika	t	8	t	t	\N	1	000f0000-5680-f4ae-4209-cbb17540c6f6
000d0000-5680-f4b1-3761-afd84317eb0d	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-b68f-5ca9f8e37d51	inspicient	t	Inšpicient			t	8	t	t	\N	1	000f0000-5680-f4ae-934f-488be8b75ce8
000d0000-5680-f4b1-1060-1dabeb7026ef	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-3af6-20cd37993ff2	tehnik	t	Tehnični vodja			t	8	t	t	\N	1	000f0000-5680-f4ae-3824-3db995f9f5d3
000d0000-5680-f4b1-c5df-6c3d4d81c6c2	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-9661-80cd7d5c0152	tehnik	\N	Razsvetljava			t	3	t	t	\N	1	000f0000-5680-f4ae-3824-3db995f9f5d3
000d0000-5680-f4b1-f3bb-2ab870824a1b	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-a28c-9287714c8efb	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	1	000f0000-5680-f4ae-18f3-abc081d7c629
000d0000-5680-f4b1-37d0-cbb7758084dd	000e0000-5680-f4b1-800f-93cfbb032e5c	\N	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	4	000f0000-5680-f4ae-18f3-abc081d7c629
000d0000-5680-f4b1-0a49-7154639ee065	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-307a-fb8dbb0fca30	umetnik	\N	Lektoriranje			t	22	t	t	\N	1	000f0000-5680-f4ae-52e9-7b3847f282f7
000d0000-5680-f4b1-acd6-9ea59fa89736	000e0000-5680-f4b1-800f-93cfbb032e5c	000c0000-5680-f4b1-183d-2f19dc15d737	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	1	000f0000-5680-f4ae-dab2-864518c96ff8
\.


--
-- TOC entry 3135 (class 0 OID 33020725)
-- Dependencies: 200
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 3132 (class 0 OID 33020691)
-- Dependencies: 197
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3130 (class 0 OID 33020667)
-- Dependencies: 195
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5680-f4b1-5f9f-f12f9b6c2b1f	00080000-5680-f4b1-1634-cf4b1a7deaf2	00090000-5680-f4b1-1521-fcfd8cea9b0a	AK		igralka
\.


--
-- TOC entry 3147 (class 0 OID 33020848)
-- Dependencies: 212
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3184 (class 0 OID 33021404)
-- Dependencies: 249
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
00380000-5680-f4b1-3e40-dd985590e68f	00010000-5680-f4af-193c-dce156d12af8	\N	Prva mapa	Root mapa	2015-12-28 09:37:05	2015-12-28 09:37:05	R	\N	\N
\.


--
-- TOC entry 3185 (class 0 OID 33021417)
-- Dependencies: 250
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3187 (class 0 OID 33021439)
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
-- TOC entry 3151 (class 0 OID 33020873)
-- Dependencies: 216
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 3127 (class 0 OID 33020624)
-- Dependencies: 192
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5680-f4af-ffde-d53523365b14	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5680-f4af-3d7e-ae7cbcfdc132	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5680-f4af-d40f-0cf2426e3605	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5680-f4af-ac22-c5fc60ae5b57	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5680-f4af-4479-6e0d3ae4431c	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5680-f4af-3ed6-5d5cc4b08e0a	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5680-f4af-6d49-b5a5fc355e15	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5680-f4af-202b-400daa9ff35e	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5680-f4af-598b-abdd9a80b9e6	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5680-f4af-e4e3-3c8d6b77fc57	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5680-f4af-3829-d05c03fe4a08	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5680-f4af-c444-ef2733f77586	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5680-f4af-eff7-769703171923	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5680-f4af-ec1c-88d8c2f7a9e9	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5680-f4b0-1db3-b1fcdcb4c670	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5680-f4b1-8cb0-27d400e72c03	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5680-f4b1-e6d4-c3e27cd1ca65	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5680-f4b1-8a06-462f76b752bc	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5680-f4b1-952a-c063762d0513	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5680-f4b3-9c1f-addb6f5aa25e	application.tenant.maticnopodjetje	string	s:36:"00080000-5680-f4b3-1009-de8dde5761dd";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 3120 (class 0 OID 33020524)
-- Dependencies: 185
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5680-f4b0-10ad-20de65ff3616	00000000-5680-f4b0-1db3-b1fcdcb4c670	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5680-f4b1-3ebd-3efd61b88702	00000000-5680-f4b0-1db3-b1fcdcb4c670	00010000-5680-f4af-193c-dce156d12af8	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5680-f4b1-d7cd-c3ab0fd53b5f	00000000-5680-f4b1-8cb0-27d400e72c03	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 3124 (class 0 OID 33020591)
-- Dependencies: 189
-- Data for Name: organizacijskaenota; Type: TABLE DATA; Schema: public; Owner: -
--

COPY organizacijskaenota (id, parent_id, vodja_id, namestnik_id, sifra, naziv) FROM stdin;
00410000-5680-f4b1-2de1-a0fbf49c6954	\N	00100000-5680-f4b1-346e-39443f1da194	00100000-5680-f4b1-2331-984d0cba51d5	01	Gledališče Nimbis
00410000-5680-f4b1-3b3b-548d6c0d9258	00410000-5680-f4b1-2de1-a0fbf49c6954	00100000-5680-f4b1-346e-39443f1da194	00100000-5680-f4b1-2331-984d0cba51d5	02	Tehnika
\.


--
-- TOC entry 3121 (class 0 OID 33020535)
-- Dependencies: 186
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, twitter, skype, fb, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5680-f4b1-8873-82910558ef76	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx				1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5680-f4b1-80f2-cda52b0e6573	00010000-5680-f4b1-fd75-f64cc4bb9e4e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx				1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5680-f4b1-5eb3-cccdf7ef445e	00010000-5680-f4b1-cd22-6ac52b574d4f	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx				1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5680-f4b1-fe03-b36351c22732	00010000-5680-f4b1-a6d6-46c9fcf23d35	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx				1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5680-f4b1-64ef-58281d11dfa3	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx				1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5680-f4b1-cbb6-a8078c63a437	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx				1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5680-f4b1-5167-42667a734548	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx				1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5680-f4b1-10e0-a1facf06e582	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx				1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5680-f4b1-1521-fcfd8cea9b0a	00010000-5680-f4b1-7666-068fb86c58a5	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5680-f4b1-a061-a5a833344dfa	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx				1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5680-f4b1-f3c2-c52e7eae214d	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5680-f4b1-ba23-2b0a00b7981a	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx				\N	\N	\N	M		\N	\N	\N
00090000-5680-f4b1-43f9-5229b32f22ad	00010000-5680-f4b1-07cd-1058d597b949	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx				\N	\N	\N	Z		\N	\N	\N
00090000-5680-f4b1-3903-77fff9eb87e1	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-f4b1-5c5a-7d7ce858b9d8	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-f4b1-6da8-1fb2c3d7bee6	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-f4b1-0e35-0277c3051678	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5680-f4b1-c85d-48392cdb3e6f	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N				\N	\N	\N	Z		\N	\N	\N
00090000-5680-f4b1-04b7-b4b9eec0a461	\N	\N	0019		Lojze	Žumer			Lojze  Žumer		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-f4b1-d7cc-d23bcad09a77	\N	\N	0020		Luka	Novak			Luka  Novak		\N				\N	\N	\N	M		\N	\N	\N
00090000-5680-f4b1-8d77-909c909aa3c7	\N	\N	0021		Vinko	   Netriman   			Vinko     Netriman   		\N				\N	\N	\N	M		\N	\N	\N
\.


--
-- TOC entry 3113 (class 0 OID 33020470)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5680-f4ae-0ee1-12a0f2482a73	Aaa-read	Aaa (User,Role,Permission) - branje	t
00030000-5680-f4ae-1b6d-6fbd3c1a4e6f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	t
00030000-5680-f4ae-acd8-d82490a80865	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	t
00030000-5680-f4ae-e96e-c55072b1468d	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	t
00030000-5680-f4ae-5320-5a62877e18bd	OsebniPodatki-write	Oseba - spreminjanje osebnih podatkov	t
00030000-5680-f4ae-afbe-b1ce986981ad	OsebniPodatki-read	Oseba - branje tudi osebnih podatkov	t
00030000-5680-f4ae-e568-0f5941cdc5b4	ProgramDela-lock	ProgramDela - zaklepanje	t
00030000-5680-f4ae-ce1f-b9956ba0caed	ProgramDela-unlock	ProgramDela - odklepanje	t
00030000-5680-f4ae-66ca-400c95b261f0	Alternacija-vse	Alternacija write dostop ne le do področja tehnike	t
00030000-5680-f4ae-392e-5886222569d0	Funkcija-vse	Funkcija write dostop ne le do področje tehnike	t
00030000-5680-f4ae-d40d-0b765bc1769f	Abonma-read	Abonma - branje	t
00030000-5680-f4ae-7ec2-ffe6c045311c	Abonma-write	Abonma - spreminjanje	t
00030000-5680-f4ae-1c41-ba67ad6f5221	Alternacija-read	Alternacija - branje	t
00030000-5680-f4ae-27ad-79a5dfdcd288	Alternacija-write	Alternacija - spreminjanje	t
00030000-5680-f4ae-d754-00d26c81bfdc	Arhivalija-read	Arhivalija - branje	t
00030000-5680-f4ae-318d-d9b3f1863f06	Arhivalija-write	Arhivalija - spreminjanje	t
00030000-5680-f4ae-f906-2f40ef621138	AuthStorage-read	AuthStorage - branje	t
00030000-5680-f4ae-f9de-bab2aa4836a4	AuthStorage-write	AuthStorage - spreminjanje	t
00030000-5680-f4ae-56bf-66b7947234b3	AvtorBesedila-read	AvtorBesedila - branje	t
00030000-5680-f4ae-51bb-5bde8db8993d	AvtorBesedila-write	AvtorBesedila - spreminjanje	t
00030000-5680-f4ae-edd9-ea92b4f65573	Besedilo-read	Besedilo - branje	t
00030000-5680-f4ae-a7b0-c8336de3c277	Besedilo-write	Besedilo - spreminjanje	t
00030000-5680-f4ae-f25f-ada05acb23df	Dogodek-read	Dogodek - branje	t
00030000-5680-f4ae-a00e-b50798d7f357	Dogodek-write	Dogodek - spreminjanje	t
00030000-5680-f4ae-273b-f0e630d6ffa0	DogodekSplosni-read	DogodekSplosni - branje	t
00030000-5680-f4ae-f3d0-4dc79e82a3c3	DogodekSplosni-write	DogodekSplosni - spreminjanje	t
00030000-5680-f4ae-7713-155e462e3d80	DogodekTehnicni-read	DogodekTehnicni - branje	t
00030000-5680-f4ae-d9ef-73d90f01227e	DogodekTehnicni-write	DogodekTehnicni - spreminjanje	t
00030000-5680-f4ae-e29c-72ac97e3073e	DogodekTrait-read	DogodekTrait - branje	t
00030000-5680-f4ae-b5c4-3a44cbd11e7b	DogodekTrait-write	DogodekTrait - spreminjanje	t
00030000-5680-f4ae-5eff-772da17e121b	DrugiVir-read	DrugiVir - branje	t
00030000-5680-f4ae-53b5-b136924a8380	DrugiVir-write	DrugiVir - spreminjanje	t
00030000-5680-f4ae-0fdd-7fff02a4ebc3	Drzava-read	Drzava - branje	t
00030000-5680-f4ae-a5e6-a9b9ff8a83cf	Drzava-write	Drzava - spreminjanje	t
00030000-5680-f4ae-eba6-3a981919494f	EnotaPrograma-read	EnotaPrograma - branje	t
00030000-5680-f4ae-c756-5de42e60a5c1	EnotaPrograma-write	EnotaPrograma - spreminjanje	t
00030000-5680-f4ae-27d8-e1fb07238135	Funkcija-read	Funkcija - branje	t
00030000-5680-f4ae-df30-f4d63822347d	Funkcija-write	Funkcija - spreminjanje	t
00030000-5680-f4ae-3eea-b953ca13cd04	Gostovanje-read	Gostovanje - branje	t
00030000-5680-f4ae-9a11-bce6a200129f	Gostovanje-write	Gostovanje - spreminjanje	t
00030000-5680-f4ae-295d-48bb90e6b8c3	KontaktnaOseba-read	KontaktnaOseba - branje	t
00030000-5680-f4ae-3ffa-27f2187213a8	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	t
00030000-5680-f4ae-63b8-e9c78bfd203a	Kupec-read	Kupec - branje	t
00030000-5680-f4ae-8625-36e7d7a8d0a9	Kupec-write	Kupec - spreminjanje	t
00030000-5680-f4ae-5064-3767dfff8e94	NacinPlacina-read	NacinPlacina - branje	t
00030000-5680-f4ae-fa3c-27b34f58e333	NacinPlacina-write	NacinPlacina - spreminjanje	t
00030000-5680-f4ae-8bf2-ba000b146d6f	Option-read	Option - branje	t
00030000-5680-f4ae-435c-98a4aee7ac18	Option-write	Option - spreminjanje	t
00030000-5680-f4ae-eccd-f9b38d71a1cc	OptionValue-read	OptionValue - branje	t
00030000-5680-f4ae-28b0-bf81d2942f0b	OptionValue-write	OptionValue - spreminjanje	t
00030000-5680-f4ae-3f0c-f7b9532ce01e	OrganizacijskaEnota-read	OrganizacijskaEnota - branje	t
00030000-5680-f4ae-7bcc-64d053ca4061	OrganizacijskaEnota-write	OrganizacijskaEnota - spreminjanje	t
00030000-5680-f4ae-2f1a-fa73c05e7c35	Oseba-read	Oseba - branje	t
00030000-5680-f4ae-b620-cf1fdc2d1119	Oseba-write	Oseba - spreminjanje	t
00030000-5680-f4ae-7161-d62ae3ccd79b	PlacilniInstrument-read	PlacilniInstrument - branje	t
00030000-5680-f4ae-6fbe-ab3079ec08c0	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	t
00030000-5680-f4ae-415a-9b98fb27bff4	PodrocjeSedenja-read	PodrocjeSedenja - branje	t
00030000-5680-f4ae-9a89-7fcef4e855ea	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	t
00030000-5680-f4ae-a03a-01a24e2442d3	Pogodba-read	Pogodba - branje	t
00030000-5680-f4ae-c540-e9bca4f92a83	Pogodba-write	Pogodba - spreminjanje	t
00030000-5680-f4ae-b447-04d68f67a940	Popa-read	Popa - branje	t
00030000-5680-f4ae-a287-31e0ab6af148	Popa-write	Popa - spreminjanje	t
00030000-5680-f4ae-dedf-6f4877910677	Posta-read	Posta - branje	t
00030000-5680-f4ae-4a6b-ae248aef153d	Posta-write	Posta - spreminjanje	t
00030000-5680-f4ae-ea3b-1a9a5928aaa7	PostavkaCDve-read	PostavkaCDve - branje	t
00030000-5680-f4ae-b7a9-134b7455c673	PostavkaCDve-write	PostavkaCDve - spreminjanje	t
00030000-5680-f4ae-a6dc-1bda66260aa2	PostavkaRacuna-read	PostavkaRacuna - branje	t
00030000-5680-f4ae-64a0-eff30f7606b4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	t
00030000-5680-f4ae-f4f3-569859e07820	PostniNaslov-read	PostniNaslov - branje	t
00030000-5680-f4ae-5b35-bec6ed0b8e19	PostniNaslov-write	PostniNaslov - spreminjanje	t
00030000-5680-f4ae-d826-0cc0dd0465a0	Praznik-read	Praznik - branje	t
00030000-5680-f4ae-5f13-f9d386edd23d	Praznik-write	Praznik - spreminjanje	t
00030000-5680-f4ae-c9e6-d278fbd94884	Predstava-read	Predstava - branje	t
00030000-5680-f4ae-42f9-64e00d4c0655	Predstava-write	Predstava - spreminjanje	t
00030000-5680-f4ae-6255-ad5b966437ab	ProdajaPredstave-read	ProdajaPredstave - branje	t
00030000-5680-f4ae-aa85-2871786fc98e	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	t
00030000-5680-f4ae-35a9-54092bd346cd	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	t
00030000-5680-f4ae-a881-d6ddc7c03f5d	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	t
00030000-5680-f4ae-203e-ca52b2479c23	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	t
00030000-5680-f4ae-8a7b-69442b2951e9	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	t
00030000-5680-f4ae-6e79-dbd2c8957632	ProgramDela-read	ProgramDela - branje	t
00030000-5680-f4ae-8244-bfdd25432815	ProgramDela-write	ProgramDela - spreminjanje	t
00030000-5680-f4ae-3ced-93760937ed36	ProgramFestival-read	ProgramFestival - branje	t
00030000-5680-f4ae-2ff5-83426f84988a	ProgramFestival-write	ProgramFestival - spreminjanje	t
00030000-5680-f4ae-0e99-d0b2f7f5bafb	ProgramGostovanje-read	ProgramGostovanje - branje	t
00030000-5680-f4ae-254c-b4c960f16bdd	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	t
00030000-5680-f4ae-1e88-e2f0b472c8c6	ProgramGostujoca-read	ProgramGostujoca - branje	t
00030000-5680-f4ae-aea1-bef50ace9e15	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	t
00030000-5680-f4ae-2d47-779da6e58aab	ProgramIzjemni-read	ProgramIzjemni - branje	t
00030000-5680-f4ae-997c-cc634ae20ba1	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	t
00030000-5680-f4ae-a405-073649974316	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	t
00030000-5680-f4ae-94b1-31bb2df040ad	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	t
00030000-5680-f4ae-f221-7b6be9f5d6c5	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	t
00030000-5680-f4ae-98bf-de3b5d3296a5	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	t
00030000-5680-f4ae-4f96-95e0e8f69651	ProgramPremiera-read	ProgramPremiera - branje	t
00030000-5680-f4ae-7164-d0e7025b0e0c	ProgramPremiera-write	ProgramPremiera - spreminjanje	t
00030000-5680-f4ae-e0b2-c86cbeac9353	ProgramRazno-read	ProgramRazno - branje	t
00030000-5680-f4ae-412d-d49a09f47124	ProgramRazno-write	ProgramRazno - spreminjanje	t
00030000-5680-f4ae-8363-6b527c992b92	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	t
00030000-5680-f4ae-ba41-4b28d590628f	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	t
00030000-5680-f4ae-4ca0-a4d9603c9c47	Prostor-read	Prostor - branje	t
00030000-5680-f4ae-d8a3-7050420e0f77	Prostor-write	Prostor - spreminjanje	t
00030000-5680-f4ae-c596-8499e50ea860	Racun-read	Racun - branje	t
00030000-5680-f4ae-38d4-cbd3d992e928	Racun-write	Racun - spreminjanje	t
00030000-5680-f4ae-693c-f010af50eae9	RazpisanSedez-read	RazpisanSedez - branje	t
00030000-5680-f4ae-0c9e-4ba853d3f9e0	RazpisanSedez-write	RazpisanSedez - spreminjanje	t
00030000-5680-f4ae-c8c4-92f543157ba1	Rekviziterstvo-read	Rekviziterstvo - branje	t
00030000-5680-f4ae-18ec-116e61431566	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	t
00030000-5680-f4ae-2b21-41faabc7bbda	Rekvizit-read	Rekvizit - branje	t
00030000-5680-f4ae-efd5-be6d2e4c9c4e	Rekvizit-write	Rekvizit - spreminjanje	t
00030000-5680-f4ae-4f97-82cca1f03a92	Revizija-read	Revizija - branje	t
00030000-5680-f4ae-dc28-301299df3001	Revizija-write	Revizija - spreminjanje	t
00030000-5680-f4ae-6b02-da6939d6f1ad	Rezervacija-read	Rezervacija - branje	t
00030000-5680-f4ae-11bb-dbcc8f061eda	Rezervacija-write	Rezervacija - spreminjanje	t
00030000-5680-f4ae-0c8d-13eaf42ffa38	SedezniRed-read	SedezniRed - branje	t
00030000-5680-f4ae-c6dc-5fc2db0b5b43	SedezniRed-write	SedezniRed - spreminjanje	t
00030000-5680-f4ae-371c-7b65fd417407	Sedez-read	Sedez - branje	t
00030000-5680-f4ae-6779-9202d20ca350	Sedez-write	Sedez - spreminjanje	t
00030000-5680-f4ae-6433-e179a44d744d	Sezona-read	Sezona - branje	t
00030000-5680-f4ae-4e5b-105e43e00692	Sezona-write	Sezona - spreminjanje	t
00030000-5680-f4ae-c41f-27837681b62a	StrosekUprizoritve-read	StrosekUprizoritve - branje	t
00030000-5680-f4ae-a2e4-3f223e750867	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	t
00030000-5680-f4ae-514b-f3e2a8e48ec5	Telefonska-read	Telefonska - branje	t
00030000-5680-f4ae-c512-6e16be9d7d20	Telefonska-write	Telefonska - spreminjanje	t
00030000-5680-f4ae-0748-46a8511e2d9d	TerminStoritve-read	TerminStoritve - branje	t
00030000-5680-f4ae-6c57-89de07c405a8	TerminStoritve-write	TerminStoritve - spreminjanje	t
00030000-5680-f4ae-fa1f-159fec9c4b30	TipFunkcije-read	TipFunkcije - branje	t
00030000-5680-f4ae-c0d4-1df74a519fe5	TipFunkcije-write	TipFunkcije - spreminjanje	t
00030000-5680-f4ae-31fd-2f2bdb885523	TipPopa-read	TipPopa - branje	t
00030000-5680-f4ae-072f-c5df0be615cb	TipPopa-write	TipPopa - spreminjanje	t
00030000-5680-f4ae-482f-e1985caf1ae1	TipProgramskeEnote-read	TipProgramskeEnote - branje	t
00030000-5680-f4ae-c1ed-b35143361cc6	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	t
00030000-5680-f4ae-32dd-915f57c99b3a	TipVaje-read	TipVaje - branje	t
00030000-5680-f4ae-0dd7-3ab39c116afd	TipVaje-write	TipVaje - spreminjanje	t
00030000-5680-f4ae-c831-f3a7b3418b7c	Trr-read	Trr - branje	t
00030000-5680-f4ae-4a4a-4a7a855a7ce1	Trr-write	Trr - spreminjanje	t
00030000-5680-f4ae-cf49-79ef6863748a	Uprizoritev-read	Uprizoritev - branje	t
00030000-5680-f4ae-1a7a-2fdc7ef96187	Uprizoritev-write	Uprizoritev - spreminjanje	t
00030000-5680-f4ae-0754-6a33a868dd66	Vaja-read	Vaja - branje	t
00030000-5680-f4ae-33b8-ab4593dc779e	Vaja-write	Vaja - spreminjanje	t
00030000-5680-f4ae-d060-348de926fd52	VrstaSedezev-read	VrstaSedezev - branje	t
00030000-5680-f4ae-a107-c72add0783bd	VrstaSedezev-write	VrstaSedezev - spreminjanje	t
00030000-5680-f4ae-6c14-be3b303c1f37	VrstaStroska-read	VrstaStroska - branje	t
00030000-5680-f4ae-7847-2f08f8abda94	VrstaStroska-write	VrstaStroska - spreminjanje	t
00030000-5680-f4ae-3565-7ebfa6326ec8	Zaposlitev-read	Zaposlitev - branje	t
00030000-5680-f4ae-2e34-4281db74fd82	Zaposlitev-write	Zaposlitev - spreminjanje	t
00030000-5680-f4ae-08be-e1621bc8f5a9	Zasedenost-read	Zasedenost - branje	t
00030000-5680-f4ae-f24e-5ce69349b4ee	Zasedenost-write	Zasedenost - spreminjanje	t
00030000-5680-f4ae-5125-abf4514dc29f	ZvrstSurs-read	ZvrstSurs - branje	t
00030000-5680-f4ae-09e8-5ba6133da5fd	ZvrstSurs-write	ZvrstSurs - spreminjanje	t
00030000-5680-f4ae-6751-aacbb1a2f2b6	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	t
00030000-5680-f4ae-68fb-80287299b3e2	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	t
00030000-5680-f4ae-9e1b-2324b3364b38	Job-read	Branje opravil - samo zase - branje	t
00030000-5680-f4ae-e510-4aea6c02c051	Job-write	Dodajanje in spreminjanje opravil - samo zase	t
00030000-5680-f4ae-c1d1-bef8dfe05cbe	Job-admin	Upravljanje opravil za vse uporabnike	t
00030000-5680-f4ae-b203-6d81bcf29d33	Report-read	Report - branje	t
00030000-5680-f4ae-5545-4f9dba29a6e0	Report-write	Report - spreminjanje	t
00030000-5680-f4ae-0cc6-b49221275100	Stevilcenje-write	Stevilcenje - spreminjanje	t
00030000-5680-f4ae-0996-6923558f388b	Mapa-append	Mapa - dovoljenje za ažuriranje zapisov v mapi	t
00030000-5680-f4ae-2fba-0d0616129cdb	Mapa-read	Mapa - osnovno dovoljenje za branje	t
00030000-5680-f4ae-465b-270c07ac2fe5	Mapa-write	Mapa - osnovno dovoljenje za pisanje	t
00030000-5680-f4ae-5ac4-8730aed6b973	Mapa-writeroot	Mapa - osnovno dovoljenje za spreminjanje mape brez starša	t
00030000-5680-f4ae-76f4-8231c62f0b27	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	t
00030000-5680-f4ae-6578-40a7483f5f7d	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	t
00030000-5680-f4ae-ce70-39693c7d901b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	t
00030000-5680-f4ae-b914-924a8b7ebff9	Zapis-read	Zapis - dovoljenje za pisanje zapisov	t
00030000-5680-f4ae-61c5-6dfb94f5fd5b	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5680-f4ae-5e8a-aeb72206359f	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	t
00030000-5680-f4ae-47d8-d030406f069b	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	t
00030000-5680-f4ae-fc10-1154643bf160	VrstaZapisa-read	Šifrant vrst zapisa - branje	t
00030000-5680-f4ae-0db2-ad21f8848ff1	Datoteka-write	Datoteka - spreminjanje	t
00030000-5680-f4ae-e252-9ccc9e272c44	Datoteka-read	Datoteke - branje	t
\.


--
-- TOC entry 3115 (class 0 OID 33020489)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5680-f4ae-c7bc-a067475f36cd	00030000-5680-f4ae-1b6d-6fbd3c1a4e6f
00020000-5680-f4ae-c7bc-a067475f36cd	00030000-5680-f4ae-0ee1-12a0f2482a73
00020000-5680-f4ae-f1d2-dbfcb9bc7a89	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-8d10-aac62f302513	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-c04e-2fd25174667d	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-c04e-2fd25174667d	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-c04e-2fd25174667d	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-c04e-2fd25174667d	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-c04e-2fd25174667d	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-c04e-2fd25174667d	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-2e34-4281db74fd82
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-fa84-40e8f0e04ba2	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-a7f1-6cbc23178a83	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-a7f1-6cbc23178a83	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-a7f1-6cbc23178a83	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-c0f7-e347fb091250	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-a397-cb6e50dc4263	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-a397-cb6e50dc4263	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-a397-cb6e50dc4263	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-a397-cb6e50dc4263	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-a0c0-4b9bd16f2de1	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-5dff-72b1567a487a	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-a287-31e0ab6af148
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-3ffa-27f2187213a8
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-8a7b-69442b2951e9
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-aa36-faf07030254d	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-8b45-fe8b1e27ee9d	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-67ae-d771194345c4	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-67ae-d771194345c4	00030000-5680-f4ae-072f-c5df0be615cb
00020000-5680-f4af-3775-6fe678d8b885	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-55d6-08f1533e4f75	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-55d6-08f1533e4f75	00030000-5680-f4ae-4a6b-ae248aef153d
00020000-5680-f4af-8b30-1bd6aeaec7fa	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-16a4-a208262b8cf4	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-16a4-a208262b8cf4	00030000-5680-f4ae-a5e6-a9b9ff8a83cf
00020000-5680-f4af-4fc7-3c33c2f0b63f	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-63f4-9a943046e36d	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-63f4-9a943046e36d	00030000-5680-f4ae-68fb-80287299b3e2
00020000-5680-f4af-a82a-f91bd9bf4ea5	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-6831-57b71aebef4e	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-6831-57b71aebef4e	00030000-5680-f4ae-09e8-5ba6133da5fd
00020000-5680-f4af-c4e8-02873f2ef1bb	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-b2b4-e2cd9b19a480	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-b2b4-e2cd9b19a480	00030000-5680-f4ae-7ec2-ffe6c045311c
00020000-5680-f4af-c63e-05efbeeebd71	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-fced-f3e927e40dcc	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-fced-f3e927e40dcc	00030000-5680-f4ae-d8a3-7050420e0f77
00020000-5680-f4af-fced-f3e927e40dcc	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-fced-f3e927e40dcc	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-fced-f3e927e40dcc	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4af-fced-f3e927e40dcc	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-5038-2bd80463879c	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-5038-2bd80463879c	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-5038-2bd80463879c	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-c558-c4ed1f68601a	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-c558-c4ed1f68601a	00030000-5680-f4ae-7847-2f08f8abda94
00020000-5680-f4af-601e-b2d156bf4b3c	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-7bcc-64d053ca4061
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-8496-f58a15576e76	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-300f-924665beff84	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-300f-924665beff84	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-300f-924665beff84	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-300f-924665beff84	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-300f-924665beff84	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-216a-6983d08474fc	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-216a-6983d08474fc	00030000-5680-f4ae-0dd7-3ab39c116afd
00020000-5680-f4af-7115-d4efee59604e	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-e568-0f5941cdc5b4
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-ce1f-b9956ba0caed
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-6e79-dbd2c8957632
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-8244-bfdd25432815
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-3ced-93760937ed36
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-2ff5-83426f84988a
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-0e99-d0b2f7f5bafb
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-254c-b4c960f16bdd
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-1e88-e2f0b472c8c6
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-aea1-bef50ace9e15
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-2d47-779da6e58aab
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-997c-cc634ae20ba1
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-a405-073649974316
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-94b1-31bb2df040ad
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-f221-7b6be9f5d6c5
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-98bf-de3b5d3296a5
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-4f96-95e0e8f69651
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-7164-d0e7025b0e0c
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-e0b2-c86cbeac9353
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-412d-d49a09f47124
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-8363-6b527c992b92
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-ba41-4b28d590628f
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-a881-d6ddc7c03f5d
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-53b5-b136924a8380
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-b7a9-134b7455c673
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-e510-4aea6c02c051
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-5eff-772da17e121b
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-35a9-54092bd346cd
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-ea3b-1a9a5928aaa7
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-9e1b-2324b3364b38
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-99cd-b3ffd3d3fdd8	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-6e79-dbd2c8957632
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-3ced-93760937ed36
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-0e99-d0b2f7f5bafb
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-1e88-e2f0b472c8c6
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-2d47-779da6e58aab
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-a405-073649974316
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-f221-7b6be9f5d6c5
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-4f96-95e0e8f69651
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-e0b2-c86cbeac9353
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-8363-6b527c992b92
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-35a9-54092bd346cd
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-5eff-772da17e121b
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-ea3b-1a9a5928aaa7
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-9e1b-2324b3364b38
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-550e-a8dadf58e35f	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-392e-5886222569d0
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-b945-2989e09629eb	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-cef7-86f54403d44d	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-6767-a86f6abda352	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-c540-e9bca4f92a83
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-d3b2-94c14e531794	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-3c45-135048732eab	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-7149-4f61bc230762	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-e2c6-3939215ae24d	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-e2c6-3939215ae24d	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4af-e2c6-3939215ae24d	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-e2c6-3939215ae24d	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-69dc-d0379e12991c	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-69dc-d0379e12991c	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-5eff-772da17e121b
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-53b5-b136924a8380
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-392e-5886222569d0
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-9e1b-2324b3364b38
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-e510-4aea6c02c051
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-c540-e9bca4f92a83
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-ea3b-1a9a5928aaa7
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-b7a9-134b7455c673
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-35a9-54092bd346cd
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-a881-d6ddc7c03f5d
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-e568-0f5941cdc5b4
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-6e79-dbd2c8957632
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-ce1f-b9956ba0caed
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-8244-bfdd25432815
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-3ced-93760937ed36
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-2ff5-83426f84988a
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-0e99-d0b2f7f5bafb
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-254c-b4c960f16bdd
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-1e88-e2f0b472c8c6
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-aea1-bef50ace9e15
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-2d47-779da6e58aab
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-997c-cc634ae20ba1
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-a405-073649974316
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-94b1-31bb2df040ad
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-f221-7b6be9f5d6c5
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-98bf-de3b5d3296a5
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-4f96-95e0e8f69651
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-7164-d0e7025b0e0c
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-e0b2-c86cbeac9353
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-412d-d49a09f47124
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-8363-6b527c992b92
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-ba41-4b28d590628f
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-ec60-a6ec82d91bdd	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-aacb-2bcc6ed1626b	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-392e-5886222569d0
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-c3f4-829c483b8f61	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-5eff-772da17e121b
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-53b5-b136924a8380
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-392e-5886222569d0
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-9e1b-2324b3364b38
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-e510-4aea6c02c051
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-3ffa-27f2187213a8
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-c540-e9bca4f92a83
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-a287-31e0ab6af148
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-ea3b-1a9a5928aaa7
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-b7a9-134b7455c673
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-35a9-54092bd346cd
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-a881-d6ddc7c03f5d
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-8a7b-69442b2951e9
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-e568-0f5941cdc5b4
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-6e79-dbd2c8957632
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-ce1f-b9956ba0caed
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-8244-bfdd25432815
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-3ced-93760937ed36
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-2ff5-83426f84988a
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-0e99-d0b2f7f5bafb
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-254c-b4c960f16bdd
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-1e88-e2f0b472c8c6
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-aea1-bef50ace9e15
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-2d47-779da6e58aab
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-997c-cc634ae20ba1
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-a405-073649974316
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-94b1-31bb2df040ad
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-f221-7b6be9f5d6c5
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-98bf-de3b5d3296a5
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-4f96-95e0e8f69651
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-7164-d0e7025b0e0c
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-e0b2-c86cbeac9353
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-412d-d49a09f47124
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-8363-6b527c992b92
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-ba41-4b28d590628f
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-2e34-4281db74fd82
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-79f4-dacccd3997d6	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-392e-5886222569d0
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-3ffa-27f2187213a8
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-a287-31e0ab6af148
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-8a7b-69442b2951e9
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-2e34-4281db74fd82
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-fe8d-b9bbff1d7542	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-d7b1-490c8827ea8e	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-5eff-772da17e121b
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-53b5-b136924a8380
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-9e1b-2324b3364b38
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-e510-4aea6c02c051
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-3ffa-27f2187213a8
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-7bcc-64d053ca4061
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-c540-e9bca4f92a83
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-a287-31e0ab6af148
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-ea3b-1a9a5928aaa7
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-b7a9-134b7455c673
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-35a9-54092bd346cd
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-a881-d6ddc7c03f5d
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-8a7b-69442b2951e9
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-e568-0f5941cdc5b4
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-6e79-dbd2c8957632
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-ce1f-b9956ba0caed
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-8244-bfdd25432815
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-3ced-93760937ed36
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-2ff5-83426f84988a
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-0e99-d0b2f7f5bafb
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-254c-b4c960f16bdd
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-1e88-e2f0b472c8c6
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-aea1-bef50ace9e15
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-2d47-779da6e58aab
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-997c-cc634ae20ba1
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-a405-073649974316
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-94b1-31bb2df040ad
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-f221-7b6be9f5d6c5
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-98bf-de3b5d3296a5
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-4f96-95e0e8f69651
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-7164-d0e7025b0e0c
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-e0b2-c86cbeac9353
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-412d-d49a09f47124
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-8363-6b527c992b92
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-ba41-4b28d590628f
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-7847-2f08f8abda94
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-2e34-4281db74fd82
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4af-d293-9e39aafc7ea0	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0ee1-12a0f2482a73
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-1b6d-6fbd3c1a4e6f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-d40d-0b765bc1769f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-7ec2-ffe6c045311c
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-d754-00d26c81bfdc
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-318d-d9b3f1863f06
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f906-2f40ef621138
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f9de-bab2aa4836a4
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-56bf-66b7947234b3
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-51bb-5bde8db8993d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-edd9-ea92b4f65573
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a7b0-c8336de3c277
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f25f-ada05acb23df
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-e96e-c55072b1468d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-273b-f0e630d6ffa0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f3d0-4dc79e82a3c3
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-7713-155e462e3d80
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-d9ef-73d90f01227e
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-e29c-72ac97e3073e
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-b5c4-3a44cbd11e7b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a00e-b50798d7f357
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5eff-772da17e121b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-53b5-b136924a8380
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0fdd-7fff02a4ebc3
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a5e6-a9b9ff8a83cf
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-eba6-3a981919494f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c756-5de42e60a5c1
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-392e-5886222569d0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-3eea-b953ca13cd04
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-9a11-bce6a200129f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c1d1-bef8dfe05cbe
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-9e1b-2324b3364b38
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-e510-4aea6c02c051
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-295d-48bb90e6b8c3
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-3ffa-27f2187213a8
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-63b8-e9c78bfd203a
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-8625-36e7d7a8d0a9
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6578-40a7483f5f7d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-76f4-8231c62f0b27
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0996-6923558f388b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-2fba-0d0616129cdb
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-465b-270c07ac2fe5
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5ac4-8730aed6b973
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5064-3767dfff8e94
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-fa3c-27b34f58e333
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-8bf2-ba000b146d6f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-eccd-f9b38d71a1cc
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-28b0-bf81d2942f0b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-435c-98a4aee7ac18
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-3f0c-f7b9532ce01e
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-7bcc-64d053ca4061
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-7161-d62ae3ccd79b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6fbe-ab3079ec08c0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-415a-9b98fb27bff4
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-9a89-7fcef4e855ea
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c540-e9bca4f92a83
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a287-31e0ab6af148
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-dedf-6f4877910677
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-ea3b-1a9a5928aaa7
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-b7a9-134b7455c673
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a6dc-1bda66260aa2
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-64a0-eff30f7606b4
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-4a6b-ae248aef153d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-d826-0cc0dd0465a0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5f13-f9d386edd23d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c9e6-d278fbd94884
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-42f9-64e00d4c0655
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6255-ad5b966437ab
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-aa85-2871786fc98e
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-35a9-54092bd346cd
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a881-d6ddc7c03f5d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-203e-ca52b2479c23
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-8a7b-69442b2951e9
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-e568-0f5941cdc5b4
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6e79-dbd2c8957632
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-ce1f-b9956ba0caed
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-8244-bfdd25432815
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-3ced-93760937ed36
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-2ff5-83426f84988a
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0e99-d0b2f7f5bafb
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-254c-b4c960f16bdd
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-1e88-e2f0b472c8c6
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-aea1-bef50ace9e15
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-2d47-779da6e58aab
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-997c-cc634ae20ba1
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a405-073649974316
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-94b1-31bb2df040ad
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f221-7b6be9f5d6c5
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-98bf-de3b5d3296a5
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-4f96-95e0e8f69651
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-7164-d0e7025b0e0c
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-e0b2-c86cbeac9353
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-412d-d49a09f47124
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-8363-6b527c992b92
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-ba41-4b28d590628f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-4ca0-a4d9603c9c47
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-d8a3-7050420e0f77
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c596-8499e50ea860
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-38d4-cbd3d992e928
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-693c-f010af50eae9
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0c9e-4ba853d3f9e0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c8c4-92f543157ba1
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-18ec-116e61431566
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-2b21-41faabc7bbda
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-efd5-be6d2e4c9c4e
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-b203-6d81bcf29d33
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5545-4f9dba29a6e0
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-4f97-82cca1f03a92
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-dc28-301299df3001
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6b02-da6939d6f1ad
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-11bb-dbcc8f061eda
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0c8d-13eaf42ffa38
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c6dc-5fc2db0b5b43
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-371c-7b65fd417407
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6779-9202d20ca350
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6433-e179a44d744d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-4e5b-105e43e00692
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0cc6-b49221275100
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0748-46a8511e2d9d
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-acd8-d82490a80865
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6c57-89de07c405a8
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-fa1f-159fec9c4b30
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c0d4-1df74a519fe5
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-31fd-2f2bdb885523
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-072f-c5df0be615cb
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-482f-e1985caf1ae1
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c1ed-b35143361cc6
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-32dd-915f57c99b3a
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0dd7-3ab39c116afd
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-0754-6a33a868dd66
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-33b8-ab4593dc779e
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-d060-348de926fd52
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-a107-c72add0783bd
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6c14-be3b303c1f37
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-7847-2f08f8abda94
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-fc10-1154643bf160
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-47d8-d030406f069b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-2e34-4281db74fd82
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-08be-e1621bc8f5a9
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-f24e-5ce69349b4ee
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-5125-abf4514dc29f
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-09e8-5ba6133da5fd
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-6751-aacbb1a2f2b6
00020000-5680-f4b1-8a48-379ea81c5e40	00030000-5680-f4ae-68fb-80287299b3e2
00020000-5680-f4b1-591b-00c7a4f2f45c	00030000-5680-f4ae-5e8a-aeb72206359f
00020000-5680-f4b1-7555-fdab08fc2e07	00030000-5680-f4ae-61c5-6dfb94f5fd5b
00020000-5680-f4b1-6ce2-668c7bc708f7	00030000-5680-f4ae-1a7a-2fdc7ef96187
00020000-5680-f4b1-356c-012c4eafab8d	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4b1-d905-203ae923fb5f	00030000-5680-f4ae-2fba-0d0616129cdb
00020000-5680-f4b1-069a-88e75ec34504	00030000-5680-f4ae-465b-270c07ac2fe5
00020000-5680-f4b1-81e4-b1e5d37d963d	00030000-5680-f4ae-5ac4-8730aed6b973
00020000-5680-f4b1-51cd-74684f3b8713	00030000-5680-f4ae-0996-6923558f388b
00020000-5680-f4b1-d80e-cd005a41ca17	00030000-5680-f4ae-6578-40a7483f5f7d
00020000-5680-f4b1-a341-c0357fac4b0b	00030000-5680-f4ae-76f4-8231c62f0b27
00020000-5680-f4b1-e75d-3e55ad72d5d3	00030000-5680-f4ae-b914-924a8b7ebff9
00020000-5680-f4b1-2d51-143085012361	00030000-5680-f4ae-ce70-39693c7d901b
00020000-5680-f4b1-83f1-8052377ddb02	00030000-5680-f4ae-2f1a-fa73c05e7c35
00020000-5680-f4b1-ba01-fb84e5b82b17	00030000-5680-f4ae-b620-cf1fdc2d1119
00020000-5680-f4b1-2f68-74c845f8905a	00030000-5680-f4ae-5320-5a62877e18bd
00020000-5680-f4b1-3ea2-3ea68942e564	00030000-5680-f4ae-afbe-b1ce986981ad
00020000-5680-f4b1-2893-272a9d2daa62	00030000-5680-f4ae-0db2-ad21f8848ff1
00020000-5680-f4b1-7d55-5334c37a05f7	00030000-5680-f4ae-e252-9ccc9e272c44
00020000-5680-f4b1-88dc-0a600155aa99	00030000-5680-f4ae-b447-04d68f67a940
00020000-5680-f4b1-88dc-0a600155aa99	00030000-5680-f4ae-a287-31e0ab6af148
00020000-5680-f4b1-88dc-0a600155aa99	00030000-5680-f4ae-cf49-79ef6863748a
00020000-5680-f4b1-be88-b6b4f9f65c0e	00030000-5680-f4ae-c831-f3a7b3418b7c
00020000-5680-f4b1-5c75-15751a95cfd3	00030000-5680-f4ae-4a4a-4a7a855a7ce1
00020000-5680-f4b1-8628-1221d8e8459f	00030000-5680-f4ae-0cc6-b49221275100
00020000-5680-f4b1-f1c5-0df9b59d84b7	00030000-5680-f4ae-514b-f3e2a8e48ec5
00020000-5680-f4b1-febc-9f47ebad5b0b	00030000-5680-f4ae-c512-6e16be9d7d20
00020000-5680-f4b1-eb8a-1820bfe55a66	00030000-5680-f4ae-f4f3-569859e07820
00020000-5680-f4b1-c15d-7cd73de158bc	00030000-5680-f4ae-5b35-bec6ed0b8e19
00020000-5680-f4b1-98e3-b48d0e97ff82	00030000-5680-f4ae-3565-7ebfa6326ec8
00020000-5680-f4b1-c9d7-d7516ff56109	00030000-5680-f4ae-2e34-4281db74fd82
00020000-5680-f4b1-405e-835ec75a0f42	00030000-5680-f4ae-a03a-01a24e2442d3
00020000-5680-f4b1-f05a-2b4f62b71681	00030000-5680-f4ae-c540-e9bca4f92a83
00020000-5680-f4b1-df25-017ee3afaf9c	00030000-5680-f4ae-c41f-27837681b62a
00020000-5680-f4b1-55ac-28c8cdc9da1c	00030000-5680-f4ae-a2e4-3f223e750867
00020000-5680-f4b1-7d59-4ccb51a77d2b	00030000-5680-f4ae-1c41-ba67ad6f5221
00020000-5680-f4b1-d7b4-6ba4b98ba26a	00030000-5680-f4ae-27ad-79a5dfdcd288
00020000-5680-f4b1-1224-7e139f45aedb	00030000-5680-f4ae-66ca-400c95b261f0
00020000-5680-f4b1-a911-ecce8f19dfdf	00030000-5680-f4ae-27d8-e1fb07238135
00020000-5680-f4b1-683e-8896dab51c9d	00030000-5680-f4ae-df30-f4d63822347d
00020000-5680-f4b1-908b-40e0c4fd6b4a	00030000-5680-f4ae-392e-5886222569d0
\.


--
-- TOC entry 3152 (class 0 OID 33020880)
-- Dependencies: 217
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3156 (class 0 OID 33020914)
-- Dependencies: 221
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3168 (class 0 OID 33021052)
-- Dependencies: 233
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5680-f4b1-6de8-6770d9f582d0	00090000-5680-f4b1-8873-82910558ef76	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	0.00	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5680-f4b1-33d7-f2b041ae5d23	00090000-5680-f4b1-cbb6-a8078c63a437	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	0.00	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5680-f4b1-97a3-db01a73d47fb	00090000-5680-f4b1-43f9-5229b32f22ad	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	0.00	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5680-f4b1-7f97-5961e8f93125	00090000-5680-f4b1-a061-a5a833344dfa	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	0.00	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 3123 (class 0 OID 33020571)
-- Dependencies: 188
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, tipkli_id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5680-f4b1-1634-cf4b1a7deaf2	\N	00040000-5680-f4ae-5b6c-0934a40441de	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-aff9-86e981bdb0fc	\N	00040000-5680-f4ae-5b6c-0934a40441de	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5680-f4b1-ea65-629e77a81fb0	\N	00040000-5680-f4ae-5b6c-0934a40441de	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-44a2-2079ca84b0f4	\N	00040000-5680-f4ae-5b6c-0934a40441de	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-cde8-344adee38af2	\N	00040000-5680-f4ae-5b6c-0934a40441de	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-8d6a-234343dc5856	\N	00040000-5680-f4ae-3053-d6cce81b583a	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-54a1-8706c44420f2	\N	00040000-5680-f4ae-5567-0342fca6fc3a	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-5a6f-1d3f66811c30	\N	00040000-5680-f4ae-c545-f5a5e3dd1d3f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b1-9467-0802435a7ebb	\N	00040000-5680-f4ae-934f-13a52280d8a9	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5680-f4b3-1009-de8dde5761dd	\N	00040000-5680-f4ae-5b6c-0934a40441de	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 3126 (class 0 OID 33020616)
-- Dependencies: 191
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5680-f4ad-4f1a-5543fd2c528b	8341	Adlešiči
00050000-5680-f4ad-323f-eb8aae41e961	5270	Ajdovščina
00050000-5680-f4ad-91fa-c6bdf675a7cf	6280	Ankaran/Ancarano
00050000-5680-f4ae-83ac-49b8585cf5e1	9253	Apače
00050000-5680-f4ae-62dd-0ce1eef818bb	8253	Artiče
00050000-5680-f4ae-9a38-51bccb49b565	4275	Begunje na Gorenjskem
00050000-5680-f4ae-e1da-9e757c661c18	1382	Begunje pri Cerknici
00050000-5680-f4ae-f131-407a93ad174a	9231	Beltinci
00050000-5680-f4ae-d5e8-71654a83b2ba	2234	Benedikt
00050000-5680-f4ae-d94a-5fc37c2b3f2c	2345	Bistrica ob Dravi
00050000-5680-f4ae-4860-e30d3b007e46	3256	Bistrica ob Sotli
00050000-5680-f4ae-c7c4-622883391343	8259	Bizeljsko
00050000-5680-f4ae-2e25-d4da7f4d8529	1223	Blagovica
00050000-5680-f4ae-beff-302f7a57ad19	8283	Blanca
00050000-5680-f4ae-6462-79f59f0fcb6f	4260	Bled
00050000-5680-f4ae-dfb8-57f7b5abcab1	4273	Blejska Dobrava
00050000-5680-f4ae-f079-c7fa29ec87ef	9265	Bodonci
00050000-5680-f4ae-0041-adb05317ad57	9222	Bogojina
00050000-5680-f4ae-a962-5a0b0f9ac926	4263	Bohinjska Bela
00050000-5680-f4ae-1eb5-b81c57f4c780	4264	Bohinjska Bistrica
00050000-5680-f4ae-09c9-be17f9362e55	4265	Bohinjsko jezero
00050000-5680-f4ae-b716-aa534cb7e872	1353	Borovnica
00050000-5680-f4ae-cb9d-65a60413e00d	8294	Boštanj
00050000-5680-f4ae-85da-8d853242afd4	5230	Bovec
00050000-5680-f4ae-a84d-ab68dd2d489a	5295	Branik
00050000-5680-f4ae-caa7-28aff34c1031	3314	Braslovče
00050000-5680-f4ae-18bd-8b4b725d9ea6	5223	Breginj
00050000-5680-f4ae-9364-b6a8602c21d6	8280	Brestanica
00050000-5680-f4ae-2cf2-f93ca3736689	2354	Bresternica
00050000-5680-f4ae-26a6-0edd35f21365	4243	Brezje
00050000-5680-f4ae-4633-3860e86dbd47	1351	Brezovica pri Ljubljani
00050000-5680-f4ae-4129-a785410b2b63	8250	Brežice
00050000-5680-f4ae-c852-3c0db747a706	4210	Brnik - Aerodrom
00050000-5680-f4ae-c392-bb6dde62a2d9	8321	Brusnice
00050000-5680-f4ae-9d24-6df13f7b4821	3255	Buče
00050000-5680-f4ae-77c0-729692a344de	8276	Bučka 
00050000-5680-f4ae-0768-2a8964e94c10	9261	Cankova
00050000-5680-f4ae-b4cf-9338b7c085b1	3000	Celje 
00050000-5680-f4ae-45b2-2b5b419b231d	3001	Celje - poštni predali
00050000-5680-f4ae-728d-75eaebe95636	4207	Cerklje na Gorenjskem
00050000-5680-f4ae-8e64-4815c8c9c4bf	8263	Cerklje ob Krki
00050000-5680-f4ae-c84c-7ea2f0d6a485	1380	Cerknica
00050000-5680-f4ae-0b7b-462ef92d6afd	5282	Cerkno
00050000-5680-f4ae-732e-5dc2d64d9344	2236	Cerkvenjak
00050000-5680-f4ae-cccf-b2231461fc1d	2215	Ceršak
00050000-5680-f4ae-b35a-f85cf2bcf149	2326	Cirkovce
00050000-5680-f4ae-6ac3-6df3c470ce14	2282	Cirkulane
00050000-5680-f4ae-8c67-53a0b395c816	5273	Col
00050000-5680-f4ae-5ef8-ded545c70d91	8251	Čatež ob Savi
00050000-5680-f4ae-52ce-d22eeaf8db06	1413	Čemšenik
00050000-5680-f4ae-4f44-b98f96ee9076	5253	Čepovan
00050000-5680-f4ae-4c6f-429dba84ba83	9232	Črenšovci
00050000-5680-f4ae-9165-d6cb7c7fb072	2393	Črna na Koroškem
00050000-5680-f4ae-dc32-c0c8f48813fb	6275	Črni Kal
00050000-5680-f4ae-b611-2d5c1b65eae0	5274	Črni Vrh nad Idrijo
00050000-5680-f4ae-c966-fe7258c67226	5262	Črniče
00050000-5680-f4ae-cebf-2282b5eb9b5e	8340	Črnomelj
00050000-5680-f4ae-5e77-0ec7c8bd0974	6271	Dekani
00050000-5680-f4ae-cc09-46fb0b4e8e8e	5210	Deskle
00050000-5680-f4ae-8790-3fe9edbd4e64	2253	Destrnik
00050000-5680-f4ae-3dac-572b0048076c	6215	Divača
00050000-5680-f4ae-c291-912ae5dc7459	1233	Dob
00050000-5680-f4ae-1392-df845d9ce02f	3224	Dobje pri Planini
00050000-5680-f4ae-9be6-afc05bc16a5d	8257	Dobova
00050000-5680-f4ae-760e-f4a86ba00774	1423	Dobovec
00050000-5680-f4ae-4099-41b2836e6137	5263	Dobravlje
00050000-5680-f4ae-0fc1-f1809d72abe2	3204	Dobrna
00050000-5680-f4ae-9c8c-aab14fd83727	8211	Dobrnič
00050000-5680-f4ae-37ac-776a45d21ffa	1356	Dobrova
00050000-5680-f4ae-904d-d97d1fd74eaf	9223	Dobrovnik/Dobronak 
00050000-5680-f4ae-c66e-d56a538b7394	5212	Dobrovo v Brdih
00050000-5680-f4ae-e042-020ef23055bf	1431	Dol pri Hrastniku
00050000-5680-f4ae-eb8c-5ddda4d5e9f4	1262	Dol pri Ljubljani
00050000-5680-f4ae-172c-2817b905e001	1273	Dole pri Litiji
00050000-5680-f4ae-a28d-2c2e911883cf	1331	Dolenja vas
00050000-5680-f4ae-6982-db54aaf87ed6	8350	Dolenjske Toplice
00050000-5680-f4ae-e7b1-2637f6df70d1	1230	Domžale
00050000-5680-f4ae-b470-ce3908c668b9	2252	Dornava
00050000-5680-f4ae-ca15-5a0b481a7ee1	5294	Dornberk
00050000-5680-f4ae-9549-59be4d66beff	1319	Draga
00050000-5680-f4ae-e96e-86ad43d37808	8343	Dragatuš
00050000-5680-f4ae-3c6e-440a2b3addd7	3222	Dramlje
00050000-5680-f4ae-a8b1-cdc20ffc5006	2370	Dravograd
00050000-5680-f4ae-7754-a584869f59a9	4203	Duplje
00050000-5680-f4ae-1cad-5b3e76f24b71	6221	Dutovlje
00050000-5680-f4ae-43b6-6d332c05361d	8361	Dvor
00050000-5680-f4ae-19e2-4475f9d5c739	2343	Fala
00050000-5680-f4ae-b38d-e125b8c4f5d1	9208	Fokovci
00050000-5680-f4ae-49e0-9d255f35c14c	2313	Fram
00050000-5680-f4ae-5b0d-b0eda2e72936	3213	Frankolovo
00050000-5680-f4ae-cc9c-dcff695b77f6	1274	Gabrovka
00050000-5680-f4ae-31ec-e936b2a74f1e	8254	Globoko
00050000-5680-f4ae-a9a2-ae67b6a8e7bd	5275	Godovič
00050000-5680-f4ae-974c-77098f468ede	4204	Golnik
00050000-5680-f4ae-255c-966d829b6d54	3303	Gomilsko
00050000-5680-f4ae-4e1f-7d56cce59509	4224	Gorenja vas
00050000-5680-f4ae-5a08-75ea089b8aae	3263	Gorica pri Slivnici
00050000-5680-f4ae-ab1c-7be84e972537	2272	Gorišnica
00050000-5680-f4ae-c23b-f74a5798354a	9250	Gornja Radgona
00050000-5680-f4ae-fc35-91abebcd6c68	3342	Gornji Grad
00050000-5680-f4ae-7f41-25ef29119f4c	4282	Gozd Martuljek
00050000-5680-f4ae-0d7d-1bebf224c34f	6272	Gračišče
00050000-5680-f4ae-d45c-2574aa7c56d7	9264	Grad
00050000-5680-f4ae-f62d-d21b55b2557f	8332	Gradac
00050000-5680-f4ae-70ae-798b6810c19c	1384	Grahovo
00050000-5680-f4ae-1fb0-5b69ffbe5241	5242	Grahovo ob Bači
00050000-5680-f4ae-bbd8-c62ebcd85066	5251	Grgar
00050000-5680-f4ae-6a30-203ec6680f61	3302	Griže
00050000-5680-f4ae-66b1-a6c483c986c2	3231	Grobelno
00050000-5680-f4ae-dd63-c859397b825e	1290	Grosuplje
00050000-5680-f4ae-ea8c-7b579496e52f	2288	Hajdina
00050000-5680-f4ae-0512-22778fed4976	8362	Hinje
00050000-5680-f4ae-7561-5e06aacdbb9a	2311	Hoče
00050000-5680-f4ae-8f44-f6bd92f91f39	9205	Hodoš/Hodos
00050000-5680-f4ae-fbf0-094475edebea	1354	Horjul
00050000-5680-f4ae-666c-9fecfe24613d	1372	Hotedršica
00050000-5680-f4ae-2b8f-63e196aa903c	1430	Hrastnik
00050000-5680-f4ae-822a-6966a757dd69	6225	Hruševje
00050000-5680-f4ae-9def-4e0fa4bb1868	4276	Hrušica
00050000-5680-f4ae-9e2a-52e413151578	5280	Idrija
00050000-5680-f4ae-39a6-f11cb096dc38	1292	Ig
00050000-5680-f4ae-a09e-40f56d64d378	6250	Ilirska Bistrica
00050000-5680-f4ae-c07f-d3e95e5b2a91	6251	Ilirska Bistrica-Trnovo
00050000-5680-f4ae-4c2f-9a33628b569a	1295	Ivančna Gorica
00050000-5680-f4ae-2bb2-588ca233f549	2259	Ivanjkovci
00050000-5680-f4ae-3ba7-8256514bbecc	1411	Izlake
00050000-5680-f4ae-1edd-807769de50b9	6310	Izola/Isola
00050000-5680-f4ae-6762-4348c0eb5c9c	2222	Jakobski Dol
00050000-5680-f4ae-8e0e-ae2c249a7ad4	2221	Jarenina
00050000-5680-f4ae-706a-ffbbb925d1c1	6254	Jelšane
00050000-5680-f4ae-5f29-44fd49ec6f26	4270	Jesenice
00050000-5680-f4ae-a598-f83ab475f105	8261	Jesenice na Dolenjskem
00050000-5680-f4ae-3def-8017e9a9e7d4	3273	Jurklošter
00050000-5680-f4ae-aa70-13cc9eb1735e	2223	Jurovski Dol
00050000-5680-f4ae-833d-1f4c5b8705f5	2256	Juršinci
00050000-5680-f4ae-17e9-9ebacd0e054d	5214	Kal nad Kanalom
00050000-5680-f4ae-e3e8-e0663a364cfb	3233	Kalobje
00050000-5680-f4ae-fbe2-c948e72a07db	4246	Kamna Gorica
00050000-5680-f4ae-0a8e-847add4e5816	2351	Kamnica
00050000-5680-f4ae-eeaf-9b7a3bbd81a3	1241	Kamnik
00050000-5680-f4ae-0565-297c06f35e94	5213	Kanal
00050000-5680-f4ae-e463-f7318357074c	8258	Kapele
00050000-5680-f4ae-c03a-5c100f619c56	2362	Kapla
00050000-5680-f4ae-1065-5de46926257c	2325	Kidričevo
00050000-5680-f4ae-95fe-ef301ecfd787	1412	Kisovec
00050000-5680-f4ae-b11d-a8e8f9ce1c73	6253	Knežak
00050000-5680-f4ae-7129-4ec27ae58467	5222	Kobarid
00050000-5680-f4ae-1f3d-e263295820c2	9227	Kobilje
00050000-5680-f4ae-bf6b-d9c754fb769e	1330	Kočevje
00050000-5680-f4ae-4ebe-89062117ac1b	1338	Kočevska Reka
00050000-5680-f4ae-b853-91cba4384d9d	2276	Kog
00050000-5680-f4ae-2deb-ff3cdc71021d	5211	Kojsko
00050000-5680-f4ae-0dae-e93697ee657b	6223	Komen
00050000-5680-f4ae-e4f4-bf32a5245c51	1218	Komenda
00050000-5680-f4ae-8f27-bb8a0b96b95e	6000	Koper/Capodistria 
00050000-5680-f4ae-e549-45edf8f58c71	6001	Koper/Capodistria - poštni predali
00050000-5680-f4ae-9890-92d444ac809b	8282	Koprivnica
00050000-5680-f4ae-b040-c6a0c14c2e78	5296	Kostanjevica na Krasu
00050000-5680-f4ae-ed47-168520b995d7	8311	Kostanjevica na Krki
00050000-5680-f4ae-2b42-5f65f8792d19	1336	Kostel
00050000-5680-f4ae-42f0-64fed5815c35	6256	Košana
00050000-5680-f4ae-d7ab-951260bfef83	2394	Kotlje
00050000-5680-f4ae-ff57-1c144708b795	6240	Kozina
00050000-5680-f4ae-ef83-36f6cfd40769	3260	Kozje
00050000-5680-f4ae-d2a6-bb813ade9214	4000	Kranj 
00050000-5680-f4ae-d7ea-9d29cb313c0c	4001	Kranj - poštni predali
00050000-5680-f4ae-2b8c-87330889c2a6	4280	Kranjska Gora
00050000-5680-f4ae-bf65-98ecb34e292d	1281	Kresnice
00050000-5680-f4ae-6e65-7680d10934c0	4294	Križe
00050000-5680-f4ae-4853-9141e333474e	9206	Križevci
00050000-5680-f4ae-5349-cbd9204f66cf	9242	Križevci pri Ljutomeru
00050000-5680-f4ae-ba36-48c31ebe1e2e	1301	Krka
00050000-5680-f4ae-f6b4-a3aad01e528d	8296	Krmelj
00050000-5680-f4ae-ffe7-7cd3ac5eb849	4245	Kropa
00050000-5680-f4ae-282c-2c52fe7791f0	8262	Krška vas
00050000-5680-f4ae-67f5-fe37c6fa200d	8270	Krško
00050000-5680-f4ae-7f29-881f9724b5f2	9263	Kuzma
00050000-5680-f4ae-979b-c0217fff8699	2318	Laporje
00050000-5680-f4ae-ee29-5ead140742b7	3270	Laško
00050000-5680-f4ae-88fc-bd58839fca29	1219	Laze v Tuhinju
00050000-5680-f4ae-e178-630fd004fb86	2230	Lenart v Slovenskih goricah
00050000-5680-f4ae-b9f5-1f4614630655	9220	Lendava/Lendva
00050000-5680-f4ae-c135-920030e0c13f	4248	Lesce
00050000-5680-f4ae-d88d-8e306a99818d	3261	Lesično
00050000-5680-f4ae-f836-793ba6ae9a37	8273	Leskovec pri Krškem
00050000-5680-f4ae-50cb-a22d3191bc37	2372	Libeliče
00050000-5680-f4ae-f848-ca58a0d920ff	2341	Limbuš
00050000-5680-f4ae-f617-3eb5b2d2e2ff	1270	Litija
00050000-5680-f4ae-1fde-33ddd2ff953f	3202	Ljubečna
00050000-5680-f4ae-f4f3-270926612cea	1000	Ljubljana 
00050000-5680-f4ae-61fb-1c24c0343f43	1001	Ljubljana - poštni predali
00050000-5680-f4ae-6b6a-6da050b505ee	1231	Ljubljana - Črnuče
00050000-5680-f4ae-f1f9-5ae5800a01a5	1261	Ljubljana - Dobrunje
00050000-5680-f4ae-b822-f892d73c6f34	1260	Ljubljana - Polje
00050000-5680-f4ae-ee8a-dee250c900f7	1210	Ljubljana - Šentvid
00050000-5680-f4ae-f86e-b67d2f81570a	1211	Ljubljana - Šmartno
00050000-5680-f4ae-d1c8-5d97cd399bb0	3333	Ljubno ob Savinji
00050000-5680-f4ae-89c6-78bccaa8b253	9240	Ljutomer
00050000-5680-f4ae-eaa6-cc7e5def6ed0	3215	Loče
00050000-5680-f4ae-3802-0733bc62c921	5231	Log pod Mangartom
00050000-5680-f4ae-6218-ab5b7c40153a	1358	Log pri Brezovici
00050000-5680-f4ae-d8f2-e58bef7c9c0c	1370	Logatec
00050000-5680-f4ae-bf70-17f4f55f6a4a	1371	Logatec
00050000-5680-f4ae-ccf7-7f840b552b6d	1434	Loka pri Zidanem Mostu
00050000-5680-f4ae-2320-e1a15175aec3	3223	Loka pri Žusmu
00050000-5680-f4ae-a52a-01abbee6a723	6219	Lokev
00050000-5680-f4ae-6f9d-19a316b4b8bd	1318	Loški Potok
00050000-5680-f4ae-638c-bfb785437e2a	2324	Lovrenc na Dravskem polju
00050000-5680-f4ae-eb21-bf0f28a0b99a	2344	Lovrenc na Pohorju
00050000-5680-f4ae-be69-d1719b723701	3334	Luče
00050000-5680-f4ae-df09-0778843fe4bc	1225	Lukovica
00050000-5680-f4ae-3b10-763a9d081897	9202	Mačkovci
00050000-5680-f4ae-d89a-00b5a6910f67	2322	Majšperk
00050000-5680-f4ae-71b8-042e042b882e	2321	Makole
00050000-5680-f4ae-3c7d-a9622bdee210	9243	Mala Nedelja
00050000-5680-f4ae-42d4-19f8c21a956c	2229	Malečnik
00050000-5680-f4ae-a216-c2f203165f97	6273	Marezige
00050000-5680-f4ae-6aa8-cc80676217cb	2000	Maribor 
00050000-5680-f4ae-472a-710be3021b2d	2001	Maribor - poštni predali
00050000-5680-f4ae-1cf5-1433f27d25e0	2206	Marjeta na Dravskem polju
00050000-5680-f4ae-c6fc-d1b4523e69f7	2281	Markovci
00050000-5680-f4ae-e520-b20996822f9b	9221	Martjanci
00050000-5680-f4ae-d69f-6ebdadb20166	6242	Materija
00050000-5680-f4ae-fc35-2ff9df74bdee	4211	Mavčiče
00050000-5680-f4ae-6c28-93f9cbe37972	1215	Medvode
00050000-5680-f4ae-0295-ae5a2c3241a4	1234	Mengeš
00050000-5680-f4ae-71f8-5615e625989e	8330	Metlika
00050000-5680-f4ae-f309-0ec8968f8a6f	2392	Mežica
00050000-5680-f4ae-dfa8-b1731b395f08	2204	Miklavž na Dravskem polju
00050000-5680-f4ae-3481-618f5cacfc90	2275	Miklavž pri Ormožu
00050000-5680-f4ae-c28e-a45d99cf2ecf	5291	Miren
00050000-5680-f4ae-26f7-ce3146e4f43e	8233	Mirna
00050000-5680-f4ae-ea30-c8c17cc5bf4e	8216	Mirna Peč
00050000-5680-f4ae-cbec-3421dc423432	2382	Mislinja
00050000-5680-f4ae-53d3-f990809c38a7	4281	Mojstrana
00050000-5680-f4ae-78ae-62bd16e506c9	8230	Mokronog
00050000-5680-f4ae-b691-48d474920891	1251	Moravče
00050000-5680-f4ae-0c8d-f6bcd5224304	9226	Moravske Toplice
00050000-5680-f4ae-8a76-0d5d48dee85f	5216	Most na Soči
00050000-5680-f4ae-9543-d41f79d62578	1221	Motnik
00050000-5680-f4ae-9f4d-14d1e4af97a4	3330	Mozirje
00050000-5680-f4ae-7fce-806ea1ebc647	9000	Murska Sobota 
00050000-5680-f4ae-81c6-c174bb9f741d	9001	Murska Sobota - poštni predali
00050000-5680-f4ae-f46b-56101b73e79e	2366	Muta
00050000-5680-f4ae-fe1c-0f23234dd4ab	4202	Naklo
00050000-5680-f4ae-c994-aa531fc06565	3331	Nazarje
00050000-5680-f4ae-1211-31f5a310b340	1357	Notranje Gorice
00050000-5680-f4ae-078d-5c38e420d4d4	3203	Nova Cerkev
00050000-5680-f4ae-5742-54c941976e9c	5000	Nova Gorica 
00050000-5680-f4ae-2809-0ae3a7c9c989	5001	Nova Gorica - poštni predali
00050000-5680-f4ae-8a71-038e2c586be9	1385	Nova vas
00050000-5680-f4ae-f5d1-22b3764354a0	8000	Novo mesto
00050000-5680-f4ae-9c36-0ba92e3bc5ac	8001	Novo mesto - poštni predali
00050000-5680-f4ae-d064-0d26e4658166	6243	Obrov
00050000-5680-f4ae-1158-2b6020a219fd	9233	Odranci
00050000-5680-f4ae-5873-2173c3aac6d3	2317	Oplotnica
00050000-5680-f4ae-05d2-d0b37472181e	2312	Orehova vas
00050000-5680-f4ae-2f75-906403760728	2270	Ormož
00050000-5680-f4ae-51c4-9e89fc9ed14e	1316	Ortnek
00050000-5680-f4ae-d9fc-4861bad38f0e	1337	Osilnica
00050000-5680-f4ae-4d63-e843a8ecfc0e	8222	Otočec
00050000-5680-f4ae-3cf4-0584e354d36e	2361	Ožbalt
00050000-5680-f4ae-2ee7-09b07a98c9bb	2231	Pernica
00050000-5680-f4ae-a896-c4adab8b2fd6	2211	Pesnica pri Mariboru
00050000-5680-f4ae-fcce-6a00c3c40fce	9203	Petrovci
00050000-5680-f4ae-c084-875757ee3b63	3301	Petrovče
00050000-5680-f4ae-f4c8-1df93d7233df	6330	Piran/Pirano
00050000-5680-f4ae-a3f5-cd8993d59f55	8255	Pišece
00050000-5680-f4ae-89d4-283203cfad26	6257	Pivka
00050000-5680-f4ae-61f0-ae9016cf2405	6232	Planina
00050000-5680-f4ae-edd6-9153a7475130	3225	Planina pri Sevnici
00050000-5680-f4ae-a967-f6a498c0ae37	6276	Pobegi
00050000-5680-f4ae-2fcf-0edab1f02bed	8312	Podbočje
00050000-5680-f4ae-7c70-83763aba0b02	5243	Podbrdo
00050000-5680-f4ae-dcd9-9c7e6918e7a2	3254	Podčetrtek
00050000-5680-f4ae-cb1c-f48984988d62	2273	Podgorci
00050000-5680-f4ae-a743-4e6e8638a56d	6216	Podgorje
00050000-5680-f4ae-e717-fa6d7231ee0c	2381	Podgorje pri Slovenj Gradcu
00050000-5680-f4ae-8838-4e200c89188b	6244	Podgrad
00050000-5680-f4ae-b1a5-e4274f4a8446	1414	Podkum
00050000-5680-f4ae-73e7-47afbf0656be	2286	Podlehnik
00050000-5680-f4ae-f397-169db4307325	5272	Podnanos
00050000-5680-f4ae-e5a5-0e09d449857a	4244	Podnart
00050000-5680-f4ae-bff0-c052cfd21cd9	3241	Podplat
00050000-5680-f4ae-f8eb-e08e17562fb9	3257	Podsreda
00050000-5680-f4ae-9cf6-9381e4a07876	2363	Podvelka
00050000-5680-f4ae-a11d-ab51dae39151	2208	Pohorje
00050000-5680-f4ae-4f17-836caff5d499	2257	Polenšak
00050000-5680-f4ae-db34-f601d6a3667b	1355	Polhov Gradec
00050000-5680-f4ae-4013-1597a1faac69	4223	Poljane nad Škofjo Loko
00050000-5680-f4ae-18ba-ac2c5b393978	2319	Poljčane
00050000-5680-f4ae-fffb-13405aa484f8	1272	Polšnik
00050000-5680-f4ae-a7af-4fb9e7879c69	3313	Polzela
00050000-5680-f4ae-3d9a-e0c5651b0ca0	3232	Ponikva
00050000-5680-f4ae-8c2c-b5e0363cf1e5	6320	Portorož/Portorose
00050000-5680-f4ae-bb28-280e5885fe59	6230	Postojna
00050000-5680-f4ae-759f-39b598c085f9	2331	Pragersko
00050000-5680-f4ae-2d12-9e92d7588b59	3312	Prebold
00050000-5680-f4ae-7d86-377f2f4f0886	4205	Preddvor
00050000-5680-f4ae-1dc3-24dc1c5653c2	6255	Prem
00050000-5680-f4ae-58ca-419a9c8199f1	1352	Preserje
00050000-5680-f4ae-91fd-96d23102bdd0	6258	Prestranek
00050000-5680-f4ae-1924-96642f74ef9d	2391	Prevalje
00050000-5680-f4ae-e5dd-0e06f3845b9d	3262	Prevorje
00050000-5680-f4ae-c208-7a2f6009f0c5	1276	Primskovo 
00050000-5680-f4ae-7b47-e11e9c967ddf	3253	Pristava pri Mestinju
00050000-5680-f4ae-d82e-fb486e3fba68	9207	Prosenjakovci/Partosfalva
00050000-5680-f4ae-1710-eba9e4c65721	5297	Prvačina
00050000-5680-f4ae-30da-a2e4954142ae	2250	Ptuj
00050000-5680-f4ae-9c10-68898143f741	2323	Ptujska Gora
00050000-5680-f4ae-344f-6dff04f4f808	9201	Puconci
00050000-5680-f4ae-9848-12c923f947ea	2327	Rače
00050000-5680-f4ae-b365-544a3b1c1fb5	1433	Radeče
00050000-5680-f4ae-1bbf-d5e5788feed0	9252	Radenci
00050000-5680-f4ae-bdb5-06c0b741d144	2360	Radlje ob Dravi
00050000-5680-f4ae-8026-20c04f4526bc	1235	Radomlje
00050000-5680-f4ae-bcf9-3055310f6670	4240	Radovljica
00050000-5680-f4ae-8ebb-966f0098dd3e	8274	Raka
00050000-5680-f4ae-b8ff-ea04623741e9	1381	Rakek
00050000-5680-f4ae-6caf-436e7b3b65c5	4283	Rateče - Planica
00050000-5680-f4ae-86f7-98620d992b7e	2390	Ravne na Koroškem
00050000-5680-f4ae-a35b-9830107cc3a9	9246	Razkrižje
00050000-5680-f4ae-c041-c9e4c51cce57	3332	Rečica ob Savinji
00050000-5680-f4ae-e609-fdbdb5c2c778	5292	Renče
00050000-5680-f4ae-1f94-8398d151d0c2	1310	Ribnica
00050000-5680-f4ae-be31-d8a5a7b2c160	2364	Ribnica na Pohorju
00050000-5680-f4ae-b473-4b8a42342df9	3272	Rimske Toplice
00050000-5680-f4ae-e7d3-cb213bc1ed0b	1314	Rob
00050000-5680-f4ae-95b3-d0b976d1d794	5215	Ročinj
00050000-5680-f4ae-6431-84ba122b2b64	3250	Rogaška Slatina
00050000-5680-f4ae-92ba-324f2677e9b4	9262	Rogašovci
00050000-5680-f4ae-1527-a20aff1eb356	3252	Rogatec
00050000-5680-f4ae-f37d-3708aea2af77	1373	Rovte
00050000-5680-f4ae-e034-60bf48e911c1	2342	Ruše
00050000-5680-f4ae-59e7-29a0df517602	1282	Sava
00050000-5680-f4ae-7c6e-ebc4fab68596	6333	Sečovlje/Sicciole
00050000-5680-f4ae-34e6-f363918a841d	4227	Selca
00050000-5680-f4ae-63f9-e7fb939324d7	2352	Selnica ob Dravi
00050000-5680-f4ae-b8b1-8ddd08400ee0	8333	Semič
00050000-5680-f4ae-6c24-c17d912490c8	8281	Senovo
00050000-5680-f4ae-7277-f8039677f1b3	6224	Senožeče
00050000-5680-f4ae-eea9-dd4f17791f31	8290	Sevnica
00050000-5680-f4ae-b1da-824ca0eaa6f9	6210	Sežana
00050000-5680-f4ae-b51b-4b69e7e45bd5	2214	Sladki Vrh
00050000-5680-f4ae-36a1-d7a6f09f46f3	5283	Slap ob Idrijci
00050000-5680-f4ae-b74a-5068ef77004c	2380	Slovenj Gradec
00050000-5680-f4ae-a366-83fa5f1ea51e	2310	Slovenska Bistrica
00050000-5680-f4ae-3b27-143b24d4907d	3210	Slovenske Konjice
00050000-5680-f4ae-2267-9cc81ddb767a	1216	Smlednik
00050000-5680-f4ae-de8c-ae57945e998b	5232	Soča
00050000-5680-f4ae-e1d9-8d6de7650545	1317	Sodražica
00050000-5680-f4ae-1e29-8bd7060a1745	3335	Solčava
00050000-5680-f4ae-bb50-b876db30b3ac	5250	Solkan
00050000-5680-f4ae-fca2-97e10a26af2c	4229	Sorica
00050000-5680-f4ae-49a2-0e46ba185b94	4225	Sovodenj
00050000-5680-f4ae-63ef-b5a4c66ca8f2	5281	Spodnja Idrija
00050000-5680-f4ae-f3e3-758ab0b8bb1e	2241	Spodnji Duplek
00050000-5680-f4ae-75d1-74a9625e66c7	9245	Spodnji Ivanjci
00050000-5680-f4ae-ba5a-d02db6e8c1c6	2277	Središče ob Dravi
00050000-5680-f4ae-5bda-ffd856326497	4267	Srednja vas v Bohinju
00050000-5680-f4ae-aca0-e5e8e48afaf6	8256	Sromlje 
00050000-5680-f4ae-41b8-e6b521c0137e	5224	Srpenica
00050000-5680-f4ae-0884-ebf1c5106824	1242	Stahovica
00050000-5680-f4ae-0e2d-0e1056cafefc	1332	Stara Cerkev
00050000-5680-f4ae-97ff-5c9b9b49aeec	8342	Stari trg ob Kolpi
00050000-5680-f4ae-1f86-f387cac7af16	1386	Stari trg pri Ložu
00050000-5680-f4ae-7569-0a2948fd8606	2205	Starše
00050000-5680-f4ae-57c0-767d705a9082	2289	Stoperce
00050000-5680-f4ae-f4d4-ce188ab47941	8322	Stopiče
00050000-5680-f4ae-f898-ec008674696d	3206	Stranice
00050000-5680-f4ae-ce87-2728e9548676	8351	Straža
00050000-5680-f4ae-9bf4-b1cd6496a2bb	1313	Struge
00050000-5680-f4ae-216d-e8fade94b63c	8293	Studenec
00050000-5680-f4ae-92d2-0877f3168590	8331	Suhor
00050000-5680-f4ae-0fa0-53c54cbaf2b7	2233	Sv. Ana v Slovenskih goricah
00050000-5680-f4ae-9173-a2f3a20f7d06	2235	Sv. Trojica v Slovenskih goricah
00050000-5680-f4ae-8255-b93be9de36a2	2353	Sveti Duh na Ostrem Vrhu
00050000-5680-f4ae-231b-c8035be4dddc	9244	Sveti Jurij ob Ščavnici
00050000-5680-f4ae-19b9-8a3c648a5265	3264	Sveti Štefan
00050000-5680-f4ae-a998-8487507db4b7	2258	Sveti Tomaž
00050000-5680-f4ae-fd5e-c61f7d0d29a0	9204	Šalovci
00050000-5680-f4ae-d47e-81ee2629fc3d	5261	Šempas
00050000-5680-f4ae-3504-3d90b6083bb5	5290	Šempeter pri Gorici
00050000-5680-f4ae-5901-464316f6dfec	3311	Šempeter v Savinjski dolini
00050000-5680-f4ae-a5bf-9ab74c815c45	4208	Šenčur
00050000-5680-f4ae-7cda-b0f6df9d8734	2212	Šentilj v Slovenskih goricah
00050000-5680-f4ae-64fe-63945eeb68ce	8297	Šentjanž
00050000-5680-f4ae-e8a0-7914ffe9fa84	2373	Šentjanž pri Dravogradu
00050000-5680-f4ae-cfe0-5318edcef647	8310	Šentjernej
00050000-5680-f4ae-b352-0661b7a843f7	3230	Šentjur
00050000-5680-f4ae-184c-0318fee74550	3271	Šentrupert
00050000-5680-f4ae-3f6b-868eb61a4c6e	8232	Šentrupert
00050000-5680-f4ae-d824-25cfe1d12ab5	1296	Šentvid pri Stični
00050000-5680-f4ae-ea34-440f19077af7	8275	Škocjan
00050000-5680-f4ae-9679-ea44ccd43fb1	6281	Škofije
00050000-5680-f4ae-e158-983d60c886b9	4220	Škofja Loka
00050000-5680-f4ae-31f6-b79c6d932ed0	3211	Škofja vas
00050000-5680-f4ae-7e48-73547d0beffe	1291	Škofljica
00050000-5680-f4ae-d0c9-197536710f22	6274	Šmarje
00050000-5680-f4ae-1868-7038b113a2e8	1293	Šmarje - Sap
00050000-5680-f4ae-c5de-9820eb17361a	3240	Šmarje pri Jelšah
00050000-5680-f4ae-e84b-8506e0adc004	8220	Šmarješke Toplice
00050000-5680-f4ae-54fe-5bb96db527aa	2315	Šmartno na Pohorju
00050000-5680-f4ae-50ea-42d237f0393a	3341	Šmartno ob Dreti
00050000-5680-f4ae-d616-1dc124e14239	3327	Šmartno ob Paki
00050000-5680-f4ae-bda0-a77777179f71	1275	Šmartno pri Litiji
00050000-5680-f4ae-240a-ac9d7b520b4f	2383	Šmartno pri Slovenj Gradcu
00050000-5680-f4ae-d293-4b67aaa82154	3201	Šmartno v Rožni dolini
00050000-5680-f4ae-698a-2cb729f7270a	3325	Šoštanj
00050000-5680-f4ae-2073-0a4efc0dc6f1	6222	Štanjel
00050000-5680-f4ae-9ca9-f5e8cee03409	3220	Štore
00050000-5680-f4ae-3f9a-e3d11ab709f5	3304	Tabor
00050000-5680-f4ae-d5c4-d6b102957a09	3221	Teharje
00050000-5680-f4ae-57dc-2d12d2facb39	9251	Tišina
00050000-5680-f4ae-3c70-80ed62c7c357	5220	Tolmin
00050000-5680-f4ae-df75-ebdb08f70274	3326	Topolšica
00050000-5680-f4ae-b4f8-b81e6da0e610	2371	Trbonje
00050000-5680-f4ae-8d01-8857a25207be	1420	Trbovlje
00050000-5680-f4ae-b114-da3fac5f9ff2	8231	Trebelno 
00050000-5680-f4ae-00e7-21215d1e702b	8210	Trebnje
00050000-5680-f4ae-7d9f-30f17dab0c40	5252	Trnovo pri Gorici
00050000-5680-f4ae-9e47-850bcbd698c2	2254	Trnovska vas
00050000-5680-f4ae-22ad-1e22a6e7f3cc	1222	Trojane
00050000-5680-f4ae-be19-0bdafc60ed74	1236	Trzin
00050000-5680-f4ae-9fd4-0769baaa3b80	4290	Tržič
00050000-5680-f4ae-ae27-f300986e56af	8295	Tržišče
00050000-5680-f4ae-9be2-e690de656c58	1311	Turjak
00050000-5680-f4ae-23ad-8b29ca051756	9224	Turnišče
00050000-5680-f4ae-e766-536db5664c88	8323	Uršna sela
00050000-5680-f4ae-cab9-f516fe9bbe0f	1252	Vače
00050000-5680-f4ae-b43c-e5973e1f7780	3320	Velenje 
00050000-5680-f4ae-daae-6c3009404b5d	3322	Velenje - poštni predali
00050000-5680-f4ae-64ee-47eabdf7b9b1	8212	Velika Loka
00050000-5680-f4ae-963b-3bb71c6dffe3	2274	Velika Nedelja
00050000-5680-f4ae-3b95-275888466c97	9225	Velika Polana
00050000-5680-f4ae-ca13-c8b9c0d4db60	1315	Velike Lašče
00050000-5680-f4ae-97e1-149079e35482	8213	Veliki Gaber
00050000-5680-f4ae-3b18-9fdd23230cef	9241	Veržej
00050000-5680-f4ae-7664-f8b9296026be	1312	Videm - Dobrepolje
00050000-5680-f4ae-db6d-ee7ad8448567	2284	Videm pri Ptuju
00050000-5680-f4ae-daf2-5ba2ec19cab2	8344	Vinica
00050000-5680-f4ae-e5a1-d9c838ab5616	5271	Vipava
00050000-5680-f4ae-f862-5e9e7d9791a4	4212	Visoko
00050000-5680-f4ae-bdce-ff3cabdd272c	1294	Višnja Gora
00050000-5680-f4ae-faf0-a391837d697c	3205	Vitanje
00050000-5680-f4ae-84a3-e3a71f6cbb38	2255	Vitomarci
00050000-5680-f4ae-9967-e04f0e02cac0	1217	Vodice
00050000-5680-f4ae-5d82-f7cffb90f580	3212	Vojnik\t
00050000-5680-f4ae-6457-1b14c89ba98c	5293	Volčja Draga
00050000-5680-f4ae-f315-97f1068a63c0	2232	Voličina
00050000-5680-f4ae-d1ce-f4956dbd87d0	3305	Vransko
00050000-5680-f4ae-22ee-b43afdf5b6bb	6217	Vremski Britof
00050000-5680-f4ae-9909-cf4bd6a33e53	1360	Vrhnika
00050000-5680-f4ae-d627-43086638b712	2365	Vuhred
00050000-5680-f4ae-4c02-3696b618e156	2367	Vuzenica
00050000-5680-f4ae-a3c5-371949cdb13e	8292	Zabukovje 
00050000-5680-f4ae-dabb-386ab91b65c2	1410	Zagorje ob Savi
00050000-5680-f4ae-9b4f-389102d855cb	1303	Zagradec
00050000-5680-f4ae-8f3a-6f82628822f3	2283	Zavrč
00050000-5680-f4ae-619c-d960b119671b	8272	Zdole 
00050000-5680-f4ae-20e3-8e7504dc69ca	4201	Zgornja Besnica
00050000-5680-f4ae-704e-866335dd58cf	2242	Zgornja Korena
00050000-5680-f4ae-7d0b-e1b4d2251fac	2201	Zgornja Kungota
00050000-5680-f4ae-0b05-17f14794a95f	2316	Zgornja Ložnica
00050000-5680-f4ae-d04c-33d7abbfc4d1	2314	Zgornja Polskava
00050000-5680-f4ae-dbce-4b9639d47fe2	2213	Zgornja Velka
00050000-5680-f4ae-c345-d6f08c58cb35	4247	Zgornje Gorje
00050000-5680-f4ae-b2e4-9b201154237e	4206	Zgornje Jezersko
00050000-5680-f4ae-8e94-5dfd44be43ab	2285	Zgornji Leskovec
00050000-5680-f4ae-0e7d-3e0b617d1af6	1432	Zidani Most
00050000-5680-f4ae-283b-f6a70916fe38	3214	Zreče
00050000-5680-f4ae-d6c2-44f560ecfa07	4209	Žabnica
00050000-5680-f4ae-c48f-88be9bd66cb9	3310	Žalec
00050000-5680-f4ae-7df4-20c6f9db5893	4228	Železniki
00050000-5680-f4ae-96ee-87da4d73fe7d	2287	Žetale
00050000-5680-f4ae-332d-79a4965e013b	4226	Žiri
00050000-5680-f4ae-7cda-79441ee042a5	4274	Žirovnica
00050000-5680-f4ae-2308-68e8914482eb	8360	Žužemberk
\.


--
-- TOC entry 3175 (class 0 OID 33021290)
-- Dependencies: 240
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3148 (class 0 OID 33020854)
-- Dependencies: 213
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 3125 (class 0 OID 33020601)
-- Dependencies: 190
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5680-f4b1-714b-fd7099978c2c	00080000-5680-f4b1-1634-cf4b1a7deaf2	\N	00040000-5680-f4ae-5b6c-0934a40441de	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5680-f4b1-3ed9-712e994566bf	00080000-5680-f4b1-1634-cf4b1a7deaf2	\N	00040000-5680-f4ae-5b6c-0934a40441de	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5680-f4b1-e0b3-6b783fa6c2a3	00080000-5680-f4b1-aff9-86e981bdb0fc	\N	00040000-5680-f4ae-5b6c-0934a40441de	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 3137 (class 0 OID 33020746)
-- Dependencies: 202
-- Data for Name: praznik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY praznik (id, ime, dan, mesec, leto, delaprost) FROM stdin;
00430000-5680-f4ae-5443-95f92554a520	novo leto	1	1	\N	t
00430000-5680-f4ae-bcf1-580ee38b39ba	Prešernov dan, slovenski kulturni praznik	8	2	\N	t
00430000-5680-f4ae-e86b-5de15f86485c	dan upora proti okupatorju	27	4	\N	t
00430000-5680-f4ae-4a6b-0231ec928f3d	praznik dela	1	5	\N	t
00430000-5680-f4ae-0494-144563aa21cc	praznik dela	2	5	\N	t
00430000-5680-f4ae-eda0-7f5a6970da05	dan Primoža Trubarja	8	6	\N	f
00430000-5680-f4ae-9fe5-28ea71353d9b	dan državnosti	25	6	\N	t
00430000-5680-f4ae-b342-f551d782d993	združitev prekmurskih Slovencev z matičnim narodom	17	8	\N	f
00430000-5680-f4ae-d415-1bcbf5fd06f0	vrnitev Primorske k matični domovini	15	9	\N	f
00430000-5680-f4ae-a7fd-8d237571dbc8	dan suverenosti	25	10	\N	f
00430000-5680-f4ae-2ce4-8c12c8579baa	dan spomina na mrtve	1	11	\N	t
00430000-5680-f4ae-646d-777f39cd568e	dan Rudolfa Maistra	23	11	\N	f
00430000-5680-f4ae-3c77-6b73ba6638f5	božič	25	12	\N	t
00430000-5680-f4ae-c91a-90fc796452fb	dan samostojnosti in enotnosti	26	12	\N	t
00430000-5680-f4ae-c290-1f1b392fbbe7	Marijino vnebovzetje	15	8	\N	t
00430000-5680-f4ae-272c-53e92a2ff95f	dan reformacije	31	10	\N	t
00430000-5680-f4ae-8fa0-9160da04a5f3	velikonočna nedelja	27	3	2016	t
00430000-5680-f4ae-b0a3-9ab3ca9d4910	velikonočna nedelja	16	4	2017	t
00430000-5680-f4ae-071c-d5557b43dadb	velikonočna nedelja	1	4	2018	t
00430000-5680-f4ae-3db4-6320e07463eb	velikonočna nedelja	21	4	2019	t
00430000-5680-f4ae-184d-3a67cbecccf6	velikonočna nedelja	12	4	2020	t
00430000-5680-f4ae-85ae-e85b63cf33ed	velikonočna nedelja	4	4	2021	t
00430000-5680-f4ae-cfe9-f83733ebda95	velikonočna nedelja	17	4	2022	t
00430000-5680-f4ae-c826-425f558823f8	velikonočna nedelja	9	4	2023	t
00430000-5680-f4ae-9225-df667ae68b39	velikonočna nedelja	31	3	2024	t
00430000-5680-f4ae-11c8-a3759ea516fc	velikonočna nedelja	20	4	2025	t
00430000-5680-f4ae-4745-c5dd0bdfbc22	velikonočna nedelja	5	4	2026	t
00430000-5680-f4ae-8112-7d6a67da895e	velikonočna nedelja	28	3	2027	t
00430000-5680-f4ae-4bd7-a3c632793c6d	velikonočna nedelja	16	4	2028	t
00430000-5680-f4ae-9549-190647026c6e	velikonočna nedelja	1	4	2029	t
00430000-5680-f4ae-64f7-51557d65a6e7	velikonočna nedelja	21	4	2030	t
00430000-5680-f4ae-9683-8bd01b3e41de	velikonočni ponedeljek	28	3	2016	t
00430000-5680-f4ae-3067-da50e6f924aa	velikonočni ponedeljek	17	4	2017	t
00430000-5680-f4ae-f075-542a21ad4ba4	velikonočni ponedeljek	2	4	2018	t
00430000-5680-f4ae-2b7a-61f53ae3f776	velikonočni ponedeljek	22	4	2019	t
00430000-5680-f4ae-fd97-3b92c81dbf0c	velikonočni ponedeljek	13	4	2020	t
00430000-5680-f4ae-37bf-4b6d2461d589	velikonočni ponedeljek	5	4	2021	t
00430000-5680-f4ae-9c18-4a75b733248a	velikonočni ponedeljek	18	4	2022	t
00430000-5680-f4ae-abc2-d57c1a2c8085	velikonočni ponedeljek	10	4	2023	t
00430000-5680-f4ae-1d3a-354e1d8d2419	velikonočni ponedeljek	1	4	2024	t
00430000-5680-f4ae-1bd8-726a3b1ca2d6	velikonočni ponedeljek	21	4	2025	t
00430000-5680-f4ae-9325-342bf19d2ca0	velikonočni ponedeljek	6	4	2026	t
00430000-5680-f4ae-450f-d7cadda12d3b	velikonočni ponedeljek	29	3	2027	t
00430000-5680-f4ae-ad18-c31328f15f15	velikonočni ponedeljek	17	4	2028	t
00430000-5680-f4ae-fac7-6a6c20274ed7	velikonočni ponedeljek	2	4	2029	t
00430000-5680-f4ae-0402-6ed74ec911f1	velikonočni ponedeljek	22	4	2030	t
00430000-5680-f4ae-41a3-868419597334	binkoštna nedelja - binkošti	15	5	2016	t
00430000-5680-f4ae-f7b0-df61509c3695	binkoštna nedelja - binkošti	4	6	2017	t
00430000-5680-f4ae-543f-8a6972d1f620	binkoštna nedelja - binkošti	20	5	2018	t
00430000-5680-f4ae-123a-60cdd57e31bd	binkoštna nedelja - binkošti	9	6	2019	t
00430000-5680-f4ae-a635-c2588e2d6e06	binkoštna nedelja - binkošti	31	5	2020	t
00430000-5680-f4ae-7046-1f6bc378866f	binkoštna nedelja - binkošti	23	5	2021	t
00430000-5680-f4ae-4479-b14b7c195c2a	binkoštna nedelja - binkošti	5	6	2022	t
00430000-5680-f4ae-51e9-d55d22189d68	binkoštna nedelja - binkošti	28	5	2023	t
00430000-5680-f4ae-66c7-f7add2ab5bc6	binkoštna nedelja - binkošti	19	5	2024	t
00430000-5680-f4ae-ab1e-0ca6d718b6f1	binkoštna nedelja - binkošti	8	6	2025	t
00430000-5680-f4ae-db6d-6c98d5454d71	binkoštna nedelja - binkošti	24	5	2026	t
00430000-5680-f4ae-ea99-8f61c6fa9274	binkoštna nedelja - binkošti	16	5	2027	t
00430000-5680-f4ae-3118-dd7898722108	binkoštna nedelja - binkošti	4	6	2028	t
00430000-5680-f4ae-3fbf-028085100e02	binkoštna nedelja - binkošti	20	5	2029	t
00430000-5680-f4ae-61b8-f9d64526fe45	binkoštna nedelja - binkošti	9	6	2030	t
\.


--
-- TOC entry 3133 (class 0 OID 33020706)
-- Dependencies: 198
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, dezurni_id, zaporedna, zaporednasez, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3134 (class 0 OID 33020718)
-- Dependencies: 199
-- Data for Name: predstava_abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava_abonma (predstava_id, abonma_id) FROM stdin;
\.


--
-- TOC entry 3150 (class 0 OID 33020866)
-- Dependencies: 215
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3176 (class 0 OID 33021304)
-- Dependencies: 241
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3177 (class 0 OID 33021314)
-- Dependencies: 242
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5680-f4b1-9c53-26a5d2b9da43	00080000-5680-f4b1-ea65-629e77a81fb0	0987	AK
00190000-5680-f4b1-315f-3f8572f8246b	00080000-5680-f4b1-aff9-86e981bdb0fc	0989	AK
00190000-5680-f4b1-2c3b-8cad29893af2	00080000-5680-f4b1-44a2-2079ca84b0f4	0986	AK
00190000-5680-f4b1-494d-113eee11601e	00080000-5680-f4b1-8d6a-234343dc5856	0984	AK
00190000-5680-f4b1-a021-54114fae84c5	00080000-5680-f4b1-54a1-8706c44420f2	0983	AK
00190000-5680-f4b1-e477-b61079ea9d17	00080000-5680-f4b1-5a6f-1d3f66811c30	0982	AK
00190000-5680-f4b3-1b4c-a4442f63e745	00080000-5680-f4b3-1009-de8dde5761dd	1001	AK
\.


--
-- TOC entry 3174 (class 0 OID 33021203)
-- Dependencies: 239
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stpremiervelikih, stpremiermalih, stpremiermalihkopr, stpremiervelikihkopr, stpremiersredkopr, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremkoprzamejo, stizvponpremgost, stizvponpremkoprgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejkoprzamejo, stizvponprejgost, stizvponprejkoprgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponprejkopr, stobiskponprejkoprint, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremgostkopr, stobiskponprejgostkopr, stobiskponpremzamejo, stobiskponpremzamejokopr, stobiskponprejzamejokopr, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnihzun, sthonorarnihzunigr, sthonorarnihzunigrtujjz, sthonorarnihzunsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvavlozekgostiteljaprem, sredstvavlozekgostiteljaponprem, sredstvavlozekgostiteljaponprej, sredstvavlozekgostiteljagostujo, sredstvavlozekgostiteljaint, sredstvavlozekgostiteljafest, sredstvavlozekgostiteljarazno, sredstvavlozekgostiteljaizjem, sredstvalastnaprem, sredstvalastnaponprem, sredstvalastnaponprej, sredstvalastnagostujo, sredstvalastnaint, sredstvalastnafest, sredstvalastnarazno, sredstvalastnaizjem, sredstvaavtsamoz) FROM stdin;
00290000-5680-f4b1-8e74-0b436fedbdb4	0001	Testni program dela	2016-02-01	2017-02-01	f	f	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0.00	0	0.00	0.00	0.00	0.00	0	0	0	0	0.00	0.00	0.00	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0.00	0.00	0.00	\N	0	0	0	\N	\N	0.00	0	0	0	0	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00	0.00
\.


--
-- TOC entry 3178 (class 0 OID 33021322)
-- Dependencies: 243
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, stdogodkov, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3154 (class 0 OID 33020895)
-- Dependencies: 219
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5680-f4b0-3311-e7266ce837b9	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5680-f4b0-58e1-30f2b899dff1	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5680-f4b0-b4e9-88770ebf5e28	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5680-f4b0-0901-0b6a095b510f	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5680-f4b0-d610-40eac6e6716c	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5680-f4b0-503a-2bdb3df8b8d6	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5680-f4b0-dd94-1c8e8be04ebc	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 3146 (class 0 OID 33020839)
-- Dependencies: 211
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 3145 (class 0 OID 33020829)
-- Dependencies: 210
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3167 (class 0 OID 33021041)
-- Dependencies: 232
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3161 (class 0 OID 33020971)
-- Dependencies: 226
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 3131 (class 0 OID 33020680)
-- Dependencies: 196
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 3110 (class 0 OID 33020441)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5680-f4b3-1009-de8dde5761dd	00010000-5680-f4af-8958-0be857528a48	2015-12-28 09:37:07	INS	a:0:{}
2	App\\Entity\\Option	00000000-5680-f4b3-9c1f-addb6f5aa25e	00010000-5680-f4af-8958-0be857528a48	2015-12-28 09:37:07	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5680-f4b3-1b4c-a4442f63e745	00010000-5680-f4af-8958-0be857528a48	2015-12-28 09:37:07	INS	a:0:{}
\.


--
-- TOC entry 3199 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3155 (class 0 OID 33020908)
-- Dependencies: 220
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 3114 (class 0 OID 33020479)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5680-f4ae-c7bc-a067475f36cd	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5680-f4ae-f1d2-dbfcb9bc7a89	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5680-f4ae-148f-7f6957e24a9b	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5680-f4ae-0b48-a33cafb352fa	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5680-f4af-8d10-aac62f302513	mn-arhiv-arhivbesedil	omogoča akcije v meniju arhiv->arhivbesedil	t
00020000-5680-f4af-c04e-2fd25174667d	mn-arhiv-arhivbesedil-r	omogoča read akcije v meniju arhiv->arhivbesedil	t
00020000-5680-f4af-fa84-40e8f0e04ba2	mn-seznami-zaposleni	omogoča akcije v meniju Seznami->Zaposleni	t
00020000-5680-f4af-a7f1-6cbc23178a83	mn-seznami-zaposleni-r	omogoča read akcije v meniju Seznami->Zaposleni	t
00020000-5680-f4af-c0f7-e347fb091250	mn-seznami-osebe-splosno	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-f4af-a397-cb6e50dc4263	mn-seznami-osebe-splosno-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-f4af-a0c0-4b9bd16f2de1	mn-seznami-osebe-osebnipodatki	omogoča akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-f4af-5dff-72b1567a487a	mn-seznami-osebe-osebnipodatki-r	omogoča read akcije v meniju Seznami->Osebe->Splošno	t
00020000-5680-f4af-aa36-faf07030254d	mn-seznami-poslovnipartnerji	omogoča akcije v meniju Seznami->Poslovni partnerji	t
00020000-5680-f4af-8b45-fe8b1e27ee9d	mn-seznami-poslovnipartnerji-r	omogoča read akcije v meniju Seznami->Poslovni partnerji	t
00020000-5680-f4af-67ae-d771194345c4	mn-seznami-tipiposlovnihpartnerjev	omogoča akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5680-f4af-3775-6fe678d8b885	mn-seznami-tipiposlovnihpartnerjev-r	omogoča read akcije v meniju Seznami->Tipi poslovnih partnerjev	t
00020000-5680-f4af-55d6-08f1533e4f75	mn-seznami-posta	omogoča akcije v meniju Seznami->Pošta	t
00020000-5680-f4af-8b30-1bd6aeaec7fa	mn-seznami-posta-r	omogoča read akcije v meniju Seznami->Pošta	t
00020000-5680-f4af-16a4-a208262b8cf4	mn-seznami-drzave	omogoča akcije v meniju Seznami->Države	t
00020000-5680-f4af-4fc7-3c33c2f0b63f	mn-seznami-drzave-r	omogoča read akcije v meniju Seznami->Države	t
00020000-5680-f4af-63f4-9a943046e36d	mn-seznami-vrsteuprizoritev	omogoča akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5680-f4af-a82a-f91bd9bf4ea5	mn-seznami-vrsteuprizoritev-r	omogoča read akcije v meniju Seznami->Vrste uprizoritev	t
00020000-5680-f4af-6831-57b71aebef4e	mn-seznami-zvrstiposurs	omogoča akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5680-f4af-c4e8-02873f2ef1bb	mn-seznami-zvrstiposurs-r	omogoča read akcije v meniju Seznami->Zvrsti po SURS	t
00020000-5680-f4af-b2b4-e2cd9b19a480	mn-seznami-abonmaji	omogoča akcije v meniju Seznami->Abonmaji	t
00020000-5680-f4af-c63e-05efbeeebd71	mn-seznami-abonmaji-r	omogoča read akcije v meniju Seznami->Abonmaji	t
00020000-5680-f4af-fced-f3e927e40dcc	mn-seznami-prostori	omogoča akcije v meniju Seznami->Prostori	t
00020000-5680-f4af-5038-2bd80463879c	mn-seznami-prostori-r	omogoča read akcije v meniju Seznami->Prostori	t
00020000-5680-f4af-c558-c4ed1f68601a	mn-seznami-vrstestroska	omogoča akcije v meniju Seznami->Vrste stroška	t
00020000-5680-f4af-601e-b2d156bf4b3c	mn-seznami-vrstestroska-r	omogoča read akcije v meniju Seznami->Vrste stroška	t
00020000-5680-f4af-8496-f58a15576e76	mn-seznami-organizacijskeenote	omogoča akcije v meniju Seznami->Organizacijske enote	t
00020000-5680-f4af-300f-924665beff84	mn-seznami-organizacijskeenote-r	omogoča read akcije v meniju Seznami->Organizacijske enote	t
00020000-5680-f4af-216a-6983d08474fc	mn-seznami-tipvaje	omogoča akcije v meniju Seznami->Tip vaje	t
00020000-5680-f4af-7115-d4efee59604e	mn-seznami-tipvaje-r	omogoča read akcije v meniju Seznami->Tip vaje	t
00020000-5680-f4af-99cd-b3ffd3d3fdd8	mn-programdela	omogoča akcije v meniju Program dela	t
00020000-5680-f4af-550e-a8dadf58e35f	mn-programdela-r	omogoča read akcije v meniju Program dela	t
00020000-5680-f4af-b945-2989e09629eb	mn-produkcija-uprizoritve	omogoča akcije v meniju Produkcija->Uprizoritve	t
00020000-5680-f4af-cef7-86f54403d44d	mn-produkcija-uprizoritve-r	omogoča read akcije v meniju Produkcija->Uprizoritve	t
00020000-5680-f4af-6767-a86f6abda352	mn-produkcija-uprizoritve-ostali	omogoča akcije v meniju Produkcija->Uprizoritve->Ostali sodelujoči	t
00020000-5680-f4af-d3b2-94c14e531794	mn-produkcija-stroskovnik	omogoča akcije v meniju Produkcija->Stroškovnik	t
00020000-5680-f4af-3c45-135048732eab	mn-produkcija-stroskovnik-r	omogoča read akcije v meniju Produkcija->Stroškovnik	t
00020000-5680-f4af-7149-4f61bc230762	mn-produkcija-stroskovnik-splosno-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Splošno	t
00020000-5680-f4af-e2c6-3939215ae24d	mn-produkcija-stroskovnik-materialnistroski	omogoča akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5680-f4af-69dc-d0379e12991c	mn-produkcija-stroskovnik-materialnistroski-r	omogoča read akcije v meniju Produkcija->Stroškovnik->Materialni stroški	t
00020000-5680-f4af-ec60-a6ec82d91bdd	direktor	minimalne pravice za direktorja	t
00020000-5680-f4af-aacb-2bcc6ed1626b	arhivar	arhivar	t
00020000-5680-f4af-c3f4-829c483b8f61	dramaturg	dramaturg	t
00020000-5680-f4af-79f4-dacccd3997d6	pripravljalec-programa-dela	pripravljalec programa dela	t
00020000-5680-f4af-fe8d-b9bbff1d7542	poslovni-sekretar	poslovni sekretar	t
00020000-5680-f4af-d7b1-490c8827ea8e	vodja-tehnike	vodja tehnike	t
00020000-5680-f4af-d293-9e39aafc7ea0	racunovodja	računovodja	t
00020000-5680-f4b1-8a48-379ea81c5e40	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
00020000-5680-f4b1-591b-00c7a4f2f45c	ZapisLastnik-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-7555-fdab08fc2e07	ZapisLastnik-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-6ce2-668c7bc708f7	Uprizoritev-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-356c-012c4eafab8d	Uprizoritev-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-d905-203ae923fb5f	Mapa-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-069a-88e75ec34504	Mapa-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-81e4-b1e5d37d963d	Mapa-writeroot	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-51cd-74684f3b8713	Mapa-append	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-d80e-cd005a41ca17	MapaAcl-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-a341-c0357fac4b0b	MapaAcl-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-e75d-3e55ad72d5d3	Zapis-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-2d51-143085012361	Zapis-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-83f1-8052377ddb02	Oseba-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-ba01-fb84e5b82b17	Oseba-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-2f68-74c845f8905a	OsebniPodatki-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-3ea2-3ea68942e564	OsebniPodatki-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-2893-272a9d2daa62	Datoteka-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-7d55-5334c37a05f7	Datoteka-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-88dc-0a600155aa99	tajnicaXY	vloga se uporablja v predstavitvah avtorizacij	t
00020000-5680-f4b1-be88-b6b4f9f65c0e	Trr-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-5c75-15751a95cfd3	Trr-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-8628-1221d8e8459f	Stevilcenje-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-f1c5-0df9b59d84b7	Telefonska-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-febc-9f47ebad5b0b	Telefonska-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-eb8a-1820bfe55a66	PostniNaslov-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-c15d-7cd73de158bc	PostniNaslov-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-98e3-b48d0e97ff82	Zaposlitev-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-c9d7-d7516ff56109	Zaposlitev-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-405e-835ec75a0f42	Pogodba-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-f05a-2b4f62b71681	Pogodba-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-df25-017ee3afaf9c	StrosekUprizoritve-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-55ac-28c8cdc9da1c	StrosekUprizoritve-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-7d59-4ccb51a77d2b	Alternacija-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-d7b4-6ba4b98ba26a	Alternacija-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-1224-7e139f45aedb	Alternacija-vse	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-a911-ecce8f19dfdf	Funkcija-read	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-683e-8896dab51c9d	Funkcija-write	Vloga z 1 dovoljenjem	t
00020000-5680-f4b1-908b-40e0c4fd6b4a	Funkcija-vse	Vloga z 1 dovoljenjem	t
\.


--
-- TOC entry 3112 (class 0 OID 33020463)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5680-f4af-193c-dce156d12af8	00020000-5680-f4ae-148f-7f6957e24a9b
00010000-5680-f4af-8958-0be857528a48	00020000-5680-f4ae-148f-7f6957e24a9b
00010000-5680-f4b1-9f25-389927048563	00020000-5680-f4b1-8a48-379ea81c5e40
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-591b-00c7a4f2f45c
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-d905-203ae923fb5f
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-d80e-cd005a41ca17
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-e75d-3e55ad72d5d3
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-83f1-8052377ddb02
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-7d55-5334c37a05f7
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-6ce2-668c7bc708f7
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-be88-b6b4f9f65c0e
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-f1c5-0df9b59d84b7
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-eb8a-1820bfe55a66
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-98e3-b48d0e97ff82
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-405e-835ec75a0f42
00010000-5680-f4b1-eecf-fef8d3517678	00020000-5680-f4b1-7d59-4ccb51a77d2b
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-591b-00c7a4f2f45c
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-7555-fdab08fc2e07
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-6ce2-668c7bc708f7
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-356c-012c4eafab8d
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-83f1-8052377ddb02
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-3ea2-3ea68942e564
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-be88-b6b4f9f65c0e
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-f1c5-0df9b59d84b7
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-eb8a-1820bfe55a66
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-98e3-b48d0e97ff82
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-405e-835ec75a0f42
00010000-5680-f4b1-69ca-82052a3a566b	00020000-5680-f4b1-7d59-4ccb51a77d2b
00010000-5680-f4b1-874b-d296f91edd18	00020000-5680-f4b1-591b-00c7a4f2f45c
00010000-5680-f4b1-874b-d296f91edd18	00020000-5680-f4b1-7555-fdab08fc2e07
00010000-5680-f4b1-874b-d296f91edd18	00020000-5680-f4b1-6ce2-668c7bc708f7
00010000-5680-f4b1-874b-d296f91edd18	00020000-5680-f4b1-356c-012c4eafab8d
00010000-5680-f4b1-874b-d296f91edd18	00020000-5680-f4b1-e75d-3e55ad72d5d3
00010000-5680-f4b1-874b-d296f91edd18	00020000-5680-f4b1-83f1-8052377ddb02
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-7555-fdab08fc2e07
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-069a-88e75ec34504
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-a341-c0357fac4b0b
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-2d51-143085012361
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-e75d-3e55ad72d5d3
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-2893-272a9d2daa62
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-83f1-8052377ddb02
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-ba01-fb84e5b82b17
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-be88-b6b4f9f65c0e
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-5c75-15751a95cfd3
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-f1c5-0df9b59d84b7
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-febc-9f47ebad5b0b
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-eb8a-1820bfe55a66
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-c15d-7cd73de158bc
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-98e3-b48d0e97ff82
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-c9d7-d7516ff56109
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-405e-835ec75a0f42
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-f05a-2b4f62b71681
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-7d59-4ccb51a77d2b
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-d7b4-6ba4b98ba26a
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-a911-ecce8f19dfdf
00010000-5680-f4b1-3d0a-07dc81abd9f5	00020000-5680-f4b1-683e-8896dab51c9d
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-7555-fdab08fc2e07
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-069a-88e75ec34504
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-51cd-74684f3b8713
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-a341-c0357fac4b0b
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-2d51-143085012361
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-e75d-3e55ad72d5d3
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-2893-272a9d2daa62
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-83f1-8052377ddb02
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-ba01-fb84e5b82b17
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-2f68-74c845f8905a
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-be88-b6b4f9f65c0e
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-5c75-15751a95cfd3
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-8628-1221d8e8459f
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-f1c5-0df9b59d84b7
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-febc-9f47ebad5b0b
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-eb8a-1820bfe55a66
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-c15d-7cd73de158bc
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-98e3-b48d0e97ff82
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-c9d7-d7516ff56109
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-405e-835ec75a0f42
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-f05a-2b4f62b71681
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-7d59-4ccb51a77d2b
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-d7b4-6ba4b98ba26a
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-1224-7e139f45aedb
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-a911-ecce8f19dfdf
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-683e-8896dab51c9d
00010000-5680-f4b1-4cb9-f0782aa6bdbe	00020000-5680-f4b1-908b-40e0c4fd6b4a
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-7555-fdab08fc2e07
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-6ce2-668c7bc708f7
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-069a-88e75ec34504
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-81e4-b1e5d37d963d
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-51cd-74684f3b8713
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-d905-203ae923fb5f
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-a341-c0357fac4b0b
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-2d51-143085012361
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-e75d-3e55ad72d5d3
00010000-5680-f4b1-3553-2c63aa703f69	00020000-5680-f4b1-2893-272a9d2daa62
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-591b-00c7a4f2f45c
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-356c-012c4eafab8d
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-d905-203ae923fb5f
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-d80e-cd005a41ca17
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-e75d-3e55ad72d5d3
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-83f1-8052377ddb02
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-7d55-5334c37a05f7
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	00020000-5680-f4b1-df25-017ee3afaf9c
00010000-5680-f4b1-70e5-14f3c595e069	00020000-5680-f4b1-88dc-0a600155aa99
00010000-5680-f4b1-7119-d794d2b4290c	00020000-5680-f4af-ec60-a6ec82d91bdd
00010000-5680-f4b1-e625-0a0bf877aa9c	00020000-5680-f4af-aacb-2bcc6ed1626b
00010000-5680-f4b1-3261-5b201ec1697b	00020000-5680-f4af-c3f4-829c483b8f61
00010000-5680-f4b1-b50d-28a8bfc1a127	00020000-5680-f4af-79f4-dacccd3997d6
00010000-5680-f4b1-2b9e-1f7e39065ba2	00020000-5680-f4af-fe8d-b9bbff1d7542
00010000-5680-f4b1-40ec-89f3cb878706	00020000-5680-f4af-d7b1-490c8827ea8e
00010000-5680-f4b1-0707-496312f46f6b	00020000-5680-f4af-d293-9e39aafc7ea0
\.


--
-- TOC entry 3157 (class 0 OID 33020922)
-- Dependencies: 222
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3149 (class 0 OID 33020860)
-- Dependencies: 214
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 3143 (class 0 OID 33020806)
-- Dependencies: 208
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
001f0000-5680-f4b1-a2f0-c55523286da9	2015	Sezona 2015	2015-01-01	2015-12-31	t
001f0000-5680-f4b1-7f02-e2b9bdaee31b	2016	Sezona 2016	2016-01-01	2016-12-31	t
001f0000-5680-f4b1-1e76-5862d9a07759	2017	Sezona 2017	2017-01-01	2017-12-31	t
\.


--
-- TOC entry 3108 (class 0 OID 33020428)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5680-f4ae-cafa-85d3951dcee4	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5680-f4ae-9f52-0b032600b532	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5680-f4ae-f026-fc5706cb9bd5	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5680-f4ae-3795-f37955750b4e	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5680-f4ae-901e-40acafb9a798	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 3107 (class 0 OID 33020420)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5680-f4ae-29c9-946e32f320e6	00230000-5680-f4ae-3795-f37955750b4e	popa
00240000-5680-f4ae-97cb-2e29f6ca4f19	00230000-5680-f4ae-3795-f37955750b4e	oseba
00240000-5680-f4ae-30b6-18e72ba61286	00230000-5680-f4ae-3795-f37955750b4e	tippopa
00240000-5680-f4ae-7b90-08f86352d5f4	00230000-5680-f4ae-3795-f37955750b4e	organizacijskaenota
00240000-5680-f4ae-f588-54a307de28f6	00230000-5680-f4ae-3795-f37955750b4e	sezona
00240000-5680-f4ae-e2a6-19b23b24e5e2	00230000-5680-f4ae-3795-f37955750b4e	tipvaje
00240000-5680-f4ae-6a46-21c1819081a2	00230000-5680-f4ae-9f52-0b032600b532	prostor
00240000-5680-f4ae-15e4-509f6ba87936	00230000-5680-f4ae-3795-f37955750b4e	besedilo
00240000-5680-f4ae-83b2-bb2686533a8d	00230000-5680-f4ae-3795-f37955750b4e	uprizoritev
00240000-5680-f4ae-a289-7ce8429a048c	00230000-5680-f4ae-3795-f37955750b4e	funkcija
00240000-5680-f4ae-3ad1-9d78194c483f	00230000-5680-f4ae-3795-f37955750b4e	tipfunkcije
00240000-5680-f4ae-19fa-9b462e6fea68	00230000-5680-f4ae-3795-f37955750b4e	alternacija
00240000-5680-f4ae-2abb-2a4e7a528689	00230000-5680-f4ae-cafa-85d3951dcee4	pogodba
00240000-5680-f4ae-9cdf-96fc3e5b3475	00230000-5680-f4ae-3795-f37955750b4e	zaposlitev
00240000-5680-f4ae-f6e0-aa3e090499a3	00230000-5680-f4ae-3795-f37955750b4e	zvrstuprizoritve
00240000-5680-f4ae-13eb-3c494fb9e84d	00230000-5680-f4ae-cafa-85d3951dcee4	programdela
00240000-5680-f4ae-9cba-25ca0d8b6e15	00230000-5680-f4ae-3795-f37955750b4e	zapis
\.


--
-- TOC entry 3106 (class 0 OID 33020415)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
b73280c5-6de2-435f-9756-b061477e46e8	00240000-5680-f4ae-29c9-946e32f320e6	0	1001
\.


--
-- TOC entry 3163 (class 0 OID 33020988)
-- Dependencies: 228
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5680-f4b1-f1b8-b3374ddb5123	000e0000-5680-f4b1-800f-93cfbb032e5c	00080000-5680-f4b1-1634-cf4b1a7deaf2	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5680-f4ae-c370-2e486e93fff7
00270000-5680-f4b1-633f-91ef0740899b	000e0000-5680-f4b1-800f-93cfbb032e5c	00080000-5680-f4b1-1634-cf4b1a7deaf2	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5680-f4ae-c370-2e486e93fff7
\.


--
-- TOC entry 3122 (class 0 OID 33020563)
-- Dependencies: 187
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 3144 (class 0 OID 33020816)
-- Dependencies: 209
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja, dezurni, gost) FROM stdin;
001a0000-5680-f4b1-f08d-238b09a5de79	00180000-5680-f4b1-2f62-24ac723d85e9	000c0000-5680-f4b1-803f-276364beede1	00090000-5680-f4b1-8873-82910558ef76	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-f4b1-a43b-2ec284496cdd	00180000-5680-f4b1-2f62-24ac723d85e9	000c0000-5680-f4b1-4a1b-3bc895dd26cf	00090000-5680-f4b1-a061-a5a833344dfa	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-f4b1-1efc-4efa539b0a14	00180000-5680-f4b1-2f62-24ac723d85e9	000c0000-5680-f4b1-b68f-5ca9f8e37d51	00090000-5680-f4b1-5eb3-cccdf7ef445e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-f4b1-abd7-6964ec5efa2b	00180000-5680-f4b1-2f62-24ac723d85e9	000c0000-5680-f4b1-3af6-20cd37993ff2	00090000-5680-f4b1-80f2-cda52b0e6573	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-f4b1-b03a-9212dab305c9	00180000-5680-f4b1-2f62-24ac723d85e9	000c0000-5680-f4b1-9661-80cd7d5c0152	00090000-5680-f4b1-ba23-2b0a00b7981a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00	f	f
001a0000-5680-f4b1-3d26-1137f59ecc6b	00180000-5680-f4b1-da07-b614f66b5011	\N	00090000-5680-f4b1-ba23-2b0a00b7981a	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	t	f
001a0000-5680-f4b1-0295-b9a1218cf37c	00180000-5680-f4b1-da07-b614f66b5011	\N	00090000-5680-f4b1-a061-a5a833344dfa	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00	f	t
\.


--
-- TOC entry 3166 (class 0 OID 33021029)
-- Dependencies: 231
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5680-f4ae-dab2-864518c96ff8	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5680-f4ae-bf2e-656f7c08d12c	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5680-f4ae-eba0-f98fcc582133	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5680-f4ae-4209-cbb17540c6f6	04	Režija	Režija	Režija	umetnik	30
000f0000-5680-f4ae-9fcc-e2d057086fe2	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5680-f4ae-3b1c-6a0df20ff050	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5680-f4ae-8477-33d72cbedf4e	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5680-f4ae-f0f8-c64338dd39db	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5680-f4ae-d7de-695a05dcd2da	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5680-f4ae-862d-f16192541e29	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5680-f4ae-52e9-7b3847f282f7	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5680-f4ae-3f16-51cb6cfb09af	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5680-f4ae-4467-b9a548ff8432	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5680-f4ae-844c-07a7f98a6153	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5680-f4ae-18f3-abc081d7c629	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5680-f4ae-295d-730384af1de4	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5680-f4ae-3824-3db995f9f5d3	17	Tehnična in druga podpora	Tehnična in druga podpora	Tehnična in druga podpora	tehnik	180
000f0000-5680-f4ae-934f-488be8b75ce8	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3119 (class 0 OID 33020514)
-- Dependencies: 184
-- Data for Name: tippopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tippopa (id, sifra, ime, opis) FROM stdin;
00400000-5680-f4b1-dd6f-eb7d3c8989fe	0001	šola	osnovna ali srednja šola
00400000-5680-f4b1-ff11-8e99ee380b7f	0002	gledalec	gledalec, ki ima abonma ali podobno
00400000-5680-f4b1-eeef-64fe6b004ef6	0003	sponzor	sponzor dogodkov
\.


--
-- TOC entry 3179 (class 0 OID 33021334)
-- Dependencies: 244
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5680-f4ae-ce4c-b1915b94cc1d	01	Velika predstava	f	1.00	1.00
002b0000-5680-f4ae-88d8-b131e71bb260	02	Mala predstava	f	0.50	0.50
002b0000-5680-f4ae-3cf8-38ad385366d6	03	Mala koprodukcija	t	0.40	1.00
002b0000-5680-f4ae-cc9f-ff7185bd8bbf	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5680-f4ae-0cc3-710de94cec8d	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 3142 (class 0 OID 33020796)
-- Dependencies: 207
-- Data for Name: tipvaje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipvaje (id, sifra, ime, opis) FROM stdin;
00420000-5680-f4ae-fd69-5318789c7336	0001	prva vaja	prva vaja
00420000-5680-f4ae-74a6-72ded2f0e809	0002	tehnična vaja	tehnična vaja
00420000-5680-f4ae-ae37-0a302d6dfc6d	0003	lučna vaja	lučna vaja
00420000-5680-f4ae-f84c-c9a05ad26f27	0004	kostumska vaja	kostumska vaja
00420000-5680-f4ae-cf84-972a07c1a76a	0005	foto vaja	foto vaja
00420000-5680-f4ae-9bd1-37ec6e289659	0006	1. glavna vaja	1. glavna vaja
00420000-5680-f4ae-e393-f03aaf72ef3e	0007	2. glavna vaja	2. glavna vaja
00420000-5680-f4ae-4837-797f4e8df9f2	0008	1. generalka	1. generalka
00420000-5680-f4ae-9bc9-87a346303334	0009	2. generalka	2. generalka
00420000-5680-f4ae-fcd6-5da017786cf3	0010	odprta generalka	odprta generalka
00420000-5680-f4ae-a013-24d64f90e1b7	0011	obnovitvena vaja	obnovitvena vaja
00420000-5680-f4ae-f646-6d84f03a8700	0012	italijanka	krajša "obnovitvena" vaja
00420000-5680-f4ae-0e8d-dcfcf5967335	0013	pevska vaja	pevska vaja
00420000-5680-f4ae-42d0-8a1a44b562b4	0014	postavitev scene	postavitev scene (za pripravo vaje)
00420000-5680-f4ae-e0e5-e46d814e8b78	0015	postavitev luči	postavitev luči (za pripravo vaje)
\.


--
-- TOC entry 3128 (class 0 OID 33020636)
-- Dependencies: 193
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 3111 (class 0 OID 33020450)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5680-f4af-8958-0be857528a48	Konzolcni	$2y$05$NS4xMjkyMTcwMzExMjAxROvc46Xm5u1EcSS5SId3N43pW1KoxVstC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-cd22-6ac52b574d4f	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-fd75-f64cc4bb9e4e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-7666-068fb86c58a5	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-07cd-1058d597b949	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-a6d6-46c9fcf23d35	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-ae92-019ccf7f0330	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-8db7-b672d312e894	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-937d-b3d17982ad7b	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-f5de-31ca988abd0e	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-9f25-389927048563	vesna - testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-fb0d-428300d9132e	breznik, testni uporabnik ki nima dovoljenj	$2y$05$NS4xMjkyMTcwMzExMjAxROzIu.NvUwDI.QCLKJGUYHGvGaiRFmxfm	t	\N	\N	\N	breznik@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-eecf-fef8d3517678	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO5g4BU2nmIuhtRyuuRzShlpJXCQCmYSm	t	\N	\N	\N	rudi@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-69ca-82052a3a566b	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO1p6eyMpAOmevLTW.aMjlx7u12q27AtG	t	\N	\N	\N	cene@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-874b-d296f91edd18	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROzwN5meHCU6MfwcYPLI0/9GHLaAIjcVC	t	\N	\N	\N	dana@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-3d0a-07dc81abd9f5	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROMWdsuiMi738S/GzawGDCFbYhF4aWZYW	t	\N	\N	\N	vinko@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-4cb9-f0782aa6bdbe	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxROiVq9/lj1JXfRn3/t7cxwJnfOFwX0DHS	t	\N	\N	\N	vihra@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-3553-2c63aa703f69	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO7PStBNClDTe8sAVEZT1j2ls9PZ5E/4q	t	\N	\N	\N	vlado@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-faf6-f1a2a4cbdfd0	testni uporabnik za testiranje zapisov	$2y$05$NS4xMjkyMTcwMzExMjAxRO0eBsw9pwEi6rTx.MHCGnPrekjkcaY0a	t	\N	\N	\N	rikard@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-70e5-14f3c595e069	Denisa testna	$2y$05$NS4xMjkyMTcwMzExMjAxROk5Fa938M8q4.jiNXIp0k2omlhkdrsAW	t	\N	\N	\N	denisa@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-7119-d794d2b4290c	uporabnik z vlogo direktor	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	direktor@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-e625-0a0bf877aa9c	uporabnik z vlogo arhivar	$2y$05$NS4xMjkyMTcwMzExMjAxROm6gtZWeccWhH.b1RBlTfVR79mlSetS6	t	\N	\N	\N	arhivar@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-3261-5b201ec1697b	uporabnik z vlogo dramaturg	$2y$05$NS4xMjkyMTcwMzExMjAxROHtYWgd9Uotgyx5lmlptFS4rayrrdKr6	t	\N	\N	\N	dramaturg@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-b50d-28a8bfc1a127	uporabnik z vlogo pripravljalec-programa-dela	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	pripravljalec-programa-dela@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-2b9e-1f7e39065ba2	uporabnik z vlogo poslovni-sekretar	$2y$05$NS4xMjkyMTcwMzExMjAxROGbDNk2Ys8hWUxfrIbyrP9CmmR8pFs8C	t	\N	\N	\N	poslovni-sekretar@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-40ec-89f3cb878706	uporabnik z vlogo vodja-tehnike	$2y$05$NS4xMjkyMTcwMzExMjAxROxcaz.vUcDleELf5gNSdBC45UlcqyVYG	t	\N	\N	\N	vodja-tehnike@ifigenija.si	\N	\N	\N
00010000-5680-f4b1-0707-496312f46f6b	uporabnik z vlogo racunovodja	$2y$05$NS4xMjkyMTcwMzExMjAxROQXXI/3tOVmTr76tbVRS.WAbvHLvydQ.	t	\N	\N	\N	racunovodja@ifigenija.si	\N	\N	\N
00010000-5680-f4af-193c-dce156d12af8	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3170 (class 0 OID 33021079)
-- Dependencies: 235
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5680-f4b1-93b1-80a1bfe310d7	00160000-5680-f4b0-0487-bc52835a21f3	\N	00140000-5680-f4ae-1db8-fc8100ee89f0	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	William  Shakespeare - Nebojša  Kavader	f	2				\N	f	\N	\N		\N	00220000-5680-f4b0-d610-40eac6e6716c
000e0000-5680-f4b1-800f-93cfbb032e5c	00160000-5680-f4b0-5f9f-5bf785e82cdb	\N	00140000-5680-f4ae-8548-dd764ef86118	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	Berta   Hočevar	f	2				\N	f	\N	\N		\N	00220000-5680-f4b0-503a-2bdb3df8b8d6
000e0000-5680-f4b1-2d6f-35381af4582d	\N	\N	00140000-5680-f4ae-8548-dd764ef86118	00190000-5680-f4b1-9c53-26a5d2b9da43	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5680-f4b0-d610-40eac6e6716c
000e0000-5680-f4b1-f82c-62a7c83cb9ad	\N	\N	00140000-5680-f4ae-8548-dd764ef86118	00190000-5680-f4b1-9c53-26a5d2b9da43	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5680-f4b0-d610-40eac6e6716c
000e0000-5680-f4b1-8c28-e7f4d3bd9165	\N	\N	00140000-5680-f4ae-8548-dd764ef86118	00190000-5680-f4b1-9c53-26a5d2b9da43	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5680-f4b0-3311-e7266ce837b9
000e0000-5680-f4b1-903e-c58729e7952e	\N	\N	00140000-5680-f4ae-8548-dd764ef86118	00190000-5680-f4b1-9c53-26a5d2b9da43	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5680-f4b0-3311-e7266ce837b9
\.


--
-- TOC entry 3136 (class 0 OID 33020736)
-- Dependencies: 201
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, tipvaje_id, uprizoritev_id, zaporedna, porocilo) FROM stdin;
00200000-5680-f4b1-cbe2-c4d0d48fd62c	\N	000e0000-5680-f4b1-800f-93cfbb032e5c	1	
00200000-5680-f4b1-74ef-4dbf2566ee04	\N	000e0000-5680-f4b1-800f-93cfbb032e5c	2	
00200000-5680-f4b1-ee6a-8aa1ebd74958	\N	000e0000-5680-f4b1-800f-93cfbb032e5c	3	
00200000-5680-f4b1-29f8-91d42f475541	\N	000e0000-5680-f4b1-800f-93cfbb032e5c	4	
00200000-5680-f4b1-d0b0-4940a8c7d7aa	\N	000e0000-5680-f4b1-800f-93cfbb032e5c	5	
\.


--
-- TOC entry 3153 (class 0 OID 33020887)
-- Dependencies: 218
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3164 (class 0 OID 33021002)
-- Dependencies: 229
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5680-f4ae-4981-c13ebf760fbf	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5680-f4ae-b3b2-c9cb637cb7af	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5680-f4ae-5cc4-8539d16726e5	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5680-f4ae-5611-e81bc4e7c579	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5680-f4ae-3bd2-90d0388d9f78	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5680-f4ae-7921-8ae6f64438e3	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5680-f4ae-bdcb-e9f5c318956a	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5680-f4ae-d07f-063137a34724	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5680-f4ae-c370-2e486e93fff7	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5680-f4ae-6d33-f2a0ca40817f	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5680-f4ae-4560-932aa4e9e675	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5680-f4ae-0b1a-ea698e582870	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5680-f4ae-cccd-26956e064a68	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5680-f4ae-fdf2-251f3f539dc1	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5680-f4ae-90d0-d412c87adb28	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5680-f4ae-76f6-a02b28220f1d	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5680-f4ae-f38b-ff0ff8df67f4	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5680-f4ae-31d9-fcd30a91155f	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5680-f4ae-3124-ef4865b10d43	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5680-f4ae-bb5d-21dfc0925310	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5680-f4ae-301d-e0d0fd04376c	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5680-f4ae-2989-37018c368e4a	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5680-f4ae-7ed4-9b520e34d5d2	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5680-f4ae-b00b-e3a82c5a47ca	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5680-f4ae-2770-458ddf77d059	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5680-f4ae-949b-56d6fb8e6881	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5680-f4ae-ce86-47ba8a2015f3	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5680-f4ae-b91e-0f958083a36d	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3182 (class 0 OID 33021384)
-- Dependencies: 247
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3181 (class 0 OID 33021353)
-- Dependencies: 246
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, contributor, type, format, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3183 (class 0 OID 33021396)
-- Dependencies: 248
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3160 (class 0 OID 33020960)
-- Dependencies: 225
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci, organizacijskaenota_id) FROM stdin;
00100000-5680-f4b1-346e-39443f1da194	00090000-5680-f4b1-a061-a5a833344dfa	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-f4b1-2331-984d0cba51d5	00090000-5680-f4b1-5eb3-cccdf7ef445e	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-f4b1-132c-8c2f55f385f4	00090000-5680-f4b1-10e0-a1facf06e582	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-f4b1-2c9d-7185def9be81	00090000-5680-f4b1-fe03-b36351c22732	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-f4b1-c57d-286d956f21a7	00090000-5680-f4b1-1521-fcfd8cea9b0a	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t	\N
00100000-5680-f4b1-9569-3dfe3414f05e	00090000-5680-f4b1-5167-42667a734548	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t	\N
\.


--
-- TOC entry 3139 (class 0 OID 33020780)
-- Dependencies: 204
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3169 (class 0 OID 33021069)
-- Dependencies: 234
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5680-f4ae-1db8-fc8100ee89f0	01	Drama	drama (SURS 01)
00140000-5680-f4ae-11b4-166b62d33143	02	Opera	opera (SURS 02)
00140000-5680-f4ae-d4b3-c081413cf022	03	Balet	balet (SURS 03)
00140000-5680-f4ae-cf4e-6a14b7818c63	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5680-f4ae-7346-43e21a022f45	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5680-f4ae-8548-dd764ef86118	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5680-f4ae-3616-71d409ef7b01	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3159 (class 0 OID 33020950)
-- Dependencies: 224
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2601 (class 2606 OID 33020513)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2820 (class 2606 OID 33021128)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2816 (class 2606 OID 33021118)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 33020504)
-- Name: authstorage_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY authstorage
    ADD CONSTRAINT authstorage_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 33020985)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 33021027)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 33021437)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 33020768)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2699 (class 2606 OID 33020790)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 33020795)
-- Name: dogodektehnicni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodektehnicni
    ADD CONSTRAINT dogodektehnicni_pkey PRIMARY KEY (id);


--
-- TOC entry 2853 (class 2606 OID 33021351)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 33020662)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2827 (class 2606 OID 33021197)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2763 (class 2606 OID 33020946)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2674 (class 2606 OID 33020734)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2663 (class 2606 OID 33020701)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2654 (class 2606 OID 33020676)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2727 (class 2606 OID 33020852)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2871 (class 2606 OID 33021414)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 33021421)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2882 (class 2606 OID 33021445)
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
-- TOC entry 2739 (class 2606 OID 33020879)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 33020634)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 33020532)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 33020596)
-- Name: organizacijskaenota_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT organizacijskaenota_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 33020559)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 33020493)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2590 (class 2606 OID 33020478)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 33020885)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 33020921)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2802 (class 2606 OID 33021064)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 33020587)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2636 (class 2606 OID 33020622)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2837 (class 2606 OID 33021302)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 33020858)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2634 (class 2606 OID 33020612)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 33020753)
-- Name: praznik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY praznik
    ADD CONSTRAINT praznik_pkey PRIMARY KEY (id);


--
-- TOC entry 2672 (class 2606 OID 33020722)
-- Name: predstava_abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT predstava_abonma_pkey PRIMARY KEY (predstava_id, abonma_id);


--
-- TOC entry 2668 (class 2606 OID 33020714)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2737 (class 2606 OID 33020870)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2841 (class 2606 OID 33021311)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2843 (class 2606 OID 33021319)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2834 (class 2606 OID 33021289)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2848 (class 2606 OID 33021332)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2749 (class 2606 OID 33020903)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2725 (class 2606 OID 33020843)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 33020834)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2797 (class 2606 OID 33021051)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 33020978)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 33020689)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2582 (class 2606 OID 33020449)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2754 (class 2606 OID 33020912)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2588 (class 2606 OID 33020467)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2592 (class 2606 OID 33020487)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 33020930)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 33020865)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2707 (class 2606 OID 33020814)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 33020437)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2576 (class 2606 OID 33020425)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 33020419)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 33020998)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2618 (class 2606 OID 33020568)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 33020825)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 33021038)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 33020521)
-- Name: tippopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tippopa
    ADD CONSTRAINT tippopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2850 (class 2606 OID 33021344)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 33020803)
-- Name: tipvaje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipvaje
    ADD CONSTRAINT tipvaje_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 33020647)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2584 (class 2606 OID 33020462)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2814 (class 2606 OID 33021097)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2679 (class 2606 OID 33020743)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2745 (class 2606 OID 33020893)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 33021010)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2864 (class 2606 OID 33021394)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2861 (class 2606 OID 33021378)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2867 (class 2606 OID 33021402)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 33020968)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 33020784)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2806 (class 2606 OID 33021077)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 33020958)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2684 (class 1259 OID 33020778)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2685 (class 1259 OID 33020779)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2686 (class 1259 OID 33020777)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2687 (class 1259 OID 33020776)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2688 (class 1259 OID 33020775)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2782 (class 1259 OID 33020999)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2783 (class 1259 OID 33021000)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2784 (class 1259 OID 33021001)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2868 (class 1259 OID 33021416)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2869 (class 1259 OID 33021415)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2619 (class 1259 OID 33020589)
-- Name: idx_1c7adba589552cb2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba589552cb2 ON popa USING btree (tipkli_id);


--
-- TOC entry 2620 (class 1259 OID 33020590)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2740 (class 1259 OID 33020886)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2855 (class 1259 OID 33021382)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2856 (class 1259 OID 33021381)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2857 (class 1259 OID 33021383)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2858 (class 1259 OID 33021380)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2859 (class 1259 OID 33021379)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2734 (class 1259 OID 33020872)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2735 (class 1259 OID 33020871)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2676 (class 1259 OID 33020744)
-- Name: idx_2390fc964ad2a6ea; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc964ad2a6ea ON vaja USING btree (tipvaje_id);


--
-- TOC entry 2677 (class 1259 OID 33020745)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2764 (class 1259 OID 33020947)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2765 (class 1259 OID 33020949)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2766 (class 1259 OID 33020948)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2651 (class 1259 OID 33020678)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 33020677)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2846 (class 1259 OID 33021333)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2798 (class 1259 OID 33021066)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2799 (class 1259 OID 33021067)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2800 (class 1259 OID 33021068)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2865 (class 1259 OID 33021403)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2807 (class 1259 OID 33021102)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2808 (class 1259 OID 33021099)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2809 (class 1259 OID 33021103)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2810 (class 1259 OID 33021101)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2811 (class 1259 OID 33021100)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2641 (class 1259 OID 33020649)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2642 (class 1259 OID 33020648)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2610 (class 1259 OID 33020562)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2752 (class 1259 OID 33020913)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2594 (class 1259 OID 33020494)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2595 (class 1259 OID 33020495)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2757 (class 1259 OID 33020933)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2758 (class 1259 OID 33020932)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2759 (class 1259 OID 33020931)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2624 (class 1259 OID 33020599)
-- Name: idx_5e2fdc29289ed596; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29289ed596 ON organizacijskaenota USING btree (vodja_id);


--
-- TOC entry 2625 (class 1259 OID 33020598)
-- Name: idx_5e2fdc29727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29727aca70 ON organizacijskaenota USING btree (parent_id);


--
-- TOC entry 2626 (class 1259 OID 33020600)
-- Name: idx_5e2fdc29f0020ed7; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_5e2fdc29f0020ed7 ON organizacijskaenota USING btree (namestnik_id);


--
-- TOC entry 2664 (class 1259 OID 33020717)
-- Name: idx_602f6e461174bb0e; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e461174bb0e ON predstava USING btree (dezurni_id);


--
-- TOC entry 2665 (class 1259 OID 33020715)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2666 (class 1259 OID 33020716)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2574 (class 1259 OID 33020427)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2714 (class 1259 OID 33020838)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2715 (class 1259 OID 33020836)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2716 (class 1259 OID 33020835)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2717 (class 1259 OID 33020837)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2585 (class 1259 OID 33020468)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2586 (class 1259 OID 33020469)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2743 (class 1259 OID 33020894)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2878 (class 1259 OID 33021438)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2780 (class 1259 OID 33020987)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2781 (class 1259 OID 33020986)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2879 (class 1259 OID 33021446)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2880 (class 1259 OID 33021447)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2729 (class 1259 OID 33020859)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2774 (class 1259 OID 33020979)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2775 (class 1259 OID 33020980)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2828 (class 1259 OID 33021202)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2829 (class 1259 OID 33021201)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2830 (class 1259 OID 33021198)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2831 (class 1259 OID 33021199)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2832 (class 1259 OID 33021200)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2630 (class 1259 OID 33020614)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2631 (class 1259 OID 33020613)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2632 (class 1259 OID 33020615)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2746 (class 1259 OID 33020907)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2747 (class 1259 OID 33020906)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2838 (class 1259 OID 33021312)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2839 (class 1259 OID 33021313)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2821 (class 1259 OID 33021132)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2822 (class 1259 OID 33021133)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2823 (class 1259 OID 33021130)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2824 (class 1259 OID 33021131)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2770 (class 1259 OID 33020969)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2771 (class 1259 OID 33020970)
-- Name: idx_b24490415f1e9d88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b24490415f1e9d88 ON zaposlitev USING btree (organizacijskaenota_id);


--
-- TOC entry 2720 (class 1259 OID 33020847)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2721 (class 1259 OID 33020846)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 33020844)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2723 (class 1259 OID 33020845)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2817 (class 1259 OID 33021120)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2818 (class 1259 OID 33021119)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2655 (class 1259 OID 33020690)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2658 (class 1259 OID 33020704)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2659 (class 1259 OID 33020703)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2660 (class 1259 OID 33020702)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2661 (class 1259 OID 33020705)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2675 (class 1259 OID 33020735)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2669 (class 1259 OID 33020723)
-- Name: idx_d9ece16b5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16b5ac894aa ON predstava_abonma USING btree (predstava_id);


--
-- TOC entry 2670 (class 1259 OID 33020724)
-- Name: idx_d9ece16bbe74b11; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_d9ece16bbe74b11 ON predstava_abonma USING btree (abonma_id);


--
-- TOC entry 2835 (class 1259 OID 33021303)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2854 (class 1259 OID 33021352)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2872 (class 1259 OID 33021422)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2873 (class 1259 OID 33021423)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2606 (class 1259 OID 33020534)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2607 (class 1259 OID 33020533)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2615 (class 1259 OID 33020569)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2616 (class 1259 OID 33020570)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2695 (class 1259 OID 33020785)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2709 (class 1259 OID 33020828)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2710 (class 1259 OID 33020827)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2711 (class 1259 OID 33020826)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2689 (class 1259 OID 33020770)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2690 (class 1259 OID 33020771)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2691 (class 1259 OID 33020774)
-- Name: uniq_11e93b5d590ad7d9; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d590ad7d9 ON dogodek USING btree (tehnicni_id);


--
-- TOC entry 2692 (class 1259 OID 33020769)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2693 (class 1259 OID 33020773)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2694 (class 1259 OID 33020772)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2623 (class 1259 OID 33020588)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2604 (class 1259 OID 33020522)
-- Name: uniq_1d30700559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d30700559828a3 ON tippopa USING btree (sifra);


--
-- TOC entry 2605 (class 1259 OID 33020523)
-- Name: uniq_1d3070055cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1d3070055cca980 ON tippopa USING btree (ime);


--
-- TOC entry 2647 (class 1259 OID 33020663)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2648 (class 1259 OID 33020665)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2649 (class 1259 OID 33020664)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2650 (class 1259 OID 33020666)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2728 (class 1259 OID 33020853)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2803 (class 1259 OID 33021065)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2812 (class 1259 OID 33021098)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2794 (class 1259 OID 33021039)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2795 (class 1259 OID 33021040)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2613 (class 1259 OID 33020560)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2614 (class 1259 OID 33020561)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2767 (class 1259 OID 33020959)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2580 (class 1259 OID 33020438)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2640 (class 1259 OID 33020635)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2629 (class 1259 OID 33020597)
-- Name: uniq_5e2fdc29559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5e2fdc29559828a3 ON organizacijskaenota USING btree (sifra);


--
-- TOC entry 2577 (class 1259 OID 33020426)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2851 (class 1259 OID 33021345)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2750 (class 1259 OID 33020905)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2751 (class 1259 OID 33020904)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2704 (class 1259 OID 33020804)
-- Name: uniq_99664b14559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b14559828a3 ON tipvaje USING btree (sifra);


--
-- TOC entry 2705 (class 1259 OID 33020805)
-- Name: uniq_99664b1455cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_99664b1455cca980 ON tipvaje USING btree (ime);


--
-- TOC entry 2825 (class 1259 OID 33021129)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2637 (class 1259 OID 33020623)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2804 (class 1259 OID 33021078)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2862 (class 1259 OID 33021395)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2844 (class 1259 OID 33021320)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2845 (class 1259 OID 33021321)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2791 (class 1259 OID 33021028)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2708 (class 1259 OID 33020815)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2593 (class 1259 OID 33020488)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2922 (class 2606 OID 33021618)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2921 (class 2606 OID 33021623)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2916 (class 2606 OID 33021648)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2918 (class 2606 OID 33021638)
-- Name: fk_11e93b5d590ad7d9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d590ad7d9 FOREIGN KEY (tehnicni_id) REFERENCES dogodektehnicni(id);


--
-- TOC entry 2923 (class 2606 OID 33021613)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2919 (class 2606 OID 33021633)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2917 (class 2606 OID 33021643)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2920 (class 2606 OID 33021628)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2959 (class 2606 OID 33021818)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2958 (class 2606 OID 33021823)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2957 (class 2606 OID 33021828)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2991 (class 2606 OID 33021993)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2992 (class 2606 OID 33021988)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2895 (class 2606 OID 33021503)
-- Name: fk_1c7adba589552cb2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba589552cb2 FOREIGN KEY (tipkli_id) REFERENCES tippopa(id);


--
-- TOC entry 2894 (class 2606 OID 33021508)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2940 (class 2606 OID 33021733)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2986 (class 2606 OID 33021973)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2987 (class 2606 OID 33021968)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2985 (class 2606 OID 33021978)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2988 (class 2606 OID 33021963)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2989 (class 2606 OID 33021958)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2938 (class 2606 OID 33021728)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2939 (class 2606 OID 33021723)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2915 (class 2606 OID 33021603)
-- Name: fk_2390fc964ad2a6ea; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc964ad2a6ea FOREIGN KEY (tipvaje_id) REFERENCES tipvaje(id);


--
-- TOC entry 2914 (class 2606 OID 33021608)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2950 (class 2606 OID 33021773)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2948 (class 2606 OID 33021783)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2949 (class 2606 OID 33021778)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2904 (class 2606 OID 33021558)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2905 (class 2606 OID 33021553)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2936 (class 2606 OID 33021713)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2983 (class 2606 OID 33021948)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2962 (class 2606 OID 33021833)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2961 (class 2606 OID 33021838)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2960 (class 2606 OID 33021843)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2990 (class 2606 OID 33021983)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2964 (class 2606 OID 33021863)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2967 (class 2606 OID 33021848)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2963 (class 2606 OID 33021868)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2965 (class 2606 OID 33021858)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2966 (class 2606 OID 33021853)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2902 (class 2606 OID 33021548)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2903 (class 2606 OID 33021543)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2890 (class 2606 OID 33021488)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2891 (class 2606 OID 33021483)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2944 (class 2606 OID 33021753)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2887 (class 2606 OID 33021463)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2886 (class 2606 OID 33021468)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2945 (class 2606 OID 33021768)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2946 (class 2606 OID 33021763)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2947 (class 2606 OID 33021758)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2897 (class 2606 OID 33021518)
-- Name: fk_5e2fdc29289ed596; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29289ed596 FOREIGN KEY (vodja_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2898 (class 2606 OID 33021513)
-- Name: fk_5e2fdc29727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29727aca70 FOREIGN KEY (parent_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2896 (class 2606 OID 33021523)
-- Name: fk_5e2fdc29f0020ed7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizacijskaenota
    ADD CONSTRAINT fk_5e2fdc29f0020ed7 FOREIGN KEY (namestnik_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2908 (class 2606 OID 33021583)
-- Name: fk_602f6e461174bb0e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e461174bb0e FOREIGN KEY (dezurni_id) REFERENCES oseba(id);


--
-- TOC entry 2910 (class 2606 OID 33021573)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2909 (class 2606 OID 33021578)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2883 (class 2606 OID 33021448)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2928 (class 2606 OID 33021688)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2930 (class 2606 OID 33021678)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2931 (class 2606 OID 33021673)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2929 (class 2606 OID 33021683)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2885 (class 2606 OID 33021453)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2884 (class 2606 OID 33021458)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2941 (class 2606 OID 33021738)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2995 (class 2606 OID 33022008)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2955 (class 2606 OID 33021813)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2956 (class 2606 OID 33021808)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2997 (class 2606 OID 33022013)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2996 (class 2606 OID 33022018)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2937 (class 2606 OID 33021718)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2954 (class 2606 OID 33021798)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2953 (class 2606 OID 33021803)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2974 (class 2606 OID 33021923)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2975 (class 2606 OID 33021918)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2978 (class 2606 OID 33021903)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2977 (class 2606 OID 33021908)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2976 (class 2606 OID 33021913)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2900 (class 2606 OID 33021533)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2901 (class 2606 OID 33021528)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2899 (class 2606 OID 33021538)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2942 (class 2606 OID 33021748)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2943 (class 2606 OID 33021743)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2981 (class 2606 OID 33021933)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2980 (class 2606 OID 33021938)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2971 (class 2606 OID 33021893)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2970 (class 2606 OID 33021898)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2973 (class 2606 OID 33021883)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2972 (class 2606 OID 33021888)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2952 (class 2606 OID 33021788)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2951 (class 2606 OID 33021793)
-- Name: fk_b24490415f1e9d88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b24490415f1e9d88 FOREIGN KEY (organizacijskaenota_id) REFERENCES organizacijskaenota(id);


--
-- TOC entry 2932 (class 2606 OID 33021708)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2933 (class 2606 OID 33021703)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2935 (class 2606 OID 33021693)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2934 (class 2606 OID 33021698)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2968 (class 2606 OID 33021878)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2969 (class 2606 OID 33021873)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2906 (class 2606 OID 33021563)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2907 (class 2606 OID 33021568)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2913 (class 2606 OID 33021598)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2912 (class 2606 OID 33021588)
-- Name: fk_d9ece16b5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16b5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id) ON DELETE CASCADE;


--
-- TOC entry 2911 (class 2606 OID 33021593)
-- Name: fk_d9ece16bbe74b11; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava_abonma
    ADD CONSTRAINT fk_d9ece16bbe74b11 FOREIGN KEY (abonma_id) REFERENCES abonma(id) ON DELETE CASCADE;


--
-- TOC entry 2979 (class 2606 OID 33021928)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2982 (class 2606 OID 33021943)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2984 (class 2606 OID 33021953)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2994 (class 2606 OID 33021998)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2993 (class 2606 OID 33022003)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2888 (class 2606 OID 33021478)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2889 (class 2606 OID 33021473)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2893 (class 2606 OID 33021493)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2892 (class 2606 OID 33021498)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2924 (class 2606 OID 33021653)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2925 (class 2606 OID 33021668)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2926 (class 2606 OID 33021663)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2927 (class 2606 OID 33021658)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-12-28 09:37:09 CET

--
-- PostgreSQL database dump complete
--

