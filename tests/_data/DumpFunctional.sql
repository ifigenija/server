--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-29 08:34:11 CEST

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
-- TOC entry 181 (class 1259 OID 20974320)
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
-- TOC entry 229 (class 1259 OID 20974877)
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
-- TOC entry 228 (class 1259 OID 20974860)
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
-- TOC entry 219 (class 1259 OID 20974737)
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
-- TOC entry 222 (class 1259 OID 20974767)
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
-- TOC entry 243 (class 1259 OID 20975119)
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
-- TOC entry 197 (class 1259 OID 20974527)
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
-- TOC entry 199 (class 1259 OID 20974559)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20975045)
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
-- TOC entry 190 (class 1259 OID 20974441)
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
-- TOC entry 230 (class 1259 OID 20974890)
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
-- TOC entry 215 (class 1259 OID 20974692)
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
-- TOC entry 195 (class 1259 OID 20974506)
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
-- TOC entry 193 (class 1259 OID 20974481)
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
-- TOC entry 191 (class 1259 OID 20974458)
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
-- TOC entry 204 (class 1259 OID 20974606)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20975100)
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
-- TOC entry 242 (class 1259 OID 20975112)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20975134)
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
-- TOC entry 208 (class 1259 OID 20974631)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20974415)
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
-- TOC entry 182 (class 1259 OID 20974329)
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
-- TOC entry 183 (class 1259 OID 20974340)
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
-- TOC entry 178 (class 1259 OID 20974294)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20974313)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20974638)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20974672)
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
-- TOC entry 225 (class 1259 OID 20974808)
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
-- TOC entry 185 (class 1259 OID 20974373)
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
-- TOC entry 187 (class 1259 OID 20974407)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20974990)
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
-- TOC entry 205 (class 1259 OID 20974612)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20974392)
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
-- TOC entry 194 (class 1259 OID 20974496)
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
-- TOC entry 207 (class 1259 OID 20974624)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20975004)
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
-- TOC entry 234 (class 1259 OID 20975014)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20974947)
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
-- TOC entry 235 (class 1259 OID 20975022)
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
-- TOC entry 211 (class 1259 OID 20974653)
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
-- TOC entry 203 (class 1259 OID 20974597)
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
-- TOC entry 202 (class 1259 OID 20974587)
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
-- TOC entry 224 (class 1259 OID 20974797)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20974727)
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
-- TOC entry 192 (class 1259 OID 20974470)
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
-- TOC entry 175 (class 1259 OID 20974265)
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
-- TOC entry 174 (class 1259 OID 20974263)
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
-- TOC entry 212 (class 1259 OID 20974666)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20974303)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20974287)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20974680)
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
-- TOC entry 206 (class 1259 OID 20974618)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20974564)
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
-- TOC entry 173 (class 1259 OID 20974252)
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
-- TOC entry 172 (class 1259 OID 20974244)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20974239)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20974744)
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
-- TOC entry 184 (class 1259 OID 20974365)
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
-- TOC entry 201 (class 1259 OID 20974574)
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
-- TOC entry 223 (class 1259 OID 20974785)
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
-- TOC entry 236 (class 1259 OID 20975033)
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
-- TOC entry 189 (class 1259 OID 20974427)
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
-- TOC entry 176 (class 1259 OID 20974274)
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
-- TOC entry 227 (class 1259 OID 20974835)
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
-- TOC entry 196 (class 1259 OID 20974517)
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
-- TOC entry 210 (class 1259 OID 20974645)
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
-- TOC entry 221 (class 1259 OID 20974758)
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
-- TOC entry 239 (class 1259 OID 20975080)
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
-- TOC entry 238 (class 1259 OID 20975052)
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
-- TOC entry 240 (class 1259 OID 20975092)
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
-- TOC entry 217 (class 1259 OID 20974717)
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
-- TOC entry 198 (class 1259 OID 20974553)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20974825)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20974707)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20974268)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2977 (class 0 OID 20974320)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3025 (class 0 OID 20974877)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-560a-30e1-7b72-6a2e4a0b0b98	000d0000-560a-30e1-c75f-5a24ee486a87	\N	00090000-560a-30e1-04be-2af22346ad61	000b0000-560a-30e1-0d95-f4fceed89000	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-560a-30e1-28d3-52bc30f4b96d	000d0000-560a-30e1-45c9-c54509906cf3	00100000-560a-30e1-ab0b-830bd5e9e01a	00090000-560a-30e1-1a46-63c44a2c7f34	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-560a-30e1-6f2c-6214d837bc02	000d0000-560a-30e1-69aa-cd09d0d3942f	00100000-560a-30e1-e52c-1755de95b9bd	00090000-560a-30e1-4f3c-6e6df679e799	\N	0003	t	\N	2015-09-29	\N	2	t	\N	f	f
000c0000-560a-30e1-6f90-7e1d2b9d927f	000d0000-560a-30e1-a767-137485e048fb	\N	00090000-560a-30e1-c58f-ddf2b38d8fee	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-560a-30e1-abb7-c43b95845661	000d0000-560a-30e1-93d7-c5c146f2dcb7	\N	00090000-560a-30e1-c5e1-00e8349e3826	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-560a-30e1-a2c2-835968620946	000d0000-560a-30e1-4d87-f3aa0096a7f2	\N	00090000-560a-30e1-77a4-7999bc89a8ce	000b0000-560a-30e1-cefb-baa69697d514	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-560a-30e1-48f6-f3f5a8406e96	000d0000-560a-30e1-462a-1073c4432fcc	00100000-560a-30e1-ef3b-4a243ae8684b	00090000-560a-30e1-e974-545bc2b57c85	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-560a-30e1-d3f0-8b2eca0a51e8	000d0000-560a-30e1-bdf7-581553dc4b9b	\N	00090000-560a-30e1-0195-e05b2f5a4392	000b0000-560a-30e1-e96d-485853d3e1bd	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-560a-30e1-ce5d-a34338a6cba8	000d0000-560a-30e1-462a-1073c4432fcc	00100000-560a-30e1-db6c-d9101a19de95	00090000-560a-30e1-aba2-796e3d61d3d6	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-560a-30e1-bede-d172f46fb4d6	000d0000-560a-30e1-462a-1073c4432fcc	00100000-560a-30e1-d2f5-c620fa379451	00090000-560a-30e1-496f-b6816614cb05	\N	0010	t	\N	2015-09-29	\N	16	f	\N	f	t
000c0000-560a-30e1-a1d1-02554a9b21fc	000d0000-560a-30e1-462a-1073c4432fcc	00100000-560a-30e1-22a9-fc9fb8a86b4a	00090000-560a-30e1-564d-665472380c6e	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-560a-30e1-ceaa-f43617652d0a	000d0000-560a-30e1-f175-306d33338b75	\N	00090000-560a-30e1-1a46-63c44a2c7f34	000b0000-560a-30e1-52bb-0571a8489720	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3024 (class 0 OID 20974860)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20974737)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-560a-30e1-c69a-522172f2828a	00160000-560a-30e0-c902-4a207d78c261	00090000-560a-30e1-83bb-08024bca98b8	aizv	10	t
003d0000-560a-30e1-bdfb-a6742f4d73fd	00160000-560a-30e0-c902-4a207d78c261	00090000-560a-30e1-b59e-af014158f793	apri	14	t
003d0000-560a-30e1-a16a-2ce48d8e751d	00160000-560a-30e0-54c8-de697187a2b3	00090000-560a-30e1-dd70-5595fd6638be	aizv	11	t
003d0000-560a-30e1-844e-7b4895d739d4	00160000-560a-30e0-324d-08348137b103	00090000-560a-30e1-e0fc-3cebe3c3e9fd	aizv	12	t
003d0000-560a-30e1-e978-28a25c8b9e59	00160000-560a-30e0-c902-4a207d78c261	00090000-560a-30e1-d7f5-93dd64137304	apri	18	f
\.


