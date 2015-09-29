--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-29 15:17:48 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 245 (class 3079 OID 11789)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 21054675)
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
-- TOC entry 229 (class 1259 OID 21055232)
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
-- TOC entry 228 (class 1259 OID 21055215)
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
-- TOC entry 219 (class 1259 OID 21055092)
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
-- TOC entry 222 (class 1259 OID 21055122)
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
-- TOC entry 243 (class 1259 OID 21055474)
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
-- TOC entry 197 (class 1259 OID 21054883)
-- Name: dogodek; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodek (
    id uuid NOT NULL,
    predstava_id uuid,
    zasedenost_id uuid,
    vaja_id uuid,
    gostovanje_id uuid,
    dogodek_splosni_id uuid,
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
-- TOC entry 199 (class 1259 OID 21054914)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 21055400)
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
-- TOC entry 190 (class 1259 OID 21054796)
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
-- TOC entry 230 (class 1259 OID 21055245)
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
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
    obiskdoma integer DEFAULT 0 NOT NULL,
    obiskkopr integer DEFAULT 0 NOT NULL,
    obiskgost integer DEFAULT 0 NOT NULL,
    obiskzamejo integer DEFAULT 0 NOT NULL,
    obiskint integer DEFAULT 0 NOT NULL,
    obiskkoprint integer DEFAULT 0 NOT NULL,
    ponovidoma integer DEFAULT 0 NOT NULL,
    ponovikopr integer DEFAULT 0 NOT NULL,
    ponovizamejo integer DEFAULT 0 NOT NULL,
    ponovigost integer DEFAULT 0 NOT NULL,
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
    strosekodkpred numeric(15,2) DEFAULT 0::numeric,
    stroskiostali numeric(15,2) DEFAULT 0::numeric,
    krajgostovanja character varying(255) DEFAULT NULL::character varying,
    ustanova character varying(255) DEFAULT NULL::character varying,
    datumgostovanja date,
    transportnistroski numeric(15,2) DEFAULT NULL::numeric,
    dnevprvzad numeric(15,2) DEFAULT NULL::numeric,
    drzavagostovanja_id uuid,
    stpe integer DEFAULT 0,
    zvrst character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 215 (class 1259 OID 21055047)
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
-- TOC entry 195 (class 1259 OID 21054862)
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
-- TOC entry 193 (class 1259 OID 21054836)
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
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 21054813)
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
-- TOC entry 204 (class 1259 OID 21054961)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 21055455)
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
-- TOC entry 242 (class 1259 OID 21055467)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 21055489)
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
-- TOC entry 170 (class 1259 OID 20579799)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 21054986)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 21054770)
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
-- TOC entry 182 (class 1259 OID 21054684)
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
-- TOC entry 183 (class 1259 OID 21054695)
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
-- TOC entry 178 (class 1259 OID 21054649)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 21054668)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 21054993)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 21055027)
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
-- TOC entry 225 (class 1259 OID 21055163)
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
-- TOC entry 185 (class 1259 OID 21054728)
-- Name: popa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE popa (
    id uuid NOT NULL,
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
-- TOC entry 187 (class 1259 OID 21054762)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 21055345)
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
-- TOC entry 205 (class 1259 OID 21054967)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 21054747)
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
-- TOC entry 194 (class 1259 OID 21054851)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    objavljenzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 21054979)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 21055359)
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
-- TOC entry 234 (class 1259 OID 21055369)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 21055302)
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
    stizvnekomerc integer,
    stizvprem integer,
    stizvpremdoma integer,
    stizvpremkopr integer,
    stizvponprem integer,
    stizvponpremdoma integer,
    stizvponpremzamejo integer,
    stizvponpremgost integer,
    stizvponpremkopr integer,
    stizvponpremint integer,
    stizvponpremkoprint integer,
    stizvponprej integer,
    stizvponprejdoma integer,
    stizvponprejzamejo integer,
    stizvponprejgost integer,
    stizvponprejkopr integer,
    stizvponprejint integer,
    stizvponprejkoprint integer,
    stizvgostuj integer,
    stizvostalihnek integer,
    stizvgostovanjslo integer,
    stizvgostovanjzam integer,
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
    sthonorarnih integer,
    sthonorarnihigr integer,
    sthonorarnihigrtujjz integer,
    sthonorarnihigrsamoz integer,
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
    sredstvaavtsamoz numeric(12,2) DEFAULT NULL::numeric
);


--
-- TOC entry 235 (class 1259 OID 21055377)
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
-- TOC entry 211 (class 1259 OID 21055008)
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
-- TOC entry 203 (class 1259 OID 21054952)
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
-- TOC entry 202 (class 1259 OID 21054942)
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
-- TOC entry 224 (class 1259 OID 21055152)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 21055082)
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
-- TOC entry 192 (class 1259 OID 21054825)
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
-- TOC entry 175 (class 1259 OID 21054620)
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
-- TOC entry 174 (class 1259 OID 21054618)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 21055021)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 21054658)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 21054642)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 21055035)
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
-- TOC entry 206 (class 1259 OID 21054973)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 21054919)
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
-- TOC entry 173 (class 1259 OID 21054607)
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
-- TOC entry 172 (class 1259 OID 21054599)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 21054594)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 21055099)
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
-- TOC entry 184 (class 1259 OID 21054720)
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
-- TOC entry 201 (class 1259 OID 21054929)
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
    planiranotraja numeric(15,2) DEFAULT NULL::numeric
);


