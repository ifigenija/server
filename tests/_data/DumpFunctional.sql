--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2015-09-25 16:09:03 CEST

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
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 245
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 20776116)
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
-- TOC entry 229 (class 1259 OID 20776673)
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
-- TOC entry 228 (class 1259 OID 20776656)
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
-- TOC entry 219 (class 1259 OID 20776533)
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
-- TOC entry 222 (class 1259 OID 20776563)
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
-- TOC entry 243 (class 1259 OID 20776913)
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
-- TOC entry 197 (class 1259 OID 20776323)
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
-- TOC entry 199 (class 1259 OID 20776355)
-- Name: dogodeksplosni; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE dogodeksplosni (
    id uuid NOT NULL
);


--
-- TOC entry 237 (class 1259 OID 20776839)
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
-- TOC entry 190 (class 1259 OID 20776237)
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
-- TOC entry 230 (class 1259 OID 20776686)
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
-- TOC entry 215 (class 1259 OID 20776488)
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
-- TOC entry 195 (class 1259 OID 20776302)
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
-- TOC entry 193 (class 1259 OID 20776277)
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
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 193
-- Name: COLUMN job.data; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON COLUMN job.data IS '(DC2Type:object)';


--
-- TOC entry 191 (class 1259 OID 20776254)
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
-- TOC entry 204 (class 1259 OID 20776402)
-- Name: kupec; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE kupec (
    id uuid NOT NULL,
    popa_id uuid
);


--
-- TOC entry 241 (class 1259 OID 20776894)
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
-- TOC entry 242 (class 1259 OID 20776906)
-- Name: mapa_zapis; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE mapa_zapis (
    mapa_id uuid NOT NULL,
    zapis_id uuid NOT NULL
);


--
-- TOC entry 244 (class 1259 OID 20776928)
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
-- TOC entry 208 (class 1259 OID 20776427)
-- Name: nacinplacina; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE nacinplacina (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(10) DEFAULT NULL::character varying
);


--
-- TOC entry 188 (class 1259 OID 20776211)
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
-- TOC entry 182 (class 1259 OID 20776125)
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
-- TOC entry 183 (class 1259 OID 20776136)
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
-- TOC entry 178 (class 1259 OID 20776090)
-- Name: permission; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 180 (class 1259 OID 20776109)
-- Name: permission2role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE permission2role (
    role_id uuid NOT NULL,
    permission_id uuid NOT NULL
);