--
-- TOC entry 3018 (class 0 OID 20974767)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-560a-30e0-c902-4a207d78c261	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-560a-30e0-54c8-de697187a2b3	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-560a-30e0-324d-08348137b103	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3039 (class 0 OID 20975119)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2993 (class 0 OID 20974527)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-560a-30e1-a357-6f994de742d0	\N	\N	00200000-560a-30e1-382f-2cb7847f3c3c	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-560a-30e1-a9cb-4dc3ee066ad9	\N	\N	00200000-560a-30e1-f345-5eb6597d9e62	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-560a-30e1-d6d3-942e59601afe	\N	\N	00200000-560a-30e1-61d8-af11a49848d6	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-560a-30e1-1336-f3e948ead98a	\N	\N	00200000-560a-30e1-3cf2-cacd2f186429	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-560a-30e1-002a-33a58c907d92	\N	\N	00200000-560a-30e1-330e-67960e16c761	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2995 (class 0 OID 20974559)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3033 (class 0 OID 20975045)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20974441)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-560a-30df-a5b0-7e36b6b5d4f3	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-560a-30df-00d5-9d2b78f8b26d	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-560a-30df-ad57-75d29bbc7ea1	AL	ALB	008	Albania 	Albanija	\N
00040000-560a-30df-3dd7-ddbb6a2b3ae7	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-560a-30df-0de2-dd6909c1c58f	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-560a-30df-70d8-2bf4f401eca0	AD	AND	020	Andorra 	Andora	\N
00040000-560a-30df-8ebb-8458c9baa478	AO	AGO	024	Angola 	Angola	\N
00040000-560a-30df-dc88-03536d26f7f8	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-560a-30df-f3d7-9664e5b1eee9	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-560a-30df-8acb-209c1e968280	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-30df-263e-7f75f9361230	AR	ARG	032	Argentina 	Argenitna	\N
00040000-560a-30df-ffea-dbd59d2ec398	AM	ARM	051	Armenia 	Armenija	\N
00040000-560a-30df-4199-299d540a528d	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-560a-30df-9d30-cd5cd0d7dbab	AU	AUS	036	Australia 	Avstralija	\N
00040000-560a-30df-90b7-1bf5e735398f	AT	AUT	040	Austria 	Avstrija	\N
00040000-560a-30df-a005-b0e6d5e8009c	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-560a-30df-1a48-50de6ff5efa9	BS	BHS	044	Bahamas 	Bahami	\N
00040000-560a-30df-147a-6931cd4a095d	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-560a-30df-77a0-46cde24b6b88	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-560a-30df-06b5-0cd0c7e4bda7	BB	BRB	052	Barbados 	Barbados	\N
00040000-560a-30df-5807-464cbeafe143	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-560a-30df-a9df-b5d7bd05beff	BE	BEL	056	Belgium 	Belgija	\N
00040000-560a-30df-217c-8137936f35c5	BZ	BLZ	084	Belize 	Belize	\N
00040000-560a-30df-91e7-f3b333bfb163	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-560a-30df-9b85-eacf5425d01f	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-560a-30df-9b86-616c961bed65	BT	BTN	064	Bhutan 	Butan	\N
00040000-560a-30df-f2fa-b239c571cfe5	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-560a-30df-b717-da3bb27ee69b	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-560a-30df-1721-11957b83ad0e	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-560a-30df-0201-a951523fee63	BW	BWA	072	Botswana 	Bocvana	\N
00040000-560a-30df-b8b5-37b1333eaa8f	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-560a-30df-5645-8ce68a6dec7a	BR	BRA	076	Brazil 	Brazilija	\N
00040000-560a-30df-53af-c76703d917b3	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-560a-30df-cb64-e6dfbb524b9e	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-560a-30df-3f10-02f98f9a245d	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-560a-30df-0c3a-ddd7ec56c89f	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-560a-30df-7611-ab39e992b856	BI	BDI	108	Burundi 	Burundi 	\N
00040000-560a-30df-6c9a-ff085ed331ba	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-560a-30df-927b-a25704f2e566	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-560a-30df-2217-ab5e933d2a0a	CA	CAN	124	Canada 	Kanada	\N
00040000-560a-30df-21fb-9d157f7dafc2	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-560a-30df-3870-d9b7bf00ad53	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-560a-30df-79c0-214de03a573f	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-560a-30df-1e4d-0507a669acf8	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-560a-30df-c8a6-2274157435f9	CL	CHL	152	Chile 	Čile	\N
00040000-560a-30df-ebbf-74312b9ea899	CN	CHN	156	China 	Kitajska	\N
00040000-560a-30df-443f-9aaa6be045af	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-560a-30df-1f06-17abace399f5	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-560a-30df-652c-bfa005e102e3	CO	COL	170	Colombia 	Kolumbija	\N
00040000-560a-30df-4de1-deb19dbc53af	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-560a-30df-c2a5-fe8211881802	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-560a-30df-6e1d-57a3772000e2	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-560a-30df-c126-8baf5271642b	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-560a-30df-d479-6941f643030f	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-560a-30df-fb61-a5ad8c760681	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-560a-30df-a8dd-63767c9290d5	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-560a-30df-d472-5d41a5654a1a	CU	CUB	192	Cuba 	Kuba	\N
00040000-560a-30df-b528-2a8b9702291d	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-560a-30df-0a02-53f393a08266	CY	CYP	196	Cyprus 	Ciper	\N
00040000-560a-30df-e620-1d933fb0a3ed	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-560a-30df-4751-f396dd90cb7a	DK	DNK	208	Denmark 	Danska	\N
00040000-560a-30df-2549-6bf112a070e0	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-560a-30df-7749-ab22d0ccef5c	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-560a-30df-581a-b88765dedf16	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-560a-30df-8c0d-a685bb34350a	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-560a-30df-cc9b-64bc952719c5	EG	EGY	818	Egypt 	Egipt	\N
00040000-560a-30df-9083-8845b58b594c	SV	SLV	222	El Salvador 	Salvador	\N
00040000-560a-30df-3d02-61954a8e65a6	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-560a-30df-5cc7-c25ee2218641	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-560a-30df-9573-048e25b1b847	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-560a-30df-b2b8-2019d8258e67	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-560a-30df-3c80-821bf787c882	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-560a-30df-d283-ecc73dd46101	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-560a-30df-9d31-d400aaba85c7	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-560a-30df-4671-0e00349ec646	FI	FIN	246	Finland 	Finska	\N
00040000-560a-30df-13a0-07b5547d8890	FR	FRA	250	France 	Francija	\N
00040000-560a-30df-7972-f93556835fa0	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-560a-30df-bffd-3aff026e19ee	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-560a-30df-e96a-9168eebeb915	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-560a-30df-f035-3338ac37ebe4	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-560a-30df-54d5-ad6b082504f2	GA	GAB	266	Gabon 	Gabon	\N
00040000-560a-30df-52ec-61288de980db	GM	GMB	270	Gambia 	Gambija	\N
00040000-560a-30df-99ee-535a20d097db	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-560a-30df-6a33-3f3e58ba1069	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-560a-30df-41ea-7996c5ea50c0	GH	GHA	288	Ghana 	Gana	\N
00040000-560a-30df-8fcb-9c3b1c099d2e	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-560a-30df-9c5b-17af45dfc26d	GR	GRC	300	Greece 	Grčija	\N
00040000-560a-30df-c44a-434640a67ceb	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-560a-30df-b48c-b2e454e829ab	GD	GRD	308	Grenada 	Grenada	\N
00040000-560a-30df-2676-590a9253abc4	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-560a-30df-2650-9785faeb6699	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-560a-30df-ba3f-0d5b22b8e8a2	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-560a-30df-5c82-0a5738bbe7a5	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-560a-30df-85c6-5eab97e82d61	GN	GIN	324	Guinea 	Gvineja	\N
00040000-560a-30df-c737-c89beac3580d	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-560a-30df-a94a-769cd0ceadb1	GY	GUY	328	Guyana 	Gvajana	\N
00040000-560a-30df-8f46-2984dee8ff23	HT	HTI	332	Haiti 	Haiti	\N
00040000-560a-30df-9528-104d8ac473e6	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-560a-30df-a38d-a4771c29f362	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-560a-30df-a793-7e262e07e29d	HN	HND	340	Honduras 	Honduras	\N
00040000-560a-30df-2e91-ea318bff0abb	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-560a-30df-6ac3-6a2ed35c7121	HU	HUN	348	Hungary 	Madžarska	\N
00040000-560a-30df-b06f-2a0ea7bd04f6	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-560a-30df-9f7b-a2f0b55d81be	IN	IND	356	India 	Indija	\N
00040000-560a-30df-756f-718ac588be01	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-560a-30df-6fb7-cb8a05246e13	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-560a-30df-73fc-91b1f002afdf	IQ	IRQ	368	Iraq 	Irak	\N
00040000-560a-30df-5fb7-bbc69903e431	IE	IRL	372	Ireland 	Irska	\N
00040000-560a-30df-e1c2-7d3873426017	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-560a-30df-5620-639e2e6b0936	IL	ISR	376	Israel 	Izrael	\N
00040000-560a-30df-8363-03e8205979ac	IT	ITA	380	Italy 	Italija	\N
00040000-560a-30df-267e-d52a8ee5ef62	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-560a-30df-d4d7-da27f1fbbf97	JP	JPN	392	Japan 	Japonska	\N
00040000-560a-30df-bfcb-bb3ce1aa876d	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-560a-30df-11e3-458a5ad2d22d	JO	JOR	400	Jordan 	Jordanija	\N
00040000-560a-30df-543c-f0a8514365d1	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-560a-30df-1522-2ba2d5c0ccaa	KE	KEN	404	Kenya 	Kenija	\N
00040000-560a-30df-269b-25e2d478de8c	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-560a-30df-1bdc-4ecd0ffaf48e	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-560a-30df-f7fc-323db233e3e2	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-560a-30df-a9ff-be704e580f4c	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-560a-30df-91b8-b0f81177d4a0	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-560a-30df-368b-ffba8ebb8163	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-560a-30df-4652-08a65c7e0442	LV	LVA	428	Latvia 	Latvija	\N
00040000-560a-30df-7ca1-238a85f871ab	LB	LBN	422	Lebanon 	Libanon	\N
00040000-560a-30df-251a-b830eeafa3e9	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-560a-30df-82f0-94c1f6ce9cba	LR	LBR	430	Liberia 	Liberija	\N
00040000-560a-30df-9012-afd63665e060	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-560a-30df-e208-c92d21aca2f1	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-560a-30df-437c-40562e938815	LT	LTU	440	Lithuania 	Litva	\N
00040000-560a-30df-e274-a91f35e743fe	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-560a-30df-e3b2-7f9a11c02c81	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-560a-30df-ca3a-4e099fb72fe6	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-560a-30df-637e-b90d6b4cd598	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-560a-30df-5a95-4e27c6e11ec5	MW	MWI	454	Malawi 	Malavi	\N
00040000-560a-30df-bcd7-146100cc2e5e	MY	MYS	458	Malaysia 	Malezija	\N
00040000-560a-30df-7d12-cc598b8dd3bc	MV	MDV	462	Maldives 	Maldivi	\N
00040000-560a-30df-8bef-deac631277b1	ML	MLI	466	Mali 	Mali	\N
00040000-560a-30df-4939-c2b847e6f56d	MT	MLT	470	Malta 	Malta	\N
00040000-560a-30df-debc-da58c6ab7f05	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-560a-30df-4d85-b4802191a3a1	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-560a-30df-56fd-d15763921ef1	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-560a-30df-a363-19ef20cf4c5f	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-560a-30df-d4f0-14960bb07857	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-560a-30df-ce9a-9883c7a8c0b2	MX	MEX	484	Mexico 	Mehika	\N
00040000-560a-30df-9e9f-607cb5ad7e0a	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-560a-30df-16cd-c8580f2c941a	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-560a-30df-4e93-c9911ca3bde8	MC	MCO	492	Monaco 	Monako	\N
00040000-560a-30df-2e57-dd5b34ee61a8	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-560a-30df-fb6f-d5256ff9474d	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-560a-30df-286a-8a7593d5f748	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-560a-30df-e844-98f4642e07a0	MA	MAR	504	Morocco 	Maroko	\N
00040000-560a-30df-9278-3ea206713e56	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-560a-30df-f270-09a7cb805def	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-560a-30df-e91b-ea13f330d7c6	NA	NAM	516	Namibia 	Namibija	\N
00040000-560a-30df-291b-0573ec6db882	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-560a-30df-15bf-b8552b6c86a4	NP	NPL	524	Nepal 	Nepal	\N
00040000-560a-30df-a473-7d2c7ad3207e	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-560a-30df-6d84-db7a42bc94ba	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-560a-30df-fac3-da2b9298ce87	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-560a-30df-04a7-e317121272ff	NE	NER	562	Niger 	Niger 	\N
00040000-560a-30df-252b-0e4ade20d7c3	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-560a-30df-c21b-43aebe53b77a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-560a-30df-79e3-7f3f2a2f0e36	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-560a-30df-dbcd-1a731e609a39	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-560a-30df-ca81-9d6e0956b206	NO	NOR	578	Norway 	Norveška	\N
00040000-560a-30df-3696-4200191d71cd	OM	OMN	512	Oman 	Oman	\N
00040000-560a-30df-7a25-94ee9f7d8b99	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-560a-30df-79d5-108fa18a5f72	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-560a-30df-e3b9-9d449cd18676	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-560a-30df-4690-71ee2ff6b251	PA	PAN	591	Panama 	Panama	\N
00040000-560a-30df-8a21-2e5aee74849c	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-560a-30df-79cc-136ccb959914	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-560a-30df-3c9c-214790398409	PE	PER	604	Peru 	Peru	\N
00040000-560a-30df-2b8b-f0572efbc2d8	PH	PHL	608	Philippines 	Filipini	\N
00040000-560a-30df-75a5-a1e037fbfc1d	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-560a-30df-6dfc-8c5721838dd4	PL	POL	616	Poland 	Poljska	\N
00040000-560a-30df-e82c-7d0807576ca0	PT	PRT	620	Portugal 	Portugalska	\N
00040000-560a-30df-805a-c11db448cc93	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-560a-30df-3dc2-c54cfeeece1d	QA	QAT	634	Qatar 	Katar	\N
00040000-560a-30df-1fa6-0099aff053b7	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-560a-30df-cda5-b2705b6b08b1	RO	ROU	642	Romania 	Romunija	\N
00040000-560a-30df-60a9-70c284295a43	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-560a-30df-98b6-a4aa63f19276	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-560a-30df-77ce-f15d613a4480	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-560a-30df-a354-99e3857bdf92	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-560a-30df-e554-9a6621a88888	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-560a-30df-ee3a-74bfffd8b1aa	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-560a-30df-4322-148515c0158f	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-560a-30df-a909-ee0575baed30	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-560a-30df-9c22-5e24449a4429	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-560a-30df-373d-7de901a528e0	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-560a-30df-d10c-e50d08b363bd	SM	SMR	674	San Marino 	San Marino	\N
00040000-560a-30df-f690-11a38e9112b8	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-560a-30df-55f5-31fab0464114	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-560a-30df-eaae-428c2b91699e	SN	SEN	686	Senegal 	Senegal	\N
00040000-560a-30df-259a-1ba35adf56c1	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-560a-30df-8a1f-2d2698d2ba3e	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-560a-30df-af06-c36cb3943abf	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-560a-30df-d951-26ea14742bd6	SG	SGP	702	Singapore 	Singapur	\N
00040000-560a-30df-d37f-b0ba81bfc578	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-560a-30df-cd11-e63d386597fd	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-560a-30df-d90c-7d259fad5849	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-560a-30df-0e43-c34a9b2b5e8e	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-560a-30df-b4f4-8416c03ac5a2	SO	SOM	706	Somalia 	Somalija	\N
00040000-560a-30df-a564-888025d21162	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-560a-30df-5816-1f7a2c960b78	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-560a-30df-4e44-3726cd67e45a	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-560a-30df-87c8-7340cffb2799	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-560a-30df-d0e8-fe5bcac0cac4	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-560a-30df-1161-725dad7fa0af	SD	SDN	729	Sudan 	Sudan	\N
00040000-560a-30df-79a4-bc91642347fb	SR	SUR	740	Suriname 	Surinam	\N
00040000-560a-30df-d4a3-113dab68c5a9	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-560a-30df-00ac-b80569c8ceeb	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-560a-30df-5d06-052d8c8c438c	SE	SWE	752	Sweden 	Švedska	\N
00040000-560a-30df-b328-9815a849fe37	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-560a-30df-88b5-3690109e2233	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-560a-30df-6e8a-9d9d1695c5b8	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-560a-30df-ab23-3a82d6ed3f40	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-560a-30df-95f4-5f6f8881949a	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-560a-30df-2061-3911e2917c68	TH	THA	764	Thailand 	Tajska	\N
00040000-560a-30df-d171-14adc460b425	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-560a-30df-c7c9-20151d54aa04	TG	TGO	768	Togo 	Togo	\N
00040000-560a-30df-0ced-a6157731f973	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-560a-30df-3fe3-65d4fff1a137	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-560a-30df-2239-f1910d64ecf0	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-560a-30df-a2b9-3c33c684c770	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-560a-30df-26f1-b8491c9528a9	TR	TUR	792	Turkey 	Turčija	\N
00040000-560a-30df-688e-0bf74f0169fd	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-560a-30df-ff0e-29816ee83472	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-30df-13b4-dfc4b4400424	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-560a-30df-b24b-974ce5e84e15	UG	UGA	800	Uganda 	Uganda	\N
00040000-560a-30df-b448-efbc935b8730	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-560a-30df-fad1-0713e1b9531b	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-560a-30df-88df-d05c040c6f91	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-560a-30df-0261-220824302f0f	US	USA	840	United States 	Združene države Amerike	\N
00040000-560a-30df-7996-491d1b296669	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-560a-30df-0e75-8e654c31e914	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-560a-30df-a2f2-c3c6b7f162a8	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-560a-30df-7cfc-13448ef56734	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-560a-30df-4653-f6bc50076b80	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-560a-30df-f4ee-dc6632a440fc	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-560a-30df-4220-01d366256f60	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-560a-30df-96ea-244a5970013c	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-560a-30df-5f5d-78e1e733f1fc	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-560a-30df-c314-13125d803ee5	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-560a-30df-61c4-a479627843b9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-560a-30df-7e33-5b1ef46cefa3	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-560a-30df-090f-2e651727fb0e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3026 (class 0 OID 20974890)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, prizorisce, trajanje, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-560a-30e1-48a9-6a5f1b2183ea	000e0000-560a-30e1-2c78-02a0e0c1d5db	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-30df-eaa3-413975ab40b9	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-30e1-89b8-daa53a252679	000e0000-560a-30e1-8b0d-255eda35c338	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-30df-b532-48336ad41043	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-560a-30e1-ec8a-37601ac72b3d	000e0000-560a-30e1-d1b1-93237bb7a2b7	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-560a-30df-eaa3-413975ab40b9	premiera	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-30e1-7ced-8b25da96a135	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-560a-30e1-abc3-eafdeaab72ca	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	\N	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3011 (class 0 OID 20974692)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-560a-30e1-c75f-5a24ee486a87	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-7b72-6a2e4a0b0b98	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-30df-1298-250ce483deb1
000d0000-560a-30e1-45c9-c54509906cf3	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-28d3-52bc30f4b96d	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-560a-30df-02ca-71303aba31b3
000d0000-560a-30e1-69aa-cd09d0d3942f	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-6f2c-6214d837bc02	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-560a-30df-68dd-760d3e802755
000d0000-560a-30e1-a767-137485e048fb	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-6f90-7e1d2b9d927f	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-560a-30df-2bd7-ea40bb94da6a
000d0000-560a-30e1-93d7-c5c146f2dcb7	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-abb7-c43b95845661	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-560a-30df-2bd7-ea40bb94da6a
000d0000-560a-30e1-4d87-f3aa0096a7f2	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-a2c2-835968620946	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-560a-30df-1298-250ce483deb1
000d0000-560a-30e1-462a-1073c4432fcc	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-ce5d-a34338a6cba8	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-560a-30df-1298-250ce483deb1
000d0000-560a-30e1-bdf7-581553dc4b9b	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-d3f0-8b2eca0a51e8	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-560a-30df-df8a-d2b719b84fd4
000d0000-560a-30e1-f175-306d33338b75	000e0000-560a-30e1-8b0d-255eda35c338	000c0000-560a-30e1-ceaa-f43617652d0a	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-560a-30df-8a4c-5a83e39c279b
\.


--
-- TOC entry 2991 (class 0 OID 20974506)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2989 (class 0 OID 20974481)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20974458)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-560a-30e1-59ae-8210d84cfb4a	00080000-560a-30e0-61fa-9e2b27a04144	00090000-560a-30e1-496f-b6816614cb05	AK		igralka
\.


--
-- TOC entry 3000 (class 0 OID 20974606)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3037 (class 0 OID 20975100)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 20975112)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3040 (class 0 OID 20975134)
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
-- TOC entry 3004 (class 0 OID 20974631)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20974415)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-560a-30df-d7ee-49c75d075f91	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-560a-30df-8c00-426e629ce10d	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-560a-30df-3914-3a5951374e4c	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-560a-30df-c5ad-f2f37e53a273	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-560a-30df-5535-290f21d0e581	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-560a-30df-955f-30946e337030	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-560a-30df-a134-44165650cb6b	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-560a-30df-8025-d10c16f525eb	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-30df-18ea-f4f812089104	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-560a-30df-8e92-253c1e7c144f	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-560a-30df-8cf2-4ab8f6d95975	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-560a-30df-2dc9-a82451a592e6	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-560a-30df-abf7-ebf3a68ef0aa	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-560a-30df-2148-9c0a1f598af7	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-560a-30df-5359-c5fbffefc2da	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-560a-30e0-6ce5-7ea2ca91f660	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-560a-30e0-c5c3-d6cd15a77cb2	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-560a-30e0-e8dd-282f0e432758	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-560a-30e0-6266-d563ea50c3d7	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-560a-30e0-0ebd-4f06f2f18c30	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-560a-30e2-0850-5c8b325b448a	application.tenant.maticnopodjetje	string	s:36:"00080000-560a-30e2-2f35-d6ccb2486d95";	f	t	f		Id matičnega podjetja v Popa
\.


