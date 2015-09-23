--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-23 14:35:52 CEST

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
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20551271)
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
-- TOC entry 229 (class 1259 OID 20551827)
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
-- TOC entry 228 (class 1259 OID 20551810)
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
-- TOC entry 219 (class 1259 OID 20551688)
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
-- TOC entry 222 (class 1259 OID 20551718)
-- Name: besedilo; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE besedilo (
    id uuid NOT NULL,
    stevilka character varying(255) NOT NULL,
    naslov character varying(255) DEFAULT NULL::character varying,
    podnaslov character varying(255) DEFAULT NULL::character varying,
    jezik character varying(255) DEFAULT NULL::character varying,
    naslovizvirnika character varying(255) DEFAULT NULL::character varying,
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
-- TOC entry 243 (class 1259 OID 20552066)
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
-- TOC entry 197 (class 1259 OID 20551478)
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
    planiranzacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    allday boolean DEFAULT false,
    zacetek timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    konec timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    status character varying(4) DEFAULT NULL::character varying,
    razred character varying(4) DEFAULT NULL::character varying,
    termin character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 199 (class 1259 OID 20551510)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20551992)
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
-- TOC entry 190 (class 1259 OID 20551392)
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
-- TOC entry 230 (class 1259 OID 20551840)
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
-- TOC entry 215 (class 1259 OID 20551643)
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
-- TOC entry 195 (class 1259 OID 20551457)
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
-- TOC entry 193 (class 1259 OID 20551432)
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
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20551409)
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
-- TOC entry 204 (class 1259 OID 20551557)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20552047)
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
-- TOC entry 242 (class 1259 OID 20552059)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20552081)
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
-- TOC entry 170 (class 1259 OID 19946838)
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE migrations (
    version character varying(255) NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 20551582)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20551366)
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
-- TOC entry 182 (class 1259 OID 20551280)
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
-- TOC entry 183 (class 1259 OID 20551291)
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
-- TOC entry 178 (class 1259 OID 20551245)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20551264)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20551589)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20551623)
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
-- TOC entry 225 (class 1259 OID 20551758)
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
-- TOC entry 185 (class 1259 OID 20551324)
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
-- TOC entry 187 (class 1259 OID 20551358)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20551938)
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
-- TOC entry 205 (class 1259 OID 20551563)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20551343)
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
-- TOC entry 194 (class 1259 OID 20551447)
-- Name: predstava; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE predstava (
    id uuid NOT NULL,
    uprizoritev_id uuid,
    gostovanje_id uuid,
    zaporedna integer,
    porocilo text
);


--
-- TOC entry 207 (class 1259 OID 20551575)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20551952)
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
-- TOC entry 234 (class 1259 OID 20551962)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20551895)
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
-- TOC entry 235 (class 1259 OID 20551970)
-- Name: programskaenotasklopa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE programskaenotasklopa (
    id uuid NOT NULL,
    naslovpe character varying(255) NOT NULL,
    avtorpe character varying(255) NOT NULL,
    obsegpe character varying(255) NOT NULL,
    mesecpe character varying(255) NOT NULL,
    vrednostpe numeric(15,2) DEFAULT 0::numeric NOT NULL,
    programrazno_id uuid
);


--
-- TOC entry 211 (class 1259 OID 20551604)
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
-- TOC entry 203 (class 1259 OID 20551548)
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
-- TOC entry 202 (class 1259 OID 20551538)
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
-- TOC entry 224 (class 1259 OID 20551747)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20551678)
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
-- TOC entry 192 (class 1259 OID 20551421)
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
-- TOC entry 175 (class 1259 OID 20551216)
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
-- TOC entry 174 (class 1259 OID 20551214)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20551617)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20551254)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20551238)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20551631)
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
-- TOC entry 206 (class 1259 OID 20551569)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20551515)
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
-- TOC entry 173 (class 1259 OID 20551203)
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
-- TOC entry 172 (class 1259 OID 20551195)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20551190)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20551695)
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
-- TOC entry 184 (class 1259 OID 20551316)
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
-- TOC entry 201 (class 1259 OID 20551525)
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
-- TOC entry 223 (class 1259 OID 20551735)
-- Name: tipfunkcije; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tipfunkcije (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    ime character varying(255) NOT NULL,
    opis text,
    imezenski character varying(255) DEFAULT NULL::character varying,
    podrocje character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 236 (class 1259 OID 20551980)
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
-- TOC entry 189 (class 1259 OID 20551378)
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
-- TOC entry 176 (class 1259 OID 20551225)
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
-- TOC entry 227 (class 1259 OID 20551785)
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
    maticnioder_id uuid
);


--
-- TOC entry 196 (class 1259 OID 20551468)
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
-- TOC entry 210 (class 1259 OID 20551596)
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
-- TOC entry 221 (class 1259 OID 20551709)
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
-- TOC entry 239 (class 1259 OID 20552027)
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
-- TOC entry 238 (class 1259 OID 20551999)
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
-- TOC entry 240 (class 1259 OID 20552039)
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
-- TOC entry 217 (class 1259 OID 20551668)
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
-- TOC entry 198 (class 1259 OID 20551504)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20551775)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20551658)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20551219)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2973 (class 0 OID 20551271)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 20551827)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5602-9ca6-383d-4fe1c56e600f	000d0000-5602-9ca5-c5b2-1d41daa58b46	\N	00090000-5602-9ca5-3379-64f427721e59	000b0000-5602-9ca5-0b53-990435c091f2	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5602-9ca6-ddaf-a5f18764be85	000d0000-5602-9ca5-4da9-dc5a551a6c00	00100000-5602-9ca5-4b66-7a5039d8a93e	00090000-5602-9ca5-e9f8-6db9215a57f5	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5602-9ca6-9922-8fbc1b719acf	000d0000-5602-9ca5-d2dc-f62d0cfa058b	00100000-5602-9ca5-5ead-d7a5e1d3b08e	00090000-5602-9ca5-25d6-222f72e282c4	\N	0003	t	\N	2015-09-23	\N	2	t	\N	f	f
000c0000-5602-9ca6-a6ed-e8dcb5316a1e	000d0000-5602-9ca5-c6bf-cf526bc0b3ce	\N	00090000-5602-9ca5-99ce-af2dc25a99c5	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5602-9ca6-64c1-ad03ba324081	000d0000-5602-9ca5-0a96-5fbda09f4617	\N	00090000-5602-9ca5-5311-36b853b1c754	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5602-9ca6-02f4-e92f0a67af3c	000d0000-5602-9ca5-fa85-674f131fbe72	\N	00090000-5602-9ca5-144b-6f7b66617d2f	000b0000-5602-9ca5-4955-f01ddbc56482	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5602-9ca6-8c21-f293b118dd74	000d0000-5602-9ca5-bb00-7d2cba8b66af	00100000-5602-9ca5-b4e6-b18d8edaf305	00090000-5602-9ca5-c442-88a195d786a4	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5602-9ca6-ad8c-350e9a038753	000d0000-5602-9ca5-6989-801abc073d33	\N	00090000-5602-9ca5-205a-e72af2e348a8	000b0000-5602-9ca5-4bba-4f78ede60f93	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5602-9ca6-f87e-4d292d18b180	000d0000-5602-9ca5-bb00-7d2cba8b66af	00100000-5602-9ca5-e003-71c1e9f630cb	00090000-5602-9ca5-9911-1accf4a81844	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5602-9ca6-4f9a-85a564946c7c	000d0000-5602-9ca5-bb00-7d2cba8b66af	00100000-5602-9ca5-35c9-97f586f1a6b5	00090000-5602-9ca5-d901-69650286e41d	\N	0010	t	\N	2015-09-23	\N	16	f	\N	f	t
000c0000-5602-9ca6-69e2-98bcc411ad8c	000d0000-5602-9ca5-bb00-7d2cba8b66af	00100000-5602-9ca5-4801-cbbab012176b	00090000-5602-9ca5-03cc-22ddad4bfeff	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5602-9ca6-8e5a-772339a520e9	000d0000-5602-9ca5-5645-55697dc33dc3	\N	00090000-5602-9ca5-e9f8-6db9215a57f5	000b0000-5602-9ca5-711d-cd5cbb37621c	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3020 (class 0 OID 20551810)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20551688)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5602-9ca5-0faa-0ce8eca16be5	00160000-5602-9ca5-0f89-57ba6d3165ac	00090000-5602-9ca5-1284-39b2a4583ff7	aizv	10	t
003d0000-5602-9ca5-5da8-549b021af985	00160000-5602-9ca5-0f89-57ba6d3165ac	00090000-5602-9ca5-bbad-f16a12589d0a	apri	14	t
003d0000-5602-9ca5-bc48-14d94971665e	00160000-5602-9ca5-9ab0-42844345542f	00090000-5602-9ca5-d693-321ed43d8093	aizv	11	t
003d0000-5602-9ca5-bda1-e230785bbbda	00160000-5602-9ca5-147c-8b9e1dd684d3	00090000-5602-9ca5-e714-89cc67596d19	aizv	12	t
003d0000-5602-9ca5-9d94-33dbaf60d74a	00160000-5602-9ca5-0f89-57ba6d3165ac	00090000-5602-9ca5-4e03-90f618da6681	apri	18	f
\.