--
-- TOC entry 209 (class 1259 OID 20776434)
-- Name: placilniinstrument; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE placilniinstrument (
    id uuid NOT NULL,
    nacin_placina_id uuid,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 213 (class 1259 OID 20776468)
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
-- TOC entry 225 (class 1259 OID 20776604)
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
-- TOC entry 185 (class 1259 OID 20776169)
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
-- TOC entry 187 (class 1259 OID 20776203)
-- Name: posta; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE posta (
    id uuid NOT NULL,
    sifra character varying(20) DEFAULT NULL::character varying,
    naziv character varying(40) DEFAULT NULL::character varying
);


--
-- TOC entry 232 (class 1259 OID 20776784)
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
-- TOC entry 205 (class 1259 OID 20776408)
-- Name: postavkaracuna; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE postavkaracuna (
    id uuid NOT NULL,
    racun_id uuid
);


--
-- TOC entry 186 (class 1259 OID 20776188)
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
-- TOC entry 194 (class 1259 OID 20776292)
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
-- TOC entry 207 (class 1259 OID 20776420)
-- Name: prodajapredstave; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE prodajapredstave (
    id uuid NOT NULL,
    sedezni_red_id uuid,
    dogodek_id uuid NOT NULL
);


--
-- TOC entry 233 (class 1259 OID 20776798)
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
-- TOC entry 234 (class 1259 OID 20776808)
-- Name: produkcijskahisa; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE produkcijskahisa (
    id uuid NOT NULL,
    popa_id uuid,
    sifra character varying(4) NOT NULL,
    status character varying(20) DEFAULT NULL::character varying
);


--
-- TOC entry 231 (class 1259 OID 20776741)
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
-- TOC entry 235 (class 1259 OID 20776816)
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
-- TOC entry 211 (class 1259 OID 20776449)
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
-- TOC entry 203 (class 1259 OID 20776393)
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
-- TOC entry 202 (class 1259 OID 20776383)
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
-- TOC entry 224 (class 1259 OID 20776593)
-- Name: rekvizit; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rekvizit (
    id uuid NOT NULL,
    ime character varying(255) DEFAULT NULL::character varying,
    vrsta character varying(255) DEFAULT NULL::character varying,
    status character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 218 (class 1259 OID 20776523)
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
-- TOC entry 192 (class 1259 OID 20776266)
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
-- TOC entry 175 (class 1259 OID 20776061)
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
-- TOC entry 174 (class 1259 OID 20776059)
-- Name: revizije_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE revizije_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE revizije_id_seq OWNED BY revizije.id;


--
-- TOC entry 212 (class 1259 OID 20776462)
-- Name: rezervacija; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE rezervacija (
    id uuid NOT NULL,
    prodaja_predstave_id uuid
);


--
-- TOC entry 179 (class 1259 OID 20776099)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id uuid NOT NULL,
    name character varying(150) DEFAULT NULL::character varying,
    description text,
    builtin boolean
);


--
-- TOC entry 177 (class 1259 OID 20776083)
-- Name: role2user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role2user (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 20776476)
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
-- TOC entry 206 (class 1259 OID 20776414)
-- Name: sedeznired; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sedeznired (
    id uuid NOT NULL,
    kapaciteta integer,
    ime character varying(255) DEFAULT NULL::character varying
);


--
-- TOC entry 200 (class 1259 OID 20776360)
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
-- TOC entry 173 (class 1259 OID 20776048)
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
-- TOC entry 172 (class 1259 OID 20776040)
-- Name: stevilcenjekonfig; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjekonfig (
    id uuid NOT NULL,
    stevilcenje_id uuid,
    dok character varying(100) DEFAULT NULL::character varying
);


--
-- TOC entry 171 (class 1259 OID 20776035)
-- Name: stevilcenjestanje; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE stevilcenjestanje (
    id uuid NOT NULL,
    objid uuid NOT NULL,
    leto integer NOT NULL,
    stevilka integer
);


--
-- TOC entry 220 (class 1259 OID 20776540)
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
-- TOC entry 184 (class 1259 OID 20776161)
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
-- TOC entry 201 (class 1259 OID 20776370)
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
-- TOC entry 223 (class 1259 OID 20776581)
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
-- TOC entry 236 (class 1259 OID 20776827)
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
-- TOC entry 189 (class 1259 OID 20776223)
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
-- TOC entry 176 (class 1259 OID 20776070)
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
-- TOC entry 227 (class 1259 OID 20776631)
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
-- TOC entry 196 (class 1259 OID 20776313)
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
-- TOC entry 210 (class 1259 OID 20776441)
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
-- TOC entry 221 (class 1259 OID 20776554)
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
-- TOC entry 239 (class 1259 OID 20776874)
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
-- TOC entry 238 (class 1259 OID 20776846)
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
-- TOC entry 240 (class 1259 OID 20776886)
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
-- TOC entry 217 (class 1259 OID 20776513)
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
-- TOC entry 198 (class 1259 OID 20776349)
-- Name: zasedenost; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zasedenost (
    id uuid NOT NULL,
    oseba_id uuid
);


--
-- TOC entry 226 (class 1259 OID 20776621)
-- Name: zvrstsurs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstsurs (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 216 (class 1259 OID 20776503)
-- Name: zvrstuprizoritve; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE zvrstuprizoritve (
    id uuid NOT NULL,
    sifra character varying(255) NOT NULL,
    naziv character varying(255) DEFAULT NULL::character varying,
    opis text
);


--
-- TOC entry 2201 (class 2604 OID 20776064)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije ALTER COLUMN id SET DEFAULT nextval('revizije_id_seq'::regclass);


--
-- TOC entry 2975 (class 0 OID 20776116)
-- Dependencies: 181
-- Data for Name: abonma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY abonma (id, stpredstav, stkuponov, ime, opis, kapaciteta) FROM stdin;
\.


--
-- TOC entry 3023 (class 0 OID 20776673)
-- Dependencies: 229
-- Data for Name: alternacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY alternacija (id, funkcija_id, zaposlitev_id, oseba_id, pogodba_id, sifra, zaposlen, zacetek, konec, opomba, sort, privzeti, aktivna, imapogodbo, pomembna) FROM stdin;
000c0000-5605-557d-43d5-bd601d1969f5	000d0000-5605-557d-98f4-0a8ab1309916	\N	00090000-5605-557d-eeac-c7017e2128e1	000b0000-5605-557d-28cd-13c72e5b97a4	0001	f	\N	\N	\N	3	t	\N	t	t
000c0000-5605-557d-053e-b8539787bad1	000d0000-5605-557d-b0f8-50bfd7650306	00100000-5605-557d-26cb-580422515a9e	00090000-5605-557d-ecd3-dfcd84d612d6	\N	0002	t	2016-01-01	\N	\N	8	t	\N	f	f
000c0000-5605-557d-4cc6-e7d9467dc373	000d0000-5605-557d-7690-dd34c789036f	00100000-5605-557d-85e1-e93b2d310590	00090000-5605-557d-e8fe-8146fd38b9a6	\N	0003	t	\N	2015-09-25	\N	2	t	\N	f	f
000c0000-5605-557d-8323-1c633abc83a7	000d0000-5605-557d-12c2-715b4b8a1f94	\N	00090000-5605-557d-855b-ed75d2a3040a	\N	0004	f	2016-01-01	2016-01-01	\N	26	t	\N	f	f
000c0000-5605-557d-62aa-2af64108e9ab	000d0000-5605-557d-078f-85adc31cdf97	\N	00090000-5605-557d-8ed7-800971e0633c	\N	0005	f	2016-01-01	2016-01-01	\N	7	t	\N	f	f
000c0000-5605-557d-e2c9-1a9f3c489052	000d0000-5605-557d-f41d-e2f33033da8d	\N	00090000-5605-557d-083f-5159ef74aa4f	000b0000-5605-557d-8c6e-0e74891c286a	0006	f	2016-01-01	2016-01-01	\N	1	t	\N	t	t
000c0000-5605-557d-91ee-8e6352b1ba82	000d0000-5605-557d-3a08-2a07cd8aa52d	00100000-5605-557d-de2a-ab1617db77ca	00090000-5605-557d-68e6-9ade915e83cc	\N	0007	t	2016-01-01	2016-01-01	\N	14	t	\N	f	t
000c0000-5605-557d-8aa1-9a39bc4f5e9d	000d0000-5605-557d-eb69-65c52e0204c2	\N	00090000-5605-557d-d49a-0a7abee32b60	000b0000-5605-557d-c026-31f72a26b6a6	0008	f	2016-01-01	2016-01-01	\N	12	t	\N	t	t
000c0000-5605-557d-cb6d-c139e9097a10	000d0000-5605-557d-3a08-2a07cd8aa52d	00100000-5605-557d-793a-108aa7ffe67e	00090000-5605-557d-d78e-de0fb521b367	\N	0009	t	2017-01-01	2017-01-01	\N	15	t	\N	f	t
000c0000-5605-557d-cb18-d08b0048eb48	000d0000-5605-557d-3a08-2a07cd8aa52d	00100000-5605-557d-46bd-bcaf8a48f51f	00090000-5605-557d-a387-f54c7f88fb29	\N	0010	t	\N	2015-09-25	\N	16	f	\N	f	t
000c0000-5605-557d-9b18-3adf7bafb153	000d0000-5605-557d-3a08-2a07cd8aa52d	00100000-5605-557d-ea61-bc0b87e9083d	00090000-5605-557d-1dbe-427cd043f2ab	\N	0011	t	2017-01-01	\N	\N	17	f	\N	f	t
000c0000-5605-557d-1f9a-148897b6d303	000d0000-5605-557d-1632-3bb44fd17704	\N	00090000-5605-557d-ecd3-dfcd84d612d6	000b0000-5605-557d-f247-5d6b5511492d	0012	f	\N	\N	\N	2	t	\N	t	t
\.


--
-- TOC entry 3022 (class 0 OID 20776656)
-- Dependencies: 228
-- Data for Name: arhivalija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY arhivalija (id, dogodek_id, uprizoritev_id, oznakadatuma, datum, fizicnaoblika, izvordigitalizata, povzetek, opombe, lokacijaoriginala, objavljeno, naslov, avtorstvo) FROM stdin;
\.


--
-- TOC entry 3013 (class 0 OID 20776533)
-- Dependencies: 219
-- Data for Name: avtorbesedila; Type: TABLE DATA; Schema: public; Owner: -
--

COPY avtorbesedila (id, besedilo_id, oseba_id, tipavtorja, zaporedna, alivnaslovu) FROM stdin;
003d0000-5605-557d-f0dd-54b1222a6f09	00160000-5605-557d-304c-ff51bc0145ff	00090000-5605-557d-52d3-7fa022b5e431	aizv	10	t
003d0000-5605-557d-42e2-a21879a3c9db	00160000-5605-557d-304c-ff51bc0145ff	00090000-5605-557d-76d2-5d8e17a6649c	apri	14	t
003d0000-5605-557d-25a2-4a1239f94a3c	00160000-5605-557d-02b6-c773caeafe9f	00090000-5605-557d-de6f-101661f302f7	aizv	11	t
003d0000-5605-557d-f915-f93864ae4d01	00160000-5605-557d-8ba1-fd46e8647d19	00090000-5605-557d-a14c-8c2b5d3592fb	aizv	12	t
003d0000-5605-557d-4f41-7de1a71109bf	00160000-5605-557d-304c-ff51bc0145ff	00090000-5605-557d-1fbd-db4b6ec879c3	apri	18	f
\.


--
-- TOC entry 3016 (class 0 OID 20776563)
-- Dependencies: 222
-- Data for Name: besedilo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY besedilo (id, stevilka, naslov, podnaslov, jezik, naslovizvirnika, podnaslovizvirnika, internacionalninaslov, datumprejema, moskevloge, zenskevloge, povzetekvsebine, letoizida, krajizida, zaloznik, avtor) FROM stdin;
00160000-5605-557d-304c-ff51bc0145ff	0001	Sen kresne noči		slovenščina	A Midsummer Night's Dream	\N	\N	2015-04-26	5	5	Nastopajo Titanija, Hipolita, Oberon, ...	\N	\N	\N	\N
00160000-5605-557d-02b6-c773caeafe9f	0002	Bratje Karamazovi		slovenščina	Bratja Karamazjovji	\N	\N	2015-12-04	4	1	Svetovna uspešnica	\N	\N	\N	\N
00160000-5605-557d-8ba1-fd46e8647d19	0003	Smoletov Vrt		slovenščina		\N	\N	2015-05-26	2	8		\N	\N	\N	\N
\.


--
-- TOC entry 3037 (class 0 OID 20776913)
-- Dependencies: 243
-- Data for Name: datoteka; Type: TABLE DATA; Schema: public; Owner: -
--

COPY datoteka (id, owner_id, filename, transfers, size, format, hash, createdat, uploadedat, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2991 (class 0 OID 20776323)
-- Dependencies: 197
-- Data for Name: dogodek; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodek (id, predstava_id, zasedenost_id, vaja_id, gostovanje_id, dogodek_splosni_id, prostor_id, sezona_id, planiranzacetek, allday, zacetek, konec, status, razred, termin, title) FROM stdin;
00180000-5605-557d-ea3b-0f7945069879	\N	\N	00200000-5605-557d-d28c-665eacbbd95d	\N	\N	\N	\N	2015-06-26 10:00:00	f	2015-06-26 10:00:00	2015-06-26 12:00:00	200s	200s		dogodek 1
00180000-5605-557d-18d2-3d6a70af8031	\N	\N	00200000-5605-557d-cba0-20dc70755b71	\N	\N	\N	\N	2015-06-27 10:00:00	f	2015-06-27 10:00:00	2015-06-27 12:00:00	300s	200s		dogodek 2
00180000-5605-557d-af80-0f02fc262648	\N	\N	00200000-5605-557d-33ea-a4000e1b3458	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	400s	200s		dogodek 3
00180000-5605-557d-75f3-07e572fa680b	\N	\N	00200000-5605-557d-14da-7d19098576ff	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	100s	200s		dogodek 4
00180000-5605-557d-4d63-b14e933ba96f	\N	\N	00200000-5605-557d-2fb2-b80d40300896	\N	\N	\N	\N	2015-08-01 20:00:00	f	2015-08-01 20:00:00	2015-08-01 23:00:00	500s	200s		dogodek 5
\.


--
-- TOC entry 2993 (class 0 OID 20776355)
-- Dependencies: 199
-- Data for Name: dogodeksplosni; Type: TABLE DATA; Schema: public; Owner: -
--

COPY dogodeksplosni (id) FROM stdin;
\.


--
-- TOC entry 3031 (class 0 OID 20776839)
-- Dependencies: 237
-- Data for Name: drugivir; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drugivir (id, znesek, opis, mednarodni, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 2984 (class 0 OID 20776237)
-- Dependencies: 190
-- Data for Name: drza; Type: TABLE DATA; Schema: public; Owner: -
--

COPY drza (id, sifra, sifradolg, isonum, isonaziv, naziv, opomba) FROM stdin;
00040000-5605-557b-ab8c-3a6325256bb8	AF	AFG	004	Afghanistan 	Afganistan	\N
00040000-5605-557b-8653-587ef574d1b5	AX	ALA	248	Ålland Islands 	Alandski otoki	Otočje v Baltiku.
00040000-5605-557b-d798-a183600e5a8d	AL	ALB	008	Albania 	Albanija	\N
00040000-5605-557b-ade7-365948c7e38f	DZ	DZA	012	Algeria 	Alžirija	Koda po kabilskem nazivu: Dzayer.
00040000-5605-557b-7bbb-555d1008c7af	AS	ASM	016	American Samoa 	Ameriška Samoa	Zunanji teritorij ZDA v južnem Tihem oceanu.
00040000-5605-557b-225d-20fd3feb8f7f	AD	AND	020	Andorra 	Andora	\N
00040000-5605-557b-adac-56394165ae95	AO	AGO	024	Angola 	Angola	\N
00040000-5605-557b-cde3-35dec389bfc5	AI	AIA	660	Anguilla 	Angvila	Čezmorska skupnost Velike Britanije, predhodno je AI predstavljal francoski: Afar and Issas.
00040000-5605-557b-2e00-fb7166ae702d	AQ	ATA	010	Antarctica 	Antarktika	Koda pa francoskem nazivu: Antarctique.
00040000-5605-557b-0f87-36b19948e6c1	AG	ATG	028	Antigua and Barbuda 	Antigva in Barbuda	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-557b-b0f5-950f3f1cd069	AR	ARG	032	Argentina 	Argenitna	\N
00040000-5605-557b-3a69-236bc3f11bdb	AM	ARM	051	Armenia 	Armenija	\N
00040000-5605-557b-cd70-753e741a9c39	AW	ABW	533	Aruba 	Aruba	Otok v Karibskem morju, del kraljevine Nizozemske.
00040000-5605-557b-dfec-4b32d47e051c	AU	AUS	036	Australia 	Avstralija	\N
00040000-5605-557b-9ae8-ae56c8194545	AT	AUT	040	Austria 	Avstrija	\N
00040000-5605-557b-61bb-643de23ca120	AZ	AZE	031	Azerbaijan 	Azerbajdžan	\N
00040000-5605-557b-7109-1aa2c89837bc	BS	BHS	044	Bahamas 	Bahami	\N
00040000-5605-557b-461c-ed1a36624612	BH	BHR	048	Bahrain 	Bahrajn	\N
00040000-5605-557b-010e-d5cef901d6b3	BD	BGD	050	Bangladesh 	Bangladeš	\N
00040000-5605-557b-4ccb-724461390df1	BB	BRB	052	Barbados 	Barbados	\N
00040000-5605-557b-3256-73c8202395b3	BY	BLR	112	Belarus 	Belorusija	Bivši ISO naziv države: Byelorussian SSR.
00040000-5605-557b-e73e-7edf6d5bb0bf	BE	BEL	056	Belgium 	Belgija	\N
00040000-5605-557b-b232-b282cf8d30f3	BZ	BLZ	084	Belize 	Belize	\N
00040000-5605-557b-6755-0c5a1c8aa0cf	BJ	BEN	204	Benin 	Benin	Bivši ISO naziv države: Dahomey (DY).
00040000-5605-557b-4a06-b82928248c39	BM	BMU	060	Bermuda 	Bermudi	\N
00040000-5605-557b-dbf0-0b873eb31015	BT	BTN	064	Bhutan 	Butan	\N
00040000-5605-557b-37de-52189e9018bd	BO	BOL	068	Bolivia, Plurinational State of 	Bolivija	\N
00040000-5605-557b-092c-b6c3b4779a86	BQ	BES	535	Bonaire, Sint Eustatius and Saba 	Otočje Bonaire, Sv. Eustatij in Saba	Otočje v karibih pod nizozemsko upravo (the BES Islands). Bivši ISO naziv države: Bonaire, Saint Eustatius and Saba. BQ je prej predstavljal: British Antarctic Territory.
00040000-5605-557b-e425-000e402a367a	BA	BIH	070	Bosnia and Herzegovina 	Bosna in Hercegovina	\N
00040000-5605-557b-1818-77676a04ab6c	BW	BWA	072	Botswana 	Bocvana	\N
00040000-5605-557b-cad4-fa972bb23867	BV	BVT	074	Bouvet Island 	Bouvetov otok	Norveški otok v južnem Atlantskem oceanu.
00040000-5605-557b-547e-d49e53ccd679	BR	BRA	076	Brazil 	Brazilija	\N
00040000-5605-557b-7760-0d9ae6bad98d	IO	IOT	086	British Indian Ocean Territory 	Britansko ozemlje v Indijskem oceanu	\N
00040000-5605-557b-5656-59e9523c8d7a	BN	BRN	096	Brunei Darussalam 	Brunej	ISO naziv države po nazivu v ZN. Otoška država na otok Borneo v JV Aziji.
00040000-5605-557b-56fa-fcd077f09aaf	BG	BGR	100	Bulgaria 	Bolgarija	\N
00040000-5605-557b-2a5f-351e5b42b8ad	BF	BFA	854	Burkina Faso 	Burkina Faso	Bivši ISO naziv države: Upper Volta (HV).
00040000-5605-557b-5b99-deef92a767fe	BI	BDI	108	Burundi 	Burundi 	\N
00040000-5605-557b-e633-b39d9ddaaf27	KH	KHM	116	Cambodia 	Kambodža	Koda po bivšem nazivu: Khmer Republic. Bivši ISO naziv države: Kampuchea.
00040000-5605-557b-17f0-9f26346203ed	CM	CMR	120	Cameroon 	Kamerun	\N
00040000-5605-557b-bba5-ce71eb6a0ac4	CA	CAN	124	Canada 	Kanada	\N
00040000-5605-557b-59ae-896100f9e92e	CV	CPV	132	Cape Verde 	Kapverdski otoki (Zelenortski otoki)	Otočje v Atlantskem oceanu ob Afriki.
00040000-5605-557b-b68a-b70e8c362038	KY	CYM	136	Cayman Islands 	Kajmanski otoki	\N
00040000-5605-557b-1be7-189c8990d206	CF	CAF	140	Central African Republic 	Srednjeafriška republika	Prej znana kot francoska kolonija Ubangi-Shari.
00040000-5605-557b-4c1b-341f0421ea1d	TD	TCD	148	Chad 	Čad	Koda po francoskem nazivu: Tchad.
00040000-5605-557b-60c4-743581fa6e33	CL	CHL	152	Chile 	Čile	\N
00040000-5605-557b-a814-458ff54c288b	CN	CHN	156	China 	Kitajska	\N
00040000-5605-557b-ec72-ae8af31068ce	CX	CXR	162	Christmas Island 	Božični otok	Avstralsko ozemlje v Indijskem oceanu.
00040000-5605-557b-def9-4b2cecf3d8cd	CC	CCK	166	Cocos (Keeling) Islands 	Kokosovi in Keelingovi otoki	Otočje pod upravo Avstralije v Indijskem oceanu.
00040000-5605-557b-c84e-9cce92e89ab9	CO	COL	170	Colombia 	Kolumbija	\N
00040000-5605-557b-335c-83b1b815d309	KM	COM	174	Comoros 	Komori	Otočje v Indijskem oceanu. Koda po nazivu v komorščini: Komori.
00040000-5605-557b-b308-b1dbe324592c	CG	COG	178	Congo 	Kongo	Srednji Kongo (celinska država brez morja).
00040000-5605-557b-6946-540b99809e59	CD	COD	180	Congo, the Democratic Republic of the 	Demokratična republika Kongo	Bivše ime: Zaire (ZR), obmorska država.
00040000-5605-557b-659a-1ced93dcb4a0	CK	COK	184	Cook Islands 	Cookovi otoki	\N
00040000-5605-557b-ee8f-4498ac825dc6	CR	CRI	188	Costa Rica 	Kostarika	\N
00040000-5605-557b-2257-727cfff82087	CI	CIV	384	Côte d'Ivoire 	Slonokoščena obala	\N
00040000-5605-557b-f7a3-2ec84c8fa95b	HR	HRV	191	Croatia 	Hrvaška	Koda po nazivu v hrvaščini: Hrvatska.
00040000-5605-557b-e6ba-b7b42bfaa741	CU	CUB	192	Cuba 	Kuba	\N
00040000-5605-557b-f2e9-078f1f63ab70	CW	CUW	531	Curaçao 	Kurasao	Spada v čezmorsko ozemlje Nizozemske, Nizozemski Antili.
00040000-5605-557b-4e3f-b4f258fac3d4	CY	CYP	196	Cyprus 	Ciper	\N
00040000-5605-557b-7006-e3a1a212687e	CZ	CZE	203	Czech Republic 	Češka	\N
00040000-5605-557b-767b-8e0f059a86d7	DK	DNK	208	Denmark 	Danska	\N
00040000-5605-557b-a057-05b42024f656	DJ	DJI	262	Djibouti 	Džibuti	Staro ime: French Afar and Issas (AI).
00040000-5605-557b-9137-8749f8a27ee7	DM	DMA	212	Dominica 	Dominika	Otoška država v malih Antilih v Karibskem morju.
00040000-5605-557b-0a46-31f9a9c05421	DO	DOM	214	Dominican Republic 	Dominikanska republika	\N
00040000-5605-557b-5ff1-c96a3e0b4632	EC	ECU	218	Ecuador 	Ekvador	\N
00040000-5605-557b-1098-f100ff9eeaa8	EG	EGY	818	Egypt 	Egipt	\N
00040000-5605-557b-6b4c-792c1c3b2c63	SV	SLV	222	El Salvador 	Salvador	\N
00040000-5605-557b-9259-573dd4f096f0	GQ	GNQ	226	Equatorial Guinea 	Ekvatorialna Gvineja	Koda po francoskem nazivu: Guinée équatoriale.
00040000-5605-557b-4b28-028cd028a829	ER	ERI	232	Eritrea 	Eritreja	\N
00040000-5605-557b-773c-ecf9460e1ff1	EE	EST	233	Estonia 	Estonija	Koda po estonskem nazivu: Eesti.
00040000-5605-557b-08c7-b75156913ba1	ET	ETH	231	Ethiopia 	Etiopija	\N
00040000-5605-557b-1614-fc58adb7367f	FK	FRO	234	Falkland Islands (Malvinas) 	Falkalndski otoki	Čezmorsko otočje velike Britanije.
00040000-5605-557b-0330-17819e6fc455	FO	FLK	238	Faroe Islands 	Ferski otoki	\N
00040000-5605-557b-2590-491ba995ce6f	FJ	FJI	242	Fiji 	Fidži	Otočje v južnem Tihem oceanu.
00040000-5605-557b-f018-4f72b8d70be3	FI	FIN	246	Finland 	Finska	\N
00040000-5605-557b-9c1f-8ab692a5cc26	FR	FRA	250	France 	Francija	\N
00040000-5605-557b-499d-ce314df651e3	GF	GUF	254	French Guiana 	Francoska Gvajana	Koda po francoskem nazivu: Guyane française.
00040000-5605-557b-ca84-3f0bd7ac6e9e	NL	NLD	528	Netherlands 	Nizozemska	\N
00040000-5605-557b-421f-3b743d2411c0	PF	PYF	258	French Polynesia 	Francoska Polinezija	Čezmorsko otočje Francije v južnem Tihem oceanu. Koda po francoskem nazivu: Polynésie française.
00040000-5605-557b-ae58-695a78959488	TF	ATF	260	French Southern Territories 	Francoska južna ozemlja	Predstavlja francoske vulkanske otoke JV od Afrike v Indijskem oceanu in del antarktike, ki Franciji niso mednarodno priznani. Koda po francokem nazivu: Terres australes françaises.
00040000-5605-557b-f676-cc90af595668	GA	GAB	266	Gabon 	Gabon	\N
00040000-5605-557b-df25-e189ac013005	GM	GMB	270	Gambia 	Gambija	\N
00040000-5605-557b-7351-088dae1a663a	GE	GEO	268	Georgia 	Gruzija	Koda GE je prej predstavljala Gilbertove in Ellisijine otoke.
00040000-5605-557b-4b99-24bf54892bb2	DE	DEU	276	Germany 	Nemčija	Koda po nemškem nazivu: Deutschland. Koda pred 1990 v uporabi za Zahodno Nemčijo.
00040000-5605-557b-1f85-fd430ae3d165	GH	GHA	288	Ghana 	Gana	\N
00040000-5605-557b-4f10-e40786432002	GI	GIB	292	Gibraltar 	Gibraltar	\N
00040000-5605-557b-eb7a-34c7b8fb4a24	GR	GRC	300	Greece 	Grčija	\N
00040000-5605-557b-1dae-d4b258efbcd0	GL	GRL	304	Greenland 	Grenlandija	\N
00040000-5605-557b-9d72-0fbc9f159f7a	GD	GRD	308	Grenada 	Grenada	\N
00040000-5605-557b-7988-1ef5b95339a1	GP	GLP	312	Guadeloupe 	Guadeloupe	Čezmorski otok Francije v Karibskem morju.
00040000-5605-557b-ffe7-4483f7e2f455	GU	GUM	316	Guam 	Guam	Zunanji teritorij ZDA v Tihem oceanu (tudi Guahan).
00040000-5605-557b-be7f-82367a623e76	GT	GTM	320	Guatemala 	Gvatemala	\N
00040000-5605-557b-39ee-99f81c0ab95f	GG	GGY	831	Guernsey 	Otok Guernsey	Bailwick of Goursey je Britanski otok ob Franciji.
00040000-5605-557b-5a65-d35076f01a8a	GN	GIN	324	Guinea 	Gvineja	\N
00040000-5605-557b-065f-8aa9cf5344b6	GW	GNB	624	Guinea-Bissau 	Gvineja-Bissau	\N
00040000-5605-557b-6c4c-ab86b7b34342	GY	GUY	328	Guyana 	Gvajana	\N
00040000-5605-557b-b3a2-f0c324169b68	HT	HTI	332	Haiti 	Haiti	\N
00040000-5605-557b-318c-ab3252c3d23c	HM	HMD	334	Heard Island and McDonald Islands 	Otok Heard in otočje McDonald	Nenaseljeno otočje v Indijskem oceanu pod upravo Avstralije.
00040000-5605-557b-a3a4-ee4c76f79105	VA	VAT	336	Holy See (Vatican City State) 	Vatikan	Bivši ISO naziv države: Vatican City State (Vatikanska mestna država).
00040000-5605-557b-156c-23e26bfb8ca2	HN	HND	340	Honduras 	Honduras	\N
00040000-5605-557b-65da-98a12ed7f044	HK	HKG	344	Hong Kong 	Hong Kong	\N
00040000-5605-557b-2e6a-ac155db54df3	HU	HUN	348	Hungary 	Madžarska	\N
00040000-5605-557b-cc66-2f5ba7c9a80e	IS	ISL	352	Iceland 	Islandija	Koda po nazivu v islandščini: Ísland.
00040000-5605-557b-4672-bbb3e629a23f	IN	IND	356	India 	Indija	\N
00040000-5605-557b-55aa-715a7d57bb93	ID	IDN	360	Indonesia 	Indonezija	\N
00040000-5605-557b-b964-98efaa471b53	IR	IRN	364	Iran, Islamic Republic of 	Iran	\N
00040000-5605-557b-97ac-1424212e478f	IQ	IRQ	368	Iraq 	Irak	\N
00040000-5605-557b-c8ad-5334b771d630	IE	IRL	372	Ireland 	Irska	\N
00040000-5605-557b-01df-a5e879df44ac	IM	IMN	833	Isle of Man 	Otok Man	Spada neposredno pod Britansko krono a ni del Velike Britanije, nahaja se med Irsko in Veliko Britanijo.
00040000-5605-557b-aa46-a7a20e530dab	IL	ISR	376	Israel 	Izrael	\N
00040000-5605-557b-3dcb-92fe15633cd6	IT	ITA	380	Italy 	Italija	\N
00040000-5605-557b-ac3f-6197956613ca	JM	JAM	388	Jamaica 	Jamajka	\N
00040000-5605-557b-a7c0-471e63413b7d	JP	JPN	392	Japan 	Japonska	\N
00040000-5605-557b-00d6-4e8a84e8730a	JE	JEY	832	Jersey 	Otok Jersey	Bailwick of Jersey je Britanski otok med Anglijo in Francijo.
00040000-5605-557b-0cb2-524582eef439	JO	JOR	400	Jordan 	Jordanija	\N
00040000-5605-557b-3600-47b121c93d0c	KZ	KAZ	398	Kazakhstan 	Kazahstan	Bivši ISO naziv države: Kazakstan.
00040000-5605-557b-b538-42897443390d	KE	KEN	404	Kenya 	Kenija	\N
00040000-5605-557b-4b0d-ce65c6058cb0	KI	KIR	296	Kiribati 	Kiribati	Razpršeno otočje v Tihem oceanu. Stari naziv: Gilbertovi otoki.
00040000-5605-557b-5f92-bea7e12bb327	KP	PRK	408	Korea, Democratic People's Republic of 	Severna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Severna Koreja).
00040000-5605-557b-6305-7a6fb075b34a	KR	KOR	410	Korea, Republic of 	Južna Koreja	ISO naziv države po uradnem nazivu v ZN (splošno ime: Južna Koreja).
00040000-5605-557b-e8b5-6b2cde14dba5	KW	KWT	414	Kuwait 	Kuvajt	\N
00040000-5605-557b-d65b-c2543a9841d6	KG	KGZ	417	Kyrgyzstan 	Kirgizistan (Kirgizija)	\N
00040000-5605-557b-07a5-7624d29b6b9a	LA	LAO	418	Lao People's Democratic Republic 	Laos	\N
00040000-5605-557b-4157-5e693c67ecad	LV	LVA	428	Latvia 	Latvija	\N
00040000-5605-557b-7fca-0a8b558f9e86	LB	LBN	422	Lebanon 	Libanon	\N
00040000-5605-557b-7b79-e65e7e80b8a8	LS	LSO	426	Lesotho 	Lesoto	\N
00040000-5605-557b-35cb-170f8fb5b300	LR	LBR	430	Liberia 	Liberija	\N
00040000-5605-557b-5ecb-868229723201	LY	LBY	434	Libya 	Libija	Bivši ISO naziv države: Libyan Arab Jamahiriya.
00040000-5605-557b-1522-b28401559486	LI	LIE	438	Liechtenstein 	Lihtenštajn	\N
00040000-5605-557b-110e-88b97d735f35	LT	LTU	440	Lithuania 	Litva	\N
00040000-5605-557b-63e0-8cb75fb6a8f8	LU	LUX	442	Luxembourg 	Luksemburg	\N
00040000-5605-557b-9d42-94d64d115e53	MO	MAC	446	Macao 	Makao	Bivši ISO naziv države: Macau.
00040000-5605-557b-1fe1-da44c06801e1	MK	MKD	807	Macedonia, the former Yugoslav Republic of 	Makedonija	ISO naziv države glede na spor o nazivu države. Uradno domače ime države: Republika Makedonija.
00040000-5605-557b-3de6-397b881f2736	MG	MDG	450	Madagascar 	Madagaskar	\N
00040000-5605-557b-fc52-254aa09d8432	MW	MWI	454	Malawi 	Malavi	\N
00040000-5605-557b-194f-8bb1ae7c8c83	MY	MYS	458	Malaysia 	Malezija	\N
00040000-5605-557b-00bb-d1468baf8bf8	MV	MDV	462	Maldives 	Maldivi	\N
00040000-5605-557b-39d1-1d40bbe28845	ML	MLI	466	Mali 	Mali	\N
00040000-5605-557b-ec2f-7a010c2b673c	MT	MLT	470	Malta 	Malta	\N
00040000-5605-557b-20bb-240c2a529d70	MH	MHL	584	Marshall Islands 	Maršalovi otoki	Majhno otočje v Tihem oceanu.
00040000-5605-557b-8f96-b279e709c46b	MQ	MTQ	474	Martinique 	Martinik	Čezmorski otok Francije v malih Antilih v Karibsekm morju.
00040000-5605-557b-05f2-8df57fb3a8ba	MR	MRT	478	Mauritania 	Mavretanija	\N
00040000-5605-557b-8ef5-94a8e57c7773	MU	MUS	480	Mauritius 	Mauricius (Moris)	Domačini v kreolščini imenujejo otok: Moris.
00040000-5605-557b-5711-43c1980d67db	YT	MYT	175	Mayotte 	Francoska skupnost Mejot	Čezmorska skupnost Francije ob vzhodni obali Afrike.
00040000-5605-557b-39a5-c948475059c4	MX	MEX	484	Mexico 	Mehika	\N
00040000-5605-557b-2f1a-fa5797e8a4db	FM	FSM	583	Micronesia, Federated States of 	Mikronezija	Bivši ISO naziv države: Micronesia. Nahaja se v Tihem oceanu.
00040000-5605-557b-f890-34d6973277ca	MD	MDA	498	Moldova, Republic of 	Moldavija	\N
00040000-5605-557b-ab3f-e9a92d7b6338	MC	MCO	492	Monaco 	Monako	\N
00040000-5605-557b-c13d-fc7bf80a4830	MN	MNG	496	Mongolia 	Mongolija	\N
00040000-5605-557b-002d-f798d2558947	ME	MNE	499	Montenegro 	Črna Gora	\N
00040000-5605-557b-e35d-c4da79cda28a	MS	MSR	500	Montserrat 	Montserat	Otok v Antilih v Karibskem morju odvisen od Velike Britanije.
00040000-5605-557b-ae9f-5a2815585c34	MA	MAR	504	Morocco 	Maroko	\N
00040000-5605-557b-6b46-397a8696ea1d	MZ	MOZ	508	Mozambique 	Mozambik	\N
00040000-5605-557b-f635-4f051b045e65	MM	MMR	104	Myanmar 	Mjanmar	Bivši naziv: Burma (BU).
00040000-5605-557b-654a-9e6dcee1046b	NA	NAM	516	Namibia 	Namibija	\N
00040000-5605-557b-4cb8-363b967c6d6c	NR	NRU	520	Nauru 	Nauru	Otoška država v Južnem Tihem oceanu.
00040000-5605-557b-4899-d2982871eba3	NP	NPL	524	Nepal 	Nepal	\N
00040000-5605-557b-1274-4fb4a7f9fe7c	NC	NCL	540	New Caledonia 	Nova Kaledonija	Čezmorsko otočje Francije v Pacifiku.
00040000-5605-557b-a2c7-8dec4f5305cb	NZ	NZL	554	New Zealand 	Nova Zelandija	\N
00040000-5605-557b-08c0-4149411c8a47	NI	NIC	558	Nicaragua 	Nikaragva	\N
00040000-5605-557b-58c9-2436146cb32d	NE	NER	562	Niger 	Niger 	\N
00040000-5605-557b-9677-a1d8ef5ac748	NG	NGA	566	Nigeria 	Nigerija	\N
00040000-5605-557b-9584-2ecf16923e3a	NU	NIU	570	Niue 	Niu	Otoška država v Južnem Tihem oceanu.
00040000-5605-557b-a05c-04a1007a9fb4	NF	NFK	574	Norfolk Island 	Otok Norflok	Del Avstralije s samoupravo.
00040000-5605-557b-2dda-a126e24481b1	MP	MNP	580	Northern Mariana Islands 	Severni Marianski otoki	Ameriško otočje v severnem Tihem oceanu.
00040000-5605-557b-60fb-3a7e7cede14d	NO	NOR	578	Norway 	Norveška	\N
00040000-5605-557b-4379-d1b2ce55c8bc	OM	OMN	512	Oman 	Oman	\N
00040000-5605-557b-3930-7b76d861b8ff	PK	PAK	586	Pakistan 	Pakistan	\N
00040000-5605-557b-5459-a769b51896ca	PW	PLW	585	Palau 	Palau 	Majhna otoška država v Tihem oceanu.
00040000-5605-557b-f4ff-f0cbed308d9c	PS	PSE	275	Palestinian Territory, Occupied 	Palestina	Sestavljena iz Zahodnega brega in Gaze.
00040000-5605-557b-8056-19e15b5fff9f	PA	PAN	591	Panama 	Panama	\N
00040000-5605-557b-9f80-604ee9ca3e77	PG	PNG	598	Papua New Guinea 	Papua Nova Gvineja	\N
00040000-5605-557b-1f03-aa5eba9efacd	PY	PRY	600	Paraguay 	Paragvaj	\N
00040000-5605-557b-9b20-1b09ea3659d2	PE	PER	604	Peru 	Peru	\N
00040000-5605-557b-0003-e95ac81d564e	PH	PHL	608	Philippines 	Filipini	\N
00040000-5605-557b-e501-1a4efeaa7917	PN	PCN	612	Pitcairn 	Pitcairnovi otoki	Čezmorsko otočje Velike Britanije v Tihem oceanu.
00040000-5605-557b-edb5-526dbc8b2baa	PL	POL	616	Poland 	Poljska	\N
00040000-5605-557b-196b-5c9f7e5d7c4a	PT	PRT	620	Portugal 	Portugalska	\N
00040000-5605-557b-c6ab-f3c944eaeacd	PR	PRI	630	Puerto Rico 	Portoriko	\N
00040000-5605-557b-f8fd-fca7a503c8dd	QA	QAT	634	Qatar 	Katar	\N
00040000-5605-557b-6a68-48f1dd72f93e	RE	REU	638	Réunion 	Francoska skupnost Reunion	Čezmorska otoška skupnost Francije v Indijskem oceanu.
00040000-5605-557b-6447-403f25348f68	RO	ROU	642	Romania 	Romunija	\N
00040000-5605-557b-9ec7-45fbca1695ea	RU	RUS	643	Russian Federation 	Ruska federacija	\N
00040000-5605-557b-1b94-f763e447f424	RW	RWA	646	Rwanda 	Ruanda	\N
00040000-5605-557b-ab6c-9b35e3a696b1	BL	BLM	652	Saint Barthélemy 	Sveti Bartolomej	Čezmosrksa skupnost Francije.
00040000-5605-557b-c533-40269368a9c7	SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha 	Sveta Helena	Čezmorsko ozemlje Sveta Helena Velike Britanije v Atlantskem oceanu. Bivši ISO naziv države: Saint Helena.
00040000-5605-557b-f9bd-2bc574d34d6a	KN	KNA	659	Saint Kitts and Nevis 	Sveti Kits in Nevis	Otoška državica v karibskih Malih Antilih. Bivši ISO naziv države: Saint Kitts-Nevis-Anguilla.
00040000-5605-557b-8d64-160f522a2fa0	LC	LCA	662	Saint Lucia 	Sveta Lucija	Otoška država v južnem Karibskem morju.
00040000-5605-557b-4956-500525ad3387	MF	MAF	663	Saint Martin (French part) 	Otok svetega Martina	Čezmorsko otočje Francije v Karibskem morju. Nizozmski del otoka Sv. Martina ima kodo SX.
00040000-5605-557b-3833-1b59228e2cf6	PM	SPM	666	Saint Pierre and Miquelon 	Sveta Pierre in Miquelon	Čezmorsko otočje Francije ob Kanadi in Grenlandiji.
00040000-5605-557b-9c80-704958c7d921	VC	VCT	670	Saint Vincent and the Grenadines 	Sveti Vincent in Grenadini	Majhna otoška država v Karibskem otočju.
00040000-5605-557b-31b2-10a007cd2afa	WS	WSM	882	Samoa 	Samoa	Koda nastala po bivšem nazivu: Western Samoa (Zahodna Samoa).
00040000-5605-557b-0b17-0ea8e550a2e1	SM	SMR	674	San Marino 	San Marino	\N
00040000-5605-557b-71e7-ce8266446be6	ST	STP	678	Sao Tome and Principe 	Sao Tome in Principe	Majhna otoška država v Gvinejskem zalivu ob Afriki.
00040000-5605-557b-23a4-e073d6dccb6a	SA	SAU	682	Saudi Arabia 	Savdska Arabija	\N
00040000-5605-557b-599e-eca3dffcf260	SN	SEN	686	Senegal 	Senegal	\N
00040000-5605-557b-0f14-80ad45a41192	RS	SRB	688	Serbia 	Srbija	Koda po uradnem nazivu: Republika Srbija.
00040000-5605-557b-d14d-9b2c76113f35	SC	SYC	690	Seychelles 	Sejšeli	\N
00040000-5605-557b-4d23-6d2de98a44ad	SL	SLE	694	Sierra Leone 	Siera Leone	\N
00040000-5605-557b-8faf-8a647fc741c8	SG	SGP	702	Singapore 	Singapur	\N
00040000-5605-557b-cdcc-99a82be308c1	SX	SXM	534	Sint Maarten (Dutch part) 	Otok svetega.Martina (Nizozemska)	Francoski del otoka Sv. Martina ima ISO kodo MF. Nahaja se v Karibskem morju.
00040000-5605-557b-4d11-6ee67cdaa8f1	SK	SVK	703	Slovakia 	Slovaška	SK je prej predstavljal: Sikkim.
00040000-5605-557b-dfe7-3757e8ad5212	SI	SVN	705	Slovenia 	Slovenija	\N
00040000-5605-557b-c92b-ece0c3f38c9a	SB	SLB	090	Solomon Islands 	Solomonovi otoki	Koda izhaja iz starega naziva: British Solomon Islands.
00040000-5605-557b-2434-55210f25e3a0	SO	SOM	706	Somalia 	Somalija	\N
00040000-5605-557b-a197-75dba5a25f2a	ZA	ZAF	710	South Africa 	Južna afrika	Koda iz naziva v nizozemščini: Zuid-Afrika.
00040000-5605-557b-5f8e-44c57ae940b4	GS	SGS	239	South Georgia and the South Sandwich Islands 	Južna Georgia in Južni Sandwichevi otoki	Čezmorsko otočje Velike Britanije na jugu Atlantskega oceana.
00040000-5605-557b-c20e-5ac0bea9e6c4	SS	SSD	728	South Sudan 	Južni Sudan	\N
00040000-5605-557b-aa92-6fb6c23c3814	ES	ESP	724	Spain 	Španija	Koda po nazivu v spanščini: España.
00040000-5605-557b-0c59-c7e55fb2875f	LK	LKA	144	Sri Lanka 	Šri Lanka	\N
00040000-5605-557b-a010-feb8724b1165	SD	SDN	729	Sudan 	Sudan	\N
00040000-5605-557b-9412-30e0cf55454d	SR	SUR	740	Suriname 	Surinam	\N
00040000-5605-557b-1b75-ba74c49988d8	SJ	SJM	744	Svalbard and Jan Mayen 	Svalbard in Jan Majen 	Sestavljata ga dva arktična ozemlja pod suverenostjo Norveške: Svalbardski otoki in otok Jan Mayen.
00040000-5605-557b-9472-1fcd9e067213	SZ	SWZ	748	Swaziland 	Svazi	\N
00040000-5605-557b-982f-7666600e6737	SE	SWE	752	Sweden 	Švedska	\N
00040000-5605-557b-4f6e-61cdc00b3d93	CH	CHE	756	Switzerland 	Švica	Koda je narejena po nazivu v latinščini: Confoederatio Helvetica.
00040000-5605-557b-1557-6b594da9271c	SY	SYR	760	Syrian Arab Republic 	Sirija	\N
00040000-5605-557b-2a6d-3e2f94346323	TW	TWN	158	Taiwan, Province of China 	Tajvan	\N
00040000-5605-557b-acf3-2e235a2cabff	TJ	TJK	762	Tajikistan 	Tadžikistan	\N
00040000-5605-557b-f585-88477884a699	TZ	TZA	834	Tanzania, United Republic of 	Tanzanija	\N
00040000-5605-557b-b6f8-e457532405aa	TH	THA	764	Thailand 	Tajska	\N
00040000-5605-557b-88ae-0f2a048ce24d	TL	TLS	626	Timor-Leste 	Vzhodni Timor	Bivši naziv: East Timor (TP). Majhna otoška država v JV Aziji.
00040000-5605-557b-c767-aafeda60c4f5	TG	TGO	768	Togo 	Togo	\N
00040000-5605-557b-a7c6-89c3304b13e1	TK	TKL	772	Tokelau 	Tokelau	Trije koralni otoki pod upravo Nove Zelandije.
00040000-5605-557b-8def-f71a2624f488	TO	TON	776	Tonga 	Tonga	Majhna otoška država v Tihem oceanu.
00040000-5605-557b-f357-43be37205a5c	TT	TTO	780	Trinidad and Tobago 	Trinidad in Tobago	\N
00040000-5605-557b-e0b2-37caa7f722dd	TN	TUN	788	Tunisia 	Tunizija	\N
00040000-5605-557b-f390-8f9aedd21269	TR	TUR	792	Turkey 	Turčija	\N
00040000-5605-557b-2cca-f04b88228d8a	TM	TKM	795	Turkmenistan 	Turkmenistan	\N
00040000-5605-557b-8e47-dbbbc4b5e273	TC	TCA	796	Turks and Caicos Islands 	Tirški in Kajkoški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-557b-8173-ef9390780d75	TV	TUV	798	Tuvalu 	Tuvalu	Majhna otoška država v Tihem oceanu.
00040000-5605-557b-72e3-2c0fa1b316c9	UG	UGA	800	Uganda 	Uganda	\N
00040000-5605-557b-745d-cfc234dc0d3d	UA	UKR	804	Ukraine 	Ukrajina	Bivši ISO naziv države: Ukrainian SSR. 
00040000-5605-557b-d634-a33b8312fc64	AE	ARE	784	United Arab Emirates 	Združeni Arabski Emirati	\N
00040000-5605-557b-a3cf-3d5f52e13288	GB	GBR	826	United Kingdom 	Velika Britanija	Koda po nazivu: Great Britain (iz uradnega naziva: United Kingdom of Great Britain and Northern Ireland). 
00040000-5605-557b-4c7e-ef3da00fab5d	US	USA	840	United States 	Združene države Amerike	\N
00040000-5605-557b-3e1d-2e2b05e626ff	UM	UMI	581	United States Minor Outlying Islands 	ZDA zunanji otoki	Sestavljeno iz devetih manjših otokov ZDA: Baker Island, Howland Island, Jarvis Island, Johnston Atoll, Kingman Reef, Midway Islands, Navassa Island, Palmyra Atoll, and Wake Island.
00040000-5605-557b-093d-805e3fe11388	UY	URY	858	Uruguay 	Urugvaj	\N
00040000-5605-557b-f2df-b51a662f7101	UZ	UZB	860	Uzbekistan 	Uzbekistan	\N
00040000-5605-557b-a88e-358095eccbe6	VU	VUT	548	Vanuatu 	Republika Vanuatu	Stari naziv: New Hebrides (NH).
00040000-5605-557b-bd13-a30e6970f39e	VE	VEN	862	Venezuela, Bolivarian Republic of 	Venezuela	\N
00040000-5605-557b-c7be-58a7e4c1960a	VN	VNM	704	Viet Nam 	Vietnam	\N
00040000-5605-557b-6b9b-1e9e119fae38	VG	VGB	092	Virgin Islands, British 	Britanski Deviški otoki	Čezmorska skupnost Velike Britanije v Karibskem morju.
00040000-5605-557b-45dd-f0e8299df2c7	VI	VIR	850	Virgin Islands, U.S. 	Ameriški Deviški otoki	\N
00040000-5605-557b-f1b8-9af962442ce1	WF	WLF	876	Wallis and Futuna 	Otočje Valis in Futuna	Čezmorska skupnost Francije v Pacifiku.
00040000-5605-557b-9137-3ab9b1379f4c	EH	ESH	732	Western Sahara 	Zahodna Sahara	Bivši ISO naziv države: Spanish Sahara (koda po španskem nazivu: Sahara español).
00040000-5605-557b-a497-f60ad4629df9	YE	YEM	887	Yemen 	Jemen	Bivši ISO naziv države: Republic of Yemen, koda se je uporabljala za Severni Jemen pred letom 1990.
00040000-5605-557b-de9d-d11c0a37e757	ZM	ZMB	894	Zambia 	Zambija	\N
00040000-5605-557b-7ffa-60d2b40c368e	ZW	ZWE	716	Zimbabwe 	Zimbabve	Naziv se je spremenil iz: Suthern Rhodesia (RH, Južna Rodezija).
\.


--
-- TOC entry 3024 (class 0 OID 20776686)
-- Dependencies: 230
-- Data for Name: enotaprograma; Type: TABLE DATA; Schema: public; Owner: -
--

COPY enotaprograma (id, uprizoritev_id, program_dela_id, gostitelj_id, celotnavrednost, nasdelez, celotnavrednostmat, celotnavrednostgostovsz, zaproseno, lastnasredstva, avtorskihonorarji, avtorskihonorarjisamoz, tantieme, avtorskepravice, materialni, imakoprodukcije, vlozekgostitelja, drugijavni, stzaposlenih, stzaposumet, stzaposdrug, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, obiskdoma, obiskkopr, obiskgost, obiskzamejo, obiskint, obiskkoprint, ponovidoma, ponovikopr, ponovizamejo, ponovigost, ponovikoprint, ponoviint, naziv, kpe, sort, tipprogramskeenote_id, tip, prikoproducentu, strosekodkpred, stroskiostali, krajgostovanja, ustanova, datumgostovanja, transportnistroski, dnevprvzad, drzavagostovanja_id, stpe, zvrst, stpredstav, stokroglihmiz, stpredstavitev, stdelavnic, stdrugidogodki, stprodukcij, caspriprave, casizvedbe, prizorisca, umetvodja, programskotelo, sttujihselektorjev) FROM stdin;
002f0000-5605-557d-ca51-bc7cfbcf604d	000e0000-5605-557d-b1fe-d1b1c8e8fe00	\N	\N	9000.30	9000.30	9000.30	0.00	3600.12	5299.98	4000.40	1000.40	200.20	200.30	4599.40	\N	0.00	100.20	0	2	2	2	2	2	\N	40	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-557b-f7d7-f4e80200d742	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-557d-9a2d-5a28133c890e	000e0000-5605-557d-01df-917745ad4111	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-557b-6aa4-b2afd82ee93e	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
002f0000-5605-557d-43b6-dc4a405b3733	000e0000-5605-557d-6395-26ccbc7d2ed3	\N	\N	4900.20	4900.20	4900.20	0.00	1960.08	2839.92	600.70	100.70	200.20	200.20	3899.10	\N	0.00	100.20	0	3	3	3	3	3	\N	60	0	0	0	0	0	1	0	0	0	0	0		0.00	\N	002b0000-5605-557b-f7d7-f4e80200d742	premiera	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-557d-02e9-3b88a69399f9	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-54.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	54.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Urejanje portala	0.00	10	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
00310000-5605-557d-34ce-7b4c12e3ec70	\N	\N	\N	0.00	0.00	0.00	0.00	0.00	-31.20	0.00	0.00	0.00	0.00	0.00	\N	0.00	31.20	5	0	0	3	0	0	\N	0	0	0	0	0	0	0	0	0	0	0	0	Delavnice otroci	0.00	8	\N	razno	\N	0.00	0.00	\N	\N	\N	\N	\N	\N	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3009 (class 0 OID 20776488)
-- Dependencies: 215
-- Data for Name: funkcija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY funkcija (id, uprizoritev_id, alternacija_id, podrocje, vodjaekipe, naziv, komentar, velikost, pomembna, sort, seplanira, dovoliprekrivanje, maxprekrivanj, tipfunkcije_id) FROM stdin;
000d0000-5605-557d-98f4-0a8ab1309916	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-43d5-bd601d1969f5	igralec	\N	Tezej	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-557b-e314-0b1f3bf6236b
000d0000-5605-557d-b0f8-50bfd7650306	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-053e-b8539787bad1	umetnik	\N	Režija		velika	t	8	t	t	\N	000f0000-5605-557b-2a91-afe670fa56a1
000d0000-5605-557d-7690-dd34c789036f	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-4cc6-e7d9467dc373	inspicient	t	Inšpicient			t	8	t	t	\N	000f0000-5605-557b-c5c1-940d3a05204a
000d0000-5605-557d-12c2-715b4b8a1f94	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-8323-1c633abc83a7	tehnik	t	Tehnični vodja			t	8	t	t	\N	000f0000-5605-557b-05d1-62d5c08b00c9
000d0000-5605-557d-078f-85adc31cdf97	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-62aa-2af64108e9ab	tehnik	\N	Razsvetljava			t	3	t	t	\N	000f0000-5605-557b-05d1-62d5c08b00c9
000d0000-5605-557d-f41d-e2f33033da8d	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-e2c9-1a9f3c489052	igralec	\N	Helena	glavna vloga	velika	t	5	t	t	\N	000f0000-5605-557b-e314-0b1f3bf6236b
000d0000-5605-557d-3a08-2a07cd8aa52d	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-cb6d-c139e9097a10	igralec	\N	Hipolita	glavna vloga	velika	t	6	t	t	\N	000f0000-5605-557b-e314-0b1f3bf6236b
000d0000-5605-557d-eb69-65c52e0204c2	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-8aa1-9a39bc4f5e9d	umetnik	\N	Lektoriranje			t	22	t	t	\N	000f0000-5605-557b-ffa8-7165db669e85
000d0000-5605-557d-1632-3bb44fd17704	000e0000-5605-557d-01df-917745ad4111	000c0000-5605-557d-1f9a-148897b6d303	umetnik	\N	Avtor	Avtor besedila		t	2	t	f	\N	000f0000-5605-557b-6cb4-38d7c006cc7c
\.


--
-- TOC entry 2989 (class 0 OID 20776302)
-- Dependencies: 195
-- Data for Name: gostovanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY gostovanje (id, drzava_id, vrsta, zamejstvo, kraj) FROM stdin;
\.


--
-- TOC entry 2987 (class 0 OID 20776277)
-- Dependencies: 193
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: -
--

COPY job (id, user_id, name, task, status, log, datum, casizvedbe, izveden, data, alert, hidden, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2985 (class 0 OID 20776254)
-- Dependencies: 191
-- Data for Name: kontaktnaoseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kontaktnaoseba (id, popa_id, oseba_id, status, funkcija, opis) FROM stdin;
00260000-5605-557d-3e1b-2fb4cda1872d	00080000-5605-557d-ffa5-dd299ed98236	00090000-5605-557d-a387-f54c7f88fb29	AK		igralka
\.


--
-- TOC entry 2998 (class 0 OID 20776402)
-- Dependencies: 204
-- Data for Name: kupec; Type: TABLE DATA; Schema: public; Owner: -
--

COPY kupec (id, popa_id) FROM stdin;
\.


--
-- TOC entry 3035 (class 0 OID 20776894)
-- Dependencies: 241
-- Data for Name: mapa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa (id, lastnik_id, parent_id, ime, komentar, caskreiranja, casspremembe, javnidostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3036 (class 0 OID 20776906)
-- Dependencies: 242
-- Data for Name: mapa_zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapa_zapis (mapa_id, zapis_id) FROM stdin;
\.


--
-- TOC entry 3038 (class 0 OID 20776928)
-- Dependencies: 244
-- Data for Name: mapaacl; Type: TABLE DATA; Schema: public; Owner: -
--

COPY mapaacl (id, mapa_id, perm_id, dostop, upor, datknj) FROM stdin;
\.


--
-- TOC entry 2964 (class 0 OID 20579799)
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
-- TOC entry 3002 (class 0 OID 20776427)
-- Dependencies: 208
-- Data for Name: nacinplacina; Type: TABLE DATA; Schema: public; Owner: -
--

COPY nacinplacina (id, ime, vrsta) FROM stdin;
\.


--
-- TOC entry 2982 (class 0 OID 20776211)
-- Dependencies: 188
-- Data for Name: option; Type: TABLE DATA; Schema: public; Owner: -
--

COPY option (id, name, type, defaultvalue, peruser, readonly, public, role, description) FROM stdin;
00000000-5605-557b-cd78-2568e0e07507	popa.stakli	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status poslovnega partnerja
00000000-5605-557b-14cf-d70235f2ea63	oseba.spol	array	a:2:{s:1:"M";a:1:{s:5:"label";s:6:"Moški";}s:1:"Z";a:1:{s:5:"label";s:7:"Ženska";}}	f	t	f	\N	Spol osebe
00000000-5605-557b-8e8b-e820af62ac9e	telefonska.vrsta	array	a:3:{s:7:"mobilna";a:1:{s:5:"label";s:7:"Mobilni";}s:6:"domaca";a:1:{s:5:"label";s:6:"Domač";}s:6:"fiksna";a:1:{s:5:"label";s:6:"Fiksni";}}	f	t	f	\N	Vrsta telefonske številke
00000000-5605-557b-3401-0a1f17d843e0	kontaktnaoseba.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktiven";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktiven";}}	f	t	f	\N	Status kontaktne osebe
00000000-5605-557b-71d2-1b02c519c5d9	dogodek.status	array	a:7:{s:4:"100s";a:1:{s:5:"label";s:11:"Dolgoročno";}s:4:"200s";a:1:{s:5:"label";s:9:"Planirano";}s:4:"300s";a:1:{s:5:"label";s:8:"Fiksiran";}s:4:"400s";a:1:{s:5:"label";s:17:"Potrjen - interno";}s:4:"500s";a:1:{s:5:"label";s:15:"Potrjen - javno";}s:4:"600s";a:1:{s:5:"label";s:10:"Zaključen";}s:4:"700s";a:1:{s:5:"label";s:7:"Obdelan";}}	f	t	t	\N	Tabela statusa dogodkov
00000000-5605-557b-3da9-f8a1cc3c074d	dogodek.razred	array	a:5:{s:4:"100s";a:2:{s:5:"label";s:9:"Predstava";s:4:"type";s:9:"predstava";}s:4:"200s";a:2:{s:5:"label";s:4:"Vaja";s:4:"type";s:4:"vaja";}s:4:"300s";a:2:{s:5:"label";s:10:"Gostovanje";s:4:"type";s:10:"gostovanje";}s:4:"400s";a:2:{s:5:"label";s:16:"Splošni dogodek";s:4:"type";s:8:"splošni";}s:4:"500s";a:2:{s:5:"label";s:10:"Zasedenost";s:4:"type";s:10:"zasedenost";}}	f	t	t	\N	Tabela razredov dogodkov, ki jih aplikacija podpira
00000000-5605-557b-897f-7a876779a265	uprizoritev.faza	array	a:6:{s:20:"predprodukcija-ideja";a:1:{s:5:"label";s:16:"Dolgoročni plan";}s:20:"predprodukcija-poziv";a:1:{s:5:"label";s:29:"Predprodukcija, v fazi poziva";}s:30:"predprodukcija-potrjen_program";a:1:{s:5:"label";s:34:"Predprodukcija, program je potrjen";}s:10:"produkcija";a:1:{s:5:"label";s:10:"Produkcija";}s:14:"postprodukcija";a:1:{s:5:"label";s:14:"Postprodukcija";}s:5:"arhiv";a:1:{s:5:"label";s:10:"Arhivirana";}}	f	t	f	\N	Faza uprizoritve
00000000-5605-557b-5c00-1a60b71408b0	funkcija.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-557b-d0fc-de7aa449133f	tipfunkcije.podrocje	array	a:4:{s:7:"igralec";a:1:{s:5:"label";s:7:"Igralec";}s:6:"tehnik";a:1:{s:5:"label";s:6:"Tehnik";}s:7:"umetnik";a:1:{s:5:"label";s:7:"Umetnik";}s:10:"inspicient";a:1:{s:5:"label";s:11:"Inšpicient";}}	f	t	f	\N	Področje funkcije
00000000-5605-557b-7a85-48a6f884f63d	funkcija.velikost	array	a:4:{s:6:"velika";a:1:{s:5:"label";s:23:"Velika vloga / funkcija";}s:7:"srednja";a:1:{s:5:"label";s:24:"Srednja vloga / funkcija";}s:4:"mala";a:1:{s:5:"label";s:21:"Mala vloga / funkcija";}s:7:"stataza";a:1:{s:5:"label";s:8:"Stataža";}}	f	t	f	\N	Velikost funkcije
00000000-5605-557b-e794-07b608dee5e0	zaposlitev.status	array	a:2:{s:1:"A";a:1:{s:5:"label";s:7:"Aktivna";}s:1:"N";a:1:{s:5:"label";s:9:"Neaktivna";}}	f	t	f	\N	Status zaposlitve
00000000-5605-557b-43cb-8bc0d37d0be2	produkcijskahisa.status	array	a:2:{s:2:"AK";a:1:{s:5:"label";s:7:"aktivna";}s:2:"NA";a:1:{s:5:"label";s:9:"neaktivna";}}	f	t	f	\N	Status produkcijske hiše
00000000-5605-557b-5156-c183937c31dc	strosekuprizoritve.tipstroska	array	a:1:{s:10:"materialni";a:1:{s:5:"label";s:19:"Materialni strošek";}}	f	t	f	\N	Tip stroška
00000000-5605-557b-5326-96624040a01a	avtorbesedila.tipavtorja	array	a:4:{s:4:"aizv";a:1:{s:5:"label";s:15:"Avtor izvirnika";}s:4:"prev";a:1:{s:5:"label";s:10:"Prevajalec";}s:4:"apri";a:1:{s:5:"label";s:14:"Avtor priredbe";}s:4:"dram";a:1:{s:5:"label";s:12:"Dramatizator";}}	f	t	f	\N	Tip stroška
00000000-5605-557b-9627-830ed9f80465	fsacl.dostop	array	a:4:{s:1:"X";a:1:{s:5:"label";s:12:"Brez dostopa";}s:1:"R";a:1:{s:5:"label";s:11:"Samo branje";}s:2:"RW";a:1:{s:5:"label";s:17:"Branje in pisanje";}s:3:"RWD";a:1:{s:5:"label";s:26:"Branje pisanje in brisanje";}}	f	t	f	\N	ACL Javni dostop
00000000-5605-557d-6101-3e265b79d8c7	test1.barva.ozadja	array	a:1:{i:0;a:2:{s:3:"key";s:1:"b";s:5:"value";s:4:"bela";}}	t	f	f	\N	barva ozadja
00000000-5605-557d-a6d1-017de437b829	test2.glob	array	a:1:{i:0;a:2:{s:3:"key";s:1:"d";s:5:"value";s:9:"defaultna";}}	f	f	f	\N	test2 le globalna vrednost
00000000-5605-557d-8f0f-a9b647f83ec8	test3.readonly	array	a:1:{i:0;s:15:"privzeta trojka";}	f	t	f	\N	za test- le privzeta vrednost, onemogočeni globalna in user opcija
00000000-5605-557d-721d-ac7b6ce23248	test4	array	a:1:{i:0;s:17:"privzeta štirica";}	t	f	f	\N	za test globalna in user vrednost se lahko kreirata
00000000-5605-557d-dc2e-5d2906f68b8c	test5.notperUser	array	a:1:{i:0;s:17:"privzeta štirica";}	f	f	f	\N	za test - user opcija onemogočena
00000000-5605-557e-1ca6-735dc1cd5c67	application.tenant.maticnopodjetje	string	s:4:"1001";	f	t	f		Šifra matičnega podjetja v Popa in ProdukcijskaHisa
\.


--
-- TOC entry 2976 (class 0 OID 20776125)
-- Dependencies: 182
-- Data for Name: optionvalue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY optionvalue (id, option_id, user_id, value, global) FROM stdin;
00000000-5605-557d-d57e-5a62342ba51e	00000000-5605-557d-6101-3e265b79d8c7	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"m";s:5:"value";s:5:"modra";}}	t
00000000-5605-557d-eb99-9a8a98d31c28	00000000-5605-557d-6101-3e265b79d8c7	00010000-5605-557b-9c87-20bddcc96806	a:1:{i:0;a:2:{s:3:"key";s:1:"r";s:5:"value";s:6:"rumena";}}	f
00000000-5605-557d-43a1-6ced2ff29d68	00000000-5605-557d-a6d1-017de437b829	\N	a:1:{i:0;a:2:{s:3:"key";s:1:"g";s:5:"value";s:8:"globalna";}}	t
\.


--
-- TOC entry 2977 (class 0 OID 20776136)
-- Dependencies: 183
-- Data for Name: oseba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY oseba (id, user_id, naslov_id, sifra, naziv, ime, priimek, funkcija, srednjeime, polnoime, psevdonim, email, datumrojstva, emso, davcna, spol, opombe, drzavljanstvo, drzavarojstva, krajrojstva) FROM stdin;
00090000-5605-557d-eeac-c7017e2128e1	\N	\N	0001	g.	Janez	Novak	a	Peter	Janez Peter Novak	Jani	jani.novak@xxx.xx	1958-01-06	0601958000000	123456789	M	Jani Janez	Slovenija	Slovenija	Ljubljana
00090000-5605-557d-855b-ed75d2a3040a	00010000-5605-557d-8f9d-835222168337	\N	0002	dr.	Anton	Horvat	b		Anton  Horvat	Tona	anton.horvat@xxx.xx	1968-02-12	1202968111111	234567890	M		Slovenija	Slovenija	Maribor
00090000-5605-557d-e8fe-8146fd38b9a6	00010000-5605-557d-77a2-dbf76b67f7d8	\N	0003		Ivan	Kovačič	c		Ivan  Kovačič	Ivo	ivan.kovacic@xxx.xx	1975-03-26	2603976222222	345678901	M		Slovenija	Slovenija	Celje
00090000-5605-557d-d78e-de0fb521b367	00010000-5605-557d-a6b8-4dc91fbd76ef	\N	0004	prof.	Jožef	Krajnc	d		Jožef  Krajnc	Joža	jozef.krajnc@xxx.xx	1971-04-30	3004971333333	456789012	M		Slovenija	Slovenija	Kranj
00090000-5605-557d-7c49-1a292a056d46	\N	\N	0005		Marko	Zupančič	e		Marko  Zupančič		marko.zupancic@xxx.xx	1984-05-07	0705984444444	567890123	M		Slovenija	Slovenija	Koper
00090000-5605-557d-083f-5159ef74aa4f	\N	\N	0006	ga.	Marija	Kovač	f		Marija  Kovač		marija.kovac@xxx.xx	1962-06-19	1906962444444	678901234	Z		Slovenija	Slovenija	Murska Sobota
00090000-5605-557d-1dbe-427cd043f2ab	\N	\N	0007	ga.	Ana	Potočnik	g		Ana  Potočnik		ana.potocnik@xxx.xx	1975-07-24	2407975555555	789012345	Z		Slovenija	Slovenija	Novo Mesto
00090000-5605-557d-68e6-9ade915e83cc	\N	\N	0008	ga.	Maja	Mlakar	h		Maja  Mlakar		maja.mlakar@xxx.xx	1986-08-02	0208986666666	890123456	Z		Slovenija	Slovenija	Nova Gorica
00090000-5605-557d-a387-f54c7f88fb29	00010000-5605-557d-9efc-29178488af88	\N	0009		Irena	Kos	i		Irena  Kos		irena.kos@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Ptuj
00090000-5605-557d-ecd3-dfcd84d612d6	\N	\N	0010		Mojca	Vidmar	J		Mojca  Vidmar		mojca.vidmar@xxx.xx	1967-09-14	1409967777777	901234567	Z		Slovenija	Slovenija	Idrija
00090000-5605-557d-865a-1c46aec90294	\N	\N	0011		xx	write protected12345	a		xx  write protected12345		xx@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-557d-8ed7-800971e0633c	\N	\N	0012		Luka	Golob	luč	a	Luka a Golob		luka.golob@xxx.xx	\N	\N	\N	M		\N	\N	\N
00090000-5605-557d-d49a-0a7abee32b60	00010000-5605-557d-bd72-d17889c575c0	\N	0013		Tatjana	Božič	tajnica	a	Tatjana a Božič		tatjana.bozic@xxx.xx	\N	\N	\N	Z		\N	\N	\N
00090000-5605-557d-52d3-7fa022b5e431	\N	\N	0014		William	Shakespeare	avtor		William  Shakespeare		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-557d-76d2-5d8e17a6649c	\N	\N	0015		Nebojša	Kavader	avtor		Nebojša  Kavader		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-557d-de6f-101661f302f7	\N	\N	0016		Fjodor	Dostojevski	avtor	Mihajlovič	Fjodor Mihajlovič Dostojevski		\N	\N	\N	\N	M		\N	\N	\N
00090000-5605-557d-a14c-8c2b5d3592fb	\N	\N	0017		Berta 	Hočevar	avtorica		Berta   Hočevar		\N	\N	\N	\N	Z		\N	\N	\N
00090000-5605-557d-1fbd-db4b6ec879c3	\N	\N	0018		Katarina	Podbevšek	lektorica		Katarina  Podbevšek		\N	\N	\N	\N	Z		\N	\N	\N
\.


--
-- TOC entry 2972 (class 0 OID 20776090)
-- Dependencies: 178
-- Data for Name: permission; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission (id, name, description, builtin) FROM stdin;
00030000-5605-557b-8861-5b31b3b33497	Aaa-read	Aaa (User,Role,Permission) - branje	f
00030000-5605-557b-4955-3f69ee0b1b7e	Aaa-write	Aaa (User,Role,Permission)- spreminjanje	f
00030000-5605-557b-5b66-d9157e00b478	TerminStoritve-vse	TerminStoritve - spreminjanje vseh zapisov	f
00030000-5605-557b-9626-1e60ff246334	Dogodek-readVse	Dogodek - branje vseh, ne glede na status dogodka	f
00030000-5605-557b-f6da-92e005ae5ab2	Oseba-vse	Oseba - vse - za testiranje assert	f
00030000-5605-557b-3874-7dcf874014fa	ProgramDela-lock	ProgramDela - zaklepanje	f
00030000-5605-557b-63f8-9eee751596e5	ProgramDela-unlock	ProgramDela - odklepanje	f
00030000-5605-557b-4f5b-758363b7a687	Abonma-read	Abonma - branje	f
00030000-5605-557b-956b-3f288edfcc8c	Abonma-write	Abonma - spreminjanje	f
00030000-5605-557b-8d30-cf3035d0c64b	Alternacija-read	Alternacija - branje	f
00030000-5605-557b-ccca-8ba1671bd1a3	Alternacija-write	Alternacija - spreminjanje	f
00030000-5605-557b-9d56-b56569d09fe4	Arhivalija-read	Arhivalija - branje	f
00030000-5605-557b-30a8-d379b815d5f1	Arhivalija-write	Arhivalija - spreminjanje	f
00030000-5605-557b-ce30-ed112ff9707c	AvtorBesedila-read	AvtorBesedila - branje	f
00030000-5605-557b-f047-dc4b1c555425	AvtorBesedila-write	AvtorBesedila - spreminjanje	f
00030000-5605-557b-c1c7-06d1396d27e2	Besedilo-read	Besedilo - branje	f
00030000-5605-557b-e4a0-08b635502153	Besedilo-write	Besedilo - spreminjanje	f
00030000-5605-557b-201e-3335caecf2d4	DogodekIzven-read	DogodekIzven - branje	f
00030000-5605-557b-1ea0-a125a4337bab	DogodekIzven-write	DogodekIzven - spreminjanje	f
00030000-5605-557b-8990-8117d54e8cdb	Dogodek-read	Dogodek - branje	f
00030000-5605-557b-98a8-c1e199791af4	Dogodek-write	Dogodek - spreminjanje	f
00030000-5605-557b-f55f-fad9dcdb25db	DrugiVir-read	DrugiVir - branje	f
00030000-5605-557b-b46e-b7ac51e2b44e	DrugiVir-write	DrugiVir - spreminjanje	f
00030000-5605-557b-22c5-3109a7ad1db8	Drzava-read	Drzava - branje	f
00030000-5605-557b-e290-dae785a2ff33	Drzava-write	Drzava - spreminjanje	f
00030000-5605-557b-537f-ca67528aca4b	EnotaPrograma-read	EnotaPrograma - branje	f
00030000-5605-557b-bd05-0e65e3cbef3a	EnotaPrograma-write	EnotaPrograma - spreminjanje	f
00030000-5605-557b-78da-a287c394557b	Funkcija-read	Funkcija - branje	f
00030000-5605-557b-7072-e4150ea637fa	Funkcija-write	Funkcija - spreminjanje	f
00030000-5605-557b-fd75-e3e891231358	Gostovanje-read	Gostovanje - branje	f
00030000-5605-557b-d42b-6f429fe67d9e	Gostovanje-write	Gostovanje - spreminjanje	f
00030000-5605-557b-cb3f-403134b41089	Gostujoca-read	Gostujoca - branje	f
00030000-5605-557b-6ddd-2cf424cabfec	Gostujoca-write	Gostujoca - spreminjanje	f
00030000-5605-557b-7d8d-24d911a848f5	KontaktnaOseba-read	KontaktnaOseba - branje	f
00030000-5605-557b-99f0-0be9b08ede5f	KontaktnaOseba-write	KontaktnaOseba - spreminjanje	f
00030000-5605-557b-3d79-83d4a59885bc	Kupec-read	Kupec - branje	f
00030000-5605-557b-78f2-758c5da7d460	Kupec-write	Kupec - spreminjanje	f
00030000-5605-557b-d52f-321b4c0ac4aa	NacinPlacina-read	NacinPlacina - branje	f
00030000-5605-557b-c64c-b1fffddb017c	NacinPlacina-write	NacinPlacina - spreminjanje	f
00030000-5605-557b-67ff-759ce2407fff	Option-read	Option - branje	f
00030000-5605-557b-3261-e20e934e0d3d	Option-write	Option - spreminjanje	f
00030000-5605-557b-87b6-59e1531ad181	OptionValue-read	OptionValue - branje	f
00030000-5605-557b-bc70-70ee3ad4969e	OptionValue-write	OptionValue - spreminjanje	f
00030000-5605-557b-083d-3f1cc4271b93	Oseba-read	Oseba - branje	f
00030000-5605-557b-2e0b-b6daff8c200f	Oseba-write	Oseba - spreminjanje	f
00030000-5605-557b-6e37-ddfb790a2dc6	PlacilniInstrument-read	PlacilniInstrument - branje	f
00030000-5605-557b-eb77-e8c77ea3f199	PlacilniInstrument-write	PlacilniInstrument - spreminjanje	f
00030000-5605-557b-06ff-a405335eb1e7	PodrocjeSedenja-read	PodrocjeSedenja - branje	f
00030000-5605-557b-df1d-e103fd552537	PodrocjeSedenja-write	PodrocjeSedenja - spreminjanje	f
00030000-5605-557b-5cc6-fa3ba646058f	Pogodba-read	Pogodba - branje	f
00030000-5605-557b-dc7f-03c35c399852	Pogodba-write	Pogodba - spreminjanje	f
00030000-5605-557b-b44c-c78c51f9f472	Popa-read	Popa - branje	f
00030000-5605-557b-4490-730a4e82722c	Popa-write	Popa - spreminjanje	f
00030000-5605-557b-9d33-401998276305	Posta-read	Posta - branje	f
00030000-5605-557b-778f-7c778ee3d720	Posta-write	Posta - spreminjanje	f
00030000-5605-557b-3641-3f19b71a0d3e	PostavkaCDve-read	PostavkaCDve - branje	f
00030000-5605-557b-5d38-8f755d922d92	PostavkaCDve-write	PostavkaCDve - spreminjanje	f
00030000-5605-557b-d977-571cb5419e0e	PostavkaRacuna-read	PostavkaRacuna - branje	f
00030000-5605-557b-96ae-525c5ab7b53b	PostavkaRacuna-write	PostavkaRacuna - spreminjanje	f
00030000-5605-557b-bd71-e15da2441bc8	PostniNaslov-read	PostniNaslov - branje	f
00030000-5605-557b-9635-b851e5e4c234	PostniNaslov-write	PostniNaslov - spreminjanje	f
00030000-5605-557b-6a99-74a590ddc936	Predstava-read	Predstava - branje	f
00030000-5605-557b-0c45-99f26206be5b	Predstava-write	Predstava - spreminjanje	f
00030000-5605-557b-5c4b-86ef8d4df6d9	ProdajaPredstave-read	ProdajaPredstave - branje	f
00030000-5605-557b-ea0a-68658d050acd	ProdajaPredstave-write	ProdajaPredstave - spreminjanje	f
00030000-5605-557b-90a3-c367f47485a0	ProdukcijaDelitev-read	ProdukcijaDelitev - branje	f
00030000-5605-557b-40f2-2ea7aefe9bfa	ProdukcijaDelitev-write	ProdukcijaDelitev - spreminjanje	f
00030000-5605-557b-7726-e728f18f53fb	ProdukcijskaHisa-read	ProdukcijskaHisa - branje	f
00030000-5605-557b-5b85-36036dc91463	ProdukcijskaHisa-write	ProdukcijskaHisa - spreminjanje	f
00030000-5605-557b-768b-776042848187	ProgramDela-read	ProgramDela - branje	f
00030000-5605-557b-fec7-40e4885e032b	ProgramDela-write	ProgramDela - spreminjanje	f
00030000-5605-557b-cbb0-827b9febb313	ProgramFestival-read	ProgramFestival - branje	f
00030000-5605-557b-b4c8-b6d32f32ae27	ProgramFestival-write	ProgramFestival - spreminjanje	f
00030000-5605-557b-54d5-898c7b87e7f2	ProgramGostovanje-read	ProgramGostovanje - branje	f
00030000-5605-557b-6e50-ae3128ab9a8e	ProgramGostovanje-write	ProgramGostovanje - spreminjanje	f
00030000-5605-557b-da1a-35b22a37e5da	ProgramGostujoca-read	ProgramGostujoca - branje	f
00030000-5605-557b-c389-febe91659e76	ProgramGostujoca-write	ProgramGostujoca - spreminjanje	f
00030000-5605-557b-4d5d-a57610b87700	ProgramIzjemni-read	ProgramIzjemni - branje	f
00030000-5605-557b-8b32-409c0aeb1c85	ProgramIzjemni-write	ProgramIzjemni - spreminjanje	f
00030000-5605-557b-bc6b-96d88f306f36	ProgramPonovitevPrejsnjih-read	ProgramPonovitevPrejsnjih - branje	f
00030000-5605-557b-9ccb-798af8db4ea3	ProgramPonovitevPrejsnjih-write	ProgramPonovitevPrejsnjih - spreminjanje	f
00030000-5605-557b-9bcf-36abb8e51164	ProgramPonovitevPremiere-read	ProgramPonovitevPremiere - branje	f
00030000-5605-557b-e85c-488de86dadfd	ProgramPonovitevPremiere-write	ProgramPonovitevPremiere - spreminjanje	f
00030000-5605-557b-07a5-b7a0a03b5011	ProgramPremiera-read	ProgramPremiera - branje	f
00030000-5605-557b-c739-81fd3b4af89e	ProgramPremiera-write	ProgramPremiera - spreminjanje	f
00030000-5605-557b-e252-a93be817c4bc	ProgramRazno-read	ProgramRazno - branje	f
00030000-5605-557b-82c6-2bc5ddde12b2	ProgramRazno-write	ProgramRazno - spreminjanje	f
00030000-5605-557b-87d8-08420df70dfd	ProgramskaEnotaSklopa-read	ProgramskaEnotaSklopa - branje	f
00030000-5605-557b-9c7c-1d7b0a024311	ProgramskaEnotaSklopa-write	ProgramskaEnotaSklopa - spreminjanje	f
00030000-5605-557b-a50b-3ddda7411255	Prostor-read	Prostor - branje	f
00030000-5605-557b-767c-35fd3b04e041	Prostor-write	Prostor - spreminjanje	f
00030000-5605-557b-c030-2efa9c00d01e	Racun-read	Racun - branje	f
00030000-5605-557b-be8e-b9cd292d42b7	Racun-write	Racun - spreminjanje	f
00030000-5605-557b-daa4-af0d04a4fc24	RazpisanSedez-read	RazpisanSedez - branje	f
00030000-5605-557b-9da7-ea7a3adf03f2	RazpisanSedez-write	RazpisanSedez - spreminjanje	f
00030000-5605-557b-fce0-a4fb8e889d53	Rekviziterstvo-read	Rekviziterstvo - branje	f
00030000-5605-557b-0be5-246ce90c8230	Rekviziterstvo-write	Rekviziterstvo - spreminjanje	f
00030000-5605-557b-63b1-f2a4ecb025b8	Rekvizit-read	Rekvizit - branje	f
00030000-5605-557b-fba0-d94410f50276	Rekvizit-write	Rekvizit - spreminjanje	f
00030000-5605-557b-1ee5-a452718b20e0	Revizija-read	Revizija - branje	f
00030000-5605-557b-4ed0-7e44fc0832e0	Revizija-write	Revizija - spreminjanje	f
00030000-5605-557b-5f97-9977621648f3	Rezervacija-read	Rezervacija - branje	f
00030000-5605-557b-6f10-383815db6cc6	Rezervacija-write	Rezervacija - spreminjanje	f
00030000-5605-557b-7fe8-4b8190e9b5ab	SedezniRed-read	SedezniRed - branje	f
00030000-5605-557b-5f29-2069cde5508b	SedezniRed-write	SedezniRed - spreminjanje	f
00030000-5605-557b-8c61-c1d41cba304e	Sedez-read	Sedez - branje	f
00030000-5605-557b-59d2-85f8c4d8dc4c	Sedez-write	Sedez - spreminjanje	f
00030000-5605-557b-ca7f-543ce31a599e	Sezona-read	Sezona - branje	f
00030000-5605-557b-24b2-a92d7b267ec0	Sezona-write	Sezona - spreminjanje	f
00030000-5605-557b-374a-4ce2390f70e5	StevilcenjeKonfig-read	StevilcenjeKonfig - branje	f
00030000-5605-557b-8406-5ee9998970d1	StevilcenjeKonfig-write	StevilcenjeKonfig - spreminjanje	f
00030000-5605-557b-6899-2ce508474df0	Stevilcenje-read	Stevilcenje - branje	f
00030000-5605-557b-7d23-07b225425bfe	Stevilcenje-write	Stevilcenje - spreminjanje	f
00030000-5605-557b-f0b6-3228cd3085ca	StevilcenjeStanje-read	StevilcenjeStanje - branje	f
00030000-5605-557b-683c-deac0281700c	StevilcenjeStanje-write	StevilcenjeStanje - spreminjanje	f
00030000-5605-557b-edbe-c31f8cf7e385	StrosekUprizoritve-read	StrosekUprizoritve - branje	f
00030000-5605-557b-0f9f-3f9d2cb35edf	StrosekUprizoritve-write	StrosekUprizoritve - spreminjanje	f
00030000-5605-557b-7e82-ecbb2e2d1ac4	Telefonska-read	Telefonska - branje	f
00030000-5605-557b-5813-31e8658ad645	Telefonska-write	Telefonska - spreminjanje	f
00030000-5605-557b-0ebd-abf19208a324	TerminStoritve-read	TerminStoritve - branje	f
00030000-5605-557b-6e7c-50e229f6876a	TerminStoritve-write	TerminStoritve - spreminjanje	f
00030000-5605-557b-071d-6d028360adef	TipFunkcije-read	TipFunkcije - branje	f
00030000-5605-557b-e9f2-3ba9b61b69da	TipFunkcije-write	TipFunkcije - spreminjanje	f
00030000-5605-557b-b56d-6f0922c5c29b	TipProgramskeEnote-read	TipProgramskeEnote - branje	f
00030000-5605-557b-1fdf-faa6e29038d4	TipProgramskeEnote-write	TipProgramskeEnote - spreminjanje	f
00030000-5605-557b-46f9-03cf1d86b5b4	Trr-read	Trr - branje	f
00030000-5605-557b-5a56-c182ad7a8b5a	Trr-write	Trr - spreminjanje	f
00030000-5605-557b-998d-145c58160212	Uprizoritev-read	Uprizoritev - branje	f
00030000-5605-557b-db92-d6e273398e1e	Uprizoritev-write	Uprizoritev - spreminjanje	f
00030000-5605-557b-7c13-b606f79ecea2	Vaja-read	Vaja - branje	f
00030000-5605-557b-eab5-e077322b099b	Vaja-write	Vaja - spreminjanje	f
00030000-5605-557b-db84-31d190c45e61	VrstaSedezev-read	VrstaSedezev - branje	f
00030000-5605-557b-9abd-b2bc8d14c560	VrstaSedezev-write	VrstaSedezev - spreminjanje	f
00030000-5605-557b-fe09-54af27c901a4	VrstaStroska-read	VrstaStroska - branje	f
00030000-5605-557b-2371-525d7d305054	VrstaStroska-write	VrstaStroska - spreminjanje	f
00030000-5605-557b-92a2-17d52d328173	Zaposlitev-read	Zaposlitev - branje	f
00030000-5605-557b-0ea4-cda71728965d	Zaposlitev-write	Zaposlitev - spreminjanje	f
00030000-5605-557b-5ca0-64d80013f60e	Zasedenost-read	Zasedenost - branje	f
00030000-5605-557b-1f85-4e64fd5ab397	Zasedenost-write	Zasedenost - spreminjanje	f
00030000-5605-557b-d4d1-fc22d5bfe5b7	ZvrstSurs-read	ZvrstSurs - branje	f
00030000-5605-557b-b597-b8fd61267e15	ZvrstSurs-write	ZvrstSurs - spreminjanje	f
00030000-5605-557b-65a0-cb2f75bff9d8	ZvrstUprizoritve-read	ZvrstUprizoritve - branje	f
00030000-5605-557b-0d7e-5eeb8b05adcc	ZvrstUprizoritve-write	ZvrstUprizoritve - spreminjanje	f
00030000-5605-557b-3424-0fa9e2b0eaaa	Job-read	Branje opravil - samo zase - branje	f
00030000-5605-557b-6453-67939058d833	Job-write	Dodajanje in spreminjanje opravil - samo zase	f
00030000-5605-557b-b55c-c6eb3433760f	Job-admin	Upravljanje opravil za vse uporabnike	f
00030000-5605-557b-5a8b-1d1aa296e9c9	Mapa-write	Mapa - osnovno dovoljenje za pisanje	f
00030000-5605-557b-d5ab-5b2cfa90f5b1	Mapa-read	Mapa - osnovno dovoljenje za branje	f
00030000-5605-557b-7898-d7f8e3b1bfc9	MapaAcl-write	MapaAcl - dovoljenje za dostop pisanje ACL-jev mape	f
00030000-5605-557b-0978-bb5ca90b79bb	MapaAcl-read	MapaAcl - dovoljenje za dostop branje ACL-jev mape	f
00030000-5605-557b-f185-2b6373a7cf68	Zapis-write	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-557b-bde9-6b981b5a54e1	Zapis-read	Zapis - dovoljenje za pisanje zapisov	f
00030000-5605-557b-a2df-3c903d9d5951	ZapisLastnik-write	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-557b-35f1-fd4f8bedf210	ZapisLastnik-read	ZapisLastnik - dovoljenje za povezovanje zapisov na lastnike	f
00030000-5605-557b-fef3-e74b4c462aef	VrstaZapisa-write	Šifrant vrst zapisa - spreminjanje	f
00030000-5605-557b-7400-b460dd7ee2fa	VrstaZapisa-read	Šifrant vrst zapisa - branje	f
00030000-5605-557b-f8b0-27a5108ec8d5	Datoteka-write	Datoteka - spreminjanje	f
00030000-5605-557b-4c6d-deae5008357e	Datoteka-read	Datoteke - branje	f
\.


--
-- TOC entry 2974 (class 0 OID 20776109)
-- Dependencies: 180
-- Data for Name: permission2role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY permission2role (role_id, permission_id) FROM stdin;
00020000-5605-557b-e0be-b4c988ee7c88	00030000-5605-557b-4955-3f69ee0b1b7e
00020000-5605-557b-4468-778fad499c2c	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-4f5b-758363b7a687
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-956b-3f288edfcc8c
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-8d30-cf3035d0c64b
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-ccca-8ba1671bd1a3
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-9d56-b56569d09fe4
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-8990-8117d54e8cdb
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-9626-1e60ff246334
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-98a8-c1e199791af4
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-e290-dae785a2ff33
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-78da-a287c394557b
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-7072-e4150ea637fa
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-fd75-e3e891231358
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-d42b-6f429fe67d9e
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-cb3f-403134b41089
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-6ddd-2cf424cabfec
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-7d8d-24d911a848f5
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-99f0-0be9b08ede5f
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-67ff-759ce2407fff
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-87b6-59e1531ad181
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-083d-3f1cc4271b93
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-2e0b-b6daff8c200f
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-b44c-c78c51f9f472
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-4490-730a4e82722c
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-9d33-401998276305
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-778f-7c778ee3d720
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-bd71-e15da2441bc8
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-9635-b851e5e4c234
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-6a99-74a590ddc936
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-0c45-99f26206be5b
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-7726-e728f18f53fb
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-5b85-36036dc91463
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-a50b-3ddda7411255
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-767c-35fd3b04e041
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-fce0-a4fb8e889d53
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-0be5-246ce90c8230
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-63b1-f2a4ecb025b8
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-fba0-d94410f50276
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-ca7f-543ce31a599e
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-24b2-a92d7b267ec0
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-071d-6d028360adef
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-998d-145c58160212
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-db92-d6e273398e1e
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-7c13-b606f79ecea2
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-eab5-e077322b099b
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-5ca0-64d80013f60e
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-1f85-4e64fd5ab397
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-d4d1-fc22d5bfe5b7
00020000-5605-557b-a3c1-0e09fee4e1e5	00030000-5605-557b-65a0-cb2f75bff9d8
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-4f5b-758363b7a687
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-9d56-b56569d09fe4
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-8990-8117d54e8cdb
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-fd75-e3e891231358
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-cb3f-403134b41089
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-7d8d-24d911a848f5
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-99f0-0be9b08ede5f
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-67ff-759ce2407fff
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-87b6-59e1531ad181
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-083d-3f1cc4271b93
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-2e0b-b6daff8c200f
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-b44c-c78c51f9f472
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-9d33-401998276305
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-bd71-e15da2441bc8
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-9635-b851e5e4c234
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-6a99-74a590ddc936
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-a50b-3ddda7411255
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-fce0-a4fb8e889d53
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-63b1-f2a4ecb025b8
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-ca7f-543ce31a599e
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-7e82-ecbb2e2d1ac4
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-5813-31e8658ad645
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-46f9-03cf1d86b5b4
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-5a56-c182ad7a8b5a
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-92a2-17d52d328173
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-0ea4-cda71728965d
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-d4d1-fc22d5bfe5b7
00020000-5605-557b-69c3-6b76d7f27e71	00030000-5605-557b-65a0-cb2f75bff9d8
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-4f5b-758363b7a687
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-8d30-cf3035d0c64b
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-9d56-b56569d09fe4
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-30a8-d379b815d5f1
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-c1c7-06d1396d27e2
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-201e-3335caecf2d4
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-8990-8117d54e8cdb
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-78da-a287c394557b
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-fd75-e3e891231358
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-cb3f-403134b41089
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-7d8d-24d911a848f5
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-67ff-759ce2407fff
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-87b6-59e1531ad181
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-083d-3f1cc4271b93
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-b44c-c78c51f9f472
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-9d33-401998276305
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-6a99-74a590ddc936
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-7726-e728f18f53fb
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-a50b-3ddda7411255
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-fce0-a4fb8e889d53
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-63b1-f2a4ecb025b8
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-ca7f-543ce31a599e
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-071d-6d028360adef
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-7c13-b606f79ecea2
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-5ca0-64d80013f60e
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-d4d1-fc22d5bfe5b7
00020000-5605-557b-9d5d-fcad054aaaf3	00030000-5605-557b-65a0-cb2f75bff9d8
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-4f5b-758363b7a687
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-956b-3f288edfcc8c
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-ccca-8ba1671bd1a3
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-9d56-b56569d09fe4
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-8990-8117d54e8cdb
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-fd75-e3e891231358
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-cb3f-403134b41089
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-67ff-759ce2407fff
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-87b6-59e1531ad181
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-b44c-c78c51f9f472
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-9d33-401998276305
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-6a99-74a590ddc936
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-a50b-3ddda7411255
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-fce0-a4fb8e889d53
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-63b1-f2a4ecb025b8
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-ca7f-543ce31a599e
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-071d-6d028360adef
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-d4d1-fc22d5bfe5b7
00020000-5605-557b-9178-a1362dca61c4	00030000-5605-557b-65a0-cb2f75bff9d8
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-4f5b-758363b7a687
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-9d56-b56569d09fe4
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-8990-8117d54e8cdb
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-fd75-e3e891231358
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-cb3f-403134b41089
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-67ff-759ce2407fff
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-87b6-59e1531ad181
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-b44c-c78c51f9f472
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-9d33-401998276305
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-6a99-74a590ddc936
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-a50b-3ddda7411255
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-fce0-a4fb8e889d53
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-63b1-f2a4ecb025b8
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-ca7f-543ce31a599e
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-0ebd-abf19208a324
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-5b66-d9157e00b478
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-071d-6d028360adef
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-d4d1-fc22d5bfe5b7
00020000-5605-557b-bb68-495c72f20580	00030000-5605-557b-65a0-cb2f75bff9d8
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-8861-5b31b3b33497
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-4955-3f69ee0b1b7e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5b66-d9157e00b478
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9626-1e60ff246334
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-f6da-92e005ae5ab2
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-3874-7dcf874014fa
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-63f8-9eee751596e5
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-4f5b-758363b7a687
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-956b-3f288edfcc8c
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-8d30-cf3035d0c64b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-ccca-8ba1671bd1a3
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9d56-b56569d09fe4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-30a8-d379b815d5f1
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-c1c7-06d1396d27e2
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-e4a0-08b635502153
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-201e-3335caecf2d4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-1ea0-a125a4337bab
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-8990-8117d54e8cdb
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-98a8-c1e199791af4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-22c5-3109a7ad1db8
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-e290-dae785a2ff33
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-f55f-fad9dcdb25db
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-b46e-b7ac51e2b44e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-537f-ca67528aca4b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-bd05-0e65e3cbef3a
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-78da-a287c394557b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7072-e4150ea637fa
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-fd75-e3e891231358
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-d42b-6f429fe67d9e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-cb3f-403134b41089
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6ddd-2cf424cabfec
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7d8d-24d911a848f5
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-99f0-0be9b08ede5f
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-3d79-83d4a59885bc
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-78f2-758c5da7d460
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-d52f-321b4c0ac4aa
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-c64c-b1fffddb017c
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-67ff-759ce2407fff
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-3261-e20e934e0d3d
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-87b6-59e1531ad181
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-bc70-70ee3ad4969e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-083d-3f1cc4271b93
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-2e0b-b6daff8c200f
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6e37-ddfb790a2dc6
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-eb77-e8c77ea3f199
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-06ff-a405335eb1e7
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-df1d-e103fd552537
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5cc6-fa3ba646058f
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-dc7f-03c35c399852
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-b44c-c78c51f9f472
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-4490-730a4e82722c
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9d33-401998276305
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-778f-7c778ee3d720
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-3641-3f19b71a0d3e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5d38-8f755d922d92
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-d977-571cb5419e0e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-96ae-525c5ab7b53b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-bd71-e15da2441bc8
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9635-b851e5e4c234
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6a99-74a590ddc936
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-0c45-99f26206be5b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5c4b-86ef8d4df6d9
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-ea0a-68658d050acd
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-90a3-c367f47485a0
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-40f2-2ea7aefe9bfa
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7726-e728f18f53fb
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5b85-36036dc91463
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-768b-776042848187
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-fec7-40e4885e032b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-cbb0-827b9febb313
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-b4c8-b6d32f32ae27
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-54d5-898c7b87e7f2
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6e50-ae3128ab9a8e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-da1a-35b22a37e5da
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-c389-febe91659e76
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-4d5d-a57610b87700
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-8b32-409c0aeb1c85
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-bc6b-96d88f306f36
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9ccb-798af8db4ea3
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9bcf-36abb8e51164
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-e85c-488de86dadfd
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-07a5-b7a0a03b5011
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-c739-81fd3b4af89e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-e252-a93be817c4bc
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-82c6-2bc5ddde12b2
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-87d8-08420df70dfd
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9c7c-1d7b0a024311
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-a50b-3ddda7411255
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-767c-35fd3b04e041
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-c030-2efa9c00d01e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-be8e-b9cd292d42b7
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-daa4-af0d04a4fc24
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9da7-ea7a3adf03f2
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-fce0-a4fb8e889d53
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-0be5-246ce90c8230
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-63b1-f2a4ecb025b8
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-fba0-d94410f50276
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-1ee5-a452718b20e0
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-4ed0-7e44fc0832e0
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5f97-9977621648f3
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6f10-383815db6cc6
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7fe8-4b8190e9b5ab
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5f29-2069cde5508b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-8c61-c1d41cba304e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-59d2-85f8c4d8dc4c
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-ca7f-543ce31a599e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-24b2-a92d7b267ec0
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-374a-4ce2390f70e5
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-8406-5ee9998970d1
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6899-2ce508474df0
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7d23-07b225425bfe
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-f0b6-3228cd3085ca
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-683c-deac0281700c
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-edbe-c31f8cf7e385
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-0f9f-3f9d2cb35edf
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7e82-ecbb2e2d1ac4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5813-31e8658ad645
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-0ebd-abf19208a324
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-6e7c-50e229f6876a
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-071d-6d028360adef
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-e9f2-3ba9b61b69da
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-b56d-6f0922c5c29b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-1fdf-faa6e29038d4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-46f9-03cf1d86b5b4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5a56-c182ad7a8b5a
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-998d-145c58160212
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-db92-d6e273398e1e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-7c13-b606f79ecea2
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-eab5-e077322b099b
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-db84-31d190c45e61
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-9abd-b2bc8d14c560
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-fe09-54af27c901a4
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-2371-525d7d305054
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-92a2-17d52d328173
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-0ea4-cda71728965d
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-5ca0-64d80013f60e
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-1f85-4e64fd5ab397
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-d4d1-fc22d5bfe5b7
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-b597-b8fd61267e15
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-65a0-cb2f75bff9d8
00020000-5605-557d-fa29-59cbd4bbb019	00030000-5605-557b-0d7e-5eeb8b05adcc
\.


--
-- TOC entry 3003 (class 0 OID 20776434)
-- Dependencies: 209
-- Data for Name: placilniinstrument; Type: TABLE DATA; Schema: public; Owner: -
--

COPY placilniinstrument (id, nacin_placina_id, ime) FROM stdin;
\.


--
-- TOC entry 3007 (class 0 OID 20776468)
-- Dependencies: 213
-- Data for Name: podrocjesedenja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY podrocjesedenja (id, ime, kapaciteta, templateplaceholder, barva) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 20776604)
-- Dependencies: 225
-- Data for Name: pogodba; Type: TABLE DATA; Schema: public; Owner: -
--

COPY pogodba (id, oseba_id, popa_id, trr_id, sifra, zacetek, konec, jeavtorskepravice, placilonavajo, vrednostvaje, planiranostevilovaj, vrednostvaj, vrednostpredstave, procentodinkasa, jeprocentodinkasa, vrednostdopremiere, zaposlenvdrjz, samozaposlen, igralec, opis) FROM stdin;
000b0000-5605-557d-28cd-13c72e5b97a4	00090000-5605-557d-eeac-c7017e2128e1	\N	\N	0001	\N	\N	f	f	10.00	3	10.00	30.00	\N	f	10.00	t	f	t	Pogodba o sodelovanju
000b0000-5605-557d-8c6e-0e74891c286a	00090000-5605-557d-083f-5159ef74aa4f	\N	\N	0002	\N	\N	f	t	11.00	10	11.00	31.00	\N	f	110.00	f	t	t	Pogodba za vlogo Helena
000b0000-5605-557d-c026-31f72a26b6a6	00090000-5605-557d-d49a-0a7abee32b60	\N	\N	0003	\N	\N	f	f	12.00	4	12.00	0.00	\N	f	12.00	f	t	f	Pogodba za lektoriranje
000b0000-5605-557d-f247-5d6b5511492d	00090000-5605-557d-ecd3-dfcd84d612d6	\N	\N	0004	\N	\N	t	f	0.00	2	300.00	0.00	\N	f	300.00	f	t	f	Pogodba za avtorske pravice
\.


--
-- TOC entry 2979 (class 0 OID 20776169)
-- Dependencies: 185
-- Data for Name: popa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY popa (id, drzava_id, sifra, stakli, naziv, naziv1, panoga, email, url, opomba, idddv, maticna, zavezanec, jeeu, datzav, datnzav, zamejstvo, nvo) FROM stdin;
00080000-5605-557d-ffa5-dd299ed98236	00040000-5605-557b-dfe7-3757e8ad5212	0988	AK	Juhuhu d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-8cd8-5295ffbcb11e	00040000-5605-557b-dfe7-3757e8ad5212	0989	AK	Hopsasa d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	t
00080000-5605-557d-9bee-db735198d4c7	00040000-5605-557b-dfe7-3757e8ad5212	0987	AK	Gledališče Šrum d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-a991-fce00a9a4162	00040000-5605-557b-dfe7-3757e8ad5212	0986	AK	Lutkovni Direndaj d.o.o.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-289c-3c56396438dc	00040000-5605-557b-dfe7-3757e8ad5212	0985	AK	Tatjana Stanič, Lektoriranje, s.p.		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-9cd0-eef6b01437ea	00040000-5605-557b-b0f5-950f3f1cd069	0984	AK	Gledališče Lepote tvoje		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-00ee-787e420378f1	00040000-5605-557b-f7a3-2ec84c8fa95b	0983	AK	Sunce naše		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-5294-3d3a49dd738b	00040000-5605-557b-9ae8-ae56c8194545	0982	AK	Theater Amadeus		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557d-33dc-0b3220881429	00040000-5605-557b-4b99-24bf54892bb2	9999	AK	Fuchs		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
00080000-5605-557e-4d5a-f32961d61000	00040000-5605-557b-dfe7-3757e8ad5212	1001	AK	Gledališče Matica		\N	\N		\N	\N	\N	\N	\N	\N	\N	f	f
\.


--
-- TOC entry 2981 (class 0 OID 20776203)
-- Dependencies: 187
-- Data for Name: posta; Type: TABLE DATA; Schema: public; Owner: -
--

COPY posta (id, sifra, naziv) FROM stdin;
00050000-5605-557a-336a-4bb025ae7e42	8341	Adlešiči
00050000-5605-557a-77d1-312d12740cc5	5270	Ajdovščina
00050000-5605-557a-f94f-2aefe8c3e80b	6280	Ankaran/Ancarano
00050000-5605-557a-0e87-673420a3ce8d	9253	Apače
00050000-5605-557a-fc9b-a46a28e31a18	8253	Artiče
00050000-5605-557a-8681-19d434afca2a	4275	Begunje na Gorenjskem
00050000-5605-557a-3479-2b322bf08327	1382	Begunje pri Cerknici
00050000-5605-557a-4db9-404efb32280d	9231	Beltinci
00050000-5605-557a-d770-cd663b70928d	2234	Benedikt
00050000-5605-557a-7df7-feaaef8719c9	2345	Bistrica ob Dravi
00050000-5605-557a-b7e9-29ebcf2a7498	3256	Bistrica ob Sotli
00050000-5605-557a-7483-ad8556cbb728	8259	Bizeljsko
00050000-5605-557a-41a9-ebfc24e22a39	1223	Blagovica
00050000-5605-557a-7a76-df0e708aa4c7	8283	Blanca
00050000-5605-557a-88ba-fa6a825413f2	4260	Bled
00050000-5605-557a-e180-205b9e996fba	4273	Blejska Dobrava
00050000-5605-557a-6437-4d1732a88475	9265	Bodonci
00050000-5605-557a-4701-eb7a42e680d3	9222	Bogojina
00050000-5605-557a-6bf8-50e3b2f7208f	4263	Bohinjska Bela
00050000-5605-557a-36db-d194f96b6370	4264	Bohinjska Bistrica
00050000-5605-557a-ae95-681f18470f69	4265	Bohinjsko jezero
00050000-5605-557a-393c-b07db4a8bab3	1353	Borovnica
00050000-5605-557a-6a4a-8625f8fa0d35	8294	Boštanj
00050000-5605-557a-6e8c-ae35941093f0	5230	Bovec
00050000-5605-557a-05d7-4cbc3f8d11a6	5295	Branik
00050000-5605-557a-779b-1d658901c735	3314	Braslovče
00050000-5605-557a-5582-22d6a952cb60	5223	Breginj
00050000-5605-557a-2c88-796191e5b7f8	8280	Brestanica
00050000-5605-557a-3a36-f1823ed6e613	2354	Bresternica
00050000-5605-557a-76ee-40ee180fa9bb	4243	Brezje
00050000-5605-557a-5f97-b70379a828a1	1351	Brezovica pri Ljubljani
00050000-5605-557a-488f-d06a79d8c45d	8250	Brežice
00050000-5605-557a-59f7-b3855e5f94b6	4210	Brnik - Aerodrom
00050000-5605-557a-61a2-07dcc0cefa16	8321	Brusnice
00050000-5605-557b-6025-70b201f547f0	3255	Buče
00050000-5605-557b-22ac-d2182f11621c	8276	Bučka 
00050000-5605-557b-1f8d-9ccde70dc668	9261	Cankova
00050000-5605-557b-c533-4021cad482de	3000	Celje 
00050000-5605-557b-c936-cbb177ddc785	3001	Celje - poštni predali
00050000-5605-557b-e1b8-1fb2af37d088	4207	Cerklje na Gorenjskem
00050000-5605-557b-e5c1-d885e008f3f0	8263	Cerklje ob Krki
00050000-5605-557b-7a52-5eb5e2593780	1380	Cerknica
00050000-5605-557b-3663-1a1f9152ef28	5282	Cerkno
00050000-5605-557b-dae9-87f9ca8eca99	2236	Cerkvenjak
00050000-5605-557b-74b7-41d912159aee	2215	Ceršak
00050000-5605-557b-a28c-e0a93db2506e	2326	Cirkovce
00050000-5605-557b-8102-0e4df95e4d77	2282	Cirkulane
00050000-5605-557b-7dc5-9867465351c3	5273	Col
00050000-5605-557b-0dcb-e51bed7da132	8251	Čatež ob Savi
00050000-5605-557b-6b9d-17fd90dd24a1	1413	Čemšenik
00050000-5605-557b-288d-cf08c92a910b	5253	Čepovan
00050000-5605-557b-f691-c7d7723146c6	9232	Črenšovci
00050000-5605-557b-7854-62fd9c113687	2393	Črna na Koroškem
00050000-5605-557b-be50-d96a6ad9d4ef	6275	Črni Kal
00050000-5605-557b-0808-21a1ca53dd23	5274	Črni Vrh nad Idrijo
00050000-5605-557b-d664-89a62b5737ab	5262	Črniče
00050000-5605-557b-c872-c805ee2440f2	8340	Črnomelj
00050000-5605-557b-9daf-40c3692e5673	6271	Dekani
00050000-5605-557b-d3a5-924fffeec360	5210	Deskle
00050000-5605-557b-7346-fabdc79fac2f	2253	Destrnik
00050000-5605-557b-3efa-df181436cc1b	6215	Divača
00050000-5605-557b-8f03-19c656a3cfbb	1233	Dob
00050000-5605-557b-5660-8907aa7ecac0	3224	Dobje pri Planini
00050000-5605-557b-c83a-c7398ab1545d	8257	Dobova
00050000-5605-557b-1631-8614e830de4a	1423	Dobovec
00050000-5605-557b-d445-929b9d63ef61	5263	Dobravlje
00050000-5605-557b-4f10-260bb879c461	3204	Dobrna
00050000-5605-557b-0e66-cb260c934a9d	8211	Dobrnič
00050000-5605-557b-a785-0f5851c65333	1356	Dobrova
00050000-5605-557b-9547-0a2e48349d77	9223	Dobrovnik/Dobronak 
00050000-5605-557b-d316-c3a2ba9d5afc	5212	Dobrovo v Brdih
00050000-5605-557b-8a55-e65f68fd7145	1431	Dol pri Hrastniku
00050000-5605-557b-7291-7b892153aa77	1262	Dol pri Ljubljani
00050000-5605-557b-a999-58ffae30a255	1273	Dole pri Litiji
00050000-5605-557b-bfaf-0431887d6375	1331	Dolenja vas
00050000-5605-557b-c5fd-c42ffa584b30	8350	Dolenjske Toplice
00050000-5605-557b-3f36-b2c5c265eca2	1230	Domžale
00050000-5605-557b-e845-ea806c5c22d3	2252	Dornava
00050000-5605-557b-7894-b939e8a881a6	5294	Dornberk
00050000-5605-557b-4889-74fc9a280899	1319	Draga
00050000-5605-557b-5074-9d1b2285c6f5	8343	Dragatuš
00050000-5605-557b-9620-a7d3f3aeda24	3222	Dramlje
00050000-5605-557b-c3b3-3fa070edcb4b	2370	Dravograd
00050000-5605-557b-d89a-fd63ac0cf39b	4203	Duplje
00050000-5605-557b-30e5-d52a0a6c366b	6221	Dutovlje
00050000-5605-557b-3b4d-3567a8d34462	8361	Dvor
00050000-5605-557b-0af0-ee87d496420e	2343	Fala
00050000-5605-557b-5b22-39ce60acd5a5	9208	Fokovci
00050000-5605-557b-b073-a45961340bc6	2313	Fram
00050000-5605-557b-1b21-a46de3403e3f	3213	Frankolovo
00050000-5605-557b-a0bf-718bb8e2765e	1274	Gabrovka
00050000-5605-557b-85f5-26db3931d65b	8254	Globoko
00050000-5605-557b-9211-45cc330ed26e	5275	Godovič
00050000-5605-557b-8a6b-1b5a23e6199b	4204	Golnik
00050000-5605-557b-86b1-dd7fc988e54a	3303	Gomilsko
00050000-5605-557b-2173-fa773ac12541	4224	Gorenja vas
00050000-5605-557b-0576-8387473e4894	3263	Gorica pri Slivnici
00050000-5605-557b-d564-a61ad92acf95	2272	Gorišnica
00050000-5605-557b-7ae5-f9512b1c8464	9250	Gornja Radgona
00050000-5605-557b-2a63-697f18986059	3342	Gornji Grad
00050000-5605-557b-426a-b3bc8134d6e1	4282	Gozd Martuljek
00050000-5605-557b-7d84-0c17e9734982	6272	Gračišče
00050000-5605-557b-8fa8-91887ef3528b	9264	Grad
00050000-5605-557b-b794-f7fdca0b7f51	8332	Gradac
00050000-5605-557b-1829-82d46d7726d7	1384	Grahovo
00050000-5605-557b-0a3e-ba98cf37532e	5242	Grahovo ob Bači
00050000-5605-557b-8a99-49bd8bc01f1e	5251	Grgar
00050000-5605-557b-5a94-eec8d8a2fea8	3302	Griže
00050000-5605-557b-0100-a5b5bcc9a6cf	3231	Grobelno
00050000-5605-557b-bdaf-f130d04b1635	1290	Grosuplje
00050000-5605-557b-241c-ad1c470f51b6	2288	Hajdina
00050000-5605-557b-3e70-bc8009b0051b	8362	Hinje
00050000-5605-557b-bb75-76cac55d2cdd	2311	Hoče
00050000-5605-557b-c396-033c5d1c2772	9205	Hodoš/Hodos
00050000-5605-557b-0f8c-d71bf0451233	1354	Horjul
00050000-5605-557b-319b-3e338d87b410	1372	Hotedršica
00050000-5605-557b-a256-597abcb7be3f	1430	Hrastnik
00050000-5605-557b-141a-32ccb1e88d6a	6225	Hruševje
00050000-5605-557b-27c8-c87b8da465cd	4276	Hrušica
00050000-5605-557b-7e68-77cfce996f37	5280	Idrija
00050000-5605-557b-bcba-2df7205a2830	1292	Ig
00050000-5605-557b-84ff-abd473c41bc5	6250	Ilirska Bistrica
00050000-5605-557b-6d86-cc429f5f7260	6251	Ilirska Bistrica-Trnovo
00050000-5605-557b-7743-7e001ab41d0e	1295	Ivančna Gorica
00050000-5605-557b-a97d-01f4d3718b9f	2259	Ivanjkovci
00050000-5605-557b-92d5-a177fda01601	1411	Izlake
00050000-5605-557b-51f3-f41e83ab9021	6310	Izola/Isola
00050000-5605-557b-16cf-04cd20cdc1eb	2222	Jakobski Dol
00050000-5605-557b-042f-a5bc23001892	2221	Jarenina
00050000-5605-557b-afe3-3240a43764e1	6254	Jelšane
00050000-5605-557b-0f56-4f6dde531974	4270	Jesenice
00050000-5605-557b-0e16-00f18614f00d	8261	Jesenice na Dolenjskem
00050000-5605-557b-144c-90b50feab9ee	3273	Jurklošter
00050000-5605-557b-51c3-26a258dcd88c	2223	Jurovski Dol
00050000-5605-557b-3f06-cb767fcfd48a	2256	Juršinci
00050000-5605-557b-552f-1e0437239a99	5214	Kal nad Kanalom
00050000-5605-557b-cc56-604245195f7c	3233	Kalobje
00050000-5605-557b-e25b-17d57f3b5302	4246	Kamna Gorica
00050000-5605-557b-71d0-c8e37bd83f44	2351	Kamnica
00050000-5605-557b-6cf5-f5f1dd2708fa	1241	Kamnik
00050000-5605-557b-3bd0-d16827e63e2e	5213	Kanal
00050000-5605-557b-c677-c0a1d2669ca9	8258	Kapele
00050000-5605-557b-66cc-03284d69c5bc	2362	Kapla
00050000-5605-557b-da18-b397dd955bf7	2325	Kidričevo
00050000-5605-557b-2641-e1b974a692ea	1412	Kisovec
00050000-5605-557b-cefe-6589de384625	6253	Knežak
00050000-5605-557b-b00f-20d7f2533420	5222	Kobarid
00050000-5605-557b-53b3-cc88adebca71	9227	Kobilje
00050000-5605-557b-0d56-b7975f74e738	1330	Kočevje
00050000-5605-557b-0160-1951dbfde91e	1338	Kočevska Reka
00050000-5605-557b-64db-0aeca8a61061	2276	Kog
00050000-5605-557b-f235-6d0dbb67f167	5211	Kojsko
00050000-5605-557b-3fd8-2a69a7d3a3f8	6223	Komen
00050000-5605-557b-ea8f-095e56d77d94	1218	Komenda
00050000-5605-557b-223e-45a3c457fc9e	6000	Koper/Capodistria 
00050000-5605-557b-169d-3ef76c25e36d	6001	Koper/Capodistria - poštni predali
00050000-5605-557b-07f8-275d5d76ab58	8282	Koprivnica
00050000-5605-557b-fd93-ce7c0256242a	5296	Kostanjevica na Krasu
00050000-5605-557b-bb8f-b17124e2cbbb	8311	Kostanjevica na Krki
00050000-5605-557b-5a8f-60c5a85dae34	1336	Kostel
00050000-5605-557b-ba7f-f2971c60f514	6256	Košana
00050000-5605-557b-7dd2-c98ab05eb2b2	2394	Kotlje
00050000-5605-557b-1073-7c0f78b07917	6240	Kozina
00050000-5605-557b-4539-236003d8d3a7	3260	Kozje
00050000-5605-557b-4828-021f5a1eecc8	4000	Kranj 
00050000-5605-557b-538b-e38ab567e4c5	4001	Kranj - poštni predali
00050000-5605-557b-3df2-4ed7c32a202f	4280	Kranjska Gora
00050000-5605-557b-57a4-4ff998d98a17	1281	Kresnice
00050000-5605-557b-946f-93a6fb2a40b4	4294	Križe
00050000-5605-557b-361b-d965a33c70ee	9206	Križevci
00050000-5605-557b-1354-3e89d9baa5ee	9242	Križevci pri Ljutomeru
00050000-5605-557b-3dd2-796f7b318b64	1301	Krka
00050000-5605-557b-816d-944b931e0cd0	8296	Krmelj
00050000-5605-557b-6b1f-43cb849a0729	4245	Kropa
00050000-5605-557b-2649-b3ddeb80e021	8262	Krška vas
00050000-5605-557b-39c0-63099dcbe0c7	8270	Krško
00050000-5605-557b-03fc-fb74a930bd15	9263	Kuzma
00050000-5605-557b-c161-f0091786568d	2318	Laporje
00050000-5605-557b-a8b8-2a0d4fa4cb34	3270	Laško
00050000-5605-557b-9147-16c3ec02071a	1219	Laze v Tuhinju
00050000-5605-557b-03cc-6a9d7593edff	2230	Lenart v Slovenskih goricah
00050000-5605-557b-cd91-c00dcb85b4ba	9220	Lendava/Lendva
00050000-5605-557b-df8f-70014a59f98c	4248	Lesce
00050000-5605-557b-374f-55d02926f69f	3261	Lesično
00050000-5605-557b-13e6-c112731d271d	8273	Leskovec pri Krškem
00050000-5605-557b-681d-152a815fba1b	2372	Libeliče
00050000-5605-557b-4764-8790d5c4672d	2341	Limbuš
00050000-5605-557b-3d6e-7f59890cf519	1270	Litija
00050000-5605-557b-e2ba-3c2dd2515db0	3202	Ljubečna
00050000-5605-557b-453d-a82b820d30dd	1000	Ljubljana 
00050000-5605-557b-6a4b-cf07310a4bad	1001	Ljubljana - poštni predali
00050000-5605-557b-c3d1-02054f8cd28d	1231	Ljubljana - Črnuče
00050000-5605-557b-d9b7-adae47ef64d7	1261	Ljubljana - Dobrunje
00050000-5605-557b-0906-151671b1fc01	1260	Ljubljana - Polje
00050000-5605-557b-7fa4-5ea681dd5929	1210	Ljubljana - Šentvid
00050000-5605-557b-836e-0d16304e4036	1211	Ljubljana - Šmartno
00050000-5605-557b-19e8-8c364042f958	3333	Ljubno ob Savinji
00050000-5605-557b-bd05-e30bdc220242	9240	Ljutomer
00050000-5605-557b-283f-ea4c1cc81bdc	3215	Loče
00050000-5605-557b-255e-fc08b8bc659e	5231	Log pod Mangartom
00050000-5605-557b-78e9-28d00a0c2c0e	1358	Log pri Brezovici
00050000-5605-557b-08cc-16147f1e8061	1370	Logatec
00050000-5605-557b-23c8-4667bba3d6cc	1371	Logatec
00050000-5605-557b-3160-ed984aa7c807	1434	Loka pri Zidanem Mostu
00050000-5605-557b-fe86-95a6765e01f5	3223	Loka pri Žusmu
00050000-5605-557b-187b-61a77e403941	6219	Lokev
00050000-5605-557b-1c7d-3a5ec1f705bc	1318	Loški Potok
00050000-5605-557b-efb3-123913182081	2324	Lovrenc na Dravskem polju
00050000-5605-557b-8b81-e27c03beaa1d	2344	Lovrenc na Pohorju
00050000-5605-557b-d9d4-e26d13aba009	3334	Luče
00050000-5605-557b-6b62-69ac35131ad3	1225	Lukovica
00050000-5605-557b-89b5-31df4357e7d7	9202	Mačkovci
00050000-5605-557b-98aa-10708a900dfb	2322	Majšperk
00050000-5605-557b-ca7e-f2e2895dddb0	2321	Makole
00050000-5605-557b-ef97-1c04ec873f19	9243	Mala Nedelja
00050000-5605-557b-06e2-13548102ef4b	2229	Malečnik
00050000-5605-557b-c0a6-69e6397849a1	6273	Marezige
00050000-5605-557b-7c16-59df718b9b96	2000	Maribor 
00050000-5605-557b-856d-ce0284b60f20	2001	Maribor - poštni predali
00050000-5605-557b-8dd1-634a7c0c5451	2206	Marjeta na Dravskem polju
00050000-5605-557b-e93e-f1e348540698	2281	Markovci
00050000-5605-557b-108a-bc53d739e288	9221	Martjanci
00050000-5605-557b-badc-68db1607e301	6242	Materija
00050000-5605-557b-d5d9-ecf8c24dd8ff	4211	Mavčiče
00050000-5605-557b-c5dc-033caf618ce8	1215	Medvode
00050000-5605-557b-a7a2-50ff8be1c1a5	1234	Mengeš
00050000-5605-557b-55a5-22ba3a9e2db5	8330	Metlika
00050000-5605-557b-de4d-4ff10fce0aa7	2392	Mežica
00050000-5605-557b-dbc0-cf6f0cb88c9f	2204	Miklavž na Dravskem polju
00050000-5605-557b-6681-e2599a4340f2	2275	Miklavž pri Ormožu
00050000-5605-557b-9dc4-65338f19ded5	5291	Miren
00050000-5605-557b-76be-3955a32ca073	8233	Mirna
00050000-5605-557b-4c91-c3ee9e9a8602	8216	Mirna Peč
00050000-5605-557b-5898-3f477c63cbc6	2382	Mislinja
00050000-5605-557b-ce55-804af9bab904	4281	Mojstrana
00050000-5605-557b-93d4-db6c1282b0bd	8230	Mokronog
00050000-5605-557b-e173-c4609ede6b2f	1251	Moravče
00050000-5605-557b-c849-2d0630f6ecfe	9226	Moravske Toplice
00050000-5605-557b-8329-0b76a3e6d71d	5216	Most na Soči
00050000-5605-557b-ab57-8e54e67fe663	1221	Motnik
00050000-5605-557b-ccb3-74f39b0c3d8a	3330	Mozirje
00050000-5605-557b-c3c0-a1342c5684d7	9000	Murska Sobota 
00050000-5605-557b-0f19-72af95175fd8	9001	Murska Sobota - poštni predali
00050000-5605-557b-b13a-f95f1f70ce60	2366	Muta
00050000-5605-557b-0cbb-2ab71599fae7	4202	Naklo
00050000-5605-557b-00c2-b11a3f1606a0	3331	Nazarje
00050000-5605-557b-ec1c-5422137fb1cd	1357	Notranje Gorice
00050000-5605-557b-ad06-2fa946446a4f	3203	Nova Cerkev
00050000-5605-557b-24b9-803fee52fa0b	5000	Nova Gorica 
00050000-5605-557b-7321-9cc5d7060822	5001	Nova Gorica - poštni predali
00050000-5605-557b-1f53-88588d7167f8	1385	Nova vas
00050000-5605-557b-8897-fb01c81dfc23	8000	Novo mesto
00050000-5605-557b-e2e6-d1d00571d7f7	8001	Novo mesto - poštni predali
00050000-5605-557b-677e-b14f56fe9c91	6243	Obrov
00050000-5605-557b-94e5-f459cbe2baac	9233	Odranci
00050000-5605-557b-053e-eec82c6d5901	2317	Oplotnica
00050000-5605-557b-76f0-a22ba0b0b6a6	2312	Orehova vas
00050000-5605-557b-a579-b9f524cd9be3	2270	Ormož
00050000-5605-557b-3853-aae04dc7e8ca	1316	Ortnek
00050000-5605-557b-671c-0bfca1efcc02	1337	Osilnica
00050000-5605-557b-4768-ecad517a99f9	8222	Otočec
00050000-5605-557b-12be-c7aa83d45c2f	2361	Ožbalt
00050000-5605-557b-8e81-a10540d221d4	2231	Pernica
00050000-5605-557b-de0a-d7f72b52c6e3	2211	Pesnica pri Mariboru
00050000-5605-557b-d85a-3710193067fe	9203	Petrovci
00050000-5605-557b-0fab-edaccdc365da	3301	Petrovče
00050000-5605-557b-b688-b01d8ee70a51	6330	Piran/Pirano
00050000-5605-557b-0756-f183f71d3a6a	8255	Pišece
00050000-5605-557b-4643-63c0e70eeab8	6257	Pivka
00050000-5605-557b-b908-389dc6ad8901	6232	Planina
00050000-5605-557b-99d5-d93c205b1619	3225	Planina pri Sevnici
00050000-5605-557b-dcff-f761a2c1c0f8	6276	Pobegi
00050000-5605-557b-2229-6bbbedee8e5c	8312	Podbočje
00050000-5605-557b-c040-3ab9740de617	5243	Podbrdo
00050000-5605-557b-fc29-2dbf64be516f	3254	Podčetrtek
00050000-5605-557b-df46-4ffb27c1edf5	2273	Podgorci
00050000-5605-557b-4a3d-efc57a600dd5	6216	Podgorje
00050000-5605-557b-07e2-1f71ab48fb4e	2381	Podgorje pri Slovenj Gradcu
00050000-5605-557b-da5b-31c6495daa49	6244	Podgrad
00050000-5605-557b-6a89-0d6337602d92	1414	Podkum
00050000-5605-557b-9470-76480fa57503	2286	Podlehnik
00050000-5605-557b-8e7e-6baa4d89567e	5272	Podnanos
00050000-5605-557b-12ae-7c1186e0503b	4244	Podnart
00050000-5605-557b-1ace-b06dfd36d4dc	3241	Podplat
00050000-5605-557b-e7df-3e059e08cfe7	3257	Podsreda
00050000-5605-557b-ca18-5d226eabf5f6	2363	Podvelka
00050000-5605-557b-7bee-c78701a4c68b	2208	Pohorje
00050000-5605-557b-af91-cdb7369b47e1	2257	Polenšak
00050000-5605-557b-35ec-92c7d73accd1	1355	Polhov Gradec
00050000-5605-557b-0bed-6d8e7b2a67e7	4223	Poljane nad Škofjo Loko
00050000-5605-557b-48d3-c575b609d445	2319	Poljčane
00050000-5605-557b-68b9-63a070c358bf	1272	Polšnik
00050000-5605-557b-bd4e-3718ab912d3d	3313	Polzela
00050000-5605-557b-174a-1aa630a6097a	3232	Ponikva
00050000-5605-557b-1656-5ad0d983fb89	6320	Portorož/Portorose
00050000-5605-557b-e08c-4a154c0abfa0	6230	Postojna
00050000-5605-557b-9beb-a0a4e72c8b4f	2331	Pragersko
00050000-5605-557b-b08b-d9eafcd66f5d	3312	Prebold
00050000-5605-557b-9ebd-d2e9a370fa0a	4205	Preddvor
00050000-5605-557b-551d-d39e54b61361	6255	Prem
00050000-5605-557b-a9a2-7e53cb483435	1352	Preserje
00050000-5605-557b-b1fa-9ba7a589ea77	6258	Prestranek
00050000-5605-557b-618e-c40df51f81e1	2391	Prevalje
00050000-5605-557b-87f0-5c752f82e056	3262	Prevorje
00050000-5605-557b-afc7-0558037fa276	1276	Primskovo 
00050000-5605-557b-beea-75c790748950	3253	Pristava pri Mestinju
00050000-5605-557b-b471-096f902b6485	9207	Prosenjakovci/Partosfalva
00050000-5605-557b-d524-ac8363c01f32	5297	Prvačina
00050000-5605-557b-5f5b-f75153cc618b	2250	Ptuj
00050000-5605-557b-0258-1086652df62c	2323	Ptujska Gora
00050000-5605-557b-3049-34bd67a134ab	9201	Puconci
00050000-5605-557b-c2e6-f2f8a0736960	2327	Rače
00050000-5605-557b-c540-db00ca11b628	1433	Radeče
00050000-5605-557b-fa3e-af4996a5db66	9252	Radenci
00050000-5605-557b-80ad-95256d81d2a6	2360	Radlje ob Dravi
00050000-5605-557b-be89-eff96f67ce68	1235	Radomlje
00050000-5605-557b-f20c-ab3ec5829e5d	4240	Radovljica
00050000-5605-557b-2d56-1778d589ef87	8274	Raka
00050000-5605-557b-581a-78a61bbd0300	1381	Rakek
00050000-5605-557b-e20c-43e89b5a4d1b	4283	Rateče - Planica
00050000-5605-557b-a267-9d089275dd99	2390	Ravne na Koroškem
00050000-5605-557b-76a3-9b52754dadb9	9246	Razkrižje
00050000-5605-557b-8e49-8d42daa09d01	3332	Rečica ob Savinji
00050000-5605-557b-ec9b-71123174d109	5292	Renče
00050000-5605-557b-a1aa-4903d57fe3f9	1310	Ribnica
00050000-5605-557b-40cd-948dffa385c7	2364	Ribnica na Pohorju
00050000-5605-557b-316f-9d3e4412e9a8	3272	Rimske Toplice
00050000-5605-557b-4bd8-37597bec9471	1314	Rob
00050000-5605-557b-e42e-c9180a1399dc	5215	Ročinj
00050000-5605-557b-fe3e-1aa6db2afc86	3250	Rogaška Slatina
00050000-5605-557b-6236-281bc845697d	9262	Rogašovci
00050000-5605-557b-b7b4-6842e3368978	3252	Rogatec
00050000-5605-557b-237b-261ff753af44	1373	Rovte
00050000-5605-557b-5cfe-e97f180fffd0	2342	Ruše
00050000-5605-557b-0d8d-fba7e232a8a5	1282	Sava
00050000-5605-557b-f9ab-087e25e2bbf2	6333	Sečovlje/Sicciole
00050000-5605-557b-7aaa-ca141b33f2cb	4227	Selca
00050000-5605-557b-db30-cdbe6d60b93f	2352	Selnica ob Dravi
00050000-5605-557b-9976-4698186c2e75	8333	Semič
00050000-5605-557b-e1f1-62b6df02b2a5	8281	Senovo
00050000-5605-557b-cecc-3b04ea70ce30	6224	Senožeče
00050000-5605-557b-daca-be330a2bd936	8290	Sevnica
00050000-5605-557b-3014-d772bd50b90d	6210	Sežana
00050000-5605-557b-9db8-12f8825c0185	2214	Sladki Vrh
00050000-5605-557b-65e6-30c0f5ed8d3c	5283	Slap ob Idrijci
00050000-5605-557b-1c5c-68356da85331	2380	Slovenj Gradec
00050000-5605-557b-ec91-846c2940c338	2310	Slovenska Bistrica
00050000-5605-557b-993d-9f770e926e1e	3210	Slovenske Konjice
00050000-5605-557b-68a7-2c2ef4fb4c4e	1216	Smlednik
00050000-5605-557b-4747-72fe6599e6ef	5232	Soča
00050000-5605-557b-efc3-bf8aedf2ab28	1317	Sodražica
00050000-5605-557b-06a5-5b7676bbcd36	3335	Solčava
00050000-5605-557b-d217-a7c75de7660f	5250	Solkan
00050000-5605-557b-d6a8-d8a8d8c59c6a	4229	Sorica
00050000-5605-557b-19ec-b523c6c702d8	4225	Sovodenj
00050000-5605-557b-e93c-a7dca5141a5e	5281	Spodnja Idrija
00050000-5605-557b-a6df-46232b5aff01	2241	Spodnji Duplek
00050000-5605-557b-2aad-6c66e12c2cde	9245	Spodnji Ivanjci
00050000-5605-557b-bbba-241a8f4e18e0	2277	Središče ob Dravi
00050000-5605-557b-a2c1-ef379fd0f15d	4267	Srednja vas v Bohinju
00050000-5605-557b-24c7-44fed8b7c2d2	8256	Sromlje 
00050000-5605-557b-ef34-5d5f7fdd5d4f	5224	Srpenica
00050000-5605-557b-a7c5-57124d6b9840	1242	Stahovica
00050000-5605-557b-5a6f-05ffee6c94dd	1332	Stara Cerkev
00050000-5605-557b-b40a-4c1e4c441714	8342	Stari trg ob Kolpi
00050000-5605-557b-3030-6ce4887984a7	1386	Stari trg pri Ložu
00050000-5605-557b-cb89-e57435bba028	2205	Starše
00050000-5605-557b-04ac-66b3ecf5b9a0	2289	Stoperce
00050000-5605-557b-d72e-2fc673b28e88	8322	Stopiče
00050000-5605-557b-c6af-ff652ce71b73	3206	Stranice
00050000-5605-557b-226d-fb9b848d84b2	8351	Straža
00050000-5605-557b-2103-ff142dcd7a62	1313	Struge
00050000-5605-557b-c294-3bc963d6cb50	8293	Studenec
00050000-5605-557b-7b1a-773b71ea2b0c	8331	Suhor
00050000-5605-557b-8548-42c67bc4f64b	2233	Sv. Ana v Slovenskih goricah
00050000-5605-557b-7158-5e64992f1b90	2235	Sv. Trojica v Slovenskih goricah
00050000-5605-557b-140c-3533fb0b1b2f	2353	Sveti Duh na Ostrem Vrhu
00050000-5605-557b-7d5a-f3d8c3ce34a8	9244	Sveti Jurij ob Ščavnici
00050000-5605-557b-1717-e4dce2f91055	3264	Sveti Štefan
00050000-5605-557b-b271-e84d5f897792	2258	Sveti Tomaž
00050000-5605-557b-61fe-6931d7f58fb7	9204	Šalovci
00050000-5605-557b-d2db-f8485500bb94	5261	Šempas
00050000-5605-557b-af03-6d3cb3d9a135	5290	Šempeter pri Gorici
00050000-5605-557b-5dc0-6ff5609cdd28	3311	Šempeter v Savinjski dolini
00050000-5605-557b-238b-7930933d1068	4208	Šenčur
00050000-5605-557b-e2bb-be1af31b37c8	2212	Šentilj v Slovenskih goricah
00050000-5605-557b-dea1-1a8fdd9546e7	8297	Šentjanž
00050000-5605-557b-b6f0-efa42bb9b797	2373	Šentjanž pri Dravogradu
00050000-5605-557b-49e9-f191885afec7	8310	Šentjernej
00050000-5605-557b-7caa-2c676be2fd15	3230	Šentjur
00050000-5605-557b-34e6-a0c24bd58593	3271	Šentrupert
00050000-5605-557b-dc48-4dc1eedc238d	8232	Šentrupert
00050000-5605-557b-4f67-8ce65b6f1188	1296	Šentvid pri Stični
00050000-5605-557b-c5f7-936625ff6ca5	8275	Škocjan
00050000-5605-557b-70c7-abd99ffa9f74	6281	Škofije
00050000-5605-557b-604c-b54d39ac76ad	4220	Škofja Loka
00050000-5605-557b-aaba-687db89c4d8c	3211	Škofja vas
00050000-5605-557b-87fe-a73fab4f05e9	1291	Škofljica
00050000-5605-557b-b736-0de7956c0af9	6274	Šmarje
00050000-5605-557b-ef5e-e1f5d66b7f08	1293	Šmarje - Sap
00050000-5605-557b-2fa3-2a5c7e32f470	3240	Šmarje pri Jelšah
00050000-5605-557b-3e90-2a64ef235e63	8220	Šmarješke Toplice
00050000-5605-557b-0cd1-a2d9b9a0756d	2315	Šmartno na Pohorju
00050000-5605-557b-b91f-6bb68955b41d	3341	Šmartno ob Dreti
00050000-5605-557b-1d8d-9a17ca376db1	3327	Šmartno ob Paki
00050000-5605-557b-84b1-4b9eb94b4e04	1275	Šmartno pri Litiji
00050000-5605-557b-1ab7-fb699c26d2e8	2383	Šmartno pri Slovenj Gradcu
00050000-5605-557b-cb8c-598018e7a0a0	3201	Šmartno v Rožni dolini
00050000-5605-557b-5c43-d6d456a620b8	3325	Šoštanj
00050000-5605-557b-fa8b-69637af52b48	6222	Štanjel
00050000-5605-557b-441b-cacdc4ff8e12	3220	Štore
00050000-5605-557b-d9d4-b0bf40ee998e	3304	Tabor
00050000-5605-557b-fcea-da20e50f3ce2	3221	Teharje
00050000-5605-557b-ee9b-8df8a297b44b	9251	Tišina
00050000-5605-557b-a36e-9011228f11a4	5220	Tolmin
00050000-5605-557b-9b71-eb4e868b620b	3326	Topolšica
00050000-5605-557b-f268-e332d5143dcb	2371	Trbonje
00050000-5605-557b-fdee-0fe23fc21d02	1420	Trbovlje
00050000-5605-557b-04d0-fcce26139aec	8231	Trebelno 
00050000-5605-557b-e8ec-7ee0488d8afa	8210	Trebnje
00050000-5605-557b-8092-0073929e6f9e	5252	Trnovo pri Gorici
00050000-5605-557b-fe73-9fb4da62f0c0	2254	Trnovska vas
00050000-5605-557b-002a-dcfb55ad1f03	1222	Trojane
00050000-5605-557b-0d5d-f56a315b9d1d	1236	Trzin
00050000-5605-557b-f280-40f8b81d2796	4290	Tržič
00050000-5605-557b-996e-79b33265fc28	8295	Tržišče
00050000-5605-557b-c8c6-7464c05a8eba	1311	Turjak
00050000-5605-557b-18f1-1cfcde23eb33	9224	Turnišče
00050000-5605-557b-14ed-ed4cee8e217f	8323	Uršna sela
00050000-5605-557b-d2c0-6192a0b7d70b	1252	Vače
00050000-5605-557b-f3e9-ee81ffe5ae9e	3320	Velenje 
00050000-5605-557b-3c79-542a290dba12	3322	Velenje - poštni predali
00050000-5605-557b-e86a-d77a28f66179	8212	Velika Loka
00050000-5605-557b-1ec5-7560b8876215	2274	Velika Nedelja
00050000-5605-557b-a3fd-0ecd882ab678	9225	Velika Polana
00050000-5605-557b-c8f7-1d3c5fd45712	1315	Velike Lašče
00050000-5605-557b-671f-0ec8bf7f7df0	8213	Veliki Gaber
00050000-5605-557b-2879-46689266eb7a	9241	Veržej
00050000-5605-557b-9498-809d8f5839bb	1312	Videm - Dobrepolje
00050000-5605-557b-9a70-b8726b98aae1	2284	Videm pri Ptuju
00050000-5605-557b-1ab9-a84863d06a1d	8344	Vinica
00050000-5605-557b-f0c3-72ee72a99e12	5271	Vipava
00050000-5605-557b-6c16-b084f6677435	4212	Visoko
00050000-5605-557b-db25-66adb351e242	1294	Višnja Gora
00050000-5605-557b-d252-a07d794725a8	3205	Vitanje
00050000-5605-557b-d90e-1ed9695f5943	2255	Vitomarci
00050000-5605-557b-bc1d-ee271a35e40e	1217	Vodice
00050000-5605-557b-2b7d-238510f1a328	3212	Vojnik\t
00050000-5605-557b-f2de-73dfbf371db0	5293	Volčja Draga
00050000-5605-557b-59a1-8dd644a66201	2232	Voličina
00050000-5605-557b-cbcd-d4703637cc68	3305	Vransko
00050000-5605-557b-64dd-3d592ccf16b1	6217	Vremski Britof
00050000-5605-557b-71c4-d3b1c9e69c0d	1360	Vrhnika
00050000-5605-557b-6ead-3d3a51290aa6	2365	Vuhred
00050000-5605-557b-95cc-5b9e71190c40	2367	Vuzenica
00050000-5605-557b-2713-22cbc9d5854e	8292	Zabukovje 
00050000-5605-557b-8aad-ae2b581b6748	1410	Zagorje ob Savi
00050000-5605-557b-957e-158dcf23d553	1303	Zagradec
00050000-5605-557b-790d-53dfbbdd0e3d	2283	Zavrč
00050000-5605-557b-33e9-32fef1428eaf	8272	Zdole 
00050000-5605-557b-633a-19fffa3c08f2	4201	Zgornja Besnica
00050000-5605-557b-462c-601bf875b0bd	2242	Zgornja Korena
00050000-5605-557b-d28c-482a6c68c3a7	2201	Zgornja Kungota
00050000-5605-557b-23cc-26bbc4e0c680	2316	Zgornja Ložnica
00050000-5605-557b-fb06-17a558422abc	2314	Zgornja Polskava
00050000-5605-557b-1256-44d28b9d9523	2213	Zgornja Velka
00050000-5605-557b-5881-e82415073c55	4247	Zgornje Gorje
00050000-5605-557b-47ee-0a76163653ff	4206	Zgornje Jezersko
00050000-5605-557b-64cd-1f1b66d44438	2285	Zgornji Leskovec
00050000-5605-557b-0d45-56b58870367c	1432	Zidani Most
00050000-5605-557b-d2dd-2c4df8ee5e91	3214	Zreče
00050000-5605-557b-49ae-069499ac3811	4209	Žabnica
00050000-5605-557b-8294-8d98d652e6a4	3310	Žalec
00050000-5605-557b-c05b-edfe7084c0e0	4228	Železniki
00050000-5605-557b-be0f-c284e9b79dc0	2287	Žetale
00050000-5605-557b-4a35-4e0a38324492	4226	Žiri
00050000-5605-557b-327a-6fdfbdc11cf6	4274	Žirovnica
00050000-5605-557b-cd1f-8bbf1f495e5d	8360	Žužemberk
\.


--
-- TOC entry 3026 (class 0 OID 20776784)
-- Dependencies: 232
-- Data for Name: postavkacdve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkacdve (id, skupina, podskupina, naziv, vrpremiere, vrponovitvepremier, vrponovitveprejsnjih, vrgostovanjazamejstvo, vrfestivali, vrgostovanjaint, vrostalo, programdela_id) FROM stdin;
\.


--
-- TOC entry 2999 (class 0 OID 20776408)
-- Dependencies: 205
-- Data for Name: postavkaracuna; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postavkaracuna (id, racun_id) FROM stdin;
\.


--
-- TOC entry 2980 (class 0 OID 20776188)
-- Dependencies: 186
-- Data for Name: postninaslovi; Type: TABLE DATA; Schema: public; Owner: -
--

COPY postninaslovi (id, klient_id, oseba_id, drzava_id, naziv, nazivdva, ulica, ulicadva, posta, postanaziv, pokrajina, jeeu, privzeti) FROM stdin;
00060000-5605-557d-6cb8-5dba7605d156	00080000-5605-557d-ffa5-dd299ed98236	\N	00040000-5605-557b-dfe7-3757e8ad5212	Narodni dom	\N	Koroška 15	\N	9231	Beltinci	\N	f	t
00060000-5605-557d-2fdf-18404b725af2	00080000-5605-557d-ffa5-dd299ed98236	\N	00040000-5605-557b-dfe7-3757e8ad5212	Korotan	\N	Koroška 22	\N	9231	Beltinci	\N	f	f
00060000-5605-557d-4d32-930b3722f0b7	00080000-5605-557d-8cd8-5295ffbcb11e	\N	00040000-5605-557b-dfe7-3757e8ad5212	Rimljan	\N	Rimska ploščad 7	\N	9231	Beltinci	\N	f	t
\.


--
-- TOC entry 2988 (class 0 OID 20776292)
-- Dependencies: 194
-- Data for Name: predstava; Type: TABLE DATA; Schema: public; Owner: -
--

COPY predstava (id, uprizoritev_id, gostovanje_id, zaporedna, porocilo) FROM stdin;
\.


--
-- TOC entry 3001 (class 0 OID 20776420)
-- Dependencies: 207
-- Data for Name: prodajapredstave; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prodajapredstave (id, sedezni_red_id, dogodek_id) FROM stdin;
\.


--
-- TOC entry 3027 (class 0 OID 20776798)
-- Dependencies: 233
-- Data for Name: produkcijadelitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijadelitev (id, koproducent_id, odstotekfinanciranja, delez, maticnikop, kpe, enotaprograma_id) FROM stdin;
\.


--
-- TOC entry 3028 (class 0 OID 20776808)
-- Dependencies: 234
-- Data for Name: produkcijskahisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY produkcijskahisa (id, popa_id, sifra, status) FROM stdin;
00190000-5605-557d-7f75-c2623bf135c2	00080000-5605-557d-9bee-db735198d4c7	0987	AK
00190000-5605-557d-7388-e71e82b97e58	00080000-5605-557d-8cd8-5295ffbcb11e	0989	AK
00190000-5605-557d-847b-50dbbbb6d08f	00080000-5605-557d-a991-fce00a9a4162	0986	AK
00190000-5605-557d-4cf2-f5707191c9c3	00080000-5605-557d-9cd0-eef6b01437ea	0984	AK
00190000-5605-557d-bf5f-5cb8f1f5436c	00080000-5605-557d-00ee-787e420378f1	0983	AK
00190000-5605-557d-8a5c-a40e3d7bb816	00080000-5605-557d-5294-3d3a49dd738b	0982	AK
00190000-5605-557e-a88e-8f9113175a6f	00080000-5605-557e-4d5a-f32961d61000	1001	AK
\.


--
-- TOC entry 3025 (class 0 OID 20776741)
-- Dependencies: 231
-- Data for Name: programdela; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programdela (id, sifra, naziv, zacetek, konec, zakljuceno, potrjenprogram, stpremier, stint, stfest, strazno, stizjem, stponprem, stponprej, stponprejvelikih, stponprejmalih, stponprejmalihkopr, stponprejsredkopr, stponprejvelikihkopr, stgostujo, vrps1, vrps1do, vrps1mat, vrps1gostovsz, stizvnekomerc, stizvprem, stizvpremdoma, stizvpremkopr, stizvponprem, stizvponpremdoma, stizvponpremzamejo, stizvponpremgost, stizvponpremkopr, stizvponpremint, stizvponpremkoprint, stizvponprej, stizvponprejdoma, stizvponprejzamejo, stizvponprejgost, stizvponprejkopr, stizvponprejint, stizvponprejkoprint, stizvgostuj, stizvostalihnek, stizvgostovanjslo, stizvgostovanjzam, stizvgostovanjint, stobisknekom, stobisknekommat, stobisknekomgostslo, stobisknekomgostzam, stobisknekomgostint, stobiskprem, stobiskpremdoma, stobiskpremkopr, stobiskponprem, stobiskponpremdoma, stobiskponpremkopr, stobiskponpremkoprint, stobiskponpremgost, stobiskponpremzamejo, stobiskponpremint, avgobiskprired, avgzaseddvoran, avgcenavstopnice, stprodvstopnic, stkoprodukcij, stkoprodukcijint, stkoprodukcijnvo, stzaposlenih, stzaposigralcev, avgstnastopovigr, sthonorarnih, sthonorarnihigr, sthonorarnihigrtujjz, sthonorarnihigrsamoz, sredstvaint, sredstvaavt, sredstvazaprosenoprem, sredstvazaprosenoponprem, sredstvazaprosenoponprej, sredstvazaprosenogostujo, sredstvazaprosenoint, sredstvazaprosenofest, sredstvazaprosenorazno, sredstvazaprosenoizjem, sredstvadrugijavniprem, sredstvadrugijavniponprem, sredstvadrugijavniponprej, sredstvadrugijavnigostujo, sredstvadrugijavniint, sredstvadrugijavnifest, sredstvadrugijavnirazno, sredstvadrugijavniizjem, sredstvadrugiviriprem, sredstvadrugiviriponprem, sredstvadrugiviriponprej, sredstvadrugivirigostujo, sredstvadrugiviriint, sredstvadrugivirifest, sredstvadrugivirirazno, sredstvadrugiviriizjem, sredstvaavtsamoz) FROM stdin;
00290000-5605-557d-46b2-5bea82f0b610	0001	Testni program dela	2016-02-01	2017-02-01	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3029 (class 0 OID 20776816)
-- Dependencies: 235
-- Data for Name: programskaenotasklopa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY programskaenotasklopa (id, naslovpe, avtorpe, obsegpe, mesecpe, vrednostpe, obiskdoma, programrazno_id) FROM stdin;
\.


--
-- TOC entry 3005 (class 0 OID 20776449)
-- Dependencies: 211
-- Data for Name: prostor; Type: TABLE DATA; Schema: public; Owner: -
--

COPY prostor (id, popa_id, naslov_id, sifra, naziv, jeprizorisce, jematicnioder, seplanira, kapaciteta, opis) FROM stdin;
00220000-5605-557d-7333-4799088b721f	\N	\N	0001	Poskusna 1	f	\N	t	8	Poskusna učilnica v prvem
00220000-5605-557d-a370-f0710827d678	\N	\N	0002	Poskusna 3	f	\N	f	34	Poskusna učilnica v tretjem
00220000-5605-557d-0cee-c4c7a5a3e7b7	\N	\N	0003	Kazinska	t	\N	t	84	Kazinska dvorana
00220000-5605-557d-e608-59be43c90001	\N	\N	0004	Mali oder	t	\N	t	24	Mali oder 
00220000-5605-557d-ca94-831ad1a3a65f	\N	\N	0005	Komorni oder	t	\N	t	150	Komorni oder
00220000-5605-557d-16d9-4315c556806c	\N	\N	0006	Stara dvorana	t	\N	t	96	Stara dvorana ali dvorana Franceta Prešerna
00220000-5605-557d-ec79-a9b48502ead8	\N	\N	0007	Velika dvorana	t	\N	t	160	Velika, glavna dvorana
\.


--
-- TOC entry 2997 (class 0 OID 20776393)
-- Dependencies: 203
-- Data for Name: racun; Type: TABLE DATA; Schema: public; Owner: -
--

COPY racun (id, kupec_id, prodaja_predstave_id, nacin_placina_id, placilni_instrument_id) FROM stdin;
\.


--
-- TOC entry 2996 (class 0 OID 20776383)
-- Dependencies: 202
-- Data for Name: razpisansedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY razpisansedez (id, postavka_racuna_id, sedez_id, prodaja_predstave_id, rezervacija_id, status) FROM stdin;
\.


--
-- TOC entry 3018 (class 0 OID 20776593)
-- Dependencies: 224
-- Data for Name: rekvizit; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekvizit (id, ime, vrsta, status) FROM stdin;
\.


--
-- TOC entry 3012 (class 0 OID 20776523)
-- Dependencies: 218
-- Data for Name: rekviziterstvo; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rekviziterstvo (id, rekvizit_id, uprizoritev_id, namenuporabe, opispostavitve) FROM stdin;
\.


--
-- TOC entry 2986 (class 0 OID 20776266)
-- Dependencies: 192
-- Data for Name: report; Type: TABLE DATA; Schema: public; Owner: -
--

COPY report (id, job_id, title, filename, transfers, size, format, hash, createdat) FROM stdin;
\.


--
-- TOC entry 2969 (class 0 OID 20776061)
-- Dependencies: 175
-- Data for Name: revizije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY revizije (id, razred, objectid, upor, datum, tip, data) FROM stdin;
1	App\\Entity\\Popa	00080000-5605-557e-4d5a-f32961d61000	00010000-5605-557b-6001-da1580ef4dbf	2015-09-25 16:09:02	INS	a:0:{}
2	App\\Entity\\Option	00000000-5605-557e-1ca6-735dc1cd5c67	00010000-5605-557b-6001-da1580ef4dbf	2015-09-25 16:09:02	INS	a:0:{}
3	ProgramDela\\Entity\\ProdukcijskaHisa	00190000-5605-557e-a88e-8f9113175a6f	00010000-5605-557b-6001-da1580ef4dbf	2015-09-25 16:09:02	INS	a:0:{}
\.


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 174
-- Name: revizije_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('revizije_id_seq', 3, true);


--
-- TOC entry 3006 (class 0 OID 20776462)
-- Dependencies: 212
-- Data for Name: rezervacija; Type: TABLE DATA; Schema: public; Owner: -
--

COPY rezervacija (id, prodaja_predstave_id) FROM stdin;
\.


--
-- TOC entry 2973 (class 0 OID 20776099)
-- Dependencies: 179
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role (id, name, description, builtin) FROM stdin;
00020000-5605-557b-e0be-b4c988ee7c88	administrator-dostopov	Uporavljanje uporabnikov, skupin, vlog in dovoljenj.	t
00020000-5605-557b-4468-778fad499c2c	anonymous	Vloga za javne - neavtenticirane uporabnike	t
00020000-5605-557b-9ac4-c8f82d216382	ifi-all	Polni dostop do vsega v aplikaciji.	t
00020000-5605-557b-e2c1-becc30e09735	ifi-readall	Dostop do vseh -read in -list dovoljenj.	t
00020000-5605-557b-a3c1-0e09fee4e1e5	planer	Planer dogodkov v koledarju	t
00020000-5605-557b-69c3-6b76d7f27e71	kadrovska	Kadrovska služba	t
00020000-5605-557b-9d5d-fcad054aaaf3	arhivar	Ažuriranje arhivalij	t
00020000-5605-557b-9178-a1362dca61c4	igralec	Igralec	t
00020000-5605-557b-bb68-495c72f20580	prisotnost	Vnašalec prisotnosti, tudi za tiste izven uprizoritev	t
00020000-5605-557d-fa29-59cbd4bbb019	vsadovoljenja	Vloga z vsemi posameznimi dovoljenji	t
\.


--
-- TOC entry 2971 (class 0 OID 20776083)
-- Dependencies: 177
-- Data for Name: role2user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY role2user (user_id, role_id) FROM stdin;
00010000-5605-557b-9c87-20bddcc96806	00020000-5605-557b-9ac4-c8f82d216382
00010000-5605-557b-6001-da1580ef4dbf	00020000-5605-557b-9ac4-c8f82d216382
00010000-5605-557d-c7f7-83b714fc9ee0	00020000-5605-557d-fa29-59cbd4bbb019
\.


--
-- TOC entry 3008 (class 0 OID 20776476)
-- Dependencies: 214
-- Data for Name: sedez; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedez (id, vrsta_id, sedezni_red_id, podrocja_sedenja_id, stevilka, oznaka, kakovost, koordinatax, koordinatay, barva) FROM stdin;
\.


--
-- TOC entry 3000 (class 0 OID 20776414)
-- Dependencies: 206
-- Data for Name: sedeznired; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sedeznired (id, kapaciteta, ime) FROM stdin;
\.


--
-- TOC entry 2994 (class 0 OID 20776360)
-- Dependencies: 200
-- Data for Name: sezona; Type: TABLE DATA; Schema: public; Owner: -
--

COPY sezona (id, sifra, ime, zacetek, konec, aktivna) FROM stdin;
\.


--
-- TOC entry 2967 (class 0 OID 20776048)
-- Dependencies: 173
-- Data for Name: stevilcenje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenje (id, sifra, naziv, prefix, suffix, zacetek, dolzina, format, globalno, poletih) FROM stdin;
00230000-5605-557b-397c-b2e1c3ecf114	pri	Privzeto številčenje po letih YYYY-N	\N	\N	1	1	%l-%n	f	t
00230000-5605-557b-d6be-a078e41feac5	123	Privzeto številčenje kratkih šifer	\N	\N	100	3	%n	f	f
00230000-5605-557b-aa02-076801415d64	bcd	Globalno številčenje črtnih kod	\N	\N	1	9	%n	t	f
00230000-5605-557b-c468-db9c74327de0	sif	Številčenje šifrant	\N	\N	1000	4	%n	f	f
00230000-5605-557b-11f4-3711b742f219	tmp	Globalno številčenje začasnih številk	tmp	\N	1000	5	%l%n	t	t
\.


--
-- TOC entry 2966 (class 0 OID 20776040)
-- Dependencies: 172
-- Data for Name: stevilcenjekonfig; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjekonfig (id, stevilcenje_id, dok) FROM stdin;
00240000-5605-557b-6b26-fefcc59b05e7	00230000-5605-557b-c468-db9c74327de0	popa
00240000-5605-557b-9b3e-080e450158d5	00230000-5605-557b-c468-db9c74327de0	oseba
00240000-5605-557b-f4a6-29604c00892e	00230000-5605-557b-c468-db9c74327de0	sezona
00240000-5605-557b-8b21-b42c2175fecc	00230000-5605-557b-d6be-a078e41feac5	prostor
00240000-5605-557b-776e-52539a7b2e78	00230000-5605-557b-c468-db9c74327de0	besedilo
00240000-5605-557b-536e-9823cc593fb1	00230000-5605-557b-c468-db9c74327de0	uprizoritev
00240000-5605-557b-5f3e-8c02f8b145fc	00230000-5605-557b-c468-db9c74327de0	funkcija
00240000-5605-557b-f9a0-59622b5674a9	00230000-5605-557b-c468-db9c74327de0	tipfunkcije
00240000-5605-557b-e827-e49e5d6b3d9b	00230000-5605-557b-c468-db9c74327de0	alternacija
00240000-5605-557b-411d-7c2836b86191	00230000-5605-557b-397c-b2e1c3ecf114	pogodba
00240000-5605-557b-fe3d-df5d7dd78ee4	00230000-5605-557b-c468-db9c74327de0	zaposlitev
00240000-5605-557b-54f7-0cbbf051679d	00230000-5605-557b-c468-db9c74327de0	zvrstuprizoritve
00240000-5605-557b-cfd7-a30aff31b6a3	00230000-5605-557b-397c-b2e1c3ecf114	programdela
00240000-5605-557b-7d08-92473c3be686	00230000-5605-557b-c468-db9c74327de0	zapis
\.


--
-- TOC entry 2965 (class 0 OID 20776035)
-- Dependencies: 171
-- Data for Name: stevilcenjestanje; Type: TABLE DATA; Schema: public; Owner: -
--

COPY stevilcenjestanje (id, objid, leto, stevilka) FROM stdin;
07f9b020-6e6f-4aba-b41e-64285084208f	00240000-5605-557b-6b26-fefcc59b05e7	0	1001
\.


--
-- TOC entry 3014 (class 0 OID 20776540)
-- Dependencies: 220
-- Data for Name: strosekuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY strosekuprizoritve (id, uprizoritev_id, popa_id, naziv, vrednostdo, vrednostna, opis, tipstroska, sort, vrstastroska_id) FROM stdin;
00270000-5605-557d-b41b-2aa906cd2629	000e0000-5605-557d-01df-917745ad4111	00080000-5605-557d-ffa5-dd299ed98236	Nabava kostumov	600.50	20.00	Krila in maske	materialni	1	003b0000-5605-557b-be8a-7cdfba108550
00270000-5605-557d-8a75-cfcb8b4a297c	000e0000-5605-557d-01df-917745ad4111	00080000-5605-557d-ffa5-dd299ed98236	Zavese	125.70	3.10	Modra in zelena zavesa	materialni	2	003b0000-5605-557b-be8a-7cdfba108550
\.


--
-- TOC entry 2978 (class 0 OID 20776161)
-- Dependencies: 184
-- Data for Name: telefonska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY telefonska (id, oseba_id, popa_id, vrsta, stevilka, privzeta) FROM stdin;
\.


--
-- TOC entry 2995 (class 0 OID 20776370)
-- Dependencies: 201
-- Data for Name: terminstoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY terminstoritve (id, dogodek_id, alternacija_id, oseba_id, planiranzacetek, planirankonec, zacetek, konec, planiranotraja) FROM stdin;
001a0000-5605-557d-efba-95760f27bde9	00180000-5605-557d-ea3b-0f7945069879	000c0000-5605-557d-43d5-bd601d1969f5	00090000-5605-557d-a387-f54c7f88fb29	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-557d-26f2-47cb61c65a70	00180000-5605-557d-ea3b-0f7945069879	000c0000-5605-557d-053e-b8539787bad1	00090000-5605-557d-ecd3-dfcd84d612d6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-557d-ab87-afc2e4a11141	00180000-5605-557d-ea3b-0f7945069879	000c0000-5605-557d-4cc6-e7d9467dc373	00090000-5605-557d-e8fe-8146fd38b9a6	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-557d-59aa-3e605a53b787	00180000-5605-557d-ea3b-0f7945069879	000c0000-5605-557d-8323-1c633abc83a7	00090000-5605-557d-855b-ed75d2a3040a	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-557d-a6bd-b89918cdb118	00180000-5605-557d-ea3b-0f7945069879	000c0000-5605-557d-62aa-2af64108e9ab	00090000-5605-557d-8ed7-800971e0633c	2015-06-26 10:00:00	2015-06-26 10:00:00	\N	\N	2.00
001a0000-5605-557d-64a6-a9f43d8223aa	00180000-5605-557d-af80-0f02fc262648	\N	00090000-5605-557d-8ed7-800971e0633c	2015-08-01 20:00:00	2015-08-01 23:00:00	\N	\N	2.00
\.


--
-- TOC entry 3017 (class 0 OID 20776581)
-- Dependencies: 223
-- Data for Name: tipfunkcije; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipfunkcije (id, sifra, ime, opis, imezenski, podrocje, sort) FROM stdin;
000f0000-5605-557b-6cb4-38d7c006cc7c	01	Avtor	Avtorji	Avtorka	umetnik	150
000f0000-5605-557b-2726-6fc8c73f052a	02	Priredba	Priredba	Priredba	umetnik	160
000f0000-5605-557b-c755-bb056999a144	03	Prevod	Prevod	Prevod	umetnik	20
000f0000-5605-557b-2a91-afe670fa56a1	04	Režija	Režija	Režija	umetnik	30
000f0000-5605-557b-06a1-d5c0cfba3a83	05	Dramaturgija	Dramaturgija	Dramaturgija	umetnik	40
000f0000-5605-557b-d689-f6bf5b63a998	06	Scenografija	Scenografija	Scenografija	umetnik	60
000f0000-5605-557b-2f8c-5934b71b7996	07	Kostumografija	Kostumografija	Kostumografija	umetnik	70
000f0000-5605-557b-3f0f-1ac2ee16fb86	08	Koreografija	Koreografija	Koreografija	umetnik	90
000f0000-5605-557b-1637-8eb19a2aa384	09	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	Oblikovanje svetlobe in zvoka	umetnik	100
000f0000-5605-557b-bc36-02cf83f955fc	10	Oblikovanje maske	Oblikovanje maske	Oblikovanje maske	umetnik	110
000f0000-5605-557b-ffa8-7165db669e85	11	Lektorstvo	Lektorstvo	Lektorstvo	umetnik	50
000f0000-5605-557b-14b8-8070c645c514	12	Glasbeni soustvarjalec	Glasbeni soustvarjalci	Glasbena soustvarjalka	umetnik	80
000f0000-5605-557b-147b-9be6dd01a72b	13	Intermedijski ustvarjalec	Intermedijski ustvarjalci	Intermedijski ustvarjalka	umetnik	130
000f0000-5605-557b-ba94-6a789db4d646	14	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	Posebni efekti -izvedba in svetovanje	umetnik	120
000f0000-5605-557b-e314-0b1f3bf6236b	15	Vloga	Intermedijski ustvarjalci	Intermedijska ustvarjalka	igralec	10
000f0000-5605-557b-6805-b1b36eb1f111	16	Produkcija, mentorstvo	Produkcija, mentorstvo	Produkcija, mentorstvo	umetnik	140
000f0000-5605-557b-05d1-62d5c08b00c9	17	Tehnična podpora	Tehnična podpora	Tehnična podpora	tehnik	180
000f0000-5605-557b-c5c1-940d3a05204a	18	Inšpicient	Inšpicienti	Inšpicientka	inspicient	170
\.


--
-- TOC entry 3030 (class 0 OID 20776827)
-- Dependencies: 236
-- Data for Name: tipprogramskeenote; Type: TABLE DATA; Schema: public; Owner: -
--

COPY tipprogramskeenote (id, sifra, naziv, koprodukcija, maxfaktor, maxvsi) FROM stdin;
002b0000-5605-557b-2578-0895eb03651b	01	Velika predstava	f	1.00	1.00
002b0000-5605-557b-2a1c-3168b8ebfd45	02	Mala predstava	f	0.50	0.50
002b0000-5605-557b-b360-ffd70eaa0119	03	Mala koprodukcija	t	0.40	1.00
002b0000-5605-557b-f7d7-f4e80200d742	04	Srednja koprodukcija	t	0.70	2.00
002b0000-5605-557b-6aa4-b2afd82ee93e	05	Velika koprodukcija	t	1.00	3.00
\.


--
-- TOC entry 2983 (class 0 OID 20776223)
-- Dependencies: 189
-- Data for Name: trr; Type: TABLE DATA; Schema: public; Owner: -
--

COPY trr (id, popa_id, oseba_id, stevilka, swift, bic, banka) FROM stdin;
\.


--
-- TOC entry 2970 (class 0 OID 20776070)
-- Dependencies: 176
-- Data for Name: uporabniki; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uporabniki (id, name, password, enabled, expires, defaultroute, defaultrouteparams, email, lastlogon, passresttoken, tokenexpires) FROM stdin;
00010000-5605-557b-6001-da1580ef4dbf	Konzolni	$2y$05$NS4xMjkyMTcwMzExMjAxROaQznZgB08aut7FNpf3SXn29na0kVCLC	t	\N	\N	\N	console@ifigenija.si	\N	\N	\N
00010000-5605-557d-77a2-dbf76b67f7d8	testni uporabnik za inšpicienta	$2y$05$NS4xMjkyMTcwMzExMjAxROxkJ1B6xAXex6EZLIwJfWzRJ8DpfecFO	t	\N	\N	\N	ivo@ifigenija.si	\N	\N	\N
00010000-5605-557d-8f9d-835222168337	testni uporabnik za Tehničnega vodjo	$2y$05$NS4xMjkyMTcwMzExMjAxROu/kXWR9sP9oamkesKuxXLbxkCb387.G	t	\N	\N	\N	tona@ifigenija.si	\N	\N	\N
00010000-5605-557d-9efc-29178488af88	testni uporabnik za igralca	$2y$05$NS4xMjkyMTcwMzExMjAxRO/hLCgClfERRsfCAFYwxNCcFIVjP2982	t	\N	\N	\N	irena@ifigenija.si	\N	\N	\N
00010000-5605-557d-bd72-d17889c575c0	testni uporabnik vnašalca termina storitev (TerminStoritve-vse)	$2y$05$NS4xMjkyMTcwMzExMjAxROT6.kTHqEq4.wa2SOnf124/N14m9qeP.	t	\N	\N	\N	tatjana@ifigenija.si	\N	\N	\N
00010000-5605-557d-a6b8-4dc91fbd76ef	testni uporabnik, ki je inšpicient brez zapisov v TerminStoritve	$2y$05$NS4xMjkyMTcwMzExMjAxROHau47Dtb7CME5.nlWwBVM.nusFP.ra2	t	\N	\N	\N	joze@ifigenija.si	\N	\N	\N
00010000-5605-557d-1576-5a505c65c1ac	testna uporabnica, ki je planerka	$2y$05$NS4xMjkyMTcwMzExMjAxRO.B/uJO3C7QRNhdX9Q2hTLQsSupj1V1S	t	\N	\N	\N	petra@ifigenija.si	\N	\N	\N
00010000-5605-557d-ff3e-97e62d5ef5b8	testni uporabnik, ki dobi ifi-all vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROv2d7jqhaV/Mz3EIsKoi7UoFR.SDSMBm	t	\N	\N	\N	ali@ifigenija.si	\N	\N	\N
00010000-5605-557d-5b1f-32b8aa167130	testni uporabnik, ki dobi ifi-readall vlogo	$2y$05$NS4xMjkyMTcwMzExMjAxROYB9g.gnkufr1l/gWK6mkx.ySqrOWnJC	t	\N	\N	\N	berta@ifigenija.si	\N	\N	\N
00010000-5605-557d-a0f1-3a7f792f9f2a	testni uporabnik, ki dobi aaa-write dovoljenje	$2y$05$NS4xMjkyMTcwMzExMjAxRORujYObKX.DzpXVYbePkiJkHqg0/Ylya	t	\N	\N	\N	aaron@ifigenija.si	\N	\N	\N
00010000-5605-557d-c7f7-83b714fc9ee0	testni uporabnik ki dobi vsa posamezna dovoljenja	$2y$05$NS4xMjkyMTcwMzExMjAxRO2ymwxVXTr7U4Ncdn.bN49E8rLw9Jg0O	t	\N	\N	\N	vesna@ifigenija.si	\N	\N	\N
00010000-5605-557b-9c87-20bddcc96806	Administrator	$2y$05$NS4xMjkyMTcwMzExMjAxROvZ3ZK1rCz1z6kWFFbQn0D.v3kzLt6iq	t	\N	\N	\N	admin@ifigenija.si	\N	\N	\N
\.


--
-- TOC entry 3021 (class 0 OID 20776631)
-- Dependencies: 227
-- Data for Name: uprizoritev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY uprizoritev (id, besedilo_id, zvrst_uprizoritve_id, zvrst_surs_id, producent_id, sifra, faza, naslov, podnaslov, delovninaslov, internacionalninaslov, naslovizvirnika, podnaslovizvirnika, datumzacstudija, stevilovaj, planiranostevilovaj, datumpremiere, stodmorov, avtor, gostujoca, trajanje, opis, arhident, arhopomba, datumzakljucka, sloavtor, krstna, prvaslovenska, kratkinaslov, jekoprodukcija, maticnioder_id) FROM stdin;
000e0000-5605-557d-b1fe-d1b1c8e8fe00	00160000-5605-557d-304c-ff51bc0145ff	\N	00140000-5605-557b-88e2-2ac6f09e3ed5	\N	0001	produkcija	Sen kresne noči		Sanje	\N	\N	\N	2016-02-01	\N	\N	2016-06-01	1	\N	f	2				\N	f	\N	\N		\N	00220000-5605-557d-ca94-831ad1a3a65f
000e0000-5605-557d-01df-917745ad4111	00160000-5605-557d-8ba1-fd46e8647d19	\N	00140000-5605-557b-4c3a-ef896aff9630	\N	0002	predprodukcija-ideja	Smoletov vrt			\N	\N	\N	2016-01-01	\N	\N	2016-04-20	2	\N	f	2				\N	f	\N	\N		\N	00220000-5605-557d-16d9-4315c556806c
000e0000-5605-557d-6395-26ccbc7d2ed3	\N	\N	00140000-5605-557b-4c3a-ef896aff9630	00190000-5605-557d-7f75-c2623bf135c2	0003	postprodukcija	Kisli maček			\N	\N	\N	2016-02-01	\N	\N	2016-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-557d-ca94-831ad1a3a65f
000e0000-5605-557d-b72f-a5701914576b	\N	\N	00140000-5605-557b-4c3a-ef896aff9630	00190000-5605-557d-7f75-c2623bf135c2	0004	postprodukcija	Vladimir			\N	\N	\N	2017-03-01	\N	\N	2017-04-20	2	\N	t	2				\N	f	\N	\N		\N	00220000-5605-557d-ca94-831ad1a3a65f
000e0000-5605-557d-4a79-d11da32e3895	\N	\N	00140000-5605-557b-4c3a-ef896aff9630	00190000-5605-557d-7f75-c2623bf135c2	0005	postprodukcija	Španska princesa			\N	\N	\N	2017-04-01	\N	\N	2017-05-20	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-557d-7333-4799088b721f
000e0000-5605-557d-0e21-d150762f633d	\N	\N	00140000-5605-557b-4c3a-ef896aff9630	00190000-5605-557d-7f75-c2623bf135c2	0006	postprodukcija	Ne vemo datumov			\N	\N	\N	\N	\N	\N	\N	1	\N	f	1				\N	f	\N	\N		\N	00220000-5605-557d-7333-4799088b721f
\.


--
-- TOC entry 2990 (class 0 OID 20776313)
-- Dependencies: 196
-- Data for Name: vaja; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vaja (id, uprizoritev_id, vrsta, zaporedna, porocilo) FROM stdin;
00200000-5605-557d-d28c-665eacbbd95d	000e0000-5605-557d-01df-917745ad4111	\N	1	
00200000-5605-557d-cba0-20dc70755b71	000e0000-5605-557d-01df-917745ad4111	\N	2	
00200000-5605-557d-33ea-a4000e1b3458	000e0000-5605-557d-01df-917745ad4111	\N	3	
00200000-5605-557d-14da-7d19098576ff	000e0000-5605-557d-01df-917745ad4111	\N	4	
00200000-5605-557d-2fb2-b80d40300896	000e0000-5605-557d-01df-917745ad4111	\N	5	
\.


--
-- TOC entry 3004 (class 0 OID 20776441)
-- Dependencies: 210
-- Data for Name: vrstasedezev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstasedezev (id, podrocja_sedenja_id, kapaciteta, poravnava, oblika) FROM stdin;
\.


--
-- TOC entry 3015 (class 0 OID 20776554)
-- Dependencies: 221
-- Data for Name: vrstastroska; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstastroska (id, skupina, podskupina, naziv, opis) FROM stdin;
003b0000-5605-557b-5e8d-a3b82abeb016	1	0	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE	PISARNIŠKI IN SPLOŠNI  MATERIAL IN STORITVE
003b0000-5605-557b-3390-44362692f383	1	1	Storitve varovanja zgradb in prostorov	storitve varovanja zgradb in prostorov (npr. gasilci na predstavah)
003b0000-5605-557b-4f83-bcf731995b79	1	2	Založniške in tiskarske storitve	založniške in tiskarske storitve
003b0000-5605-557b-1d58-0bd11fa249e6	1	3	Časopisi, revije, knjige in strokovna literatura	časopisi, revije, knjige in strokovna literatura
003b0000-5605-557b-37f2-ac18afef9e7c	1	4	Stroški prevajalskih storitev	stroški prevajalskih storitev
003b0000-5605-557b-189e-92fb7a982baf	1	5	Stroški oglaševalskih storitev	stroški oglaševalskih storitev
003b0000-5605-557b-3ab4-20be4da521a4	1	6	Izdatki za reprezentanco	izdatki za reprezentanco
003b0000-5605-557b-2250-2741aeedb9cf	2	0	POSEBNI MATERIAL IN STORITVE	POSEBNI MATERIAL IN STORITVE
003b0000-5605-557b-be8a-7cdfba108550	2	1	Drugi posebni material in storitve	drugi posebni material in storitve (npr. za instrumete - navedite)
003b0000-5605-557b-74b0-ec4c7fe8407c	2	2	Oprema predstave – stroški rekvizitov	Oprema predstave – stroški rekvizitov
003b0000-5605-557b-f54b-42ea5584a92a	2	3	Oprema predstave – stroški kostumov	Oprema predstave – stroški kostumov
003b0000-5605-557b-06d9-38801bf2b417	2	4	Oprema predstave – stroški scenske opreme	Oprema predstave – stroški scenske opreme
003b0000-5605-557b-c64a-9469d89ea75e	2	5	Oprema predstave – stroški avdio in video opreme	Oprema predstave – stroški avdio in video opreme
003b0000-5605-557b-80d0-b7ffe5a79de6	3	0	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE	ENERGIJA, VODA, KOMUNALNE STORITVE IN KOMUNIKACIJE
003b0000-5605-557b-fa9b-84314fa2f60f	3	1	Poštnina in kurirske storitve	poštnina in kurirske storitve
003b0000-5605-557b-c6ef-1bebcf7623b3	4	0	PREVOZNI STROŠKI IN STORITVE	PREVOZNI STROŠKI IN STORITVE
003b0000-5605-557b-acad-9b9709109efe	4	1	Goriva in maziva za prevozna sredstva	goriva in maziva za prevozna sredstva
003b0000-5605-557b-bacc-39805aabb46a	4	2	Najem vozil in selitveni stroški	najem vozil in selitveni stroški
003b0000-5605-557b-2eea-3801982b7384	4	3	Drugi prevozni in transportni stroški 	drugi prevozni in transportni stroški (navedite)
003b0000-5605-557b-e594-bbad63dd5366	5	0	IZDATKI ZA SLUŽBENA POTOVANJA	IZDATKI ZA SLUŽBENA POTOVANJA
003b0000-5605-557b-f9d5-e295ef4ec00f	5	1	Dnevnice za službena potovanja v državi in tujini	dnevnice za službena potovanja v državi in tujini
003b0000-5605-557b-ea48-32988c9178cb	5	2	Hotelske in restavra. storitve v državi in tujini	hotelske in restavra. storitve v državi in tujini
003b0000-5605-557b-3c3a-88bacd16df09	5	3	Stroški prevoza v državi in tujini	stroški prevoza v državi in tujini
003b0000-5605-557b-1efc-2daafe8b182c	5	4	Drugi izdatki za službena potovanja	drugi izdatki za službena potovanja (navedite)
003b0000-5605-557b-fc21-8a90fa38c2b7	6	0	NAJEMNINE IN ZAKUPNINE	NAJEMNINE IN ZAKUPNINE
003b0000-5605-557b-b84a-9d28456648cd	6	1	Druge najemnine, zakupnine in licenčnine	druge najemnine, zakupnine in licenčnine (npr. najem notnega materiala, instrumentov - navedite)
003b0000-5605-557b-db6e-15fc606513f2	7	0	DRUGI OPERATIVNI ODHODKI	DRUGI OPERATIVNI ODHODKI
003b0000-5605-557b-3aa3-1caecc95eef9	7	1	Izdatki za strok. izobraževanje zap.	izdatki za strok. izobraževanje zap.(vezani na program. enote)  
\.


--
-- TOC entry 3033 (class 0 OID 20776874)
-- Dependencies: 239
-- Data for Name: vrstazapisa; Type: TABLE DATA; Schema: public; Owner: -
--

COPY vrstazapisa (id, oznaka, naziv, aktiven, znacka, ikona, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3032 (class 0 OID 20776846)
-- Dependencies: 238
-- Data for Name: zapis; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapis (id, vrsta_id, datoteka_id, mapa_id, avtor_id, zaklenil_id, tip, zaklenjen, datumzaklepanja, identifier, subject, title, description, coverage, creator, language, date, publisher, relation, rights, source, upor, datknj, standard, lokacija) FROM stdin;
\.


--
-- TOC entry 3034 (class 0 OID 20776886)
-- Dependencies: 240
-- Data for Name: zapislastnik; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zapislastnik (id, zapis_id, lastnik, classlastnika, datum, upor, datknj) FROM stdin;
\.


--
-- TOC entry 3011 (class 0 OID 20776513)
-- Dependencies: 217
-- Data for Name: zaposlitev; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zaposlitev (id, oseba_id, sifra, status, delovnomesto, zacetek, konec, tip, delovnaobveza, malica, izmenskodelo, individualnapogodba, jezaposlenvdrugemjz, jenastopajoci) FROM stdin;
00100000-5605-557d-26cb-580422515a9e	00090000-5605-557d-ecd3-dfcd84d612d6	0010	A	Mojster	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-557d-85e1-e93b2d310590	00090000-5605-557d-e8fe-8146fd38b9a6	0003	A	Igralec	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-557d-de2a-ab1617db77ca	00090000-5605-557d-68e6-9ade915e83cc	0008	A	Natakar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-557d-793a-108aa7ffe67e	00090000-5605-557d-d78e-de0fb521b367	0004	A	Mizar	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-557d-46bd-bcaf8a48f51f	00090000-5605-557d-a387-f54c7f88fb29	0009	A	Šivilja	2010-02-01	\N	1	2		t	f	f	t
00100000-5605-557d-ea61-bc0b87e9083d	00090000-5605-557d-1dbe-427cd043f2ab	0007	A	Inšpicient	2010-02-01	\N	1	2		t	f	f	t
\.


--
-- TOC entry 2992 (class 0 OID 20776349)
-- Dependencies: 198
-- Data for Name: zasedenost; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zasedenost (id, oseba_id) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 20776621)
-- Dependencies: 226
-- Data for Name: zvrstsurs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstsurs (id, sifra, naziv, opis) FROM stdin;
00140000-5605-557b-88e2-2ac6f09e3ed5	01	Drama	drama (SURS 01)
00140000-5605-557b-ef8a-01b46bf5d8d6	02	Opera	opera (SURS 02)
00140000-5605-557b-871b-d1fe0a8680cc	03	Balet	balet (SURS 03)
00140000-5605-557b-a626-f728ee050ded	04	Plesne prireditve	plesne prireditve (SURS 04)
00140000-5605-557b-3793-6ad7def50760	05	Lutkovno gledališče	lutkovno gledališče (SURS 05)
00140000-5605-557b-4c3a-ef896aff9630	06	Raziskovalno gledališče	raziskovalno gledališče (SURS 06)
00140000-5605-557b-d719-a0caf4e2fa10	07	Drugo	drugo (SURS 07)
\.


--
-- TOC entry 3010 (class 0 OID 20776503)
-- Dependencies: 216
-- Data for Name: zvrstuprizoritve; Type: TABLE DATA; Schema: public; Owner: -
--

COPY zvrstuprizoritve (id, sifra, naziv, opis) FROM stdin;
\.


--
-- TOC entry 2497 (class 2606 OID 20776124)
-- Name: abonma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY abonma
    ADD CONSTRAINT abonma_pkey PRIMARY KEY (id);


--
-- TOC entry 2689 (class 2606 OID 20776680)
-- Name: alternacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT alternacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2685 (class 2606 OID 20776670)
-- Name: arhivalija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT arhivalija_pkey PRIMARY KEY (id);


--
-- TOC entry 2648 (class 2606 OID 20776537)
-- Name: avtorbesedila_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT avtorbesedila_pkey PRIMARY KEY (id);


--
-- TOC entry 2659 (class 2606 OID 20776579)
-- Name: besedilo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY besedilo
    ADD CONSTRAINT besedilo_pkey PRIMARY KEY (id);


--
-- TOC entry 2746 (class 2606 OID 20776926)
-- Name: datoteka_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT datoteka_pkey PRIMARY KEY (id);


--
-- TOC entry 2560 (class 2606 OID 20776338)
-- Name: dogodek_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT dogodek_pkey PRIMARY KEY (id);


--
-- TOC entry 2575 (class 2606 OID 20776359)
-- Name: dogodeksplosni_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodeksplosni
    ADD CONSTRAINT dogodeksplosni_pkey PRIMARY KEY (id);


--
-- TOC entry 2722 (class 2606 OID 20776844)
-- Name: drugivir_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT drugivir_pkey PRIMARY KEY (id);


--
-- TOC entry 2531 (class 2606 OID 20776249)
-- Name: drza_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drza
    ADD CONSTRAINT drza_pkey PRIMARY KEY (id);


--
-- TOC entry 2696 (class 2606 OID 20776735)
-- Name: enotaprograma_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT enotaprograma_pkey PRIMARY KEY (id);


--
-- TOC entry 2633 (class 2606 OID 20776499)
-- Name: funkcija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT funkcija_pkey PRIMARY KEY (id);


--
-- TOC entry 2554 (class 2606 OID 20776311)
-- Name: gostovanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT gostovanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2548 (class 2606 OID 20776287)
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 2539 (class 2606 OID 20776263)
-- Name: kontaktnaoseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT kontaktnaoseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2597 (class 2606 OID 20776406)
-- Name: kupec_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT kupec_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 20776903)
-- Name: mapa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT mapa_pkey PRIMARY KEY (id);