--
-- TOC entry 2978 (class 0 OID 20974329)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-560a-30e0-659c-5247d344c0c0	00000000-560a-30e0-6ce5-7ea2ca91f660	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-560a-30e0-cad4-6e62e940be0a	00000000-560a-30e0-6ce5-7ea2ca91f660	00010000-560a-30df-1970-cf3a28e6a2cb	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-560a-30e0-0a9c-aa9dbb2e8e8d	00000000-560a-30e0-c5c3-d6cd15a77cb2	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2979 (class 0 OID 20974340)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-560a-30e1-04be-2af22346ad61	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-560a-30e1-c58f-ddf2b38d8fee	00010000-560a-30e1-9c43-b2c52e17f95e	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-560a-30e1-4f3c-6e6df679e799	00010000-560a-30e1-5aa3-1fc89e37ba4d	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-560a-30e1-aba2-796e3d61d3d6	00010000-560a-30e1-b6e2-0e592eb43cd5	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-560a-30e1-2914-c2d0dc2c4093	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-560a-30e1-77a4-7999bc89a8ce	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-560a-30e1-564d-665472380c6e	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-560a-30e1-e974-545bc2b57c85	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-560a-30e1-496f-b6816614cb05	00010000-560a-30e1-dc98-0402e68884a1	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-560a-30e1-1a46-63c44a2c7f34	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-560a-30e1-f2e0-c2c239630a55	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-30e1-c5e1-00e8349e3826	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-560a-30e1-0195-e05b2f5a4392	00010000-560a-30e1-8c2e-79afcbca5eb0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-560a-30e1-83bb-08024bca98b8	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-30e1-b59e-af014158f793	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-30e1-dd70-5595fd6638be	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-560a-30e1-e0fc-3cebe3c3e9fd	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-560a-30e1-d7f5-93dd64137304	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2974 (class 0 OID 20974294)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-560a-30df-de5c-50f409020b77	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-560a-30df-b55a-c72ba3f35c1f	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-560a-30df-ee39-2c0f761564a2	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-560a-30df-65af-cd858556c099	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-560a-30df-d3fb-9c4d82201f42	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-560a-30df-457b-7850b50648ff	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-560a-30df-51d4-ff5b6c14369e	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-560a-30df-81f3-b79c98197c01	Abonma-read	Abonma - branje	f
00030000-560a-30df-3b0d-da77d6a79ba9	Abonma-write	Abonma - spreminjanje	f
00030000-560a-30df-6ad1-bd93e25a8f61	Alternacija-read	Alternacija - branje	f
00030000-560a-30df-0d90-940b158c50e9	Alternacija-write	Alternacija - spreminjanje	f
00030000-560a-30df-c96f-876a9b82b105	Arhivalija-read	Arhivalija - branje	f
00030000-560a-30df-07eb-35798383e118	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-560a-30df-e071-552ee2222146	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-560a-30df-1bad-2b9cc072ba27	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-560a-30df-7101-e588ebfc7cab	Besedilo-read	Besedilo - branje	f
00030000-560a-30df-6a17-9ec2c3015e7c	Besedilo-write	Besedilo - spreminjanje	f
00030000-560a-30df-c9c7-b34aa187d8f9	DogodekIzven-read	DogodekIzven - branje	f
00030000-560a-30df-aaf6-87ed396000ea	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-560a-30df-6285-60fe99801855	Dogodek-read	Dogodek - branje	f
00030000-560a-30df-8efe-1dba7eb66fb1	Dogodek-write	Dogodek - spreminjanje	f
00030000-560a-30df-b758-71fb6a97260c	DrugiVir-read	DrugiVir - branje	f
00030000-560a-30df-bb7d-468234751c5b	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-560a-30df-ddb8-1cc2fa0633be	Drzava-read	Drzava - branje	f
00030000-560a-30df-3bc8-c6becd07d1c0	Drzava-write	Drzava - spreminjanje	f
00030000-560a-30df-0d0b-240858c2bae7	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-560a-30df-32f7-2cb6f7f31840	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-560a-30df-6853-fc3503f041f9	Funkcija-read	Funkcija - branje	f
00030000-560a-30df-d0af-d1d07ce756fb	Funkcija-write	Funkcija - spreminjanje	f
00030000-560a-30df-dfdd-f16cb7ef5cf0	Gostovanje-read	Gostovanje - branje	f
00030000-560a-30df-c3ba-35027fde3f77	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-560a-30df-e025-185847fefafe	Gostujoca-read	Gostujoca - branje	f
00030000-560a-30df-4db5-afb40df8bee4	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-560a-30df-6005-41559db4f084	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-560a-30df-4a8e-975e2501555d	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-560a-30df-183e-d4c192a63b51	Kupec-read	Kupec - branje	f
00030000-560a-30df-154e-3aed5e55e56d	Kupec-write	Kupec - spreminjanje	f
00030000-560a-30df-dfad-a04204910018	NacinPlacina-read	NacinPlacina - branje	f
00030000-560a-30df-264e-366d82d8ea87	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-560a-30df-2413-7a4cd3413f41	Option-read	Option - branje	f
00030000-560a-30df-872a-5bf71399209d	Option-write	Option - spreminjanje	f
00030000-560a-30df-a4dc-1e248a1bd928	OptionValue-read	OptionValue - branje	f
00030000-560a-30df-978a-5c2db7ddd18d	OptionValue-write	OptionValue - spreminjanje	f
00030000-560a-30df-7d83-763a3510857f	Oseba-read	Oseba - branje	f
00030000-560a-30df-01b2-3c67a2b4af27	Oseba-write	Oseba - spreminjanje	f
00030000-560a-30df-357a-f5f5947a11c7	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-560a-30df-f450-a4701188b726	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-560a-30df-c26a-d243c21945a3	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-560a-30df-1524-d11001e7ad62	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-560a-30df-af1a-00128de2d44f	Pogodba-read	Pogodba - branje	f
00030000-560a-30df-9d60-4415bf0f1121	Pogodba-write	Pogodba - spreminjanje	f
00030000-560a-30df-f8f9-04b51859155d	Popa-read	Popa - branje	f
00030000-560a-30df-51d5-9205f439d111	Popa-write	Popa - spreminjanje	f
00030000-560a-30df-22eb-7c3518287aba	Posta-read	Posta - branje	f
00030000-560a-30df-8395-26a6e3b51337	Posta-write	Posta - spreminjanje	f
00030000-560a-30df-fd2d-4c7c9f3f6d38	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-560a-30df-d489-19de6fee2d54	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-560a-30df-d861-c956d572f379	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-560a-30df-5738-957e4a31ec96	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-560a-30df-ea14-2750e9644003	PostniNaslov-read	PostniNaslov - branje	f
00030000-560a-30df-d655-201e2e3ef042	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-560a-30df-d1a8-1294c91806b9	Predstava-read	Predstava - branje	f
00030000-560a-30df-23a7-5497f4f48a9d	Predstava-write	Predstava - spreminjanje	f
00030000-560a-30df-da27-656ca5ddb280	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-560a-30df-eb36-62aa39bec6f6	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-560a-30df-d8b2-0b433a222a2e	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-560a-30df-f633-2e1dda632c45	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-560a-30df-2703-b4425444807a	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-560a-30df-33f3-a567dce89df3	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-560a-30df-527d-d24f5b7b07d6	ProgramDela-read	ProgramDela - branje	f
00030000-560a-30df-016b-c65427d8366e	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-560a-30df-e473-105846dec152	ProgramFestival-read	ProgramFestival - branje	f
00030000-560a-30df-2d69-08d2c4eb6c6d	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-560a-30df-afaf-c75a34d7e816	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-560a-30df-1002-e19a33c9a837	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-560a-30df-9182-24f6e1f4652c	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-560a-30df-ee23-e40335c7a121	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-560a-30df-e1db-ef2e39b06ac3	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-560a-30df-ac21-feb5d588d640	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-560a-30df-dbd6-22652ec912bd	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-560a-30df-3214-cb753b500654	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-560a-30df-dd15-3e4b94dc09c0	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-560a-30df-8cd6-00d8fb4de663	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-560a-30df-a981-1d06dabca241	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-560a-30df-8cf0-e331cd8ff1a5	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-560a-30df-8f9b-1a8e4c0c0fd0	ProgramRazno-read	ProgramRazno - branje	f
00030000-560a-30df-f730-972d55fd130d	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-560a-30df-44dc-0f0e69bd0e05	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-560a-30df-60d1-73721299cb56	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-560a-30df-e9a5-07f5cad74d81	Prostor-read	Prostor - branje	f
00030000-560a-30df-065b-06ed2f514818	Prostor-write	Prostor - spreminjanje	f
00030000-560a-30df-c164-042b1c11483d	Racun-read	Racun - branje	f
00030000-560a-30df-16e7-4512c5c80ed1	Racun-write	Racun - spreminjanje	f
00030000-560a-30df-1751-5c369cdbdf97	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-560a-30df-b2a1-c385e29dece9	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-560a-30df-359b-f0eeb4cd0ba5	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-560a-30df-2486-689c17f89e72	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-560a-30df-86d6-4efb1e9de626	Rekvizit-read	Rekvizit - branje	f
00030000-560a-30df-5134-c5d13b858bf0	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-560a-30df-f3c0-d349d74f2bcf	Revizija-read	Revizija - branje	f
00030000-560a-30df-72a1-a840b20ace2a	Revizija-write	Revizija - spreminjanje	f
00030000-560a-30df-00ac-c50e3e82f3d3	Rezervacija-read	Rezervacija - branje	f
00030000-560a-30df-3484-e97fad3dd018	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-560a-30df-66ef-1f30f4806cdf	SedezniRed-read	SedezniRed - branje	f
00030000-560a-30df-4719-db3a79c9c7f5	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-560a-30df-2924-14289ccd94a0	Sedez-read	Sedez - branje	f
00030000-560a-30df-0770-36110976f77e	Sedez-write	Sedez - spreminjanje	f
00030000-560a-30df-9022-9c02a674a2a6	Sezona-read	Sezona - branje	f
00030000-560a-30df-1443-c4b1699a9e98	Sezona-write	Sezona - spreminjanje	f
00030000-560a-30df-5d2c-a92894bbf3c6	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-560a-30df-0006-0d284c4344a6	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-560a-30df-28aa-e3dc4388f4c6	Stevilcenje-read	Stevilcenje - branje	f
00030000-560a-30df-3cbf-923e7a715d17	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-560a-30df-2c4a-40ff538bf186	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-560a-30df-1338-fcbd490482ff	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-560a-30df-0f4d-f68b9abe88e6	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-560a-30df-51cd-27ef3359f14b	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-560a-30df-7f85-69027c661189	Telefonska-read	Telefonska - branje	f
00030000-560a-30df-e7a9-d0509712a283	Telefonska-write	Telefonska - spreminjanje	f
00030000-560a-30df-6ef1-646022f0addb	TerminStoritve-read	TerminStoritve - branje	f
00030000-560a-30df-f14c-4c2221727fab	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-560a-30df-a28a-d9dd32298dcc	TipFunkcije-read	TipFunkcije - branje	f
00030000-560a-30df-e022-1afec273d2cd	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-560a-30df-5ca1-ebd9dda34704	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-560a-30df-3633-d19d1742b549	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-560a-30df-4a74-1d006a35923a	Trr-read	Trr - branje	f
00030000-560a-30df-db04-3916fe0d3ebd	Trr-write	Trr - spreminjanje	f
00030000-560a-30df-3c7d-435fd2d38a1b	Uprizoritev-read	Uprizoritev - branje	f
00030000-560a-30df-e4cc-32d2d8ed1cc6	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-560a-30df-930d-1df9b744f0c4	Vaja-read	Vaja - branje	f
00030000-560a-30df-e9bc-e3be3e0b39be	Vaja-write	Vaja - spreminjanje	f
00030000-560a-30df-bab4-25f1a49df095	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-560a-30df-6497-b4b67c0d7ddf	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-560a-30df-65e8-b7752b276dad	VrstaStroska-read	VrstaStroska - branje	f
00030000-560a-30df-f6c8-1fb227420e16	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-560a-30df-4f7c-8a893fc2b394	Zaposlitev-read	Zaposlitev - branje	f
00030000-560a-30df-8486-e280d108fa38	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-560a-30df-387a-965963280c5c	Zasedenost-read	Zasedenost - branje	f
00030000-560a-30df-da6b-d2533cbaa2ca	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-560a-30df-7f03-22291028fa52	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-560a-30df-13cc-acd82b1bb53c	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-560a-30df-7dc1-6e393cc4d5c4	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-560a-30df-a64b-9a323489bd0e	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-560a-30df-bf00-6df56698d818	Job-read	Branje opravil - samo zase - branje	f
00030000-560a-30df-4036-6597cc4b19dc	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-560a-30df-15da-e4f9c8f5d54a	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-560a-30df-dd03-76e76b6088b2	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-560a-30df-8849-516e1d09a511	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-560a-30df-f955-3be4e8db7ca7	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-560a-30df-512b-265094edacfd	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-560a-30df-d64f-a10f962cc29b	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-30df-fcc5-c80de9709f3a	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-560a-30df-a076-2b1eb12d766f	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-30df-f79e-b647bec5e213	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-560a-30df-021a-0989ede929b9	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-560a-30df-d85d-c17deeee7302	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-560a-30df-eaa5-574b4b277d6b	Datoteka-write	Datoteka - spreminjanje	f
00030000-560a-30df-03ff-f9622b9e8a9b	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2976 (class 0 OID 20974313)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-560a-30df-54ba-ec902c5f65ef	00030000-560a-30df-b55a-c72ba3f35c1f
00020000-560a-30df-b5e8-3f689a42b217	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-81f3-b79c98197c01
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-3b0d-da77d6a79ba9
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-6ad1-bd93e25a8f61
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-0d90-940b158c50e9
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-c96f-876a9b82b105
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-6285-60fe99801855
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-65af-cd858556c099
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-8efe-1dba7eb66fb1
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-3bc8-c6becd07d1c0
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-6853-fc3503f041f9
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-d0af-d1d07ce756fb
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-dfdd-f16cb7ef5cf0
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-c3ba-35027fde3f77
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-e025-185847fefafe
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-4db5-afb40df8bee4
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-6005-41559db4f084
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-4a8e-975e2501555d
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-2413-7a4cd3413f41
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-a4dc-1e248a1bd928
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-7d83-763a3510857f
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-01b2-3c67a2b4af27
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-f8f9-04b51859155d
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-51d5-9205f439d111
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-22eb-7c3518287aba
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-8395-26a6e3b51337
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-ea14-2750e9644003
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-d655-201e2e3ef042
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-d1a8-1294c91806b9
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-23a7-5497f4f48a9d
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-2703-b4425444807a
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-33f3-a567dce89df3
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-e9a5-07f5cad74d81
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-065b-06ed2f514818
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-359b-f0eeb4cd0ba5
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-2486-689c17f89e72
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-86d6-4efb1e9de626
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-5134-c5d13b858bf0
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-9022-9c02a674a2a6
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-1443-c4b1699a9e98
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-a28a-d9dd32298dcc
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-3c7d-435fd2d38a1b
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-e4cc-32d2d8ed1cc6
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-930d-1df9b744f0c4
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-e9bc-e3be3e0b39be
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-387a-965963280c5c
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-da6b-d2533cbaa2ca
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-7f03-22291028fa52
00020000-560a-30df-c9ee-6c5f69b61888	00030000-560a-30df-7dc1-6e393cc4d5c4
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-81f3-b79c98197c01
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-c96f-876a9b82b105
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-6285-60fe99801855
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-dfdd-f16cb7ef5cf0
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-e025-185847fefafe
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-6005-41559db4f084
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-4a8e-975e2501555d
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-2413-7a4cd3413f41
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-a4dc-1e248a1bd928
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-7d83-763a3510857f
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-01b2-3c67a2b4af27
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-f8f9-04b51859155d
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-22eb-7c3518287aba
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-ea14-2750e9644003
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-d655-201e2e3ef042
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-d1a8-1294c91806b9
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-e9a5-07f5cad74d81
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-359b-f0eeb4cd0ba5
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-86d6-4efb1e9de626
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-9022-9c02a674a2a6
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-7f85-69027c661189
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-e7a9-d0509712a283
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-4a74-1d006a35923a
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-db04-3916fe0d3ebd
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-4f7c-8a893fc2b394
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-8486-e280d108fa38
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-7f03-22291028fa52
00020000-560a-30df-6c17-e6c578179ddc	00030000-560a-30df-7dc1-6e393cc4d5c4
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-81f3-b79c98197c01
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-6ad1-bd93e25a8f61
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-c96f-876a9b82b105
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-07eb-35798383e118
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-7101-e588ebfc7cab
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-c9c7-b34aa187d8f9
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-6285-60fe99801855
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-6853-fc3503f041f9
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-dfdd-f16cb7ef5cf0
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-e025-185847fefafe
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-6005-41559db4f084
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-2413-7a4cd3413f41
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-a4dc-1e248a1bd928
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-7d83-763a3510857f
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-f8f9-04b51859155d
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-22eb-7c3518287aba
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-d1a8-1294c91806b9
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-2703-b4425444807a
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-e9a5-07f5cad74d81
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-359b-f0eeb4cd0ba5
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-86d6-4efb1e9de626
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-9022-9c02a674a2a6
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-a28a-d9dd32298dcc
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-930d-1df9b744f0c4
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-387a-965963280c5c
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-7f03-22291028fa52
00020000-560a-30df-cb5c-f4cc33559afa	00030000-560a-30df-7dc1-6e393cc4d5c4
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-81f3-b79c98197c01
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-3b0d-da77d6a79ba9
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-0d90-940b158c50e9
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-c96f-876a9b82b105
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-6285-60fe99801855
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-dfdd-f16cb7ef5cf0
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-e025-185847fefafe
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-2413-7a4cd3413f41
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-a4dc-1e248a1bd928
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-f8f9-04b51859155d
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-22eb-7c3518287aba
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-d1a8-1294c91806b9
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-e9a5-07f5cad74d81
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-359b-f0eeb4cd0ba5
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-86d6-4efb1e9de626
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-9022-9c02a674a2a6
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-a28a-d9dd32298dcc
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-7f03-22291028fa52
00020000-560a-30df-f06b-de518dac4b93	00030000-560a-30df-7dc1-6e393cc4d5c4
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-81f3-b79c98197c01
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-c96f-876a9b82b105
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-6285-60fe99801855
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-dfdd-f16cb7ef5cf0
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-e025-185847fefafe
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-2413-7a4cd3413f41
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-a4dc-1e248a1bd928
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-f8f9-04b51859155d
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-22eb-7c3518287aba
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-d1a8-1294c91806b9
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-e9a5-07f5cad74d81
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-359b-f0eeb4cd0ba5
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-86d6-4efb1e9de626
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-9022-9c02a674a2a6
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-6ef1-646022f0addb
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-ee39-2c0f761564a2
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-a28a-d9dd32298dcc
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-7f03-22291028fa52
00020000-560a-30df-ef05-8c7d3bae911d	00030000-560a-30df-7dc1-6e393cc4d5c4
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-de5c-50f409020b77
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-b55a-c72ba3f35c1f
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-ee39-2c0f761564a2
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-65af-cd858556c099
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d3fb-9c4d82201f42
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-457b-7850b50648ff
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-51d4-ff5b6c14369e
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-81f3-b79c98197c01
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3b0d-da77d6a79ba9
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6ad1-bd93e25a8f61
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-0d90-940b158c50e9
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-c96f-876a9b82b105
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-07eb-35798383e118
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-7101-e588ebfc7cab
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6a17-9ec2c3015e7c
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-c9c7-b34aa187d8f9
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-aaf6-87ed396000ea
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6285-60fe99801855
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-8efe-1dba7eb66fb1
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-ddb8-1cc2fa0633be
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3bc8-c6becd07d1c0
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-b758-71fb6a97260c
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-bb7d-468234751c5b
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-0d0b-240858c2bae7
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-32f7-2cb6f7f31840
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6853-fc3503f041f9
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d0af-d1d07ce756fb
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-dfdd-f16cb7ef5cf0
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-c3ba-35027fde3f77
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e025-185847fefafe
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-4db5-afb40df8bee4
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6005-41559db4f084
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-4a8e-975e2501555d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-183e-d4c192a63b51
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-154e-3aed5e55e56d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-dfad-a04204910018
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-264e-366d82d8ea87
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-2413-7a4cd3413f41
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-872a-5bf71399209d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-a4dc-1e248a1bd928
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-978a-5c2db7ddd18d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-7d83-763a3510857f
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-01b2-3c67a2b4af27
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-357a-f5f5947a11c7
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f450-a4701188b726
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-c26a-d243c21945a3
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-1524-d11001e7ad62
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-af1a-00128de2d44f
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-9d60-4415bf0f1121
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f8f9-04b51859155d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-51d5-9205f439d111
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-22eb-7c3518287aba
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-8395-26a6e3b51337
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-fd2d-4c7c9f3f6d38
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d489-19de6fee2d54
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d861-c956d572f379
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-5738-957e4a31ec96
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-ea14-2750e9644003
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d655-201e2e3ef042
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d1a8-1294c91806b9
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-23a7-5497f4f48a9d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-da27-656ca5ddb280
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-eb36-62aa39bec6f6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-d8b2-0b433a222a2e
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f633-2e1dda632c45
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-2703-b4425444807a
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-33f3-a567dce89df3
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-527d-d24f5b7b07d6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-016b-c65427d8366e
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e473-105846dec152
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-2d69-08d2c4eb6c6d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-afaf-c75a34d7e816
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-1002-e19a33c9a837
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-9182-24f6e1f4652c
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-ee23-e40335c7a121
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e1db-ef2e39b06ac3
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-ac21-feb5d588d640
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-dbd6-22652ec912bd
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3214-cb753b500654
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-dd15-3e4b94dc09c0
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-8cd6-00d8fb4de663
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-a981-1d06dabca241
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-8cf0-e331cd8ff1a5
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-8f9b-1a8e4c0c0fd0
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f730-972d55fd130d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-44dc-0f0e69bd0e05
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-60d1-73721299cb56
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e9a5-07f5cad74d81
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-065b-06ed2f514818
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-c164-042b1c11483d
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-16e7-4512c5c80ed1
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-1751-5c369cdbdf97
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-b2a1-c385e29dece9
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-359b-f0eeb4cd0ba5
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-2486-689c17f89e72
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-86d6-4efb1e9de626
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-5134-c5d13b858bf0
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f3c0-d349d74f2bcf
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-72a1-a840b20ace2a
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-00ac-c50e3e82f3d3
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3484-e97fad3dd018
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-66ef-1f30f4806cdf
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-4719-db3a79c9c7f5
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-2924-14289ccd94a0
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-0770-36110976f77e
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-9022-9c02a674a2a6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-1443-c4b1699a9e98
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-5d2c-a92894bbf3c6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-0006-0d284c4344a6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-28aa-e3dc4388f4c6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3cbf-923e7a715d17
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-2c4a-40ff538bf186
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-1338-fcbd490482ff
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-0f4d-f68b9abe88e6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-51cd-27ef3359f14b
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-7f85-69027c661189
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e7a9-d0509712a283
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6ef1-646022f0addb
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f14c-4c2221727fab
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-a28a-d9dd32298dcc
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e022-1afec273d2cd
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-5ca1-ebd9dda34704
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3633-d19d1742b549
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-4a74-1d006a35923a
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-db04-3916fe0d3ebd
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-3c7d-435fd2d38a1b
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e4cc-32d2d8ed1cc6
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-930d-1df9b744f0c4
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-e9bc-e3be3e0b39be
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-bab4-25f1a49df095
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-6497-b4b67c0d7ddf
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-65e8-b7752b276dad
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-f6c8-1fb227420e16
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-4f7c-8a893fc2b394
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-8486-e280d108fa38
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-387a-965963280c5c
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-da6b-d2533cbaa2ca
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-7f03-22291028fa52
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-13cc-acd82b1bb53c
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-7dc1-6e393cc4d5c4
00020000-560a-30e1-b402-a5d179a14e14	00030000-560a-30df-a64b-9a323489bd0e
\.