--
-- TOC entry 3014 (class 0 OID 20551718)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5602-9ca5-0f89-57ba6d3165ac	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5602-9ca5-9ab0-42844345542f	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5602-9ca5-147c-8b9e1dd684d3	0003	Smoletov Vrt		slovenščina		\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3035 (class 0 OID 20552066)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20551478)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5602-9ca5-652e-44886c756870	\N	\N	00200000-5602-9ca5-ab77-a8899280a517	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5602-9ca5-a2ee-cf4d71d322ec	\N	\N	00200000-5602-9ca5-f99d-8ca58402a73d	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5602-9ca5-2d2a-11f81d2c5461	\N	\N	00200000-5602-9ca5-c947-d3461066718a	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5602-9ca5-2441-102cfda0ff33	\N	\N	00200000-5602-9ca5-9d1c-fee99b869e53	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5602-9ca5-b43b-0a1f9e18e5ab	\N	\N	00200000-5602-9ca5-8504-cf004a0c67c1	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2991 (class 0 OID 20551510)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20551992)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20551392)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5602-9ca3-5112-1e5bc19eba70	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5602-9ca3-1455-fcab3991e389	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5602-9ca3-f80b-fc20de43542e	AL	ALB	008	Albania 	Albanija	\N
00040000-5602-9ca3-4bfe-ebff9a5af3f6	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5602-9ca3-5316-a83a2d97bb8a	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5602-9ca3-2130-6694afd00a29	AD	AND	020	Andorra 	Andora	\N
00040000-5602-9ca3-a60f-0237ce494ae5	AO	AGO	024	Angola 	Angola	\N
00040000-5602-9ca3-19d3-90bdbb2e3b63	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5602-9ca3-8806-044b8c7d1d01	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5602-9ca3-d343-8e2c21638b3d	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-9ca3-e9f0-4c5588834523	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5602-9ca3-f195-2b404b8f9281	AM	ARM	051	Armenia 	Armenija	\N
00040000-5602-9ca3-8487-6cd9d875fdc4	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5602-9ca3-fd62-b5ac3d5fcac7	AU	AUS	036	Australia 	Avstralija	\N
00040000-5602-9ca3-0e3f-316cacd5cc6f	AT	AUT	040	Austria 	Avstrija	\N
00040000-5602-9ca3-fda5-1fb48dd3a033	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5602-9ca3-fa47-a114a6cfe0a8	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5602-9ca3-1755-b31d5a6cd6a8	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5602-9ca3-0956-058a18934780	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5602-9ca3-8d24-c1aefe6a55d2	BB	BRB	052	Barbados 	Barbados	\N
00040000-5602-9ca3-3b66-d9bad55f680e	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5602-9ca3-4052-8531b4c11d40	BE	BEL	056	Belgium 	Belgija	\N
00040000-5602-9ca3-42f1-aadc51bfdd06	BZ	BLZ	084	Belize 	Belize	\N
00040000-5602-9ca3-ee7a-7ffe7abf04ad	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5602-9ca3-655f-92dd9010ebcd	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5602-9ca3-6e3d-89f172881cec	BT	BTN	064	Bhutan 	Butan	\N
00040000-5602-9ca3-1e7c-fb6d84cc8aa4	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5602-9ca3-14d3-3bd527341bdf	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5602-9ca3-0c1e-2a14ba0661b1	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5602-9ca3-b634-0b7f85381975	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5602-9ca3-a05d-b4a36bd30486	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5602-9ca3-5345-07c9937074e0	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5602-9ca3-ae6e-1c0251001964	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5602-9ca3-20c9-2d3e886e5bb0	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5602-9ca3-1ad3-a1c37680f77c	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5602-9ca3-c40e-fe806474e33b	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5602-9ca3-e5c1-bf5ba6acd694	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5602-9ca3-22d0-530e3f5299f4	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5602-9ca3-4b2e-9ad73d775371	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5602-9ca3-db16-ecaa56a7f8cb	CA	CAN	124	Canada 	Kanada	\N
00040000-5602-9ca3-15e0-97581f5b788d	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5602-9ca3-b740-a20154161fd4	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5602-9ca3-578c-165e6c693281	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5602-9ca3-db0f-e65e5b538f3b	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5602-9ca3-f0a3-e7f339d4af33	CL	CHL	152	Chile 	Čile	\N
00040000-5602-9ca3-b517-d418c1831dde	CN	CHN	156	China 	Kitajska	\N
00040000-5602-9ca3-61c5-86f10d420e3d	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5602-9ca3-611b-63b97382d7a8	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5602-9ca3-3553-eb72e3165fa3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5602-9ca3-48b1-631cdf57c8c9	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5602-9ca3-8801-25bdf8d04d5e	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5602-9ca3-dfa4-412192ac2ea5	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5602-9ca3-254d-d2df9a1dfa2b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5602-9ca3-5f39-4d62bfe24d75	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5602-9ca3-dcc6-8cc194e13360	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5602-9ca3-ce23-8f326bb2b098	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5602-9ca3-57ef-e977621b6bef	CU	CUB	192	Cuba 	Kuba	\N
00040000-5602-9ca3-680c-9bfb3d920f50	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5602-9ca3-76ec-5035e454b73f	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5602-9ca3-e2fe-8f5d101ec624	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5602-9ca3-4ffc-b1c53d8d8ff0	DK	DNK	208	Denmark 	Danska	\N
00040000-5602-9ca3-a23c-c2a8b47c7bc1	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5602-9ca3-ab32-94b6ec9ed061	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5602-9ca3-6c0d-fc5f0375b2ab	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5602-9ca3-f467-9e7e82611adc	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5602-9ca3-e187-1aff5bc68be4	EG	EGY	818	Egypt 	Egipt	\N
00040000-5602-9ca3-f38d-951cab64e426	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5602-9ca3-d6ed-98511e6efe16	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5602-9ca3-4154-c585cadc76de	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5602-9ca3-231f-147a2ae0510a	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5602-9ca3-030c-bfaefdbd0c28	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5602-9ca3-80bf-7d6881ccf4ad	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5602-9ca3-c849-0e6030e293c4	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5602-9ca3-d736-082f8e9927da	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5602-9ca3-4285-d2f6fd92327e	FI	FIN	246	Finland 	Finska	\N
00040000-5602-9ca3-8a2a-603518bc88ad	FR	FRA	250	France 	Francija	\N
00040000-5602-9ca3-5faf-f4ca4856346b	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5602-9ca3-a05c-517547dde6ea	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5602-9ca3-b9ca-aa43c3915dca	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5602-9ca3-c885-4172dc17b632	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5602-9ca3-b867-34e807c361c2	GA	GAB	266	Gabon 	Gabon	\N
00040000-5602-9ca3-4c4a-decdd77ebb2b	GM	GMB	270	Gambia 	Gambija	\N
00040000-5602-9ca3-9c0c-87b7e5e90ef5	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5602-9ca3-c1ff-d0ecf6d6cbab	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5602-9ca3-8af5-f71d1c5e361c	GH	GHA	288	Ghana 	Gana	\N
00040000-5602-9ca3-b05b-91a0c99a0a27	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5602-9ca3-5188-e82d0fffbeef	GR	GRC	300	Greece 	Grčija	\N
00040000-5602-9ca3-8faf-4b028b04e012	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5602-9ca3-0b55-ccc37ef4327d	GD	GRD	308	Grenada 	Grenada	\N
00040000-5602-9ca3-1346-087a014d1f7a	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5602-9ca3-2bb1-43da5191577e	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5602-9ca3-5c84-8ea82dbb3930	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5602-9ca3-0e8f-ed7e59a5e084	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5602-9ca3-a8f3-1e5169302b17	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5602-9ca3-d666-e175361f9267	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5602-9ca3-5783-3f9ed2f4a753	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5602-9ca3-d58f-c11cff371f43	HT	HTI	332	Haiti 	Haiti	\N
00040000-5602-9ca3-c0ea-abae4861de80	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5602-9ca3-32e1-26278274187b	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5602-9ca3-744c-020179551653	HN	HND	340	Honduras 	Honduras	\N
00040000-5602-9ca3-07b7-730928fc1fbb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5602-9ca3-0593-417450167d33	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5602-9ca3-7d16-6953237e6395	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5602-9ca3-9ffb-b18913a6bd05	IN	IND	356	India 	Indija	\N
00040000-5602-9ca3-baa0-d3347f7dec60	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5602-9ca3-5093-528c1193e288	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5602-9ca3-efd2-6209f1939a4e	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5602-9ca3-4ed9-f91b787c0d3f	IE	IRL	372	Ireland 	Irska	\N
00040000-5602-9ca3-a169-5c86f84c8755	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5602-9ca3-c47c-7c21076a5633	IL	ISR	376	Israel 	Izrael	\N
00040000-5602-9ca3-6bca-9aa2861882f5	IT	ITA	380	Italy 	Italija	\N
00040000-5602-9ca3-3036-654439abd0ab	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5602-9ca3-f9fd-0f271b7142f9	JP	JPN	392	Japan 	Japonska	\N
00040000-5602-9ca3-3bad-77e560001ab6	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5602-9ca3-fcb6-f5a524b3ffc6	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5602-9ca3-89e0-aaa2e96cad31	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5602-9ca3-efe6-9055fed9473b	KE	KEN	404	Kenya 	Kenija	\N
00040000-5602-9ca3-34bc-27eb860ea9c6	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5602-9ca3-7490-00287937821a	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5602-9ca3-234b-72ecce11bcb1	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5602-9ca3-13bb-0c2976848b2f	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5602-9ca3-8cc4-cbc27486a05b	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5602-9ca3-8c63-ceb916edc624	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5602-9ca3-2fc6-6ea4e3d30596	LV	LVA	428	Latvia 	Latvija	\N
00040000-5602-9ca3-9a2d-0d404f16e4d5	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5602-9ca3-d4ac-e8ce5e046ad2	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5602-9ca3-387c-dfc362602134	LR	LBR	430	Liberia 	Liberija	\N
00040000-5602-9ca3-621d-e0ce19b9a908	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5602-9ca3-e036-c432ce732d4f	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5602-9ca3-3c12-7c04112bcdad	LT	LTU	440	Lithuania 	Litva	\N
00040000-5602-9ca3-c095-0188fee44658	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5602-9ca3-0c1e-e69069ac02ab	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5602-9ca3-a1de-05541972fdef	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5602-9ca3-390e-3bc6ac26c04e	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5602-9ca3-294c-53a5675302dc	MW	MWI	454	Malawi 	Malavi	\N
00040000-5602-9ca3-29e5-abd86e24974f	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5602-9ca3-a387-70aeec62ecba	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5602-9ca3-cf20-4006b0d0d0d9	ML	MLI	466	Mali 	Mali	\N
00040000-5602-9ca3-9073-615a5062d3e3	MT	MLT	470	Malta 	Malta	\N
00040000-5602-9ca3-b30b-c48df139d07c	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5602-9ca3-aaa5-5958ae0f359b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5602-9ca3-a42a-0affdca45c54	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5602-9ca3-f979-1d074c677b1f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5602-9ca3-c138-eb982399118d	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5602-9ca3-4c24-bbd3762a2689	MX	MEX	484	Mexico 	Mehika	\N
00040000-5602-9ca3-0a0d-3f4df911de3e	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5602-9ca3-b375-a9a7c9905090	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5602-9ca3-e818-e38f7e801879	MC	MCO	492	Monaco 	Monako	\N
00040000-5602-9ca3-0e00-b3f5474201ee	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5602-9ca3-73b8-620e73c0f9dd	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5602-9ca3-2ddd-ec135298d1d7	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5602-9ca3-0a3f-b30e5030ee24	MA	MAR	504	Morocco 	Maroko	\N
00040000-5602-9ca3-13aa-ecd24af00c68	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5602-9ca3-c530-85373342b76c	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5602-9ca3-f941-65e64ed1a444	NA	NAM	516	Namibia 	Namibija	\N
00040000-5602-9ca3-3d99-395e7b13eadc	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5602-9ca3-c3b1-928023c4a09a	NP	NPL	524	Nepal 	Nepal	\N
00040000-5602-9ca3-0577-e72f6dba4485	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5602-9ca3-80bb-b5ad2657fe83	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5602-9ca3-1ce9-b160557503a4	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5602-9ca3-c39c-3525428fcf80	NE	NER	562	Niger 	Niger 	\N
00040000-5602-9ca3-190f-0a2897ee5e2f	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5602-9ca3-2705-3a6d3c9495fc	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5602-9ca3-e17d-11d98dfd384a	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5602-9ca3-b9d7-440298be8a0c	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5602-9ca3-bc14-4e1476de81ce	NO	NOR	578	Norway 	Norveška	\N
00040000-5602-9ca3-de58-b68f8a2b9515	OM	OMN	512	Oman 	Oman	\N
00040000-5602-9ca3-6ff9-553cbe6c5273	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5602-9ca3-74e3-31de4e14db77	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5602-9ca3-aeea-61e152cc2228	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5602-9ca3-5984-a3af3a485a43	PA	PAN	591	Panama 	Panama	\N
00040000-5602-9ca3-273f-a618932b8ed5	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5602-9ca3-dfb9-b20c829492fc	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5602-9ca3-5dc7-8a18e0b0b1f5	PE	PER	604	Peru 	Peru	\N
00040000-5602-9ca3-8ba7-1f020b2ac8c4	PH	PHL	608	Philippines 	Filipini	\N
00040000-5602-9ca3-ec1f-5e5223657a9e	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5602-9ca3-4402-25f06825f788	PL	POL	616	Poland 	Poljska	\N
00040000-5602-9ca3-5e8f-0b2fbafc89de	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5602-9ca3-6a0a-7da67cb15ddf	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5602-9ca3-be80-72e246490f68	QA	QAT	634	Qatar 	Katar	\N
00040000-5602-9ca3-97db-536ceb63d966	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5602-9ca3-69bb-95c3558ff8af	RO	ROU	642	Romania 	Romunija	\N
00040000-5602-9ca3-1822-ad12a8edb6ca	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5602-9ca3-9dd8-5bd1b7146d95	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5602-9ca3-330a-eaafec52bc91	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5602-9ca3-17c8-afb3fb408e47	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5602-9ca3-7d2e-099bbf1aabcf	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5602-9ca3-204f-57e4b61104a4	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5602-9ca3-faf5-3c6c9b37fa09	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5602-9ca3-05ac-6a0094230e40	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5602-9ca3-1b07-ccefcae0c683	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5602-9ca3-3940-bd5ae2f393cf	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5602-9ca3-eba5-0f9b9b6e6f69	SM	SMR	674	San Marino 	San Marino	\N
00040000-5602-9ca3-0689-f7785006d09f	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5602-9ca3-6878-57fb436526f3	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5602-9ca3-65f2-463e0d8b2924	SN	SEN	686	Senegal 	Senegal	\N
00040000-5602-9ca3-9929-ccbe864ce289	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5602-9ca3-c51a-593f49f791f8	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5602-9ca3-e932-4cbf81a24001	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5602-9ca3-d428-d5b4f24d898a	SG	SGP	702	Singapore 	Singapur	\N
00040000-5602-9ca3-7e5a-08995b3cb807	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5602-9ca3-54cd-732c1de3b05a	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5602-9ca3-cad1-d328b67d6c0d	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5602-9ca3-7eb6-4b6428ff3335	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5602-9ca3-4b31-ce2e5c850fbd	SO	SOM	706	Somalia 	Somalija	\N
00040000-5602-9ca3-bd54-8d7dc701f1aa	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5602-9ca3-01b2-d76ed159bbba	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5602-9ca3-4c39-49de08b875b1	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5602-9ca3-2c34-ddf0ddb018d8	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5602-9ca3-bdf0-d8a6d8dc75d9	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5602-9ca3-ae9c-be5a0d7981ed	SD	SDN	729	Sudan 	Sudan	\N
00040000-5602-9ca3-bda3-04ae0a82edf8	SR	SUR	740	Suriname 	Surinam	\N
00040000-5602-9ca3-98f4-2a971e323f31	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5602-9ca3-9123-202b0c656290	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5602-9ca3-ed99-e3bd8f99e2a9	SE	SWE	752	Sweden 	Švedska	\N
00040000-5602-9ca3-ef6e-d36d98a4d549	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5602-9ca3-a395-626068d9b0d4	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5602-9ca3-47e3-0cfb231328fa	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5602-9ca3-5b5b-20440c978d58	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5602-9ca3-85db-e7f8c7910e1c	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5602-9ca3-c984-b7e80a961f91	TH	THA	764	Thailand 	Tajska	\N
00040000-5602-9ca3-76be-a9c1e09770bb	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5602-9ca3-456c-e97ecc12605b	TG	TGO	768	Togo 	Togo	\N
00040000-5602-9ca3-2e00-fe0800b55060	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5602-9ca3-d42a-b4ede806c163	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5602-9ca3-363d-af4f9f4411f3	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5602-9ca3-ebe0-6901b7e23e6d	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5602-9ca3-f259-4f0322bb497b	TR	TUR	792	Turkey 	Turčija	\N
00040000-5602-9ca3-0e6a-a6158675880d	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5602-9ca3-23b0-54337e142a07	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-9ca3-6729-b609d92f4fab	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5602-9ca3-553b-705148f2b979	UG	UGA	800	Uganda 	Uganda	\N
00040000-5602-9ca3-3b23-1e541fc3c45b	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5602-9ca3-fb58-973af23086e0	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5602-9ca3-8935-609096fbcaa4	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5602-9ca3-0e1f-bb205bd56801	US	USA	840	United States 	Združene države Amerike	\N
00040000-5602-9ca3-957c-97c9f2f37433	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5602-9ca3-4de6-11f6d7cbff1e	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5602-9ca3-6c55-7f60aa8fa6f9	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5602-9ca3-2bf4-e3286d376856	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5602-9ca3-3cf1-08c223167c51	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5602-9ca3-3b83-3eb2ac02f5df	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5602-9ca3-5d3b-6a020a9ae73e	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5602-9ca3-8ba0-63ecc73d477e	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5602-9ca3-e3b1-5dd51967ac22	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5602-9ca3-d9b2-e88b8f326d3a	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5602-9ca3-b676-3728f0aa981e	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5602-9ca3-8ead-d63be52f0e2f	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5602-9ca3-5fe9-8bd17010556d	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3022 (class 0 OID 20551840)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5602-9ca5-c436-734921572884	000e0000-5602-9ca5-6d77-876bdcf66d6c	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-9ca3-d789-9f19366639c7	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-9ca5-8ec3-1f9f60c3265a	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-9ca3-5b1e-ee068eb79547	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5602-9ca5-473a-485767d0842a	000e0000-5602-9ca5-ea78-081a69b412bf	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5602-9ca3-d789-9f19366639c7	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-9ca6-c3d6-1daee9ecbee1	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	22	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5602-9ca6-02e6-9df593ee556a	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	202	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3007 (class 0 OID 20551643)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5602-9ca5-c5b2-1d41daa58b46	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-383d-4fe1c56e600f	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-9ca3-d26d-983447cf454e
000d0000-5602-9ca5-4da9-dc5a551a6c00	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-ddaf-a5f18764be85	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5602-9ca3-77ba-e30904fb98bf
000d0000-5602-9ca5-d2dc-f62d0cfa058b	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-9922-8fbc1b719acf	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5602-9ca3-bf43-a049fb0f11ce
000d0000-5602-9ca5-c6bf-cf526bc0b3ce	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-a6ed-e8dcb5316a1e	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5602-9ca3-02cf-e7c1e2c6ebbb
000d0000-5602-9ca5-0a96-5fbda09f4617	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-64c1-ad03ba324081	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5602-9ca3-02cf-e7c1e2c6ebbb
000d0000-5602-9ca5-fa85-674f131fbe72	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-02f4-e92f0a67af3c	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5602-9ca3-d26d-983447cf454e
000d0000-5602-9ca5-bb00-7d2cba8b66af	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-f87e-4d292d18b180	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5602-9ca3-d26d-983447cf454e
000d0000-5602-9ca5-6989-801abc073d33	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-ad8c-350e9a038753	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5602-9ca3-f2a7-08ced678de24
000d0000-5602-9ca5-5645-55697dc33dc3	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	000c0000-5602-9ca6-8e5a-772339a520e9	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5602-9ca3-5fe9-c56b0c237527
\.


--
-- TOC entry 2987 (class 0 OID 20551457)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20551432)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2983 (class 0 OID 20551409)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5602-9ca5-4e1d-40e4d5b02066	00080000-5602-9ca5-76a5-d53993b08352	00090000-5602-9ca5-d901-69650286e41d	AK		igralka
\.


--
-- TOC entry 2996 (class 0 OID 20551557)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20552047)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20552059)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20552081)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2962 (class 0 OID 19946838)
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
\.