--
-- TOC entry 223 (class 1259 OID 21055140)
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
-- TOC entry 236 (class 1259 OID 21055388)
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
-- TOC entry 189 (class 1259 OID 21054782)
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
-- TOC entry 176 (class 1259 OID 21054629)
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
-- TOC entry 227 (class 1259 OID 21055190)
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
-- TOC entry 196 (class 1259 OID 21054873)
-- Name: vaja; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE vaja (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    vrsta character varying(255) DEFAULT NULL::character varying,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 210 (class 1259 OID 21055000)
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
-- TOC entry 221 (class 1259 OID 21055113)
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
-- TOC entry 239 (class 1259 OID 21055435)
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
-- TOC entry 238 (class 1259 OID 21055407)
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
-- TOC entry 240 (class 1259 OID 21055447)
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
-- TOC entry 217 (class 1259 OID 21055072)
-- Name: zaposlitev; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zaposlitev (
    id uuid NOT NULL,
    oseba_id uuid,
    sifra character varying(10) NOT NULL,
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
    jenastopajoci boolean
);


--
-- TOC entry 198 (class 1259 OID 21054908)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 21055180)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 21055062)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 21054623)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 21054675)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 21055232)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-560a-8f79-bde8-ca29841ea74e	000d0000-560a-8f79-077f-ff8a8105a365	\N	00090000-560a-8f79-6cf4-2f0fb9cb99a6	000b0000-560a-8f79-73d0-5b3f49dbc0b4	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-560a-8f79-6bd4-1a2d6530e756	000d0000-560a-8f79-94fb-3b5a7abe0f2a	00100000-560a-8f79-e168-e49dcdf0e73b	00090000-560a-8f79-75e3-02ef29b01a52	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-560a-8f79-b77d-d96eb2584b06	000d0000-560a-8f79-0bc6-d465fcd63a29	00100000-560a-8f79-2395-e5bc13c7b5a2	00090000-560a-8f79-9e97-25f8a8e4fbde	\N	0003	t	\N	2015-09-29	\N	2	t	\N	f	f
000c0000-560a-8f79-5622-c81e205b6dd9	000d0000-560a-8f79-ed89-0e1d7656ff34	\N	00090000-560a-8f79-fef3-7d39b37220e3	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-560a-8f79-54f8-de88639c9ad0	000d0000-560a-8f79-d2f0-902236252202	\N	00090000-560a-8f79-34d5-9b20185af4ba	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-560a-8f79-8d00-1ca67f2be10a	000d0000-560a-8f79-cf0d-d858aaa5625c	\N	00090000-560a-8f79-8f45-8b80ac65731e	000b0000-560a-8f79-58d7-5bc70f01743e	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-560a-8f79-17c5-edaea5d5d358	000d0000-560a-8f79-d114-5a0231cfaedc	00100000-560a-8f79-bff3-e5eee0ef23ed	00090000-560a-8f79-143f-057c26d90306	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-560a-8f79-86a7-bb90f112aec9	000d0000-560a-8f79-b7ec-a52915e3ff11	\N	00090000-560a-8f79-e2a6-bbf6936a613a	000b0000-560a-8f79-ad52-917972be971c	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-560a-8f79-4453-dc5f70fbd651	000d0000-560a-8f79-d114-5a0231cfaedc	00100000-560a-8f79-ca7e-6fbedca29762	00090000-560a-8f79-abd6-26d309a7aefb	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-560a-8f79-70cd-1224ab77c0fb	000d0000-560a-8f79-d114-5a0231cfaedc	00100000-560a-8f79-9233-188e80f26501	00090000-560a-8f79-8da0-2371c8b02c5e	\N	0010	t	\N	2015-09-29	\N	16	f	\N	f	t
000c0000-560a-8f79-072f-ae7e3ff07e3f	000d0000-560a-8f79-d114-5a0231cfaedc	00100000-560a-8f79-f224-d9c4f2128a20	00090000-560a-8f79-a0c0-1ff5c8f7abc1	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-560a-8f79-2b1c-8d7b440964ec	000d0000-560a-8f79-4f3a-23b5966442c9	\N	00090000-560a-8f79-75e3-02ef29b01a52	000b0000-560a-8f79-311a-8a10926a0910	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 21055215)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 21055092)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-560a-8f79-4afe-336a4326d951	00160000-560a-8f79-2fcf-add493651676	00090000-560a-8f79-0c13-246298ebb8b5	aizv	10	t
003d0000-560a-8f79-b725-9dd4b6d7cd6f	00160000-560a-8f79-2fcf-add493651676	00090000-560a-8f79-c3ef-ce86a4d46f9b	apri	14	t
003d0000-560a-8f79-25fc-0c6d3f0d5507	00160000-560a-8f79-58ce-e9697a346302	00090000-560a-8f79-ca45-ab5b438ed0f5	aizv	11	t
003d0000-560a-8f79-c03b-0f2de4aec057	00160000-560a-8f79-9c82-6329ffb12786	00090000-560a-8f79-60ad-39378640c069	aizv	12	t
003d0000-560a-8f79-5922-f3d2bab87ed7	00160000-560a-8f79-2fcf-add493651676	00090000-560a-8f79-ce4e-abc8948b77cc	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 21055122)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-560a-8f79-2fcf-add493651676	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-560a-8f79-58ce-e9697a346302	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-560a-8f79-9c82-6329ffb12786	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 21055474)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 21054883)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-560a-8f79-b540-279f17443ee4	\N	\N	00200000-560a-8f79-fb1d-cb03495d02f2	\N	\N	\N	\N	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-560a-8f79-1675-40e49486a451	\N	\N	00200000-560a-8f79-baa0-17377a4491db	\N	\N	\N	\N	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-560a-8f79-1b32-4749e87e733b	\N	\N	00200000-560a-8f79-18d0-7d75626c7a82	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-560a-8f79-3254-8051fa0b93c2	\N	\N	00200000-560a-8f79-e03a-60aeed59ff7f	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-560a-8f79-d843-266844aa1c8d	\N	\N	00200000-560a-8f79-01a4-f283ece358df	\N	\N	\N	\N	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 21054914)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 21055400)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 21054796)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-560a-8f77-b205-8f830a516103	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-560a-8f77-c0fc-c128d885cae7	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-560a-8f77-db9b-a79814faa676	AL	ALB	008	Albania 	Albanija	\N
00040000-560a-8f77-de34-61e64d86bf49	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-560a-8f77-cb9f-5b4193ce6886	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-560a-8f77-a9f9-9a02b253340f	AD	AND	020	Andorra 	Andora	\N
00040000-560a-8f77-73c2-a7aa0cbc439a	AO	AGO	024	Angola 	Angola	\N
00040000-560a-8f77-a643-2d46a2a2522b	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-560a-8f77-d7e9-838279903ef7	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-560a-8f77-1ec3-b9716bb84575	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-8f77-5cfa-0cc3dfda948c	AR	ARG	032	Argentina 	Argenitna	\N
00040000-560a-8f77-09fc-185f54053499	AM	ARM	051	Armenia 	Armenija	\N
00040000-560a-8f77-c418-566664dcd31d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-560a-8f77-603b-df2c35d4fcf3	AU	AUS	036	Australia 	Avstralija	\N
00040000-560a-8f77-15ce-f80b00508a84	AT	AUT	040	Austria 	Avstrija	\N
00040000-560a-8f77-5841-1cd1c9626af9	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-560a-8f77-1ae9-5c001de67ca2	BS	BHS	044	Bahamas 	Bahami	\N
00040000-560a-8f77-8773-eadaea9a0b63	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-560a-8f77-e7dd-bd75878acdac	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-560a-8f77-90ef-b39e4c6369c8	BB	BRB	052	Barbados 	Barbados	\N
00040000-560a-8f77-3a65-be0769ae0872	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-560a-8f77-fe2f-8c10db07d72c	BE	BEL	056	Belgium 	Belgija	\N
00040000-560a-8f77-951d-4d20f04b6c3d	BZ	BLZ	084	Belize 	Belize	\N
00040000-560a-8f77-6bb4-7cfe8c9ed059	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-560a-8f77-e09b-215de89c2d83	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-560a-8f77-69ba-a665c6fee835	BT	BTN	064	Bhutan 	Butan	\N
00040000-560a-8f77-7987-0cad6337d34f	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-560a-8f77-8252-d68bbaacbec0	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-560a-8f77-9bea-2d68c441a50b	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-560a-8f77-773b-9d35dae15ae2	BW	BWA	072	Botswana 	Bocvana	\N
00040000-560a-8f77-e907-886054181728	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-560a-8f77-1685-2d1d7e922cd1	BR	BRA	076	Brazil 	Brazilija	\N
00040000-560a-8f77-018f-b52de0490b6b	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-560a-8f77-06d3-3f0c40bf1158	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-560a-8f77-6e7a-f42487feaff4	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-560a-8f77-43ac-394bc0301e29	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-560a-8f77-473d-cf4c03fc446e	BI	BDI	108	Burundi 	Burundi 	\N
00040000-560a-8f77-e730-be1f3e7f461a	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-560a-8f77-9c1c-6dfd6b43a9ff	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-560a-8f77-c9d9-dd8902fe371b	CA	CAN	124	Canada 	Kanada	\N
00040000-560a-8f77-63ce-3a641dcc90bf	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-560a-8f77-4311-c81dc729271c	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-560a-8f77-eae6-f0fe476bc5ec	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-560a-8f77-bf70-70e2d0ac77df	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-560a-8f77-d4ca-3cf6e78dac03	CL	CHL	152	Chile 	Čile	\N
00040000-560a-8f77-6072-aed2745ef5d5	CN	CHN	156	China 	Kitajska	\N
00040000-560a-8f77-7790-0fcb767e9ede	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-560a-8f77-ef45-b2eba8e7ad5a	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-560a-8f77-d9db-aa06a112377e	CO	COL	170	Colombia 	Kolumbija	\N
00040000-560a-8f77-1042-dc078561745e	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-560a-8f77-9548-1004a3e3e09b	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-560a-8f77-f322-ce6f46869a30	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-560a-8f77-e069-a3ce71438e7b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-560a-8f77-7d9e-c6231749d819	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-560a-8f77-5c2c-31c8530ceb9b	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-560a-8f77-3b8e-3436c7f6513f	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-560a-8f77-b9e9-2202141feaf4	CU	CUB	192	Cuba 	Kuba	\N
00040000-560a-8f77-592b-5efdb98ed9d8	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-560a-8f77-97b5-dccf350073cf	CY	CYP	196	Cyprus 	Ciper	\N
00040000-560a-8f77-850b-1e8f2ebdf455	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-560a-8f77-76df-d4b3fc67fdcd	DK	DNK	208	Denmark 	Danska	\N
00040000-560a-8f77-b8a0-da40748e7d8f	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-560a-8f77-b1e6-0c6e539ae82f	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-8f77-1b52-88b06c5d4add	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-560a-8f77-09e0-5c5011d97db1	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-560a-8f77-a9d4-c473c1761627	EG	EGY	818	Egypt 	Egipt	\N
00040000-560a-8f77-3664-38f90f48695d	SV	SLV	222	El Salvador 	Salvador	\N
00040000-560a-8f77-bfd9-41c2530b93f4	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-560a-8f77-6ccc-8b0ace21a462	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-560a-8f77-2c1c-253445f3e909	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-560a-8f77-49db-b4b42dcfa992	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-560a-8f77-6925-e7dd77449abf	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-560a-8f77-3a17-8792d2b1aeca	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-560a-8f77-f17b-d08e15882fbb	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-560a-8f77-6512-c42e80b911e7	FI	FIN	246	Finland 	Finska	\N
00040000-560a-8f77-7fe9-d64fb79e250f	FR	FRA	250	France 	Francija	\N
00040000-560a-8f77-7231-1b64f6698b2d	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-560a-8f77-bf57-4a484edc1359	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-560a-8f77-b311-8fb54f5534d6	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-560a-8f77-b61f-a34b7a28cf40	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-560a-8f77-76c4-a9e4ca69eacc	GA	GAB	266	Gabon 	Gabon	\N
00040000-560a-8f77-4b12-757c644e9039	GM	GMB	270	Gambia 	Gambija	\N
00040000-560a-8f77-275d-2f64978fe6fe	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-560a-8f77-84cc-b321b102f555	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-560a-8f77-b345-5a77c716d063	GH	GHA	288	Ghana 	Gana	\N
00040000-560a-8f77-307b-588d7061a3d1	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-560a-8f77-9d14-1cef05e34383	GR	GRC	300	Greece 	Grčija	\N
00040000-560a-8f77-de24-da0f88166c5c	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-560a-8f77-565b-515bf65c625c	GD	GRD	308	Grenada 	Grenada	\N
00040000-560a-8f77-275d-241d12f0fb30	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-560a-8f77-6048-dbc202c6baa9	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-560a-8f77-15a9-150a5bb4dcfb	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-560a-8f77-e454-8d5a55b52c4b	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-560a-8f77-c838-049b3a8fcf30	GN	GIN	324	Guinea 	Gvineja	\N
00040000-560a-8f77-f50e-a49852f14c2c	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-560a-8f77-ec35-05650522d2d7	GY	GUY	328	Guyana 	Gvajana	\N
00040000-560a-8f77-4c79-5c26b8dcdd6a	HT	HTI	332	Haiti 	Haiti	\N
00040000-560a-8f77-69e2-94e0ae0b42bc	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-560a-8f77-4713-56797f2e9759	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-560a-8f77-27cb-ced77030a515	HN	HND	340	Honduras 	Honduras	\N
00040000-560a-8f77-1924-3a4f9af5490e	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-560a-8f77-3387-61ae56b49b72	HU	HUN	348	Hungary 	Madžarska	\N
00040000-560a-8f77-c857-8006617b8031	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-560a-8f77-27c5-aff3f3bb14c5	IN	IND	356	India 	Indija	\N
00040000-560a-8f77-dbd9-bfef30f600a3	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-560a-8f77-a9a2-f277a32e8cff	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-560a-8f77-aa1a-30a09d09e30e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-560a-8f77-6d12-47fc1445a34d	IE	IRL	372	Ireland 	Irska	\N
00040000-560a-8f77-e064-a6091434065e	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-560a-8f77-05b4-5d4fd547184d	IL	ISR	376	Israel 	Izrael	\N
00040000-560a-8f77-61d0-36a4de35599b	IT	ITA	380	Italy 	Italija	\N
00040000-560a-8f77-c34e-3bf2e737a5f1	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-560a-8f77-2274-fc18502a5782	JP	JPN	392	Japan 	Japonska	\N
00040000-560a-8f77-f46f-bd262bd5d1eb	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-560a-8f77-87d2-4122094606fd	JO	JOR	400	Jordan 	Jordanija	\N
00040000-560a-8f77-d355-113dd407cf6f	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-560a-8f77-9249-a64b49ca3e10	KE	KEN	404	Kenya 	Kenija	\N
00040000-560a-8f77-c84b-e6c917ef24e7	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-560a-8f77-9680-a405517ebd8d	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-560a-8f77-be7a-bb070b58d7d2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-560a-8f77-8ead-cd25b625db9c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-560a-8f77-3504-946db72be286	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-560a-8f77-9ab8-de59fce82392	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-560a-8f77-7ae4-d57f2e697954	LV	LVA	428	Latvia 	Latvija	\N
00040000-560a-8f77-46db-3407829ed3cc	LB	LBN	422	Lebanon 	Libanon	\N
00040000-560a-8f77-4ceb-79e36307f6ef	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-560a-8f77-4d73-22da17bb5cac	LR	LBR	430	Liberia 	Liberija	\N
00040000-560a-8f77-21d4-c0bc5a3c9684	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-560a-8f77-a6ab-ae7a828911e2	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-560a-8f77-a91c-aff7e0a4a17b	LT	LTU	440	Lithuania 	Litva	\N
00040000-560a-8f77-6f35-e1e125d8ec9c	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-560a-8f77-5183-c17a47d250ee	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-560a-8f77-6946-6edbc9ba53da	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-560a-8f77-a1ed-18dd5e17e03f	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-560a-8f77-9683-c0fa347b1a73	MW	MWI	454	Malawi 	Malavi	\N
00040000-560a-8f77-063c-fa122dbd15b6	MY	MYS	458	Malaysia 	Malezija	\N
00040000-560a-8f77-df51-4b1603503153	MV	MDV	462	Maldives 	Maldivi	\N
00040000-560a-8f77-5b26-f102e00686ed	ML	MLI	466	Mali 	Mali	\N
00040000-560a-8f77-a4d1-a0738466b1de	MT	MLT	470	Malta 	Malta	\N
00040000-560a-8f77-69f6-3f84d3ff8719	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-560a-8f77-e2b4-12ad78a8730e	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-560a-8f77-3bbf-f60072786179	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-560a-8f77-0008-99e65107457d	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-560a-8f77-dabf-0276b69a98a3	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-560a-8f77-3225-8315d28ba226	MX	MEX	484	Mexico 	Mehika	\N
00040000-560a-8f77-316f-f9b286466dc3	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-560a-8f77-286d-e996fbd7dfa2	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-560a-8f77-80a6-0168d55c5e78	MC	MCO	492	Monaco 	Monako	\N
00040000-560a-8f77-c088-2aaf450e773d	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-560a-8f77-cd43-3c3d907ba3e3	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-560a-8f77-aafe-829671d59b0a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-560a-8f77-1ffd-6b9491ea405e	MA	MAR	504	Morocco 	Maroko	\N
00040000-560a-8f77-1273-4fbbd9e2327c	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-560a-8f77-401c-18b6d27c190b	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-560a-8f77-ddd6-678587b74c98	NA	NAM	516	Namibia 	Namibija	\N
00040000-560a-8f77-725d-41b0f1d847a1	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-560a-8f77-6688-74377c6e67a0	NP	NPL	524	Nepal 	Nepal	\N
00040000-560a-8f77-b9e8-131eae61b3c0	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-560a-8f77-2f53-c344674bfc7d	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-560a-8f77-89cd-d7256d554f72	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-560a-8f77-7398-b545a9df6bfd	NE	NER	562	Niger 	Niger 	\N
00040000-560a-8f77-6bfd-a6ed6ccca8d6	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-560a-8f77-2b21-00aaf8187745	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-560a-8f77-ecb6-6dd32f53198c	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-560a-8f77-4170-0ea74a720619	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-560a-8f77-9982-f4df1e5d2b83	NO	NOR	578	Norway 	Norveška	\N
00040000-560a-8f77-b9c8-61ea8a63728c	OM	OMN	512	Oman 	Oman	\N
00040000-560a-8f77-ca7f-99a9fabf2df4	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-560a-8f77-e81f-986f8f080780	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-560a-8f77-31bf-e48abe723018	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-560a-8f77-5185-22c85d02c5f7	PA	PAN	591	Panama 	Panama	\N
00040000-560a-8f77-47e3-1e1f7c1fb18d	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-560a-8f77-d2a5-6b575044b344	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-560a-8f77-003b-53f87a7eb4f5	PE	PER	604	Peru 	Peru	\N
00040000-560a-8f77-9b09-a09891a44014	PH	PHL	608	Philippines 	Filipini	\N
00040000-560a-8f77-700e-03b6f3553bfb	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-560a-8f77-5fa9-f4a6b997db0d	PL	POL	616	Poland 	Poljska	\N
00040000-560a-8f77-5145-627a268073c5	PT	PRT	620	Portugal 	Portugalska	\N
00040000-560a-8f77-8d4f-cedba119456c	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-560a-8f77-33dd-675c0b30bead	QA	QAT	634	Qatar 	Katar	\N
00040000-560a-8f77-3006-0e0ac4d6c036	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-560a-8f77-0e3b-acabff4afddb	RO	ROU	642	Romania 	Romunija	\N
00040000-560a-8f77-33fb-21fb47b727aa	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-560a-8f77-894e-c302d504794a	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-560a-8f77-5d4f-e0acd21ba4de	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-560a-8f77-ddfd-acd49b42b242	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-560a-8f77-9c47-a62f66b968f3	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-560a-8f77-50c6-f74c630bae83	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-560a-8f77-2902-23390efa8fbc	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-560a-8f77-4467-b996c26da7e6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-560a-8f77-52c3-274b84eed97c	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-560a-8f77-dfa8-b0100ca7f53a	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-560a-8f77-1748-a840b2dac44a	SM	SMR	674	San Marino 	San Marino	\N
00040000-560a-8f77-cd39-d0552e83efa9	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-560a-8f77-171d-7c0686edee7d	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-560a-8f77-f377-42c4954949d1	SN	SEN	686	Senegal 	Senegal	\N
00040000-560a-8f77-80dc-d794dd4d2f47	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-560a-8f77-8769-007d61478f2a	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-560a-8f77-0dab-61f0057c59ef	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-560a-8f77-f261-7d23e4ca3c67	SG	SGP	702	Singapore 	Singapur	\N
00040000-560a-8f77-aa0e-7808de959df4	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-560a-8f77-42d6-e813c889cbc4	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-560a-8f77-fecb-2f7860af8179	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-560a-8f77-fe70-adfea0705bd6	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-560a-8f77-f738-154780d06a35	SO	SOM	706	Somalia 	Somalija	\N
00040000-560a-8f77-2b25-bde56f111e2a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-560a-8f77-e525-b0a8f2fb16a9	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-560a-8f77-0016-02e92cb6d008	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-560a-8f77-de8e-9cca9122506f	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-560a-8f77-f34a-65ff63033657	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-560a-8f77-14d0-722cb2eef341	SD	SDN	729	Sudan 	Sudan	\N
00040000-560a-8f77-3808-8317c080893b	SR	SUR	740	Suriname 	Surinam	\N
00040000-560a-8f77-7520-f911f8b0515a	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-560a-8f77-2352-484d8fb1f813	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-560a-8f77-c068-f4a65a303da4	SE	SWE	752	Sweden 	Švedska	\N
00040000-560a-8f77-8627-e8de555f84a4	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-560a-8f77-160a-8ee041b23c5a	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-560a-8f77-3118-77eab31b9a57	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-560a-8f77-eaca-4e8edcec0ec2	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-560a-8f77-090d-2b96c54be7aa	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-560a-8f77-57b2-a5ed35782744	TH	THA	764	Thailand 	Tajska	\N
00040000-560a-8f77-f4d3-444138c9d6d7	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-560a-8f77-6a1b-32891789a03e	TG	TGO	768	Togo 	Togo	\N
00040000-560a-8f77-6a7d-23c19618c58e	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-560a-8f77-f696-d509cce4303c	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-560a-8f77-2722-6c4957c380ec	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-560a-8f77-d2b9-eca54b8fe31a	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-560a-8f77-cf7c-1f12fb944963	TR	TUR	792	Turkey 	Turčija	\N
00040000-560a-8f77-df20-b1e63c045539	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-560a-8f77-1933-b4308f5ad5f2	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-8f77-9256-d0f768da81b1	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-560a-8f77-a481-61ad1e7bac9d	UG	UGA	800	Uganda 	Uganda	\N
00040000-560a-8f77-de8d-930c07de0018	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-560a-8f77-5fd3-585058c8ba67	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-560a-8f77-f894-2cd85b00c00c	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-560a-8f77-523b-234e3541cd08	US	USA	840	United States 	Združene države Amerike	\N
00040000-560a-8f77-938b-0aaa94739894	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-560a-8f77-6d62-d361d80d7a9c	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-560a-8f77-bddf-2cde61f809f5	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-560a-8f77-268d-f0f90d6517cb	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-560a-8f77-fc59-f2839a2d472f	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-560a-8f77-f3c6-f82cb3563b07	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-560a-8f77-2a8d-33b3bcb2dd6a	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-8f77-b1b6-10c4f024042c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-560a-8f77-3671-2b5410174988	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-560a-8f77-d9f6-acc77995b369	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-560a-8f77-1b62-5bffcaea6eff	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-560a-8f77-5132-4f85feb4ddf7	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-560a-8f77-c14e-89fbc30c7253	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 21055245)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-560a-8f79-eb50-05e783f9629d	000e0000-560a-8f79-a048-b12889cb7d37	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-8f77-3e9a-fdc7e926b24e	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-8f79-3909-976ce2ebdf54	000e0000-560a-8f79-ba51-03f451225bac	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-8f77-9c9b-fc3da87667d1	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-8f79-f5cb-a63438eda8cc	000e0000-560a-8f79-7c8f-4d286c9003aa	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-8f77-3e9a-fdc7e926b24e	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-8f79-996c-c67dfb62ffde	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-8f79-90e1-c50e000c0dab	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 21055047)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-560a-8f79-077f-ff8a8105a365	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-bde8-ca29841ea74e	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-8f77-1bce-15d66c5f8510
000d0000-560a-8f79-94fb-3b5a7abe0f2a	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-6bd4-1a2d6530e756	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-560a-8f77-1314-5a87b9c7fd27
000d0000-560a-8f79-0bc6-d465fcd63a29	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-b77d-d96eb2584b06	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-560a-8f77-71f5-b4a374a7aac7
000d0000-560a-8f79-ed89-0e1d7656ff34	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-5622-c81e205b6dd9	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-560a-8f77-3db3-01547995d92f
000d0000-560a-8f79-d2f0-902236252202	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-54f8-de88639c9ad0	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-560a-8f77-3db3-01547995d92f
000d0000-560a-8f79-cf0d-d858aaa5625c	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-8d00-1ca67f2be10a	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-8f77-1bce-15d66c5f8510
000d0000-560a-8f79-d114-5a0231cfaedc	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-4453-dc5f70fbd651	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-560a-8f77-1bce-15d66c5f8510
000d0000-560a-8f79-b7ec-a52915e3ff11	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-86a7-bb90f112aec9	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-560a-8f77-5908-0a9f95a0229d
000d0000-560a-8f79-4f3a-23b5966442c9	000e0000-560a-8f79-ba51-03f451225bac	000c0000-560a-8f79-2b1c-8d7b440964ec	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-560a-8f77-9b8d-f72ad65905bc
\.