--
-- TOC entry 3005 (class 0 OID 20974638)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3009 (class 0 OID 20974672)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 20974808)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-560a-30e1-0d95-f4fceed89000	00090000-560a-30e1-04be-2af22346ad61	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-560a-30e1-cefb-baa69697d514	00090000-560a-30e1-77a4-7999bc89a8ce	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-560a-30e1-e96d-485853d3e1bd	00090000-560a-30e1-0195-e05b2f5a4392	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-560a-30e1-52bb-0571a8489720	00090000-560a-30e1-1a46-63c44a2c7f34	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2981 (class 0 OID 20974373)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-560a-30e0-61fa-9e2b27a04144	00040000-560a-30df-d90c-7d259fad5849	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e0-bfd1-1418026c07f4	00040000-560a-30df-d90c-7d259fad5849	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-560a-30e0-0e95-9b65a7fc7cfa	00040000-560a-30df-d90c-7d259fad5849	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e0-0649-82a4ce5bb18e	00040000-560a-30df-d90c-7d259fad5849	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e1-1d5d-b8d4b9252215	00040000-560a-30df-d90c-7d259fad5849	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e1-55f2-a8c62ec749e9	00040000-560a-30df-263e-7f75f9361230	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e1-344a-6143da0fa450	00040000-560a-30df-a8dd-63767c9290d5	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e1-7f98-15a8e516e51b	00040000-560a-30df-90b7-1bf5e735398f	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e1-b989-c7f875b4315e	00040000-560a-30df-6a33-3f3e58ba1069	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-560a-30e2-2f35-d6ccb2486d95	00040000-560a-30df-d90c-7d259fad5849	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2983 (class 0 OID 20974407)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-560a-30de-4ecb-20e3efbf2354	8341	Adlešiči
00050000-560a-30de-44c5-cf541ffea5ac	5270	Ajdovščina
00050000-560a-30de-56e8-5d4eb30cc1cd	6280	Ankaran/Ancarano
00050000-560a-30de-1647-59911e74aedf	9253	Apače
00050000-560a-30de-71fd-79600e428fb7	8253	Artiče
00050000-560a-30de-f20a-3e30ea666b8f	4275	Begunje na Gorenjskem
00050000-560a-30de-80d4-6c95c73883fe	1382	Begunje pri Cerknici
00050000-560a-30de-86c4-bace0b3bda3f	9231	Beltinci
00050000-560a-30de-4f3f-83d845fdcaef	2234	Benedikt
00050000-560a-30de-9c82-65f6720f3c00	2345	Bistrica ob Dravi
00050000-560a-30de-d0f0-fbd014a630f3	3256	Bistrica ob Sotli
00050000-560a-30de-9abc-64af5fa77814	8259	Bizeljsko
00050000-560a-30de-eeac-e65c59e7faa7	1223	Blagovica
00050000-560a-30de-5bf7-cdb20ac0df61	8283	Blanca
00050000-560a-30de-c4de-ef593bf0c4de	4260	Bled
00050000-560a-30de-0788-3bb3220df605	4273	Blejska Dobrava
00050000-560a-30de-ab9f-75e4792c5de2	9265	Bodonci
00050000-560a-30de-f82f-28f81a5b1d82	9222	Bogojina
00050000-560a-30de-5534-2d60e07ee19b	4263	Bohinjska Bela
00050000-560a-30de-da44-3ffd46f7957e	4264	Bohinjska Bistrica
00050000-560a-30de-bbb1-68e3c4cdc575	4265	Bohinjsko jezero
00050000-560a-30de-ea5c-1f9085b03d8b	1353	Borovnica
00050000-560a-30de-ff19-3d9b80ff9ad9	8294	Boštanj
00050000-560a-30de-3a82-13cfce77ff26	5230	Bovec
00050000-560a-30de-a3ff-19c2f834029e	5295	Branik
00050000-560a-30de-f0b3-04180adad7e2	3314	Braslovče
00050000-560a-30de-f270-2dc70de6b46a	5223	Breginj
00050000-560a-30de-0a40-b54380cca6de	8280	Brestanica
00050000-560a-30de-03e4-6db08dc475c6	2354	Bresternica
00050000-560a-30de-5eaf-53cdb1c1dbf5	4243	Brezje
00050000-560a-30de-2aec-7a1bd567ff2f	1351	Brezovica pri Ljubljani
00050000-560a-30de-ee58-faf6bc87b6b8	8250	Brežice
00050000-560a-30de-17f4-1367d1847343	4210	Brnik - Aerodrom
00050000-560a-30de-891f-cffba7df17fb	8321	Brusnice
00050000-560a-30de-8db1-90c6fb04aa68	3255	Buče
00050000-560a-30de-ae1a-90bdbefe37ff	8276	Bučka 
00050000-560a-30de-bb46-9b02a275cc41	9261	Cankova
00050000-560a-30de-2ac9-fa3d897f63bd	3000	Celje 
00050000-560a-30de-105a-98242b4c96c7	3001	Celje - poštni predali
00050000-560a-30de-3140-0a0c908a27a7	4207	Cerklje na Gorenjskem
00050000-560a-30de-9f38-8a7d3e84e8c1	8263	Cerklje ob Krki
00050000-560a-30de-eea7-5eeb67946d14	1380	Cerknica
00050000-560a-30de-a3de-d281060f84cd	5282	Cerkno
00050000-560a-30de-09ec-6566b195fbc5	2236	Cerkvenjak
00050000-560a-30de-8027-5491d241bb34	2215	Ceršak
00050000-560a-30de-488b-9f5b4bd85d9d	2326	Cirkovce
00050000-560a-30de-3a25-b407193c408a	2282	Cirkulane
00050000-560a-30de-d98e-e92553abe277	5273	Col
00050000-560a-30de-1dbc-cd7b720622e5	8251	Čatež ob Savi
00050000-560a-30de-cd90-51792e4765b4	1413	Čemšenik
00050000-560a-30de-e778-56e45a4ab8f6	5253	Čepovan
00050000-560a-30de-7b32-a13362e5eea1	9232	Črenšovci
00050000-560a-30de-813f-f62786e8eebf	2393	Črna na Koroškem
00050000-560a-30de-12d4-9911c5543eb9	6275	Črni Kal
00050000-560a-30de-0ce5-d7d94d357ca2	5274	Črni Vrh nad Idrijo
00050000-560a-30de-f14c-506329f71726	5262	Črniče
00050000-560a-30de-3a8a-ec1cb838a8cf	8340	Črnomelj
00050000-560a-30de-ba6e-70be8eec608c	6271	Dekani
00050000-560a-30de-a9cc-3b8f37f7564b	5210	Deskle
00050000-560a-30de-3c10-f04cd925311b	2253	Destrnik
00050000-560a-30de-cf53-fc6aaf153f1a	6215	Divača
00050000-560a-30de-e797-722e6726376f	1233	Dob
00050000-560a-30de-d723-7d6165898559	3224	Dobje pri Planini
00050000-560a-30de-ca99-36142418df4a	8257	Dobova
00050000-560a-30de-72aa-4a540b765f8c	1423	Dobovec
00050000-560a-30de-acbe-61d8e737df42	5263	Dobravlje
00050000-560a-30de-8d4c-d9c95805736b	3204	Dobrna
00050000-560a-30de-5e84-73b757fe0f28	8211	Dobrnič
00050000-560a-30de-edb9-917ba45f3e42	1356	Dobrova
00050000-560a-30de-c2ff-d42a797bd32a	9223	Dobrovnik/Dobronak 
00050000-560a-30de-f1cb-e594f4757211	5212	Dobrovo v Brdih
00050000-560a-30de-6345-896a729f40e0	1431	Dol pri Hrastniku
00050000-560a-30de-b364-8d6c7755112f	1262	Dol pri Ljubljani
00050000-560a-30de-8b31-9c8690b77595	1273	Dole pri Litiji
00050000-560a-30de-3dfd-e86dadd6d4bd	1331	Dolenja vas
00050000-560a-30de-690e-1a2e5f7b53e2	8350	Dolenjske Toplice
00050000-560a-30de-8b03-23d6b4ab35c5	1230	Domžale
00050000-560a-30de-1cb8-53afa8f43fb5	2252	Dornava
00050000-560a-30de-98ca-6ad101c70138	5294	Dornberk
00050000-560a-30de-4de6-7ab8128ae434	1319	Draga
00050000-560a-30de-f06b-d43575275585	8343	Dragatuš
00050000-560a-30de-ce86-8042e55fbc94	3222	Dramlje
00050000-560a-30de-523e-e0029e6d4298	2370	Dravograd
00050000-560a-30de-756e-b7c5fa525098	4203	Duplje
00050000-560a-30de-c1f8-6df505c0e9eb	6221	Dutovlje
00050000-560a-30de-e99e-bc9e03e514bb	8361	Dvor
00050000-560a-30de-097c-72cd698685e3	2343	Fala
00050000-560a-30de-0db7-1fcbe7d77471	9208	Fokovci
00050000-560a-30de-a55f-e95ab6f2a7cb	2313	Fram
00050000-560a-30de-1ec7-bf8b3a7de0e8	3213	Frankolovo
00050000-560a-30de-d266-36a5e6da9450	1274	Gabrovka
00050000-560a-30de-15dd-dbe323fe2d4d	8254	Globoko
00050000-560a-30de-f560-0d7725a1fc09	5275	Godovič
00050000-560a-30de-f474-c067d926e96e	4204	Golnik
00050000-560a-30de-3900-fa50faeb9757	3303	Gomilsko
00050000-560a-30de-2674-38b15dedef8c	4224	Gorenja vas
00050000-560a-30de-1031-7eac80eb7166	3263	Gorica pri Slivnici
00050000-560a-30de-4145-a72290004066	2272	Gorišnica
00050000-560a-30de-d484-59b0bbbfcac2	9250	Gornja Radgona
00050000-560a-30de-0bae-ce358aa921f9	3342	Gornji Grad
00050000-560a-30de-158f-5391dd9020ca	4282	Gozd Martuljek
00050000-560a-30de-73c8-2b3bf6c67ab9	6272	Gračišče
00050000-560a-30de-6a74-18a84c4698f1	9264	Grad
00050000-560a-30de-f4a2-57333d2b6327	8332	Gradac
00050000-560a-30de-558c-f9b22f2fea73	1384	Grahovo
00050000-560a-30de-e339-f716f8d0489d	5242	Grahovo ob Bači
00050000-560a-30de-de5e-35dde4c0961b	5251	Grgar
00050000-560a-30de-ef89-b5861a6d018e	3302	Griže
00050000-560a-30de-bcb6-44928bda7cc3	3231	Grobelno
00050000-560a-30de-5c38-7bf3f8ea18a5	1290	Grosuplje
00050000-560a-30de-6806-ff24b970b6fc	2288	Hajdina
00050000-560a-30de-0144-66a9bea2861c	8362	Hinje
00050000-560a-30de-7c60-0373a6e1c8c1	2311	Hoče
00050000-560a-30de-3e44-ae3c214ce50c	9205	Hodoš/Hodos
00050000-560a-30de-01b5-4caa144f0702	1354	Horjul
00050000-560a-30de-2488-f116382fb9e8	1372	Hotedršica
00050000-560a-30de-8e47-4f6657302167	1430	Hrastnik
00050000-560a-30de-64dc-2ce6bdd815ef	6225	Hruševje
00050000-560a-30de-53d1-97efe48127aa	4276	Hrušica
00050000-560a-30de-22cb-9a9aff649a57	5280	Idrija
00050000-560a-30de-f689-739c68148940	1292	Ig
00050000-560a-30de-7a0a-faab154ed1ce	6250	Ilirska Bistrica
00050000-560a-30de-1e0b-fd2b9bc90114	6251	Ilirska Bistrica-Trnovo
00050000-560a-30de-e991-e79b1e3449a8	1295	Ivančna Gorica
00050000-560a-30de-6cb4-06c8bc391d71	2259	Ivanjkovci
00050000-560a-30de-871d-7c3c5c8c9f2d	1411	Izlake
00050000-560a-30de-bc1f-4bda1c1994a0	6310	Izola/Isola
00050000-560a-30de-6845-6b28efa4ea52	2222	Jakobski Dol
00050000-560a-30de-046f-42a832f948e8	2221	Jarenina
00050000-560a-30de-fb43-21f554ae7b01	6254	Jelšane
00050000-560a-30de-9160-b6b03c1469a0	4270	Jesenice
00050000-560a-30de-f375-5e259da584b0	8261	Jesenice na Dolenjskem
00050000-560a-30de-c91b-b593e72521f3	3273	Jurklošter
00050000-560a-30de-9df5-aa4faccf2700	2223	Jurovski Dol
00050000-560a-30de-f8f0-f5e970a427eb	2256	Juršinci
00050000-560a-30de-0ae7-2c6cb5ccdde3	5214	Kal nad Kanalom
00050000-560a-30de-966d-cc0b081c71b0	3233	Kalobje
00050000-560a-30de-e6da-902a922ddd9a	4246	Kamna Gorica
00050000-560a-30de-ae3e-cd64095c627b	2351	Kamnica
00050000-560a-30de-57ca-c9576809bc4d	1241	Kamnik
00050000-560a-30de-3984-9c100a5b8cd8	5213	Kanal
00050000-560a-30de-b3fe-c7a686e3cd25	8258	Kapele
00050000-560a-30de-9eab-fe3a6a89811d	2362	Kapla
00050000-560a-30de-2363-d3ad42092e62	2325	Kidričevo
00050000-560a-30de-d996-1c0afe218258	1412	Kisovec
00050000-560a-30de-7ba1-b8c3447666bd	6253	Knežak
00050000-560a-30de-4501-5c443114c485	5222	Kobarid
00050000-560a-30de-d03c-92dcb23916f9	9227	Kobilje
00050000-560a-30de-0bb6-2d68539c9a20	1330	Kočevje
00050000-560a-30de-5c4a-d8fe8e9da7e6	1338	Kočevska Reka
00050000-560a-30de-b694-5e66d94b5615	2276	Kog
00050000-560a-30de-a060-0b5b13b5517b	5211	Kojsko
00050000-560a-30de-fccd-bb9f336141bb	6223	Komen
00050000-560a-30de-80f8-247e9644125c	1218	Komenda
00050000-560a-30de-8ae0-996af7f59927	6000	Koper/Capodistria 
00050000-560a-30de-ff8f-fec69ebb3d68	6001	Koper/Capodistria - poštni predali
00050000-560a-30de-3a2f-f31576318711	8282	Koprivnica
00050000-560a-30de-fcc4-b30d939a6863	5296	Kostanjevica na Krasu
00050000-560a-30de-aba6-27d561d12e0f	8311	Kostanjevica na Krki
00050000-560a-30de-5131-69cf9c6fb096	1336	Kostel
00050000-560a-30de-9700-bdba892ccb49	6256	Košana
00050000-560a-30de-a96d-31ed0f484161	2394	Kotlje
00050000-560a-30de-7206-a18fab136619	6240	Kozina
00050000-560a-30de-4e9f-0075db2a3750	3260	Kozje
00050000-560a-30de-9119-d196985b9838	4000	Kranj 
00050000-560a-30de-e7d8-00af18411850	4001	Kranj - poštni predali
00050000-560a-30de-16c2-e1de84635367	4280	Kranjska Gora
00050000-560a-30de-1c4c-25729a10e760	1281	Kresnice
00050000-560a-30de-1332-92f4024bbedd	4294	Križe
00050000-560a-30de-f291-7e652b723a75	9206	Križevci
00050000-560a-30de-4dd7-21cd5bdadd2b	9242	Križevci pri Ljutomeru
00050000-560a-30de-3111-2cce879aa20d	1301	Krka
00050000-560a-30de-7058-5100b000b114	8296	Krmelj
00050000-560a-30de-b39b-efe05f555d3a	4245	Kropa
00050000-560a-30de-f054-4aa4ba275688	8262	Krška vas
00050000-560a-30de-fb85-a6cf92adc624	8270	Krško
00050000-560a-30de-3e6d-dcfa84c525ed	9263	Kuzma
00050000-560a-30de-e209-11d539e613a8	2318	Laporje
00050000-560a-30de-495e-a7dae9730a31	3270	Laško
00050000-560a-30de-2484-169bdab0be02	1219	Laze v Tuhinju
00050000-560a-30de-6e00-5867f0a50938	2230	Lenart v Slovenskih goricah
00050000-560a-30de-3dbc-bf28cc821b55	9220	Lendava/Lendva
00050000-560a-30de-5431-50a6e4c04bdf	4248	Lesce
00050000-560a-30de-2609-24c133e0e953	3261	Lesično
00050000-560a-30de-36c0-7c8c4340bd3c	8273	Leskovec pri Krškem
00050000-560a-30de-c0d9-d7befef37338	2372	Libeliče
00050000-560a-30de-1509-d1b2eb312692	2341	Limbuš
00050000-560a-30de-a352-68044dd6972a	1270	Litija
00050000-560a-30de-cb11-fa91e875dff0	3202	Ljubečna
00050000-560a-30de-52ab-bfe0b0dc5e1e	1000	Ljubljana 
00050000-560a-30de-53e1-bfa3bba666e3	1001	Ljubljana - poštni predali
00050000-560a-30de-10be-530a676cedcc	1231	Ljubljana - Črnuče
00050000-560a-30de-3a6b-3d15c0a3fd41	1261	Ljubljana - Dobrunje
00050000-560a-30de-c72b-c2ecbdd997d9	1260	Ljubljana - Polje
00050000-560a-30de-3e88-6c34c153fb08	1210	Ljubljana - Šentvid
00050000-560a-30de-0ba6-fa48694276ca	1211	Ljubljana - Šmartno
00050000-560a-30de-8493-d764c1f9e3d8	3333	Ljubno ob Savinji
00050000-560a-30de-a7e3-a04a18cbeb01	9240	Ljutomer
00050000-560a-30de-d91e-e0cb333d6bf4	3215	Loče
00050000-560a-30de-e594-9d148f744fbd	5231	Log pod Mangartom
00050000-560a-30de-2ec9-fe9147e19be1	1358	Log pri Brezovici
00050000-560a-30de-7091-7da5651799c1	1370	Logatec
00050000-560a-30de-25e1-3e8bcea261db	1371	Logatec
00050000-560a-30de-daf1-f1d836e69ba1	1434	Loka pri Zidanem Mostu
00050000-560a-30de-4cc4-ce4cf0533b5e	3223	Loka pri Žusmu
00050000-560a-30de-fd38-4982a282e845	6219	Lokev
00050000-560a-30de-2045-df60ef29a7ac	1318	Loški Potok
00050000-560a-30de-bfd6-6c368186fa8a	2324	Lovrenc na Dravskem polju
00050000-560a-30de-3435-c3018b8da0b8	2344	Lovrenc na Pohorju
00050000-560a-30de-e34c-5361f9f181d6	3334	Luče
00050000-560a-30de-5a3d-a5e4c905a4d7	1225	Lukovica
00050000-560a-30de-c7d3-26e0ec03c1a6	9202	Mačkovci
00050000-560a-30de-8828-f54cd0ad8691	2322	Majšperk
00050000-560a-30de-4631-4679b76a3f5c	2321	Makole
00050000-560a-30de-a210-d3973ee80442	9243	Mala Nedelja
00050000-560a-30de-f494-ca637593219e	2229	Malečnik
00050000-560a-30de-22a2-c0ff06079062	6273	Marezige
00050000-560a-30de-5a63-4bce65975435	2000	Maribor 
00050000-560a-30de-a9ee-86eeef664e65	2001	Maribor - poštni predali
00050000-560a-30de-47e6-02a814d800f2	2206	Marjeta na Dravskem polju
00050000-560a-30de-3fe3-665d8fa36bc9	2281	Markovci
00050000-560a-30de-a09b-109970607267	9221	Martjanci
00050000-560a-30de-cf11-683c392b4929	6242	Materija
00050000-560a-30de-7baf-b9ea5ec39765	4211	Mavčiče
00050000-560a-30de-264d-fd733f013388	1215	Medvode
00050000-560a-30de-baf3-d6d20d608ed3	1234	Mengeš
00050000-560a-30de-d72e-65b4192750af	8330	Metlika
00050000-560a-30de-1dd7-ffc37f56e6b7	2392	Mežica
00050000-560a-30de-ae81-483f61a4cc11	2204	Miklavž na Dravskem polju
00050000-560a-30de-3fbc-08a2038bf8dc	2275	Miklavž pri Ormožu
00050000-560a-30de-4673-eb5fde30232d	5291	Miren
00050000-560a-30de-1895-a56ac20302f5	8233	Mirna
00050000-560a-30de-d863-9a397ea30721	8216	Mirna Peč
00050000-560a-30de-27c9-5c92c878be25	2382	Mislinja
00050000-560a-30de-fcd0-bc461b101b81	4281	Mojstrana
00050000-560a-30de-8876-46788a6876df	8230	Mokronog
00050000-560a-30de-3c46-63258e8b180a	1251	Moravče
00050000-560a-30de-d0a4-714e3564b340	9226	Moravske Toplice
00050000-560a-30de-2fa7-77bc8e2cd485	5216	Most na Soči
00050000-560a-30de-0b8a-7a697e86f7aa	1221	Motnik
00050000-560a-30de-3d01-3384bbcf2526	3330	Mozirje
00050000-560a-30de-78b7-67a684638015	9000	Murska Sobota 
00050000-560a-30de-b773-ed1de0359962	9001	Murska Sobota - poštni predali
00050000-560a-30de-6ee1-9c7896e59f8b	2366	Muta
00050000-560a-30de-cdd6-067d0e83a856	4202	Naklo
00050000-560a-30de-7315-bc32b36ee5e7	3331	Nazarje
00050000-560a-30de-bd87-41bbe04372f3	1357	Notranje Gorice
00050000-560a-30de-1438-d77a06e18fe6	3203	Nova Cerkev
00050000-560a-30de-3d18-4d725d05984a	5000	Nova Gorica 
00050000-560a-30de-b074-8da732165c69	5001	Nova Gorica - poštni predali
00050000-560a-30de-c0c7-770ef734e3f6	1385	Nova vas
00050000-560a-30de-3a17-dd98dab46bcd	8000	Novo mesto
00050000-560a-30de-8016-d1d0aa13ec91	8001	Novo mesto - poštni predali
00050000-560a-30de-4776-77acbb980af5	6243	Obrov
00050000-560a-30de-723c-4bc7facf6439	9233	Odranci
00050000-560a-30de-f2c4-63935aad1933	2317	Oplotnica
00050000-560a-30de-e121-d39050df6618	2312	Orehova vas
00050000-560a-30de-a679-c96bb0c875c9	2270	Ormož
00050000-560a-30de-ae15-e46c753a8bcd	1316	Ortnek
00050000-560a-30de-714d-216fa62c8516	1337	Osilnica
00050000-560a-30de-c209-bb0cb4a741cf	8222	Otočec
00050000-560a-30de-c94c-08b535a7f558	2361	Ožbalt
00050000-560a-30de-4b3e-cc770c1e9f97	2231	Pernica
00050000-560a-30de-d88c-5479056709e2	2211	Pesnica pri Mariboru
00050000-560a-30de-33c2-d3e220474a6b	9203	Petrovci
00050000-560a-30de-2e9f-8f456af76bba	3301	Petrovče
00050000-560a-30de-806f-afe7c5531f4d	6330	Piran/Pirano
00050000-560a-30de-2bee-a9b947924877	8255	Pišece
00050000-560a-30de-50b9-753fc2e5eb62	6257	Pivka
00050000-560a-30de-1bb7-bd3ba3613f65	6232	Planina
00050000-560a-30de-7094-6c8106b842c2	3225	Planina pri Sevnici
00050000-560a-30de-bca8-1a54e3634e31	6276	Pobegi
00050000-560a-30de-d9ee-7105945330ee	8312	Podbočje
00050000-560a-30de-2106-f70880901f7f	5243	Podbrdo
00050000-560a-30de-a79a-7b593b7889be	3254	Podčetrtek
00050000-560a-30de-37f9-e0527534030b	2273	Podgorci
00050000-560a-30de-8985-9ff234e985dd	6216	Podgorje
00050000-560a-30de-2ed1-eb1b7fbe268a	2381	Podgorje pri Slovenj Gradcu
00050000-560a-30de-c0f7-ca146c1fb8a6	6244	Podgrad
00050000-560a-30de-32a0-7815dc6dfd6f	1414	Podkum
00050000-560a-30de-c644-81985f16131b	2286	Podlehnik
00050000-560a-30de-7393-a73b83eb0354	5272	Podnanos
00050000-560a-30de-8cfe-846af45848fc	4244	Podnart
00050000-560a-30de-c261-613ea6fdca56	3241	Podplat
00050000-560a-30de-6d3e-1b64e3ab163c	3257	Podsreda
00050000-560a-30de-8f14-5ab90b91dccd	2363	Podvelka
00050000-560a-30de-5934-9ba65c353b42	2208	Pohorje
00050000-560a-30de-cc8c-851bf9783728	2257	Polenšak
00050000-560a-30de-52c0-b23a1d83ae8b	1355	Polhov Gradec
00050000-560a-30de-0f0f-1d58b4fae0e4	4223	Poljane nad Škofjo Loko
00050000-560a-30de-cb37-cce4451e06f6	2319	Poljčane
00050000-560a-30de-72f1-9dcb9408a6ba	1272	Polšnik
00050000-560a-30de-2f62-332938ca256c	3313	Polzela
00050000-560a-30de-c5d8-22459e1c671f	3232	Ponikva
00050000-560a-30de-bd89-f522c7a54b6f	6320	Portorož/Portorose
00050000-560a-30de-cc83-95c0038e8ddb	6230	Postojna
00050000-560a-30de-2b60-f65b5f8f1281	2331	Pragersko
00050000-560a-30de-d07a-d52f8e3e3ba6	3312	Prebold
00050000-560a-30de-a024-2c1c2b69e9ed	4205	Preddvor
00050000-560a-30de-27b9-d0d668d2dab2	6255	Prem
00050000-560a-30de-28e7-8baa730c909b	1352	Preserje
00050000-560a-30de-6545-fe42df81a779	6258	Prestranek
00050000-560a-30de-cbcd-a85da2c5712d	2391	Prevalje
00050000-560a-30de-97ec-59ac808c6921	3262	Prevorje
00050000-560a-30de-a2d6-a10fe716e0f7	1276	Primskovo 
00050000-560a-30de-ff15-66e526d75591	3253	Pristava pri Mestinju
00050000-560a-30de-bf74-2cb7a6c6a8ca	9207	Prosenjakovci/Partosfalva
00050000-560a-30de-3661-8e955c2dbd99	5297	Prvačina
00050000-560a-30de-db1d-119b3077b47b	2250	Ptuj
00050000-560a-30de-8bbf-4534362e0bfa	2323	Ptujska Gora
00050000-560a-30de-4bbb-ebdb3faeee70	9201	Puconci
00050000-560a-30de-bf3e-3d097a9f5c66	2327	Rače
00050000-560a-30de-206d-392add21218d	1433	Radeče
00050000-560a-30de-3a70-0b69ba88ab3d	9252	Radenci
00050000-560a-30de-386b-f61f17fce908	2360	Radlje ob Dravi
00050000-560a-30de-5e6b-444ea39c942a	1235	Radomlje
00050000-560a-30de-977a-e6f570112d16	4240	Radovljica
00050000-560a-30de-86d2-ba3252d6097c	8274	Raka
00050000-560a-30df-2378-d50d3f746a95	1381	Rakek
00050000-560a-30df-cc11-f59076c03f6e	4283	Rateče - Planica
00050000-560a-30df-3110-49545bd799cc	2390	Ravne na Koroškem
00050000-560a-30df-0bc6-0d316a21b7b0	9246	Razkrižje
00050000-560a-30df-633b-e3283686817e	3332	Rečica ob Savinji
00050000-560a-30df-cc95-84c781188d20	5292	Renče
00050000-560a-30df-d056-d72f0c66a105	1310	Ribnica
00050000-560a-30df-b33b-0001fa6f6174	2364	Ribnica na Pohorju
00050000-560a-30df-ce07-3d2173d2b644	3272	Rimske Toplice
00050000-560a-30df-dca1-a4d12e1a83c1	1314	Rob
00050000-560a-30df-a4e8-09178165e226	5215	Ročinj
00050000-560a-30df-e619-0a4ada7ab9b6	3250	Rogaška Slatina
00050000-560a-30df-621e-913bd88b7f34	9262	Rogašovci
00050000-560a-30df-41b4-0595b6c027b5	3252	Rogatec
00050000-560a-30df-e672-7336a1d3d60a	1373	Rovte
00050000-560a-30df-ef47-7186950af56e	2342	Ruše
00050000-560a-30df-1712-4d2ede332094	1282	Sava
00050000-560a-30df-c7e0-4215fc029087	6333	Sečovlje/Sicciole
00050000-560a-30df-95c9-796b302e7cc8	4227	Selca
00050000-560a-30df-e1b3-d8f516ff8f45	2352	Selnica ob Dravi
00050000-560a-30df-e27c-b8e6e2c7014f	8333	Semič
00050000-560a-30df-82fe-4c4a324b76e4	8281	Senovo
00050000-560a-30df-5450-99c40d1bf2f9	6224	Senožeče
00050000-560a-30df-24fd-10b27ff3029d	8290	Sevnica
00050000-560a-30df-c16f-8cc9a7bd8621	6210	Sežana
00050000-560a-30df-b098-61dc14f99ebf	2214	Sladki Vrh
00050000-560a-30df-0141-0e013d3ef5aa	5283	Slap ob Idrijci
00050000-560a-30df-b515-5b603d6e6dbb	2380	Slovenj Gradec
00050000-560a-30df-ed54-71b5fd86faf7	2310	Slovenska Bistrica
00050000-560a-30df-8fe3-75ab76fac3d5	3210	Slovenske Konjice
00050000-560a-30df-457c-2699cc470161	1216	Smlednik
00050000-560a-30df-2f03-f5efa73e5301	5232	Soča
00050000-560a-30df-81a5-294565f45857	1317	Sodražica
00050000-560a-30df-59fe-5c43b75ca31d	3335	Solčava
00050000-560a-30df-34e4-0196bf3936ba	5250	Solkan
00050000-560a-30df-6725-f21183a963ae	4229	Sorica
00050000-560a-30df-efc7-2389542c6d45	4225	Sovodenj
00050000-560a-30df-97d8-a4a09864010d	5281	Spodnja Idrija
00050000-560a-30df-9a82-9d56e29518f6	2241	Spodnji Duplek
00050000-560a-30df-422f-280807d149dc	9245	Spodnji Ivanjci
00050000-560a-30df-c826-5cb77a6bc5b7	2277	Središče ob Dravi
00050000-560a-30df-d581-198630328770	4267	Srednja vas v Bohinju
00050000-560a-30df-c790-1e5165564033	8256	Sromlje 
00050000-560a-30df-e45d-2e97b415f484	5224	Srpenica
00050000-560a-30df-8d6a-87219088cdfc	1242	Stahovica
00050000-560a-30df-cd51-2f147db7333b	1332	Stara Cerkev
00050000-560a-30df-1a02-8e5723e11d3c	8342	Stari trg ob Kolpi
00050000-560a-30df-9f70-5df9609a8350	1386	Stari trg pri Ložu
00050000-560a-30df-9165-a359fbf9c3ee	2205	Starše
00050000-560a-30df-4211-f08c43edb64e	2289	Stoperce
00050000-560a-30df-5ebd-72c0a2fa752f	8322	Stopiče
00050000-560a-30df-4639-06540055d383	3206	Stranice
00050000-560a-30df-7047-22ddc04a1e17	8351	Straža
00050000-560a-30df-5020-8dac26afeb88	1313	Struge
00050000-560a-30df-fed2-bd7e7ca6e4b1	8293	Studenec
00050000-560a-30df-afc0-d0c2497c6083	8331	Suhor
00050000-560a-30df-e5d8-c4cd78852153	2233	Sv. Ana v Slovenskih goricah
00050000-560a-30df-d3d1-5750adeba97c	2235	Sv. Trojica v Slovenskih goricah
00050000-560a-30df-8d3e-33a37084b6c9	2353	Sveti Duh na Ostrem Vrhu
00050000-560a-30df-3c22-243afcd54995	9244	Sveti Jurij ob Ščavnici
00050000-560a-30df-a1a4-2743274d0166	3264	Sveti Štefan
00050000-560a-30df-fedb-e2ef64d7fb47	2258	Sveti Tomaž
00050000-560a-30df-3f17-90037c6b6c76	9204	Šalovci
00050000-560a-30df-c683-26670561489a	5261	Šempas
00050000-560a-30df-bc64-6fdbb772cedf	5290	Šempeter pri Gorici
00050000-560a-30df-a2b2-12178b5d8718	3311	Šempeter v Savinjski dolini
00050000-560a-30df-9c30-276cfa2bcc58	4208	Šenčur
00050000-560a-30df-f1cb-de2272654675	2212	Šentilj v Slovenskih goricah
00050000-560a-30df-c589-9ed3bc2652c1	8297	Šentjanž
00050000-560a-30df-ff83-9d7027d14c0b	2373	Šentjanž pri Dravogradu
00050000-560a-30df-84fd-59084ce5894c	8310	Šentjernej
00050000-560a-30df-4a5b-73b17d23f0bd	3230	Šentjur
00050000-560a-30df-c2ae-6a894c58dd2f	3271	Šentrupert
00050000-560a-30df-eef5-b5f8c3af8ef2	8232	Šentrupert
00050000-560a-30df-c0bd-21bcdb97e4cd	1296	Šentvid pri Stični
00050000-560a-30df-50e8-6bf6687ff068	8275	Škocjan
00050000-560a-30df-d81a-eccfe6ecb971	6281	Škofije
00050000-560a-30df-7d03-60b1b5604712	4220	Škofja Loka
00050000-560a-30df-a2b8-441c44bce1c5	3211	Škofja vas
00050000-560a-30df-119b-7fbf897e5b34	1291	Škofljica
00050000-560a-30df-20f5-bea9281db89d	6274	Šmarje
00050000-560a-30df-4415-54a4f1b0946d	1293	Šmarje - Sap
00050000-560a-30df-95d2-fbd53c661047	3240	Šmarje pri Jelšah
00050000-560a-30df-6d89-b79171c0f878	8220	Šmarješke Toplice
00050000-560a-30df-caf4-6274c3fe2b5f	2315	Šmartno na Pohorju
00050000-560a-30df-283d-f0b8b2d71d24	3341	Šmartno ob Dreti
00050000-560a-30df-0760-b08945a1f907	3327	Šmartno ob Paki
00050000-560a-30df-77e9-d481b52493d2	1275	Šmartno pri Litiji
00050000-560a-30df-c221-cb7e27ceb01c	2383	Šmartno pri Slovenj Gradcu
00050000-560a-30df-ae31-1e7a5f41fe8b	3201	Šmartno v Rožni dolini
00050000-560a-30df-e209-49d18c6ae013	3325	Šoštanj
00050000-560a-30df-906f-25e64b4f5f80	6222	Štanjel
00050000-560a-30df-274d-1d9158e12df6	3220	Štore
00050000-560a-30df-84a6-c685b99fed93	3304	Tabor
00050000-560a-30df-11b4-c8df1eb0fdbe	3221	Teharje
00050000-560a-30df-efc8-5deb5edc2014	9251	Tišina
00050000-560a-30df-2ef5-ceed2960d694	5220	Tolmin
00050000-560a-30df-2e96-54edeac00a64	3326	Topolšica
00050000-560a-30df-68a6-b80a88e9d0c7	2371	Trbonje
00050000-560a-30df-57ba-d84e807b08c0	1420	Trbovlje
00050000-560a-30df-4df4-7a29d7dab886	8231	Trebelno 
00050000-560a-30df-f551-fe858de6ce3a	8210	Trebnje
00050000-560a-30df-5832-1029c56ab7d8	5252	Trnovo pri Gorici
00050000-560a-30df-65ae-f643863eed71	2254	Trnovska vas
00050000-560a-30df-edb0-9b19cb73fb12	1222	Trojane
00050000-560a-30df-caa2-828d1f84d9dc	1236	Trzin
00050000-560a-30df-75a7-1c17e69de1e5	4290	Tržič
00050000-560a-30df-bae6-f0a5ab9574d9	8295	Tržišče
00050000-560a-30df-1150-73e942fb5ef5	1311	Turjak
00050000-560a-30df-2c90-40b73e261ca6	9224	Turnišče
00050000-560a-30df-f11b-da13dbf4e116	8323	Uršna sela
00050000-560a-30df-000d-9e7e48839f82	1252	Vače
00050000-560a-30df-f8b0-66157d75366b	3320	Velenje 
00050000-560a-30df-a427-29b37891d392	3322	Velenje - poštni predali
00050000-560a-30df-b9cc-ac34f01c33a1	8212	Velika Loka
00050000-560a-30df-66a7-1fe239e3ae86	2274	Velika Nedelja
00050000-560a-30df-61a1-db872ed92651	9225	Velika Polana
00050000-560a-30df-a233-157ce8bda225	1315	Velike Lašče
00050000-560a-30df-3ae7-ba46abda6ce6	8213	Veliki Gaber
00050000-560a-30df-5f82-e7bea38e29fb	9241	Veržej
00050000-560a-30df-52d6-364b0bb24014	1312	Videm - Dobrepolje
00050000-560a-30df-43c6-576dd6f64d6f	2284	Videm pri Ptuju
00050000-560a-30df-b467-de5e83817c50	8344	Vinica
00050000-560a-30df-5979-979ce85699a7	5271	Vipava
00050000-560a-30df-813f-a01ee623ad2b	4212	Visoko
00050000-560a-30df-2bf9-afd22ea86247	1294	Višnja Gora
00050000-560a-30df-3f3e-eee0b25f17a0	3205	Vitanje
00050000-560a-30df-ca2e-7e9513add81c	2255	Vitomarci
00050000-560a-30df-94ca-723a8e6e18c4	1217	Vodice
00050000-560a-30df-7735-685130954d83	3212	Vojnik\t
00050000-560a-30df-a959-778b5b68de67	5293	Volčja Draga
00050000-560a-30df-5c8e-1bd8f9a17942	2232	Voličina
00050000-560a-30df-04ef-cebdd5d159da	3305	Vransko
00050000-560a-30df-0069-052c8c5b013d	6217	Vremski Britof
00050000-560a-30df-d835-500de3a6343b	1360	Vrhnika
00050000-560a-30df-7f7e-cd1c4e814df4	2365	Vuhred
00050000-560a-30df-8949-443f410fc8c1	2367	Vuzenica
00050000-560a-30df-6c94-afb8a1cfbdac	8292	Zabukovje 
00050000-560a-30df-0f70-c4c50729d1e5	1410	Zagorje ob Savi
00050000-560a-30df-bfab-41f6dd1aa45d	1303	Zagradec
00050000-560a-30df-3734-7600c82bb71c	2283	Zavrč
00050000-560a-30df-25a0-3cddd34f04c9	8272	Zdole 
00050000-560a-30df-ad63-8e5cb88c8954	4201	Zgornja Besnica
00050000-560a-30df-4cc0-dfd573a70d4c	2242	Zgornja Korena
00050000-560a-30df-71d3-938954e425cf	2201	Zgornja Kungota
00050000-560a-30df-5596-f2a8ee8da14f	2316	Zgornja Ložnica
00050000-560a-30df-c8d7-33216fbe7509	2314	Zgornja Polskava
00050000-560a-30df-b334-fdcf4fd469a5	2213	Zgornja Velka
00050000-560a-30df-6c87-663844529562	4247	Zgornje Gorje
00050000-560a-30df-92a1-60729adf00db	4206	Zgornje Jezersko
00050000-560a-30df-8651-e43c17400bef	2285	Zgornji Leskovec
00050000-560a-30df-aa03-771d7bf91ea5	1432	Zidani Most
00050000-560a-30df-652f-fba6e9b97c15	3214	Zreče
00050000-560a-30df-2c4f-eb85d80dd5b3	4209	Žabnica
00050000-560a-30df-3d63-e11539043764	3310	Žalec
00050000-560a-30df-b5b4-0d6db7ac7c68	4228	Železniki
00050000-560a-30df-258e-ddbd141f7bbc	2287	Žetale
00050000-560a-30df-0e48-3c2cf6310f17	4226	Žiri
00050000-560a-30df-2ffa-79ba4ea12586	4274	Žirovnica
00050000-560a-30df-7c3d-65186a61e8af	8360	Žužemberk
\.