--
-- TOC entry 3000 (class 0 OID 20551582)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20551366)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5602-9ca4-a1c2-c09eef2b65b3	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5602-9ca4-3441-ea933c3f22ed	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5602-9ca4-3635-d34be2698287	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5602-9ca4-403b-5c9d2e8149b6	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5602-9ca4-ae68-8c0a20fc7ff6	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5602-9ca4-4098-660bfb5c3cf2	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5602-9ca4-fb8d-434a84f43b0f	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5602-9ca4-5131-a39a069aebab	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-9ca4-a190-c1319477a3f5	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5602-9ca4-cbaf-d217040590e3	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5602-9ca4-fd90-1e4afde6533c	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5602-9ca4-58ac-9629f9d9b600	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5602-9ca4-9f85-960347e7d095	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5602-9ca4-437e-6f09cc69e1bc	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5602-9ca4-d1b5-16d26d8748f8	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5602-9ca5-2647-7801ee1fe7ef	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5602-9ca5-7a85-77796ca55b2f	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5602-9ca5-87a0-5c999d84480f	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5602-9ca5-ef44-d04d10797c4e	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5602-9ca5-f615-58d700669aec	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5602-9ca7-1db3-d81bc543cb48	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2974 (class 0 OID 20551280)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5602-9ca5-012f-52ed8ad3b67c	00000000-5602-9ca5-2647-7801ee1fe7ef	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5602-9ca5-597a-e03c731059db	00000000-5602-9ca5-2647-7801ee1fe7ef	00010000-5602-9ca4-5173-b0a4b98d35ca	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5602-9ca5-4792-d462572237a0	00000000-5602-9ca5-7a85-77796ca55b2f	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2975 (class 0 OID 20551291)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5602-9ca5-3379-64f427721e59	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5602-9ca5-99ce-af2dc25a99c5	00010000-5602-9ca5-0164-5d1641ba585f	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5602-9ca5-25d6-222f72e282c4	00010000-5602-9ca5-b18e-276208f6cf85	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5602-9ca5-9911-1accf4a81844	00010000-5602-9ca5-3328-c4adeedcb1d0	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5602-9ca5-600b-10fc6fd14b88	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5602-9ca5-144b-6f7b66617d2f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5602-9ca5-03cc-22ddad4bfeff	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5602-9ca5-c442-88a195d786a4	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5602-9ca5-d901-69650286e41d	00010000-5602-9ca5-4a76-d35505906d8e	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5602-9ca5-e9f8-6db9215a57f5	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5602-9ca5-a89d-6f67594ca1e3	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-9ca5-5311-36b853b1c754	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5602-9ca5-205a-e72af2e348a8	00010000-5602-9ca5-d3e5-ff07c77ca40b	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5602-9ca5-1284-39b2a4583ff7	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-9ca5-bbad-f16a12589d0a	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-9ca5-d693-321ed43d8093	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5602-9ca5-e714-89cc67596d19	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5602-9ca5-4e03-90f618da6681	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2970 (class 0 OID 20551245)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5602-9ca4-3a61-ff8c7d896141	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5602-9ca4-242b-f4d3d9f1d0b4	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5602-9ca4-950b-557113b6fb4f	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5602-9ca4-c346-69fb4ef125d5	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5602-9ca4-0468-76cbc1247430	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5602-9ca4-4bf1-1bd0cf9f2a11	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5602-9ca4-413d-081a682026dc	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5602-9ca4-1467-248d1743f4e4	Abonma-read	Abonma - branje	f
00030000-5602-9ca4-82d4-e5873a269d9f	Abonma-write	Abonma - spreminjanje	f
00030000-5602-9ca4-b27e-a86b37e1a312	Alternacija-read	Alternacija - branje	f
00030000-5602-9ca4-7c3c-8fa8201718e6	Alternacija-write	Alternacija - spreminjanje	f
00030000-5602-9ca4-1eed-b426c4509cf7	Arhivalija-read	Arhivalija - branje	f
00030000-5602-9ca4-1542-990b2ef1019a	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5602-9ca4-e11d-d22a71acc7d1	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5602-9ca4-832a-d9dd7774551c	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5602-9ca4-2455-222e00c2b368	Besedilo-read	Besedilo - branje	f
00030000-5602-9ca4-93d1-54ca6ac8fa39	Besedilo-write	Besedilo - spreminjanje	f
00030000-5602-9ca4-be08-76f75c86f07f	DogodekIzven-read	DogodekIzven - branje	f
00030000-5602-9ca4-0544-ee3c0bbd554b	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5602-9ca4-d5fb-c12eef9d484f	Dogodek-read	Dogodek - branje	f
00030000-5602-9ca4-8475-3a5a8b5c57e7	Dogodek-write	Dogodek - spreminjanje	f
00030000-5602-9ca4-47a6-6defc77b4c65	DrugiVir-read	DrugiVir - branje	f
00030000-5602-9ca4-25c5-c479c43e8541	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5602-9ca4-7ada-1ea60ffb896c	Drzava-read	Drzava - branje	f
00030000-5602-9ca4-cafe-7e0a615fde22	Drzava-write	Drzava - spreminjanje	f
00030000-5602-9ca4-c223-6d25adae6006	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5602-9ca4-c1d8-7068fddf0c24	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5602-9ca4-6d95-1ad98999cf3e	Funkcija-read	Funkcija - branje	f
00030000-5602-9ca4-bd9e-10af2f96080e	Funkcija-write	Funkcija - spreminjanje	f
00030000-5602-9ca4-7d14-7a8058be8bf9	Gostovanje-read	Gostovanje - branje	f
00030000-5602-9ca4-1605-70cf6f103ed0	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5602-9ca4-1a98-e79e076ec04e	Gostujoca-read	Gostujoca - branje	f
00030000-5602-9ca4-4b2d-860bd709df30	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5602-9ca4-8085-18d007c6f43f	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5602-9ca4-e5c0-4fa256ad814a	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5602-9ca4-0a1e-819037e9a74f	Kupec-read	Kupec - branje	f
00030000-5602-9ca4-fee3-90a763bc8f03	Kupec-write	Kupec - spreminjanje	f
00030000-5602-9ca4-d8f5-8438bbb29477	NacinPlacina-read	NacinPlacina - branje	f
00030000-5602-9ca4-57d7-b6272786aca7	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5602-9ca4-8b39-7818f8a03ebe	Option-read	Option - branje	f
00030000-5602-9ca4-c350-8d296070fd83	Option-write	Option - spreminjanje	f
00030000-5602-9ca4-fd0b-a3a81cdf93e1	OptionValue-read	OptionValue - branje	f
00030000-5602-9ca4-21b8-8f4e617debb4	OptionValue-write	OptionValue - spreminjanje	f
00030000-5602-9ca4-4258-6c9ba2edf812	Oseba-read	Oseba - branje	f
00030000-5602-9ca4-a9c1-09acf3dc806b	Oseba-write	Oseba - spreminjanje	f
00030000-5602-9ca4-00cf-140333f847a9	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5602-9ca4-1248-baa476a19fce	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5602-9ca4-248e-8fe30e7c919c	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5602-9ca4-ba3c-0340d955b139	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5602-9ca4-b82c-46a93889b202	Pogodba-read	Pogodba - branje	f
00030000-5602-9ca4-b0b4-540bf7f09872	Pogodba-write	Pogodba - spreminjanje	f
00030000-5602-9ca4-3059-78622c222d23	Popa-read	Popa - branje	f
00030000-5602-9ca4-9886-68536e04bf50	Popa-write	Popa - spreminjanje	f
00030000-5602-9ca4-ab31-3b8cd5c26560	Posta-read	Posta - branje	f
00030000-5602-9ca4-5f76-10a5ae6861c8	Posta-write	Posta - spreminjanje	f
00030000-5602-9ca4-59d1-c4d99cc62bcd	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5602-9ca4-30ee-4207d8eaba20	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5602-9ca4-5302-c5842069c082	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5602-9ca4-5bfd-977c72f70ebc	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5602-9ca4-fc19-30aa489c090f	PostniNaslov-read	PostniNaslov - branje	f
00030000-5602-9ca4-10ea-d7a57a770b6b	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5602-9ca4-aea4-fd1dc270ccb9	Predstava-read	Predstava - branje	f
00030000-5602-9ca4-5400-1b2fbba7bb34	Predstava-write	Predstava - spreminjanje	f
00030000-5602-9ca4-08c3-b3424d9fd157	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5602-9ca4-48cf-4af215cdfeb3	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5602-9ca4-a1e4-e398d19d85b6	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5602-9ca4-606a-19375b8d6b77	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5602-9ca4-9eec-e35e6bff78bd	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5602-9ca4-ca7d-8879880b041e	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5602-9ca4-776e-69be74c3f836	ProgramDela-read	ProgramDela - branje	f
00030000-5602-9ca4-d282-669e0aedf4ac	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5602-9ca4-7a32-3c0d9842eb86	ProgramFestival-read	ProgramFestival - branje	f
00030000-5602-9ca4-749b-f9a193102547	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5602-9ca4-4f57-8be2f1173e94	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5602-9ca4-010d-13f0ff7b1962	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5602-9ca4-1a83-66204ceeaecf	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5602-9ca4-28db-2d7002418537	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5602-9ca4-2382-0facd69856b1	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5602-9ca4-5531-f512b41e01ad	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5602-9ca4-ae00-03a1b2ef03eb	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5602-9ca4-c217-645d428b6d76	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5602-9ca4-78a5-2172113d3722	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5602-9ca4-8458-10cdc0e5fce7	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5602-9ca4-8f46-bdb7ad622fdf	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5602-9ca4-0f94-02b38e86517a	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5602-9ca4-c914-da111321f515	ProgramRazno-read	ProgramRazno - branje	f
00030000-5602-9ca4-45f4-55621d0dda8c	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5602-9ca4-3f7e-b7d2d9f8b836	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5602-9ca4-9b54-2541c38396cf	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5602-9ca4-51c5-be757761bc41	Prostor-read	Prostor - branje	f
00030000-5602-9ca4-6e32-1969d9fdd2a4	Prostor-write	Prostor - spreminjanje	f
00030000-5602-9ca4-baf2-f4f297d45814	Racun-read	Racun - branje	f
00030000-5602-9ca4-8a0e-49d6b772e970	Racun-write	Racun - spreminjanje	f
00030000-5602-9ca4-a584-f4b48011561e	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5602-9ca4-239c-d1b12f23c86c	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5602-9ca4-73b9-fca13b527a2e	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5602-9ca4-129f-1e655f86b947	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5602-9ca4-2824-bc204a6b9ef7	Rekvizit-read	Rekvizit - branje	f
00030000-5602-9ca4-9b80-2ab94cbbe167	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5602-9ca4-d054-f4cc28b9981b	Revizija-read	Revizija - branje	f
00030000-5602-9ca4-afde-e9bb2dd6f26b	Revizija-write	Revizija - spreminjanje	f
00030000-5602-9ca4-d503-5289e6f0cf7c	Rezervacija-read	Rezervacija - branje	f
00030000-5602-9ca4-3ca7-595a39402ceb	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5602-9ca4-c826-2a9e551cbd90	SedezniRed-read	SedezniRed - branje	f
00030000-5602-9ca4-9bad-77c256c4cf39	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5602-9ca4-0cf5-86fc42327838	Sedez-read	Sedez - branje	f
00030000-5602-9ca4-e6b7-f94a62db78a4	Sedez-write	Sedez - spreminjanje	f
00030000-5602-9ca4-9d65-c4ff2128d625	Sezona-read	Sezona - branje	f
00030000-5602-9ca4-f244-53f83c4f60d2	Sezona-write	Sezona - spreminjanje	f
00030000-5602-9ca4-53d6-3d6d8d4e0f9e	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5602-9ca4-4c2d-75ed4643718b	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5602-9ca4-4350-a1d6c63aa765	Stevilcenje-read	Stevilcenje - branje	f
00030000-5602-9ca4-1297-dbce727e4757	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5602-9ca4-6ae8-5ed62f720b50	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5602-9ca4-3a83-059f5e5b9d41	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5602-9ca4-7585-c3a105202aa5	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5602-9ca4-9eb6-4d800ff27f58	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5602-9ca4-2a8b-9eaa4896cf81	Telefonska-read	Telefonska - branje	f
00030000-5602-9ca4-e262-23e109e8230e	Telefonska-write	Telefonska - spreminjanje	f
00030000-5602-9ca4-1bf5-f265c6bcb018	TerminStoritve-read	TerminStoritve - branje	f
00030000-5602-9ca4-6478-fe98914d1edf	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5602-9ca4-9b99-9d0bc82110ed	TipFunkcije-read	TipFunkcije - branje	f
00030000-5602-9ca4-a423-da0fb2d0f012	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5602-9ca4-01a9-cf0945bfe35a	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5602-9ca4-f7dc-e2f852ddd385	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5602-9ca4-6afe-729a3104e9ff	Trr-read	Trr - branje	f
00030000-5602-9ca4-5c5d-083cd06b7bf6	Trr-write	Trr - spreminjanje	f
00030000-5602-9ca4-cb6f-f6ca562becc2	Uprizoritev-read	Uprizoritev - branje	f
00030000-5602-9ca4-9585-fea8fd6629e5	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5602-9ca4-3443-4802aacc2d77	Vaja-read	Vaja - branje	f
00030000-5602-9ca4-7167-6f395458914d	Vaja-write	Vaja - spreminjanje	f
00030000-5602-9ca4-8051-829ef7b5305d	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5602-9ca4-5e36-b6abeab93421	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5602-9ca4-767d-582e1d26af65	VrstaStroska-read	VrstaStroska - branje	f
00030000-5602-9ca4-4c8e-ae5e0bd1107f	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5602-9ca4-d5df-7adc6615e64e	Zaposlitev-read	Zaposlitev - branje	f
00030000-5602-9ca4-03c8-8a03038ed0e6	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5602-9ca4-c16c-18936e03f53f	Zasedenost-read	Zasedenost - branje	f
00030000-5602-9ca4-c22c-4cd34db0a3fe	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5602-9ca4-2909-5da01e1b7639	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5602-9ca4-f96b-bd62478c0c4d	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5602-9ca4-725a-b7ea9f22956d	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5602-9ca4-2e0b-9230446e8cdb	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5602-9ca4-bbba-f0064511089a	Job-read	Branje opravil - samo zase - branje	f
00030000-5602-9ca4-d763-dffe303411a1	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5602-9ca4-1e0a-db5a74c8460e	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5602-9ca4-b42a-8b71a2177a0c	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5602-9ca4-396b-2d2a7d6f06c6	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5602-9ca4-24bc-bfa86ddf2d92	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5602-9ca4-7964-0aa068d51a93	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5602-9ca4-54ef-fbe952335ad5	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-9ca4-f247-be15f36cd602	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5602-9ca4-2fec-1118a49df671	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-9ca4-1a82-16b39d6eaa02	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5602-9ca4-8ad3-8b08b6dc12c4	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5602-9ca4-b79a-78a587302bad	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5602-9ca4-815b-5eb91c792f88	Datoteka-write	Datoteka - spreminjanje	f
00030000-5602-9ca4-1b03-9dd264ff4114	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2972 (class 0 OID 20551264)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5602-9ca4-c6f6-0c2cad9c8a23	00030000-5602-9ca4-242b-f4d3d9f1d0b4
00020000-5602-9ca4-c1f6-dd6dd634523d	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-1467-248d1743f4e4
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-82d4-e5873a269d9f
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-b27e-a86b37e1a312
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-7c3c-8fa8201718e6
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-1eed-b426c4509cf7
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-d5fb-c12eef9d484f
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-c346-69fb4ef125d5
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-8475-3a5a8b5c57e7
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-cafe-7e0a615fde22
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-6d95-1ad98999cf3e
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-bd9e-10af2f96080e
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-7d14-7a8058be8bf9
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-1605-70cf6f103ed0
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-1a98-e79e076ec04e
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-4b2d-860bd709df30
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-8085-18d007c6f43f
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-e5c0-4fa256ad814a
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-8b39-7818f8a03ebe
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-fd0b-a3a81cdf93e1
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-4258-6c9ba2edf812
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-a9c1-09acf3dc806b
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-3059-78622c222d23
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-9886-68536e04bf50
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-ab31-3b8cd5c26560
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-5f76-10a5ae6861c8
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-fc19-30aa489c090f
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-10ea-d7a57a770b6b
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-aea4-fd1dc270ccb9
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-5400-1b2fbba7bb34
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-9eec-e35e6bff78bd
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-ca7d-8879880b041e
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-51c5-be757761bc41
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-6e32-1969d9fdd2a4
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-73b9-fca13b527a2e
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-129f-1e655f86b947
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-2824-bc204a6b9ef7
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-9b80-2ab94cbbe167
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-9d65-c4ff2128d625
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-f244-53f83c4f60d2
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-9b99-9d0bc82110ed
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-cb6f-f6ca562becc2
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-9585-fea8fd6629e5
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-3443-4802aacc2d77
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-7167-6f395458914d
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-c16c-18936e03f53f
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-c22c-4cd34db0a3fe
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-2909-5da01e1b7639
00020000-5602-9ca4-38f5-248e506e401c	00030000-5602-9ca4-725a-b7ea9f22956d
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-1467-248d1743f4e4
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-1eed-b426c4509cf7
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-d5fb-c12eef9d484f
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-7d14-7a8058be8bf9
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-1a98-e79e076ec04e
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-8085-18d007c6f43f
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-e5c0-4fa256ad814a
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-8b39-7818f8a03ebe
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-fd0b-a3a81cdf93e1
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-4258-6c9ba2edf812
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-a9c1-09acf3dc806b
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-3059-78622c222d23
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-ab31-3b8cd5c26560
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-fc19-30aa489c090f
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-10ea-d7a57a770b6b
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-aea4-fd1dc270ccb9
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-51c5-be757761bc41
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-73b9-fca13b527a2e
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-2824-bc204a6b9ef7
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-9d65-c4ff2128d625
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-2a8b-9eaa4896cf81
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-e262-23e109e8230e
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-6afe-729a3104e9ff
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-5c5d-083cd06b7bf6
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-d5df-7adc6615e64e
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-03c8-8a03038ed0e6
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-2909-5da01e1b7639
00020000-5602-9ca4-d2f0-246b1dace917	00030000-5602-9ca4-725a-b7ea9f22956d
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-1467-248d1743f4e4
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-b27e-a86b37e1a312
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-1eed-b426c4509cf7
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-1542-990b2ef1019a
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-2455-222e00c2b368
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-be08-76f75c86f07f
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-d5fb-c12eef9d484f
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-6d95-1ad98999cf3e
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-7d14-7a8058be8bf9
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-1a98-e79e076ec04e
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-8085-18d007c6f43f
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-8b39-7818f8a03ebe
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-fd0b-a3a81cdf93e1
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-4258-6c9ba2edf812
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-3059-78622c222d23
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-ab31-3b8cd5c26560
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-aea4-fd1dc270ccb9
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-9eec-e35e6bff78bd
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-51c5-be757761bc41
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-73b9-fca13b527a2e
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-2824-bc204a6b9ef7
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-9d65-c4ff2128d625
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-9b99-9d0bc82110ed
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-3443-4802aacc2d77
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-c16c-18936e03f53f
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-2909-5da01e1b7639
00020000-5602-9ca4-40c9-442cc1b8f20f	00030000-5602-9ca4-725a-b7ea9f22956d
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-1467-248d1743f4e4
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-82d4-e5873a269d9f
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-7c3c-8fa8201718e6
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-1eed-b426c4509cf7
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-d5fb-c12eef9d484f
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-7d14-7a8058be8bf9
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-1a98-e79e076ec04e
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-8b39-7818f8a03ebe
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-fd0b-a3a81cdf93e1
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-3059-78622c222d23
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-ab31-3b8cd5c26560
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-aea4-fd1dc270ccb9
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-51c5-be757761bc41
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-73b9-fca13b527a2e
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-2824-bc204a6b9ef7
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-9d65-c4ff2128d625
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-9b99-9d0bc82110ed
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-2909-5da01e1b7639
00020000-5602-9ca4-eebd-d13757229646	00030000-5602-9ca4-725a-b7ea9f22956d
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-1467-248d1743f4e4
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-1eed-b426c4509cf7
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-d5fb-c12eef9d484f
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-7d14-7a8058be8bf9
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-1a98-e79e076ec04e
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-8b39-7818f8a03ebe
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-fd0b-a3a81cdf93e1
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-3059-78622c222d23
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-ab31-3b8cd5c26560
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-aea4-fd1dc270ccb9
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-51c5-be757761bc41
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-73b9-fca13b527a2e
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-2824-bc204a6b9ef7
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-9d65-c4ff2128d625
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-1bf5-f265c6bcb018
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-950b-557113b6fb4f
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-9b99-9d0bc82110ed
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-2909-5da01e1b7639
00020000-5602-9ca4-2110-6c84533e48d2	00030000-5602-9ca4-725a-b7ea9f22956d
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-3a61-ff8c7d896141
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-242b-f4d3d9f1d0b4
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-950b-557113b6fb4f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c346-69fb4ef125d5
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-0468-76cbc1247430
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4bf1-1bd0cf9f2a11
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-413d-081a682026dc
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1467-248d1743f4e4
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-82d4-e5873a269d9f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-b27e-a86b37e1a312
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-7c3c-8fa8201718e6
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1eed-b426c4509cf7
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1542-990b2ef1019a
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-2455-222e00c2b368
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-93d1-54ca6ac8fa39
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-be08-76f75c86f07f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-0544-ee3c0bbd554b
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-d5fb-c12eef9d484f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8475-3a5a8b5c57e7
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-7ada-1ea60ffb896c
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-cafe-7e0a615fde22
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-47a6-6defc77b4c65
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-25c5-c479c43e8541
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c223-6d25adae6006
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c1d8-7068fddf0c24
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-6d95-1ad98999cf3e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-bd9e-10af2f96080e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-7d14-7a8058be8bf9
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1605-70cf6f103ed0
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1a98-e79e076ec04e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4b2d-860bd709df30
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8085-18d007c6f43f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-e5c0-4fa256ad814a
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-0a1e-819037e9a74f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-fee3-90a763bc8f03
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-d8f5-8438bbb29477
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-57d7-b6272786aca7
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8b39-7818f8a03ebe
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c350-8d296070fd83
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-fd0b-a3a81cdf93e1
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-21b8-8f4e617debb4
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4258-6c9ba2edf812
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-a9c1-09acf3dc806b
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-00cf-140333f847a9
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1248-baa476a19fce
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-248e-8fe30e7c919c
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-ba3c-0340d955b139
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-b82c-46a93889b202
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-b0b4-540bf7f09872
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-3059-78622c222d23
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9886-68536e04bf50
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-ab31-3b8cd5c26560
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5f76-10a5ae6861c8
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-59d1-c4d99cc62bcd
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-30ee-4207d8eaba20
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5302-c5842069c082
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5bfd-977c72f70ebc
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-fc19-30aa489c090f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-10ea-d7a57a770b6b
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-aea4-fd1dc270ccb9
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5400-1b2fbba7bb34
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-08c3-b3424d9fd157
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-48cf-4af215cdfeb3
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-a1e4-e398d19d85b6
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-606a-19375b8d6b77
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9eec-e35e6bff78bd
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-ca7d-8879880b041e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-776e-69be74c3f836
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-d282-669e0aedf4ac
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-7a32-3c0d9842eb86
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-749b-f9a193102547
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4f57-8be2f1173e94
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-010d-13f0ff7b1962
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1a83-66204ceeaecf
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-28db-2d7002418537
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-2382-0facd69856b1
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5531-f512b41e01ad
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-ae00-03a1b2ef03eb
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c217-645d428b6d76
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-78a5-2172113d3722
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8458-10cdc0e5fce7
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8f46-bdb7ad622fdf
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-0f94-02b38e86517a
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c914-da111321f515
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-45f4-55621d0dda8c
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-3f7e-b7d2d9f8b836
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9b54-2541c38396cf
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-51c5-be757761bc41
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-6e32-1969d9fdd2a4
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-baf2-f4f297d45814
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8a0e-49d6b772e970
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-a584-f4b48011561e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-239c-d1b12f23c86c
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-73b9-fca13b527a2e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-129f-1e655f86b947
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-2824-bc204a6b9ef7
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9b80-2ab94cbbe167
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-d054-f4cc28b9981b
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-afde-e9bb2dd6f26b
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-d503-5289e6f0cf7c
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-3ca7-595a39402ceb
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c826-2a9e551cbd90
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9bad-77c256c4cf39
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-0cf5-86fc42327838
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-e6b7-f94a62db78a4
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9d65-c4ff2128d625
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-f244-53f83c4f60d2
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-53d6-3d6d8d4e0f9e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4c2d-75ed4643718b
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4350-a1d6c63aa765
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1297-dbce727e4757
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-6ae8-5ed62f720b50
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-3a83-059f5e5b9d41
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-7585-c3a105202aa5
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9eb6-4d800ff27f58
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-2a8b-9eaa4896cf81
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-e262-23e109e8230e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-1bf5-f265c6bcb018
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-6478-fe98914d1edf
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9b99-9d0bc82110ed
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-a423-da0fb2d0f012
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-01a9-cf0945bfe35a
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-f7dc-e2f852ddd385
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-6afe-729a3104e9ff
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5c5d-083cd06b7bf6
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-cb6f-f6ca562becc2
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-9585-fea8fd6629e5
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-3443-4802aacc2d77
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-7167-6f395458914d
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-8051-829ef7b5305d
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-5e36-b6abeab93421
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-767d-582e1d26af65
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-4c8e-ae5e0bd1107f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-d5df-7adc6615e64e
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-03c8-8a03038ed0e6
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c16c-18936e03f53f
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-c22c-4cd34db0a3fe
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-2909-5da01e1b7639
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-f96b-bd62478c0c4d
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-725a-b7ea9f22956d
00020000-5602-9ca5-83a8-292ca25b9c7f	00030000-5602-9ca4-2e0b-9230446e8cdb
\.