--
-- TOC entry 2744 (class 2606 OID 20776910)
-- Name: mapa_zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT mapa_zapis_pkey PRIMARY KEY (mapa_id, zapis_id);


--
-- TOC entry 2751 (class 2606 OID 20776934)
-- Name: mapaacl_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT mapaacl_pkey PRIMARY KEY (id);


--
-- TOC entry 2469 (class 2606 OID 20579803)
-- Name: migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (version);


--
-- TOC entry 2609 (class 2606 OID 20776433)
-- Name: nacinplacina_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY nacinplacina
    ADD CONSTRAINT nacinplacina_pkey PRIMARY KEY (id);


--
-- TOC entry 2524 (class 2606 OID 20776221)
-- Name: option_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY option
    ADD CONSTRAINT option_pkey PRIMARY KEY (id);


--
-- TOC entry 2501 (class 2606 OID 20776133)
-- Name: optionvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT optionvalue_pkey PRIMARY KEY (id);


--
-- TOC entry 2504 (class 2606 OID 20776157)
-- Name: oseba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT oseba_pkey PRIMARY KEY (id);


--
-- TOC entry 2495 (class 2606 OID 20776113)
-- Name: permission2role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT permission2role_pkey PRIMARY KEY (role_id, permission_id);


--
-- TOC entry 2488 (class 2606 OID 20776098)
-- Name: permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission
    ADD CONSTRAINT permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2612 (class 2606 OID 20776439)