--
-- TOC entry 3028 (class 0 OID 20974990)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20974612)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20974392)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-560a-30e1-c593-7d35a249dc29	00080000-560a-30e0-61fa-9e2b27a04144	\N	00040000-560a-30df-d90c-7d259fad5849	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-560a-30e1-d579-ad2c9b23ebb6	00080000-560a-30e0-61fa-9e2b27a04144	\N	00040000-560a-30df-d90c-7d259fad5849	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-560a-30e1-b50d-abdd2e7c134d	00080000-560a-30e0-bfd1-1418026c07f4	\N	00040000-560a-30df-d90c-7d259fad5849	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2990 (class 0 OID 20974496)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3003 (class 0 OID 20974624)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3029 (class 0 OID 20975004)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 20975014)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-560a-30e1-235b-5bdf5ea92f14	00080000-560a-30e0-0e95-9b65a7fc7cfa	0987	AK
00190000-560a-30e1-4ad9-b023892969bb	00080000-560a-30e0-bfd1-1418026c07f4	0989	AK
00190000-560a-30e1-fd63-23a196d2c145	00080000-560a-30e0-0649-82a4ce5bb18e	0986	AK
00190000-560a-30e1-79f6-d0c0e94eaf29	00080000-560a-30e1-55f2-a8c62ec749e9	0984	AK
00190000-560a-30e1-ddb0-15c6b7073473	00080000-560a-30e1-344a-6143da0fa450	0983	AK
00190000-560a-30e1-4112-2771d2bb3b41	00080000-560a-30e1-7f98-15a8e516e51b	0982	AK
00190000-560a-30e2-37c9-e53e6acf0213	00080000-560a-30e2-2f35-d6ccb2486d95	1001	AK
\.