--
-- TOC entry 3001 (class 0 OID 20551589)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20551623)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20551758)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5602-9ca5-0b53-990435c091f2	00090000-5602-9ca5-3379-64f427721e59	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5602-9ca5-4955-f01ddbc56482	00090000-5602-9ca5-144b-6f7b66617d2f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5602-9ca5-4bba-4f78ede60f93	00090000-5602-9ca5-205a-e72af2e348a8	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	32.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5602-9ca5-711d-cd5cbb37621c	00090000-5602-9ca5-e9f8-6db9215a57f5	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	30.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2977 (class 0 OID 20551324)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5602-9ca5-76a5-d53993b08352	00040000-5602-9ca3-cad1-d328b67d6c0d	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-4cb1-77c8d39f0769	00040000-5602-9ca3-cad1-d328b67d6c0d	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5602-9ca5-f96a-a093f45b3e46	00040000-5602-9ca3-cad1-d328b67d6c0d	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-313d-9c07b3ed3b93	00040000-5602-9ca3-cad1-d328b67d6c0d	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-f855-fd1b368203a8	00040000-5602-9ca3-cad1-d328b67d6c0d	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-6f38-b11a6e4a6903	00040000-5602-9ca3-e9f0-4c5588834523	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-9e08-77921b5e944f	00040000-5602-9ca3-ce23-8f326bb2b098	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-9132-a02c18f6bace	00040000-5602-9ca3-0e3f-316cacd5cc6f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca5-4019-6bec8c586983	00040000-5602-9ca3-c1ff-d0ecf6d6cbab	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5602-9ca7-27ee-678095975912	00040000-5602-9ca3-cad1-d328b67d6c0d	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2979 (class 0 OID 20551358)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5602-9ca3-2e12-3ceff799064e	8341	Adlešiči
00050000-5602-9ca3-ec57-8024f4801cc7	5270	Ajdovščina
00050000-5602-9ca3-2977-9032f6d12338	6280	Ankaran/Ancarano
00050000-5602-9ca3-b71c-626d85a920eb	9253	Apače
00050000-5602-9ca3-89ef-7159c37eac38	8253	Artiče
00050000-5602-9ca3-c358-c9e4ecc42918	4275	Begunje na Gorenjskem
00050000-5602-9ca3-8a90-ff1851457c2b	1382	Begunje pri Cerknici
00050000-5602-9ca3-5d83-494977a63046	9231	Beltinci
00050000-5602-9ca3-942b-694a1d2176c2	2234	Benedikt
00050000-5602-9ca3-5a71-1592e211b030	2345	Bistrica ob Dravi
00050000-5602-9ca3-262a-f84fe41bc30d	3256	Bistrica ob Sotli
00050000-5602-9ca3-d8f3-591a4530fdf6	8259	Bizeljsko
00050000-5602-9ca3-f3ea-d2b91796aa03	1223	Blagovica
00050000-5602-9ca3-6ee1-45a339ac8d46	8283	Blanca
00050000-5602-9ca3-d3e6-b8e3af0b999c	4260	Bled
00050000-5602-9ca3-d3bf-35cdf6c775ca	4273	Blejska Dobrava
00050000-5602-9ca3-4952-f6d6959defab	9265	Bodonci
00050000-5602-9ca3-b5e8-56dfc3d21b6d	9222	Bogojina
00050000-5602-9ca3-9f7b-8a18f1fece47	4263	Bohinjska Bela
00050000-5602-9ca3-8451-2568b0623e19	4264	Bohinjska Bistrica
00050000-5602-9ca3-dbca-62c14974fad6	4265	Bohinjsko jezero
00050000-5602-9ca3-06c9-93a744aadb3f	1353	Borovnica
00050000-5602-9ca3-65a6-2fd8d2214871	8294	Boštanj
00050000-5602-9ca3-eea1-0f6fa26d5d1f	5230	Bovec
00050000-5602-9ca3-8ef0-5ac6408890e6	5295	Branik
00050000-5602-9ca3-7672-991f61d3e867	3314	Braslovče
00050000-5602-9ca3-5d5a-19eafa6536f5	5223	Breginj
00050000-5602-9ca3-67f1-295cb0b7928c	8280	Brestanica
00050000-5602-9ca3-b722-505fe09cd8dd	2354	Bresternica
00050000-5602-9ca3-5424-31d06213ebbe	4243	Brezje
00050000-5602-9ca3-7501-47050b90c8c6	1351	Brezovica pri Ljubljani
00050000-5602-9ca3-0c85-66f062c8d32c	8250	Brežice
00050000-5602-9ca3-8e21-e8c76b21d312	4210	Brnik - Aerodrom
00050000-5602-9ca3-7ace-49f2d81071be	8321	Brusnice
00050000-5602-9ca3-5b70-95ed70641ddf	3255	Buče
00050000-5602-9ca3-2663-866c2b68d9bb	8276	Bučka 
00050000-5602-9ca3-cf2f-3e8d363df071	9261	Cankova
00050000-5602-9ca3-db7f-249bc0990a23	3000	Celje 
00050000-5602-9ca3-15bf-eadb33ca29d3	3001	Celje - poštni predali
00050000-5602-9ca3-ddc4-495133c00c02	4207	Cerklje na Gorenjskem
00050000-5602-9ca3-8542-5f4705d092bf	8263	Cerklje ob Krki
00050000-5602-9ca3-919d-efbbd5131ceb	1380	Cerknica
00050000-5602-9ca3-efd6-ccbf6c2b03d5	5282	Cerkno
00050000-5602-9ca3-a54e-3a2104b2e805	2236	Cerkvenjak
00050000-5602-9ca3-532d-3ce11d7473a4	2215	Ceršak
00050000-5602-9ca3-5802-3b339c42799b	2326	Cirkovce
00050000-5602-9ca3-bfa3-9f941fe2fb0c	2282	Cirkulane
00050000-5602-9ca3-64a6-c76739878ed9	5273	Col
00050000-5602-9ca3-2eec-4770ee2dcdfb	8251	Čatež ob Savi
00050000-5602-9ca3-1c47-2b0b39a6ab1a	1413	Čemšenik
00050000-5602-9ca3-cbdf-bb3431bff523	5253	Čepovan
00050000-5602-9ca3-87ad-d8281b798a84	9232	Črenšovci
00050000-5602-9ca3-6609-5f258c81ddda	2393	Črna na Koroškem
00050000-5602-9ca3-d051-9c79b9c26813	6275	Črni Kal
00050000-5602-9ca3-9fdd-e32be095470e	5274	Črni Vrh nad Idrijo
00050000-5602-9ca3-7866-867b16fe01e2	5262	Črniče
00050000-5602-9ca3-ed50-9cf759618677	8340	Črnomelj
00050000-5602-9ca3-669b-a83801984a6a	6271	Dekani
00050000-5602-9ca3-38f6-2051045929c3	5210	Deskle
00050000-5602-9ca3-5e79-b6850d8a5697	2253	Destrnik
00050000-5602-9ca3-47da-63a8d16e7fb9	6215	Divača
00050000-5602-9ca3-f3a2-e035be288eaa	1233	Dob
00050000-5602-9ca3-ec92-53ed86edb14e	3224	Dobje pri Planini
00050000-5602-9ca3-1def-9c81616546cf	8257	Dobova
00050000-5602-9ca3-2833-d1af619a1c64	1423	Dobovec
00050000-5602-9ca3-1bd6-ba14fe8cbb9f	5263	Dobravlje
00050000-5602-9ca3-183d-99efdf29e302	3204	Dobrna
00050000-5602-9ca3-10d6-d58b928d258c	8211	Dobrnič
00050000-5602-9ca3-031b-be88e911cd6b	1356	Dobrova
00050000-5602-9ca3-614e-936ed2e8ffde	9223	Dobrovnik/Dobronak 
00050000-5602-9ca3-1b65-5272280227f7	5212	Dobrovo v Brdih
00050000-5602-9ca3-6e25-d908c352bc53	1431	Dol pri Hrastniku
00050000-5602-9ca3-d4ed-49575264620f	1262	Dol pri Ljubljani
00050000-5602-9ca3-62b1-cff3850c2c1c	1273	Dole pri Litiji
00050000-5602-9ca3-5bd2-29bf0c37047b	1331	Dolenja vas
00050000-5602-9ca3-b777-8099b39792f2	8350	Dolenjske Toplice
00050000-5602-9ca3-ba01-e1825ea5efd0	1230	Domžale
00050000-5602-9ca3-6e18-8764ea97c814	2252	Dornava
00050000-5602-9ca3-0e3a-2d7b1990452d	5294	Dornberk
00050000-5602-9ca3-ec3d-025d4b175e55	1319	Draga
00050000-5602-9ca3-9de8-ecf28b637b64	8343	Dragatuš
00050000-5602-9ca3-da5e-39121bf0ceaf	3222	Dramlje
00050000-5602-9ca3-3a0a-e64685b75d4e	2370	Dravograd
00050000-5602-9ca3-2656-b107d3da681e	4203	Duplje
00050000-5602-9ca3-de2d-6cf099e03685	6221	Dutovlje
00050000-5602-9ca3-558d-30ff91bb6335	8361	Dvor
00050000-5602-9ca3-95a5-e723e80dbf2b	2343	Fala
00050000-5602-9ca3-bf5c-07286655df87	9208	Fokovci
00050000-5602-9ca3-fb87-724ab3fa799d	2313	Fram
00050000-5602-9ca3-b525-f9ee96045a6f	3213	Frankolovo
00050000-5602-9ca3-db32-9c78bd6463d4	1274	Gabrovka
00050000-5602-9ca3-0d3e-968a26230fa1	8254	Globoko
00050000-5602-9ca3-c2e7-afc692f0b926	5275	Godovič
00050000-5602-9ca3-a5e5-9ebc9df2695e	4204	Golnik
00050000-5602-9ca3-e1f1-978729d830cb	3303	Gomilsko
00050000-5602-9ca3-1a5e-353179d24db1	4224	Gorenja vas
00050000-5602-9ca3-34c2-0056fa0d0851	3263	Gorica pri Slivnici
00050000-5602-9ca3-da03-afab5b9d21d2	2272	Gorišnica
00050000-5602-9ca3-99cc-5f53bb25872f	9250	Gornja Radgona
00050000-5602-9ca3-8bb8-7b0db8ad47d6	3342	Gornji Grad
00050000-5602-9ca3-90fc-e9ff8107880c	4282	Gozd Martuljek
00050000-5602-9ca3-215d-2621f2914640	6272	Gračišče
00050000-5602-9ca3-e36b-f8fe837e8eb0	9264	Grad
00050000-5602-9ca3-4c23-233051e290bf	8332	Gradac
00050000-5602-9ca3-b665-900c440978a4	1384	Grahovo
00050000-5602-9ca3-7c76-16cb40744c2e	5242	Grahovo ob Bači
00050000-5602-9ca3-d56a-a17a32f5271e	5251	Grgar
00050000-5602-9ca3-791a-5ea8e46e460b	3302	Griže
00050000-5602-9ca3-4ce7-0a306fd562f7	3231	Grobelno
00050000-5602-9ca3-ad21-4857aef6a63c	1290	Grosuplje
00050000-5602-9ca3-2dae-140d18fce46a	2288	Hajdina
00050000-5602-9ca3-474f-14dd490811d3	8362	Hinje
00050000-5602-9ca3-d1ed-b1a24cf9d612	2311	Hoče
00050000-5602-9ca3-cd71-e8a0b7b5a8f4	9205	Hodoš/Hodos
00050000-5602-9ca3-d6b4-0cd46188eef9	1354	Horjul
00050000-5602-9ca3-f3d1-e85a15990f0c	1372	Hotedršica
00050000-5602-9ca3-1b70-6a1624994547	1430	Hrastnik
00050000-5602-9ca3-d39c-1fbf9fc153ce	6225	Hruševje
00050000-5602-9ca3-1471-2ca23052b126	4276	Hrušica
00050000-5602-9ca3-3c8d-7d386cb99314	5280	Idrija
00050000-5602-9ca3-a5ed-5185b91f74fa	1292	Ig
00050000-5602-9ca3-77a4-7e38c9b361e7	6250	Ilirska Bistrica
00050000-5602-9ca3-6958-af6e17492754	6251	Ilirska Bistrica-Trnovo
00050000-5602-9ca3-c133-476523565083	1295	Ivančna Gorica
00050000-5602-9ca3-d3ad-57fa034cfbd0	2259	Ivanjkovci
00050000-5602-9ca3-0b16-f4a11cd41788	1411	Izlake
00050000-5602-9ca3-9bc7-5179aaab2cfd	6310	Izola/Isola
00050000-5602-9ca3-b366-6405ee0d335f	2222	Jakobski Dol
00050000-5602-9ca3-7149-bb6fbda0198b	2221	Jarenina
00050000-5602-9ca3-6fa4-6c0a9f265228	6254	Jelšane
00050000-5602-9ca3-10c0-dc9a632bf6d7	4270	Jesenice
00050000-5602-9ca3-7dcf-c0483329fa74	8261	Jesenice na Dolenjskem
00050000-5602-9ca3-5237-13cb24f286cb	3273	Jurklošter
00050000-5602-9ca3-2c29-2acfb2bfa370	2223	Jurovski Dol
00050000-5602-9ca3-ace3-822929b65ff1	2256	Juršinci
00050000-5602-9ca3-8473-b7a7af1914c1	5214	Kal nad Kanalom
00050000-5602-9ca3-314f-80702fc766d6	3233	Kalobje
00050000-5602-9ca3-8696-5865c16809ca	4246	Kamna Gorica
00050000-5602-9ca3-8e29-03834f2955dc	2351	Kamnica
00050000-5602-9ca3-1fee-aa7c828e3e11	1241	Kamnik
00050000-5602-9ca3-856c-87faf1262be0	5213	Kanal
00050000-5602-9ca3-af70-041f41205f4a	8258	Kapele
00050000-5602-9ca3-40b2-641e0363f311	2362	Kapla
00050000-5602-9ca3-71f0-5f5e81a6dc22	2325	Kidričevo
00050000-5602-9ca3-52d1-956b2e9bf30a	1412	Kisovec
00050000-5602-9ca3-aa0b-a26e4a3600d6	6253	Knežak
00050000-5602-9ca3-9243-1048c54f7fcb	5222	Kobarid
00050000-5602-9ca3-13d0-43d6d7d36d14	9227	Kobilje
00050000-5602-9ca3-031e-363d52505dd4	1330	Kočevje
00050000-5602-9ca3-8f30-38e20a1a4f12	1338	Kočevska Reka
00050000-5602-9ca3-2295-22ae6d7b305f	2276	Kog
00050000-5602-9ca3-86fa-9e62de40749a	5211	Kojsko
00050000-5602-9ca3-9877-f9d8f5c4cdfd	6223	Komen
00050000-5602-9ca3-4bee-e1018128aca4	1218	Komenda
00050000-5602-9ca3-b2ea-3a8e8d50b610	6000	Koper/Capodistria 
00050000-5602-9ca3-3239-2dd2d16928d3	6001	Koper/Capodistria - poštni predali
00050000-5602-9ca3-50cf-a14b628c7bd8	8282	Koprivnica
00050000-5602-9ca3-b72a-1e21812259ae	5296	Kostanjevica na Krasu
00050000-5602-9ca3-b042-641ef47247da	8311	Kostanjevica na Krki
00050000-5602-9ca3-4a3e-9f96b1ae7df9	1336	Kostel
00050000-5602-9ca3-112f-72aaca029570	6256	Košana
00050000-5602-9ca3-8ac3-6b34f46932b8	2394	Kotlje
00050000-5602-9ca3-bd0c-4b44f22c9b81	6240	Kozina
00050000-5602-9ca3-9f7a-8bee4ea76eee	3260	Kozje
00050000-5602-9ca3-fb3f-f7b95ef6f2ca	4000	Kranj 
00050000-5602-9ca3-02ba-4b4f373aa872	4001	Kranj - poštni predali
00050000-5602-9ca3-b39c-07910fcec63c	4280	Kranjska Gora
00050000-5602-9ca3-006e-76d364481105	1281	Kresnice
00050000-5602-9ca3-6d15-07323006cd02	4294	Križe
00050000-5602-9ca3-34bc-278f77b04a59	9206	Križevci
00050000-5602-9ca3-4b7f-b216e61c9d84	9242	Križevci pri Ljutomeru
00050000-5602-9ca3-6b74-6497eb5dfbc1	1301	Krka
00050000-5602-9ca3-b4a0-42378ce59ca0	8296	Krmelj
00050000-5602-9ca3-7e61-c4b1ee1e12bf	4245	Kropa
00050000-5602-9ca3-2398-27be36243299	8262	Krška vas
00050000-5602-9ca3-d75e-b6b02329cac4	8270	Krško
00050000-5602-9ca3-8b9d-0301a773f53c	9263	Kuzma
00050000-5602-9ca3-b86c-f76b72b65395	2318	Laporje
00050000-5602-9ca3-c4fb-43f7dc3f9678	3270	Laško
00050000-5602-9ca3-b779-1e4963667405	1219	Laze v Tuhinju
00050000-5602-9ca3-4384-c94b23c4dbdf	2230	Lenart v Slovenskih goricah
00050000-5602-9ca3-55c7-3087a69cc46e	9220	Lendava/Lendva
00050000-5602-9ca3-41ba-a6956967b7ef	4248	Lesce
00050000-5602-9ca3-93e3-179d73b73697	3261	Lesično
00050000-5602-9ca3-2a62-1f0f1f7f5035	8273	Leskovec pri Krškem
00050000-5602-9ca3-af9b-c7b6fc34dc4e	2372	Libeliče
00050000-5602-9ca3-862e-96c6c2bcfe62	2341	Limbuš
00050000-5602-9ca3-f0df-58f3a79b65c1	1270	Litija
00050000-5602-9ca3-96b3-dad2a95b9d5f	3202	Ljubečna
00050000-5602-9ca3-391a-c2ec78b69605	1000	Ljubljana 
00050000-5602-9ca3-5f1b-0cd0e9f6fb94	1001	Ljubljana - poštni predali
00050000-5602-9ca3-f966-f24ea464c4d5	1231	Ljubljana - Črnuče
00050000-5602-9ca3-96b9-06ffe86a8a1b	1261	Ljubljana - Dobrunje
00050000-5602-9ca3-92a0-cff5d201cec4	1260	Ljubljana - Polje
00050000-5602-9ca3-afa0-10f54a2522e8	1210	Ljubljana - Šentvid
00050000-5602-9ca3-e922-21a6c358ed62	1211	Ljubljana - Šmartno
00050000-5602-9ca3-3aae-bc491f447d2b	3333	Ljubno ob Savinji
00050000-5602-9ca3-6e1a-48a2d3bcf365	9240	Ljutomer
00050000-5602-9ca3-4997-a4637d2f2133	3215	Loče
00050000-5602-9ca3-6d6b-370f620198f3	5231	Log pod Mangartom
00050000-5602-9ca3-082b-ac8d0d2eebfb	1358	Log pri Brezovici
00050000-5602-9ca3-d1b8-e36689e39cc1	1370	Logatec
00050000-5602-9ca3-dd56-82a5500143f3	1371	Logatec
00050000-5602-9ca3-3af9-22043102ea6a	1434	Loka pri Zidanem Mostu
00050000-5602-9ca3-bb7a-09a0ce246418	3223	Loka pri Žusmu
00050000-5602-9ca3-457c-bd52e2148d23	6219	Lokev
00050000-5602-9ca3-30cf-2a8007d6f29b	1318	Loški Potok
00050000-5602-9ca3-5cdc-66b64a91e45e	2324	Lovrenc na Dravskem polju
00050000-5602-9ca3-7967-b4fc11f7c269	2344	Lovrenc na Pohorju
00050000-5602-9ca3-da8d-2802241a9e82	3334	Luče
00050000-5602-9ca3-9806-7f9c0838e5eb	1225	Lukovica
00050000-5602-9ca3-754e-57dcebe4b171	9202	Mačkovci
00050000-5602-9ca3-897e-37c3f5064b00	2322	Majšperk
00050000-5602-9ca3-28f2-f2456f01e40d	2321	Makole
00050000-5602-9ca3-325d-17c622416b86	9243	Mala Nedelja
00050000-5602-9ca3-60a5-0b09081651f1	2229	Malečnik
00050000-5602-9ca3-c0fd-b48babf3f070	6273	Marezige
00050000-5602-9ca3-2f3e-ac723226069d	2000	Maribor 
00050000-5602-9ca3-1366-c580e72441d9	2001	Maribor - poštni predali
00050000-5602-9ca3-2dc8-ea0a7fcb49a0	2206	Marjeta na Dravskem polju
00050000-5602-9ca3-c6b9-9be16ec8a9ed	2281	Markovci
00050000-5602-9ca3-d394-dbed5c8b86af	9221	Martjanci
00050000-5602-9ca3-f92d-6354bda1aa22	6242	Materija
00050000-5602-9ca3-7cd5-96b59bf15566	4211	Mavčiče
00050000-5602-9ca3-fa8d-6999a1e06d7e	1215	Medvode
00050000-5602-9ca3-013d-538e86eb09b9	1234	Mengeš
00050000-5602-9ca3-13a6-13586e97363a	8330	Metlika
00050000-5602-9ca3-3383-9ac3df37a9a6	2392	Mežica
00050000-5602-9ca3-bf0b-9c6daf7537f9	2204	Miklavž na Dravskem polju
00050000-5602-9ca3-062a-18651e98d2ad	2275	Miklavž pri Ormožu
00050000-5602-9ca3-eae7-82cb14411cfd	5291	Miren
00050000-5602-9ca3-ceee-c556b3b48e2c	8233	Mirna
00050000-5602-9ca3-bbd1-3d467a57c13f	8216	Mirna Peč
00050000-5602-9ca3-5fc0-1df41711cd43	2382	Mislinja
00050000-5602-9ca3-1b86-e17f5e54fd96	4281	Mojstrana
00050000-5602-9ca3-6749-d0d8b718aee1	8230	Mokronog
00050000-5602-9ca3-a971-ea174893302e	1251	Moravče
00050000-5602-9ca3-ea5c-ad7462925962	9226	Moravske Toplice
00050000-5602-9ca3-4ba0-aef3b09bf909	5216	Most na Soči
00050000-5602-9ca3-4620-42d7a36605a8	1221	Motnik
00050000-5602-9ca3-3de3-a807f3b55907	3330	Mozirje
00050000-5602-9ca3-a0b5-a79ed9ace728	9000	Murska Sobota 
00050000-5602-9ca3-ec7b-477cc5644b7a	9001	Murska Sobota - poštni predali
00050000-5602-9ca3-0b3c-2fd61056c8a2	2366	Muta
00050000-5602-9ca3-2aac-770ed104ee56	4202	Naklo
00050000-5602-9ca3-bc66-e3fd065f2f40	3331	Nazarje
00050000-5602-9ca3-2caa-f0e78d2afce3	1357	Notranje Gorice
00050000-5602-9ca3-d085-db399f9fe9c5	3203	Nova Cerkev
00050000-5602-9ca3-1b2f-4111e8464b7e	5000	Nova Gorica 
00050000-5602-9ca3-1aef-9096cca83aab	5001	Nova Gorica - poštni predali
00050000-5602-9ca3-e2f4-715a9828fe49	1385	Nova vas
00050000-5602-9ca3-9e86-1be93b3c31d3	8000	Novo mesto
00050000-5602-9ca3-a8c5-84ce5ab75248	8001	Novo mesto - poštni predali
00050000-5602-9ca3-6a1d-7e6c1516a283	6243	Obrov
00050000-5602-9ca3-68fb-e7604c366e11	9233	Odranci
00050000-5602-9ca3-a02b-d3c3fb8b67d9	2317	Oplotnica
00050000-5602-9ca3-1883-940381a2c47e	2312	Orehova vas
00050000-5602-9ca3-ab48-e41a5702821c	2270	Ormož
00050000-5602-9ca3-8357-ed14e0fbc59e	1316	Ortnek
00050000-5602-9ca3-77b4-71c2fcf3ad67	1337	Osilnica
00050000-5602-9ca3-54a2-1fe411f8fecb	8222	Otočec
00050000-5602-9ca3-441a-916d3c1239af	2361	Ožbalt
00050000-5602-9ca3-7515-909ea821a45a	2231	Pernica
00050000-5602-9ca3-3e9e-5b44a3fe487c	2211	Pesnica pri Mariboru
00050000-5602-9ca3-898d-dde3a82943bf	9203	Petrovci
00050000-5602-9ca3-96f9-a39d1a783e9a	3301	Petrovče
00050000-5602-9ca3-b295-49d7aad14c70	6330	Piran/Pirano
00050000-5602-9ca3-7c32-4e3303e477f3	8255	Pišece
00050000-5602-9ca3-1e71-c623f2685b85	6257	Pivka
00050000-5602-9ca3-3233-45cbf00e2e05	6232	Planina
00050000-5602-9ca3-b07b-6f5ce1ab28c2	3225	Planina pri Sevnici
00050000-5602-9ca3-c65a-2566e1135a43	6276	Pobegi
00050000-5602-9ca3-179b-144f1d594e9e	8312	Podbočje
00050000-5602-9ca3-63f9-e12f0e2c28bc	5243	Podbrdo
00050000-5602-9ca3-a250-121cb82c95c8	3254	Podčetrtek
00050000-5602-9ca3-d664-f6a96e796b6f	2273	Podgorci
00050000-5602-9ca3-10ca-692140de078d	6216	Podgorje
00050000-5602-9ca3-06de-d20a3a616373	2381	Podgorje pri Slovenj Gradcu
00050000-5602-9ca3-e6cc-53da81d9e602	6244	Podgrad
00050000-5602-9ca3-c82c-1532ddf4a7de	1414	Podkum
00050000-5602-9ca3-f556-3140abc3af29	2286	Podlehnik
00050000-5602-9ca3-ec47-8669806969d4	5272	Podnanos
00050000-5602-9ca3-3f10-6267ce29fd29	4244	Podnart
00050000-5602-9ca3-a116-54b664076e29	3241	Podplat
00050000-5602-9ca3-95bd-9ceebba7e5c1	3257	Podsreda
00050000-5602-9ca3-c981-0fa42937abe5	2363	Podvelka
00050000-5602-9ca3-f603-fd1e4f9906fd	2208	Pohorje
00050000-5602-9ca3-0b44-b338a00d91c6	2257	Polenšak
00050000-5602-9ca3-b1a8-cf24d285fa55	1355	Polhov Gradec
00050000-5602-9ca3-cba9-cce76f83fc30	4223	Poljane nad Škofjo Loko
00050000-5602-9ca3-d99c-1184f9b5a6f9	2319	Poljčane
00050000-5602-9ca3-2cc0-912caf137041	1272	Polšnik
00050000-5602-9ca3-0e53-529707f25e8e	3313	Polzela
00050000-5602-9ca3-7ee8-3c25140e364e	3232	Ponikva
00050000-5602-9ca3-81d0-12a0f09f449d	6320	Portorož/Portorose
00050000-5602-9ca3-d35b-ee2c529f823c	6230	Postojna
00050000-5602-9ca3-20a9-ce29ad72265a	2331	Pragersko
00050000-5602-9ca3-b0d4-b2513d77840e	3312	Prebold
00050000-5602-9ca3-fffb-bb70357fe18e	4205	Preddvor
00050000-5602-9ca3-9728-b79a34fc8bec	6255	Prem
00050000-5602-9ca3-9e14-df8dce42bdc5	1352	Preserje
00050000-5602-9ca3-51ed-62f1e01af92c	6258	Prestranek
00050000-5602-9ca3-8deb-b21f39646c27	2391	Prevalje
00050000-5602-9ca3-ecfe-bad520752cfd	3262	Prevorje
00050000-5602-9ca3-4efb-b37a56b0ee9e	1276	Primskovo 
00050000-5602-9ca3-9c87-e245077c390d	3253	Pristava pri Mestinju
00050000-5602-9ca3-3627-58265eec23da	9207	Prosenjakovci/Partosfalva
00050000-5602-9ca3-3bf8-49971b22f50f	5297	Prvačina
00050000-5602-9ca3-2c3f-e3867dc63bad	2250	Ptuj
00050000-5602-9ca3-e77e-c936d8bbde75	2323	Ptujska Gora
00050000-5602-9ca3-66c2-e05679871c58	9201	Puconci
00050000-5602-9ca3-45ea-b43128e25656	2327	Rače
00050000-5602-9ca3-f64d-8514f74064cb	1433	Radeče
00050000-5602-9ca3-f49b-96e108ba965a	9252	Radenci
00050000-5602-9ca3-03c6-b4195f97ce4c	2360	Radlje ob Dravi
00050000-5602-9ca3-75b5-20ef50a5a80e	1235	Radomlje
00050000-5602-9ca3-a7c7-8eba7af52996	4240	Radovljica
00050000-5602-9ca3-4fe7-7cf99ad8f22b	8274	Raka
00050000-5602-9ca3-72f2-aab96ec1c22d	1381	Rakek
00050000-5602-9ca3-35a1-1b51dbf57894	4283	Rateče - Planica
00050000-5602-9ca3-ff60-bed899b3dd41	2390	Ravne na Koroškem
00050000-5602-9ca3-c2ba-e38e79302b97	9246	Razkrižje
00050000-5602-9ca3-7285-c582a4159f25	3332	Rečica ob Savinji
00050000-5602-9ca3-ce87-31c7a1cd2e92	5292	Renče
00050000-5602-9ca3-ad56-023b7137a3bb	1310	Ribnica
00050000-5602-9ca3-072d-621fd1a858ac	2364	Ribnica na Pohorju
00050000-5602-9ca3-a335-48ed9308cea0	3272	Rimske Toplice
00050000-5602-9ca3-65e5-ff44a8a242d6	1314	Rob
00050000-5602-9ca3-db97-f3aca0502278	5215	Ročinj
00050000-5602-9ca3-da7f-aa6e125c2efd	3250	Rogaška Slatina
00050000-5602-9ca3-cd4f-f756b83ff983	9262	Rogašovci
00050000-5602-9ca3-f43b-d36c16c60cc2	3252	Rogatec
00050000-5602-9ca3-1bf3-eeba31966aaf	1373	Rovte
00050000-5602-9ca3-b6de-73741f972df7	2342	Ruše
00050000-5602-9ca3-efc7-3155ee971842	1282	Sava
00050000-5602-9ca3-5127-0e7dd537df86	6333	Sečovlje/Sicciole
00050000-5602-9ca3-5dc3-43781373641c	4227	Selca
00050000-5602-9ca3-65f7-8ee6f0f39680	2352	Selnica ob Dravi
00050000-5602-9ca3-a118-879634e8e4d7	8333	Semič
00050000-5602-9ca3-4f40-7c93663db593	8281	Senovo
00050000-5602-9ca3-05be-233eab1cf324	6224	Senožeče
00050000-5602-9ca3-d495-a183acf1769a	8290	Sevnica
00050000-5602-9ca3-310e-e67eb99bc891	6210	Sežana
00050000-5602-9ca3-d9a8-2248cac74c2d	2214	Sladki Vrh
00050000-5602-9ca3-20fa-2958b7eeabe2	5283	Slap ob Idrijci
00050000-5602-9ca3-423a-d006d40c64b1	2380	Slovenj Gradec
00050000-5602-9ca3-0f89-a6791526b480	2310	Slovenska Bistrica
00050000-5602-9ca3-d64c-a5d9fc446cd6	3210	Slovenske Konjice
00050000-5602-9ca3-9fc8-47730bbf2c5b	1216	Smlednik
00050000-5602-9ca3-5a0b-792cc52c26d5	5232	Soča
00050000-5602-9ca3-daa1-f7b397e17546	1317	Sodražica
00050000-5602-9ca3-c992-85f591567d39	3335	Solčava
00050000-5602-9ca3-ec80-e967b60a7087	5250	Solkan
00050000-5602-9ca3-f99c-6a9fb9fcfa2b	4229	Sorica
00050000-5602-9ca3-25cf-7a29281f3c7a	4225	Sovodenj
00050000-5602-9ca3-63b3-91b5d3c5e9b9	5281	Spodnja Idrija
00050000-5602-9ca3-144a-02bf7d302b62	2241	Spodnji Duplek
00050000-5602-9ca3-e01e-5f36d54c2ed7	9245	Spodnji Ivanjci
00050000-5602-9ca3-1025-827c4f7e0ac1	2277	Središče ob Dravi
00050000-5602-9ca3-2c74-0d833c3eaab4	4267	Srednja vas v Bohinju
00050000-5602-9ca3-53e7-482e5285e0b3	8256	Sromlje 
00050000-5602-9ca3-7753-dc324c07b009	5224	Srpenica
00050000-5602-9ca3-f124-4daec33d7314	1242	Stahovica
00050000-5602-9ca3-1416-4faea7c82d68	1332	Stara Cerkev
00050000-5602-9ca3-0492-73f2e393b0b7	8342	Stari trg ob Kolpi
00050000-5602-9ca3-72df-a4aa1902fa6d	1386	Stari trg pri Ložu
00050000-5602-9ca3-0b23-3702d0fb18cc	2205	Starše
00050000-5602-9ca3-60b8-69f82d078b52	2289	Stoperce
00050000-5602-9ca3-885f-ea7c25d8609c	8322	Stopiče
00050000-5602-9ca3-54b7-e633ddfd7f0f	3206	Stranice
00050000-5602-9ca3-dc10-cf5042dd9b57	8351	Straža
00050000-5602-9ca3-878c-10b802d5b294	1313	Struge
00050000-5602-9ca3-0acd-f166bc17ce4a	8293	Studenec
00050000-5602-9ca3-16d2-a67afeae4a24	8331	Suhor
00050000-5602-9ca3-cf8c-408431bac340	2233	Sv. Ana v Slovenskih goricah
00050000-5602-9ca3-f5d3-6d2501a340b7	2235	Sv. Trojica v Slovenskih goricah
00050000-5602-9ca3-74e7-d4533e7cf229	2353	Sveti Duh na Ostrem Vrhu
00050000-5602-9ca3-7dbc-215faf62149a	9244	Sveti Jurij ob Ščavnici
00050000-5602-9ca3-4d64-c382edc444df	3264	Sveti Štefan
00050000-5602-9ca3-fb3c-81bad7f24e64	2258	Sveti Tomaž
00050000-5602-9ca3-a4d3-3f5b1b0936a8	9204	Šalovci
00050000-5602-9ca3-324f-29f919f07467	5261	Šempas
00050000-5602-9ca3-bc40-416b2cd17df9	5290	Šempeter pri Gorici
00050000-5602-9ca3-0b9a-0ffd8cc62282	3311	Šempeter v Savinjski dolini
00050000-5602-9ca3-63ae-ca5420a0b3ce	4208	Šenčur
00050000-5602-9ca3-1fc2-18d002fbe0b9	2212	Šentilj v Slovenskih goricah
00050000-5602-9ca3-5507-7d36b5612009	8297	Šentjanž
00050000-5602-9ca3-904a-3dd6a6eb381a	2373	Šentjanž pri Dravogradu
00050000-5602-9ca3-5ec5-26f818470d39	8310	Šentjernej
00050000-5602-9ca3-a3be-ae29ddb5aeb1	3230	Šentjur
00050000-5602-9ca3-4c61-e702adb6be19	3271	Šentrupert
00050000-5602-9ca3-07f9-7c4ec833a4e5	8232	Šentrupert
00050000-5602-9ca3-8b69-1b4817bdaa92	1296	Šentvid pri Stični
00050000-5602-9ca3-0308-8e86b188b396	8275	Škocjan
00050000-5602-9ca3-d7d6-9ea9852fe37c	6281	Škofije
00050000-5602-9ca3-db92-863b074ec6db	4220	Škofja Loka
00050000-5602-9ca3-ecc2-2abca2158b91	3211	Škofja vas
00050000-5602-9ca3-bb3e-e4a936b032c4	1291	Škofljica
00050000-5602-9ca3-d81c-e3bfb6c18171	6274	Šmarje
00050000-5602-9ca3-2215-b9a0cf810dcc	1293	Šmarje - Sap
00050000-5602-9ca3-3b2e-68765f5e8547	3240	Šmarje pri Jelšah
00050000-5602-9ca3-4081-84c2754b001b	8220	Šmarješke Toplice
00050000-5602-9ca3-eb09-dd4e5dce7199	2315	Šmartno na Pohorju
00050000-5602-9ca3-b1c1-6d1d456d0c85	3341	Šmartno ob Dreti
00050000-5602-9ca3-f4ee-12c7ce50c780	3327	Šmartno ob Paki
00050000-5602-9ca3-f5cb-61feacc6f339	1275	Šmartno pri Litiji
00050000-5602-9ca3-42e0-7007d1bba91b	2383	Šmartno pri Slovenj Gradcu
00050000-5602-9ca3-8751-a02ef4a2ecf4	3201	Šmartno v Rožni dolini
00050000-5602-9ca3-d003-3bc408e6e971	3325	Šoštanj
00050000-5602-9ca3-775a-05206b9d1b0a	6222	Štanjel
00050000-5602-9ca3-2e2f-94d5ac8ef786	3220	Štore
00050000-5602-9ca3-4b44-77424adfa135	3304	Tabor
00050000-5602-9ca3-d9a1-264fb39ab36b	3221	Teharje
00050000-5602-9ca3-f760-b82d56d7346b	9251	Tišina
00050000-5602-9ca3-58e6-36d54af3d6cb	5220	Tolmin
00050000-5602-9ca3-32bd-4809e9dea433	3326	Topolšica
00050000-5602-9ca3-8a4a-0a11139ea6c3	2371	Trbonje
00050000-5602-9ca3-201d-64c54a7c01ea	1420	Trbovlje
00050000-5602-9ca3-740e-10f4e0a691c6	8231	Trebelno 
00050000-5602-9ca3-7145-58cad1053c4c	8210	Trebnje
00050000-5602-9ca3-c78d-002a223b88f0	5252	Trnovo pri Gorici
00050000-5602-9ca3-4eb6-475cbd26c8f4	2254	Trnovska vas
00050000-5602-9ca3-af85-f5ed32b1c626	1222	Trojane
00050000-5602-9ca3-9587-79dbe46f6769	1236	Trzin
00050000-5602-9ca3-8e46-71268af90ebd	4290	Tržič
00050000-5602-9ca3-86c1-c349e202273b	8295	Tržišče
00050000-5602-9ca3-41d2-5f6f09b3dcc3	1311	Turjak
00050000-5602-9ca3-fbba-cfc0dcbe24ac	9224	Turnišče
00050000-5602-9ca3-7b42-4b0bde2b8228	8323	Uršna sela
00050000-5602-9ca3-1877-1479f66ce90f	1252	Vače
00050000-5602-9ca3-805c-d336906eff8b	3320	Velenje 
00050000-5602-9ca3-ada1-5242a36e687c	3322	Velenje - poštni predali
00050000-5602-9ca3-6726-853b55767ca0	8212	Velika Loka
00050000-5602-9ca3-89bf-cfe1a97bd472	2274	Velika Nedelja
00050000-5602-9ca3-c916-499fd1bd0cf4	9225	Velika Polana
00050000-5602-9ca3-290f-900be93d43a7	1315	Velike Lašče
00050000-5602-9ca3-43bd-6202cb420772	8213	Veliki Gaber
00050000-5602-9ca3-1401-450a49f9f0db	9241	Veržej
00050000-5602-9ca3-3d99-93238e8fc424	1312	Videm - Dobrepolje
00050000-5602-9ca3-87d9-9e9b3e700c14	2284	Videm pri Ptuju
00050000-5602-9ca3-2e26-7f21bcab58f3	8344	Vinica
00050000-5602-9ca3-d798-70f76adf7482	5271	Vipava
00050000-5602-9ca3-d023-7cd3ce22049d	4212	Visoko
00050000-5602-9ca3-13cf-ac6e494fabaa	1294	Višnja Gora
00050000-5602-9ca3-11ba-81d4ad12d597	3205	Vitanje
00050000-5602-9ca3-31fd-a3addacdff97	2255	Vitomarci
00050000-5602-9ca3-1a3e-ba68a613d763	1217	Vodice
00050000-5602-9ca3-537e-cb3d60af9909	3212	Vojnik\t
00050000-5602-9ca3-8a2b-ddba85ec0f37	5293	Volčja Draga
00050000-5602-9ca3-d370-aa4119ef988b	2232	Voličina
00050000-5602-9ca3-d985-b134c0dc6ddc	3305	Vransko
00050000-5602-9ca3-369f-06914c4b7053	6217	Vremski Britof
00050000-5602-9ca3-9772-d20eaadc9a71	1360	Vrhnika
00050000-5602-9ca3-4fc4-6943f756f04d	2365	Vuhred
00050000-5602-9ca3-724e-d0bedf146267	2367	Vuzenica
00050000-5602-9ca3-ad3e-009f4dbd1e28	8292	Zabukovje 
00050000-5602-9ca3-df44-a77034c4b7bf	1410	Zagorje ob Savi
00050000-5602-9ca3-ed8a-119d12509f71	1303	Zagradec
00050000-5602-9ca3-610f-bc93090b6480	2283	Zavrč
00050000-5602-9ca3-f08a-944b567b0046	8272	Zdole 
00050000-5602-9ca3-1a7e-883ccffe02e0	4201	Zgornja Besnica
00050000-5602-9ca3-7711-f7ae11ef9cb3	2242	Zgornja Korena
00050000-5602-9ca3-ae60-d80157bb8ead	2201	Zgornja Kungota
00050000-5602-9ca3-a74b-6a3c527243c4	2316	Zgornja Ložnica
00050000-5602-9ca3-78a0-8c7df4c77381	2314	Zgornja Polskava
00050000-5602-9ca3-925e-605763071fde	2213	Zgornja Velka
00050000-5602-9ca3-f16f-f888dcc3d1d5	4247	Zgornje Gorje
00050000-5602-9ca3-fbda-1062618cf4e2	4206	Zgornje Jezersko
00050000-5602-9ca3-30f1-2177a54fd038	2285	Zgornji Leskovec
00050000-5602-9ca3-77c2-4bf0a2f527a5	1432	Zidani Most
00050000-5602-9ca3-aa68-357d717b8c9b	3214	Zreče
00050000-5602-9ca3-efaf-086ee9574cb9	4209	Žabnica
00050000-5602-9ca3-97a3-cd8493c5b523	3310	Žalec
00050000-5602-9ca3-c65a-87fe6b459da3	4228	Železniki
00050000-5602-9ca3-a37b-0bece92054a9	2287	Žetale
00050000-5602-9ca3-539a-d1feba6ce2e0	4226	Žiri
00050000-5602-9ca3-373a-11cf58a8b43c	4274	Žirovnica
00050000-5602-9ca3-1252-6a19f440ceaa	8360	Žužemberk
\.