-- Name: placilniinstrument_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT placilniinstrument_pkey PRIMARY KEY (id);


--
-- TOC entry 2626 (class 2606 OID 20776475)
-- Name: podrocjesedenja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY podrocjesedenja
    ADD CONSTRAINT podrocjesedenja_pkey PRIMARY KEY (id);


--
-- TOC entry 2671 (class 2606 OID 20776616)
-- Name: pogodba_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT pogodba_pkey PRIMARY KEY (id);


--
-- TOC entry 2513 (class 2606 OID 20776185)
-- Name: popa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT popa_pkey PRIMARY KEY (id);


--
-- TOC entry 2521 (class 2606 OID 20776209)
-- Name: posta_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY posta
    ADD CONSTRAINT posta_pkey PRIMARY KEY (id);


--
-- TOC entry 2706 (class 2606 OID 20776796)
-- Name: postavkacdve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT postavkacdve_pkey PRIMARY KEY (id);


--
-- TOC entry 2601 (class 2606 OID 20776412)
-- Name: postavkaracuna_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT postavkaracuna_pkey PRIMARY KEY (id);


--
-- TOC entry 2519 (class 2606 OID 20776199)
-- Name: postninaslovi_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT postninaslovi_pkey PRIMARY KEY (id);


--
-- TOC entry 2552 (class 2606 OID 20776299)
-- Name: predstava_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT predstava_pkey PRIMARY KEY (id);