--
-- TOC entry 3027 (class 0 OID 20974947)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-560a-30e1-c525-a456ef9059ee	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3031 (class 0 OID 20975022)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20974653)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-560a-30e0-a91c-05c5b6854356	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-560a-30e0-33dc-d8cbc1f68ed0	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-560a-30e0-52a5-855b306ce356	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-560a-30e0-1086-5844384fa4dc	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-560a-30e0-7c90-07258811ea49	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-560a-30e0-43e2-43e680806192	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-560a-30e0-ff05-03b6e1d0e614	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2999 (class 0 OID 20974597)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2998 (class 0 OID 20974587)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20974797)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3014 (class 0 OID 20974727)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2988 (class 0 OID 20974470)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2971 (class 0 OID 20974265)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-560a-30e2-2f35-d6ccb2486d95	00010000-560a-30df-cca3-f8e5be7713e2	2015-09-29 08:34:10	INS	a:0:{}
2	App\\Entity\\Option	00000000-560a-30e2-0850-5c8b325b448a	00010000-560a-30df-cca3-f8e5be7713e2	2015-09-29 08:34:10	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-560a-30e2-37c9-e53e6acf0213	00010000-560a-30df-cca3-f8e5be7713e2	2015-09-29 08:34:10	INS	a:0:{}
\.


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3008 (class 0 OID 20974666)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2975 (class 0 OID 20974303)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-560a-30df-54ba-ec902c5f65ef	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-560a-30df-b5e8-3f689a42b217	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-560a-30df-103c-80e9c8161b8d	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-560a-30df-6c18-2e0c333cf5be	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-560a-30df-c9ee-6c5f69b61888	planer	Planer dogodkov v koledarju	t
00020000-560a-30df-6c17-e6c578179ddc	kadrovska	Kadrovska služba	t
00020000-560a-30df-cb5c-f4cc33559afa	arhivar	Ažuriranje arhivalij	t
00020000-560a-30df-f06b-de518dac4b93	igralec	Igralec	t
00020000-560a-30df-ef05-8c7d3bae911d	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-560a-30e1-b402-a5d179a14e14	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2973 (class 0 OID 20974287)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-560a-30df-1970-cf3a28e6a2cb	00020000-560a-30df-103c-80e9c8161b8d
00010000-560a-30df-cca3-f8e5be7713e2	00020000-560a-30df-103c-80e9c8161b8d
00010000-560a-30e1-f266-7af97d657bd6	00020000-560a-30e1-b402-a5d179a14e14
\.