--
-- TOC entry 3024 (class 0 OID 20551938)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20551563)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2978 (class 0 OID 20551343)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5602-9ca5-5fc5-70236290213a	00080000-5602-9ca5-76a5-d53993b08352	\N	00040000-5602-9ca3-cad1-d328b67d6c0d	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5602-9ca5-92a1-543dec071e2e	00080000-5602-9ca5-76a5-d53993b08352	\N	00040000-5602-9ca3-cad1-d328b67d6c0d	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5602-9ca5-dcad-1645fd1fa4bc	00080000-5602-9ca5-4cb1-77c8d39f0769	\N	00040000-5602-9ca3-cad1-d328b67d6c0d	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2986 (class 0 OID 20551447)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20551575)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20551952)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3026 (class 0 OID 20551962)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5602-9ca5-2bf9-de8ca68be922	00080000-5602-9ca5-f96a-a093f45b3e46	0987	AK
00190000-5602-9ca5-ff5a-c2102d7149ba	00080000-5602-9ca5-4cb1-77c8d39f0769	0989	AK
00190000-5602-9ca5-8b7a-002cf7321fad	00080000-5602-9ca5-313d-9c07b3ed3b93	0986	AK
00190000-5602-9ca5-52fa-b6c6405496a3	00080000-5602-9ca5-6f38-b11a6e4a6903	0984	AK
00190000-5602-9ca5-2931-13375eff29ad	00080000-5602-9ca5-9e08-77921b5e944f	0983	AK
00190000-5602-9ca5-d76d-e8fdda3d0cb9	00080000-5602-9ca5-9132-a02c18f6bace	0982	AK
00190000-5602-9ca7-ddf0-442a9c05dd93	00080000-5602-9ca7-27ee-678095975912	1001	AK
\.