--
-- TOC entry 2607 (class 2606 OID 20776424)
-- Name: prodajapredstave_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT prodajapredstave_pkey PRIMARY KEY (id);


--
-- TOC entry 2710 (class 2606 OID 20776805)
-- Name: produkcijadelitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT produkcijadelitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2712 (class 2606 OID 20776813)
-- Name: produkcijskahisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT produkcijskahisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 20776783)
-- Name: programdela_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programdela
    ADD CONSTRAINT programdela_pkey PRIMARY KEY (id);


--
-- TOC entry 2717 (class 2606 OID 20776825)
-- Name: programskaenotasklopa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT programskaenotasklopa_pkey PRIMARY KEY (id);


--
-- TOC entry 2619 (class 2606 OID 20776457)
-- Name: prostor_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT prostor_pkey PRIMARY KEY (id);


--
-- TOC entry 2595 (class 2606 OID 20776397)
-- Name: racun_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT racun_pkey PRIMARY KEY (id);


--
-- TOC entry 2589 (class 2606 OID 20776388)
-- Name: razpisansedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT razpisansedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2666 (class 2606 OID 20776603)
-- Name: rekvizit_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekvizit
    ADD CONSTRAINT rekvizit_pkey PRIMARY KEY (id);


--
-- TOC entry 2646 (class 2606 OID 20776530)
-- Name: rekviziterstvo_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT rekviziterstvo_pkey PRIMARY KEY (id);