--
-- TOC entry 2991 (class 0 OID 21054862)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 21054836)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 21054813)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-560a-8f79-7849-9dd91a1a1e04	00080000-560a-8f79-9f6a-c5efed316cd1	00090000-560a-8f79-8da0-2371c8b02c5e	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 21054961)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 21055455)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 21055467)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 21055489)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2966 (class 0 OID 20579799)
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
\.


--
-- TOC entry 3004 (class 0 OID 21054986)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 21054770)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-560a-8f77-9f68-500ceb359cde	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-560a-8f77-8f88-b3fe40ea4877	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-560a-8f77-79ac-4b27c288f144	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-560a-8f77-50fb-e12cb89666f4	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-560a-8f77-f803-3c2aa7429baa	dogodek.status	array	a:8:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"610s";a:1:{s:5:"label";s:9:"Odpovedan";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-560a-8f77-a673-b394745a6efe	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-560a-8f77-8902-1991a946492f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-560a-8f77-5351-ab7ce4f47706	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-8f77-120d-d6e5051a541e	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-8f77-6320-c25f9eb7f2ce	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-560a-8f77-0744-973001613214	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-560a-8f77-10eb-51c97170a861	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-560a-8f77-7e73-ca2c84ad5e8c	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-560a-8f77-d107-dc7477dae2b1	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-560a-8f77-632b-20cb27c32cc2	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-560a-8f79-6d48-e133f90c46b0	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-560a-8f79-a6c3-5a1cae5d7530	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-560a-8f79-4264-3a7fe4d72200	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-560a-8f79-4c12-92ccd8087165	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-560a-8f79-c724-15c8f8bcc4d1	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-560a-8f7a-b06f-f3c3319b91b9	application.tenant.maticnopodjetje	string	s:36:"00080000-560a-8f7a-82e1-d243a2f5dc41";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2978 (class 0 OID 21054684)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-560a-8f79-b169-d53a5b16b71c	00000000-560a-8f79-6d48-e133f90c46b0	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-560a-8f79-a5c3-18a415d78e6a	00000000-560a-8f79-6d48-e133f90c46b0	00010000-560a-8f77-d3d9-db10ba0d9d27	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-560a-8f79-3de3-8cbadba07a05	00000000-560a-8f79-a6c3-5a1cae5d7530	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 21054695)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-560a-8f79-6cf4-2f0fb9cb99a6	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-560a-8f79-fef3-7d39b37220e3	00010000-560a-8f79-e8ed-6f822d103862	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-560a-8f79-9e97-25f8a8e4fbde	00010000-560a-8f79-ccda-da74dc0a11dd	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-560a-8f79-abd6-26d309a7aefb	00010000-560a-8f79-f1c4-5337093c5024	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-560a-8f79-7556-076a792a8e56	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-560a-8f79-8f45-8b80ac65731e	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-560a-8f79-a0c0-1ff5c8f7abc1	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-560a-8f79-143f-057c26d90306	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-560a-8f79-8da0-2371c8b02c5e	00010000-560a-8f79-767e-cff45a89545d	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-560a-8f79-75e3-02ef29b01a52	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-560a-8f79-9cbf-7e97c1b8f882	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-8f79-34d5-9b20185af4ba	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-560a-8f79-e2a6-bbf6936a613a	00010000-560a-8f79-ba26-ec7a7602c1fc	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-8f79-0c13-246298ebb8b5	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-8f79-c3ef-ce86a4d46f9b	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-8f79-ca45-ab5b438ed0f5	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-8f79-60ad-39378640c069	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-560a-8f79-ce4e-abc8948b77cc	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 21054649)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-560a-8f77-2e38-b02b339b365c	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-560a-8f77-edda-1227eca73fa6	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-560a-8f77-64a7-00b538c81e6f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-560a-8f77-4be9-fb41a382510a	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-560a-8f77-945c-7cbd0f539597	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-560a-8f77-1646-952c99984267	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-560a-8f77-19f8-1691aba124c2	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-560a-8f77-2db6-48ca869e06fd	Abonma-read	Abonma - branje	f
00030000-560a-8f77-2714-81112e78889b	Abonma-write	Abonma - spreminjanje	f
00030000-560a-8f77-5cf1-ee4c010a3075	Alternacija-read	Alternacija - branje	f
00030000-560a-8f77-cdf3-a80de7082f61	Alternacija-write	Alternacija - spreminjanje	f
00030000-560a-8f77-ee9b-e52621e65b8f	Arhivalija-read	Arhivalija - branje	f
00030000-560a-8f77-912d-f25792fbf4a7	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-560a-8f77-120e-5ef190b240ea	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-560a-8f77-0899-bec5c0768903	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-560a-8f77-bfa2-88851f5572cb	Besedilo-read	Besedilo - branje	f
00030000-560a-8f77-01f4-7e0eee29ec3f	Besedilo-write	Besedilo - spreminjanje	f
00030000-560a-8f77-7528-8f8b2b6e76be	DogodekIzven-read	DogodekIzven - branje	f
00030000-560a-8f77-deff-083cbf59f9c3	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-560a-8f77-914a-8c9f2f83d4bf	Dogodek-read	Dogodek - branje	f
00030000-560a-8f77-e509-0607ae271a6e	Dogodek-write	Dogodek - spreminjanje	f
00030000-560a-8f77-dac4-ff7206b7bcef	DrugiVir-read	DrugiVir - branje	f
00030000-560a-8f77-14fc-1a8015c0030c	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-560a-8f77-a15e-bd87c9680a3f	Drzava-read	Drzava - branje	f
00030000-560a-8f77-3669-c5569a93b9af	Drzava-write	Drzava - spreminjanje	f
00030000-560a-8f77-8762-8e52d39417a2	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-560a-8f77-e28c-7ae034deb69e	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-560a-8f77-6735-6b845cf19f81	Funkcija-read	Funkcija - branje	f
00030000-560a-8f77-2db8-e6da15d6165a	Funkcija-write	Funkcija - spreminjanje	f
00030000-560a-8f77-b213-150c59fcc2d2	Gostovanje-read	Gostovanje - branje	f
00030000-560a-8f77-2bec-c165270e34ed	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-560a-8f77-ac83-08c8e62cff05	Gostujoca-read	Gostujoca - branje	f
00030000-560a-8f77-a427-116be50e2d8f	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-560a-8f77-bd2f-bc5204036b5d	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-560a-8f77-28e5-c81c9a36eca9	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-560a-8f77-869b-4726464395d2	Kupec-read	Kupec - branje	f
00030000-560a-8f77-c871-f0b18615e381	Kupec-write	Kupec - spreminjanje	f
00030000-560a-8f77-27c7-42d13b637372	NacinPlacina-read	NacinPlacina - branje	f
00030000-560a-8f77-7a6e-091ab37f6a73	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-560a-8f77-2f11-72c5d6f3b165	Option-read	Option - branje	f
00030000-560a-8f77-6a14-59863a7221f2	Option-write	Option - spreminjanje	f
00030000-560a-8f77-aca2-c6e88d56c288	OptionValue-read	OptionValue - branje	f
00030000-560a-8f77-421d-2ea60df7783e	OptionValue-write	OptionValue - spreminjanje	f
00030000-560a-8f77-48fe-b2b31aca2942	Oseba-read	Oseba - branje	f
00030000-560a-8f77-855e-e74184d85256	Oseba-write	Oseba - spreminjanje	f
00030000-560a-8f77-840f-24c77488353a	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-560a-8f77-5fb2-37cda270bc59	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-560a-8f77-eb27-ec942cf0bfaf	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-560a-8f77-2ea4-bceafd7463dd	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-560a-8f77-df96-9ca2a35e90d4	Pogodba-read	Pogodba - branje	f
00030000-560a-8f77-75c3-c19956c38629	Pogodba-write	Pogodba - spreminjanje	f
00030000-560a-8f77-16a6-47811427c969	Popa-read	Popa - branje	f
00030000-560a-8f77-258f-b2826391de30	Popa-write	Popa - spreminjanje	f
00030000-560a-8f77-80f9-3e790b28cc44	Posta-read	Posta - branje	f
00030000-560a-8f77-4712-4ce393459e3c	Posta-write	Posta - spreminjanje	f
00030000-560a-8f77-69f0-1631076dfa1d	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-560a-8f77-dd5c-4e549eabd38d	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-560a-8f77-b487-dd0642a6a67a	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-560a-8f77-753b-0ce93e0d35b4	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-560a-8f77-ff84-63633a64acc3	PostniNaslov-read	PostniNaslov - branje	f
00030000-560a-8f77-f59c-30561cdf4bde	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-560a-8f77-ac1c-513a00a0d2f4	Predstava-read	Predstava - branje	f
00030000-560a-8f77-9b6c-d1daf90ed305	Predstava-write	Predstava - spreminjanje	f
00030000-560a-8f77-4be3-d52953bc1c54	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-560a-8f77-c326-17191ebed859	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-560a-8f77-bb68-8aaa2e1e5740	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-560a-8f77-3be9-2506cc4f1ed5	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-560a-8f77-5bae-a8c6eff52376	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-560a-8f77-bb37-e9fd25cd48ef	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-560a-8f77-47b1-4025189f5d8b	ProgramDela-read	ProgramDela - branje	f
00030000-560a-8f77-99ab-1c85ecbb3db1	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-560a-8f77-94d3-c4ed9a55dd03	ProgramFestival-read	ProgramFestival - branje	f
00030000-560a-8f77-2597-44152181c565	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-560a-8f77-660a-83381841a9d7	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-560a-8f77-cde3-88e103fa3012	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-560a-8f77-fe2c-3a120a572d0c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-560a-8f77-b2de-06963a4e44d2	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-560a-8f77-690c-81ab0a033f5e	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-560a-8f77-7803-9d18ae0c92e5	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-560a-8f77-0c2f-16a86f7a2051	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-560a-8f77-21fa-e37695cde4c0	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-560a-8f77-f7ec-e2de53fc916c	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-560a-8f77-0335-6d8a519688af	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-560a-8f77-626d-f3d1e29bbc09	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-560a-8f77-d060-a5d22abfdd99	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-560a-8f77-6a88-2d927fa9c414	ProgramRazno-read	ProgramRazno - branje	f
00030000-560a-8f77-0488-3d4753f98f5a	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-560a-8f77-83ff-d1b5a360aa48	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-560a-8f77-df78-519c51ac628a	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-560a-8f77-7908-2653d4729935	Prostor-read	Prostor - branje	f
00030000-560a-8f77-7b0a-655b4502731b	Prostor-write	Prostor - spreminjanje	f
00030000-560a-8f77-dce4-059bbee742a3	Racun-read	Racun - branje	f
00030000-560a-8f77-aef8-5b9fccefe908	Racun-write	Racun - spreminjanje	f
00030000-560a-8f77-9474-8b5916284b1d	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-560a-8f77-632c-9a5293be71ef	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-560a-8f77-2a40-e7a4920530e4	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-560a-8f77-a0e6-9a353b02c389	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-560a-8f77-aab5-049fedf83a95	Rekvizit-read	Rekvizit - branje	f
00030000-560a-8f77-3192-fe79804077e5	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-560a-8f77-bacc-a37be691902b	Revizija-read	Revizija - branje	f
00030000-560a-8f77-2ac4-3ec80244c0c8	Revizija-write	Revizija - spreminjanje	f
00030000-560a-8f77-1641-c43241763a19	Rezervacija-read	Rezervacija - branje	f
00030000-560a-8f77-883b-97dbf631ff1a	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-560a-8f77-ee10-f9384ecfb9b8	SedezniRed-read	SedezniRed - branje	f
00030000-560a-8f77-a13f-c8810862eead	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-560a-8f77-6850-692b2e197432	Sedez-read	Sedez - branje	f
00030000-560a-8f77-a604-792585874856	Sedez-write	Sedez - spreminjanje	f
00030000-560a-8f77-71d0-fcd0f2bccf40	Sezona-read	Sezona - branje	f
00030000-560a-8f77-280e-b66c510b9fcf	Sezona-write	Sezona - spreminjanje	f
00030000-560a-8f77-8870-4e446d0b7b35	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-560a-8f77-37a3-f771fc2a166e	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-560a-8f77-edaa-56fc7f14ce45	Stevilcenje-read	Stevilcenje - branje	f
00030000-560a-8f77-8483-7be21546c8a2	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-560a-8f77-1349-b52fa9edf8c0	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-560a-8f77-2fc3-7429ea5fef22	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-560a-8f77-3e17-3d293a683f58	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-560a-8f77-adc5-c22e6e22cc33	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-560a-8f77-425c-46914186e72d	Telefonska-read	Telefonska - branje	f
00030000-560a-8f77-450f-5c6902bf6a7f	Telefonska-write	Telefonska - spreminjanje	f
00030000-560a-8f77-f0f6-d15878b53a06	TerminStoritve-read	TerminStoritve - branje	f
00030000-560a-8f77-fd82-b8355a36b907	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-560a-8f77-c471-8ad838cbc80c	TipFunkcije-read	TipFunkcije - branje	f
00030000-560a-8f77-8531-6a6bc49d89bf	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-560a-8f77-f2e3-b12ed862a3b7	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-560a-8f77-1cd1-4a9547e7104f	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-560a-8f77-8f31-0c86c3339273	Trr-read	Trr - branje	f
00030000-560a-8f77-e5d3-2a2e56e051c7	Trr-write	Trr - spreminjanje	f
00030000-560a-8f77-422f-083ed215eff1	Uprizoritev-read	Uprizoritev - branje	f
00030000-560a-8f77-ce21-c37db6c7bbc7	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-560a-8f77-7325-7666c1d3d6d7	Vaja-read	Vaja - branje	f
00030000-560a-8f77-5525-5fb8c655c7d6	Vaja-write	Vaja - spreminjanje	f
00030000-560a-8f77-7dbb-e45b18b20162	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-560a-8f77-409b-d575935e9f10	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-560a-8f77-7ef3-408d9c9d0dea	VrstaStroska-read	VrstaStroska - branje	f
00030000-560a-8f77-bec4-df46f7cf4ba9	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-560a-8f77-4923-559877ff2b84	Zaposlitev-read	Zaposlitev - branje	f
00030000-560a-8f77-e841-ff78732ef681	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-560a-8f77-b5ee-3586a4069f5e	Zasedenost-read	Zasedenost - branje	f
00030000-560a-8f77-cf0e-5a6bbf8707f6	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-560a-8f77-b6ae-7eb614bba261	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-560a-8f77-f5f5-385445806034	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-560a-8f77-906b-c99f3986af3d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-560a-8f77-91f5-83383bad2cbd	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-560a-8f77-6649-1c240562c250	Job-read	Branje opravil - samo zase - branje	f
00030000-560a-8f77-73ac-6583c84c2e3f	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-560a-8f77-99a5-ef9c09ca1c21	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-560a-8f77-28d0-694392e3f0b9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-560a-8f77-46d3-de5938c01406	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-560a-8f77-7f76-90b3a8cec7c3	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-560a-8f77-54cc-25118261b041	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-560a-8f77-8f68-363828569440	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-8f77-faa1-4ef84de67e60	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-8f77-04b3-bea3f2fd8b82	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-8f77-97d7-96247e36aded	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-8f77-c827-1e2878b24c10	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-560a-8f77-74b3-8d4239cdc777	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-560a-8f77-6d27-6909df287616	Datoteka-write	Datoteka - spreminjanje	f
00030000-560a-8f77-1bdd-8f9a86b03173	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 21054668)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-560a-8f77-08e4-b69b6c139c00	00030000-560a-8f77-edda-1227eca73fa6
00020000-560a-8f77-8c2c-76a57dd5c7b3	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-2db6-48ca869e06fd
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-2714-81112e78889b
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-5cf1-ee4c010a3075
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-cdf3-a80de7082f61
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-ee9b-e52621e65b8f
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-914a-8c9f2f83d4bf
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-4be9-fb41a382510a
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-e509-0607ae271a6e
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-3669-c5569a93b9af
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-6735-6b845cf19f81
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-2db8-e6da15d6165a
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-b213-150c59fcc2d2
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-2bec-c165270e34ed
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-ac83-08c8e62cff05
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-a427-116be50e2d8f
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-bd2f-bc5204036b5d
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-28e5-c81c9a36eca9
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-2f11-72c5d6f3b165
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-aca2-c6e88d56c288
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-48fe-b2b31aca2942
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-855e-e74184d85256
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-16a6-47811427c969
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-258f-b2826391de30
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-80f9-3e790b28cc44
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-4712-4ce393459e3c
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-ff84-63633a64acc3
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-f59c-30561cdf4bde
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-ac1c-513a00a0d2f4
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-9b6c-d1daf90ed305
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-5bae-a8c6eff52376
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-bb37-e9fd25cd48ef
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-7908-2653d4729935
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-7b0a-655b4502731b
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-2a40-e7a4920530e4
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-a0e6-9a353b02c389
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-aab5-049fedf83a95
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-3192-fe79804077e5
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-71d0-fcd0f2bccf40
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-280e-b66c510b9fcf
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-c471-8ad838cbc80c
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-422f-083ed215eff1
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-ce21-c37db6c7bbc7
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-7325-7666c1d3d6d7
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-5525-5fb8c655c7d6
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-b5ee-3586a4069f5e
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-cf0e-5a6bbf8707f6
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-b6ae-7eb614bba261
00020000-560a-8f77-0d7c-71f7afe94e5d	00030000-560a-8f77-906b-c99f3986af3d
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-2db6-48ca869e06fd
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-ee9b-e52621e65b8f
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-914a-8c9f2f83d4bf
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-b213-150c59fcc2d2
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-ac83-08c8e62cff05
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-bd2f-bc5204036b5d
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-28e5-c81c9a36eca9
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-2f11-72c5d6f3b165
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-aca2-c6e88d56c288
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-48fe-b2b31aca2942
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-855e-e74184d85256
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-16a6-47811427c969
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-80f9-3e790b28cc44
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-ff84-63633a64acc3
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-f59c-30561cdf4bde
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-ac1c-513a00a0d2f4
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-7908-2653d4729935
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-2a40-e7a4920530e4
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-aab5-049fedf83a95
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-71d0-fcd0f2bccf40
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-425c-46914186e72d
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-450f-5c6902bf6a7f
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-8f31-0c86c3339273
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-e5d3-2a2e56e051c7
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-4923-559877ff2b84
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-e841-ff78732ef681
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-b6ae-7eb614bba261
00020000-560a-8f77-766d-38f99bc2d167	00030000-560a-8f77-906b-c99f3986af3d
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-2db6-48ca869e06fd
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-5cf1-ee4c010a3075
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-ee9b-e52621e65b8f
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-912d-f25792fbf4a7
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-bfa2-88851f5572cb
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-7528-8f8b2b6e76be
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-914a-8c9f2f83d4bf
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-6735-6b845cf19f81
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-b213-150c59fcc2d2
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-ac83-08c8e62cff05
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-bd2f-bc5204036b5d
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-2f11-72c5d6f3b165
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-aca2-c6e88d56c288
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-48fe-b2b31aca2942
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-16a6-47811427c969
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-80f9-3e790b28cc44
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-ac1c-513a00a0d2f4
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-5bae-a8c6eff52376
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-7908-2653d4729935
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-2a40-e7a4920530e4
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-aab5-049fedf83a95
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-71d0-fcd0f2bccf40
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-c471-8ad838cbc80c
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-7325-7666c1d3d6d7
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-b5ee-3586a4069f5e
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-b6ae-7eb614bba261
00020000-560a-8f77-4fc6-745760c12607	00030000-560a-8f77-906b-c99f3986af3d
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-2db6-48ca869e06fd
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-2714-81112e78889b
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-cdf3-a80de7082f61
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-ee9b-e52621e65b8f
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-914a-8c9f2f83d4bf
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-b213-150c59fcc2d2
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-ac83-08c8e62cff05
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-2f11-72c5d6f3b165
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-aca2-c6e88d56c288
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-16a6-47811427c969
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-80f9-3e790b28cc44
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-ac1c-513a00a0d2f4
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-7908-2653d4729935
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-2a40-e7a4920530e4
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-aab5-049fedf83a95
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-71d0-fcd0f2bccf40
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-c471-8ad838cbc80c
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-b6ae-7eb614bba261
00020000-560a-8f77-b0ca-d475f71979a2	00030000-560a-8f77-906b-c99f3986af3d
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-2db6-48ca869e06fd
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-ee9b-e52621e65b8f
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-914a-8c9f2f83d4bf
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-b213-150c59fcc2d2
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-ac83-08c8e62cff05
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-2f11-72c5d6f3b165
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-aca2-c6e88d56c288
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-16a6-47811427c969
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-80f9-3e790b28cc44
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-ac1c-513a00a0d2f4
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-7908-2653d4729935
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-2a40-e7a4920530e4
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-aab5-049fedf83a95
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-71d0-fcd0f2bccf40
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-f0f6-d15878b53a06
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-64a7-00b538c81e6f
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-c471-8ad838cbc80c
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-b6ae-7eb614bba261
00020000-560a-8f77-2597-9f9d33ad266a	00030000-560a-8f77-906b-c99f3986af3d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2e38-b02b339b365c
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-edda-1227eca73fa6
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-64a7-00b538c81e6f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-4be9-fb41a382510a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-945c-7cbd0f539597
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-1646-952c99984267
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-19f8-1691aba124c2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2db6-48ca869e06fd
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2714-81112e78889b
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-5cf1-ee4c010a3075
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-cdf3-a80de7082f61
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-ee9b-e52621e65b8f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-912d-f25792fbf4a7
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-bfa2-88851f5572cb
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-01f4-7e0eee29ec3f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7528-8f8b2b6e76be
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-deff-083cbf59f9c3
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-914a-8c9f2f83d4bf
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-e509-0607ae271a6e
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-a15e-bd87c9680a3f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-3669-c5569a93b9af
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-dac4-ff7206b7bcef
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-14fc-1a8015c0030c
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-8762-8e52d39417a2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-e28c-7ae034deb69e
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-6735-6b845cf19f81
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2db8-e6da15d6165a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-b213-150c59fcc2d2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2bec-c165270e34ed
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-ac83-08c8e62cff05
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-a427-116be50e2d8f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-bd2f-bc5204036b5d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-28e5-c81c9a36eca9
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-869b-4726464395d2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-c871-f0b18615e381
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-27c7-42d13b637372
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7a6e-091ab37f6a73
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2f11-72c5d6f3b165
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-6a14-59863a7221f2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-aca2-c6e88d56c288
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-421d-2ea60df7783e
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-48fe-b2b31aca2942
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-855e-e74184d85256
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-840f-24c77488353a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-5fb2-37cda270bc59
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-eb27-ec942cf0bfaf
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2ea4-bceafd7463dd
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-df96-9ca2a35e90d4
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-75c3-c19956c38629
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-16a6-47811427c969
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-258f-b2826391de30
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-80f9-3e790b28cc44
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-4712-4ce393459e3c
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-69f0-1631076dfa1d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-dd5c-4e549eabd38d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-b487-dd0642a6a67a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-753b-0ce93e0d35b4
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-ff84-63633a64acc3
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-f59c-30561cdf4bde
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-ac1c-513a00a0d2f4
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-9b6c-d1daf90ed305
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-4be3-d52953bc1c54
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-c326-17191ebed859
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-bb68-8aaa2e1e5740
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-3be9-2506cc4f1ed5
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-5bae-a8c6eff52376
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-bb37-e9fd25cd48ef
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-47b1-4025189f5d8b
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-99ab-1c85ecbb3db1
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-94d3-c4ed9a55dd03
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2597-44152181c565
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-660a-83381841a9d7
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-cde3-88e103fa3012
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-fe2c-3a120a572d0c
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-b2de-06963a4e44d2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-690c-81ab0a033f5e
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7803-9d18ae0c92e5
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-0c2f-16a86f7a2051
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-21fa-e37695cde4c0
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-f7ec-e2de53fc916c
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-0335-6d8a519688af
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-626d-f3d1e29bbc09
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-d060-a5d22abfdd99
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-6a88-2d927fa9c414
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-0488-3d4753f98f5a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-83ff-d1b5a360aa48
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-df78-519c51ac628a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7908-2653d4729935
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7b0a-655b4502731b
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-dce4-059bbee742a3
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-aef8-5b9fccefe908
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-9474-8b5916284b1d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-632c-9a5293be71ef
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2a40-e7a4920530e4
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-a0e6-9a353b02c389
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-aab5-049fedf83a95
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-3192-fe79804077e5
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-bacc-a37be691902b
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2ac4-3ec80244c0c8
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-1641-c43241763a19
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-883b-97dbf631ff1a
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-ee10-f9384ecfb9b8
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-a13f-c8810862eead
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-6850-692b2e197432
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-a604-792585874856
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-71d0-fcd0f2bccf40
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-280e-b66c510b9fcf
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-8870-4e446d0b7b35
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-37a3-f771fc2a166e
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-edaa-56fc7f14ce45
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-8483-7be21546c8a2
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-1349-b52fa9edf8c0
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-2fc3-7429ea5fef22
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-3e17-3d293a683f58
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-adc5-c22e6e22cc33
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-425c-46914186e72d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-450f-5c6902bf6a7f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-f0f6-d15878b53a06
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-fd82-b8355a36b907
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-c471-8ad838cbc80c
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-8531-6a6bc49d89bf
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-f2e3-b12ed862a3b7
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-1cd1-4a9547e7104f
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-8f31-0c86c3339273
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-e5d3-2a2e56e051c7
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-422f-083ed215eff1
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-ce21-c37db6c7bbc7
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7325-7666c1d3d6d7
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-5525-5fb8c655c7d6
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7dbb-e45b18b20162
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-409b-d575935e9f10
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-7ef3-408d9c9d0dea
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-bec4-df46f7cf4ba9
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-4923-559877ff2b84
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-e841-ff78732ef681
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-b5ee-3586a4069f5e
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-cf0e-5a6bbf8707f6
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-b6ae-7eb614bba261
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-f5f5-385445806034
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-906b-c99f3986af3d
00020000-560a-8f79-e4e0-0cb683f113d6	00030000-560a-8f77-91f5-83383bad2cbd
\.