--
-- TOC entry 3010 (class 0 OID 20974680)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3002 (class 0 OID 20974618)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20974564)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20974252)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-560a-30df-febd-79e7d7314f77	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-560a-30df-754a-30676f590b87	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-560a-30df-f2af-6fdaa03fea33	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-560a-30df-b006-558cba5cb475	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-560a-30df-c0ba-f42aa85206ab	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2968 (class 0 OID 20974244)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-560a-30df-2fbf-a77e1d326379	00230000-560a-30df-b006-558cba5cb475	popa
00240000-560a-30df-0311-58825cb0c414	00230000-560a-30df-b006-558cba5cb475	oseba
00240000-560a-30df-a18f-fa8af44828b9	00230000-560a-30df-b006-558cba5cb475	sezona
00240000-560a-30df-f749-6dd3b8e5fb95	00230000-560a-30df-754a-30676f590b87	prostor
00240000-560a-30df-36a0-6dafa89ed5c5	00230000-560a-30df-b006-558cba5cb475	besedilo
00240000-560a-30df-2e75-c529d5464284	00230000-560a-30df-b006-558cba5cb475	uprizoritev
00240000-560a-30df-7644-43217649b21b	00230000-560a-30df-b006-558cba5cb475	funkcija
00240000-560a-30df-01e6-322b80e4f0f5	00230000-560a-30df-b006-558cba5cb475	tipfunkcije
00240000-560a-30df-30f4-f73e37b1dff7	00230000-560a-30df-b006-558cba5cb475	alternacija
00240000-560a-30df-8c8d-e76d4a784bca	00230000-560a-30df-febd-79e7d7314f77	pogodba
00240000-560a-30df-a8b8-cfcae131e2f9	00230000-560a-30df-b006-558cba5cb475	zaposlitev
00240000-560a-30df-ea37-0bb5a79ac00e	00230000-560a-30df-b006-558cba5cb475	zvrstuprizoritve
00240000-560a-30df-0c4c-4b3f4c265a01	00230000-560a-30df-febd-79e7d7314f77	programdela
00240000-560a-30df-d7c3-5788ef850afb	00230000-560a-30df-b006-558cba5cb475	zapis
\.


--
-- TOC entry 2967 (class 0 OID 20974239)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
39957f31-2f78-4695-8c3a-090e88cff15d	00240000-560a-30df-2fbf-a77e1d326379	0	1001
\.


--
-- TOC entry 3016 (class 0 OID 20974744)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-560a-30e1-0f46-3a3f9d6b72f0	000e0000-560a-30e1-8b0d-255eda35c338	00080000-560a-30e0-61fa-9e2b27a04144	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-560a-30df-a1d2-7a75390f8238
00270000-560a-30e1-67f4-3a6581dcc96d	000e0000-560a-30e1-8b0d-255eda35c338	00080000-560a-30e0-61fa-9e2b27a04144	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-560a-30df-a1d2-7a75390f8238
\.


--
-- TOC entry 2980 (class 0 OID 20974365)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2997 (class 0 OID 20974574)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-560a-30e1-be77-e7e0887116b8	00180000-560a-30e1-a357-6f994de742d0	000c0000-560a-30e1-7b72-6a2e4a0b0b98	00090000-560a-30e1-496f-b6816614cb05	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-30e1-67fc-2caca9d575f8	00180000-560a-30e1-a357-6f994de742d0	000c0000-560a-30e1-28d3-52bc30f4b96d	00090000-560a-30e1-1a46-63c44a2c7f34	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-30e1-45de-9da070b9a33b	00180000-560a-30e1-a357-6f994de742d0	000c0000-560a-30e1-6f2c-6214d837bc02	00090000-560a-30e1-4f3c-6e6df679e799	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-30e1-54e1-2bc993565deb	00180000-560a-30e1-a357-6f994de742d0	000c0000-560a-30e1-6f90-7e1d2b9d927f	00090000-560a-30e1-c58f-ddf2b38d8fee	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-30e1-3a9d-2d3b5d85173f	00180000-560a-30e1-a357-6f994de742d0	000c0000-560a-30e1-abb7-c43b95845661	00090000-560a-30e1-c5e1-00e8349e3826	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-560a-30e1-ff68-f0da7734224a	00180000-560a-30e1-d6d3-942e59601afe	\N	00090000-560a-30e1-c5e1-00e8349e3826	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3019 (class 0 OID 20974785)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-560a-30df-8a4c-5a83e39c279b	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-560a-30df-d17c-1dc5f15805ee	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-560a-30df-97a7-f45aca6ca8fd	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-560a-30df-02ca-71303aba31b3	04	Režija	Režija	Režija	umetnik	30
000f0000-560a-30df-5785-3c97eef33247	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-560a-30df-6b8e-8d3f8b92baeb	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-560a-30df-dad2-c5c5e91cc73b	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-560a-30df-e0fb-dc1ac76fc53f	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-560a-30df-82e9-9515eb614e7d	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-560a-30df-3654-8a7d711c3841	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-560a-30df-df8a-d2b719b84fd4	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-560a-30df-0e15-63e44a68a8ed	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-560a-30df-8332-17b6802a7277	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-560a-30df-8176-b1d83ccca0b2	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-560a-30df-1298-250ce483deb1	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-560a-30df-3ef8-fd46fe416d35	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-560a-30df-2bd7-ea40bb94da6a	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-560a-30df-68dd-760d3e802755	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3032 (class 0 OID 20975033)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-560a-30df-c38a-ea7365a30803	01	Velika predstava	f	1.00	1.00
002b0000-560a-30df-ed0f-f9f70810241c	02	Mala predstava	f	0.50	0.50
002b0000-560a-30df-8917-f92e37035c0a	03	Mala koprodukcija	t	0.40	1.00
002b0000-560a-30df-eaa3-413975ab40b9	04	Srednja koprodukcija	t	0.70	2.00
002b0000-560a-30df-b532-48336ad41043	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2985 (class 0 OID 20974427)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2972 (class 0 OID 20974274)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-560a-30df-cca3-f8e5be7713e2	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROv6SkFGkpPV7lUvaRjKCYeVtFyh2xnyq	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-560a-30e1-5aa3-1fc89e37ba4d	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-560a-30e1-9c43-b2c52e17f95e	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-560a-30e1-dc98-0402e68884a1	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-560a-30e1-8c2e-79afcbca5eb0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-560a-30e1-b6e2-0e592eb43cd5	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-560a-30e1-b20d-069706e6f0b5	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-560a-30e1-4b86-97cb886e2fbc	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-560a-30e1-f7cc-fd3719e711c6	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-560a-30e1-e76e-8e1946333a71	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-560a-30e1-f266-7af97d657bd6	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-560a-30df-1970-cf3a28e6a2cb	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3023 (class 0 OID 20974835)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-560a-30e1-2c78-02a0e0c1d5db	00160000-560a-30e0-c902-4a207d78c261	\N	00140000-560a-30df-8c1c-c72ec31796ed	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-560a-30e0-7c90-07258811ea49
000e0000-560a-30e1-8b0d-255eda35c338	00160000-560a-30e0-324d-08348137b103	\N	00140000-560a-30df-7803-c9611146a381	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-560a-30e0-43e2-43e680806192
000e0000-560a-30e1-d1b1-93237bb7a2b7	\N	\N	00140000-560a-30df-7803-c9611146a381	00190000-560a-30e1-235b-5bdf5ea92f14	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-30e0-7c90-07258811ea49
000e0000-560a-30e1-d4de-1ce4cf132b0c	\N	\N	00140000-560a-30df-7803-c9611146a381	00190000-560a-30e1-235b-5bdf5ea92f14	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-560a-30e0-7c90-07258811ea49
000e0000-560a-30e1-7b17-fac82e74fd70	\N	\N	00140000-560a-30df-7803-c9611146a381	00190000-560a-30e1-235b-5bdf5ea92f14	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-30e0-a91c-05c5b6854356
000e0000-560a-30e1-2765-f11f9635f619	\N	\N	00140000-560a-30df-7803-c9611146a381	00190000-560a-30e1-235b-5bdf5ea92f14	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-560a-30e0-a91c-05c5b6854356
\.


--
-- TOC entry 2992 (class 0 OID 20974517)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-560a-30e1-382f-2cb7847f3c3c	000e0000-560a-30e1-8b0d-255eda35c338	\N	1	
00200000-560a-30e1-f345-5eb6597d9e62	000e0000-560a-30e1-8b0d-255eda35c338	\N	2	
00200000-560a-30e1-61d8-af11a49848d6	000e0000-560a-30e1-8b0d-255eda35c338	\N	3	
00200000-560a-30e1-3cf2-cacd2f186429	000e0000-560a-30e1-8b0d-255eda35c338	\N	4	
00200000-560a-30e1-330e-67960e16c761	000e0000-560a-30e1-8b0d-255eda35c338	\N	5	
\.