--
-- TOC entry 2542 (class 2606 OID 20776275)
-- Name: report_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT report_pkey PRIMARY KEY (id);


--
-- TOC entry 2480 (class 2606 OID 20776069)
-- Name: revizije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY revizije
    ADD CONSTRAINT revizije_pkey PRIMARY KEY (id);


--
-- TOC entry 2624 (class 2606 OID 20776466)
-- Name: rezervacija_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT rezervacija_pkey PRIMARY KEY (id);


--
-- TOC entry 2486 (class 2606 OID 20776087)
-- Name: role2user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT role2user_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 2490 (class 2606 OID 20776107)
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 2631 (class 2606 OID 20776484)
-- Name: sedez_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT sedez_pkey PRIMARY KEY (id);


--
-- TOC entry 2603 (class 2606 OID 20776419)
-- Name: sedeznired_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedeznired
    ADD CONSTRAINT sedeznired_pkey PRIMARY KEY (id);


--
-- TOC entry 2577 (class 2606 OID 20776368)
-- Name: sezona_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sezona
    ADD CONSTRAINT sezona_pkey PRIMARY KEY (id);


--
-- TOC entry 2477 (class 2606 OID 20776057)
-- Name: stevilcenje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenje
    ADD CONSTRAINT stevilcenje_pkey PRIMARY KEY (id);