--
-- TOC entry 3023 (class 0 OID 20551895)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5602-9ca6-730b-aa013db0176b	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3027 (class 0 OID 20551970)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20551604)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5602-9ca5-49a2-ccbda3823dff	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5602-9ca5-7498-b20ba8db373c	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5602-9ca5-7032-6ccab87ba725	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5602-9ca5-c09c-1261cfc6b856	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5602-9ca5-3fc7-dbfff79baf3b	\N	\N	0005	Komorni oder	t	\N	t	15	Komorni oder
00220000-5602-9ca5-c69b-ca330cba25fc	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5602-9ca5-af73-c7991a6efd0e	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2995 (class 0 OID 20551548)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20551538)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3016 (class 0 OID 20551747)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3010 (class 0 OID 20551678)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20551421)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20551216)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5602-9ca7-27ee-678095975912	00010000-5602-9ca4-0fb3-a642af27eed8	2015-09-23 14:35:51	INS	a:0:{}
2	App\\Entity\\Option	00000000-5602-9ca7-1db3-d81bc543cb48	00010000-5602-9ca4-0fb3-a642af27eed8	2015-09-23 14:35:51	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5602-9ca7-ddf0-442a9c05dd93	00010000-5602-9ca4-0fb3-a642af27eed8	2015-09-23 14:35:51	INS	a:0:{}
\.