--
-- TOC entry 3006 (class 0 OID 20974645)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3017 (class 0 OID 20974758)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-560a-30df-9f3f-d83bd042c448	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-560a-30df-0ba4-7ef60630c6e5	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-560a-30df-1763-538e1b3cbf40	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-560a-30df-c9b3-bdad7573dc0e	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-560a-30df-4cc8-9c92ee51c8b8	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-560a-30df-7974-d4656eee68b7	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-560a-30df-917c-915071c961c3	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-560a-30df-aff3-000ca21fc48b	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-560a-30df-a1d2-7a75390f8238	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-560a-30df-e8ce-7f3f8277ab5e	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-560a-30df-1599-ea19fdf99038	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-560a-30df-15cc-16591f632790	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-560a-30df-7d56-d63a16cb0cc4	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-560a-30df-67dd-6d63da8b76f6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-560a-30df-3811-7745581bb25f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-560a-30df-c720-4b4eb0979cdf	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-560a-30df-d959-9e7a8327eba9	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-560a-30df-9586-28447a893cb8	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-560a-30df-95ec-a543b4824212	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-560a-30df-5a3b-85235b85191c	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-560a-30df-1b7f-bedb3b5d553f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-560a-30df-d3e2-b7cda3b26995	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-560a-30df-3dcc-99bb345d7ece	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-560a-30df-6d9b-0970f6c5c86e	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-560a-30df-1dad-130d71e759a7	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-560a-30df-5489-fae416df11b9	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-560a-30df-8dcb-7eb3f215d72f	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-560a-30df-2b85-a73b8bb5838e	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3035 (class 0 OID 20975080)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20975052)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20975092)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20974717)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-560a-30e1-ab0b-830bd5e9e01a	00090000-560a-30e1-1a46-63c44a2c7f34	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-30e1-e52c-1755de95b9bd	00090000-560a-30e1-4f3c-6e6df679e799	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-30e1-ef3b-4a243ae8684b	00090000-560a-30e1-e974-545bc2b57c85	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-30e1-db6c-d9101a19de95	00090000-560a-30e1-aba2-796e3d61d3d6	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-30e1-d2f5-c620fa379451	00090000-560a-30e1-496f-b6816614cb05	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-560a-30e1-22a9-fc9fb8a86b4a	00090000-560a-30e1-564d-665472380c6e	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2994 (class 0 OID 20974553)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 20974825)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-560a-30df-8c1c-c72ec31796ed	01	Drama	drama (SURS 01)
00140000-560a-30df-348b-ee2d844a3a65	02	Opera	opera (SURS 02)
00140000-560a-30df-af62-056bba54b8ed	03	Balet	balet (SURS 03)
00140000-560a-30df-7ad4-34b78a5b6ec7	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-560a-30df-ce8a-5d515fb0d26a	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-560a-30df-7803-c9611146a381	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-560a-30df-c1df-734deb773615	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3012 (class 0 OID 20974707)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2499 (class 2606 OID 20974328)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2691 (class 2606 OID 20974884)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2687 (class 2606 OID 20974874)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2650 (class 2606 OID 20974741)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2661 (class 2606 OID 20974783)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2748 (class 2606 OID 20975132)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2562 (class 2606 OID 20974542)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 20974563)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2724 (class 2606 OID 20975050)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2533 (class 2606 OID 20974453)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 20974941)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2635 (class 2606 OID 20974703)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2556 (class 2606 OID 20974515)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2550 (class 2606 OID 20974491)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2541 (class 2606 OID 20974467)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2599 (class 2606 OID 20974610)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 20975109)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 20975116)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2753 (class 2606 OID 20975140)
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
-- TOC entry 2611 (class 2606 OID 20974637)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2526 (class 2606 OID 20974425)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2503 (class 2606 OID 20974337)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2506 (class 2606 OID 20974361)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2497 (class 2606 OID 20974317)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2490 (class 2606 OID 20974302)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2614 (class 2606 OID 20974643)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2628 (class 2606 OID 20974679)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2673 (class 2606 OID 20974820)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2515 (class 2606 OID 20974389)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2523 (class 2606 OID 20974413)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2708 (class 2606 OID 20975002)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20974616)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20974403)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20974503)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2609 (class 2606 OID 20974628)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20975011)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2714 (class 2606 OID 20975019)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2705 (class 2606 OID 20974989)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20975031)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2621 (class 2606 OID 20974661)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20974601)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2591 (class 2606 OID 20974592)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2668 (class 2606 OID 20974807)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 20974734)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2544 (class 2606 OID 20974479)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20974273)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 20974670)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2488 (class 2606 OID 20974291)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2492 (class 2606 OID 20974311)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 20974688)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2605 (class 2606 OID 20974623)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2579 (class 2606 OID 20974572)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2479 (class 2606 OID 20974261)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2476 (class 2606 OID 20974249)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2473 (class 2606 OID 20974243)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20974754)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2512 (class 2606 OID 20974370)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2585 (class 2606 OID 20974583)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2664 (class 2606 OID 20974794)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2721 (class 2606 OID 20975043)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 20974438)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2484 (class 2606 OID 20974286)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20974853)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 20974525)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2617 (class 2606 OID 20974651)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20974766)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2735 (class 2606 OID 20975090)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2732 (class 2606 OID 20975074)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2738 (class 2606 OID 20975098)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2644 (class 2606 OID 20974725)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20974557)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2677 (class 2606 OID 20974833)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2641 (class 2606 OID 20974715)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2563 (class 1259 OID 20974551)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2564 (class 1259 OID 20974552)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2565 (class 1259 OID 20974550)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2566 (class 1259 OID 20974549)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2567 (class 1259 OID 20974548)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2653 (class 1259 OID 20974755)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2654 (class 1259 OID 20974756)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2655 (class 1259 OID 20974757)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2739 (class 1259 OID 20975111)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2740 (class 1259 OID 20975110)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2513 (class 1259 OID 20974391)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2612 (class 1259 OID 20974644)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2726 (class 1259 OID 20975078)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2727 (class 1259 OID 20975077)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2728 (class 1259 OID 20975079)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2729 (class 1259 OID 20975076)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2730 (class 1259 OID 20975075)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2606 (class 1259 OID 20974630)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2607 (class 1259 OID 20974629)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2558 (class 1259 OID 20974526)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2636 (class 1259 OID 20974704)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2637 (class 1259 OID 20974706)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2638 (class 1259 OID 20974705)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2538 (class 1259 OID 20974469)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2539 (class 1259 OID 20974468)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2717 (class 1259 OID 20975032)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2669 (class 1259 OID 20974822)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2670 (class 1259 OID 20974823)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2671 (class 1259 OID 20974824)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2736 (class 1259 OID 20975099)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2678 (class 1259 OID 20974858)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2679 (class 1259 OID 20974855)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2680 (class 1259 OID 20974859)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2681 (class 1259 OID 20974857)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2682 (class 1259 OID 20974856)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2528 (class 1259 OID 20974440)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2529 (class 1259 OID 20974439)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2504 (class 1259 OID 20974364)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2624 (class 1259 OID 20974671)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2494 (class 1259 OID 20974318)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2495 (class 1259 OID 20974319)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2629 (class 1259 OID 20974691)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2630 (class 1259 OID 20974690)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2631 (class 1259 OID 20974689)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2551 (class 1259 OID 20974504)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2552 (class 1259 OID 20974505)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2474 (class 1259 OID 20974251)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2586 (class 1259 OID 20974596)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2587 (class 1259 OID 20974594)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2588 (class 1259 OID 20974593)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2589 (class 1259 OID 20974595)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2485 (class 1259 OID 20974292)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2486 (class 1259 OID 20974293)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2615 (class 1259 OID 20974652)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2749 (class 1259 OID 20975133)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2651 (class 1259 OID 20974743)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2652 (class 1259 OID 20974742)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2750 (class 1259 OID 20975141)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2751 (class 1259 OID 20975142)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2601 (class 1259 OID 20974617)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2645 (class 1259 OID 20974735)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2646 (class 1259 OID 20974736)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2699 (class 1259 OID 20974946)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2700 (class 1259 OID 20974945)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2701 (class 1259 OID 20974942)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2702 (class 1259 OID 20974943)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2703 (class 1259 OID 20974944)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2517 (class 1259 OID 20974405)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2518 (class 1259 OID 20974404)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2519 (class 1259 OID 20974406)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2618 (class 1259 OID 20974665)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2619 (class 1259 OID 20974664)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2709 (class 1259 OID 20975012)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2710 (class 1259 OID 20975013)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2692 (class 1259 OID 20974888)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2693 (class 1259 OID 20974889)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2694 (class 1259 OID 20974886)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2695 (class 1259 OID 20974887)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2642 (class 1259 OID 20974726)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2592 (class 1259 OID 20974605)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2593 (class 1259 OID 20974604)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2594 (class 1259 OID 20974602)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2595 (class 1259 OID 20974603)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2688 (class 1259 OID 20974876)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2689 (class 1259 OID 20974875)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2542 (class 1259 OID 20974480)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2545 (class 1259 OID 20974494)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2546 (class 1259 OID 20974493)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2547 (class 1259 OID 20974492)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2548 (class 1259 OID 20974495)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2557 (class 1259 OID 20974516)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2706 (class 1259 OID 20975003)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2725 (class 1259 OID 20975051)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2743 (class 1259 OID 20975117)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2744 (class 1259 OID 20975118)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2500 (class 1259 OID 20974339)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2501 (class 1259 OID 20974338)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2509 (class 1259 OID 20974371)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2510 (class 1259 OID 20974372)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2573 (class 1259 OID 20974558)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2581 (class 1259 OID 20974586)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2582 (class 1259 OID 20974585)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2583 (class 1259 OID 20974584)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2568 (class 1259 OID 20974544)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2569 (class 1259 OID 20974545)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2570 (class 1259 OID 20974543)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2571 (class 1259 OID 20974547)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2572 (class 1259 OID 20974546)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2516 (class 1259 OID 20974390)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2534 (class 1259 OID 20974454)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2535 (class 1259 OID 20974456)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2536 (class 1259 OID 20974455)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2537 (class 1259 OID 20974457)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2600 (class 1259 OID 20974611)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2674 (class 1259 OID 20974821)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2683 (class 1259 OID 20974854)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2665 (class 1259 OID 20974795)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2666 (class 1259 OID 20974796)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2507 (class 1259 OID 20974362)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2508 (class 1259 OID 20974363)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2639 (class 1259 OID 20974716)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2480 (class 1259 OID 20974262)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2527 (class 1259 OID 20974426)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2477 (class 1259 OID 20974250)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2722 (class 1259 OID 20975044)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2622 (class 1259 OID 20974663)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2623 (class 1259 OID 20974662)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2696 (class 1259 OID 20974885)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2524 (class 1259 OID 20974414)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2675 (class 1259 OID 20974834)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2733 (class 1259 OID 20975091)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2715 (class 1259 OID 20975020)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2716 (class 1259 OID 20975021)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2662 (class 1259 OID 20974784)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2580 (class 1259 OID 20974573)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2493 (class 1259 OID 20974312)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2784 (class 2606 OID 20975273)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2783 (class 2606 OID 20975278)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2779 (class 2606 OID 20975298)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2785 (class 2606 OID 20975268)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2781 (class 2606 OID 20975288)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2780 (class 2606 OID 20975293)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2782 (class 2606 OID 20975283)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2820 (class 2606 OID 20975463)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2819 (class 2606 OID 20975468)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2818 (class 2606 OID 20975473)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2852 (class 2606 OID 20975638)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2853 (class 2606 OID 20975633)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2765 (class 2606 OID 20975198)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 20975383)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2847 (class 2606 OID 20975618)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2848 (class 2606 OID 20975613)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2846 (class 2606 OID 20975623)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2849 (class 2606 OID 20975608)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2850 (class 2606 OID 20975603)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2800 (class 2606 OID 20975378)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2801 (class 2606 OID 20975373)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2778 (class 2606 OID 20975263)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2812 (class 2606 OID 20975423)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 20975433)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2811 (class 2606 OID 20975428)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2771 (class 2606 OID 20975233)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2772 (class 2606 OID 20975228)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2798 (class 2606 OID 20975363)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2844 (class 2606 OID 20975593)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2823 (class 2606 OID 20975478)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2822 (class 2606 OID 20975483)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2821 (class 2606 OID 20975488)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2851 (class 2606 OID 20975628)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2825 (class 2606 OID 20975508)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2828 (class 2606 OID 20975493)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2824 (class 2606 OID 20975513)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2826 (class 2606 OID 20975503)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2827 (class 2606 OID 20975498)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2769 (class 2606 OID 20975223)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 20975218)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2761 (class 2606 OID 20975183)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2762 (class 2606 OID 20975178)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2806 (class 2606 OID 20975403)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2758 (class 2606 OID 20975158)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2757 (class 2606 OID 20975163)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2807 (class 2606 OID 20975418)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2808 (class 2606 OID 20975413)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2809 (class 2606 OID 20975408)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2776 (class 2606 OID 20975248)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2775 (class 2606 OID 20975253)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2754 (class 2606 OID 20975143)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2790 (class 2606 OID 20975338)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2792 (class 2606 OID 20975328)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2793 (class 2606 OID 20975323)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2791 (class 2606 OID 20975333)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 20975148)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2755 (class 2606 OID 20975153)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2803 (class 2606 OID 20975388)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2856 (class 2606 OID 20975653)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2816 (class 2606 OID 20975458)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2817 (class 2606 OID 20975453)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2858 (class 2606 OID 20975658)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2857 (class 2606 OID 20975663)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2799 (class 2606 OID 20975368)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2815 (class 2606 OID 20975443)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2814 (class 2606 OID 20975448)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2835 (class 2606 OID 20975568)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2836 (class 2606 OID 20975563)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2839 (class 2606 OID 20975548)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2838 (class 2606 OID 20975553)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2837 (class 2606 OID 20975558)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2767 (class 2606 OID 20975208)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20975203)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2766 (class 2606 OID 20975213)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2804 (class 2606 OID 20975398)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2805 (class 2606 OID 20975393)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20975578)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2841 (class 2606 OID 20975583)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2832 (class 2606 OID 20975538)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2831 (class 2606 OID 20975543)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2834 (class 2606 OID 20975528)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2833 (class 2606 OID 20975533)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2813 (class 2606 OID 20975438)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2794 (class 2606 OID 20975358)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2795 (class 2606 OID 20975353)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2797 (class 2606 OID 20975343)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2796 (class 2606 OID 20975348)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2829 (class 2606 OID 20975523)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2830 (class 2606 OID 20975518)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2773 (class 2606 OID 20975238)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2774 (class 2606 OID 20975243)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2777 (class 2606 OID 20975258)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2840 (class 2606 OID 20975573)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2843 (class 2606 OID 20975588)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2845 (class 2606 OID 20975598)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2855 (class 2606 OID 20975643)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2854 (class 2606 OID 20975648)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2759 (class 2606 OID 20975173)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2760 (class 2606 OID 20975168)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2764 (class 2606 OID 20975188)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2763 (class 2606 OID 20975193)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2786 (class 2606 OID 20975303)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2787 (class 2606 OID 20975318)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2788 (class 2606 OID 20975313)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2789 (class 2606 OID 20975308)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-29 08:34:11 CEST

--
-- PostgreSQL database dump complete
--