--
-- TOC entry 2474 (class 2606 OID 20776045)
-- Name: stevilcenjekonfig_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT stevilcenjekonfig_pkey PRIMARY KEY (id);


--
-- TOC entry 2471 (class 2606 OID 20776039)
-- Name: stevilcenjestanje_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjestanje
    ADD CONSTRAINT stevilcenjestanje_pkey PRIMARY KEY (id);


--
-- TOC entry 2655 (class 2606 OID 20776550)
-- Name: strosekuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT strosekuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2510 (class 2606 OID 20776166)
-- Name: telefonska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT telefonska_pkey PRIMARY KEY (id);


--
-- TOC entry 2583 (class 2606 OID 20776379)
-- Name: terminstoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT terminstoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2662 (class 2606 OID 20776590)
-- Name: tipfunkcije_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipfunkcije
    ADD CONSTRAINT tipfunkcije_pkey PRIMARY KEY (id);


--
-- TOC entry 2719 (class 2606 OID 20776837)
-- Name: tipprogramskeenote_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tipprogramskeenote
    ADD CONSTRAINT tipprogramskeenote_pkey PRIMARY KEY (id);


--
-- TOC entry 2529 (class 2606 OID 20776234)
-- Name: trr_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT trr_pkey PRIMARY KEY (id);


--
-- TOC entry 2482 (class 2606 OID 20776082)
-- Name: uporabniki_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uporabniki
    ADD CONSTRAINT uporabniki_pkey PRIMARY KEY (id);


--
-- TOC entry 2683 (class 2606 OID 20776649)
-- Name: uprizoritev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT uprizoritev_pkey PRIMARY KEY (id);


--
-- TOC entry 2558 (class 2606 OID 20776321)
-- Name: vaja_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT vaja_pkey PRIMARY KEY (id);


--
-- TOC entry 2615 (class 2606 OID 20776447)
-- Name: vrstasedezev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT vrstasedezev_pkey PRIMARY KEY (id);


--
-- TOC entry 2657 (class 2606 OID 20776562)
-- Name: vrstastroska_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstastroska
    ADD CONSTRAINT vrstastroska_pkey PRIMARY KEY (id);


--
-- TOC entry 2733 (class 2606 OID 20776884)
-- Name: vrstazapisa_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstazapisa
    ADD CONSTRAINT vrstazapisa_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 20776868)
-- Name: zapis_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT zapis_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 20776892)
-- Name: zapislastnik_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT zapislastnik_pkey PRIMARY KEY (id);


--
-- TOC entry 2642 (class 2606 OID 20776521)
-- Name: zaposlitev_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT zaposlitev_pkey PRIMARY KEY (id);


--
-- TOC entry 2573 (class 2606 OID 20776353)
-- Name: zasedenost_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT zasedenost_pkey PRIMARY KEY (id);


--
-- TOC entry 2675 (class 2606 OID 20776629)
-- Name: zvrstsurs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstsurs
    ADD CONSTRAINT zvrstsurs_pkey PRIMARY KEY (id);


--
-- TOC entry 2639 (class 2606 OID 20776511)
-- Name: zvrstuprizoritve_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zvrstuprizoritve
    ADD CONSTRAINT zvrstuprizoritve_pkey PRIMARY KEY (id);


--
-- TOC entry 2561 (class 1259 OID 20776347)
-- Name: dogodki_konec; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_konec ON dogodek USING btree (konec);


--
-- TOC entry 2562 (class 1259 OID 20776348)
-- Name: dogodki_razred; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_razred ON dogodek USING btree (razred);


--
-- TOC entry 2563 (class 1259 OID 20776346)
-- Name: dogodki_zacetek; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX dogodki_zacetek ON dogodek USING btree (zacetek);


--
-- TOC entry 2564 (class 1259 OID 20776345)
-- Name: idx_11e93b5d3a0e32e3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5d3a0e32e3 ON dogodek USING btree (sezona_id);


--
-- TOC entry 2565 (class 1259 OID 20776344)
-- Name: idx_11e93b5dcc3aa562; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11e93b5dcc3aa562 ON dogodek USING btree (prostor_id);


--
-- TOC entry 2651 (class 1259 OID 20776551)
-- Name: idx_11ffe6e05c75296c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e05c75296c ON strosekuprizoritve USING btree (vrstastroska_id);


--
-- TOC entry 2652 (class 1259 OID 20776552)
-- Name: idx_11ffe6e062b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e062b4ffca ON strosekuprizoritve USING btree (uprizoritev_id);


--
-- TOC entry 2653 (class 1259 OID 20776553)
-- Name: idx_11ffe6e06beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_11ffe6e06beede51 ON strosekuprizoritve USING btree (popa_id);


--
-- TOC entry 2737 (class 1259 OID 20776905)
-- Name: idx_14a5d6d3727aca70; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d3727aca70 ON mapa USING btree (parent_id);


--
-- TOC entry 2738 (class 1259 OID 20776904)
-- Name: idx_14a5d6d38a4a6c12; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_14a5d6d38a4a6c12 ON mapa USING btree (lastnik_id);


--
-- TOC entry 2511 (class 1259 OID 20776187)
-- Name: idx_1c7adba5ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1c7adba5ee4b985a ON popa USING btree (drzava_id);


--
-- TOC entry 2610 (class 1259 OID 20776440)
-- Name: idx_1df2e9faa420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1df2e9faa420584d ON placilniinstrument USING btree (nacin_placina_id);


--
-- TOC entry 2724 (class 1259 OID 20776872)
-- Name: idx_1ed92829253c4123; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829253c4123 ON zapis USING btree (avtor_id);


--
-- TOC entry 2725 (class 1259 OID 20776871)
-- Name: idx_1ed9282957ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282957ed422f ON zapis USING btree (mapa_id);


--
-- TOC entry 2726 (class 1259 OID 20776873)
-- Name: idx_1ed9282987ff3295; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed9282987ff3295 ON zapis USING btree (zaklenil_id);


--
-- TOC entry 2727 (class 1259 OID 20776870)
-- Name: idx_1ed92829a54dbb1f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829a54dbb1f ON zapis USING btree (datoteka_id);


--
-- TOC entry 2728 (class 1259 OID 20776869)
-- Name: idx_1ed92829ef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_1ed92829ef943358 ON zapis USING btree (vrsta_id);


--
-- TOC entry 2604 (class 1259 OID 20776426)
-- Name: idx_20d95c7fa81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fa81ccef6 ON prodajapredstave USING btree (dogodek_id);


--
-- TOC entry 2605 (class 1259 OID 20776425)
-- Name: idx_20d95c7fb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_20d95c7fb31ae31 ON prodajapredstave USING btree (sedezni_red_id);


--
-- TOC entry 2556 (class 1259 OID 20776322)
-- Name: idx_2390fc9662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2390fc9662b4ffca ON vaja USING btree (uprizoritev_id);


--
-- TOC entry 2634 (class 1259 OID 20776500)
-- Name: idx_23aeb95862b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb95862b4ffca ON funkcija USING btree (uprizoritev_id);


--
-- TOC entry 2635 (class 1259 OID 20776502)
-- Name: idx_23aeb9586b361365; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb9586b361365 ON funkcija USING btree (tipfunkcije_id);


--
-- TOC entry 2636 (class 1259 OID 20776501)
-- Name: idx_23aeb958740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_23aeb958740eb038 ON funkcija USING btree (alternacija_id);


--
-- TOC entry 2536 (class 1259 OID 20776265)
-- Name: idx_2942b10710389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b10710389148 ON kontaktnaoseba USING btree (oseba_id);


--
-- TOC entry 2537 (class 1259 OID 20776264)
-- Name: idx_2942b1076beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2942b1076beede51 ON kontaktnaoseba USING btree (popa_id);


--
-- TOC entry 2715 (class 1259 OID 20776826)
-- Name: idx_2d901816d6bc69d6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2d901816d6bc69d6 ON programskaenotasklopa USING btree (programrazno_id);


--
-- TOC entry 2667 (class 1259 OID 20776618)
-- Name: idx_2decfc5910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc5910389148 ON pogodba USING btree (oseba_id);


--
-- TOC entry 2668 (class 1259 OID 20776619)
-- Name: idx_2decfc596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc596beede51 ON pogodba USING btree (popa_id);


--
-- TOC entry 2669 (class 1259 OID 20776620)
-- Name: idx_2decfc59fa5529ee; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2decfc59fa5529ee ON pogodba USING btree (trr_id);


--
-- TOC entry 2734 (class 1259 OID 20776893)
-- Name: idx_2eaff9dcaf91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_2eaff9dcaf91ecd ON zapislastnik USING btree (zapis_id);


--
-- TOC entry 2676 (class 1259 OID 20776654)
-- Name: idx_344a77a3b262815; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a3b262815 ON uprizoritev USING btree (zvrst_surs_id);


--
-- TOC entry 2677 (class 1259 OID 20776651)
-- Name: idx_344a77a7c3b0d59; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a7c3b0d59 ON uprizoritev USING btree (maticnioder_id);


--
-- TOC entry 2678 (class 1259 OID 20776655)
-- Name: idx_344a77a853a965c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a853a965c ON uprizoritev USING btree (producent_id);


--
-- TOC entry 2679 (class 1259 OID 20776653)
-- Name: idx_344a77a8e27eb8d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77a8e27eb8d ON uprizoritev USING btree (zvrst_uprizoritve_id);


--
-- TOC entry 2680 (class 1259 OID 20776652)
-- Name: idx_344a77af35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_344a77af35157b1 ON uprizoritev USING btree (besedilo_id);


--
-- TOC entry 2526 (class 1259 OID 20776236)
-- Name: idx_37f6541a10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a10389148 ON trr USING btree (oseba_id);


--
-- TOC entry 2527 (class 1259 OID 20776235)
-- Name: idx_37f6541a6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_37f6541a6beede51 ON trr USING btree (popa_id);


--
-- TOC entry 2502 (class 1259 OID 20776160)
-- Name: idx_466966d769e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_466966d769e8d4 ON oseba USING btree (naslov_id);


--
-- TOC entry 2622 (class 1259 OID 20776467)
-- Name: idx_48f1f62bfe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_48f1f62bfe7b16e1 ON rezervacija USING btree (prodaja_predstave_id);


--
-- TOC entry 2492 (class 1259 OID 20776114)
-- Name: idx_4ff23396d60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396d60322ac ON permission2role USING btree (role_id);


--
-- TOC entry 2493 (class 1259 OID 20776115)
-- Name: idx_4ff23396fed90cca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_4ff23396fed90cca ON permission2role USING btree (permission_id);


--
-- TOC entry 2627 (class 1259 OID 20776487)
-- Name: idx_52ed210b1c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210b1c0dc15a ON sedez USING btree (podrocja_sedenja_id);


--
-- TOC entry 2628 (class 1259 OID 20776486)
-- Name: idx_52ed210bb31ae31; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bb31ae31 ON sedez USING btree (sedezni_red_id);


--
-- TOC entry 2629 (class 1259 OID 20776485)
-- Name: idx_52ed210bef943358; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_52ed210bef943358 ON sedez USING btree (vrsta_id);


--
-- TOC entry 2549 (class 1259 OID 20776300)
-- Name: idx_602f6e4662b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e4662b4ffca ON predstava USING btree (uprizoritev_id);


--
-- TOC entry 2550 (class 1259 OID 20776301)
-- Name: idx_602f6e46ef0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_602f6e46ef0f30b ON predstava USING btree (gostovanje_id);


--
-- TOC entry 2472 (class 1259 OID 20776047)
-- Name: idx_6054e804ff55f926; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_6054e804ff55f926 ON stevilcenjekonfig USING btree (stevilcenje_id);


--
-- TOC entry 2584 (class 1259 OID 20776392)
-- Name: idx_667e35d117619010; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d117619010 ON razpisansedez USING btree (rezervacija_id);


--
-- TOC entry 2585 (class 1259 OID 20776390)
-- Name: idx_667e35d1c146c3f3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1c146c3f3 ON razpisansedez USING btree (sedez_id);


--
-- TOC entry 2586 (class 1259 OID 20776389)
-- Name: idx_667e35d1f5e1d2d3; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1f5e1d2d3 ON razpisansedez USING btree (postavka_racuna_id);


--
-- TOC entry 2587 (class 1259 OID 20776391)
-- Name: idx_667e35d1fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_667e35d1fe7b16e1 ON razpisansedez USING btree (prodaja_predstave_id);


--
-- TOC entry 2483 (class 1259 OID 20776088)
-- Name: idx_704d3abca76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abca76ed395 ON role2user USING btree (user_id);


--
-- TOC entry 2484 (class 1259 OID 20776089)
-- Name: idx_704d3abcd60322ac; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_704d3abcd60322ac ON role2user USING btree (role_id);


--
-- TOC entry 2613 (class 1259 OID 20776448)
-- Name: idx_7069c3c41c0dc15a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7069c3c41c0dc15a ON vrstasedezev USING btree (podrocja_sedenja_id);


--
-- TOC entry 2747 (class 1259 OID 20776927)
-- Name: idx_781826c67e3c61f9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_781826c67e3c61f9 ON datoteka USING btree (owner_id);


--
-- TOC entry 2649 (class 1259 OID 20776539)
-- Name: idx_7ab77b7910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b7910389148 ON avtorbesedila USING btree (oseba_id);


--
-- TOC entry 2650 (class 1259 OID 20776538)
-- Name: idx_7ab77b79f35157b1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7ab77b79f35157b1 ON avtorbesedila USING btree (besedilo_id);


--
-- TOC entry 2748 (class 1259 OID 20776935)
-- Name: idx_7adc957157ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc957157ed422f ON mapaacl USING btree (mapa_id);


--
-- TOC entry 2749 (class 1259 OID 20776936)
-- Name: idx_7adc9571fa6311ef; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_7adc9571fa6311ef ON mapaacl USING btree (perm_id);


--
-- TOC entry 2599 (class 1259 OID 20776413)
-- Name: idx_80b6f3595b3d808c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_80b6f3595b3d808c ON postavkaracuna USING btree (racun_id);


--
-- TOC entry 2643 (class 1259 OID 20776531)
-- Name: idx_8198265413e60bc0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265413e60bc0 ON rekviziterstvo USING btree (rekvizit_id);


--
-- TOC entry 2644 (class 1259 OID 20776532)
-- Name: idx_8198265462b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8198265462b4ffca ON rekviziterstvo USING btree (uprizoritev_id);


--
-- TOC entry 2697 (class 1259 OID 20776740)
-- Name: idx_8787a0e54ae1cd1c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e54ae1cd1c ON enotaprograma USING btree (gostitelj_id);


--
-- TOC entry 2698 (class 1259 OID 20776739)
-- Name: idx_8787a0e55d0da56c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e55d0da56c ON enotaprograma USING btree (drzavagostovanja_id);


--
-- TOC entry 2699 (class 1259 OID 20776736)
-- Name: idx_8787a0e562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e562b4ffca ON enotaprograma USING btree (uprizoritev_id);


--
-- TOC entry 2700 (class 1259 OID 20776737)
-- Name: idx_8787a0e57222d84b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e57222d84b ON enotaprograma USING btree (tipprogramskeenote_id);


--
-- TOC entry 2701 (class 1259 OID 20776738)
-- Name: idx_8787a0e5771ec7bd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_8787a0e5771ec7bd ON enotaprograma USING btree (program_dela_id);


--
-- TOC entry 2515 (class 1259 OID 20776201)
-- Name: idx_89c1f9d210389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d210389148 ON postninaslovi USING btree (oseba_id);


--
-- TOC entry 2516 (class 1259 OID 20776200)
-- Name: idx_89c1f9d2a233cb39; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2a233cb39 ON postninaslovi USING btree (klient_id);


--
-- TOC entry 2517 (class 1259 OID 20776202)
-- Name: idx_89c1f9d2ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_89c1f9d2ee4b985a ON postninaslovi USING btree (drzava_id);


--
-- TOC entry 2616 (class 1259 OID 20776461)
-- Name: idx_952dd21969e8d4; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd21969e8d4 ON prostor USING btree (naslov_id);


--
-- TOC entry 2617 (class 1259 OID 20776460)
-- Name: idx_952dd2196beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_952dd2196beede51 ON prostor USING btree (popa_id);


--
-- TOC entry 2707 (class 1259 OID 20776806)
-- Name: idx_97af082e38c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082e38c06eb ON produkcijadelitev USING btree (enotaprograma_id);


--
-- TOC entry 2708 (class 1259 OID 20776807)
-- Name: idx_97af082ec532925b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_97af082ec532925b ON produkcijadelitev USING btree (koproducent_id);


--
-- TOC entry 2690 (class 1259 OID 20776684)
-- Name: idx_a4b7244f10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f10389148 ON alternacija USING btree (oseba_id);


--
-- TOC entry 2691 (class 1259 OID 20776685)
-- Name: idx_a4b7244f5bc4d310; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f5bc4d310 ON alternacija USING btree (pogodba_id);


--
-- TOC entry 2692 (class 1259 OID 20776682)
-- Name: idx_a4b7244f861baed2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244f861baed2 ON alternacija USING btree (funkcija_id);


--
-- TOC entry 2693 (class 1259 OID 20776683)
-- Name: idx_a4b7244fa4976613; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_a4b7244fa4976613 ON alternacija USING btree (zaposlitev_id);