--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3004 (class 0 OID 20551617)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20551254)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5602-9ca4-c6f6-0c2cad9c8a23	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5602-9ca4-c1f6-dd6dd634523d	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5602-9ca4-efc7-185f8ec575c4	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5602-9ca4-fcb7-dd5c465a895b	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5602-9ca4-38f5-248e506e401c	planer	Planer dogodkov v koledarju	t
00020000-5602-9ca4-d2f0-246b1dace917	kadrovska	Kadrovska služba	t
00020000-5602-9ca4-40c9-442cc1b8f20f	arhivar	Ažuriranje arhivalij	t
00020000-5602-9ca4-eebd-d13757229646	igralec	Igralec	t
00020000-5602-9ca4-2110-6c84533e48d2	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5602-9ca5-83a8-292ca25b9c7f	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2969 (class 0 OID 20551238)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5602-9ca4-5173-b0a4b98d35ca	00020000-5602-9ca4-efc7-185f8ec575c4
00010000-5602-9ca4-0fb3-a642af27eed8	00020000-5602-9ca4-efc7-185f8ec575c4
00010000-5602-9ca5-bf1d-6ed2960c9a56	00020000-5602-9ca5-83a8-292ca25b9c7f
\.


--
-- TOC entry 3006 (class 0 OID 20551631)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20551569)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2992 (class 0 OID 20551515)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2965 (class 0 OID 20551203)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5602-9ca3-7a21-c95b52311acd	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5602-9ca3-a00b-ec44bafcc10c	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5602-9ca3-1f28-9e5307f6640b	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5602-9ca3-36bf-1c941be2f435	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5602-9ca3-0f12-897f4bdcd47b	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2964 (class 0 OID 20551195)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5602-9ca3-62dd-06d748c90066	00230000-5602-9ca3-36bf-1c941be2f435	popa
00240000-5602-9ca3-444a-4a37e6c39703	00230000-5602-9ca3-36bf-1c941be2f435	oseba
00240000-5602-9ca3-3854-4892f234f35b	00230000-5602-9ca3-36bf-1c941be2f435	sezona
00240000-5602-9ca3-41c4-c38543f24699	00230000-5602-9ca3-a00b-ec44bafcc10c	prostor
00240000-5602-9ca3-6bdb-2b0a87312694	00230000-5602-9ca3-36bf-1c941be2f435	besedilo
00240000-5602-9ca3-7e1c-c4a411c9d91f	00230000-5602-9ca3-36bf-1c941be2f435	uprizoritev
00240000-5602-9ca3-9c75-a12b9ae215a3	00230000-5602-9ca3-36bf-1c941be2f435	funkcija
00240000-5602-9ca3-4ec3-7eab5a63654c	00230000-5602-9ca3-36bf-1c941be2f435	tipfunkcije
00240000-5602-9ca3-a2e0-e50fe98b1a82	00230000-5602-9ca3-36bf-1c941be2f435	alternacija
00240000-5602-9ca3-14fe-c1ec404ddb02	00230000-5602-9ca3-7a21-c95b52311acd	pogodba
00240000-5602-9ca3-109a-7b99ed1bb294	00230000-5602-9ca3-36bf-1c941be2f435	zaposlitev
00240000-5602-9ca3-b948-939442d5c031	00230000-5602-9ca3-36bf-1c941be2f435	zvrstuprizoritve
00240000-5602-9ca3-edb0-f619330362e0	00230000-5602-9ca3-7a21-c95b52311acd	programdela
00240000-5602-9ca3-64fa-518e24b357f0	00230000-5602-9ca3-36bf-1c941be2f435	zapis
\.


--
-- TOC entry 2963 (class 0 OID 20551190)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
cee9b7bc-f3cf-4e6f-9246-b439a25a1368	00240000-5602-9ca3-62dd-06d748c90066	0	1001
\.


--
-- TOC entry 3012 (class 0 OID 20551695)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5602-9ca6-37ee-a44a93ec1f13	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	00080000-5602-9ca5-76a5-d53993b08352	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5602-9ca4-f938-3034d63b93f3
00270000-5602-9ca6-1248-49e64c1e4e51	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	00080000-5602-9ca5-76a5-d53993b08352	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5602-9ca4-f938-3034d63b93f3
\.


--
-- TOC entry 2976 (class 0 OID 20551316)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20551525)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5602-9ca6-90ec-2d5c44ba6d71	00180000-5602-9ca5-652e-44886c756870	000c0000-5602-9ca6-383d-4fe1c56e600f	00090000-5602-9ca5-d901-69650286e41d	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9ca6-b457-bd49aede858b	00180000-5602-9ca5-652e-44886c756870	000c0000-5602-9ca6-ddaf-a5f18764be85	00090000-5602-9ca5-e9f8-6db9215a57f5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9ca6-e52e-b13b140d2e73	00180000-5602-9ca5-652e-44886c756870	000c0000-5602-9ca6-9922-8fbc1b719acf	00090000-5602-9ca5-25d6-222f72e282c4	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9ca6-97f2-aa6cf6999962	00180000-5602-9ca5-652e-44886c756870	000c0000-5602-9ca6-a6ed-e8dcb5316a1e	00090000-5602-9ca5-99ce-af2dc25a99c5	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9ca6-445e-ba6a6dcdacc8	00180000-5602-9ca5-652e-44886c756870	000c0000-5602-9ca6-64c1-ad03ba324081	00090000-5602-9ca5-5311-36b853b1c754	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5602-9ca6-6f05-dc6fd3c58c5e	00180000-5602-9ca5-2d2a-11f81d2c5461	\N	00090000-5602-9ca5-5311-36b853b1c754	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3015 (class 0 OID 20551735)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje) FROM stdin;
000f0000-5602-9ca3-5fe9-c56b0c237527	01	Avtor	Avtorji	Avtorka	umetnik
000f0000-5602-9ca3-0804-7a10a674cf88	02	Priredba	Priredba	Priredba	umetnik
000f0000-5602-9ca3-0503-2396dabbe9a2	03	Prevod	Prevod	Prevod	umetnik
000f0000-5602-9ca3-77ba-e30904fb98bf	04	Režija	Režija	Režija	umetnik
000f0000-5602-9ca3-eb75-dfa911d8c0c5	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik
000f0000-5602-9ca3-3608-41749bbd383c	06	Scenografija	Scenografija	Scenografija	umetnik
000f0000-5602-9ca3-0512-18c00cb0c3d6	07	Kostumografija	Kostumografija	Kostumografija	umetnik
000f0000-5602-9ca3-c7e8-a9be58ea463f	08	Koreografija	Koreografija	Koreografija	umetnik
000f0000-5602-9ca3-7a91-c6e033b51c97	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik
000f0000-5602-9ca3-8cbf-04dbf4c08af9	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik
000f0000-5602-9ca3-f2a7-08ced678de24	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik
000f0000-5602-9ca3-cc13-e77ef344f045	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik
000f0000-5602-9ca3-ada5-7c6d6d96bd1e	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik
000f0000-5602-9ca3-06ea-8a30ebaa72e9	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik
000f0000-5602-9ca3-d26d-983447cf454e	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec
000f0000-5602-9ca3-35ed-5fe5aedbcfdf	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik
000f0000-5602-9ca3-02cf-e7c1e2c6ebbb	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik
000f0000-5602-9ca3-bf43-a049fb0f11ce	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient
\.


--
-- TOC entry 3028 (class 0 OID 20551980)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5602-9ca3-7379-45d48f6af19c	01	Velika predstava	f	1.00	1.00
002b0000-5602-9ca3-cc3b-1bec0a73b329	02	Mala predstava	f	0.50	0.50
002b0000-5602-9ca3-7b3d-2aa9e02dea25	03	Mala koprodukcija	t	0.40	1.00
002b0000-5602-9ca3-d789-9f19366639c7	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5602-9ca3-5b1e-ee068eb79547	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2981 (class 0 OID 20551378)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2968 (class 0 OID 20551225)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5602-9ca4-0fb3-a642af27eed8	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROWtAPugIv83imCR7zQf3QiwM3spXRB0K	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-b18e-276208f6cf85	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-0164-5d1641ba585f	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-4a76-d35505906d8e	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-d3e5-ff07c77ca40b	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-3328-c4adeedcb1d0	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-ab50-70e393ea2ac1	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-e891-a5693029761f	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-dcad-78baffa1d087	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-4de6-40f9a5bc6541	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5602-9ca5-bf1d-6ed2960c9a56	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5602-9ca4-5173-b0a4b98d35ca	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3019 (class 0 OID 20551785)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, maticnioder_id) FROM stdin;
000e0000-5602-9ca5-6d77-876bdcf66d6c	00160000-5602-9ca5-0f89-57ba6d3165ac	\N	00140000-5602-9ca3-67d2-d91dbaead861	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		00220000-5602-9ca5-3fc7-dbfff79baf3b
000e0000-5602-9ca5-e5ac-1bc7ad9c176d	00160000-5602-9ca5-147c-8b9e1dd684d3	\N	00140000-5602-9ca3-2757-968dc3068b77	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		00220000-5602-9ca5-c69b-ca330cba25fc
000e0000-5602-9ca5-ea78-081a69b412bf	\N	\N	00140000-5602-9ca3-2757-968dc3068b77	00190000-5602-9ca5-2bf9-de8ca68be922	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-9ca5-3fc7-dbfff79baf3b
000e0000-5602-9ca5-a59f-859e8ce24bc0	\N	\N	00140000-5602-9ca3-2757-968dc3068b77	00190000-5602-9ca5-2bf9-de8ca68be922	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		00220000-5602-9ca5-3fc7-dbfff79baf3b
000e0000-5602-9ca5-f5db-04d677bc28b1	\N	\N	00140000-5602-9ca3-2757-968dc3068b77	00190000-5602-9ca5-2bf9-de8ca68be922	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		00220000-5602-9ca5-49a2-ccbda3823dff
000e0000-5602-9ca5-8a85-3e117391845f	\N	\N	00140000-5602-9ca3-2757-968dc3068b77	00190000-5602-9ca5-2bf9-de8ca68be922	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		00220000-5602-9ca5-49a2-ccbda3823dff
\.