--
-- TOC entry 3005 (class 0 OID 21054993)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 21055027)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 21055163)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-560a-8f79-73d0-5b3f49dbc0b4	00090000-560a-8f79-6cf4-2f0fb9cb99a6	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-560a-8f79-58d7-5bc70f01743e	00090000-560a-8f79-8f45-8b80ac65731e	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-560a-8f79-ad52-917972be971c	00090000-560a-8f79-e2a6-bbf6936a613a	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-560a-8f79-311a-8a10926a0910	00090000-560a-8f79-75e3-02ef29b01a52	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 21054728)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-560a-8f79-9f6a-c5efed316cd1	00040000-560a-8f77-fecb-2f7860af8179	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-8d30-3626e3e60580	00040000-560a-8f77-fecb-2f7860af8179	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-560a-8f79-cd41-e74049d943cf	00040000-560a-8f77-fecb-2f7860af8179	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-9782-9faa5c6de544	00040000-560a-8f77-fecb-2f7860af8179	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-1e4e-a6c529e00794	00040000-560a-8f77-fecb-2f7860af8179	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-68b7-9e694b360bee	00040000-560a-8f77-5cfa-0cc3dfda948c	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-f984-5341a3522239	00040000-560a-8f77-3b8e-3436c7f6513f	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-ae39-f22f450161f2	00040000-560a-8f77-15ce-f80b00508a84	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f79-2ebe-f84814f0edb0	00040000-560a-8f77-84cc-b321b102f555	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-8f7a-82e1-d243a2f5dc41	00040000-560a-8f77-fecb-2f7860af8179	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 21054762)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-560a-8f76-b8fb-e736c1606076	8341	Adlešiči
00050000-560a-8f76-b28d-1cdee013d560	5270	Ajdovščina
00050000-560a-8f76-f254-debe50fcd27e	6280	Ankaran/Ancarano
00050000-560a-8f76-2824-41dabc9ae968	9253	Apače
00050000-560a-8f76-5218-c9f6ef5ec99e	8253	Artiče
00050000-560a-8f76-4060-d9a067e39f80	4275	Begunje na Gorenjskem
00050000-560a-8f76-3553-33f3c54d752d	1382	Begunje pri Cerknici
00050000-560a-8f76-9374-6b1ac1f8d611	9231	Beltinci
00050000-560a-8f76-4601-c4fbb60bc14a	2234	Benedikt
00050000-560a-8f76-5c86-47937b72b6f2	2345	Bistrica ob Dravi
00050000-560a-8f76-af58-fa4c8ad0365e	3256	Bistrica ob Sotli
00050000-560a-8f76-9a04-b8b34bc61970	8259	Bizeljsko
00050000-560a-8f76-629c-47af5e4cf759	1223	Blagovica
00050000-560a-8f76-51de-87512c79bf9f	8283	Blanca
00050000-560a-8f76-66d2-42427577f730	4260	Bled
00050000-560a-8f76-1644-e385dc077302	4273	Blejska Dobrava
00050000-560a-8f76-6ce4-acf13ebf9971	9265	Bodonci
00050000-560a-8f76-8804-2f8c9ab28a7b	9222	Bogojina
00050000-560a-8f76-1842-17a3d230bea8	4263	Bohinjska Bela
00050000-560a-8f76-8661-e57e441578e0	4264	Bohinjska Bistrica
00050000-560a-8f76-101a-27510c364b9d	4265	Bohinjsko jezero
00050000-560a-8f76-343d-e809d81a4f2c	1353	Borovnica
00050000-560a-8f76-35ab-772acb79880b	8294	Boštanj
00050000-560a-8f76-eaf9-1c0871d440ac	5230	Bovec
00050000-560a-8f76-a2d4-b88810161a47	5295	Branik
00050000-560a-8f76-6d09-9d7efd9a76f6	3314	Braslovče
00050000-560a-8f76-12ce-958337709c0c	5223	Breginj
00050000-560a-8f76-52ba-e16c97af4636	8280	Brestanica
00050000-560a-8f76-9fbc-c0a8a6eda8f8	2354	Bresternica
00050000-560a-8f76-8ef9-2e78d291503c	4243	Brezje
00050000-560a-8f76-52ad-ff3c11789e86	1351	Brezovica pri Ljubljani
00050000-560a-8f76-d313-12211dde592c	8250	Brežice
00050000-560a-8f76-9f95-015ecbc38f08	4210	Brnik - Aerodrom
00050000-560a-8f76-034c-2de42fe88c0f	8321	Brusnice
00050000-560a-8f76-d0d1-ef9ad6775408	3255	Buče
00050000-560a-8f76-ff33-d1da82ccfc76	8276	Bučka 
00050000-560a-8f76-6c50-77c1b24b2ba1	9261	Cankova
00050000-560a-8f76-8b0a-69ac35613bfe	3000	Celje 
00050000-560a-8f76-c655-4d3a48d0fd4a	3001	Celje - poštni predali
00050000-560a-8f76-0767-8869f73f769f	4207	Cerklje na Gorenjskem
00050000-560a-8f76-41b8-1ac32d7a986a	8263	Cerklje ob Krki
00050000-560a-8f76-3781-e90ddd1371f2	1380	Cerknica
00050000-560a-8f76-f309-a9e4450989d4	5282	Cerkno
00050000-560a-8f76-724f-8684389328c7	2236	Cerkvenjak
00050000-560a-8f76-452e-0dc06a524437	2215	Ceršak
00050000-560a-8f76-4dd0-28121366bb5b	2326	Cirkovce
00050000-560a-8f76-a720-958f45fc5378	2282	Cirkulane
00050000-560a-8f76-ac4f-1c6ccbea8318	5273	Col
00050000-560a-8f76-d44d-380e6e8fb4f3	8251	Čatež ob Savi
00050000-560a-8f76-69af-8d12ee1a0278	1413	Čemšenik
00050000-560a-8f76-3967-cc7bb87c3da3	5253	Čepovan
00050000-560a-8f76-b3d5-a6381abc5e38	9232	Črenšovci
00050000-560a-8f76-fa22-089edc4b1eac	2393	Črna na Koroškem
00050000-560a-8f76-da6f-45b158854850	6275	Črni Kal
00050000-560a-8f76-e66b-baf96daa7cb2	5274	Črni Vrh nad Idrijo
00050000-560a-8f76-4d22-5c0ed5370e37	5262	Črniče
00050000-560a-8f76-60d6-82aa3cf1dd36	8340	Črnomelj
00050000-560a-8f76-7372-ddb579772e8c	6271	Dekani
00050000-560a-8f76-88b4-fca81efac7ff	5210	Deskle
00050000-560a-8f76-72e4-9c6fdf434ad6	2253	Destrnik
00050000-560a-8f76-2a19-52038e5e22d7	6215	Divača
00050000-560a-8f76-84df-c39aa50ce15d	1233	Dob
00050000-560a-8f76-136f-e00da6c8917b	3224	Dobje pri Planini
00050000-560a-8f76-b594-c6decd793617	8257	Dobova
00050000-560a-8f76-2e5c-012019236b12	1423	Dobovec
00050000-560a-8f76-d2e6-f629ff0b3218	5263	Dobravlje
00050000-560a-8f76-ee9d-f59545cdfdd3	3204	Dobrna
00050000-560a-8f76-1872-f7f514332195	8211	Dobrnič
00050000-560a-8f76-ba3a-83f0595898dc	1356	Dobrova
00050000-560a-8f76-c016-58586dbf2234	9223	Dobrovnik/Dobronak 
00050000-560a-8f76-dcdd-0dc6577cae31	5212	Dobrovo v Brdih
00050000-560a-8f76-4ade-ca18dddbb7ee	1431	Dol pri Hrastniku
00050000-560a-8f76-cdb4-ae3c878fecf4	1262	Dol pri Ljubljani
00050000-560a-8f76-140f-e861ebf27e59	1273	Dole pri Litiji
00050000-560a-8f76-fef8-76b73768658d	1331	Dolenja vas
00050000-560a-8f76-a40c-e98588bbf5b0	8350	Dolenjske Toplice
00050000-560a-8f76-0105-dca6e4198813	1230	Domžale
00050000-560a-8f76-f9d1-88c8cce78b37	2252	Dornava
00050000-560a-8f76-66c0-9070db7dfba3	5294	Dornberk
00050000-560a-8f76-2c78-d87097627f63	1319	Draga
00050000-560a-8f76-033d-5b66fe3a3c6d	8343	Dragatuš
00050000-560a-8f76-6bcd-e39d7d47121e	3222	Dramlje
00050000-560a-8f76-8fa1-3f4a13c8021a	2370	Dravograd
00050000-560a-8f76-f464-05ff4d08d7ae	4203	Duplje
00050000-560a-8f76-b649-5b0d1c5b2388	6221	Dutovlje
00050000-560a-8f76-9080-9c366913925c	8361	Dvor
00050000-560a-8f76-85ff-6e4f0c42bb70	2343	Fala
00050000-560a-8f76-9f8f-b223c68d8cc9	9208	Fokovci
00050000-560a-8f76-5934-16b6a7b1af8a	2313	Fram
00050000-560a-8f76-56e4-e3988da4ef4b	3213	Frankolovo
00050000-560a-8f76-f3ab-bb806417141c	1274	Gabrovka
00050000-560a-8f76-76de-fa101ab7ffd9	8254	Globoko
00050000-560a-8f76-42a5-ecfa34a9f5af	5275	Godovič
00050000-560a-8f76-73ed-2edac48a2426	4204	Golnik
00050000-560a-8f76-75f4-43a4dc5d6025	3303	Gomilsko
00050000-560a-8f76-1d2c-106f1860de92	4224	Gorenja vas
00050000-560a-8f76-92f4-f87ba08ad865	3263	Gorica pri Slivnici
00050000-560a-8f76-8f43-bf1b7cce015c	2272	Gorišnica
00050000-560a-8f76-4c65-7dcd8d7ca6ef	9250	Gornja Radgona
00050000-560a-8f76-b494-f4f6713c3ebf	3342	Gornji Grad
00050000-560a-8f76-8cb6-1bbea8be6ef4	4282	Gozd Martuljek
00050000-560a-8f76-d95f-2e16b25780a4	6272	Gračišče
00050000-560a-8f76-b651-8fb4faead43b	9264	Grad
00050000-560a-8f76-2672-5d5cb1fef27f	8332	Gradac
00050000-560a-8f76-9770-f3457b0c42b1	1384	Grahovo
00050000-560a-8f76-3fe2-25f13ccfbf2c	5242	Grahovo ob Bači
00050000-560a-8f76-07ff-4d43cfbc691e	5251	Grgar
00050000-560a-8f76-5f82-c8d48b4f22a7	3302	Griže
00050000-560a-8f76-458d-30990e21246d	3231	Grobelno
00050000-560a-8f76-326d-d44fc9533b7a	1290	Grosuplje
00050000-560a-8f76-f2f4-01d5086bfe46	2288	Hajdina
00050000-560a-8f76-4573-8d7760bccd6f	8362	Hinje
00050000-560a-8f76-d029-120aad369659	2311	Hoče
00050000-560a-8f76-5e7e-14df4985862e	9205	Hodoš/Hodos
00050000-560a-8f76-3e9c-5781dc47b24e	1354	Horjul
00050000-560a-8f76-85f9-a22aea67f889	1372	Hotedršica
00050000-560a-8f76-10fb-bed3a0e1b5ed	1430	Hrastnik
00050000-560a-8f76-6112-0494b539c946	6225	Hruševje
00050000-560a-8f76-d0f2-cfed0518f2d8	4276	Hrušica
00050000-560a-8f76-4c74-ed0a2af992fb	5280	Idrija
00050000-560a-8f76-5d7d-26b2190601d6	1292	Ig
00050000-560a-8f76-cd8c-de4638fce573	6250	Ilirska Bistrica
00050000-560a-8f76-a888-cccda9c8e28d	6251	Ilirska Bistrica-Trnovo
00050000-560a-8f76-556d-a575a1b6e9b3	1295	Ivančna Gorica
00050000-560a-8f76-f33e-ba55b6c8ccc0	2259	Ivanjkovci
00050000-560a-8f76-0b41-52571cc6918b	1411	Izlake
00050000-560a-8f76-ade3-08be5ade699f	6310	Izola/Isola
00050000-560a-8f76-5fab-f2df78eb0b2e	2222	Jakobski Dol
00050000-560a-8f76-0884-5c993972d878	2221	Jarenina
00050000-560a-8f76-4f18-8291e3658be0	6254	Jelšane
00050000-560a-8f76-3e84-2a0483649075	4270	Jesenice
00050000-560a-8f76-c117-76c5b247fcee	8261	Jesenice na Dolenjskem
00050000-560a-8f76-ae4c-75621e0c2a5a	3273	Jurklošter
00050000-560a-8f76-0dd9-0386acb91010	2223	Jurovski Dol
00050000-560a-8f76-b198-b673c6fc831d	2256	Juršinci
00050000-560a-8f76-f11b-aadb49d6ef69	5214	Kal nad Kanalom
00050000-560a-8f76-13fd-b08cc5ad3ef9	3233	Kalobje
00050000-560a-8f76-df64-cdaee8b0a7ac	4246	Kamna Gorica
00050000-560a-8f76-8f5d-297a2266df2f	2351	Kamnica
00050000-560a-8f76-fe5c-a9fa772af93d	1241	Kamnik
00050000-560a-8f76-d974-e29b5ef9965b	5213	Kanal
00050000-560a-8f76-016f-d79c75ac67cf	8258	Kapele
00050000-560a-8f76-de7f-32f28f0d2e3d	2362	Kapla
00050000-560a-8f76-bb95-d9aa986f0303	2325	Kidričevo
00050000-560a-8f76-d7de-2384772b0035	1412	Kisovec
00050000-560a-8f76-eddb-eae13e341914	6253	Knežak
00050000-560a-8f76-44bd-2dba65d98397	5222	Kobarid
00050000-560a-8f76-daf4-82cf7cff66bf	9227	Kobilje
00050000-560a-8f76-da82-e1ac28099522	1330	Kočevje
00050000-560a-8f76-b9a1-566f4edd95f8	1338	Kočevska Reka
00050000-560a-8f76-a85a-dee7c843dd55	2276	Kog
00050000-560a-8f76-26dc-334bdcfe99ef	5211	Kojsko
00050000-560a-8f76-e807-b5cbc7777d75	6223	Komen
00050000-560a-8f76-667f-70e5e338b76a	1218	Komenda
00050000-560a-8f76-f822-de4d36cbe294	6000	Koper/Capodistria 
00050000-560a-8f77-e199-1631ac4868f4	6001	Koper/Capodistria - poštni predali
00050000-560a-8f77-51db-3fb88028f099	8282	Koprivnica
00050000-560a-8f77-464e-854640a7b4d8	5296	Kostanjevica na Krasu
00050000-560a-8f77-0baa-d6d2985279bb	8311	Kostanjevica na Krki
00050000-560a-8f77-c86a-f4d2458a68b9	1336	Kostel
00050000-560a-8f77-4d33-f66010777633	6256	Košana
00050000-560a-8f77-8505-dd57b578dc68	2394	Kotlje
00050000-560a-8f77-6334-64362a7219c3	6240	Kozina
00050000-560a-8f77-31ce-c1bf008c49ae	3260	Kozje
00050000-560a-8f77-3434-0436a0f8b867	4000	Kranj 
00050000-560a-8f77-f46b-97d327421387	4001	Kranj - poštni predali
00050000-560a-8f77-01e1-8960778703c5	4280	Kranjska Gora
00050000-560a-8f77-00dc-6874f5d8117d	1281	Kresnice
00050000-560a-8f77-bb5e-7749d31b4578	4294	Križe
00050000-560a-8f77-375d-469bb47bf941	9206	Križevci
00050000-560a-8f77-8ab3-c969e7b90e1a	9242	Križevci pri Ljutomeru
00050000-560a-8f77-cd3f-f78c0940fd59	1301	Krka
00050000-560a-8f77-91d0-5cc8af00f06b	8296	Krmelj
00050000-560a-8f77-8116-80c827800a38	4245	Kropa
00050000-560a-8f77-c0e6-80fcf151071d	8262	Krška vas
00050000-560a-8f77-f376-64420bc03cf2	8270	Krško
00050000-560a-8f77-7084-f3cb2ab0ae3c	9263	Kuzma
00050000-560a-8f77-8e73-930294d20b68	2318	Laporje
00050000-560a-8f77-5fc3-86e99a7874c3	3270	Laško
00050000-560a-8f77-71e1-68a06349de21	1219	Laze v Tuhinju
00050000-560a-8f77-4706-2657948d488e	2230	Lenart v Slovenskih goricah
00050000-560a-8f77-0aa4-0baaa709eee4	9220	Lendava/Lendva
00050000-560a-8f77-aa9f-d95e82d51ec0	4248	Lesce
00050000-560a-8f77-a8ed-76e6bec3ca96	3261	Lesično
00050000-560a-8f77-4f09-d56ba038f8bc	8273	Leskovec pri Krškem
00050000-560a-8f77-d287-6dcacd9f5bfc	2372	Libeliče
00050000-560a-8f77-7b3c-c92a0053d484	2341	Limbuš
00050000-560a-8f77-e29c-0befc91013ff	1270	Litija
00050000-560a-8f77-6887-a59ecc0da499	3202	Ljubečna
00050000-560a-8f77-b8ff-09fb6b215d39	1000	Ljubljana 
00050000-560a-8f77-58d2-429777cd33c1	1001	Ljubljana - poštni predali
00050000-560a-8f77-ff53-68bc4a7c51d7	1231	Ljubljana - Črnuče
00050000-560a-8f77-8cee-fd1e183dabb6	1261	Ljubljana - Dobrunje
00050000-560a-8f77-eac5-8b9ce4f35524	1260	Ljubljana - Polje
00050000-560a-8f77-09c6-cbe1a31e14b3	1210	Ljubljana - Šentvid
00050000-560a-8f77-d7c3-68c905e98f06	1211	Ljubljana - Šmartno
00050000-560a-8f77-5ad7-c23c3a7875fe	3333	Ljubno ob Savinji
00050000-560a-8f77-0c11-f361a866ae21	9240	Ljutomer
00050000-560a-8f77-2375-ce43ba7c72e9	3215	Loče
00050000-560a-8f77-c7c2-188367f85038	5231	Log pod Mangartom
00050000-560a-8f77-9007-6065ad41c5ba	1358	Log pri Brezovici
00050000-560a-8f77-c47b-406ed8a8fc4a	1370	Logatec
00050000-560a-8f77-efd8-63dfdc53d62d	1371	Logatec
00050000-560a-8f77-4906-5faedd13d943	1434	Loka pri Zidanem Mostu
00050000-560a-8f77-487e-e730d029f478	3223	Loka pri Žusmu
00050000-560a-8f77-b345-3646505d9aa1	6219	Lokev
00050000-560a-8f77-c0e7-689d229910e4	1318	Loški Potok
00050000-560a-8f77-4fb1-7b52cb07d94b	2324	Lovrenc na Dravskem polju
00050000-560a-8f77-45d2-0514076ebafc	2344	Lovrenc na Pohorju
00050000-560a-8f77-a966-5dfe0f8ed2cb	3334	Luče
00050000-560a-8f77-ff6d-77f1796b01ff	1225	Lukovica
00050000-560a-8f77-1ee1-d9a0dde2b9c6	9202	Mačkovci
00050000-560a-8f77-0bdb-e91bdb12dd9f	2322	Majšperk
00050000-560a-8f77-6b1f-15a9bd39148b	2321	Makole
00050000-560a-8f77-ef3e-75511d40044e	9243	Mala Nedelja
00050000-560a-8f77-afbd-cfde21aa6176	2229	Malečnik
00050000-560a-8f77-eaeb-98be7830656b	6273	Marezige
00050000-560a-8f77-af91-bb66289d6d94	2000	Maribor 
00050000-560a-8f77-79be-2235212ac1df	2001	Maribor - poštni predali
00050000-560a-8f77-429b-7fb991338815	2206	Marjeta na Dravskem polju
00050000-560a-8f77-af38-f427cdc0353d	2281	Markovci
00050000-560a-8f77-f5c9-379f21bae4a7	9221	Martjanci
00050000-560a-8f77-fe6b-06a2b3a49f86	6242	Materija
00050000-560a-8f77-a41c-460886674b61	4211	Mavčiče
00050000-560a-8f77-a816-09936708eb3a	1215	Medvode
00050000-560a-8f77-c414-80c250f1335f	1234	Mengeš
00050000-560a-8f77-0d63-6645355c3b6d	8330	Metlika
00050000-560a-8f77-0fb7-30c752692d76	2392	Mežica
00050000-560a-8f77-0e08-ef1e70f5faa1	2204	Miklavž na Dravskem polju
00050000-560a-8f77-af49-f049a999e402	2275	Miklavž pri Ormožu
00050000-560a-8f77-9e34-9c9242831e69	5291	Miren
00050000-560a-8f77-1319-7821dd493e68	8233	Mirna
00050000-560a-8f77-c18a-aa59012f0517	8216	Mirna Peč
00050000-560a-8f77-da07-26ed72d7e94f	2382	Mislinja
00050000-560a-8f77-17c0-1c05b713865e	4281	Mojstrana
00050000-560a-8f77-9460-9ffade38f7da	8230	Mokronog
00050000-560a-8f77-90db-a08227fd20f6	1251	Moravče
00050000-560a-8f77-99b2-6d7599a8bebb	9226	Moravske Toplice
00050000-560a-8f77-15ce-38b02556c431	5216	Most na Soči
00050000-560a-8f77-8920-9f1eb6e83228	1221	Motnik
00050000-560a-8f77-755c-216e92c1e66a	3330	Mozirje
00050000-560a-8f77-e677-1035c214931c	9000	Murska Sobota 
00050000-560a-8f77-1298-2d9bf7b0289c	9001	Murska Sobota - poštni predali
00050000-560a-8f77-ebd3-6cef80c45de1	2366	Muta
00050000-560a-8f77-8d68-b962ac7c1411	4202	Naklo
00050000-560a-8f77-2cd1-02484ab4b7a9	3331	Nazarje
00050000-560a-8f77-bfdf-ea3b09f465c2	1357	Notranje Gorice
00050000-560a-8f77-b937-ce04ef6797cc	3203	Nova Cerkev
00050000-560a-8f77-41db-9581ee2e5f19	5000	Nova Gorica 
00050000-560a-8f77-cdda-6825214c44aa	5001	Nova Gorica - poštni predali
00050000-560a-8f77-9b15-807f4ddff9e4	1385	Nova vas
00050000-560a-8f77-537f-28e8e79a716f	8000	Novo mesto
00050000-560a-8f77-1cc0-d738306bf652	8001	Novo mesto - poštni predali
00050000-560a-8f77-a493-5647b785eeab	6243	Obrov
00050000-560a-8f77-dfd1-74cbe5cf402a	9233	Odranci
00050000-560a-8f77-fd32-c3cf8f069908	2317	Oplotnica
00050000-560a-8f77-f638-f0c38e2582fb	2312	Orehova vas
00050000-560a-8f77-a358-ce5a5cd7ee73	2270	Ormož
00050000-560a-8f77-9f90-8feeef59a94d	1316	Ortnek
00050000-560a-8f77-7cb9-3b611e0201d3	1337	Osilnica
00050000-560a-8f77-d51a-a6f7a7f43903	8222	Otočec
00050000-560a-8f77-8d5f-b3167a972874	2361	Ožbalt
00050000-560a-8f77-9334-d983699e80c9	2231	Pernica
00050000-560a-8f77-5fab-1b38b86aff98	2211	Pesnica pri Mariboru
00050000-560a-8f77-a67f-82b71cc51719	9203	Petrovci
00050000-560a-8f77-6cc8-f82c4d40759b	3301	Petrovče
00050000-560a-8f77-5be9-4b8a33dc24ba	6330	Piran/Pirano
00050000-560a-8f77-ee26-244364c3b658	8255	Pišece
00050000-560a-8f77-a80f-4e69b03b613a	6257	Pivka
00050000-560a-8f77-a94a-9db071b72736	6232	Planina
00050000-560a-8f77-5ba7-45292b0af7a1	3225	Planina pri Sevnici
00050000-560a-8f77-5ad8-08556e030459	6276	Pobegi
00050000-560a-8f77-ada7-f52f24a5f6ba	8312	Podbočje
00050000-560a-8f77-7006-9200e2f56d93	5243	Podbrdo
00050000-560a-8f77-ec53-769d029b742b	3254	Podčetrtek
00050000-560a-8f77-f797-9df727c334a6	2273	Podgorci
00050000-560a-8f77-7dbb-46cf17986fa2	6216	Podgorje
00050000-560a-8f77-0b48-398ff2908edd	2381	Podgorje pri Slovenj Gradcu
00050000-560a-8f77-3156-d9afa5941545	6244	Podgrad
00050000-560a-8f77-de76-3ddcb2aff9e8	1414	Podkum
00050000-560a-8f77-ea75-750b7f3c9856	2286	Podlehnik
00050000-560a-8f77-d6f1-45951dfee920	5272	Podnanos
00050000-560a-8f77-1e57-82b136566025	4244	Podnart
00050000-560a-8f77-1b1f-c2b2d932fc76	3241	Podplat
00050000-560a-8f77-afe6-d4ee9db1d549	3257	Podsreda
00050000-560a-8f77-dea6-3887ab119022	2363	Podvelka
00050000-560a-8f77-d1d7-a53877486b66	2208	Pohorje
00050000-560a-8f77-86ae-7977ccdb64fd	2257	Polenšak
00050000-560a-8f77-4c7c-073600f13cf3	1355	Polhov Gradec
00050000-560a-8f77-e6dd-3f5b99268390	4223	Poljane nad Škofjo Loko
00050000-560a-8f77-39ba-8938b6e86fd2	2319	Poljčane
00050000-560a-8f77-3bc6-fcb0725c57d0	1272	Polšnik
00050000-560a-8f77-3f67-a5f4c05b85f1	3313	Polzela
00050000-560a-8f77-36da-b671c374310f	3232	Ponikva
00050000-560a-8f77-19df-b735b18f290e	6320	Portorož/Portorose
00050000-560a-8f77-ddc3-75dece68ca8f	6230	Postojna
00050000-560a-8f77-2ef0-6f5e291748df	2331	Pragersko
00050000-560a-8f77-0fc1-d1acee594128	3312	Prebold
00050000-560a-8f77-08d6-c9e32279bae2	4205	Preddvor
00050000-560a-8f77-558b-7571a4a38159	6255	Prem
00050000-560a-8f77-5eb4-ca7ebabdad10	1352	Preserje
00050000-560a-8f77-95fe-3498ed2753b2	6258	Prestranek
00050000-560a-8f77-3906-c6dc3c87434c	2391	Prevalje
00050000-560a-8f77-dff0-c61cb009a194	3262	Prevorje
00050000-560a-8f77-089c-be4c6eac051e	1276	Primskovo 
00050000-560a-8f77-7875-204dbd9eacfd	3253	Pristava pri Mestinju
00050000-560a-8f77-d7b9-d0aaf84cf6e6	9207	Prosenjakovci/Partosfalva
00050000-560a-8f77-6dda-573cc0911da8	5297	Prvačina
00050000-560a-8f77-69a7-73e824d6bd00	2250	Ptuj
00050000-560a-8f77-ef5c-dce907729e80	2323	Ptujska Gora
00050000-560a-8f77-6c3f-22cdc5fc611f	9201	Puconci
00050000-560a-8f77-06fc-f27d3cf32242	2327	Rače
00050000-560a-8f77-9f16-eba01b27b820	1433	Radeče
00050000-560a-8f77-f549-cf22d9c94f54	9252	Radenci
00050000-560a-8f77-7f28-f59c34e6ba34	2360	Radlje ob Dravi
00050000-560a-8f77-bc95-e3ef46a938c8	1235	Radomlje
00050000-560a-8f77-bfa1-2b57c3dc0b42	4240	Radovljica
00050000-560a-8f77-4c82-e450df2eb2a1	8274	Raka
00050000-560a-8f77-26a0-97a5cc179e4a	1381	Rakek
00050000-560a-8f77-3559-659ed26dfe93	4283	Rateče - Planica
00050000-560a-8f77-726c-f2c9fc966cb0	2390	Ravne na Koroškem
00050000-560a-8f77-f9f1-7f3ef72ff5a6	9246	Razkrižje
00050000-560a-8f77-3f93-c5bf951153b1	3332	Rečica ob Savinji
00050000-560a-8f77-2823-2d1365ec23f8	5292	Renče
00050000-560a-8f77-1a8a-a8306feba3b7	1310	Ribnica
00050000-560a-8f77-c026-452b1f29d2a6	2364	Ribnica na Pohorju
00050000-560a-8f77-ad45-db8d77a93ac1	3272	Rimske Toplice
00050000-560a-8f77-34cb-735a7c055af6	1314	Rob
00050000-560a-8f77-18b1-40e1eb1b3ac5	5215	Ročinj
00050000-560a-8f77-2765-8397fa42fd7d	3250	Rogaška Slatina
00050000-560a-8f77-a7ed-6aa8b56b31e5	9262	Rogašovci
00050000-560a-8f77-3d31-ff2dcb1e3443	3252	Rogatec
00050000-560a-8f77-9c30-0ac4badda8cc	1373	Rovte
00050000-560a-8f77-bb8f-997588eec984	2342	Ruše
00050000-560a-8f77-1775-0a63503cb438	1282	Sava
00050000-560a-8f77-ddf9-9c37c3463be7	6333	Sečovlje/Sicciole
00050000-560a-8f77-9bf0-2c874af11227	4227	Selca
00050000-560a-8f77-b88f-248dba5538f0	2352	Selnica ob Dravi
00050000-560a-8f77-d659-0ab83f6bebc0	8333	Semič
00050000-560a-8f77-7e01-a5f662573661	8281	Senovo
00050000-560a-8f77-51ef-cb7ac10b9d4e	6224	Senožeče
00050000-560a-8f77-1ada-718584bb801b	8290	Sevnica
00050000-560a-8f77-325a-61dda13e9ef6	6210	Sežana
00050000-560a-8f77-1522-3835a1ea7dd3	2214	Sladki Vrh
00050000-560a-8f77-a420-66513199440d	5283	Slap ob Idrijci
00050000-560a-8f77-8a75-601eafb75395	2380	Slovenj Gradec
00050000-560a-8f77-4d10-da48eb163938	2310	Slovenska Bistrica
00050000-560a-8f77-b557-7a36015c6e9e	3210	Slovenske Konjice
00050000-560a-8f77-148d-81a53fd954f1	1216	Smlednik
00050000-560a-8f77-919e-2e39c94d0cf8	5232	Soča
00050000-560a-8f77-a199-2a15e5c75e36	1317	Sodražica
00050000-560a-8f77-8e3c-d9027c35dddc	3335	Solčava
00050000-560a-8f77-9ab2-50783e5880f8	5250	Solkan
00050000-560a-8f77-ed9d-d79d412f5ded	4229	Sorica
00050000-560a-8f77-77e4-3a5b42c24734	4225	Sovodenj
00050000-560a-8f77-c307-68d9fb04d5a3	5281	Spodnja Idrija
00050000-560a-8f77-df34-f7297d1d8303	2241	Spodnji Duplek
00050000-560a-8f77-697e-9dd15a79a776	9245	Spodnji Ivanjci
00050000-560a-8f77-14e4-3cab386e8973	2277	Središče ob Dravi
00050000-560a-8f77-3e90-6b7de68f4965	4267	Srednja vas v Bohinju
00050000-560a-8f77-0803-2dedaeec571d	8256	Sromlje 
00050000-560a-8f77-8c18-ff1bdf14a999	5224	Srpenica
00050000-560a-8f77-8d97-e637f63bdf3f	1242	Stahovica
00050000-560a-8f77-1e15-60075c4f5d2d	1332	Stara Cerkev
00050000-560a-8f77-fbd8-651be0b80841	8342	Stari trg ob Kolpi
00050000-560a-8f77-5b6a-59b4f5e3c6a7	1386	Stari trg pri Ložu
00050000-560a-8f77-78eb-a5807c8663ee	2205	Starše
00050000-560a-8f77-2e3b-3c21969fd36c	2289	Stoperce
00050000-560a-8f77-6617-cc76aa47e5e2	8322	Stopiče
00050000-560a-8f77-310d-39308dc84c60	3206	Stranice
00050000-560a-8f77-c1b8-9434844c410c	8351	Straža
00050000-560a-8f77-0e1a-f22f019befa8	1313	Struge
00050000-560a-8f77-12c2-ab14768a527f	8293	Studenec
00050000-560a-8f77-36aa-058aca85791d	8331	Suhor
00050000-560a-8f77-f89b-8a4e4acb6077	2233	Sv. Ana v Slovenskih goricah
00050000-560a-8f77-600b-edc043438aa2	2235	Sv. Trojica v Slovenskih goricah
00050000-560a-8f77-6184-9fa779e558cc	2353	Sveti Duh na Ostrem Vrhu
00050000-560a-8f77-7df5-63dacb51e56c	9244	Sveti Jurij ob Ščavnici
00050000-560a-8f77-5291-ee9f57946878	3264	Sveti Štefan
00050000-560a-8f77-1980-3d59a3274576	2258	Sveti Tomaž
00050000-560a-8f77-c8c6-d273f113ee1b	9204	Šalovci
00050000-560a-8f77-cae8-308d78a1c19d	5261	Šempas
00050000-560a-8f77-355c-554d896a3502	5290	Šempeter pri Gorici
00050000-560a-8f77-b4de-910a8a88b49a	3311	Šempeter v Savinjski dolini
00050000-560a-8f77-9070-b1bc94833ea7	4208	Šenčur
00050000-560a-8f77-3402-f2cd3e92db06	2212	Šentilj v Slovenskih goricah
00050000-560a-8f77-4a4b-b893b1d7473c	8297	Šentjanž
00050000-560a-8f77-f77d-f94547acd7bd	2373	Šentjanž pri Dravogradu
00050000-560a-8f77-546d-bb7565051767	8310	Šentjernej
00050000-560a-8f77-ff33-8816db840ad1	3230	Šentjur
00050000-560a-8f77-759a-cfbc100591f8	3271	Šentrupert
00050000-560a-8f77-3fc7-f7fe5473a1b9	8232	Šentrupert
00050000-560a-8f77-976b-22df05b8635a	1296	Šentvid pri Stični
00050000-560a-8f77-6bca-87f59e50c8c5	8275	Škocjan
00050000-560a-8f77-228a-edd710ebfcc4	6281	Škofije
00050000-560a-8f77-054e-bfc8b9a0edeb	4220	Škofja Loka
00050000-560a-8f77-7fa7-ee060f52de0e	3211	Škofja vas
00050000-560a-8f77-5c0a-2dd391f46050	1291	Škofljica
00050000-560a-8f77-b919-7aaecae834c0	6274	Šmarje
00050000-560a-8f77-4c94-5a3c9849c94e	1293	Šmarje - Sap
00050000-560a-8f77-9e21-17e80c9fd37a	3240	Šmarje pri Jelšah
00050000-560a-8f77-ac79-6bd49695ac74	8220	Šmarješke Toplice
00050000-560a-8f77-016c-8bb85af50153	2315	Šmartno na Pohorju
00050000-560a-8f77-fb45-b66792e57ecd	3341	Šmartno ob Dreti
00050000-560a-8f77-71bf-4356756351b7	3327	Šmartno ob Paki
00050000-560a-8f77-fe6f-74c78b59b1f5	1275	Šmartno pri Litiji
00050000-560a-8f77-bfeb-8d30f82dcac5	2383	Šmartno pri Slovenj Gradcu
00050000-560a-8f77-1eed-726162c9d8d3	3201	Šmartno v Rožni dolini
00050000-560a-8f77-b4f5-76f57d4616c5	3325	Šoštanj
00050000-560a-8f77-f993-c900fd551514	6222	Štanjel
00050000-560a-8f77-228a-f9c7f994fcc7	3220	Štore
00050000-560a-8f77-1bcb-0052a56ed6fa	3304	Tabor
00050000-560a-8f77-a70b-642471cce5a8	3221	Teharje
00050000-560a-8f77-f47b-1ca861b11081	9251	Tišina
00050000-560a-8f77-aca2-8740d93cf37b	5220	Tolmin
00050000-560a-8f77-f4e7-9d7a27152508	3326	Topolšica
00050000-560a-8f77-ecd6-e20141722cb5	2371	Trbonje
00050000-560a-8f77-45f6-9a15d604813b	1420	Trbovlje
00050000-560a-8f77-5be2-550dc6a26bf9	8231	Trebelno 
00050000-560a-8f77-ea1b-07dbabaa98e0	8210	Trebnje
00050000-560a-8f77-0570-c947cc2c1a83	5252	Trnovo pri Gorici
00050000-560a-8f77-8a65-99532c748af0	2254	Trnovska vas
00050000-560a-8f77-76f7-f5c8c14c2e48	1222	Trojane
00050000-560a-8f77-1260-5fe8a1429eb1	1236	Trzin
00050000-560a-8f77-80e4-7ee0dc2e4aa9	4290	Tržič
00050000-560a-8f77-e60d-ae7c0f692dc3	8295	Tržišče
00050000-560a-8f77-e418-fb5d1ad38ad8	1311	Turjak
00050000-560a-8f77-9a14-dd0aab04a0e8	9224	Turnišče
00050000-560a-8f77-a5b3-5ca4f2b144e8	8323	Uršna sela
00050000-560a-8f77-00fc-11313ba500e6	1252	Vače
00050000-560a-8f77-9591-2128bc68ecb9	3320	Velenje 
00050000-560a-8f77-7f5a-0600f106be82	3322	Velenje - poštni predali
00050000-560a-8f77-b7c9-6773c3970bcb	8212	Velika Loka
00050000-560a-8f77-c2b9-ea8838e7ea3f	2274	Velika Nedelja
00050000-560a-8f77-fa8f-fdcc0a1acbcb	9225	Velika Polana
00050000-560a-8f77-07d6-313fb17e9265	1315	Velike Lašče
00050000-560a-8f77-ee16-4b4050f0f70c	8213	Veliki Gaber
00050000-560a-8f77-1937-979b406d3add	9241	Veržej
00050000-560a-8f77-6aed-e48985ef18ad	1312	Videm - Dobrepolje
00050000-560a-8f77-23ad-468e4393a1f3	2284	Videm pri Ptuju
00050000-560a-8f77-50b1-ba041c7231f7	8344	Vinica
00050000-560a-8f77-5646-3816ffe1f3d0	5271	Vipava
00050000-560a-8f77-c30a-20feb5046d35	4212	Visoko
00050000-560a-8f77-6fd0-d7f57acf3429	1294	Višnja Gora
00050000-560a-8f77-3c39-f4966187e0d6	3205	Vitanje
00050000-560a-8f77-e8ad-bc94fa052e3a	2255	Vitomarci
00050000-560a-8f77-1dbc-22f2a46b7013	1217	Vodice
00050000-560a-8f77-1e6f-2366323428b1	3212	Vojnik\t
00050000-560a-8f77-91f9-c8d140095267	5293	Volčja Draga
00050000-560a-8f77-eaca-77a70060cbf9	2232	Voličina
00050000-560a-8f77-b111-db780899b988	3305	Vransko
00050000-560a-8f77-ba2f-9de3b9ed6e2b	6217	Vremski Britof
00050000-560a-8f77-9254-163e859650d8	1360	Vrhnika
00050000-560a-8f77-414c-e0599486d98f	2365	Vuhred
00050000-560a-8f77-f4a8-6c94aa2a8af1	2367	Vuzenica
00050000-560a-8f77-5bc5-69ae46394147	8292	Zabukovje 
00050000-560a-8f77-2f7d-0bf689642339	1410	Zagorje ob Savi
00050000-560a-8f77-b77b-ee3c3665099f	1303	Zagradec
00050000-560a-8f77-497d-e1c0468dc572	2283	Zavrč
00050000-560a-8f77-831a-b1efd1469d91	8272	Zdole 
00050000-560a-8f77-0863-b8d794c8df98	4201	Zgornja Besnica
00050000-560a-8f77-073e-09126ce97b35	2242	Zgornja Korena
00050000-560a-8f77-7e7f-e8079d5ef433	2201	Zgornja Kungota
00050000-560a-8f77-f19d-464114cc6f06	2316	Zgornja Ložnica
00050000-560a-8f77-889b-f92ab096dc1a	2314	Zgornja Polskava
00050000-560a-8f77-fbe8-6926d479f4d2	2213	Zgornja Velka
00050000-560a-8f77-6848-8f9625dc57d7	4247	Zgornje Gorje
00050000-560a-8f77-573f-d99c728884f7	4206	Zgornje Jezersko
00050000-560a-8f77-ce7f-51ce35a07f10	2285	Zgornji Leskovec
00050000-560a-8f77-20f7-a39a5979740e	1432	Zidani Most
00050000-560a-8f77-7d71-33346d7cb436	3214	Zreče
00050000-560a-8f77-7125-2d73c7654302	4209	Žabnica
00050000-560a-8f77-5d2d-55344bf90dd2	3310	Žalec
00050000-560a-8f77-e556-70badddef545	4228	Železniki
00050000-560a-8f77-ec56-3b22207d70c2	2287	Žetale
00050000-560a-8f77-74af-bbd220b75889	4226	Žiri
00050000-560a-8f77-4ddc-fe8e13d13cf0	4274	Žirovnica
00050000-560a-8f77-e7e9-0cc472844a08	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 21055345)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 21054967)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 21054747)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-560a-8f79-c591-3a9c3c4f621b	00080000-560a-8f79-9f6a-c5efed316cd1	\N	00040000-560a-8f77-fecb-2f7860af8179	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-560a-8f79-74b0-0d202787e06a	00080000-560a-8f79-9f6a-c5efed316cd1	\N	00040000-560a-8f77-fecb-2f7860af8179	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-560a-8f79-6b6a-1c48c2cf4d7a	00080000-560a-8f79-8d30-3626e3e60580	\N	00040000-560a-8f77-fecb-2f7860af8179	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 21054851)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, objavljenzacetek, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 21054979)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 21055359)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 21055369)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-560a-8f79-581e-9722a813b72a	00080000-560a-8f79-cd41-e74049d943cf	0987	AK
00190000-560a-8f79-c73e-f93e75075248	00080000-560a-8f79-8d30-3626e3e60580	0989	AK
00190000-560a-8f79-c06d-23512be2a728	00080000-560a-8f79-9782-9faa5c6de544	0986	AK
00190000-560a-8f79-8f9d-c06511132125	00080000-560a-8f79-68b7-9e694b360bee	0984	AK
00190000-560a-8f79-779e-4abaa0a87dce	00080000-560a-8f79-f984-5341a3522239	0983	AK
00190000-560a-8f79-2c1a-d87b49f985d2	00080000-560a-8f79-ae39-f22f450161f2	0982	AK
00190000-560a-8f7a-bd3b-caabaca4e1b5	00080000-560a-8f7a-82e1-d243a2f5dc41	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 21055302)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-560a-8f79-4a4f-45fca0c17187	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 21055377)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 21055008)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-560a-8f79-e725-47a13887cc66	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-560a-8f79-7e61-37e561f7bc3f	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-560a-8f79-9b70-109f54c87cab	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-560a-8f79-9f89-880ee95eb3cf	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-560a-8f79-26d1-313441624396	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-560a-8f79-1cc0-a7427f506f75	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-560a-8f79-c006-5fc3dfabb23e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 21054952)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 21054942)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 21055152)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 21055082)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 21054825)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 21054620)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-560a-8f7a-82e1-d243a2f5dc41	00010000-560a-8f77-8d82-4ad76e58ed10	2015-09-29 15:17:46	INS	a:0:{}
2	App\\Entity\\Option	00000000-560a-8f7a-b06f-f3c3319b91b9	00010000-560a-8f77-8d82-4ad76e58ed10	2015-09-29 15:17:46	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-560a-8f7a-bd3b-caabaca4e1b5	00010000-560a-8f77-8d82-4ad76e58ed10	2015-09-29 15:17:46	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 21055021)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 21054658)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-560a-8f77-08e4-b69b6c139c00	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-560a-8f77-8c2c-76a57dd5c7b3	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-560a-8f77-9c43-11a32831ccf9	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-560a-8f77-681e-e311e9b80b96	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-560a-8f77-0d7c-71f7afe94e5d	planer	Planer dogodkov v koledarju	t
00020000-560a-8f77-766d-38f99bc2d167	kadrovska	Kadrovska služba	t
00020000-560a-8f77-4fc6-745760c12607	arhivar	Ažuriranje arhivalij	t
00020000-560a-8f77-b0ca-d475f71979a2	igralec	Igralec	t
00020000-560a-8f77-2597-9f9d33ad266a	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-560a-8f79-e4e0-0cb683f113d6	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 21054642)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-560a-8f77-d3d9-db10ba0d9d27	00020000-560a-8f77-9c43-11a32831ccf9
00010000-560a-8f77-8d82-4ad76e58ed10	00020000-560a-8f77-9c43-11a32831ccf9
00010000-560a-8f79-6e74-d53625584fda	00020000-560a-8f79-e4e0-0cb683f113d6
\.