--
-- TOC entry 2640 (class 1259 OID 20776522)
-- Name: idx_b244904110389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b244904110389148 ON zaposlitev USING btree (oseba_id);


--
-- TOC entry 2590 (class 1259 OID 20776401)
-- Name: idx_b5b84f4533341ab8; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f4533341ab8 ON racun USING btree (placilni_instrument_id);


--
-- TOC entry 2591 (class 1259 OID 20776400)
-- Name: idx_b5b84f45a420584d; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45a420584d ON racun USING btree (nacin_placina_id);


--
-- TOC entry 2592 (class 1259 OID 20776398)
-- Name: idx_b5b84f45bc902d3b; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45bc902d3b ON racun USING btree (kupec_id);


--
-- TOC entry 2593 (class 1259 OID 20776399)
-- Name: idx_b5b84f45fe7b16e1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_b5b84f45fe7b16e1 ON racun USING btree (prodaja_predstave_id);


--
-- TOC entry 2686 (class 1259 OID 20776672)
-- Name: idx_bbff875562b4ffca; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff875562b4ffca ON arhivalija USING btree (uprizoritev_id);


--
-- TOC entry 2687 (class 1259 OID 20776671)
-- Name: idx_bbff8755a81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_bbff8755a81ccef6 ON arhivalija USING btree (dogodek_id);


--
-- TOC entry 2540 (class 1259 OID 20776276)
-- Name: idx_c38372b2be04ea9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c38372b2be04ea9 ON report USING btree (job_id);


--
-- TOC entry 2543 (class 1259 OID 20776290)
-- Name: idx_c395a6181bb9e62c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a6181bb9e62c ON job USING btree (datum);


--
-- TOC entry 2544 (class 1259 OID 20776289)
-- Name: idx_c395a618941027cc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618941027cc ON job USING btree (casizvedbe);


--
-- TOC entry 2545 (class 1259 OID 20776288)
-- Name: idx_c395a618a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618a76ed395 ON job USING btree (user_id);


--
-- TOC entry 2546 (class 1259 OID 20776291)
-- Name: idx_c395a618aecf5af0; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_c395a618aecf5af0 ON job USING btree (izveden);


--
-- TOC entry 2555 (class 1259 OID 20776312)
-- Name: idx_cae790c7ee4b985a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_cae790c7ee4b985a ON gostovanje USING btree (drzava_id);


--
-- TOC entry 2704 (class 1259 OID 20776797)
-- Name: idx_dba42fe79e3adf2c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_dba42fe79e3adf2c ON postavkacdve USING btree (programdela_id);


--
-- TOC entry 2723 (class 1259 OID 20776845)
-- Name: idx_e7d4cf2638c06eb; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e7d4cf2638c06eb ON drugivir USING btree (enotaprograma_id);


--
-- TOC entry 2741 (class 1259 OID 20776911)
-- Name: idx_e9f8ee8257ed422f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee8257ed422f ON mapa_zapis USING btree (mapa_id);


--
-- TOC entry 2742 (class 1259 OID 20776912)
-- Name: idx_e9f8ee82af91ecd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_e9f8ee82af91ecd ON mapa_zapis USING btree (zapis_id);


--
-- TOC entry 2498 (class 1259 OID 20776135)
-- Name: idx_ef01221fa76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa76ed395 ON optionvalue USING btree (user_id);


--
-- TOC entry 2499 (class 1259 OID 20776134)
-- Name: idx_ef01221fa7c41d6f; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef01221fa7c41d6f ON optionvalue USING btree (option_id);


--
-- TOC entry 2507 (class 1259 OID 20776167)
-- Name: idx_ef76e55910389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e55910389148 ON telefonska USING btree (oseba_id);


--
-- TOC entry 2508 (class 1259 OID 20776168)
-- Name: idx_ef76e5596beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_ef76e5596beede51 ON telefonska USING btree (popa_id);


--
-- TOC entry 2571 (class 1259 OID 20776354)
-- Name: idx_f44a386d10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_f44a386d10389148 ON zasedenost USING btree (oseba_id);


--
-- TOC entry 2579 (class 1259 OID 20776382)
-- Name: idx_fef7d84b10389148; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b10389148 ON terminstoritve USING btree (oseba_id);


--
-- TOC entry 2580 (class 1259 OID 20776381)
-- Name: idx_fef7d84b740eb038; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84b740eb038 ON terminstoritve USING btree (alternacija_id);


--
-- TOC entry 2581 (class 1259 OID 20776380)
-- Name: idx_fef7d84ba81ccef6; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_fef7d84ba81ccef6 ON terminstoritve USING btree (dogodek_id);


--
-- TOC entry 2566 (class 1259 OID 20776340)
-- Name: uniq_11e93b5d14a6c237; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d14a6c237 ON dogodek USING btree (zasedenost_id);


--
-- TOC entry 2567 (class 1259 OID 20776341)
-- Name: uniq_11e93b5d18640538; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d18640538 ON dogodek USING btree (vaja_id);


--
-- TOC entry 2568 (class 1259 OID 20776339)
-- Name: uniq_11e93b5d5ac894aa; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5d5ac894aa ON dogodek USING btree (predstava_id);


--
-- TOC entry 2569 (class 1259 OID 20776343)
-- Name: uniq_11e93b5dbbc7a989; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5dbbc7a989 ON dogodek USING btree (dogodek_splosni_id);


--
-- TOC entry 2570 (class 1259 OID 20776342)
-- Name: uniq_11e93b5def0f30b; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_11e93b5def0f30b ON dogodek USING btree (gostovanje_id);


--
-- TOC entry 2514 (class 1259 OID 20776186)
-- Name: uniq_1c7adba5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_1c7adba5559828a3 ON popa USING btree (sifra);


--
-- TOC entry 2532 (class 1259 OID 20776250)
-- Name: uniq_2d10c3c4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4559828a3 ON drza USING btree (sifra);


--
-- TOC entry 2533 (class 1259 OID 20776252)
-- Name: uniq_2d10c3c45841b2e7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c45841b2e7 ON drza USING btree (isonum);


--
-- TOC entry 2534 (class 1259 OID 20776251)
-- Name: uniq_2d10c3c4a73e48e1; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4a73e48e1 ON drza USING btree (sifradolg);


--
-- TOC entry 2535 (class 1259 OID 20776253)
-- Name: uniq_2d10c3c4bec28cef; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d10c3c4bec28cef ON drza USING btree (isonaziv);


--
-- TOC entry 2598 (class 1259 OID 20776407)
-- Name: uniq_2d2009bb6beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2d2009bb6beede51 ON kupec USING btree (popa_id);


--
-- TOC entry 2672 (class 1259 OID 20776617)
-- Name: uniq_2decfc59559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_2decfc59559828a3 ON pogodba USING btree (sifra);


--
-- TOC entry 2681 (class 1259 OID 20776650)
-- Name: uniq_344a77a559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_344a77a559828a3 ON uprizoritev USING btree (sifra);


--
-- TOC entry 2663 (class 1259 OID 20776591)
-- Name: uniq_3f50510d559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d559828a3 ON tipfunkcije USING btree (sifra);


--
-- TOC entry 2664 (class 1259 OID 20776592)
-- Name: uniq_3f50510d55cca980; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_3f50510d55cca980 ON tipfunkcije USING btree (ime);


--
-- TOC entry 2505 (class 1259 OID 20776158)
-- Name: uniq_466966d7559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7559828a3 ON oseba USING btree (sifra);


--
-- TOC entry 2506 (class 1259 OID 20776159)
-- Name: uniq_466966d7a76ed395; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_466966d7a76ed395 ON oseba USING btree (user_id);


--
-- TOC entry 2637 (class 1259 OID 20776512)
-- Name: uniq_5216fcb0559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5216fcb0559828a3 ON zvrstuprizoritve USING btree (sifra);


--
-- TOC entry 2478 (class 1259 OID 20776058)
-- Name: uniq_5a434fbc559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5a434fbc559828a3 ON stevilcenje USING btree (sifra);


--
-- TOC entry 2525 (class 1259 OID 20776222)
-- Name: uniq_5d2a05865e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_5d2a05865e237e06 ON option USING btree (name);


--
-- TOC entry 2475 (class 1259 OID 20776046)
-- Name: uniq_6054e804889a7556; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_6054e804889a7556 ON stevilcenjekonfig USING btree (dok);


--
-- TOC entry 2720 (class 1259 OID 20776838)
-- Name: uniq_7d834df4559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_7d834df4559828a3 ON tipprogramskeenote USING btree (sifra);


--
-- TOC entry 2620 (class 1259 OID 20776459)
-- Name: uniq_952dd21937854736; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd21937854736 ON prostor USING btree (naziv);


--
-- TOC entry 2621 (class 1259 OID 20776458)
-- Name: uniq_952dd219559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_952dd219559828a3 ON prostor USING btree (sifra);


--
-- TOC entry 2694 (class 1259 OID 20776681)
-- Name: uniq_a4b7244f559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_a4b7244f559828a3 ON alternacija USING btree (sifra);


--
-- TOC entry 2522 (class 1259 OID 20776210)
-- Name: uniq_ba25e4b6559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ba25e4b6559828a3 ON posta USING btree (sifra);


--
-- TOC entry 2673 (class 1259 OID 20776630)
-- Name: uniq_cede8e36559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_cede8e36559828a3 ON zvrstsurs USING btree (sifra);


--
-- TOC entry 2731 (class 1259 OID 20776885)
-- Name: uniq_de1c8aa1d55226c7; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_de1c8aa1d55226c7 ON vrstazapisa USING btree (oznaka);


--
-- TOC entry 2713 (class 1259 OID 20776814)
-- Name: uniq_e6fc2028559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc2028559828a3 ON produkcijskahisa USING btree (sifra);


--
-- TOC entry 2714 (class 1259 OID 20776815)
-- Name: uniq_e6fc20286beede51; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_e6fc20286beede51 ON produkcijskahisa USING btree (popa_id);


--
-- TOC entry 2660 (class 1259 OID 20776580)
-- Name: uniq_ec773670ca2e5fcb; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ec773670ca2e5fcb ON besedilo USING btree (stevilka);


--
-- TOC entry 2578 (class 1259 OID 20776369)
-- Name: uniq_ecc8f8c5559828a3; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_ecc8f8c5559828a3 ON sezona USING btree (sifra);


--
-- TOC entry 2491 (class 1259 OID 20776108)
-- Name: uniq_f75b25545e237e06; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX uniq_f75b25545e237e06 ON role USING btree (name);


--
-- TOC entry 2782 (class 2606 OID 20777067)
-- Name: fk_11e93b5d14a6c237; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d14a6c237 FOREIGN KEY (zasedenost_id) REFERENCES zasedenost(id);


--
-- TOC entry 2781 (class 2606 OID 20777072)
-- Name: fk_11e93b5d18640538; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d18640538 FOREIGN KEY (vaja_id) REFERENCES vaja(id);


--
-- TOC entry 2777 (class 2606 OID 20777092)
-- Name: fk_11e93b5d3a0e32e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d3a0e32e3 FOREIGN KEY (sezona_id) REFERENCES sezona(id);


--
-- TOC entry 2783 (class 2606 OID 20777062)
-- Name: fk_11e93b5d5ac894aa; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5d5ac894aa FOREIGN KEY (predstava_id) REFERENCES predstava(id);


--
-- TOC entry 2779 (class 2606 OID 20777082)
-- Name: fk_11e93b5dbbc7a989; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dbbc7a989 FOREIGN KEY (dogodek_splosni_id) REFERENCES dogodeksplosni(id);


--
-- TOC entry 2778 (class 2606 OID 20777087)
-- Name: fk_11e93b5dcc3aa562; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5dcc3aa562 FOREIGN KEY (prostor_id) REFERENCES prostor(id);


--
-- TOC entry 2780 (class 2606 OID 20777077)
-- Name: fk_11e93b5def0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY dogodek
    ADD CONSTRAINT fk_11e93b5def0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2818 (class 2606 OID 20777257)
-- Name: fk_11ffe6e05c75296c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e05c75296c FOREIGN KEY (vrstastroska_id) REFERENCES vrstastroska(id);


--
-- TOC entry 2817 (class 2606 OID 20777262)
-- Name: fk_11ffe6e062b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e062b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2816 (class 2606 OID 20777267)
-- Name: fk_11ffe6e06beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY strosekuprizoritve
    ADD CONSTRAINT fk_11ffe6e06beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2850 (class 2606 OID 20777432)
-- Name: fk_14a5d6d3727aca70; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d3727aca70 FOREIGN KEY (parent_id) REFERENCES mapa(id);


--
-- TOC entry 2851 (class 2606 OID 20777427)
-- Name: fk_14a5d6d38a4a6c12; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa
    ADD CONSTRAINT fk_14a5d6d38a4a6c12 FOREIGN KEY (lastnik_id) REFERENCES uporabniki(id);


--
-- TOC entry 2763 (class 2606 OID 20776992)
-- Name: fk_1c7adba5ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY popa
    ADD CONSTRAINT fk_1c7adba5ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2800 (class 2606 OID 20777177)
-- Name: fk_1df2e9faa420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY placilniinstrument
    ADD CONSTRAINT fk_1df2e9faa420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2845 (class 2606 OID 20777412)
-- Name: fk_1ed92829253c4123; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829253c4123 FOREIGN KEY (avtor_id) REFERENCES uporabniki(id);


--
-- TOC entry 2846 (class 2606 OID 20777407)
-- Name: fk_1ed9282957ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282957ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2844 (class 2606 OID 20777417)
-- Name: fk_1ed9282987ff3295; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed9282987ff3295 FOREIGN KEY (zaklenil_id) REFERENCES uporabniki(id);


--
-- TOC entry 2847 (class 2606 OID 20777402)
-- Name: fk_1ed92829a54dbb1f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829a54dbb1f FOREIGN KEY (datoteka_id) REFERENCES datoteka(id);


--
-- TOC entry 2848 (class 2606 OID 20777397)
-- Name: fk_1ed92829ef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapis
    ADD CONSTRAINT fk_1ed92829ef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstazapisa(id);


--
-- TOC entry 2798 (class 2606 OID 20777172)
-- Name: fk_20d95c7fa81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fa81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2799 (class 2606 OID 20777167)
-- Name: fk_20d95c7fb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prodajapredstave
    ADD CONSTRAINT fk_20d95c7fb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2776 (class 2606 OID 20777057)
-- Name: fk_2390fc9662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vaja
    ADD CONSTRAINT fk_2390fc9662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2810 (class 2606 OID 20777217)
-- Name: fk_23aeb95862b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb95862b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2808 (class 2606 OID 20777227)
-- Name: fk_23aeb9586b361365; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb9586b361365 FOREIGN KEY (tipfunkcije_id) REFERENCES tipfunkcije(id);


--
-- TOC entry 2809 (class 2606 OID 20777222)
-- Name: fk_23aeb958740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY funkcija
    ADD CONSTRAINT fk_23aeb958740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2769 (class 2606 OID 20777027)
-- Name: fk_2942b10710389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b10710389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2770 (class 2606 OID 20777022)
-- Name: fk_2942b1076beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kontaktnaoseba
    ADD CONSTRAINT fk_2942b1076beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2796 (class 2606 OID 20777157)
-- Name: fk_2d2009bb6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY kupec
    ADD CONSTRAINT fk_2d2009bb6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2842 (class 2606 OID 20777387)
-- Name: fk_2d901816d6bc69d6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY programskaenotasklopa
    ADD CONSTRAINT fk_2d901816d6bc69d6 FOREIGN KEY (programrazno_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2821 (class 2606 OID 20777272)
-- Name: fk_2decfc5910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc5910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2820 (class 2606 OID 20777277)
-- Name: fk_2decfc596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2819 (class 2606 OID 20777282)
-- Name: fk_2decfc59fa5529ee; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pogodba
    ADD CONSTRAINT fk_2decfc59fa5529ee FOREIGN KEY (trr_id) REFERENCES trr(id);


--
-- TOC entry 2849 (class 2606 OID 20777422)
-- Name: fk_2eaff9dcaf91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zapislastnik
    ADD CONSTRAINT fk_2eaff9dcaf91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id);


--
-- TOC entry 2823 (class 2606 OID 20777302)
-- Name: fk_344a77a3b262815; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a3b262815 FOREIGN KEY (zvrst_surs_id) REFERENCES zvrstsurs(id);


--
-- TOC entry 2826 (class 2606 OID 20777287)
-- Name: fk_344a77a7c3b0d59; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a7c3b0d59 FOREIGN KEY (maticnioder_id) REFERENCES prostor(id);


--
-- TOC entry 2822 (class 2606 OID 20777307)
-- Name: fk_344a77a853a965c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a853a965c FOREIGN KEY (producent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2824 (class 2606 OID 20777297)
-- Name: fk_344a77a8e27eb8d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77a8e27eb8d FOREIGN KEY (zvrst_uprizoritve_id) REFERENCES zvrstuprizoritve(id);


--
-- TOC entry 2825 (class 2606 OID 20777292)
-- Name: fk_344a77af35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY uprizoritev
    ADD CONSTRAINT fk_344a77af35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2767 (class 2606 OID 20777017)
-- Name: fk_37f6541a10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2768 (class 2606 OID 20777012)
-- Name: fk_37f6541a6beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY trr
    ADD CONSTRAINT fk_37f6541a6beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2759 (class 2606 OID 20776977)
-- Name: fk_466966d769e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d769e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2760 (class 2606 OID 20776972)
-- Name: fk_466966d7a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY oseba
    ADD CONSTRAINT fk_466966d7a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2804 (class 2606 OID 20777197)
-- Name: fk_48f1f62bfe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rezervacija
    ADD CONSTRAINT fk_48f1f62bfe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2756 (class 2606 OID 20776952)
-- Name: fk_4ff23396d60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396d60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2755 (class 2606 OID 20776957)
-- Name: fk_4ff23396fed90cca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY permission2role
    ADD CONSTRAINT fk_4ff23396fed90cca FOREIGN KEY (permission_id) REFERENCES permission(id);


--
-- TOC entry 2805 (class 2606 OID 20777212)
-- Name: fk_52ed210b1c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210b1c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2806 (class 2606 OID 20777207)
-- Name: fk_52ed210bb31ae31; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bb31ae31 FOREIGN KEY (sedezni_red_id) REFERENCES sedeznired(id);


--
-- TOC entry 2807 (class 2606 OID 20777202)
-- Name: fk_52ed210bef943358; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sedez
    ADD CONSTRAINT fk_52ed210bef943358 FOREIGN KEY (vrsta_id) REFERENCES vrstasedezev(id);


--
-- TOC entry 2774 (class 2606 OID 20777042)
-- Name: fk_602f6e4662b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e4662b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2773 (class 2606 OID 20777047)
-- Name: fk_602f6e46ef0f30b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY predstava
    ADD CONSTRAINT fk_602f6e46ef0f30b FOREIGN KEY (gostovanje_id) REFERENCES gostovanje(id);


--
-- TOC entry 2752 (class 2606 OID 20776937)
-- Name: fk_6054e804ff55f926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stevilcenjekonfig
    ADD CONSTRAINT fk_6054e804ff55f926 FOREIGN KEY (stevilcenje_id) REFERENCES stevilcenje(id);


--
-- TOC entry 2788 (class 2606 OID 20777132)
-- Name: fk_667e35d117619010; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d117619010 FOREIGN KEY (rezervacija_id) REFERENCES rezervacija(id);


--
-- TOC entry 2790 (class 2606 OID 20777122)
-- Name: fk_667e35d1c146c3f3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1c146c3f3 FOREIGN KEY (sedez_id) REFERENCES sedez(id);


--
-- TOC entry 2791 (class 2606 OID 20777117)
-- Name: fk_667e35d1f5e1d2d3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1f5e1d2d3 FOREIGN KEY (postavka_racuna_id) REFERENCES postavkaracuna(id);


--
-- TOC entry 2789 (class 2606 OID 20777127)
-- Name: fk_667e35d1fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY razpisansedez
    ADD CONSTRAINT fk_667e35d1fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2754 (class 2606 OID 20776942)
-- Name: fk_704d3abca76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abca76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2753 (class 2606 OID 20776947)
-- Name: fk_704d3abcd60322ac; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role2user
    ADD CONSTRAINT fk_704d3abcd60322ac FOREIGN KEY (role_id) REFERENCES role(id);


--
-- TOC entry 2801 (class 2606 OID 20777182)
-- Name: fk_7069c3c41c0dc15a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vrstasedezev
    ADD CONSTRAINT fk_7069c3c41c0dc15a FOREIGN KEY (podrocja_sedenja_id) REFERENCES podrocjesedenja(id);


--
-- TOC entry 2854 (class 2606 OID 20777447)
-- Name: fk_781826c67e3c61f9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY datoteka
    ADD CONSTRAINT fk_781826c67e3c61f9 FOREIGN KEY (owner_id) REFERENCES uporabniki(id);


--
-- TOC entry 2814 (class 2606 OID 20777252)
-- Name: fk_7ab77b7910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b7910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2815 (class 2606 OID 20777247)
-- Name: fk_7ab77b79f35157b1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY avtorbesedila
    ADD CONSTRAINT fk_7ab77b79f35157b1 FOREIGN KEY (besedilo_id) REFERENCES besedilo(id);


--
-- TOC entry 2856 (class 2606 OID 20777452)
-- Name: fk_7adc957157ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc957157ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id);


--
-- TOC entry 2855 (class 2606 OID 20777457)
-- Name: fk_7adc9571fa6311ef; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapaacl
    ADD CONSTRAINT fk_7adc9571fa6311ef FOREIGN KEY (perm_id) REFERENCES permission(id);


--
-- TOC entry 2797 (class 2606 OID 20777162)
-- Name: fk_80b6f3595b3d808c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkaracuna
    ADD CONSTRAINT fk_80b6f3595b3d808c FOREIGN KEY (racun_id) REFERENCES racun(id);


--
-- TOC entry 2813 (class 2606 OID 20777237)
-- Name: fk_8198265413e60bc0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265413e60bc0 FOREIGN KEY (rekvizit_id) REFERENCES rekvizit(id);


--
-- TOC entry 2812 (class 2606 OID 20777242)
-- Name: fk_8198265462b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY rekviziterstvo
    ADD CONSTRAINT fk_8198265462b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2833 (class 2606 OID 20777362)
-- Name: fk_8787a0e54ae1cd1c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e54ae1cd1c FOREIGN KEY (gostitelj_id) REFERENCES popa(id);


--
-- TOC entry 2834 (class 2606 OID 20777357)
-- Name: fk_8787a0e55d0da56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e55d0da56c FOREIGN KEY (drzavagostovanja_id) REFERENCES drza(id);


--
-- TOC entry 2837 (class 2606 OID 20777342)
-- Name: fk_8787a0e562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2836 (class 2606 OID 20777347)
-- Name: fk_8787a0e57222d84b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e57222d84b FOREIGN KEY (tipprogramskeenote_id) REFERENCES tipprogramskeenote(id);


--
-- TOC entry 2835 (class 2606 OID 20777352)
-- Name: fk_8787a0e5771ec7bd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY enotaprograma
    ADD CONSTRAINT fk_8787a0e5771ec7bd FOREIGN KEY (program_dela_id) REFERENCES programdela(id);


--
-- TOC entry 2765 (class 2606 OID 20777002)
-- Name: fk_89c1f9d210389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d210389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2766 (class 2606 OID 20776997)
-- Name: fk_89c1f9d2a233cb39; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2a233cb39 FOREIGN KEY (klient_id) REFERENCES popa(id);


--
-- TOC entry 2764 (class 2606 OID 20777007)
-- Name: fk_89c1f9d2ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postninaslovi
    ADD CONSTRAINT fk_89c1f9d2ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2802 (class 2606 OID 20777192)
-- Name: fk_952dd21969e8d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd21969e8d4 FOREIGN KEY (naslov_id) REFERENCES postninaslovi(id);


--
-- TOC entry 2803 (class 2606 OID 20777187)
-- Name: fk_952dd2196beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY prostor
    ADD CONSTRAINT fk_952dd2196beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2840 (class 2606 OID 20777372)
-- Name: fk_97af082e38c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082e38c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2839 (class 2606 OID 20777377)
-- Name: fk_97af082ec532925b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijadelitev
    ADD CONSTRAINT fk_97af082ec532925b FOREIGN KEY (koproducent_id) REFERENCES produkcijskahisa(id);


--
-- TOC entry 2830 (class 2606 OID 20777332)
-- Name: fk_a4b7244f10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2829 (class 2606 OID 20777337)
-- Name: fk_a4b7244f5bc4d310; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f5bc4d310 FOREIGN KEY (pogodba_id) REFERENCES pogodba(id);


--
-- TOC entry 2832 (class 2606 OID 20777322)
-- Name: fk_a4b7244f861baed2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244f861baed2 FOREIGN KEY (funkcija_id) REFERENCES funkcija(id);


--
-- TOC entry 2831 (class 2606 OID 20777327)
-- Name: fk_a4b7244fa4976613; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY alternacija
    ADD CONSTRAINT fk_a4b7244fa4976613 FOREIGN KEY (zaposlitev_id) REFERENCES zaposlitev(id);


--
-- TOC entry 2811 (class 2606 OID 20777232)
-- Name: fk_b244904110389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zaposlitev
    ADD CONSTRAINT fk_b244904110389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2792 (class 2606 OID 20777152)
-- Name: fk_b5b84f4533341ab8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f4533341ab8 FOREIGN KEY (placilni_instrument_id) REFERENCES placilniinstrument(id);


--
-- TOC entry 2793 (class 2606 OID 20777147)
-- Name: fk_b5b84f45a420584d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45a420584d FOREIGN KEY (nacin_placina_id) REFERENCES nacinplacina(id);


--
-- TOC entry 2795 (class 2606 OID 20777137)
-- Name: fk_b5b84f45bc902d3b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45bc902d3b FOREIGN KEY (kupec_id) REFERENCES kupec(id);


--
-- TOC entry 2794 (class 2606 OID 20777142)
-- Name: fk_b5b84f45fe7b16e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY racun
    ADD CONSTRAINT fk_b5b84f45fe7b16e1 FOREIGN KEY (prodaja_predstave_id) REFERENCES prodajapredstave(id);


--
-- TOC entry 2827 (class 2606 OID 20777317)
-- Name: fk_bbff875562b4ffca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff875562b4ffca FOREIGN KEY (uprizoritev_id) REFERENCES uprizoritev(id);


--
-- TOC entry 2828 (class 2606 OID 20777312)
-- Name: fk_bbff8755a81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY arhivalija
    ADD CONSTRAINT fk_bbff8755a81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


--
-- TOC entry 2771 (class 2606 OID 20777032)
-- Name: fk_c38372b2be04ea9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY report
    ADD CONSTRAINT fk_c38372b2be04ea9 FOREIGN KEY (job_id) REFERENCES job(id);


--
-- TOC entry 2772 (class 2606 OID 20777037)
-- Name: fk_c395a618a76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY job
    ADD CONSTRAINT fk_c395a618a76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2775 (class 2606 OID 20777052)
-- Name: fk_cae790c7ee4b985a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY gostovanje
    ADD CONSTRAINT fk_cae790c7ee4b985a FOREIGN KEY (drzava_id) REFERENCES drza(id);


--
-- TOC entry 2838 (class 2606 OID 20777367)
-- Name: fk_dba42fe79e3adf2c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY postavkacdve
    ADD CONSTRAINT fk_dba42fe79e3adf2c FOREIGN KEY (programdela_id) REFERENCES programdela(id);


--
-- TOC entry 2841 (class 2606 OID 20777382)
-- Name: fk_e6fc20286beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY produkcijskahisa
    ADD CONSTRAINT fk_e6fc20286beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2843 (class 2606 OID 20777392)
-- Name: fk_e7d4cf2638c06eb; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY drugivir
    ADD CONSTRAINT fk_e7d4cf2638c06eb FOREIGN KEY (enotaprograma_id) REFERENCES enotaprograma(id);


--
-- TOC entry 2853 (class 2606 OID 20777437)
-- Name: fk_e9f8ee8257ed422f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee8257ed422f FOREIGN KEY (mapa_id) REFERENCES mapa(id) ON DELETE CASCADE;


--
-- TOC entry 2852 (class 2606 OID 20777442)
-- Name: fk_e9f8ee82af91ecd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY mapa_zapis
    ADD CONSTRAINT fk_e9f8ee82af91ecd FOREIGN KEY (zapis_id) REFERENCES zapis(id) ON DELETE CASCADE;


--
-- TOC entry 2757 (class 2606 OID 20776967)
-- Name: fk_ef01221fa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa76ed395 FOREIGN KEY (user_id) REFERENCES uporabniki(id);


--
-- TOC entry 2758 (class 2606 OID 20776962)
-- Name: fk_ef01221fa7c41d6f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY optionvalue
    ADD CONSTRAINT fk_ef01221fa7c41d6f FOREIGN KEY (option_id) REFERENCES option(id);


--
-- TOC entry 2762 (class 2606 OID 20776982)
-- Name: fk_ef76e55910389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e55910389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2761 (class 2606 OID 20776987)
-- Name: fk_ef76e5596beede51; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY telefonska
    ADD CONSTRAINT fk_ef76e5596beede51 FOREIGN KEY (popa_id) REFERENCES popa(id);


--
-- TOC entry 2784 (class 2606 OID 20777097)
-- Name: fk_f44a386d10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY zasedenost
    ADD CONSTRAINT fk_f44a386d10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2785 (class 2606 OID 20777112)
-- Name: fk_fef7d84b10389148; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b10389148 FOREIGN KEY (oseba_id) REFERENCES oseba(id);


--
-- TOC entry 2786 (class 2606 OID 20777107)
-- Name: fk_fef7d84b740eb038; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84b740eb038 FOREIGN KEY (alternacija_id) REFERENCES alternacija(id);


--
-- TOC entry 2787 (class 2606 OID 20777102)
-- Name: fk_fef7d84ba81ccef6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY terminstoritve
    ADD CONSTRAINT fk_fef7d84ba81ccef6 FOREIGN KEY (dogodek_id) REFERENCES dogodek(id);


-- Completed on 2015-09-25 16:09:04 CEST

--
-- PostgreSQL database dump complete
--