--
-- TOC entry 2988 (class 0 OID 20551468)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5602-9ca5-ab77-a8899280a517	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	\N	1	
00200000-5602-9ca5-f99d-8ca58402a73d	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	\N	2	
00200000-5602-9ca5-c947-d3461066718a	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	\N	3	
00200000-5602-9ca5-9d1c-fee99b869e53	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	\N	4	
00200000-5602-9ca5-8504-cf004a0c67c1	000e0000-5602-9ca5-e5ac-1bc7ad9c176d	\N	5	
\.


--
-- TOC entry 3002 (class 0 OID 20551596)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20551709)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5602-9ca4-cb14-843f31d50f42	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5602-9ca4-1184-dea6444fc2cd	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5602-9ca4-5122-202e0f023a37	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5602-9ca4-4895-15ca5eb927d0	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5602-9ca4-1d53-42d0a112ebf5	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5602-9ca4-7f73-b579dda7bfb0	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5602-9ca4-ebbc-70c9a64ebffc	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5602-9ca4-620b-b6e771ffc348	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5602-9ca4-f938-3034d63b93f3	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5602-9ca4-ed6a-216a728adc20	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5602-9ca4-0677-1013af184cf0	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5602-9ca4-862b-d0b6c81d043b	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5602-9ca4-4913-8fc6c6fcd07c	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5602-9ca4-0fc8-2ab28390864d	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5602-9ca4-5d67-eeb3be7d9324	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5602-9ca4-c173-c8bf494220b5	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5602-9ca4-2639-a289f0d69ce0	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5602-9ca4-d3d3-ee0e17fbb9e6	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5602-9ca4-1ed5-4956b3623a76	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5602-9ca4-69f0-c908d96c34f2	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5602-9ca4-71d5-85d497b7b14d	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5602-9ca4-8ce1-b988f6ea9c86	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5602-9ca4-bfd5-bc94dd13c725	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5602-9ca4-b257-e633cedb844b	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5602-9ca4-1b46-cb4b81768df2	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5602-9ca4-a7ae-017d739c3004	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5602-9ca4-6102-63d12717b110	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5602-9ca4-c986-873aeeedae80	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3031 (class 0 OID 20552027)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20551999)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20552039)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20551668)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5602-9ca5-4b66-7a5039d8a93e	00090000-5602-9ca5-e9f8-6db9215a57f5	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9ca5-5ead-d7a5e1d3b08e	00090000-5602-9ca5-25d6-222f72e282c4	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9ca5-b4e6-b18d8edaf305	00090000-5602-9ca5-c442-88a195d786a4	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9ca5-e003-71c1e9f630cb	00090000-5602-9ca5-9911-1accf4a81844	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9ca5-35c9-97f586f1a6b5	00090000-5602-9ca5-d901-69650286e41d	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5602-9ca5-4801-cbbab012176b	00090000-5602-9ca5-03cc-22ddad4bfeff	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2990 (class 0 OID 20551504)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20551775)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5602-9ca3-67d2-d91dbaead861	01	Drama	drama (SURS 01)
00140000-5602-9ca3-fdaf-20ae22438edc	02	Opera	opera (SURS 02)
00140000-5602-9ca3-9d04-bc8096867874	03	Balet	balet (SURS 03)
00140000-5602-9ca3-0805-6e9d09ef8abd	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5602-9ca3-a87b-20c8932a2713	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5602-9ca3-2757-968dc3068b77	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5602-9ca3-3936-bce75f01cc20	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3008 (class 0 OID 20551658)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2495 (class 2606 OID 20551279)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 20551834)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20551824)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20551692)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20551733)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20552079)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20551493)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20551514)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2720 (class 2606 OID 20551997)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20551404)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 20551889)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20551654)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20551466)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2546 (class 2606 OID 20551442)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2537 (class 2606 OID 20551418)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20551561)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 20552056)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20552063)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2749 (class 2606 OID 20552087)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2467 (class 2606 OID 19946842)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2607 (class 2606 OID 20551588)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2522 (class 2606 OID 20551376)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2499 (class 2606 OID 20551288)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2502 (class 2606 OID 20551312)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2493 (class 2606 OID 20551268)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2486 (class 2606 OID 20551253)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2610 (class 2606 OID 20551594)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20551630)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2669 (class 2606 OID 20551770)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2511 (class 2606 OID 20551340)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20551364)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2704 (class 2606 OID 20551950)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20551567)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2517 (class 2606 OID 20551354)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20551454)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20551579)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20551959)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20551967)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 20551937)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2715 (class 2606 OID 20551978)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 20551612)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2593 (class 2606 OID 20551552)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2587 (class 2606 OID 20551543)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 20551757)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20551685)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2540 (class 2606 OID 20551430)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2478 (class 2606 OID 20551224)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2622 (class 2606 OID 20551621)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 20551242)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2488 (class 2606 OID 20551262)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2629 (class 2606 OID 20551639)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20551574)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20551523)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2475 (class 2606 OID 20551212)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2472 (class 2606 OID 20551200)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20551194)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2653 (class 2606 OID 20551705)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2508 (class 2606 OID 20551321)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2581 (class 2606 OID 20551534)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2660 (class 2606 OID 20551744)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20551990)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2527 (class 2606 OID 20551389)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20551237)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2681 (class 2606 OID 20551803)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20551476)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2613 (class 2606 OID 20551602)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20551717)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2731 (class 2606 OID 20552037)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2728 (class 2606 OID 20552021)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 20552045)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2640 (class 2606 OID 20551676)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2571 (class 2606 OID 20551508)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 20551783)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2637 (class 2606 OID 20551666)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2559 (class 1259 OID 20551502)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2560 (class 1259 OID 20551503)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2561 (class 1259 OID 20551501)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2562 (class 1259 OID 20551500)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2563 (class 1259 OID 20551499)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2649 (class 1259 OID 20551706)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2650 (class 1259 OID 20551707)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2651 (class 1259 OID 20551708)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2735 (class 1259 OID 20552058)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2736 (class 1259 OID 20552057)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2509 (class 1259 OID 20551342)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2608 (class 1259 OID 20551595)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2722 (class 1259 OID 20552025)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2723 (class 1259 OID 20552024)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2724 (class 1259 OID 20552026)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2725 (class 1259 OID 20552023)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2726 (class 1259 OID 20552022)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2602 (class 1259 OID 20551581)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2603 (class 1259 OID 20551580)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2554 (class 1259 OID 20551477)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2632 (class 1259 OID 20551655)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2633 (class 1259 OID 20551657)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2634 (class 1259 OID 20551656)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2534 (class 1259 OID 20551420)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2535 (class 1259 OID 20551419)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2713 (class 1259 OID 20551979)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2665 (class 1259 OID 20551772)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2666 (class 1259 OID 20551773)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2667 (class 1259 OID 20551774)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2732 (class 1259 OID 20552046)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2674 (class 1259 OID 20551808)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2675 (class 1259 OID 20551805)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2676 (class 1259 OID 20551809)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2677 (class 1259 OID 20551807)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2678 (class 1259 OID 20551806)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2524 (class 1259 OID 20551391)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2525 (class 1259 OID 20551390)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2500 (class 1259 OID 20551315)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2620 (class 1259 OID 20551622)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2490 (class 1259 OID 20551269)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2491 (class 1259 OID 20551270)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2625 (class 1259 OID 20551642)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2626 (class 1259 OID 20551641)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2627 (class 1259 OID 20551640)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2547 (class 1259 OID 20551455)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2548 (class 1259 OID 20551456)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2470 (class 1259 OID 20551202)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2582 (class 1259 OID 20551547)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2583 (class 1259 OID 20551545)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2584 (class 1259 OID 20551544)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2585 (class 1259 OID 20551546)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2481 (class 1259 OID 20551243)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2482 (class 1259 OID 20551244)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2611 (class 1259 OID 20551603)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2745 (class 1259 OID 20552080)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2647 (class 1259 OID 20551694)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2648 (class 1259 OID 20551693)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2746 (class 1259 OID 20552088)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2747 (class 1259 OID 20552089)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2597 (class 1259 OID 20551568)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2641 (class 1259 OID 20551686)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2642 (class 1259 OID 20551687)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2695 (class 1259 OID 20551894)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2696 (class 1259 OID 20551893)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2697 (class 1259 OID 20551890)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2698 (class 1259 OID 20551891)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2699 (class 1259 OID 20551892)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2513 (class 1259 OID 20551356)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2514 (class 1259 OID 20551355)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2515 (class 1259 OID 20551357)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2614 (class 1259 OID 20551616)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2615 (class 1259 OID 20551615)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2705 (class 1259 OID 20551960)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2706 (class 1259 OID 20551961)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2688 (class 1259 OID 20551838)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2689 (class 1259 OID 20551839)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2690 (class 1259 OID 20551836)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2691 (class 1259 OID 20551837)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2638 (class 1259 OID 20551677)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2588 (class 1259 OID 20551556)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2589 (class 1259 OID 20551555)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2590 (class 1259 OID 20551553)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2591 (class 1259 OID 20551554)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2684 (class 1259 OID 20551826)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2685 (class 1259 OID 20551825)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2538 (class 1259 OID 20551431)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2541 (class 1259 OID 20551445)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2542 (class 1259 OID 20551444)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2543 (class 1259 OID 20551443)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2544 (class 1259 OID 20551446)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2553 (class 1259 OID 20551467)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2702 (class 1259 OID 20551951)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2721 (class 1259 OID 20551998)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2739 (class 1259 OID 20552064)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2740 (class 1259 OID 20552065)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2496 (class 1259 OID 20551290)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2497 (class 1259 OID 20551289)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2505 (class 1259 OID 20551322)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2506 (class 1259 OID 20551323)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2569 (class 1259 OID 20551509)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2577 (class 1259 OID 20551537)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2578 (class 1259 OID 20551536)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2579 (class 1259 OID 20551535)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2564 (class 1259 OID 20551495)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2565 (class 1259 OID 20551496)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2566 (class 1259 OID 20551494)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2567 (class 1259 OID 20551498)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2568 (class 1259 OID 20551497)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2512 (class 1259 OID 20551341)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2530 (class 1259 OID 20551405)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2531 (class 1259 OID 20551407)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2532 (class 1259 OID 20551406)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2533 (class 1259 OID 20551408)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2596 (class 1259 OID 20551562)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2670 (class 1259 OID 20551771)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2679 (class 1259 OID 20551804)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2661 (class 1259 OID 20551745)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2662 (class 1259 OID 20551746)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2503 (class 1259 OID 20551313)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2504 (class 1259 OID 20551314)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2635 (class 1259 OID 20551667)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2476 (class 1259 OID 20551213)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2523 (class 1259 OID 20551377)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2473 (class 1259 OID 20551201)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2718 (class 1259 OID 20551991)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2618 (class 1259 OID 20551614)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2619 (class 1259 OID 20551613)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2692 (class 1259 OID 20551835)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2520 (class 1259 OID 20551365)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2671 (class 1259 OID 20551784)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2729 (class 1259 OID 20552038)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2711 (class 1259 OID 20551968)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2712 (class 1259 OID 20551969)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2658 (class 1259 OID 20551734)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2576 (class 1259 OID 20551524)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2489 (class 1259 OID 20551263)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2780 (class 2606 OID 20552220)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2779 (class 2606 OID 20552225)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2775 (class 2606 OID 20552245)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2781 (class 2606 OID 20552215)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2777 (class 2606 OID 20552235)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2776 (class 2606 OID 20552240)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2778 (class 2606 OID 20552230)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2816 (class 2606 OID 20552410)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2815 (class 2606 OID 20552415)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2814 (class 2606 OID 20552420)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2848 (class 2606 OID 20552585)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2849 (class 2606 OID 20552580)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2761 (class 2606 OID 20552145)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2798 (class 2606 OID 20552330)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2843 (class 2606 OID 20552565)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2844 (class 2606 OID 20552560)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2842 (class 2606 OID 20552570)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2845 (class 2606 OID 20552555)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2846 (class 2606 OID 20552550)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2796 (class 2606 OID 20552325)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2797 (class 2606 OID 20552320)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2774 (class 2606 OID 20552210)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20552370)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2806 (class 2606 OID 20552380)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2807 (class 2606 OID 20552375)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2767 (class 2606 OID 20552180)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20552175)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2794 (class 2606 OID 20552310)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20552540)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2819 (class 2606 OID 20552425)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2818 (class 2606 OID 20552430)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2817 (class 2606 OID 20552435)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2847 (class 2606 OID 20552575)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2821 (class 2606 OID 20552455)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2824 (class 2606 OID 20552440)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2820 (class 2606 OID 20552460)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2822 (class 2606 OID 20552450)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2823 (class 2606 OID 20552445)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2765 (class 2606 OID 20552170)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20552165)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2757 (class 2606 OID 20552130)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2758 (class 2606 OID 20552125)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2802 (class 2606 OID 20552350)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 20552105)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2753 (class 2606 OID 20552110)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2803 (class 2606 OID 20552365)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2804 (class 2606 OID 20552360)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2805 (class 2606 OID 20552355)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2772 (class 2606 OID 20552195)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2771 (class 2606 OID 20552200)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2750 (class 2606 OID 20552090)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2786 (class 2606 OID 20552285)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2788 (class 2606 OID 20552275)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2789 (class 2606 OID 20552270)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2787 (class 2606 OID 20552280)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2752 (class 2606 OID 20552095)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2751 (class 2606 OID 20552100)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2799 (class 2606 OID 20552335)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2852 (class 2606 OID 20552600)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2812 (class 2606 OID 20552405)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2813 (class 2606 OID 20552400)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2854 (class 2606 OID 20552605)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 20552610)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2795 (class 2606 OID 20552315)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2811 (class 2606 OID 20552390)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2810 (class 2606 OID 20552395)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2831 (class 2606 OID 20552515)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2832 (class 2606 OID 20552510)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2835 (class 2606 OID 20552495)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2834 (class 2606 OID 20552500)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2833 (class 2606 OID 20552505)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2763 (class 2606 OID 20552155)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2764 (class 2606 OID 20552150)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2762 (class 2606 OID 20552160)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20552345)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2801 (class 2606 OID 20552340)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2838 (class 2606 OID 20552525)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2837 (class 2606 OID 20552530)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2828 (class 2606 OID 20552485)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2827 (class 2606 OID 20552490)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2830 (class 2606 OID 20552475)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2829 (class 2606 OID 20552480)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2809 (class 2606 OID 20552385)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2790 (class 2606 OID 20552305)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2791 (class 2606 OID 20552300)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2793 (class 2606 OID 20552290)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2792 (class 2606 OID 20552295)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2825 (class 2606 OID 20552470)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2826 (class 2606 OID 20552465)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2769 (class 2606 OID 20552185)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2770 (class 2606 OID 20552190)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2773 (class 2606 OID 20552205)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2836 (class 2606 OID 20552520)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2839 (class 2606 OID 20552535)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2841 (class 2606 OID 20552545)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2851 (class 2606 OID 20552590)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2850 (class 2606 OID 20552595)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2755 (class 2606 OID 20552120)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2756 (class 2606 OID 20552115)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2760 (class 2606 OID 20552135)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2759 (class 2606 OID 20552140)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2782 (class 2606 OID 20552250)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2783 (class 2606 OID 20552265)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2784 (class 2606 OID 20552260)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2785 (class 2606 OID 20552255)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-23 14:35:52 CEST

--
-- PostgreSQL database dump complete
--