--
-- TOC entry 3010 (class 0 OID 21055035)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 21054973)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 21054919)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 21054607)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-560a-8f77-5692-c2715a526b38	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-560a-8f77-a478-0019c6f194f2	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-560a-8f77-7738-9b9d933c66b6	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-560a-8f77-5ddb-436ee243aa26	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-560a-8f77-07e2-1758df3ebc21	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 21054599)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-560a-8f77-b08b-68449a6fb028	00230000-560a-8f77-5ddb-436ee243aa26	popa
00240000-560a-8f77-df7a-7d4085edaf51	00230000-560a-8f77-5ddb-436ee243aa26	oseba
00240000-560a-8f77-6777-7dfc2ed58dd4	00230000-560a-8f77-5ddb-436ee243aa26	sezona
00240000-560a-8f77-e58d-fa542cd1892a	00230000-560a-8f77-a478-0019c6f194f2	prostor
00240000-560a-8f77-a050-4725ebc04edd	00230000-560a-8f77-5ddb-436ee243aa26	besedilo
00240000-560a-8f77-e52e-9ceba7a3c3c8	00230000-560a-8f77-5ddb-436ee243aa26	uprizoritev
00240000-560a-8f77-9f1a-37aac148a121	00230000-560a-8f77-5ddb-436ee243aa26	funkcija
00240000-560a-8f77-1079-ed1990cb29a9	00230000-560a-8f77-5ddb-436ee243aa26	tipfunkcije
00240000-560a-8f77-3408-2840976168bf	00230000-560a-8f77-5ddb-436ee243aa26	alternacija
00240000-560a-8f77-f156-9648df992f83	00230000-560a-8f77-5692-c2715a526b38	pogodba
00240000-560a-8f77-a265-05658bf758c0	00230000-560a-8f77-5ddb-436ee243aa26	zaposlitev
00240000-560a-8f77-ea3e-905e129580c5	00230000-560a-8f77-5ddb-436ee243aa26	zvrstuprizoritve
00240000-560a-8f77-b03b-ca83cc0bfbe6	00230000-560a-8f77-5692-c2715a526b38	programdela
00240000-560a-8f77-f343-fec67fc735cd	00230000-560a-8f77-5ddb-436ee243aa26	zapis
\.


--
-- TOC entry 2967 (class 0 OID 21054594)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
2c4f694e-1bc7-409d-8107-ac94602e4c66	00240000-560a-8f77-b08b-68449a6fb028	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 21055099)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-560a-8f79-d53f-6f8777f7e882	000e0000-560a-8f79-ba51-03f451225bac	00080000-560a-8f79-9f6a-c5efed316cd1	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-560a-8f77-f106-dd5656fdb7fa
00270000-560a-8f79-c5b4-615d65cf67e0	000e0000-560a-8f79-ba51-03f451225bac	00080000-560a-8f79-9f6a-c5efed316cd1	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-560a-8f77-f106-dd5656fdb7fa
\.


--
-- TOC entry 2980 (class 0 OID 21054720)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 21054929)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-560a-8f79-5eb8-c93b698c9c73	00180000-560a-8f79-b540-279f17443ee4	000c0000-560a-8f79-bde8-ca29841ea74e	00090000-560a-8f79-8da0-2371c8b02c5e	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-8f79-3868-d1a7288594df	00180000-560a-8f79-b540-279f17443ee4	000c0000-560a-8f79-6bd4-1a2d6530e756	00090000-560a-8f79-75e3-02ef29b01a52	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-8f79-0fae-51d3d1a821e8	00180000-560a-8f79-b540-279f17443ee4	000c0000-560a-8f79-b77d-d96eb2584b06	00090000-560a-8f79-9e97-25f8a8e4fbde	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-8f79-c7a5-29092c864977	00180000-560a-8f79-b540-279f17443ee4	000c0000-560a-8f79-5622-c81e205b6dd9	00090000-560a-8f79-fef3-7d39b37220e3	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-8f79-30f8-00ac25d47749	00180000-560a-8f79-b540-279f17443ee4	000c0000-560a-8f79-54f8-de88639c9ad0	00090000-560a-8f79-34d5-9b20185af4ba	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-8f79-8722-5cf85f07dbc9	00180000-560a-8f79-1b32-4749e87e733b	\N	00090000-560a-8f79-34d5-9b20185af4ba	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 21055140)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-560a-8f77-9b8d-f72ad65905bc	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-560a-8f77-77b1-703240414789	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-560a-8f77-30ca-543f6401a9d4	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-560a-8f77-1314-5a87b9c7fd27	04	Režija	Režija	Režija	umetnik	30
000f0000-560a-8f77-e1d5-adc5a9052263	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-560a-8f77-a50c-bcbedaf35faf	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-560a-8f77-0523-084d9bfc0194	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-560a-8f77-cc05-f1a0dc89e6c9	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-560a-8f77-78e2-02a56d854a00	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-560a-8f77-ab8c-1f9e05963fb4	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-560a-8f77-5908-0a9f95a0229d	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-560a-8f77-821d-c369ce1349aa	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-560a-8f77-09b2-e90b04b4aa5b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-560a-8f77-44e3-75fb24d9d8c9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-560a-8f77-1bce-15d66c5f8510	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-560a-8f77-ebbd-5c83dbc4c930	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-560a-8f77-3db3-01547995d92f	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-560a-8f77-71f5-b4a374a7aac7	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 21055388)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-560a-8f77-a00a-f0bcb6d967fd	01	Velika predstava	f	1.00	1.00
002b0000-560a-8f77-2ce8-b64824a619a9	02	Mala predstava	f	0.50	0.50
002b0000-560a-8f77-7981-c9ddaccbe3d1	03	Mala koprodukcija	t	0.40	1.00
002b0000-560a-8f77-3e9a-fdc7e926b24e	04	Srednja koprodukcija	t	0.70	2.00
002b0000-560a-8f77-9c9b-fc3da87667d1	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 21054782)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 21054629)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-560a-8f77-8d82-4ad76e58ed10	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROhc0HlfpJTm6vnJ0ammsUN3RDUlgj.e2	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-560a-8f79-ccda-da74dc0a11dd	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-560a-8f79-e8ed-6f822d103862	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-560a-8f79-767e-cff45a89545d	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-560a-8f79-ba26-ec7a7602c1fc	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-560a-8f79-f1c4-5337093c5024	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-560a-8f79-f2c5-1d990635d2b7	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-560a-8f79-97e5-6281a7350a3d	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-560a-8f79-aa64-9b8d909696b7	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-560a-8f79-03f5-be52feb7be26	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-560a-8f79-6e74-d53625584fda	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-560a-8f77-d3d9-db10ba0d9d27	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 21055190)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-560a-8f79-a048-b12889cb7d37	00160000-560a-8f79-2fcf-add493651676	\N	00140000-560a-8f77-6452-9b51e7064005	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-560a-8f79-26d1-313441624396
000e0000-560a-8f79-ba51-03f451225bac	00160000-560a-8f79-9c82-6329ffb12786	\N	00140000-560a-8f77-2e64-9e451512b573	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-560a-8f79-1cc0-a7427f506f75
000e0000-560a-8f79-7c8f-4d286c9003aa	\N	\N	00140000-560a-8f77-2e64-9e451512b573	00190000-560a-8f79-581e-9722a813b72a	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-8f79-26d1-313441624396
000e0000-560a-8f79-23cf-682b0ded7d8d	\N	\N	00140000-560a-8f77-2e64-9e451512b573	00190000-560a-8f79-581e-9722a813b72a	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-8f79-26d1-313441624396
000e0000-560a-8f79-f0c0-229be0ed3b10	\N	\N	00140000-560a-8f77-2e64-9e451512b573	00190000-560a-8f79-581e-9722a813b72a	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-8f79-e725-47a13887cc66
000e0000-560a-8f79-8ca0-1270b1b16ed8	\N	\N	00140000-560a-8f77-2e64-9e451512b573	00190000-560a-8f79-581e-9722a813b72a	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-8f79-e725-47a13887cc66
\.


--
-- TOC entry 2992 (class 0 OID 21054873)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-560a-8f79-fb1d-cb03495d02f2	000e0000-560a-8f79-ba51-03f451225bac	\N	1	
00200000-560a-8f79-baa0-17377a4491db	000e0000-560a-8f79-ba51-03f451225bac	\N	2	
00200000-560a-8f79-18d0-7d75626c7a82	000e0000-560a-8f79-ba51-03f451225bac	\N	3	
00200000-560a-8f79-e03a-60aeed59ff7f	000e0000-560a-8f79-ba51-03f451225bac	\N	4	
00200000-560a-8f79-01a4-f283ece358df	000e0000-560a-8f79-ba51-03f451225bac	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 21055000)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 21055113)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-560a-8f77-34c6-14bbd9d933f0	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-560a-8f77-f22f-817dfdb9363f	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-560a-8f77-c969-747717689a29	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-560a-8f77-e9f3-6610e8049a90	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-560a-8f77-8c11-6c09ada656d8	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-560a-8f77-3e2d-364a811d838e	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-560a-8f77-74d9-e2ad9b4c6444	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-560a-8f77-b7f5-fe28c26ba298	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-560a-8f77-f106-dd5656fdb7fa	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-560a-8f77-2fda-210ee226a357	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-560a-8f77-3c2b-0f990734e5da	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-560a-8f77-d742-02c9c95a9b36	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-560a-8f77-79d5-8bf59209a2e2	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-560a-8f77-03aa-d6ad7a8d3f35	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-560a-8f77-b145-008da4768bc5	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-560a-8f77-ea8c-50d707ad49d7	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-560a-8f77-8c38-b99c03c5488e	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-560a-8f77-b4e5-e120babaf61d	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-560a-8f77-ce11-1197603d6d97	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-560a-8f77-ad6b-d7e279426c35	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-560a-8f77-cf28-f3e41b603e40	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-560a-8f77-973b-ccf73b297e2e	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-560a-8f77-32e5-71f893d6df8f	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-560a-8f77-482e-947b058cf7d0	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-560a-8f77-1df1-71e0a1b816c5	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-560a-8f77-9af6-d6e8c9dd04f0	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-560a-8f77-e1ba-f47bd22adb90	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-560a-8f77-3357-c6cf3aed25ab	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 21055435)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 21055407)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 21055447)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 21055072)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-560a-8f79-e168-e49dcdf0e73b	00090000-560a-8f79-75e3-02ef29b01a52	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-8f79-2395-e5bc13c7b5a2	00090000-560a-8f79-9e97-25f8a8e4fbde	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-8f79-bff3-e5eee0ef23ed	00090000-560a-8f79-143f-057c26d90306	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-8f79-ca7e-6fbedca29762	00090000-560a-8f79-abd6-26d309a7aefb	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-8f79-9233-188e80f26501	00090000-560a-8f79-8da0-2371c8b02c5e	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-8f79-f224-d9c4f2128a20	00090000-560a-8f79-a0c0-1ff5c8f7abc1	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 21054908)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 21055180)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-560a-8f77-6452-9b51e7064005	01	Drama	drama (SURS 01)
00140000-560a-8f77-7600-c7a142cb4d3f	02	Opera	opera (SURS 02)
00140000-560a-8f77-5832-cc37c0c97457	03	Balet	balet (SURS 03)
00140000-560a-8f77-716c-3549e347a00f	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-560a-8f77-bc90-b77e452a43d1	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-560a-8f77-2e64-9e451512b573	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-560a-8f77-c1c8-37af3d1fedc1	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 21055062)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 21054683)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 21055239)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 21055229)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 21055096)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 21055138)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 21055487)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 21054897)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 21054918)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 21055405)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 21054808)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 21055296)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 21055058)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 21054871)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 21054846)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 21054822)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 21054965)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 21055464)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 21055471)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 21055495)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 20579803)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2611 (class 2606 OID 21054992)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 21054780)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 21054692)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 21054716)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 21054672)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 21054657)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 21054998)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 21055034)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 21055175)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 21054744)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 21054768)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 21055357)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 21054971)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 21054758)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 21054859)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 21054983)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 21055366)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 21055374)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 21055344)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 21055386)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 21055016)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 21054956)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 21054947)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 21055162)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 21055089)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 21054834)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 21054628)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 21055025)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 21054646)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 21054666)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 21055043)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 21054978)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 21054927)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 21054616)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 21054604)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 21054598)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 21055109)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 21054725)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 21054938)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 21055149)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 21055398)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 21054793)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 21054641)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 21055208)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 21054881)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 21055006)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 21055121)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 21055445)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 21055429)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 21055453)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 21055080)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 21054912)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 21055188)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 21055070)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 21054906)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 21054907)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 21054905)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 21054904)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 21054903)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 21055110)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 21055111)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 21055112)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 21055466)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 21055465)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 21054746)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 21054999)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 21055433)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 21055432)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 21055434)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 21055431)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 21055430)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 21054985)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 21054984)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 21054882)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 21055059)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 21055061)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 21055060)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 21054824)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 21054823)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 21055387)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 21055177)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 21055178)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 21055179)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 21055454)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 21055213)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 21055210)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 21055214)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 21055212)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 21055211)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 21054795)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 21054794)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 21054719)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 21055026)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 21054673)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 21054674)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 21055046)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 21055045)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 21055044)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 21054860)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 21054861)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 21054606)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 21054951)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 21054949)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 21054948)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 21054950)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 21054647)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 21054648)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 21055007)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 21055488)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 21055098)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 21055097)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 21055496)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 21055497)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 21054972)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 21055090)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 21055091)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 21055301)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 21055300)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 21055297)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 21055298)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 21055299)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 21054760)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 21054759)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 21054761)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 21055020)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 21055019)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 21055367)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 21055368)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 21055243)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 21055244)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 21055241)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 21055242)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 21055081)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 21054960)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 21054959)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 21054957)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 21054958)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 21055231)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 21055230)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 21054835)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 21054849)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 21054848)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 21054847)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 21054850)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 21054872)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 21055358)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 21055406)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 21055472)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 21055473)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 21054694)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 21054693)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 21054726)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 21054727)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 21054913)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 21054941)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 21054940)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 21054939)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 21054899)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 21054900)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 21054898)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 21054902)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 21054901)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 21054745)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 21054809)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 21054811)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 21054810)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 21054812)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 21054966)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 21055176)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 21055209)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 21055150)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 21055151)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 21054717)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 21054718)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 21055071)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 21054617)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 21054781)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 21054605)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 21055399)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 21055018)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 21055017)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 21055240)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 21054769)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 21055189)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 21055446)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 21055375)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 21055376)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 21055139)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 21054928)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 21054667)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 21055628)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 21055633)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 21055653)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 21055623)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 21055643)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 21055648)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 21055638)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 21055818)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 21055823)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 21055828)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 21055993)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 21055988)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 21055553)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 21055738)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 21055973)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 21055968)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 21055978)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 21055963)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 21055958)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 21055733)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 21055728)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 21055618)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 21055778)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 21055788)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 21055783)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 21055588)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 21055583)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 21055718)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 21055948)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 21055833)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 21055838)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 21055843)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 21055983)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 21055863)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 21055848)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 21055868)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 21055858)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 21055853)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 21055578)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 21055573)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 21055538)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 21055533)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 21055758)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 21055513)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 21055518)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 21055773)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 21055768)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 21055763)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 21055603)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 21055608)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 21055498)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 21055693)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 21055683)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 21055678)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 21055688)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 21055503)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 21055508)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 21055743)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 21056008)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 21055813)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 21055808)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 21056013)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 21056018)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 21055723)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 21055798)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 21055803)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 21055923)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 21055918)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 21055903)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 21055908)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 21055913)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 21055563)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 21055558)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 21055568)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 21055753)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 21055748)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 21055933)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 21055938)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 21055893)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 21055898)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 21055883)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 21055888)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 21055793)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 21055713)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 21055708)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 21055698)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 21055703)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 21055878)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 21055873)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 21055593)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 21055598)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 21055613)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 21055928)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 21055943)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 21055953)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 21055998)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 21056003)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 21055528)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 21055523)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 21055543)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 21055548)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 21055658)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 21055673)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 21055668)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 21055663)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-29 15:17:48 CEST

--
-- PostgreSQL database dump complete
--

